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
import { dialogTitleHeightAt } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for dialogTitleHeightAt (96 cases). */
export default function dialogTitleHeightAtTest(): void {
  describe('DialogTitleHeightAtTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0001
     * @tc.name      NdkNotification_DialogTitleHeightAt_0001
     * @tc.desc      dialogTitleHeightAt(density=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_DialogTitleHeightAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0001 begin`);
      const actual: number = dialogTitleHeightAt(0);
      logInfo(`dialogTitleHeightAt(density=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0002
     * @tc.name      NdkNotification_DialogTitleHeightAt_0002
     * @tc.desc      dialogTitleHeightAt(density=1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_DialogTitleHeightAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0002 begin`);
      const actual: number = dialogTitleHeightAt(1);
      logInfo(`dialogTitleHeightAt(density=1): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0003
     * @tc.name      NdkNotification_DialogTitleHeightAt_0003
     * @tc.desc      dialogTitleHeightAt(density=2) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0003 begin`);
      const actual: number = dialogTitleHeightAt(2);
      logInfo(`dialogTitleHeightAt(density=2): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0004
     * @tc.name      NdkNotification_DialogTitleHeightAt_0004
     * @tc.desc      dialogTitleHeightAt(density=3) returns 33.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0004 begin`);
      const actual: number = dialogTitleHeightAt(3);
      logInfo(`dialogTitleHeightAt(density=3): actual=${actual}`);
      expect(actual).assertClose(33.333333333333336, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0005
     * @tc.name      NdkNotification_DialogTitleHeightAt_0005
     * @tc.desc      dialogTitleHeightAt(density=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0005 begin`);
      const actual: number = dialogTitleHeightAt(10);
      logInfo(`dialogTitleHeightAt(density=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0006
     * @tc.name      NdkNotification_DialogTitleHeightAt_0006
     * @tc.desc      dialogTitleHeightAt(density=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0006 begin`);
      const actual: number = dialogTitleHeightAt(100);
      logInfo(`dialogTitleHeightAt(density=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0007
     * @tc.name      NdkNotification_DialogTitleHeightAt_0007
     * @tc.desc      dialogTitleHeightAt(density=5) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0007 begin`);
      const actual: number = dialogTitleHeightAt(5);
      logInfo(`dialogTitleHeightAt(density=5): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0008
     * @tc.name      NdkNotification_DialogTitleHeightAt_0008
     * @tc.desc      dialogTitleHeightAt(density=15) returns 6.666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0008 begin`);
      const actual: number = dialogTitleHeightAt(15);
      logInfo(`dialogTitleHeightAt(density=15): actual=${actual}`);
      expect(actual).assertClose(6.666666666666667, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0009
     * @tc.name      NdkNotification_DialogTitleHeightAt_0009
     * @tc.desc      dialogTitleHeightAt(density=20) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0009 begin`);
      const actual: number = dialogTitleHeightAt(20);
      logInfo(`dialogTitleHeightAt(density=20): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0010
     * @tc.name      NdkNotification_DialogTitleHeightAt_0010
     * @tc.desc      dialogTitleHeightAt(density=25) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0010 begin`);
      const actual: number = dialogTitleHeightAt(25);
      logInfo(`dialogTitleHeightAt(density=25): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0011
     * @tc.name      NdkNotification_DialogTitleHeightAt_0011
     * @tc.desc      dialogTitleHeightAt(density=30) returns 3.3333333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0011 begin`);
      const actual: number = dialogTitleHeightAt(30);
      logInfo(`dialogTitleHeightAt(density=30): actual=${actual}`);
      expect(actual).assertClose(3.3333333333333335, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0012
     * @tc.name      NdkNotification_DialogTitleHeightAt_0012
     * @tc.desc      dialogTitleHeightAt(density=35) returns 2.857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0012 begin`);
      const actual: number = dialogTitleHeightAt(35);
      logInfo(`dialogTitleHeightAt(density=35): actual=${actual}`);
      expect(actual).assertClose(2.857142857142857, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0013
     * @tc.name      NdkNotification_DialogTitleHeightAt_0013
     * @tc.desc      dialogTitleHeightAt(density=40) returns 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0013 begin`);
      const actual: number = dialogTitleHeightAt(40);
      logInfo(`dialogTitleHeightAt(density=40): actual=${actual}`);
      expect(actual).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0014
     * @tc.name      NdkNotification_DialogTitleHeightAt_0014
     * @tc.desc      dialogTitleHeightAt(density=45) returns 2.2222222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0014 begin`);
      const actual: number = dialogTitleHeightAt(45);
      logInfo(`dialogTitleHeightAt(density=45): actual=${actual}`);
      expect(actual).assertClose(2.2222222222222223, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0015
     * @tc.name      NdkNotification_DialogTitleHeightAt_0015
     * @tc.desc      dialogTitleHeightAt(density=50) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0015 begin`);
      const actual: number = dialogTitleHeightAt(50);
      logInfo(`dialogTitleHeightAt(density=50): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0016
     * @tc.name      NdkNotification_DialogTitleHeightAt_0016
     * @tc.desc      dialogTitleHeightAt(density=55) returns 1.8181818181818181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0016 begin`);
      const actual: number = dialogTitleHeightAt(55);
      logInfo(`dialogTitleHeightAt(density=55): actual=${actual}`);
      expect(actual).assertClose(1.8181818181818181, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0017
     * @tc.name      NdkNotification_DialogTitleHeightAt_0017
     * @tc.desc      dialogTitleHeightAt(density=60) returns 1.6666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0017 begin`);
      const actual: number = dialogTitleHeightAt(60);
      logInfo(`dialogTitleHeightAt(density=60): actual=${actual}`);
      expect(actual).assertClose(1.6666666666666667, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0018
     * @tc.name      NdkNotification_DialogTitleHeightAt_0018
     * @tc.desc      dialogTitleHeightAt(density=65) returns 1.5384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0018 begin`);
      const actual: number = dialogTitleHeightAt(65);
      logInfo(`dialogTitleHeightAt(density=65): actual=${actual}`);
      expect(actual).assertClose(1.5384615384615385, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0019
     * @tc.name      NdkNotification_DialogTitleHeightAt_0019
     * @tc.desc      dialogTitleHeightAt(density=70) returns 1.4285714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0019 begin`);
      const actual: number = dialogTitleHeightAt(70);
      logInfo(`dialogTitleHeightAt(density=70): actual=${actual}`);
      expect(actual).assertClose(1.4285714285714286, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0020
     * @tc.name      NdkNotification_DialogTitleHeightAt_0020
     * @tc.desc      dialogTitleHeightAt(density=75) returns 1.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0020 begin`);
      const actual: number = dialogTitleHeightAt(75);
      logInfo(`dialogTitleHeightAt(density=75): actual=${actual}`);
      expect(actual).assertClose(1.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0021
     * @tc.name      NdkNotification_DialogTitleHeightAt_0021
     * @tc.desc      dialogTitleHeightAt(density=80) returns 1.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0021 begin`);
      const actual: number = dialogTitleHeightAt(80);
      logInfo(`dialogTitleHeightAt(density=80): actual=${actual}`);
      expect(actual).assertClose(1.25, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0022
     * @tc.name      NdkNotification_DialogTitleHeightAt_0022
     * @tc.desc      dialogTitleHeightAt(density=85) returns 1.1764705882352942
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0022 begin`);
      const actual: number = dialogTitleHeightAt(85);
      logInfo(`dialogTitleHeightAt(density=85): actual=${actual}`);
      expect(actual).assertClose(1.1764705882352942, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0023
     * @tc.name      NdkNotification_DialogTitleHeightAt_0023
     * @tc.desc      dialogTitleHeightAt(density=90) returns 1.1111111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0023 begin`);
      const actual: number = dialogTitleHeightAt(90);
      logInfo(`dialogTitleHeightAt(density=90): actual=${actual}`);
      expect(actual).assertClose(1.1111111111111112, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0024
     * @tc.name      NdkNotification_DialogTitleHeightAt_0024
     * @tc.desc      dialogTitleHeightAt(density=95) returns 1.0526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0024 begin`);
      const actual: number = dialogTitleHeightAt(95);
      logInfo(`dialogTitleHeightAt(density=95): actual=${actual}`);
      expect(actual).assertClose(1.0526315789473684, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0025
     * @tc.name      NdkNotification_DialogTitleHeightAt_0025
     * @tc.desc      dialogTitleHeightAt(density=105) returns 0.9523809523809523
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0025 begin`);
      const actual: number = dialogTitleHeightAt(105);
      logInfo(`dialogTitleHeightAt(density=105): actual=${actual}`);
      expect(actual).assertClose(0.9523809523809523, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0026
     * @tc.name      NdkNotification_DialogTitleHeightAt_0026
     * @tc.desc      dialogTitleHeightAt(density=110) returns 0.9090909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0026 begin`);
      const actual: number = dialogTitleHeightAt(110);
      logInfo(`dialogTitleHeightAt(density=110): actual=${actual}`);
      expect(actual).assertClose(0.9090909090909091, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0027
     * @tc.name      NdkNotification_DialogTitleHeightAt_0027
     * @tc.desc      dialogTitleHeightAt(density=115) returns 0.8695652173913043
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0027 begin`);
      const actual: number = dialogTitleHeightAt(115);
      logInfo(`dialogTitleHeightAt(density=115): actual=${actual}`);
      expect(actual).assertClose(0.8695652173913043, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0028
     * @tc.name      NdkNotification_DialogTitleHeightAt_0028
     * @tc.desc      dialogTitleHeightAt(density=120) returns 0.8333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0028 begin`);
      const actual: number = dialogTitleHeightAt(120);
      logInfo(`dialogTitleHeightAt(density=120): actual=${actual}`);
      expect(actual).assertClose(0.8333333333333334, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0029
     * @tc.name      NdkNotification_DialogTitleHeightAt_0029
     * @tc.desc      dialogTitleHeightAt(density=125) returns 0.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0029 begin`);
      const actual: number = dialogTitleHeightAt(125);
      logInfo(`dialogTitleHeightAt(density=125): actual=${actual}`);
      expect(actual).assertClose(0.8, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0030
     * @tc.name      NdkNotification_DialogTitleHeightAt_0030
     * @tc.desc      dialogTitleHeightAt(density=130) returns 0.7692307692307693
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0030 begin`);
      const actual: number = dialogTitleHeightAt(130);
      logInfo(`dialogTitleHeightAt(density=130): actual=${actual}`);
      expect(actual).assertClose(0.7692307692307693, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0031
     * @tc.name      NdkNotification_DialogTitleHeightAt_0031
     * @tc.desc      dialogTitleHeightAt(density=135) returns 0.7407407407407407
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0031 begin`);
      const actual: number = dialogTitleHeightAt(135);
      logInfo(`dialogTitleHeightAt(density=135): actual=${actual}`);
      expect(actual).assertClose(0.7407407407407407, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0032
     * @tc.name      NdkNotification_DialogTitleHeightAt_0032
     * @tc.desc      dialogTitleHeightAt(density=140) returns 0.7142857142857143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0032 begin`);
      const actual: number = dialogTitleHeightAt(140);
      logInfo(`dialogTitleHeightAt(density=140): actual=${actual}`);
      expect(actual).assertClose(0.7142857142857143, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0033
     * @tc.name      NdkNotification_DialogTitleHeightAt_0033
     * @tc.desc      dialogTitleHeightAt(density=145) returns 0.6896551724137931
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0033 begin`);
      const actual: number = dialogTitleHeightAt(145);
      logInfo(`dialogTitleHeightAt(density=145): actual=${actual}`);
      expect(actual).assertClose(0.6896551724137931, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0034
     * @tc.name      NdkNotification_DialogTitleHeightAt_0034
     * @tc.desc      dialogTitleHeightAt(density=150) returns 0.6666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0034 begin`);
      const actual: number = dialogTitleHeightAt(150);
      logInfo(`dialogTitleHeightAt(density=150): actual=${actual}`);
      expect(actual).assertClose(0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0035
     * @tc.name      NdkNotification_DialogTitleHeightAt_0035
     * @tc.desc      dialogTitleHeightAt(density=155) returns 0.6451612903225806
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0035 begin`);
      const actual: number = dialogTitleHeightAt(155);
      logInfo(`dialogTitleHeightAt(density=155): actual=${actual}`);
      expect(actual).assertClose(0.6451612903225806, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0036
     * @tc.name      NdkNotification_DialogTitleHeightAt_0036
     * @tc.desc      dialogTitleHeightAt(density=160) returns 0.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0036 begin`);
      const actual: number = dialogTitleHeightAt(160);
      logInfo(`dialogTitleHeightAt(density=160): actual=${actual}`);
      expect(actual).assertClose(0.625, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0037
     * @tc.name      NdkNotification_DialogTitleHeightAt_0037
     * @tc.desc      dialogTitleHeightAt(density=165) returns 0.6060606060606061
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0037 begin`);
      const actual: number = dialogTitleHeightAt(165);
      logInfo(`dialogTitleHeightAt(density=165): actual=${actual}`);
      expect(actual).assertClose(0.6060606060606061, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0038
     * @tc.name      NdkNotification_DialogTitleHeightAt_0038
     * @tc.desc      dialogTitleHeightAt(density=170) returns 0.5882352941176471
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0038 begin`);
      const actual: number = dialogTitleHeightAt(170);
      logInfo(`dialogTitleHeightAt(density=170): actual=${actual}`);
      expect(actual).assertClose(0.5882352941176471, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0039
     * @tc.name      NdkNotification_DialogTitleHeightAt_0039
     * @tc.desc      dialogTitleHeightAt(density=175) returns 0.5714285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0039 begin`);
      const actual: number = dialogTitleHeightAt(175);
      logInfo(`dialogTitleHeightAt(density=175): actual=${actual}`);
      expect(actual).assertClose(0.5714285714285714, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0040
     * @tc.name      NdkNotification_DialogTitleHeightAt_0040
     * @tc.desc      dialogTitleHeightAt(density=180) returns 0.5555555555555556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0040 begin`);
      const actual: number = dialogTitleHeightAt(180);
      logInfo(`dialogTitleHeightAt(density=180): actual=${actual}`);
      expect(actual).assertClose(0.5555555555555556, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0041
     * @tc.name      NdkNotification_DialogTitleHeightAt_0041
     * @tc.desc      dialogTitleHeightAt(density=185) returns 0.5405405405405406
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0041 begin`);
      const actual: number = dialogTitleHeightAt(185);
      logInfo(`dialogTitleHeightAt(density=185): actual=${actual}`);
      expect(actual).assertClose(0.5405405405405406, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0042
     * @tc.name      NdkNotification_DialogTitleHeightAt_0042
     * @tc.desc      dialogTitleHeightAt(density=190) returns 0.5263157894736842
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0042 begin`);
      const actual: number = dialogTitleHeightAt(190);
      logInfo(`dialogTitleHeightAt(density=190): actual=${actual}`);
      expect(actual).assertClose(0.5263157894736842, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0043
     * @tc.name      NdkNotification_DialogTitleHeightAt_0043
     * @tc.desc      dialogTitleHeightAt(density=195) returns 0.5128205128205128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0043 begin`);
      const actual: number = dialogTitleHeightAt(195);
      logInfo(`dialogTitleHeightAt(density=195): actual=${actual}`);
      expect(actual).assertClose(0.5128205128205128, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0044
     * @tc.name      NdkNotification_DialogTitleHeightAt_0044
     * @tc.desc      dialogTitleHeightAt(density=200) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0044 begin`);
      const actual: number = dialogTitleHeightAt(200);
      logInfo(`dialogTitleHeightAt(density=200): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0045
     * @tc.name      NdkNotification_DialogTitleHeightAt_0045
     * @tc.desc      dialogTitleHeightAt(density=47) returns 2.127659574468085
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0045 begin`);
      const actual: number = dialogTitleHeightAt(47);
      logInfo(`dialogTitleHeightAt(density=47): actual=${actual}`);
      expect(actual).assertClose(2.127659574468085, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0046
     * @tc.name      NdkNotification_DialogTitleHeightAt_0046
     * @tc.desc      dialogTitleHeightAt(density=27) returns 3.7037037037037037
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0046 begin`);
      const actual: number = dialogTitleHeightAt(27);
      logInfo(`dialogTitleHeightAt(density=27): actual=${actual}`);
      expect(actual).assertClose(3.7037037037037037, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0047
     * @tc.name      NdkNotification_DialogTitleHeightAt_0047
     * @tc.desc      dialogTitleHeightAt(density=179) returns 0.5586592178770949
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0047 begin`);
      const actual: number = dialogTitleHeightAt(179);
      logInfo(`dialogTitleHeightAt(density=179): actual=${actual}`);
      expect(actual).assertClose(0.5586592178770949, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0048
     * @tc.name      NdkNotification_DialogTitleHeightAt_0048
     * @tc.desc      dialogTitleHeightAt(density=24) returns 4.166666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0048 begin`);
      const actual: number = dialogTitleHeightAt(24);
      logInfo(`dialogTitleHeightAt(density=24): actual=${actual}`);
      expect(actual).assertClose(4.166666666666667, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0049
     * @tc.name      NdkNotification_DialogTitleHeightAt_0049
     * @tc.desc      dialogTitleHeightAt(density=80.83) returns 1.2371644191513052
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0049 begin`);
      const actual: number = dialogTitleHeightAt(80.83);
      logInfo(`dialogTitleHeightAt(density=80.83): actual=${actual}`);
      expect(actual).assertClose(1.2371644191513052, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0050
     * @tc.name      NdkNotification_DialogTitleHeightAt_0050
     * @tc.desc      dialogTitleHeightAt(density=61.73) returns 1.6199578810950916
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0050 begin`);
      const actual: number = dialogTitleHeightAt(61.73);
      logInfo(`dialogTitleHeightAt(density=61.73): actual=${actual}`);
      expect(actual).assertClose(1.6199578810950916, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0051
     * @tc.name      NdkNotification_DialogTitleHeightAt_0051
     * @tc.desc      dialogTitleHeightAt(density=129) returns 0.7751937984496124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0051 begin`);
      const actual: number = dialogTitleHeightAt(129);
      logInfo(`dialogTitleHeightAt(density=129): actual=${actual}`);
      expect(actual).assertClose(0.7751937984496124, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0052
     * @tc.name      NdkNotification_DialogTitleHeightAt_0052
     * @tc.desc      dialogTitleHeightAt(density=187) returns 0.5347593582887701
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0052 begin`);
      const actual: number = dialogTitleHeightAt(187);
      logInfo(`dialogTitleHeightAt(density=187): actual=${actual}`);
      expect(actual).assertClose(0.5347593582887701, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0053
     * @tc.name      NdkNotification_DialogTitleHeightAt_0053
     * @tc.desc      dialogTitleHeightAt(density=7.97) returns 12.547051442910917
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0053 begin`);
      const actual: number = dialogTitleHeightAt(7.97);
      logInfo(`dialogTitleHeightAt(density=7.97): actual=${actual}`);
      expect(actual).assertClose(12.547051442910917, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0054
     * @tc.name      NdkNotification_DialogTitleHeightAt_0054
     * @tc.desc      dialogTitleHeightAt(density=158) returns 0.6329113924050633
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0054 begin`);
      const actual: number = dialogTitleHeightAt(158);
      logInfo(`dialogTitleHeightAt(density=158): actual=${actual}`);
      expect(actual).assertClose(0.6329113924050633, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0055
     * @tc.name      NdkNotification_DialogTitleHeightAt_0055
     * @tc.desc      dialogTitleHeightAt(density=15.78) returns 6.337135614702155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0055 begin`);
      const actual: number = dialogTitleHeightAt(15.78);
      logInfo(`dialogTitleHeightAt(density=15.78): actual=${actual}`);
      expect(actual).assertClose(6.337135614702155, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0056
     * @tc.name      NdkNotification_DialogTitleHeightAt_0056
     * @tc.desc      dialogTitleHeightAt(density=136) returns 0.7352941176470589
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0056 begin`);
      const actual: number = dialogTitleHeightAt(136);
      logInfo(`dialogTitleHeightAt(density=136): actual=${actual}`);
      expect(actual).assertClose(0.7352941176470589, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0057
     * @tc.name      NdkNotification_DialogTitleHeightAt_0057
     * @tc.desc      dialogTitleHeightAt(density=102) returns 0.9803921568627451
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0057 begin`);
      const actual: number = dialogTitleHeightAt(102);
      logInfo(`dialogTitleHeightAt(density=102): actual=${actual}`);
      expect(actual).assertClose(0.9803921568627451, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0058
     * @tc.name      NdkNotification_DialogTitleHeightAt_0058
     * @tc.desc      dialogTitleHeightAt(density=54) returns 1.8518518518518519
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0058 begin`);
      const actual: number = dialogTitleHeightAt(54);
      logInfo(`dialogTitleHeightAt(density=54): actual=${actual}`);
      expect(actual).assertClose(1.8518518518518519, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0059
     * @tc.name      NdkNotification_DialogTitleHeightAt_0059
     * @tc.desc      dialogTitleHeightAt(density=93.26) returns 1.072271070126528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0059 begin`);
      const actual: number = dialogTitleHeightAt(93.26);
      logInfo(`dialogTitleHeightAt(density=93.26): actual=${actual}`);
      expect(actual).assertClose(1.072271070126528, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0060
     * @tc.name      NdkNotification_DialogTitleHeightAt_0060
     * @tc.desc      dialogTitleHeightAt(density=38) returns 2.6315789473684212
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0060 begin`);
      const actual: number = dialogTitleHeightAt(38);
      logInfo(`dialogTitleHeightAt(density=38): actual=${actual}`);
      expect(actual).assertClose(2.6315789473684212, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0061
     * @tc.name      NdkNotification_DialogTitleHeightAt_0061
     * @tc.desc      dialogTitleHeightAt(density=46) returns 2.1739130434782608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0061 begin`);
      const actual: number = dialogTitleHeightAt(46);
      logInfo(`dialogTitleHeightAt(density=46): actual=${actual}`);
      expect(actual).assertClose(2.1739130434782608, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0062
     * @tc.name      NdkNotification_DialogTitleHeightAt_0062
     * @tc.desc      dialogTitleHeightAt(density=80.49) returns 1.2423903590508139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0062 begin`);
      const actual: number = dialogTitleHeightAt(80.49);
      logInfo(`dialogTitleHeightAt(density=80.49): actual=${actual}`);
      expect(actual).assertClose(1.2423903590508139, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0063
     * @tc.name      NdkNotification_DialogTitleHeightAt_0063
     * @tc.desc      dialogTitleHeightAt(density=91) returns 1.098901098901099
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0063 begin`);
      const actual: number = dialogTitleHeightAt(91);
      logInfo(`dialogTitleHeightAt(density=91): actual=${actual}`);
      expect(actual).assertClose(1.098901098901099, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0064
     * @tc.name      NdkNotification_DialogTitleHeightAt_0064
     * @tc.desc      dialogTitleHeightAt(density=21) returns 4.761904761904762
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0064 begin`);
      const actual: number = dialogTitleHeightAt(21);
      logInfo(`dialogTitleHeightAt(density=21): actual=${actual}`);
      expect(actual).assertClose(4.761904761904762, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0065
     * @tc.name      NdkNotification_DialogTitleHeightAt_0065
     * @tc.desc      dialogTitleHeightAt(density=166) returns 0.6024096385542169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0065 begin`);
      const actual: number = dialogTitleHeightAt(166);
      logInfo(`dialogTitleHeightAt(density=166): actual=${actual}`);
      expect(actual).assertClose(0.6024096385542169, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0066
     * @tc.name      NdkNotification_DialogTitleHeightAt_0066
     * @tc.desc      dialogTitleHeightAt(density=43.28) returns 2.310536044362292
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0066 begin`);
      const actual: number = dialogTitleHeightAt(43.28);
      logInfo(`dialogTitleHeightAt(density=43.28): actual=${actual}`);
      expect(actual).assertClose(2.310536044362292, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0067
     * @tc.name      NdkNotification_DialogTitleHeightAt_0067
     * @tc.desc      dialogTitleHeightAt(density=93) returns 1.075268817204301
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0067 begin`);
      const actual: number = dialogTitleHeightAt(93);
      logInfo(`dialogTitleHeightAt(density=93): actual=${actual}`);
      expect(actual).assertClose(1.075268817204301, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0068
     * @tc.name      NdkNotification_DialogTitleHeightAt_0068
     * @tc.desc      dialogTitleHeightAt(density=12.28) returns 8.143322475570033
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0068 begin`);
      const actual: number = dialogTitleHeightAt(12.28);
      logInfo(`dialogTitleHeightAt(density=12.28): actual=${actual}`);
      expect(actual).assertClose(8.143322475570033, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0069
     * @tc.name      NdkNotification_DialogTitleHeightAt_0069
     * @tc.desc      dialogTitleHeightAt(density=149) returns 0.6711409395973155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0069 begin`);
      const actual: number = dialogTitleHeightAt(149);
      logInfo(`dialogTitleHeightAt(density=149): actual=${actual}`);
      expect(actual).assertClose(0.6711409395973155, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0070
     * @tc.name      NdkNotification_DialogTitleHeightAt_0070
     * @tc.desc      dialogTitleHeightAt(density=138) returns 0.7246376811594203
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0070 begin`);
      const actual: number = dialogTitleHeightAt(138);
      logInfo(`dialogTitleHeightAt(density=138): actual=${actual}`);
      expect(actual).assertClose(0.7246376811594203, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0071
     * @tc.name      NdkNotification_DialogTitleHeightAt_0071
     * @tc.desc      dialogTitleHeightAt(density=24.55) returns 4.0733197556008145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0071 begin`);
      const actual: number = dialogTitleHeightAt(24.55);
      logInfo(`dialogTitleHeightAt(density=24.55): actual=${actual}`);
      expect(actual).assertClose(4.0733197556008145, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0072
     * @tc.name      NdkNotification_DialogTitleHeightAt_0072
     * @tc.desc      dialogTitleHeightAt(density=103) returns 0.970873786407767
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0072 begin`);
      const actual: number = dialogTitleHeightAt(103);
      logInfo(`dialogTitleHeightAt(density=103): actual=${actual}`);
      expect(actual).assertClose(0.970873786407767, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0073
     * @tc.name      NdkNotification_DialogTitleHeightAt_0073
     * @tc.desc      dialogTitleHeightAt(density=19.76) returns 5.060728744939271
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0073 begin`);
      const actual: number = dialogTitleHeightAt(19.76);
      logInfo(`dialogTitleHeightAt(density=19.76): actual=${actual}`);
      expect(actual).assertClose(5.060728744939271, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0074
     * @tc.name      NdkNotification_DialogTitleHeightAt_0074
     * @tc.desc      dialogTitleHeightAt(density=53.11) returns 1.8828845791752966
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0074 begin`);
      const actual: number = dialogTitleHeightAt(53.11);
      logInfo(`dialogTitleHeightAt(density=53.11): actual=${actual}`);
      expect(actual).assertClose(1.8828845791752966, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0075
     * @tc.name      NdkNotification_DialogTitleHeightAt_0075
     * @tc.desc      dialogTitleHeightAt(density=38.9) returns 2.570694087403599
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0075 begin`);
      const actual: number = dialogTitleHeightAt(38.9);
      logInfo(`dialogTitleHeightAt(density=38.9): actual=${actual}`);
      expect(actual).assertClose(2.570694087403599, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0076
     * @tc.name      NdkNotification_DialogTitleHeightAt_0076
     * @tc.desc      dialogTitleHeightAt(density=25.57) returns 3.9108330074305826
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0076 begin`);
      const actual: number = dialogTitleHeightAt(25.57);
      logInfo(`dialogTitleHeightAt(density=25.57): actual=${actual}`);
      expect(actual).assertClose(3.9108330074305826, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0077
     * @tc.name      NdkNotification_DialogTitleHeightAt_0077
     * @tc.desc      dialogTitleHeightAt(density=76) returns 1.3157894736842106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0077 begin`);
      const actual: number = dialogTitleHeightAt(76);
      logInfo(`dialogTitleHeightAt(density=76): actual=${actual}`);
      expect(actual).assertClose(1.3157894736842106, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0078
     * @tc.name      NdkNotification_DialogTitleHeightAt_0078
     * @tc.desc      dialogTitleHeightAt(density=0.42) returns 238.0952380952381
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0078 begin`);
      const actual: number = dialogTitleHeightAt(0.42);
      logInfo(`dialogTitleHeightAt(density=0.42): actual=${actual}`);
      expect(actual).assertClose(238.0952380952381, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0079
     * @tc.name      NdkNotification_DialogTitleHeightAt_0079
     * @tc.desc      dialogTitleHeightAt(density=59) returns 1.694915254237288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0079 begin`);
      const actual: number = dialogTitleHeightAt(59);
      logInfo(`dialogTitleHeightAt(density=59): actual=${actual}`);
      expect(actual).assertClose(1.694915254237288, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0080
     * @tc.name      NdkNotification_DialogTitleHeightAt_0080
     * @tc.desc      dialogTitleHeightAt(density=127) returns 0.7874015748031497
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0080 begin`);
      const actual: number = dialogTitleHeightAt(127);
      logInfo(`dialogTitleHeightAt(density=127): actual=${actual}`);
      expect(actual).assertClose(0.7874015748031497, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0081
     * @tc.name      NdkNotification_DialogTitleHeightAt_0081
     * @tc.desc      dialogTitleHeightAt(density=28.85) returns 3.4662045060658575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0081 begin`);
      const actual: number = dialogTitleHeightAt(28.85);
      logInfo(`dialogTitleHeightAt(density=28.85): actual=${actual}`);
      expect(actual).assertClose(3.4662045060658575, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0082
     * @tc.name      NdkNotification_DialogTitleHeightAt_0082
     * @tc.desc      dialogTitleHeightAt(density=139) returns 0.7194244604316546
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0082 begin`);
      const actual: number = dialogTitleHeightAt(139);
      logInfo(`dialogTitleHeightAt(density=139): actual=${actual}`);
      expect(actual).assertClose(0.7194244604316546, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0083
     * @tc.name      NdkNotification_DialogTitleHeightAt_0083
     * @tc.desc      dialogTitleHeightAt(density=41.89) returns 2.3872045834328
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0083 begin`);
      const actual: number = dialogTitleHeightAt(41.89);
      logInfo(`dialogTitleHeightAt(density=41.89): actual=${actual}`);
      expect(actual).assertClose(2.3872045834328, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0084
     * @tc.name      NdkNotification_DialogTitleHeightAt_0084
     * @tc.desc      dialogTitleHeightAt(density=189) returns 0.5291005291005291
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0084 begin`);
      const actual: number = dialogTitleHeightAt(189);
      logInfo(`dialogTitleHeightAt(density=189): actual=${actual}`);
      expect(actual).assertClose(0.5291005291005291, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0085
     * @tc.name      NdkNotification_DialogTitleHeightAt_0085
     * @tc.desc      dialogTitleHeightAt(density=44) returns 2.272727272727273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0085 begin`);
      const actual: number = dialogTitleHeightAt(44);
      logInfo(`dialogTitleHeightAt(density=44): actual=${actual}`);
      expect(actual).assertClose(2.272727272727273, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0086
     * @tc.name      NdkNotification_DialogTitleHeightAt_0086
     * @tc.desc      dialogTitleHeightAt(density=141) returns 0.7092198581560284
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0086 begin`);
      const actual: number = dialogTitleHeightAt(141);
      logInfo(`dialogTitleHeightAt(density=141): actual=${actual}`);
      expect(actual).assertClose(0.7092198581560284, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0087
     * @tc.name      NdkNotification_DialogTitleHeightAt_0087
     * @tc.desc      dialogTitleHeightAt(density=26) returns 3.8461538461538463
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0087 begin`);
      const actual: number = dialogTitleHeightAt(26);
      logInfo(`dialogTitleHeightAt(density=26): actual=${actual}`);
      expect(actual).assertClose(3.8461538461538463, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0088
     * @tc.name      NdkNotification_DialogTitleHeightAt_0088
     * @tc.desc      dialogTitleHeightAt(density=39.25) returns 2.5477707006369426
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0088 begin`);
      const actual: number = dialogTitleHeightAt(39.25);
      logInfo(`dialogTitleHeightAt(density=39.25): actual=${actual}`);
      expect(actual).assertClose(2.5477707006369426, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0089
     * @tc.name      NdkNotification_DialogTitleHeightAt_0089
     * @tc.desc      dialogTitleHeightAt(density=192) returns 0.5208333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0089 begin`);
      const actual: number = dialogTitleHeightAt(192);
      logInfo(`dialogTitleHeightAt(density=192): actual=${actual}`);
      expect(actual).assertClose(0.5208333333333334, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0090
     * @tc.name      NdkNotification_DialogTitleHeightAt_0090
     * @tc.desc      dialogTitleHeightAt(density=72) returns 1.3888888888888888
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0090 begin`);
      const actual: number = dialogTitleHeightAt(72);
      logInfo(`dialogTitleHeightAt(density=72): actual=${actual}`);
      expect(actual).assertClose(1.3888888888888888, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0091
     * @tc.name      NdkNotification_DialogTitleHeightAt_0091
     * @tc.desc      dialogTitleHeightAt(density=71.56) returns 1.397428731134712
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0091 begin`);
      const actual: number = dialogTitleHeightAt(71.56);
      logInfo(`dialogTitleHeightAt(density=71.56): actual=${actual}`);
      expect(actual).assertClose(1.397428731134712, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0092
     * @tc.name      NdkNotification_DialogTitleHeightAt_0092
     * @tc.desc      dialogTitleHeightAt(density=80.74) returns 1.238543472875898
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0092 begin`);
      const actual: number = dialogTitleHeightAt(80.74);
      logInfo(`dialogTitleHeightAt(density=80.74): actual=${actual}`);
      expect(actual).assertClose(1.238543472875898, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0093
     * @tc.name      NdkNotification_DialogTitleHeightAt_0093
     * @tc.desc      dialogTitleHeightAt(density=10.5) returns 9.523809523809524
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0093 begin`);
      const actual: number = dialogTitleHeightAt(10.5);
      logInfo(`dialogTitleHeightAt(density=10.5): actual=${actual}`);
      expect(actual).assertClose(9.523809523809524, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0094
     * @tc.name      NdkNotification_DialogTitleHeightAt_0094
     * @tc.desc      dialogTitleHeightAt(density=98) returns 1.0204081632653061
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTitleHeightAt_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0094 begin`);
      const actual: number = dialogTitleHeightAt(98);
      logInfo(`dialogTitleHeightAt(density=98): actual=${actual}`);
      expect(actual).assertClose(1.0204081632653061, PRECISION);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0095
     * @tc.name      NdkNotification_DialogTitleHeightAt_0095
     * @tc.desc      dialogTitleHeightAt(density=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0095 begin`);
      const actual: number = dialogTitleHeightAt(-1);
      logInfo(`dialogTitleHeightAt(density=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0096
     * @tc.name      NdkNotification_DialogTitleHeightAt_0096
     * @tc.desc      dialogTitleHeightAt(density=-3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0096 begin`);
      const actual: number = dialogTitleHeightAt(-3);
      logInfo(`dialogTitleHeightAt(density=-3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0096 end`);
    });
  });
}
