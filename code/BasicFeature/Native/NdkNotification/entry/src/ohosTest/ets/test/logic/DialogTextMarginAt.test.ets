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
import { dialogTextMarginAt } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for dialogTextMarginAt (96 cases). */
export default function dialogTextMarginAtTest(): void {
  describe('DialogTextMarginAtTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0001
     * @tc.name      NdkNotification_DialogTextMarginAt_0001
     * @tc.desc      dialogTextMarginAt(density=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_DialogTextMarginAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0001 begin`);
      const actual: number = dialogTextMarginAt(0);
      logInfo(`dialogTextMarginAt(density=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0002
     * @tc.name      NdkNotification_DialogTextMarginAt_0002
     * @tc.desc      dialogTextMarginAt(density=1) returns 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_DialogTextMarginAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0002 begin`);
      const actual: number = dialogTextMarginAt(1);
      logInfo(`dialogTextMarginAt(density=1): actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}DialogTextMarginAt_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0003
     * @tc.name      NdkNotification_DialogTextMarginAt_0003
     * @tc.desc      dialogTextMarginAt(density=2) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0003 begin`);
      const actual: number = dialogTextMarginAt(2);
      logInfo(`dialogTextMarginAt(density=2): actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}DialogTextMarginAt_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0004
     * @tc.name      NdkNotification_DialogTextMarginAt_0004
     * @tc.desc      dialogTextMarginAt(density=3) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0004 begin`);
      const actual: number = dialogTextMarginAt(3);
      logInfo(`dialogTextMarginAt(density=3): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}DialogTextMarginAt_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0005
     * @tc.name      NdkNotification_DialogTextMarginAt_0005
     * @tc.desc      dialogTextMarginAt(density=10) returns 8.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0005 begin`);
      const actual: number = dialogTextMarginAt(10);
      logInfo(`dialogTextMarginAt(density=10): actual=${actual}`);
      expect(actual).assertClose(8.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0006
     * @tc.name      NdkNotification_DialogTextMarginAt_0006
     * @tc.desc      dialogTextMarginAt(density=100) returns 0.84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0006 begin`);
      const actual: number = dialogTextMarginAt(100);
      logInfo(`dialogTextMarginAt(density=100): actual=${actual}`);
      expect(actual).assertClose(0.84, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0007
     * @tc.name      NdkNotification_DialogTextMarginAt_0007
     * @tc.desc      dialogTextMarginAt(density=5) returns 16.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0007 begin`);
      const actual: number = dialogTextMarginAt(5);
      logInfo(`dialogTextMarginAt(density=5): actual=${actual}`);
      expect(actual).assertClose(16.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0008
     * @tc.name      NdkNotification_DialogTextMarginAt_0008
     * @tc.desc      dialogTextMarginAt(density=15) returns 5.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0008 begin`);
      const actual: number = dialogTextMarginAt(15);
      logInfo(`dialogTextMarginAt(density=15): actual=${actual}`);
      expect(actual).assertClose(5.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0009
     * @tc.name      NdkNotification_DialogTextMarginAt_0009
     * @tc.desc      dialogTextMarginAt(density=20) returns 4.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0009 begin`);
      const actual: number = dialogTextMarginAt(20);
      logInfo(`dialogTextMarginAt(density=20): actual=${actual}`);
      expect(actual).assertClose(4.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0010
     * @tc.name      NdkNotification_DialogTextMarginAt_0010
     * @tc.desc      dialogTextMarginAt(density=25) returns 3.36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0010 begin`);
      const actual: number = dialogTextMarginAt(25);
      logInfo(`dialogTextMarginAt(density=25): actual=${actual}`);
      expect(actual).assertClose(3.36, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0011
     * @tc.name      NdkNotification_DialogTextMarginAt_0011
     * @tc.desc      dialogTextMarginAt(density=30) returns 2.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0011 begin`);
      const actual: number = dialogTextMarginAt(30);
      logInfo(`dialogTextMarginAt(density=30): actual=${actual}`);
      expect(actual).assertClose(2.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0012
     * @tc.name      NdkNotification_DialogTextMarginAt_0012
     * @tc.desc      dialogTextMarginAt(density=35) returns 2.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0012 begin`);
      const actual: number = dialogTextMarginAt(35);
      logInfo(`dialogTextMarginAt(density=35): actual=${actual}`);
      expect(actual).assertClose(2.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0013
     * @tc.name      NdkNotification_DialogTextMarginAt_0013
     * @tc.desc      dialogTextMarginAt(density=40) returns 2.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0013 begin`);
      const actual: number = dialogTextMarginAt(40);
      logInfo(`dialogTextMarginAt(density=40): actual=${actual}`);
      expect(actual).assertClose(2.1, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0014
     * @tc.name      NdkNotification_DialogTextMarginAt_0014
     * @tc.desc      dialogTextMarginAt(density=45) returns 1.8666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0014 begin`);
      const actual: number = dialogTextMarginAt(45);
      logInfo(`dialogTextMarginAt(density=45): actual=${actual}`);
      expect(actual).assertClose(1.8666666666666667, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0015
     * @tc.name      NdkNotification_DialogTextMarginAt_0015
     * @tc.desc      dialogTextMarginAt(density=50) returns 1.68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0015 begin`);
      const actual: number = dialogTextMarginAt(50);
      logInfo(`dialogTextMarginAt(density=50): actual=${actual}`);
      expect(actual).assertClose(1.68, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0016
     * @tc.name      NdkNotification_DialogTextMarginAt_0016
     * @tc.desc      dialogTextMarginAt(density=55) returns 1.5272727272727273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0016 begin`);
      const actual: number = dialogTextMarginAt(55);
      logInfo(`dialogTextMarginAt(density=55): actual=${actual}`);
      expect(actual).assertClose(1.5272727272727273, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0017
     * @tc.name      NdkNotification_DialogTextMarginAt_0017
     * @tc.desc      dialogTextMarginAt(density=60) returns 1.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0017 begin`);
      const actual: number = dialogTextMarginAt(60);
      logInfo(`dialogTextMarginAt(density=60): actual=${actual}`);
      expect(actual).assertClose(1.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0018
     * @tc.name      NdkNotification_DialogTextMarginAt_0018
     * @tc.desc      dialogTextMarginAt(density=65) returns 1.2923076923076924
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0018 begin`);
      const actual: number = dialogTextMarginAt(65);
      logInfo(`dialogTextMarginAt(density=65): actual=${actual}`);
      expect(actual).assertClose(1.2923076923076924, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0019
     * @tc.name      NdkNotification_DialogTextMarginAt_0019
     * @tc.desc      dialogTextMarginAt(density=70) returns 1.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0019 begin`);
      const actual: number = dialogTextMarginAt(70);
      logInfo(`dialogTextMarginAt(density=70): actual=${actual}`);
      expect(actual).assertClose(1.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0020
     * @tc.name      NdkNotification_DialogTextMarginAt_0020
     * @tc.desc      dialogTextMarginAt(density=75) returns 1.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0020 begin`);
      const actual: number = dialogTextMarginAt(75);
      logInfo(`dialogTextMarginAt(density=75): actual=${actual}`);
      expect(actual).assertClose(1.12, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0021
     * @tc.name      NdkNotification_DialogTextMarginAt_0021
     * @tc.desc      dialogTextMarginAt(density=80) returns 1.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0021 begin`);
      const actual: number = dialogTextMarginAt(80);
      logInfo(`dialogTextMarginAt(density=80): actual=${actual}`);
      expect(actual).assertClose(1.05, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0022
     * @tc.name      NdkNotification_DialogTextMarginAt_0022
     * @tc.desc      dialogTextMarginAt(density=85) returns 0.9882352941176471
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0022 begin`);
      const actual: number = dialogTextMarginAt(85);
      logInfo(`dialogTextMarginAt(density=85): actual=${actual}`);
      expect(actual).assertClose(0.9882352941176471, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0023
     * @tc.name      NdkNotification_DialogTextMarginAt_0023
     * @tc.desc      dialogTextMarginAt(density=90) returns 0.9333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0023 begin`);
      const actual: number = dialogTextMarginAt(90);
      logInfo(`dialogTextMarginAt(density=90): actual=${actual}`);
      expect(actual).assertClose(0.9333333333333333, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0024
     * @tc.name      NdkNotification_DialogTextMarginAt_0024
     * @tc.desc      dialogTextMarginAt(density=95) returns 0.8842105263157894
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0024 begin`);
      const actual: number = dialogTextMarginAt(95);
      logInfo(`dialogTextMarginAt(density=95): actual=${actual}`);
      expect(actual).assertClose(0.8842105263157894, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0025
     * @tc.name      NdkNotification_DialogTextMarginAt_0025
     * @tc.desc      dialogTextMarginAt(density=105) returns 0.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0025 begin`);
      const actual: number = dialogTextMarginAt(105);
      logInfo(`dialogTextMarginAt(density=105): actual=${actual}`);
      expect(actual).assertClose(0.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0026
     * @tc.name      NdkNotification_DialogTextMarginAt_0026
     * @tc.desc      dialogTextMarginAt(density=110) returns 0.7636363636363637
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0026 begin`);
      const actual: number = dialogTextMarginAt(110);
      logInfo(`dialogTextMarginAt(density=110): actual=${actual}`);
      expect(actual).assertClose(0.7636363636363637, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0027
     * @tc.name      NdkNotification_DialogTextMarginAt_0027
     * @tc.desc      dialogTextMarginAt(density=115) returns 0.7304347826086957
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0027 begin`);
      const actual: number = dialogTextMarginAt(115);
      logInfo(`dialogTextMarginAt(density=115): actual=${actual}`);
      expect(actual).assertClose(0.7304347826086957, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0028
     * @tc.name      NdkNotification_DialogTextMarginAt_0028
     * @tc.desc      dialogTextMarginAt(density=120) returns 0.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0028 begin`);
      const actual: number = dialogTextMarginAt(120);
      logInfo(`dialogTextMarginAt(density=120): actual=${actual}`);
      expect(actual).assertClose(0.7, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0029
     * @tc.name      NdkNotification_DialogTextMarginAt_0029
     * @tc.desc      dialogTextMarginAt(density=125) returns 0.672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0029 begin`);
      const actual: number = dialogTextMarginAt(125);
      logInfo(`dialogTextMarginAt(density=125): actual=${actual}`);
      expect(actual).assertClose(0.672, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0030
     * @tc.name      NdkNotification_DialogTextMarginAt_0030
     * @tc.desc      dialogTextMarginAt(density=130) returns 0.6461538461538462
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0030 begin`);
      const actual: number = dialogTextMarginAt(130);
      logInfo(`dialogTextMarginAt(density=130): actual=${actual}`);
      expect(actual).assertClose(0.6461538461538462, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0031
     * @tc.name      NdkNotification_DialogTextMarginAt_0031
     * @tc.desc      dialogTextMarginAt(density=135) returns 0.6222222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0031 begin`);
      const actual: number = dialogTextMarginAt(135);
      logInfo(`dialogTextMarginAt(density=135): actual=${actual}`);
      expect(actual).assertClose(0.6222222222222222, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0032
     * @tc.name      NdkNotification_DialogTextMarginAt_0032
     * @tc.desc      dialogTextMarginAt(density=140) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0032 begin`);
      const actual: number = dialogTextMarginAt(140);
      logInfo(`dialogTextMarginAt(density=140): actual=${actual}`);
      expect(actual).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0033
     * @tc.name      NdkNotification_DialogTextMarginAt_0033
     * @tc.desc      dialogTextMarginAt(density=145) returns 0.5793103448275863
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0033 begin`);
      const actual: number = dialogTextMarginAt(145);
      logInfo(`dialogTextMarginAt(density=145): actual=${actual}`);
      expect(actual).assertClose(0.5793103448275863, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0034
     * @tc.name      NdkNotification_DialogTextMarginAt_0034
     * @tc.desc      dialogTextMarginAt(density=150) returns 0.56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0034 begin`);
      const actual: number = dialogTextMarginAt(150);
      logInfo(`dialogTextMarginAt(density=150): actual=${actual}`);
      expect(actual).assertClose(0.56, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0035
     * @tc.name      NdkNotification_DialogTextMarginAt_0035
     * @tc.desc      dialogTextMarginAt(density=155) returns 0.5419354838709678
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0035 begin`);
      const actual: number = dialogTextMarginAt(155);
      logInfo(`dialogTextMarginAt(density=155): actual=${actual}`);
      expect(actual).assertClose(0.5419354838709678, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0036
     * @tc.name      NdkNotification_DialogTextMarginAt_0036
     * @tc.desc      dialogTextMarginAt(density=160) returns 0.525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0036 begin`);
      const actual: number = dialogTextMarginAt(160);
      logInfo(`dialogTextMarginAt(density=160): actual=${actual}`);
      expect(actual).assertClose(0.525, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0037
     * @tc.name      NdkNotification_DialogTextMarginAt_0037
     * @tc.desc      dialogTextMarginAt(density=165) returns 0.509090909090909
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0037 begin`);
      const actual: number = dialogTextMarginAt(165);
      logInfo(`dialogTextMarginAt(density=165): actual=${actual}`);
      expect(actual).assertClose(0.509090909090909, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0038
     * @tc.name      NdkNotification_DialogTextMarginAt_0038
     * @tc.desc      dialogTextMarginAt(density=170) returns 0.49411764705882355
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0038 begin`);
      const actual: number = dialogTextMarginAt(170);
      logInfo(`dialogTextMarginAt(density=170): actual=${actual}`);
      expect(actual).assertClose(0.49411764705882355, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0039
     * @tc.name      NdkNotification_DialogTextMarginAt_0039
     * @tc.desc      dialogTextMarginAt(density=175) returns 0.48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0039 begin`);
      const actual: number = dialogTextMarginAt(175);
      logInfo(`dialogTextMarginAt(density=175): actual=${actual}`);
      expect(actual).assertClose(0.48, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0040
     * @tc.name      NdkNotification_DialogTextMarginAt_0040
     * @tc.desc      dialogTextMarginAt(density=180) returns 0.4666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0040 begin`);
      const actual: number = dialogTextMarginAt(180);
      logInfo(`dialogTextMarginAt(density=180): actual=${actual}`);
      expect(actual).assertClose(0.4666666666666667, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0041
     * @tc.name      NdkNotification_DialogTextMarginAt_0041
     * @tc.desc      dialogTextMarginAt(density=185) returns 0.4540540540540541
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0041 begin`);
      const actual: number = dialogTextMarginAt(185);
      logInfo(`dialogTextMarginAt(density=185): actual=${actual}`);
      expect(actual).assertClose(0.4540540540540541, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0042
     * @tc.name      NdkNotification_DialogTextMarginAt_0042
     * @tc.desc      dialogTextMarginAt(density=190) returns 0.4421052631578947
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0042 begin`);
      const actual: number = dialogTextMarginAt(190);
      logInfo(`dialogTextMarginAt(density=190): actual=${actual}`);
      expect(actual).assertClose(0.4421052631578947, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0043
     * @tc.name      NdkNotification_DialogTextMarginAt_0043
     * @tc.desc      dialogTextMarginAt(density=195) returns 0.4307692307692308
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0043 begin`);
      const actual: number = dialogTextMarginAt(195);
      logInfo(`dialogTextMarginAt(density=195): actual=${actual}`);
      expect(actual).assertClose(0.4307692307692308, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0044
     * @tc.name      NdkNotification_DialogTextMarginAt_0044
     * @tc.desc      dialogTextMarginAt(density=200) returns 0.42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0044 begin`);
      const actual: number = dialogTextMarginAt(200);
      logInfo(`dialogTextMarginAt(density=200): actual=${actual}`);
      expect(actual).assertClose(0.42, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0045
     * @tc.name      NdkNotification_DialogTextMarginAt_0045
     * @tc.desc      dialogTextMarginAt(density=59.28) returns 1.417004048582996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0045 begin`);
      const actual: number = dialogTextMarginAt(59.28);
      logInfo(`dialogTextMarginAt(density=59.28): actual=${actual}`);
      expect(actual).assertClose(1.417004048582996, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0046
     * @tc.name      NdkNotification_DialogTextMarginAt_0046
     * @tc.desc      dialogTextMarginAt(density=159) returns 0.5283018867924528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0046 begin`);
      const actual: number = dialogTextMarginAt(159);
      logInfo(`dialogTextMarginAt(density=159): actual=${actual}`);
      expect(actual).assertClose(0.5283018867924528, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0047
     * @tc.name      NdkNotification_DialogTextMarginAt_0047
     * @tc.desc      dialogTextMarginAt(density=28.7) returns 2.926829268292683
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0047 begin`);
      const actual: number = dialogTextMarginAt(28.7);
      logInfo(`dialogTextMarginAt(density=28.7): actual=${actual}`);
      expect(actual).assertClose(2.926829268292683, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0048
     * @tc.name      NdkNotification_DialogTextMarginAt_0048
     * @tc.desc      dialogTextMarginAt(density=88) returns 0.9545454545454546
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0048 begin`);
      const actual: number = dialogTextMarginAt(88);
      logInfo(`dialogTextMarginAt(density=88): actual=${actual}`);
      expect(actual).assertClose(0.9545454545454546, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0049
     * @tc.name      NdkNotification_DialogTextMarginAt_0049
     * @tc.desc      dialogTextMarginAt(density=157) returns 0.535031847133758
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0049 begin`);
      const actual: number = dialogTextMarginAt(157);
      logInfo(`dialogTextMarginAt(density=157): actual=${actual}`);
      expect(actual).assertClose(0.535031847133758, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0050
     * @tc.name      NdkNotification_DialogTextMarginAt_0050
     * @tc.desc      dialogTextMarginAt(density=29) returns 2.896551724137931
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0050 begin`);
      const actual: number = dialogTextMarginAt(29);
      logInfo(`dialogTextMarginAt(density=29): actual=${actual}`);
      expect(actual).assertClose(2.896551724137931, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0051
     * @tc.name      NdkNotification_DialogTextMarginAt_0051
     * @tc.desc      dialogTextMarginAt(density=154) returns 0.5454545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0051 begin`);
      const actual: number = dialogTextMarginAt(154);
      logInfo(`dialogTextMarginAt(density=154): actual=${actual}`);
      expect(actual).assertClose(0.5454545454545454, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0052
     * @tc.name      NdkNotification_DialogTextMarginAt_0052
     * @tc.desc      dialogTextMarginAt(density=156) returns 0.5384615384615384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0052 begin`);
      const actual: number = dialogTextMarginAt(156);
      logInfo(`dialogTextMarginAt(density=156): actual=${actual}`);
      expect(actual).assertClose(0.5384615384615384, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0053
     * @tc.name      NdkNotification_DialogTextMarginAt_0053
     * @tc.desc      dialogTextMarginAt(density=84) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0053 begin`);
      const actual: number = dialogTextMarginAt(84);
      logInfo(`dialogTextMarginAt(density=84): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DialogTextMarginAt_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0054
     * @tc.name      NdkNotification_DialogTextMarginAt_0054
     * @tc.desc      dialogTextMarginAt(density=119) returns 0.7058823529411765
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0054 begin`);
      const actual: number = dialogTextMarginAt(119);
      logInfo(`dialogTextMarginAt(density=119): actual=${actual}`);
      expect(actual).assertClose(0.7058823529411765, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0055
     * @tc.name      NdkNotification_DialogTextMarginAt_0055
     * @tc.desc      dialogTextMarginAt(density=57) returns 1.4736842105263157
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0055 begin`);
      const actual: number = dialogTextMarginAt(57);
      logInfo(`dialogTextMarginAt(density=57): actual=${actual}`);
      expect(actual).assertClose(1.4736842105263157, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0056
     * @tc.name      NdkNotification_DialogTextMarginAt_0056
     * @tc.desc      dialogTextMarginAt(density=142) returns 0.5915492957746479
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0056 begin`);
      const actual: number = dialogTextMarginAt(142);
      logInfo(`dialogTextMarginAt(density=142): actual=${actual}`);
      expect(actual).assertClose(0.5915492957746479, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0057
     * @tc.name      NdkNotification_DialogTextMarginAt_0057
     * @tc.desc      dialogTextMarginAt(density=98.36) returns 0.8540056933712892
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0057 begin`);
      const actual: number = dialogTextMarginAt(98.36);
      logInfo(`dialogTextMarginAt(density=98.36): actual=${actual}`);
      expect(actual).assertClose(0.8540056933712892, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0058
     * @tc.name      NdkNotification_DialogTextMarginAt_0058
     * @tc.desc      dialogTextMarginAt(density=63) returns 1.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0058 begin`);
      const actual: number = dialogTextMarginAt(63);
      logInfo(`dialogTextMarginAt(density=63): actual=${actual}`);
      expect(actual).assertClose(1.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0059
     * @tc.name      NdkNotification_DialogTextMarginAt_0059
     * @tc.desc      dialogTextMarginAt(density=177) returns 0.4745762711864407
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0059 begin`);
      const actual: number = dialogTextMarginAt(177);
      logInfo(`dialogTextMarginAt(density=177): actual=${actual}`);
      expect(actual).assertClose(0.4745762711864407, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0060
     * @tc.name      NdkNotification_DialogTextMarginAt_0060
     * @tc.desc      dialogTextMarginAt(density=196) returns 0.42857142857142855
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0060 begin`);
      const actual: number = dialogTextMarginAt(196);
      logInfo(`dialogTextMarginAt(density=196): actual=${actual}`);
      expect(actual).assertClose(0.42857142857142855, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0061
     * @tc.name      NdkNotification_DialogTextMarginAt_0061
     * @tc.desc      dialogTextMarginAt(density=87.67) returns 0.9581384738222881
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0061 begin`);
      const actual: number = dialogTextMarginAt(87.67);
      logInfo(`dialogTextMarginAt(density=87.67): actual=${actual}`);
      expect(actual).assertClose(0.9581384738222881, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0062
     * @tc.name      NdkNotification_DialogTextMarginAt_0062
     * @tc.desc      dialogTextMarginAt(density=42.15) returns 1.99288256227758
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0062 begin`);
      const actual: number = dialogTextMarginAt(42.15);
      logInfo(`dialogTextMarginAt(density=42.15): actual=${actual}`);
      expect(actual).assertClose(1.99288256227758, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0063
     * @tc.name      NdkNotification_DialogTextMarginAt_0063
     * @tc.desc      dialogTextMarginAt(density=118) returns 0.711864406779661
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0063 begin`);
      const actual: number = dialogTextMarginAt(118);
      logInfo(`dialogTextMarginAt(density=118): actual=${actual}`);
      expect(actual).assertClose(0.711864406779661, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0064
     * @tc.name      NdkNotification_DialogTextMarginAt_0064
     * @tc.desc      dialogTextMarginAt(density=83) returns 1.0120481927710843
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0064 begin`);
      const actual: number = dialogTextMarginAt(83);
      logInfo(`dialogTextMarginAt(density=83): actual=${actual}`);
      expect(actual).assertClose(1.0120481927710843, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0065
     * @tc.name      NdkNotification_DialogTextMarginAt_0065
     * @tc.desc      dialogTextMarginAt(density=9) returns 9.333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0065 begin`);
      const actual: number = dialogTextMarginAt(9);
      logInfo(`dialogTextMarginAt(density=9): actual=${actual}`);
      expect(actual).assertClose(9.333333333333334, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0066
     * @tc.name      NdkNotification_DialogTextMarginAt_0066
     * @tc.desc      dialogTextMarginAt(density=40.98) returns 2.0497803806734995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0066 begin`);
      const actual: number = dialogTextMarginAt(40.98);
      logInfo(`dialogTextMarginAt(density=40.98): actual=${actual}`);
      expect(actual).assertClose(2.0497803806734995, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0067
     * @tc.name      NdkNotification_DialogTextMarginAt_0067
     * @tc.desc      dialogTextMarginAt(density=70.54) returns 1.1908137227105187
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0067 begin`);
      const actual: number = dialogTextMarginAt(70.54);
      logInfo(`dialogTextMarginAt(density=70.54): actual=${actual}`);
      expect(actual).assertClose(1.1908137227105187, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0068
     * @tc.name      NdkNotification_DialogTextMarginAt_0068
     * @tc.desc      dialogTextMarginAt(density=92.23) returns 0.910766561856229
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0068 begin`);
      const actual: number = dialogTextMarginAt(92.23);
      logInfo(`dialogTextMarginAt(density=92.23): actual=${actual}`);
      expect(actual).assertClose(0.910766561856229, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0069
     * @tc.name      NdkNotification_DialogTextMarginAt_0069
     * @tc.desc      dialogTextMarginAt(density=128) returns 0.65625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0069 begin`);
      const actual: number = dialogTextMarginAt(128);
      logInfo(`dialogTextMarginAt(density=128): actual=${actual}`);
      expect(actual).assertClose(0.65625, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0070
     * @tc.name      NdkNotification_DialogTextMarginAt_0070
     * @tc.desc      dialogTextMarginAt(density=106) returns 0.7924528301886793
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0070 begin`);
      const actual: number = dialogTextMarginAt(106);
      logInfo(`dialogTextMarginAt(density=106): actual=${actual}`);
      expect(actual).assertClose(0.7924528301886793, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0071
     * @tc.name      NdkNotification_DialogTextMarginAt_0071
     * @tc.desc      dialogTextMarginAt(density=2.82) returns 29.787234042553195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0071 begin`);
      const actual: number = dialogTextMarginAt(2.82);
      logInfo(`dialogTextMarginAt(density=2.82): actual=${actual}`);
      expect(actual).assertClose(29.787234042553195, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0072
     * @tc.name      NdkNotification_DialogTextMarginAt_0072
     * @tc.desc      dialogTextMarginAt(density=122) returns 0.6885245901639344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0072 begin`);
      const actual: number = dialogTextMarginAt(122);
      logInfo(`dialogTextMarginAt(density=122): actual=${actual}`);
      expect(actual).assertClose(0.6885245901639344, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0073
     * @tc.name      NdkNotification_DialogTextMarginAt_0073
     * @tc.desc      dialogTextMarginAt(density=55.82) returns 1.5048369759942672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0073 begin`);
      const actual: number = dialogTextMarginAt(55.82);
      logInfo(`dialogTextMarginAt(density=55.82): actual=${actual}`);
      expect(actual).assertClose(1.5048369759942672, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0074
     * @tc.name      NdkNotification_DialogTextMarginAt_0074
     * @tc.desc      dialogTextMarginAt(density=31.88) returns 2.6348808030112925
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0074 begin`);
      const actual: number = dialogTextMarginAt(31.88);
      logInfo(`dialogTextMarginAt(density=31.88): actual=${actual}`);
      expect(actual).assertClose(2.6348808030112925, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0075
     * @tc.name      NdkNotification_DialogTextMarginAt_0075
     * @tc.desc      dialogTextMarginAt(density=26.72) returns 3.1437125748502996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0075 begin`);
      const actual: number = dialogTextMarginAt(26.72);
      logInfo(`dialogTextMarginAt(density=26.72): actual=${actual}`);
      expect(actual).assertClose(3.1437125748502996, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0076
     * @tc.name      NdkNotification_DialogTextMarginAt_0076
     * @tc.desc      dialogTextMarginAt(density=134) returns 0.6268656716417911
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0076 begin`);
      const actual: number = dialogTextMarginAt(134);
      logInfo(`dialogTextMarginAt(density=134): actual=${actual}`);
      expect(actual).assertClose(0.6268656716417911, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0077
     * @tc.name      NdkNotification_DialogTextMarginAt_0077
     * @tc.desc      dialogTextMarginAt(density=76.56) returns 1.09717868338558
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0077 begin`);
      const actual: number = dialogTextMarginAt(76.56);
      logInfo(`dialogTextMarginAt(density=76.56): actual=${actual}`);
      expect(actual).assertClose(1.09717868338558, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0078
     * @tc.name      NdkNotification_DialogTextMarginAt_0078
     * @tc.desc      dialogTextMarginAt(density=95.6) returns 0.8786610878661089
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0078 begin`);
      const actual: number = dialogTextMarginAt(95.6);
      logInfo(`dialogTextMarginAt(density=95.6): actual=${actual}`);
      expect(actual).assertClose(0.8786610878661089, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0079
     * @tc.name      NdkNotification_DialogTextMarginAt_0079
     * @tc.desc      dialogTextMarginAt(density=10.98) returns 7.6502732240437155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0079 begin`);
      const actual: number = dialogTextMarginAt(10.98);
      logInfo(`dialogTextMarginAt(density=10.98): actual=${actual}`);
      expect(actual).assertClose(7.6502732240437155, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0080
     * @tc.name      NdkNotification_DialogTextMarginAt_0080
     * @tc.desc      dialogTextMarginAt(density=39.49) returns 2.127120790073436
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0080 begin`);
      const actual: number = dialogTextMarginAt(39.49);
      logInfo(`dialogTextMarginAt(density=39.49): actual=${actual}`);
      expect(actual).assertClose(2.127120790073436, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0081
     * @tc.name      NdkNotification_DialogTextMarginAt_0081
     * @tc.desc      dialogTextMarginAt(density=101) returns 0.8316831683168316
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0081 begin`);
      const actual: number = dialogTextMarginAt(101);
      logInfo(`dialogTextMarginAt(density=101): actual=${actual}`);
      expect(actual).assertClose(0.8316831683168316, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0082
     * @tc.name      NdkNotification_DialogTextMarginAt_0082
     * @tc.desc      dialogTextMarginAt(density=71) returns 1.1830985915492958
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0082 begin`);
      const actual: number = dialogTextMarginAt(71);
      logInfo(`dialogTextMarginAt(density=71): actual=${actual}`);
      expect(actual).assertClose(1.1830985915492958, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0083
     * @tc.name      NdkNotification_DialogTextMarginAt_0083
     * @tc.desc      dialogTextMarginAt(density=24.3) returns 3.45679012345679
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0083 begin`);
      const actual: number = dialogTextMarginAt(24.3);
      logInfo(`dialogTextMarginAt(density=24.3): actual=${actual}`);
      expect(actual).assertClose(3.45679012345679, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0084
     * @tc.name      NdkNotification_DialogTextMarginAt_0084
     * @tc.desc      dialogTextMarginAt(density=127) returns 0.6614173228346457
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0084 begin`);
      const actual: number = dialogTextMarginAt(127);
      logInfo(`dialogTextMarginAt(density=127): actual=${actual}`);
      expect(actual).assertClose(0.6614173228346457, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0085
     * @tc.name      NdkNotification_DialogTextMarginAt_0085
     * @tc.desc      dialogTextMarginAt(density=32) returns 2.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0085 begin`);
      const actual: number = dialogTextMarginAt(32);
      logInfo(`dialogTextMarginAt(density=32): actual=${actual}`);
      expect(actual).assertClose(2.625, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0086
     * @tc.name      NdkNotification_DialogTextMarginAt_0086
     * @tc.desc      dialogTextMarginAt(density=29.37) returns 2.860061287027579
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0086 begin`);
      const actual: number = dialogTextMarginAt(29.37);
      logInfo(`dialogTextMarginAt(density=29.37): actual=${actual}`);
      expect(actual).assertClose(2.860061287027579, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0087
     * @tc.name      NdkNotification_DialogTextMarginAt_0087
     * @tc.desc      dialogTextMarginAt(density=149) returns 0.5637583892617449
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0087 begin`);
      const actual: number = dialogTextMarginAt(149);
      logInfo(`dialogTextMarginAt(density=149): actual=${actual}`);
      expect(actual).assertClose(0.5637583892617449, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0088
     * @tc.name      NdkNotification_DialogTextMarginAt_0088
     * @tc.desc      dialogTextMarginAt(density=76.5) returns 1.0980392156862746
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0088 begin`);
      const actual: number = dialogTextMarginAt(76.5);
      logInfo(`dialogTextMarginAt(density=76.5): actual=${actual}`);
      expect(actual).assertClose(1.0980392156862746, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0089
     * @tc.name      NdkNotification_DialogTextMarginAt_0089
     * @tc.desc      dialogTextMarginAt(density=197) returns 0.4263959390862944
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0089 begin`);
      const actual: number = dialogTextMarginAt(197);
      logInfo(`dialogTextMarginAt(density=197): actual=${actual}`);
      expect(actual).assertClose(0.4263959390862944, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0090
     * @tc.name      NdkNotification_DialogTextMarginAt_0090
     * @tc.desc      dialogTextMarginAt(density=126) returns 0.6666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0090 begin`);
      const actual: number = dialogTextMarginAt(126);
      logInfo(`dialogTextMarginAt(density=126): actual=${actual}`);
      expect(actual).assertClose(0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0091
     * @tc.name      NdkNotification_DialogTextMarginAt_0091
     * @tc.desc      dialogTextMarginAt(density=73.46) returns 1.1434794445956984
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0091 begin`);
      const actual: number = dialogTextMarginAt(73.46);
      logInfo(`dialogTextMarginAt(density=73.46): actual=${actual}`);
      expect(actual).assertClose(1.1434794445956984, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0092
     * @tc.name      NdkNotification_DialogTextMarginAt_0092
     * @tc.desc      dialogTextMarginAt(density=33.77) returns 2.487414865265028
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0092 begin`);
      const actual: number = dialogTextMarginAt(33.77);
      logInfo(`dialogTextMarginAt(density=33.77): actual=${actual}`);
      expect(actual).assertClose(2.487414865265028, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0093
     * @tc.name      NdkNotification_DialogTextMarginAt_0093
     * @tc.desc      dialogTextMarginAt(density=51) returns 1.6470588235294117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0093 begin`);
      const actual: number = dialogTextMarginAt(51);
      logInfo(`dialogTextMarginAt(density=51): actual=${actual}`);
      expect(actual).assertClose(1.6470588235294117, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0094
     * @tc.name      NdkNotification_DialogTextMarginAt_0094
     * @tc.desc      dialogTextMarginAt(density=15.85) returns 5.299684542586751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0094 begin`);
      const actual: number = dialogTextMarginAt(15.85);
      logInfo(`dialogTextMarginAt(density=15.85): actual=${actual}`);
      expect(actual).assertClose(5.299684542586751, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0095
     * @tc.name      NdkNotification_DialogTextMarginAt_0095
     * @tc.desc      dialogTextMarginAt(density=158) returns 0.5316455696202531
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0095 begin`);
      const actual: number = dialogTextMarginAt(158);
      logInfo(`dialogTextMarginAt(density=158): actual=${actual}`);
      expect(actual).assertClose(0.5316455696202531, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0096
     * @tc.name      NdkNotification_DialogTextMarginAt_0096
     * @tc.desc      dialogTextMarginAt(density=66.76) returns 1.2582384661473935
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextMarginAt_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0096 begin`);
      const actual: number = dialogTextMarginAt(66.76);
      logInfo(`dialogTextMarginAt(density=66.76): actual=${actual}`);
      expect(actual).assertClose(1.2582384661473935, PRECISION);
      logInfo(`${BUNDLE}DialogTextMarginAt_0096 end`);
    });
  });
}
