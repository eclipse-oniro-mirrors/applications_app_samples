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
import { sizeValueOf } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for sizeValueOf (96 cases). */
export default function sizeValueOfTest(): void {
  describe('SizeValueOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0001
     * @tc.name      FilePreviewDLP_SizeValueOf_0001
     * @tc.desc      sizeValueOf(fraction=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_SizeValueOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SizeValueOf_0001 begin`);
      const actual: number = sizeValueOf(0);
      logInfo(`sizeValueOf(fraction=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SizeValueOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0002
     * @tc.name      FilePreviewDLP_SizeValueOf_0002
     * @tc.desc      sizeValueOf(fraction=0.25) returns 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_SizeValueOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SizeValueOf_0002 begin`);
      const actual: number = sizeValueOf(0.25);
      logInfo(`sizeValueOf(fraction=0.25): actual=${actual}`);
      expect(actual).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0003
     * @tc.name      FilePreviewDLP_SizeValueOf_0003
     * @tc.desc      sizeValueOf(fraction=10) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_SizeValueOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SizeValueOf_0003 begin`);
      const actual: number = sizeValueOf(10);
      logInfo(`sizeValueOf(fraction=10): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}SizeValueOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0004
     * @tc.name      FilePreviewDLP_SizeValueOf_0004
     * @tc.desc      sizeValueOf(fraction=9) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_SizeValueOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SizeValueOf_0004 begin`);
      const actual: number = sizeValueOf(9);
      logInfo(`sizeValueOf(fraction=9): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}SizeValueOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0005
     * @tc.name      FilePreviewDLP_SizeValueOf_0005
     * @tc.desc      sizeValueOf(fraction=11) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_SizeValueOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SizeValueOf_0005 begin`);
      const actual: number = sizeValueOf(11);
      logInfo(`sizeValueOf(fraction=11): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}SizeValueOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0006
     * @tc.name      FilePreviewDLP_SizeValueOf_0006
     * @tc.desc      sizeValueOf(fraction=20) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0006 begin`);
      const actual: number = sizeValueOf(20);
      logInfo(`sizeValueOf(fraction=20): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}SizeValueOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0007
     * @tc.name      FilePreviewDLP_SizeValueOf_0007
     * @tc.desc      sizeValueOf(fraction=5) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0007 begin`);
      const actual: number = sizeValueOf(5);
      logInfo(`sizeValueOf(fraction=5): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}SizeValueOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0008
     * @tc.name      FilePreviewDLP_SizeValueOf_0008
     * @tc.desc      sizeValueOf(fraction=1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_SizeValueOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SizeValueOf_0008 begin`);
      const actual: number = sizeValueOf(1);
      logInfo(`sizeValueOf(fraction=1): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}SizeValueOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0009
     * @tc.name      FilePreviewDLP_SizeValueOf_0009
     * @tc.desc      sizeValueOf(fraction=2) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_SizeValueOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SizeValueOf_0009 begin`);
      const actual: number = sizeValueOf(2);
      logInfo(`sizeValueOf(fraction=2): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}SizeValueOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0010
     * @tc.name      FilePreviewDLP_SizeValueOf_0010
     * @tc.desc      sizeValueOf(fraction=0.5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0010 begin`);
      const actual: number = sizeValueOf(0.5);
      logInfo(`sizeValueOf(fraction=0.5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}SizeValueOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0011
     * @tc.name      FilePreviewDLP_SizeValueOf_0011
     * @tc.desc      sizeValueOf(fraction=1.5) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0011 begin`);
      const actual: number = sizeValueOf(1.5);
      logInfo(`sizeValueOf(fraction=1.5): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}SizeValueOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0012
     * @tc.name      FilePreviewDLP_SizeValueOf_0012
     * @tc.desc      sizeValueOf(fraction=-1) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0012 begin`);
      const actual: number = sizeValueOf(-1);
      logInfo(`sizeValueOf(fraction=-1): actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}SizeValueOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0013
     * @tc.name      FilePreviewDLP_SizeValueOf_0013
     * @tc.desc      sizeValueOf(fraction=3) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0013 begin`);
      const actual: number = sizeValueOf(3);
      logInfo(`sizeValueOf(fraction=3): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}SizeValueOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0014
     * @tc.name      FilePreviewDLP_SizeValueOf_0014
     * @tc.desc      sizeValueOf(fraction=100) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0014 begin`);
      const actual: number = sizeValueOf(100);
      logInfo(`sizeValueOf(fraction=100): actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}SizeValueOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0015
     * @tc.name      FilePreviewDLP_SizeValueOf_0015
     * @tc.desc      sizeValueOf(fraction=15) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0015 begin`);
      const actual: number = sizeValueOf(15);
      logInfo(`sizeValueOf(fraction=15): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}SizeValueOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0016
     * @tc.name      FilePreviewDLP_SizeValueOf_0016
     * @tc.desc      sizeValueOf(fraction=25) returns 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0016 begin`);
      const actual: number = sizeValueOf(25);
      logInfo(`sizeValueOf(fraction=25): actual=${actual}`);
      expect(actual).assertEqual(250);
      logInfo(`${BUNDLE}SizeValueOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0017
     * @tc.name      FilePreviewDLP_SizeValueOf_0017
     * @tc.desc      sizeValueOf(fraction=30) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0017 begin`);
      const actual: number = sizeValueOf(30);
      logInfo(`sizeValueOf(fraction=30): actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}SizeValueOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0018
     * @tc.name      FilePreviewDLP_SizeValueOf_0018
     * @tc.desc      sizeValueOf(fraction=35) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0018 begin`);
      const actual: number = sizeValueOf(35);
      logInfo(`sizeValueOf(fraction=35): actual=${actual}`);
      expect(actual).assertEqual(350);
      logInfo(`${BUNDLE}SizeValueOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0019
     * @tc.name      FilePreviewDLP_SizeValueOf_0019
     * @tc.desc      sizeValueOf(fraction=40) returns 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0019 begin`);
      const actual: number = sizeValueOf(40);
      logInfo(`sizeValueOf(fraction=40): actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}SizeValueOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0020
     * @tc.name      FilePreviewDLP_SizeValueOf_0020
     * @tc.desc      sizeValueOf(fraction=45) returns 450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0020 begin`);
      const actual: number = sizeValueOf(45);
      logInfo(`sizeValueOf(fraction=45): actual=${actual}`);
      expect(actual).assertEqual(450);
      logInfo(`${BUNDLE}SizeValueOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0021
     * @tc.name      FilePreviewDLP_SizeValueOf_0021
     * @tc.desc      sizeValueOf(fraction=50) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0021 begin`);
      const actual: number = sizeValueOf(50);
      logInfo(`sizeValueOf(fraction=50): actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}SizeValueOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0022
     * @tc.name      FilePreviewDLP_SizeValueOf_0022
     * @tc.desc      sizeValueOf(fraction=55) returns 550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0022 begin`);
      const actual: number = sizeValueOf(55);
      logInfo(`sizeValueOf(fraction=55): actual=${actual}`);
      expect(actual).assertEqual(550);
      logInfo(`${BUNDLE}SizeValueOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0023
     * @tc.name      FilePreviewDLP_SizeValueOf_0023
     * @tc.desc      sizeValueOf(fraction=60) returns 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0023 begin`);
      const actual: number = sizeValueOf(60);
      logInfo(`sizeValueOf(fraction=60): actual=${actual}`);
      expect(actual).assertEqual(600);
      logInfo(`${BUNDLE}SizeValueOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0024
     * @tc.name      FilePreviewDLP_SizeValueOf_0024
     * @tc.desc      sizeValueOf(fraction=65) returns 650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0024 begin`);
      const actual: number = sizeValueOf(65);
      logInfo(`sizeValueOf(fraction=65): actual=${actual}`);
      expect(actual).assertEqual(650);
      logInfo(`${BUNDLE}SizeValueOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0025
     * @tc.name      FilePreviewDLP_SizeValueOf_0025
     * @tc.desc      sizeValueOf(fraction=70) returns 700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0025 begin`);
      const actual: number = sizeValueOf(70);
      logInfo(`sizeValueOf(fraction=70): actual=${actual}`);
      expect(actual).assertEqual(700);
      logInfo(`${BUNDLE}SizeValueOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0026
     * @tc.name      FilePreviewDLP_SizeValueOf_0026
     * @tc.desc      sizeValueOf(fraction=75) returns 750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0026 begin`);
      const actual: number = sizeValueOf(75);
      logInfo(`sizeValueOf(fraction=75): actual=${actual}`);
      expect(actual).assertEqual(750);
      logInfo(`${BUNDLE}SizeValueOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0027
     * @tc.name      FilePreviewDLP_SizeValueOf_0027
     * @tc.desc      sizeValueOf(fraction=80) returns 800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0027 begin`);
      const actual: number = sizeValueOf(80);
      logInfo(`sizeValueOf(fraction=80): actual=${actual}`);
      expect(actual).assertEqual(800);
      logInfo(`${BUNDLE}SizeValueOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0028
     * @tc.name      FilePreviewDLP_SizeValueOf_0028
     * @tc.desc      sizeValueOf(fraction=85) returns 850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0028 begin`);
      const actual: number = sizeValueOf(85);
      logInfo(`sizeValueOf(fraction=85): actual=${actual}`);
      expect(actual).assertEqual(850);
      logInfo(`${BUNDLE}SizeValueOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0029
     * @tc.name      FilePreviewDLP_SizeValueOf_0029
     * @tc.desc      sizeValueOf(fraction=90) returns 900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0029 begin`);
      const actual: number = sizeValueOf(90);
      logInfo(`sizeValueOf(fraction=90): actual=${actual}`);
      expect(actual).assertEqual(900);
      logInfo(`${BUNDLE}SizeValueOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0030
     * @tc.name      FilePreviewDLP_SizeValueOf_0030
     * @tc.desc      sizeValueOf(fraction=95) returns 950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0030 begin`);
      const actual: number = sizeValueOf(95);
      logInfo(`sizeValueOf(fraction=95): actual=${actual}`);
      expect(actual).assertEqual(950);
      logInfo(`${BUNDLE}SizeValueOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0031
     * @tc.name      FilePreviewDLP_SizeValueOf_0031
     * @tc.desc      sizeValueOf(fraction=105) returns 1050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0031 begin`);
      const actual: number = sizeValueOf(105);
      logInfo(`sizeValueOf(fraction=105): actual=${actual}`);
      expect(actual).assertEqual(1050);
      logInfo(`${BUNDLE}SizeValueOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0032
     * @tc.name      FilePreviewDLP_SizeValueOf_0032
     * @tc.desc      sizeValueOf(fraction=110) returns 1100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0032 begin`);
      const actual: number = sizeValueOf(110);
      logInfo(`sizeValueOf(fraction=110): actual=${actual}`);
      expect(actual).assertEqual(1100);
      logInfo(`${BUNDLE}SizeValueOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0033
     * @tc.name      FilePreviewDLP_SizeValueOf_0033
     * @tc.desc      sizeValueOf(fraction=115) returns 1150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0033 begin`);
      const actual: number = sizeValueOf(115);
      logInfo(`sizeValueOf(fraction=115): actual=${actual}`);
      expect(actual).assertEqual(1150);
      logInfo(`${BUNDLE}SizeValueOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0034
     * @tc.name      FilePreviewDLP_SizeValueOf_0034
     * @tc.desc      sizeValueOf(fraction=120) returns 1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0034 begin`);
      const actual: number = sizeValueOf(120);
      logInfo(`sizeValueOf(fraction=120): actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}SizeValueOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0035
     * @tc.name      FilePreviewDLP_SizeValueOf_0035
     * @tc.desc      sizeValueOf(fraction=125) returns 1250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0035 begin`);
      const actual: number = sizeValueOf(125);
      logInfo(`sizeValueOf(fraction=125): actual=${actual}`);
      expect(actual).assertEqual(1250);
      logInfo(`${BUNDLE}SizeValueOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0036
     * @tc.name      FilePreviewDLP_SizeValueOf_0036
     * @tc.desc      sizeValueOf(fraction=130) returns 1300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0036 begin`);
      const actual: number = sizeValueOf(130);
      logInfo(`sizeValueOf(fraction=130): actual=${actual}`);
      expect(actual).assertEqual(1300);
      logInfo(`${BUNDLE}SizeValueOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0037
     * @tc.name      FilePreviewDLP_SizeValueOf_0037
     * @tc.desc      sizeValueOf(fraction=135) returns 1350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0037 begin`);
      const actual: number = sizeValueOf(135);
      logInfo(`sizeValueOf(fraction=135): actual=${actual}`);
      expect(actual).assertEqual(1350);
      logInfo(`${BUNDLE}SizeValueOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0038
     * @tc.name      FilePreviewDLP_SizeValueOf_0038
     * @tc.desc      sizeValueOf(fraction=140) returns 1400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0038 begin`);
      const actual: number = sizeValueOf(140);
      logInfo(`sizeValueOf(fraction=140): actual=${actual}`);
      expect(actual).assertEqual(1400);
      logInfo(`${BUNDLE}SizeValueOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0039
     * @tc.name      FilePreviewDLP_SizeValueOf_0039
     * @tc.desc      sizeValueOf(fraction=145) returns 1450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0039 begin`);
      const actual: number = sizeValueOf(145);
      logInfo(`sizeValueOf(fraction=145): actual=${actual}`);
      expect(actual).assertEqual(1450);
      logInfo(`${BUNDLE}SizeValueOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0040
     * @tc.name      FilePreviewDLP_SizeValueOf_0040
     * @tc.desc      sizeValueOf(fraction=150) returns 1500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0040 begin`);
      const actual: number = sizeValueOf(150);
      logInfo(`sizeValueOf(fraction=150): actual=${actual}`);
      expect(actual).assertEqual(1500);
      logInfo(`${BUNDLE}SizeValueOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0041
     * @tc.name      FilePreviewDLP_SizeValueOf_0041
     * @tc.desc      sizeValueOf(fraction=155) returns 1550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0041 begin`);
      const actual: number = sizeValueOf(155);
      logInfo(`sizeValueOf(fraction=155): actual=${actual}`);
      expect(actual).assertEqual(1550);
      logInfo(`${BUNDLE}SizeValueOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0042
     * @tc.name      FilePreviewDLP_SizeValueOf_0042
     * @tc.desc      sizeValueOf(fraction=160) returns 1600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0042 begin`);
      const actual: number = sizeValueOf(160);
      logInfo(`sizeValueOf(fraction=160): actual=${actual}`);
      expect(actual).assertEqual(1600);
      logInfo(`${BUNDLE}SizeValueOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0043
     * @tc.name      FilePreviewDLP_SizeValueOf_0043
     * @tc.desc      sizeValueOf(fraction=165) returns 1650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0043 begin`);
      const actual: number = sizeValueOf(165);
      logInfo(`sizeValueOf(fraction=165): actual=${actual}`);
      expect(actual).assertEqual(1650);
      logInfo(`${BUNDLE}SizeValueOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0044
     * @tc.name      FilePreviewDLP_SizeValueOf_0044
     * @tc.desc      sizeValueOf(fraction=170) returns 1700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0044 begin`);
      const actual: number = sizeValueOf(170);
      logInfo(`sizeValueOf(fraction=170): actual=${actual}`);
      expect(actual).assertEqual(1700);
      logInfo(`${BUNDLE}SizeValueOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0045
     * @tc.name      FilePreviewDLP_SizeValueOf_0045
     * @tc.desc      sizeValueOf(fraction=175) returns 1750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0045 begin`);
      const actual: number = sizeValueOf(175);
      logInfo(`sizeValueOf(fraction=175): actual=${actual}`);
      expect(actual).assertEqual(1750);
      logInfo(`${BUNDLE}SizeValueOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0046
     * @tc.name      FilePreviewDLP_SizeValueOf_0046
     * @tc.desc      sizeValueOf(fraction=180) returns 1800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0046 begin`);
      const actual: number = sizeValueOf(180);
      logInfo(`sizeValueOf(fraction=180): actual=${actual}`);
      expect(actual).assertEqual(1800);
      logInfo(`${BUNDLE}SizeValueOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0047
     * @tc.name      FilePreviewDLP_SizeValueOf_0047
     * @tc.desc      sizeValueOf(fraction=185) returns 1850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0047 begin`);
      const actual: number = sizeValueOf(185);
      logInfo(`sizeValueOf(fraction=185): actual=${actual}`);
      expect(actual).assertEqual(1850);
      logInfo(`${BUNDLE}SizeValueOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0048
     * @tc.name      FilePreviewDLP_SizeValueOf_0048
     * @tc.desc      sizeValueOf(fraction=190) returns 1900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0048 begin`);
      const actual: number = sizeValueOf(190);
      logInfo(`sizeValueOf(fraction=190): actual=${actual}`);
      expect(actual).assertEqual(1900);
      logInfo(`${BUNDLE}SizeValueOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0049
     * @tc.name      FilePreviewDLP_SizeValueOf_0049
     * @tc.desc      sizeValueOf(fraction=195) returns 1950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0049 begin`);
      const actual: number = sizeValueOf(195);
      logInfo(`sizeValueOf(fraction=195): actual=${actual}`);
      expect(actual).assertEqual(1950);
      logInfo(`${BUNDLE}SizeValueOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0050
     * @tc.name      FilePreviewDLP_SizeValueOf_0050
     * @tc.desc      sizeValueOf(fraction=200) returns 2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0050 begin`);
      const actual: number = sizeValueOf(200);
      logInfo(`sizeValueOf(fraction=200): actual=${actual}`);
      expect(actual).assertEqual(2000);
      logInfo(`${BUNDLE}SizeValueOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0051
     * @tc.name      FilePreviewDLP_SizeValueOf_0051
     * @tc.desc      sizeValueOf(fraction=65.84) returns 658.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0051 begin`);
      const actual: number = sizeValueOf(65.84);
      logInfo(`sizeValueOf(fraction=65.84): actual=${actual}`);
      expect(actual).assertClose(658.4, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0052
     * @tc.name      FilePreviewDLP_SizeValueOf_0052
     * @tc.desc      sizeValueOf(fraction=4) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0052 begin`);
      const actual: number = sizeValueOf(4);
      logInfo(`sizeValueOf(fraction=4): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}SizeValueOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0053
     * @tc.name      FilePreviewDLP_SizeValueOf_0053
     * @tc.desc      sizeValueOf(fraction=56.35) returns 563.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0053 begin`);
      const actual: number = sizeValueOf(56.35);
      logInfo(`sizeValueOf(fraction=56.35): actual=${actual}`);
      expect(actual).assertClose(563.5, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0054
     * @tc.name      FilePreviewDLP_SizeValueOf_0054
     * @tc.desc      sizeValueOf(fraction=-29) returns -290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0054 begin`);
      const actual: number = sizeValueOf(-29);
      logInfo(`sizeValueOf(fraction=-29): actual=${actual}`);
      expect(actual).assertEqual(-290);
      logInfo(`${BUNDLE}SizeValueOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0055
     * @tc.name      FilePreviewDLP_SizeValueOf_0055
     * @tc.desc      sizeValueOf(fraction=-62) returns -620
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0055 begin`);
      const actual: number = sizeValueOf(-62);
      logInfo(`sizeValueOf(fraction=-62): actual=${actual}`);
      expect(actual).assertEqual(-620);
      logInfo(`${BUNDLE}SizeValueOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0056
     * @tc.name      FilePreviewDLP_SizeValueOf_0056
     * @tc.desc      sizeValueOf(fraction=58) returns 580
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0056 begin`);
      const actual: number = sizeValueOf(58);
      logInfo(`sizeValueOf(fraction=58): actual=${actual}`);
      expect(actual).assertEqual(580);
      logInfo(`${BUNDLE}SizeValueOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0057
     * @tc.name      FilePreviewDLP_SizeValueOf_0057
     * @tc.desc      sizeValueOf(fraction=14.07) returns 140.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0057 begin`);
      const actual: number = sizeValueOf(14.07);
      logInfo(`sizeValueOf(fraction=14.07): actual=${actual}`);
      expect(actual).assertClose(140.7, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0058
     * @tc.name      FilePreviewDLP_SizeValueOf_0058
     * @tc.desc      sizeValueOf(fraction=172) returns 1720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0058 begin`);
      const actual: number = sizeValueOf(172);
      logInfo(`sizeValueOf(fraction=172): actual=${actual}`);
      expect(actual).assertEqual(1720);
      logInfo(`${BUNDLE}SizeValueOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0059
     * @tc.name      FilePreviewDLP_SizeValueOf_0059
     * @tc.desc      sizeValueOf(fraction=27) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0059 begin`);
      const actual: number = sizeValueOf(27);
      logInfo(`sizeValueOf(fraction=27): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}SizeValueOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0060
     * @tc.name      FilePreviewDLP_SizeValueOf_0060
     * @tc.desc      sizeValueOf(fraction=106) returns 1060
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0060 begin`);
      const actual: number = sizeValueOf(106);
      logInfo(`sizeValueOf(fraction=106): actual=${actual}`);
      expect(actual).assertEqual(1060);
      logInfo(`${BUNDLE}SizeValueOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0061
     * @tc.name      FilePreviewDLP_SizeValueOf_0061
     * @tc.desc      sizeValueOf(fraction=22) returns 220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0061 begin`);
      const actual: number = sizeValueOf(22);
      logInfo(`sizeValueOf(fraction=22): actual=${actual}`);
      expect(actual).assertEqual(220);
      logInfo(`${BUNDLE}SizeValueOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0062
     * @tc.name      FilePreviewDLP_SizeValueOf_0062
     * @tc.desc      sizeValueOf(fraction=13.85) returns 138.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0062 begin`);
      const actual: number = sizeValueOf(13.85);
      logInfo(`sizeValueOf(fraction=13.85): actual=${actual}`);
      expect(actual).assertClose(138.5, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0063
     * @tc.name      FilePreviewDLP_SizeValueOf_0063
     * @tc.desc      sizeValueOf(fraction=44) returns 440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0063 begin`);
      const actual: number = sizeValueOf(44);
      logInfo(`sizeValueOf(fraction=44): actual=${actual}`);
      expect(actual).assertEqual(440);
      logInfo(`${BUNDLE}SizeValueOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0064
     * @tc.name      FilePreviewDLP_SizeValueOf_0064
     * @tc.desc      sizeValueOf(fraction=87) returns 870
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0064 begin`);
      const actual: number = sizeValueOf(87);
      logInfo(`sizeValueOf(fraction=87): actual=${actual}`);
      expect(actual).assertEqual(870);
      logInfo(`${BUNDLE}SizeValueOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0065
     * @tc.name      FilePreviewDLP_SizeValueOf_0065
     * @tc.desc      sizeValueOf(fraction=179) returns 1790
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0065 begin`);
      const actual: number = sizeValueOf(179);
      logInfo(`sizeValueOf(fraction=179): actual=${actual}`);
      expect(actual).assertEqual(1790);
      logInfo(`${BUNDLE}SizeValueOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0066
     * @tc.name      FilePreviewDLP_SizeValueOf_0066
     * @tc.desc      sizeValueOf(fraction=29.12) returns 291.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0066 begin`);
      const actual: number = sizeValueOf(29.12);
      logInfo(`sizeValueOf(fraction=29.12): actual=${actual}`);
      expect(actual).assertClose(291.2, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0067
     * @tc.name      FilePreviewDLP_SizeValueOf_0067
     * @tc.desc      sizeValueOf(fraction=187) returns 1870
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0067 begin`);
      const actual: number = sizeValueOf(187);
      logInfo(`sizeValueOf(fraction=187): actual=${actual}`);
      expect(actual).assertEqual(1870);
      logInfo(`${BUNDLE}SizeValueOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0068
     * @tc.name      FilePreviewDLP_SizeValueOf_0068
     * @tc.desc      sizeValueOf(fraction=159) returns 1590
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0068 begin`);
      const actual: number = sizeValueOf(159);
      logInfo(`sizeValueOf(fraction=159): actual=${actual}`);
      expect(actual).assertEqual(1590);
      logInfo(`${BUNDLE}SizeValueOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0069
     * @tc.name      FilePreviewDLP_SizeValueOf_0069
     * @tc.desc      sizeValueOf(fraction=82.49) returns 824.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0069 begin`);
      const actual: number = sizeValueOf(82.49);
      logInfo(`sizeValueOf(fraction=82.49): actual=${actual}`);
      expect(actual).assertClose(824.9, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0070
     * @tc.name      FilePreviewDLP_SizeValueOf_0070
     * @tc.desc      sizeValueOf(fraction=168) returns 1680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0070 begin`);
      const actual: number = sizeValueOf(168);
      logInfo(`sizeValueOf(fraction=168): actual=${actual}`);
      expect(actual).assertEqual(1680);
      logInfo(`${BUNDLE}SizeValueOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0071
     * @tc.name      FilePreviewDLP_SizeValueOf_0071
     * @tc.desc      sizeValueOf(fraction=-44) returns -440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0071 begin`);
      const actual: number = sizeValueOf(-44);
      logInfo(`sizeValueOf(fraction=-44): actual=${actual}`);
      expect(actual).assertEqual(-440);
      logInfo(`${BUNDLE}SizeValueOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0072
     * @tc.name      FilePreviewDLP_SizeValueOf_0072
     * @tc.desc      sizeValueOf(fraction=133) returns 1330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0072 begin`);
      const actual: number = sizeValueOf(133);
      logInfo(`sizeValueOf(fraction=133): actual=${actual}`);
      expect(actual).assertEqual(1330);
      logInfo(`${BUNDLE}SizeValueOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0073
     * @tc.name      FilePreviewDLP_SizeValueOf_0073
     * @tc.desc      sizeValueOf(fraction=-16) returns -160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0073 begin`);
      const actual: number = sizeValueOf(-16);
      logInfo(`sizeValueOf(fraction=-16): actual=${actual}`);
      expect(actual).assertEqual(-160);
      logInfo(`${BUNDLE}SizeValueOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0074
     * @tc.name      FilePreviewDLP_SizeValueOf_0074
     * @tc.desc      sizeValueOf(fraction=-97) returns -970
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0074 begin`);
      const actual: number = sizeValueOf(-97);
      logInfo(`sizeValueOf(fraction=-97): actual=${actual}`);
      expect(actual).assertEqual(-970);
      logInfo(`${BUNDLE}SizeValueOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0075
     * @tc.name      FilePreviewDLP_SizeValueOf_0075
     * @tc.desc      sizeValueOf(fraction=147) returns 1470
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0075 begin`);
      const actual: number = sizeValueOf(147);
      logInfo(`sizeValueOf(fraction=147): actual=${actual}`);
      expect(actual).assertEqual(1470);
      logInfo(`${BUNDLE}SizeValueOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0076
     * @tc.name      FilePreviewDLP_SizeValueOf_0076
     * @tc.desc      sizeValueOf(fraction=98.38) returns 983.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0076 begin`);
      const actual: number = sizeValueOf(98.38);
      logInfo(`sizeValueOf(fraction=98.38): actual=${actual}`);
      expect(actual).assertClose(983.8, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0077
     * @tc.name      FilePreviewDLP_SizeValueOf_0077
     * @tc.desc      sizeValueOf(fraction=71.84) returns 718.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0077 begin`);
      const actual: number = sizeValueOf(71.84);
      logInfo(`sizeValueOf(fraction=71.84): actual=${actual}`);
      expect(actual).assertClose(718.4, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0078
     * @tc.name      FilePreviewDLP_SizeValueOf_0078
     * @tc.desc      sizeValueOf(fraction=1.72) returns 17.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0078 begin`);
      const actual: number = sizeValueOf(1.72);
      logInfo(`sizeValueOf(fraction=1.72): actual=${actual}`);
      expect(actual).assertClose(17.2, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0079
     * @tc.name      FilePreviewDLP_SizeValueOf_0079
     * @tc.desc      sizeValueOf(fraction=-72) returns -720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0079 begin`);
      const actual: number = sizeValueOf(-72);
      logInfo(`sizeValueOf(fraction=-72): actual=${actual}`);
      expect(actual).assertEqual(-720);
      logInfo(`${BUNDLE}SizeValueOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0080
     * @tc.name      FilePreviewDLP_SizeValueOf_0080
     * @tc.desc      sizeValueOf(fraction=-34) returns -340
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0080 begin`);
      const actual: number = sizeValueOf(-34);
      logInfo(`sizeValueOf(fraction=-34): actual=${actual}`);
      expect(actual).assertEqual(-340);
      logInfo(`${BUNDLE}SizeValueOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0081
     * @tc.name      FilePreviewDLP_SizeValueOf_0081
     * @tc.desc      sizeValueOf(fraction=14.23) returns 142.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0081 begin`);
      const actual: number = sizeValueOf(14.23);
      logInfo(`sizeValueOf(fraction=14.23): actual=${actual}`);
      expect(actual).assertClose(142.3, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0082
     * @tc.name      FilePreviewDLP_SizeValueOf_0082
     * @tc.desc      sizeValueOf(fraction=-91) returns -910
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0082 begin`);
      const actual: number = sizeValueOf(-91);
      logInfo(`sizeValueOf(fraction=-91): actual=${actual}`);
      expect(actual).assertEqual(-910);
      logInfo(`${BUNDLE}SizeValueOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0083
     * @tc.name      FilePreviewDLP_SizeValueOf_0083
     * @tc.desc      sizeValueOf(fraction=143) returns 1430
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0083 begin`);
      const actual: number = sizeValueOf(143);
      logInfo(`sizeValueOf(fraction=143): actual=${actual}`);
      expect(actual).assertEqual(1430);
      logInfo(`${BUNDLE}SizeValueOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0084
     * @tc.name      FilePreviewDLP_SizeValueOf_0084
     * @tc.desc      sizeValueOf(fraction=152) returns 1520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0084 begin`);
      const actual: number = sizeValueOf(152);
      logInfo(`sizeValueOf(fraction=152): actual=${actual}`);
      expect(actual).assertEqual(1520);
      logInfo(`${BUNDLE}SizeValueOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0085
     * @tc.name      FilePreviewDLP_SizeValueOf_0085
     * @tc.desc      sizeValueOf(fraction=-89) returns -890
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0085 begin`);
      const actual: number = sizeValueOf(-89);
      logInfo(`sizeValueOf(fraction=-89): actual=${actual}`);
      expect(actual).assertEqual(-890);
      logInfo(`${BUNDLE}SizeValueOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0086
     * @tc.name      FilePreviewDLP_SizeValueOf_0086
     * @tc.desc      sizeValueOf(fraction=-100) returns -1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0086 begin`);
      const actual: number = sizeValueOf(-100);
      logInfo(`sizeValueOf(fraction=-100): actual=${actual}`);
      expect(actual).assertEqual(-1000);
      logInfo(`${BUNDLE}SizeValueOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0087
     * @tc.name      FilePreviewDLP_SizeValueOf_0087
     * @tc.desc      sizeValueOf(fraction=38.64) returns 386.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0087 begin`);
      const actual: number = sizeValueOf(38.64);
      logInfo(`sizeValueOf(fraction=38.64): actual=${actual}`);
      expect(actual).assertClose(386.4, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0088
     * @tc.name      FilePreviewDLP_SizeValueOf_0088
     * @tc.desc      sizeValueOf(fraction=83) returns 830
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0088 begin`);
      const actual: number = sizeValueOf(83);
      logInfo(`sizeValueOf(fraction=83): actual=${actual}`);
      expect(actual).assertEqual(830);
      logInfo(`${BUNDLE}SizeValueOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0089
     * @tc.name      FilePreviewDLP_SizeValueOf_0089
     * @tc.desc      sizeValueOf(fraction=52) returns 520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0089 begin`);
      const actual: number = sizeValueOf(52);
      logInfo(`sizeValueOf(fraction=52): actual=${actual}`);
      expect(actual).assertEqual(520);
      logInfo(`${BUNDLE}SizeValueOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0090
     * @tc.name      FilePreviewDLP_SizeValueOf_0090
     * @tc.desc      sizeValueOf(fraction=88.28) returns 882.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0090 begin`);
      const actual: number = sizeValueOf(88.28);
      logInfo(`sizeValueOf(fraction=88.28): actual=${actual}`);
      expect(actual).assertClose(882.8, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0090 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0091
     * @tc.name      FilePreviewDLP_SizeValueOf_0091
     * @tc.desc      sizeValueOf(fraction=18.23) returns 182.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0091 begin`);
      const actual: number = sizeValueOf(18.23);
      logInfo(`sizeValueOf(fraction=18.23): actual=${actual}`);
      expect(actual).assertClose(182.3, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0091 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0092
     * @tc.name      FilePreviewDLP_SizeValueOf_0092
     * @tc.desc      sizeValueOf(fraction=-42) returns -420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0092 begin`);
      const actual: number = sizeValueOf(-42);
      logInfo(`sizeValueOf(fraction=-42): actual=${actual}`);
      expect(actual).assertEqual(-420);
      logInfo(`${BUNDLE}SizeValueOf_0092 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0093
     * @tc.name      FilePreviewDLP_SizeValueOf_0093
     * @tc.desc      sizeValueOf(fraction=68.46) returns 684.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0093 begin`);
      const actual: number = sizeValueOf(68.46);
      logInfo(`sizeValueOf(fraction=68.46): actual=${actual}`);
      expect(actual).assertClose(684.6, PRECISION);
      logInfo(`${BUNDLE}SizeValueOf_0093 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0094
     * @tc.name      FilePreviewDLP_SizeValueOf_0094
     * @tc.desc      sizeValueOf(fraction=53) returns 530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0094 begin`);
      const actual: number = sizeValueOf(53);
      logInfo(`sizeValueOf(fraction=53): actual=${actual}`);
      expect(actual).assertEqual(530);
      logInfo(`${BUNDLE}SizeValueOf_0094 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0095
     * @tc.name      FilePreviewDLP_SizeValueOf_0095
     * @tc.desc      sizeValueOf(fraction=92) returns 920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_SizeValueOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeValueOf_0095 begin`);
      const actual: number = sizeValueOf(92);
      logInfo(`sizeValueOf(fraction=92): actual=${actual}`);
      expect(actual).assertEqual(920);
      logInfo(`${BUNDLE}SizeValueOf_0095 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_SIZE_VALUE_OF_0096
     * @tc.name      FilePreviewDLP_SizeValueOf_0096
     * @tc.desc      sizeValueOf(fraction=-61) returns -610
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_SizeValueOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeValueOf_0096 begin`);
      const actual: number = sizeValueOf(-61);
      logInfo(`sizeValueOf(fraction=-61): actual=${actual}`);
      expect(actual).assertEqual(-610);
      logInfo(`${BUNDLE}SizeValueOf_0096 end`);
    });
  });
}
