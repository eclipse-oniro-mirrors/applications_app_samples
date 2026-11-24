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
import { titleAreaHeightAt } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for titleAreaHeightAt (96 cases). */
export default function titleAreaHeightAtTest(): void {
  describe('TitleAreaHeightAtTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0001
     * @tc.name      NdkNotification_TitleAreaHeightAt_0001
     * @tc.desc      titleAreaHeightAt(density=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_TitleAreaHeightAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0001 begin`);
      const actual: number = titleAreaHeightAt(0);
      logInfo(`titleAreaHeightAt(density=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0002
     * @tc.name      NdkNotification_TitleAreaHeightAt_0002
     * @tc.desc      titleAreaHeightAt(density=1) returns 280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_TitleAreaHeightAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0002 begin`);
      const actual: number = titleAreaHeightAt(1);
      logInfo(`titleAreaHeightAt(density=1): actual=${actual}`);
      expect(actual).assertEqual(280);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0003
     * @tc.name      NdkNotification_TitleAreaHeightAt_0003
     * @tc.desc      titleAreaHeightAt(density=2) returns 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0003 begin`);
      const actual: number = titleAreaHeightAt(2);
      logInfo(`titleAreaHeightAt(density=2): actual=${actual}`);
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0004
     * @tc.name      NdkNotification_TitleAreaHeightAt_0004
     * @tc.desc      titleAreaHeightAt(density=3) returns 93.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0004 begin`);
      const actual: number = titleAreaHeightAt(3);
      logInfo(`titleAreaHeightAt(density=3): actual=${actual}`);
      expect(actual).assertClose(93.33333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0005
     * @tc.name      NdkNotification_TitleAreaHeightAt_0005
     * @tc.desc      titleAreaHeightAt(density=10) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0005 begin`);
      const actual: number = titleAreaHeightAt(10);
      logInfo(`titleAreaHeightAt(density=10): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0006
     * @tc.name      NdkNotification_TitleAreaHeightAt_0006
     * @tc.desc      titleAreaHeightAt(density=100) returns 2.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0006 begin`);
      const actual: number = titleAreaHeightAt(100);
      logInfo(`titleAreaHeightAt(density=100): actual=${actual}`);
      expect(actual).assertClose(2.8, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0007
     * @tc.name      NdkNotification_TitleAreaHeightAt_0007
     * @tc.desc      titleAreaHeightAt(density=5) returns 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0007 begin`);
      const actual: number = titleAreaHeightAt(5);
      logInfo(`titleAreaHeightAt(density=5): actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0008
     * @tc.name      NdkNotification_TitleAreaHeightAt_0008
     * @tc.desc      titleAreaHeightAt(density=15) returns 18.666666666666668
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0008 begin`);
      const actual: number = titleAreaHeightAt(15);
      logInfo(`titleAreaHeightAt(density=15): actual=${actual}`);
      expect(actual).assertClose(18.666666666666668, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0009
     * @tc.name      NdkNotification_TitleAreaHeightAt_0009
     * @tc.desc      titleAreaHeightAt(density=20) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0009 begin`);
      const actual: number = titleAreaHeightAt(20);
      logInfo(`titleAreaHeightAt(density=20): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0010
     * @tc.name      NdkNotification_TitleAreaHeightAt_0010
     * @tc.desc      titleAreaHeightAt(density=25) returns 11.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0010 begin`);
      const actual: number = titleAreaHeightAt(25);
      logInfo(`titleAreaHeightAt(density=25): actual=${actual}`);
      expect(actual).assertClose(11.2, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0011
     * @tc.name      NdkNotification_TitleAreaHeightAt_0011
     * @tc.desc      titleAreaHeightAt(density=30) returns 9.333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0011 begin`);
      const actual: number = titleAreaHeightAt(30);
      logInfo(`titleAreaHeightAt(density=30): actual=${actual}`);
      expect(actual).assertClose(9.333333333333334, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0012
     * @tc.name      NdkNotification_TitleAreaHeightAt_0012
     * @tc.desc      titleAreaHeightAt(density=35) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0012 begin`);
      const actual: number = titleAreaHeightAt(35);
      logInfo(`titleAreaHeightAt(density=35): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0013
     * @tc.name      NdkNotification_TitleAreaHeightAt_0013
     * @tc.desc      titleAreaHeightAt(density=40) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0013 begin`);
      const actual: number = titleAreaHeightAt(40);
      logInfo(`titleAreaHeightAt(density=40): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0014
     * @tc.name      NdkNotification_TitleAreaHeightAt_0014
     * @tc.desc      titleAreaHeightAt(density=45) returns 6.222222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0014 begin`);
      const actual: number = titleAreaHeightAt(45);
      logInfo(`titleAreaHeightAt(density=45): actual=${actual}`);
      expect(actual).assertClose(6.222222222222222, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0015
     * @tc.name      NdkNotification_TitleAreaHeightAt_0015
     * @tc.desc      titleAreaHeightAt(density=50) returns 5.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0015 begin`);
      const actual: number = titleAreaHeightAt(50);
      logInfo(`titleAreaHeightAt(density=50): actual=${actual}`);
      expect(actual).assertClose(5.6, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0016
     * @tc.name      NdkNotification_TitleAreaHeightAt_0016
     * @tc.desc      titleAreaHeightAt(density=55) returns 5.090909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0016 begin`);
      const actual: number = titleAreaHeightAt(55);
      logInfo(`titleAreaHeightAt(density=55): actual=${actual}`);
      expect(actual).assertClose(5.090909090909091, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0017
     * @tc.name      NdkNotification_TitleAreaHeightAt_0017
     * @tc.desc      titleAreaHeightAt(density=60) returns 4.666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0017 begin`);
      const actual: number = titleAreaHeightAt(60);
      logInfo(`titleAreaHeightAt(density=60): actual=${actual}`);
      expect(actual).assertClose(4.666666666666667, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0018
     * @tc.name      NdkNotification_TitleAreaHeightAt_0018
     * @tc.desc      titleAreaHeightAt(density=65) returns 4.3076923076923075
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0018 begin`);
      const actual: number = titleAreaHeightAt(65);
      logInfo(`titleAreaHeightAt(density=65): actual=${actual}`);
      expect(actual).assertClose(4.3076923076923075, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0019
     * @tc.name      NdkNotification_TitleAreaHeightAt_0019
     * @tc.desc      titleAreaHeightAt(density=70) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0019 begin`);
      const actual: number = titleAreaHeightAt(70);
      logInfo(`titleAreaHeightAt(density=70): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0020
     * @tc.name      NdkNotification_TitleAreaHeightAt_0020
     * @tc.desc      titleAreaHeightAt(density=75) returns 3.7333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0020 begin`);
      const actual: number = titleAreaHeightAt(75);
      logInfo(`titleAreaHeightAt(density=75): actual=${actual}`);
      expect(actual).assertClose(3.7333333333333334, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0021
     * @tc.name      NdkNotification_TitleAreaHeightAt_0021
     * @tc.desc      titleAreaHeightAt(density=80) returns 3.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0021 begin`);
      const actual: number = titleAreaHeightAt(80);
      logInfo(`titleAreaHeightAt(density=80): actual=${actual}`);
      expect(actual).assertClose(3.5, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0022
     * @tc.name      NdkNotification_TitleAreaHeightAt_0022
     * @tc.desc      titleAreaHeightAt(density=85) returns 3.2941176470588234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0022 begin`);
      const actual: number = titleAreaHeightAt(85);
      logInfo(`titleAreaHeightAt(density=85): actual=${actual}`);
      expect(actual).assertClose(3.2941176470588234, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0023
     * @tc.name      NdkNotification_TitleAreaHeightAt_0023
     * @tc.desc      titleAreaHeightAt(density=90) returns 3.111111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0023 begin`);
      const actual: number = titleAreaHeightAt(90);
      logInfo(`titleAreaHeightAt(density=90): actual=${actual}`);
      expect(actual).assertClose(3.111111111111111, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0024
     * @tc.name      NdkNotification_TitleAreaHeightAt_0024
     * @tc.desc      titleAreaHeightAt(density=95) returns 2.9473684210526314
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0024 begin`);
      const actual: number = titleAreaHeightAt(95);
      logInfo(`titleAreaHeightAt(density=95): actual=${actual}`);
      expect(actual).assertClose(2.9473684210526314, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0025
     * @tc.name      NdkNotification_TitleAreaHeightAt_0025
     * @tc.desc      titleAreaHeightAt(density=105) returns 2.6666666666666665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0025 begin`);
      const actual: number = titleAreaHeightAt(105);
      logInfo(`titleAreaHeightAt(density=105): actual=${actual}`);
      expect(actual).assertClose(2.6666666666666665, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0026
     * @tc.name      NdkNotification_TitleAreaHeightAt_0026
     * @tc.desc      titleAreaHeightAt(density=110) returns 2.5454545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0026 begin`);
      const actual: number = titleAreaHeightAt(110);
      logInfo(`titleAreaHeightAt(density=110): actual=${actual}`);
      expect(actual).assertClose(2.5454545454545454, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0027
     * @tc.name      NdkNotification_TitleAreaHeightAt_0027
     * @tc.desc      titleAreaHeightAt(density=115) returns 2.4347826086956523
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0027 begin`);
      const actual: number = titleAreaHeightAt(115);
      logInfo(`titleAreaHeightAt(density=115): actual=${actual}`);
      expect(actual).assertClose(2.4347826086956523, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0028
     * @tc.name      NdkNotification_TitleAreaHeightAt_0028
     * @tc.desc      titleAreaHeightAt(density=120) returns 2.3333333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0028 begin`);
      const actual: number = titleAreaHeightAt(120);
      logInfo(`titleAreaHeightAt(density=120): actual=${actual}`);
      expect(actual).assertClose(2.3333333333333335, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0029
     * @tc.name      NdkNotification_TitleAreaHeightAt_0029
     * @tc.desc      titleAreaHeightAt(density=125) returns 2.24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0029 begin`);
      const actual: number = titleAreaHeightAt(125);
      logInfo(`titleAreaHeightAt(density=125): actual=${actual}`);
      expect(actual).assertClose(2.24, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0030
     * @tc.name      NdkNotification_TitleAreaHeightAt_0030
     * @tc.desc      titleAreaHeightAt(density=130) returns 2.1538461538461537
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0030 begin`);
      const actual: number = titleAreaHeightAt(130);
      logInfo(`titleAreaHeightAt(density=130): actual=${actual}`);
      expect(actual).assertClose(2.1538461538461537, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0031
     * @tc.name      NdkNotification_TitleAreaHeightAt_0031
     * @tc.desc      titleAreaHeightAt(density=135) returns 2.074074074074074
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0031 begin`);
      const actual: number = titleAreaHeightAt(135);
      logInfo(`titleAreaHeightAt(density=135): actual=${actual}`);
      expect(actual).assertClose(2.074074074074074, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0032
     * @tc.name      NdkNotification_TitleAreaHeightAt_0032
     * @tc.desc      titleAreaHeightAt(density=140) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0032 begin`);
      const actual: number = titleAreaHeightAt(140);
      logInfo(`titleAreaHeightAt(density=140): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0033
     * @tc.name      NdkNotification_TitleAreaHeightAt_0033
     * @tc.desc      titleAreaHeightAt(density=145) returns 1.9310344827586208
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0033 begin`);
      const actual: number = titleAreaHeightAt(145);
      logInfo(`titleAreaHeightAt(density=145): actual=${actual}`);
      expect(actual).assertClose(1.9310344827586208, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0034
     * @tc.name      NdkNotification_TitleAreaHeightAt_0034
     * @tc.desc      titleAreaHeightAt(density=150) returns 1.8666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0034 begin`);
      const actual: number = titleAreaHeightAt(150);
      logInfo(`titleAreaHeightAt(density=150): actual=${actual}`);
      expect(actual).assertClose(1.8666666666666667, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0035
     * @tc.name      NdkNotification_TitleAreaHeightAt_0035
     * @tc.desc      titleAreaHeightAt(density=155) returns 1.8064516129032258
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0035 begin`);
      const actual: number = titleAreaHeightAt(155);
      logInfo(`titleAreaHeightAt(density=155): actual=${actual}`);
      expect(actual).assertClose(1.8064516129032258, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0036
     * @tc.name      NdkNotification_TitleAreaHeightAt_0036
     * @tc.desc      titleAreaHeightAt(density=160) returns 1.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0036 begin`);
      const actual: number = titleAreaHeightAt(160);
      logInfo(`titleAreaHeightAt(density=160): actual=${actual}`);
      expect(actual).assertClose(1.75, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0037
     * @tc.name      NdkNotification_TitleAreaHeightAt_0037
     * @tc.desc      titleAreaHeightAt(density=165) returns 1.696969696969697
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0037 begin`);
      const actual: number = titleAreaHeightAt(165);
      logInfo(`titleAreaHeightAt(density=165): actual=${actual}`);
      expect(actual).assertClose(1.696969696969697, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0038
     * @tc.name      NdkNotification_TitleAreaHeightAt_0038
     * @tc.desc      titleAreaHeightAt(density=170) returns 1.6470588235294117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0038 begin`);
      const actual: number = titleAreaHeightAt(170);
      logInfo(`titleAreaHeightAt(density=170): actual=${actual}`);
      expect(actual).assertClose(1.6470588235294117, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0039
     * @tc.name      NdkNotification_TitleAreaHeightAt_0039
     * @tc.desc      titleAreaHeightAt(density=175) returns 1.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0039 begin`);
      const actual: number = titleAreaHeightAt(175);
      logInfo(`titleAreaHeightAt(density=175): actual=${actual}`);
      expect(actual).assertClose(1.6, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0040
     * @tc.name      NdkNotification_TitleAreaHeightAt_0040
     * @tc.desc      titleAreaHeightAt(density=180) returns 1.5555555555555556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0040 begin`);
      const actual: number = titleAreaHeightAt(180);
      logInfo(`titleAreaHeightAt(density=180): actual=${actual}`);
      expect(actual).assertClose(1.5555555555555556, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0041
     * @tc.name      NdkNotification_TitleAreaHeightAt_0041
     * @tc.desc      titleAreaHeightAt(density=185) returns 1.5135135135135136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0041 begin`);
      const actual: number = titleAreaHeightAt(185);
      logInfo(`titleAreaHeightAt(density=185): actual=${actual}`);
      expect(actual).assertClose(1.5135135135135136, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0042
     * @tc.name      NdkNotification_TitleAreaHeightAt_0042
     * @tc.desc      titleAreaHeightAt(density=190) returns 1.4736842105263157
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0042 begin`);
      const actual: number = titleAreaHeightAt(190);
      logInfo(`titleAreaHeightAt(density=190): actual=${actual}`);
      expect(actual).assertClose(1.4736842105263157, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0043
     * @tc.name      NdkNotification_TitleAreaHeightAt_0043
     * @tc.desc      titleAreaHeightAt(density=195) returns 1.435897435897436
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0043 begin`);
      const actual: number = titleAreaHeightAt(195);
      logInfo(`titleAreaHeightAt(density=195): actual=${actual}`);
      expect(actual).assertClose(1.435897435897436, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0044
     * @tc.name      NdkNotification_TitleAreaHeightAt_0044
     * @tc.desc      titleAreaHeightAt(density=200) returns 1.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0044 begin`);
      const actual: number = titleAreaHeightAt(200);
      logInfo(`titleAreaHeightAt(density=200): actual=${actual}`);
      expect(actual).assertClose(1.4, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0045
     * @tc.name      NdkNotification_TitleAreaHeightAt_0045
     * @tc.desc      titleAreaHeightAt(density=199) returns 1.407035175879397
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0045 begin`);
      const actual: number = titleAreaHeightAt(199);
      logInfo(`titleAreaHeightAt(density=199): actual=${actual}`);
      expect(actual).assertClose(1.407035175879397, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0046
     * @tc.name      NdkNotification_TitleAreaHeightAt_0046
     * @tc.desc      titleAreaHeightAt(density=97.14) returns 2.882437718756434
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0046 begin`);
      const actual: number = titleAreaHeightAt(97.14);
      logInfo(`titleAreaHeightAt(density=97.14): actual=${actual}`);
      expect(actual).assertClose(2.882437718756434, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0047
     * @tc.name      NdkNotification_TitleAreaHeightAt_0047
     * @tc.desc      titleAreaHeightAt(density=51.19) returns 5.469818323891385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0047 begin`);
      const actual: number = titleAreaHeightAt(51.19);
      logInfo(`titleAreaHeightAt(density=51.19): actual=${actual}`);
      expect(actual).assertClose(5.469818323891385, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0048
     * @tc.name      NdkNotification_TitleAreaHeightAt_0048
     * @tc.desc      titleAreaHeightAt(density=139) returns 2.014388489208633
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0048 begin`);
      const actual: number = titleAreaHeightAt(139);
      logInfo(`titleAreaHeightAt(density=139): actual=${actual}`);
      expect(actual).assertClose(2.014388489208633, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0049
     * @tc.name      NdkNotification_TitleAreaHeightAt_0049
     * @tc.desc      titleAreaHeightAt(density=88) returns 3.1818181818181817
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0049 begin`);
      const actual: number = titleAreaHeightAt(88);
      logInfo(`titleAreaHeightAt(density=88): actual=${actual}`);
      expect(actual).assertClose(3.1818181818181817, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0050
     * @tc.name      NdkNotification_TitleAreaHeightAt_0050
     * @tc.desc      titleAreaHeightAt(density=47.04) returns 5.9523809523809526
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0050 begin`);
      const actual: number = titleAreaHeightAt(47.04);
      logInfo(`titleAreaHeightAt(density=47.04): actual=${actual}`);
      expect(actual).assertClose(5.9523809523809526, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0051
     * @tc.name      NdkNotification_TitleAreaHeightAt_0051
     * @tc.desc      titleAreaHeightAt(density=72.64) returns 3.854625550660793
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0051 begin`);
      const actual: number = titleAreaHeightAt(72.64);
      logInfo(`titleAreaHeightAt(density=72.64): actual=${actual}`);
      expect(actual).assertClose(3.854625550660793, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0052
     * @tc.name      NdkNotification_TitleAreaHeightAt_0052
     * @tc.desc      titleAreaHeightAt(density=162) returns 1.728395061728395
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0052 begin`);
      const actual: number = titleAreaHeightAt(162);
      logInfo(`titleAreaHeightAt(density=162): actual=${actual}`);
      expect(actual).assertClose(1.728395061728395, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0053
     * @tc.name      NdkNotification_TitleAreaHeightAt_0053
     * @tc.desc      titleAreaHeightAt(density=31.15) returns 8.98876404494382
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0053 begin`);
      const actual: number = titleAreaHeightAt(31.15);
      logInfo(`titleAreaHeightAt(density=31.15): actual=${actual}`);
      expect(actual).assertClose(8.98876404494382, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0054
     * @tc.name      NdkNotification_TitleAreaHeightAt_0054
     * @tc.desc      titleAreaHeightAt(density=149) returns 1.8791946308724832
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0054 begin`);
      const actual: number = titleAreaHeightAt(149);
      logInfo(`titleAreaHeightAt(density=149): actual=${actual}`);
      expect(actual).assertClose(1.8791946308724832, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0055
     * @tc.name      NdkNotification_TitleAreaHeightAt_0055
     * @tc.desc      titleAreaHeightAt(density=86) returns 3.255813953488372
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0055 begin`);
      const actual: number = titleAreaHeightAt(86);
      logInfo(`titleAreaHeightAt(density=86): actual=${actual}`);
      expect(actual).assertClose(3.255813953488372, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0056
     * @tc.name      NdkNotification_TitleAreaHeightAt_0056
     * @tc.desc      titleAreaHeightAt(density=39) returns 7.17948717948718
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0056 begin`);
      const actual: number = titleAreaHeightAt(39);
      logInfo(`titleAreaHeightAt(density=39): actual=${actual}`);
      expect(actual).assertClose(7.17948717948718, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0057
     * @tc.name      NdkNotification_TitleAreaHeightAt_0057
     * @tc.desc      titleAreaHeightAt(density=13.1) returns 21.37404580152672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0057 begin`);
      const actual: number = titleAreaHeightAt(13.1);
      logInfo(`titleAreaHeightAt(density=13.1): actual=${actual}`);
      expect(actual).assertClose(21.37404580152672, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0058
     * @tc.name      NdkNotification_TitleAreaHeightAt_0058
     * @tc.desc      titleAreaHeightAt(density=152) returns 1.8421052631578947
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0058 begin`);
      const actual: number = titleAreaHeightAt(152);
      logInfo(`titleAreaHeightAt(density=152): actual=${actual}`);
      expect(actual).assertClose(1.8421052631578947, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0059
     * @tc.name      NdkNotification_TitleAreaHeightAt_0059
     * @tc.desc      titleAreaHeightAt(density=147) returns 1.9047619047619047
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0059 begin`);
      const actual: number = titleAreaHeightAt(147);
      logInfo(`titleAreaHeightAt(density=147): actual=${actual}`);
      expect(actual).assertClose(1.9047619047619047, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0060
     * @tc.name      NdkNotification_TitleAreaHeightAt_0060
     * @tc.desc      titleAreaHeightAt(density=136) returns 2.0588235294117645
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0060 begin`);
      const actual: number = titleAreaHeightAt(136);
      logInfo(`titleAreaHeightAt(density=136): actual=${actual}`);
      expect(actual).assertClose(2.0588235294117645, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0061
     * @tc.name      NdkNotification_TitleAreaHeightAt_0061
     * @tc.desc      titleAreaHeightAt(density=59.79) returns 4.683057367452752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0061 begin`);
      const actual: number = titleAreaHeightAt(59.79);
      logInfo(`titleAreaHeightAt(density=59.79): actual=${actual}`);
      expect(actual).assertClose(4.683057367452752, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0062
     * @tc.name      NdkNotification_TitleAreaHeightAt_0062
     * @tc.desc      titleAreaHeightAt(density=23) returns 12.173913043478262
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0062 begin`);
      const actual: number = titleAreaHeightAt(23);
      logInfo(`titleAreaHeightAt(density=23): actual=${actual}`);
      expect(actual).assertClose(12.173913043478262, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0063
     * @tc.name      NdkNotification_TitleAreaHeightAt_0063
     * @tc.desc      titleAreaHeightAt(density=60.32) returns 4.641909814323608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0063 begin`);
      const actual: number = titleAreaHeightAt(60.32);
      logInfo(`titleAreaHeightAt(density=60.32): actual=${actual}`);
      expect(actual).assertClose(4.641909814323608, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0064
     * @tc.name      NdkNotification_TitleAreaHeightAt_0064
     * @tc.desc      titleAreaHeightAt(density=98) returns 2.857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0064 begin`);
      const actual: number = titleAreaHeightAt(98);
      logInfo(`titleAreaHeightAt(density=98): actual=${actual}`);
      expect(actual).assertClose(2.857142857142857, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0065
     * @tc.name      NdkNotification_TitleAreaHeightAt_0065
     * @tc.desc      titleAreaHeightAt(density=72) returns 3.888888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0065 begin`);
      const actual: number = titleAreaHeightAt(72);
      logInfo(`titleAreaHeightAt(density=72): actual=${actual}`);
      expect(actual).assertClose(3.888888888888889, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0066
     * @tc.name      NdkNotification_TitleAreaHeightAt_0066
     * @tc.desc      titleAreaHeightAt(density=13) returns 21.53846153846154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0066 begin`);
      const actual: number = titleAreaHeightAt(13);
      logInfo(`titleAreaHeightAt(density=13): actual=${actual}`);
      expect(actual).assertClose(21.53846153846154, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0067
     * @tc.name      NdkNotification_TitleAreaHeightAt_0067
     * @tc.desc      titleAreaHeightAt(density=79) returns 3.5443037974683542
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0067 begin`);
      const actual: number = titleAreaHeightAt(79);
      logInfo(`titleAreaHeightAt(density=79): actual=${actual}`);
      expect(actual).assertClose(3.5443037974683542, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0068
     * @tc.name      NdkNotification_TitleAreaHeightAt_0068
     * @tc.desc      titleAreaHeightAt(density=26.44) returns 10.59001512859304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0068 begin`);
      const actual: number = titleAreaHeightAt(26.44);
      logInfo(`titleAreaHeightAt(density=26.44): actual=${actual}`);
      expect(actual).assertClose(10.59001512859304, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0069
     * @tc.name      NdkNotification_TitleAreaHeightAt_0069
     * @tc.desc      titleAreaHeightAt(density=146) returns 1.917808219178082
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0069 begin`);
      const actual: number = titleAreaHeightAt(146);
      logInfo(`titleAreaHeightAt(density=146): actual=${actual}`);
      expect(actual).assertClose(1.917808219178082, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0070
     * @tc.name      NdkNotification_TitleAreaHeightAt_0070
     * @tc.desc      titleAreaHeightAt(density=18) returns 15.555555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0070 begin`);
      const actual: number = titleAreaHeightAt(18);
      logInfo(`titleAreaHeightAt(density=18): actual=${actual}`);
      expect(actual).assertClose(15.555555555555555, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0071
     * @tc.name      NdkNotification_TitleAreaHeightAt_0071
     * @tc.desc      titleAreaHeightAt(density=36) returns 7.777777777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0071 begin`);
      const actual: number = titleAreaHeightAt(36);
      logInfo(`titleAreaHeightAt(density=36): actual=${actual}`);
      expect(actual).assertClose(7.777777777777778, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0072
     * @tc.name      NdkNotification_TitleAreaHeightAt_0072
     * @tc.desc      titleAreaHeightAt(density=30.23) returns 9.26232219649355
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0072 begin`);
      const actual: number = titleAreaHeightAt(30.23);
      logInfo(`titleAreaHeightAt(density=30.23): actual=${actual}`);
      expect(actual).assertClose(9.26232219649355, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0073
     * @tc.name      NdkNotification_TitleAreaHeightAt_0073
     * @tc.desc      titleAreaHeightAt(density=86.54) returns 3.2354980355904783
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0073 begin`);
      const actual: number = titleAreaHeightAt(86.54);
      logInfo(`titleAreaHeightAt(density=86.54): actual=${actual}`);
      expect(actual).assertClose(3.2354980355904783, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0074
     * @tc.name      NdkNotification_TitleAreaHeightAt_0074
     * @tc.desc      titleAreaHeightAt(density=0.53) returns 528.3018867924528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0074 begin`);
      const actual: number = titleAreaHeightAt(0.53);
      logInfo(`titleAreaHeightAt(density=0.53): actual=${actual}`);
      expect(actual).assertClose(528.3018867924528, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0075
     * @tc.name      NdkNotification_TitleAreaHeightAt_0075
     * @tc.desc      titleAreaHeightAt(density=1.2) returns 233.33333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0075 begin`);
      const actual: number = titleAreaHeightAt(1.2);
      logInfo(`titleAreaHeightAt(density=1.2): actual=${actual}`);
      expect(actual).assertClose(233.33333333333334, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0076
     * @tc.name      NdkNotification_TitleAreaHeightAt_0076
     * @tc.desc      titleAreaHeightAt(density=11.38) returns 24.604569420035148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0076 begin`);
      const actual: number = titleAreaHeightAt(11.38);
      logInfo(`titleAreaHeightAt(density=11.38): actual=${actual}`);
      expect(actual).assertClose(24.604569420035148, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0077
     * @tc.name      NdkNotification_TitleAreaHeightAt_0077
     * @tc.desc      titleAreaHeightAt(density=101) returns 2.772277227722772
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0077 begin`);
      const actual: number = titleAreaHeightAt(101);
      logInfo(`titleAreaHeightAt(density=101): actual=${actual}`);
      expect(actual).assertClose(2.772277227722772, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0078
     * @tc.name      NdkNotification_TitleAreaHeightAt_0078
     * @tc.desc      titleAreaHeightAt(density=67) returns 4.17910447761194
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0078 begin`);
      const actual: number = titleAreaHeightAt(67);
      logInfo(`titleAreaHeightAt(density=67): actual=${actual}`);
      expect(actual).assertClose(4.17910447761194, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0079
     * @tc.name      NdkNotification_TitleAreaHeightAt_0079
     * @tc.desc      titleAreaHeightAt(density=59.41) returns 4.7130112775627
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0079 begin`);
      const actual: number = titleAreaHeightAt(59.41);
      logInfo(`titleAreaHeightAt(density=59.41): actual=${actual}`);
      expect(actual).assertClose(4.7130112775627, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0080
     * @tc.name      NdkNotification_TitleAreaHeightAt_0080
     * @tc.desc      titleAreaHeightAt(density=75.22) returns 3.722414251528849
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0080 begin`);
      const actual: number = titleAreaHeightAt(75.22);
      logInfo(`titleAreaHeightAt(density=75.22): actual=${actual}`);
      expect(actual).assertClose(3.722414251528849, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0081
     * @tc.name      NdkNotification_TitleAreaHeightAt_0081
     * @tc.desc      titleAreaHeightAt(density=6.18) returns 45.307443365695796
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0081 begin`);
      const actual: number = titleAreaHeightAt(6.18);
      logInfo(`titleAreaHeightAt(density=6.18): actual=${actual}`);
      expect(actual).assertClose(45.307443365695796, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0082
     * @tc.name      NdkNotification_TitleAreaHeightAt_0082
     * @tc.desc      titleAreaHeightAt(density=103) returns 2.7184466019417477
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0082 begin`);
      const actual: number = titleAreaHeightAt(103);
      logInfo(`titleAreaHeightAt(density=103): actual=${actual}`);
      expect(actual).assertClose(2.7184466019417477, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0083
     * @tc.name      NdkNotification_TitleAreaHeightAt_0083
     * @tc.desc      titleAreaHeightAt(density=174) returns 1.6091954022988506
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0083 begin`);
      const actual: number = titleAreaHeightAt(174);
      logInfo(`titleAreaHeightAt(density=174): actual=${actual}`);
      expect(actual).assertClose(1.6091954022988506, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0084
     * @tc.name      NdkNotification_TitleAreaHeightAt_0084
     * @tc.desc      titleAreaHeightAt(density=57.09) returns 4.904536696444211
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0084 begin`);
      const actual: number = titleAreaHeightAt(57.09);
      logInfo(`titleAreaHeightAt(density=57.09): actual=${actual}`);
      expect(actual).assertClose(4.904536696444211, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0085
     * @tc.name      NdkNotification_TitleAreaHeightAt_0085
     * @tc.desc      titleAreaHeightAt(density=4.17) returns 67.1462829736211
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0085 begin`);
      const actual: number = titleAreaHeightAt(4.17);
      logInfo(`titleAreaHeightAt(density=4.17): actual=${actual}`);
      expect(actual).assertClose(67.1462829736211, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0086
     * @tc.name      NdkNotification_TitleAreaHeightAt_0086
     * @tc.desc      titleAreaHeightAt(density=84) returns 3.3333333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0086 begin`);
      const actual: number = titleAreaHeightAt(84);
      logInfo(`titleAreaHeightAt(density=84): actual=${actual}`);
      expect(actual).assertClose(3.3333333333333335, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0087
     * @tc.name      NdkNotification_TitleAreaHeightAt_0087
     * @tc.desc      titleAreaHeightAt(density=173) returns 1.6184971098265897
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0087 begin`);
      const actual: number = titleAreaHeightAt(173);
      logInfo(`titleAreaHeightAt(density=173): actual=${actual}`);
      expect(actual).assertClose(1.6184971098265897, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0088
     * @tc.name      NdkNotification_TitleAreaHeightAt_0088
     * @tc.desc      titleAreaHeightAt(density=17.58) returns 15.927189988623438
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0088 begin`);
      const actual: number = titleAreaHeightAt(17.58);
      logInfo(`titleAreaHeightAt(density=17.58): actual=${actual}`);
      expect(actual).assertClose(15.927189988623438, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0089
     * @tc.name      NdkNotification_TitleAreaHeightAt_0089
     * @tc.desc      titleAreaHeightAt(density=52) returns 5.384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0089 begin`);
      const actual: number = titleAreaHeightAt(52);
      logInfo(`titleAreaHeightAt(density=52): actual=${actual}`);
      expect(actual).assertClose(5.384615384615385, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0090
     * @tc.name      NdkNotification_TitleAreaHeightAt_0090
     * @tc.desc      titleAreaHeightAt(density=32.92) returns 8.50546780072904
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0090 begin`);
      const actual: number = titleAreaHeightAt(32.92);
      logInfo(`titleAreaHeightAt(density=32.92): actual=${actual}`);
      expect(actual).assertClose(8.50546780072904, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0091
     * @tc.name      NdkNotification_TitleAreaHeightAt_0091
     * @tc.desc      titleAreaHeightAt(density=179) returns 1.5642458100558658
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0091 begin`);
      const actual: number = titleAreaHeightAt(179);
      logInfo(`titleAreaHeightAt(density=179): actual=${actual}`);
      expect(actual).assertClose(1.5642458100558658, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0092
     * @tc.name      NdkNotification_TitleAreaHeightAt_0092
     * @tc.desc      titleAreaHeightAt(density=59) returns 4.745762711864407
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0092 begin`);
      const actual: number = titleAreaHeightAt(59);
      logInfo(`titleAreaHeightAt(density=59): actual=${actual}`);
      expect(actual).assertClose(4.745762711864407, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0093
     * @tc.name      NdkNotification_TitleAreaHeightAt_0093
     * @tc.desc      titleAreaHeightAt(density=54) returns 5.185185185185185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0093 begin`);
      const actual: number = titleAreaHeightAt(54);
      logInfo(`titleAreaHeightAt(density=54): actual=${actual}`);
      expect(actual).assertClose(5.185185185185185, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0094
     * @tc.name      NdkNotification_TitleAreaHeightAt_0094
     * @tc.desc      titleAreaHeightAt(density=144) returns 1.9444444444444444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0094 begin`);
      const actual: number = titleAreaHeightAt(144);
      logInfo(`titleAreaHeightAt(density=144): actual=${actual}`);
      expect(actual).assertClose(1.9444444444444444, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0095
     * @tc.name      NdkNotification_TitleAreaHeightAt_0095
     * @tc.desc      titleAreaHeightAt(density=194) returns 1.443298969072165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0095 begin`);
      const actual: number = titleAreaHeightAt(194);
      logInfo(`titleAreaHeightAt(density=194): actual=${actual}`);
      expect(actual).assertClose(1.443298969072165, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0096
     * @tc.name      NdkNotification_TitleAreaHeightAt_0096
     * @tc.desc      titleAreaHeightAt(density=9) returns 31.11111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0096 begin`);
      const actual: number = titleAreaHeightAt(9);
      logInfo(`titleAreaHeightAt(density=9): actual=${actual}`);
      expect(actual).assertClose(31.11111111111111, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0096 end`);
    });
  });
}
