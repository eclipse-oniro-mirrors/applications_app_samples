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
import { isBoldWeight } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isBoldWeight (30 cases). */
export default function isBoldWeightTest(): void {
  describe('IsBoldWeightTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0001
     * @tc.name      NdkNotification_IsBoldWeight_0001
     * @tc.desc      isBoldWeight(weight=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_IsBoldWeight_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0001 begin`);
      const actual: boolean = isBoldWeight(0);
      logInfo(`isBoldWeight(weight=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0002
     * @tc.name      NdkNotification_IsBoldWeight_0002
     * @tc.desc      isBoldWeight(weight=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_IsBoldWeight_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0002 begin`);
      const actual: boolean = isBoldWeight(1);
      logInfo(`isBoldWeight(weight=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0003
     * @tc.name      NdkNotification_IsBoldWeight_0003
     * @tc.desc      isBoldWeight(weight=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_IsBoldWeight_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0003 begin`);
      const actual: boolean = isBoldWeight(-1);
      logInfo(`isBoldWeight(weight=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0004
     * @tc.name      NdkNotification_IsBoldWeight_0004
     * @tc.desc      isBoldWeight(weight=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0004 begin`);
      const actual: boolean = isBoldWeight(2);
      logInfo(`isBoldWeight(weight=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0005
     * @tc.name      NdkNotification_IsBoldWeight_0005
     * @tc.desc      isBoldWeight(weight=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0005 begin`);
      const actual: boolean = isBoldWeight(3);
      logInfo(`isBoldWeight(weight=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0006
     * @tc.name      NdkNotification_IsBoldWeight_0006
     * @tc.desc      isBoldWeight(weight=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0006 begin`);
      const actual: boolean = isBoldWeight(10);
      logInfo(`isBoldWeight(weight=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0007
     * @tc.name      NdkNotification_IsBoldWeight_0007
     * @tc.desc      isBoldWeight(weight=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0007 begin`);
      const actual: boolean = isBoldWeight(100);
      logInfo(`isBoldWeight(weight=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0008
     * @tc.name      NdkNotification_IsBoldWeight_0008
     * @tc.desc      isBoldWeight(weight=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0008 begin`);
      const actual: boolean = isBoldWeight(5);
      logInfo(`isBoldWeight(weight=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0009
     * @tc.name      NdkNotification_IsBoldWeight_0009
     * @tc.desc      isBoldWeight(weight=15) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0009 begin`);
      const actual: boolean = isBoldWeight(15);
      logInfo(`isBoldWeight(weight=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0010
     * @tc.name      NdkNotification_IsBoldWeight_0010
     * @tc.desc      isBoldWeight(weight=20) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0010 begin`);
      const actual: boolean = isBoldWeight(20);
      logInfo(`isBoldWeight(weight=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0011
     * @tc.name      NdkNotification_IsBoldWeight_0011
     * @tc.desc      isBoldWeight(weight=25) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0011 begin`);
      const actual: boolean = isBoldWeight(25);
      logInfo(`isBoldWeight(weight=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0012
     * @tc.name      NdkNotification_IsBoldWeight_0012
     * @tc.desc      isBoldWeight(weight=30) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0012 begin`);
      const actual: boolean = isBoldWeight(30);
      logInfo(`isBoldWeight(weight=30): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0013
     * @tc.name      NdkNotification_IsBoldWeight_0013
     * @tc.desc      isBoldWeight(weight=35) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0013 begin`);
      const actual: boolean = isBoldWeight(35);
      logInfo(`isBoldWeight(weight=35): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0014
     * @tc.name      NdkNotification_IsBoldWeight_0014
     * @tc.desc      isBoldWeight(weight=40) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0014 begin`);
      const actual: boolean = isBoldWeight(40);
      logInfo(`isBoldWeight(weight=40): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0015
     * @tc.name      NdkNotification_IsBoldWeight_0015
     * @tc.desc      isBoldWeight(weight=45) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0015 begin`);
      const actual: boolean = isBoldWeight(45);
      logInfo(`isBoldWeight(weight=45): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0016
     * @tc.name      NdkNotification_IsBoldWeight_0016
     * @tc.desc      isBoldWeight(weight=50) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0016 begin`);
      const actual: boolean = isBoldWeight(50);
      logInfo(`isBoldWeight(weight=50): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0017
     * @tc.name      NdkNotification_IsBoldWeight_0017
     * @tc.desc      isBoldWeight(weight=55) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0017 begin`);
      const actual: boolean = isBoldWeight(55);
      logInfo(`isBoldWeight(weight=55): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0018
     * @tc.name      NdkNotification_IsBoldWeight_0018
     * @tc.desc      isBoldWeight(weight=60) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0018 begin`);
      const actual: boolean = isBoldWeight(60);
      logInfo(`isBoldWeight(weight=60): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0019
     * @tc.name      NdkNotification_IsBoldWeight_0019
     * @tc.desc      isBoldWeight(weight=65) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0019 begin`);
      const actual: boolean = isBoldWeight(65);
      logInfo(`isBoldWeight(weight=65): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0020
     * @tc.name      NdkNotification_IsBoldWeight_0020
     * @tc.desc      isBoldWeight(weight=70) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0020 begin`);
      const actual: boolean = isBoldWeight(70);
      logInfo(`isBoldWeight(weight=70): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0021
     * @tc.name      NdkNotification_IsBoldWeight_0021
     * @tc.desc      isBoldWeight(weight=75) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0021 begin`);
      const actual: boolean = isBoldWeight(75);
      logInfo(`isBoldWeight(weight=75): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0022
     * @tc.name      NdkNotification_IsBoldWeight_0022
     * @tc.desc      isBoldWeight(weight=80) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0022 begin`);
      const actual: boolean = isBoldWeight(80);
      logInfo(`isBoldWeight(weight=80): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0023
     * @tc.name      NdkNotification_IsBoldWeight_0023
     * @tc.desc      isBoldWeight(weight=85) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0023 begin`);
      const actual: boolean = isBoldWeight(85);
      logInfo(`isBoldWeight(weight=85): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0024
     * @tc.name      NdkNotification_IsBoldWeight_0024
     * @tc.desc      isBoldWeight(weight=90) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0024 begin`);
      const actual: boolean = isBoldWeight(90);
      logInfo(`isBoldWeight(weight=90): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0025
     * @tc.name      NdkNotification_IsBoldWeight_0025
     * @tc.desc      isBoldWeight(weight=95) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0025 begin`);
      const actual: boolean = isBoldWeight(95);
      logInfo(`isBoldWeight(weight=95): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0026
     * @tc.name      NdkNotification_IsBoldWeight_0026
     * @tc.desc      isBoldWeight(weight=105) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0026 begin`);
      const actual: boolean = isBoldWeight(105);
      logInfo(`isBoldWeight(weight=105): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0027
     * @tc.name      NdkNotification_IsBoldWeight_0027
     * @tc.desc      isBoldWeight(weight=110) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0027 begin`);
      const actual: boolean = isBoldWeight(110);
      logInfo(`isBoldWeight(weight=110): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0028
     * @tc.name      NdkNotification_IsBoldWeight_0028
     * @tc.desc      isBoldWeight(weight=115) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0028 begin`);
      const actual: boolean = isBoldWeight(115);
      logInfo(`isBoldWeight(weight=115): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0029
     * @tc.name      NdkNotification_IsBoldWeight_0029
     * @tc.desc      isBoldWeight(weight=120) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0029 begin`);
      const actual: boolean = isBoldWeight(120);
      logInfo(`isBoldWeight(weight=120): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_IS_BOLD_WEIGHT_0030
     * @tc.name      NdkNotification_IsBoldWeight_0030
     * @tc.desc      isBoldWeight(weight=125) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_IsBoldWeight_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsBoldWeight_0030 begin`);
      const actual: boolean = isBoldWeight(125);
      logInfo(`isBoldWeight(weight=125): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsBoldWeight_0030 end`);
    });
  });
}
