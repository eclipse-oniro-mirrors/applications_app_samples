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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { updateIntervalMinutesOf } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for updateIntervalMinutesOf (96 cases). */
export default function updateIntervalMinutesOfTest(): void {
  describe('UpdateIntervalMinutesOfTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0001
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0001
     * @tc.desc      updateIntervalMinutesOf(updateDuration=1) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0001 begin`);
      const actual: number = updateIntervalMinutesOf(1);
      logInfo(`updateIntervalMinutesOf(updateDuration=1): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0002
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0002
     * @tc.desc      updateIntervalMinutesOf(updateDuration=15) returns 450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0002 begin`);
      const actual: number = updateIntervalMinutesOf(15);
      logInfo(`updateIntervalMinutesOf(updateDuration=15): actual=${actual}`);
      expect(actual).assertEqual(450);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0003
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0003
     * @tc.desc      updateIntervalMinutesOf(updateDuration=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0003 begin`);
      const actual: number = updateIntervalMinutesOf(0);
      logInfo(`updateIntervalMinutesOf(updateDuration=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0004
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0004
     * @tc.desc      updateIntervalMinutesOf(updateDuration=30) returns 900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0004 begin`);
      const actual: number = updateIntervalMinutesOf(30);
      logInfo(`updateIntervalMinutesOf(updateDuration=30): actual=${actual}`);
      expect(actual).assertEqual(900);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0005
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0005
     * @tc.desc      updateIntervalMinutesOf(updateDuration=29) returns 870
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0005 begin`);
      const actual: number = updateIntervalMinutesOf(29);
      logInfo(`updateIntervalMinutesOf(updateDuration=29): actual=${actual}`);
      expect(actual).assertEqual(870);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0006
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0006
     * @tc.desc      updateIntervalMinutesOf(updateDuration=31) returns 930
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0006 begin`);
      const actual: number = updateIntervalMinutesOf(31);
      logInfo(`updateIntervalMinutesOf(updateDuration=31): actual=${actual}`);
      expect(actual).assertEqual(930);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0007
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0007
     * @tc.desc      updateIntervalMinutesOf(updateDuration=60) returns 1800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0007 begin`);
      const actual: number = updateIntervalMinutesOf(60);
      logInfo(`updateIntervalMinutesOf(updateDuration=60): actual=${actual}`);
      expect(actual).assertEqual(1800);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0008
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0008
     * @tc.desc      updateIntervalMinutesOf(updateDuration=28) returns 840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0008 begin`);
      const actual: number = updateIntervalMinutesOf(28);
      logInfo(`updateIntervalMinutesOf(updateDuration=28): actual=${actual}`);
      expect(actual).assertEqual(840);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0009
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0009
     * @tc.desc      updateIntervalMinutesOf(updateDuration=2) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0009 begin`);
      const actual: number = updateIntervalMinutesOf(2);
      logInfo(`updateIntervalMinutesOf(updateDuration=2): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0010
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0010
     * @tc.desc      updateIntervalMinutesOf(updateDuration=3) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0010 begin`);
      const actual: number = updateIntervalMinutesOf(3);
      logInfo(`updateIntervalMinutesOf(updateDuration=3): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0011
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0011
     * @tc.desc      updateIntervalMinutesOf(updateDuration=10) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0011 begin`);
      const actual: number = updateIntervalMinutesOf(10);
      logInfo(`updateIntervalMinutesOf(updateDuration=10): actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0012
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0012
     * @tc.desc      updateIntervalMinutesOf(updateDuration=100) returns 3000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0012 begin`);
      const actual: number = updateIntervalMinutesOf(100);
      logInfo(`updateIntervalMinutesOf(updateDuration=100): actual=${actual}`);
      expect(actual).assertEqual(3000);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0013
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0013
     * @tc.desc      updateIntervalMinutesOf(updateDuration=5) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0013 begin`);
      const actual: number = updateIntervalMinutesOf(5);
      logInfo(`updateIntervalMinutesOf(updateDuration=5): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0014
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0014
     * @tc.desc      updateIntervalMinutesOf(updateDuration=20) returns 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0014 begin`);
      const actual: number = updateIntervalMinutesOf(20);
      logInfo(`updateIntervalMinutesOf(updateDuration=20): actual=${actual}`);
      expect(actual).assertEqual(600);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0014 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0015
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0015
     * @tc.desc      updateIntervalMinutesOf(updateDuration=25) returns 750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0015 begin`);
      const actual: number = updateIntervalMinutesOf(25);
      logInfo(`updateIntervalMinutesOf(updateDuration=25): actual=${actual}`);
      expect(actual).assertEqual(750);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0015 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0016
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0016
     * @tc.desc      updateIntervalMinutesOf(updateDuration=35) returns 1050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0016 begin`);
      const actual: number = updateIntervalMinutesOf(35);
      logInfo(`updateIntervalMinutesOf(updateDuration=35): actual=${actual}`);
      expect(actual).assertEqual(1050);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0016 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0017
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0017
     * @tc.desc      updateIntervalMinutesOf(updateDuration=40) returns 1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0017 begin`);
      const actual: number = updateIntervalMinutesOf(40);
      logInfo(`updateIntervalMinutesOf(updateDuration=40): actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0017 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0018
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0018
     * @tc.desc      updateIntervalMinutesOf(updateDuration=45) returns 1350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0018 begin`);
      const actual: number = updateIntervalMinutesOf(45);
      logInfo(`updateIntervalMinutesOf(updateDuration=45): actual=${actual}`);
      expect(actual).assertEqual(1350);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0018 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0019
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0019
     * @tc.desc      updateIntervalMinutesOf(updateDuration=50) returns 1500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0019 begin`);
      const actual: number = updateIntervalMinutesOf(50);
      logInfo(`updateIntervalMinutesOf(updateDuration=50): actual=${actual}`);
      expect(actual).assertEqual(1500);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0019 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0020
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0020
     * @tc.desc      updateIntervalMinutesOf(updateDuration=55) returns 1650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0020 begin`);
      const actual: number = updateIntervalMinutesOf(55);
      logInfo(`updateIntervalMinutesOf(updateDuration=55): actual=${actual}`);
      expect(actual).assertEqual(1650);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0020 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0021
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0021
     * @tc.desc      updateIntervalMinutesOf(updateDuration=65) returns 1950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0021 begin`);
      const actual: number = updateIntervalMinutesOf(65);
      logInfo(`updateIntervalMinutesOf(updateDuration=65): actual=${actual}`);
      expect(actual).assertEqual(1950);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0021 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0022
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0022
     * @tc.desc      updateIntervalMinutesOf(updateDuration=70) returns 2100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0022 begin`);
      const actual: number = updateIntervalMinutesOf(70);
      logInfo(`updateIntervalMinutesOf(updateDuration=70): actual=${actual}`);
      expect(actual).assertEqual(2100);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0022 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0023
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0023
     * @tc.desc      updateIntervalMinutesOf(updateDuration=75) returns 2250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0023 begin`);
      const actual: number = updateIntervalMinutesOf(75);
      logInfo(`updateIntervalMinutesOf(updateDuration=75): actual=${actual}`);
      expect(actual).assertEqual(2250);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0023 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0024
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0024
     * @tc.desc      updateIntervalMinutesOf(updateDuration=80) returns 2400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0024 begin`);
      const actual: number = updateIntervalMinutesOf(80);
      logInfo(`updateIntervalMinutesOf(updateDuration=80): actual=${actual}`);
      expect(actual).assertEqual(2400);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0024 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0025
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0025
     * @tc.desc      updateIntervalMinutesOf(updateDuration=85) returns 2550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0025 begin`);
      const actual: number = updateIntervalMinutesOf(85);
      logInfo(`updateIntervalMinutesOf(updateDuration=85): actual=${actual}`);
      expect(actual).assertEqual(2550);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0025 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0026
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0026
     * @tc.desc      updateIntervalMinutesOf(updateDuration=90) returns 2700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0026 begin`);
      const actual: number = updateIntervalMinutesOf(90);
      logInfo(`updateIntervalMinutesOf(updateDuration=90): actual=${actual}`);
      expect(actual).assertEqual(2700);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0026 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0027
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0027
     * @tc.desc      updateIntervalMinutesOf(updateDuration=95) returns 2850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0027 begin`);
      const actual: number = updateIntervalMinutesOf(95);
      logInfo(`updateIntervalMinutesOf(updateDuration=95): actual=${actual}`);
      expect(actual).assertEqual(2850);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0027 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0028
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0028
     * @tc.desc      updateIntervalMinutesOf(updateDuration=105) returns 3150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0028 begin`);
      const actual: number = updateIntervalMinutesOf(105);
      logInfo(`updateIntervalMinutesOf(updateDuration=105): actual=${actual}`);
      expect(actual).assertEqual(3150);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0028 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0029
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0029
     * @tc.desc      updateIntervalMinutesOf(updateDuration=110) returns 3300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0029 begin`);
      const actual: number = updateIntervalMinutesOf(110);
      logInfo(`updateIntervalMinutesOf(updateDuration=110): actual=${actual}`);
      expect(actual).assertEqual(3300);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0029 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0030
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0030
     * @tc.desc      updateIntervalMinutesOf(updateDuration=115) returns 3450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0030 begin`);
      const actual: number = updateIntervalMinutesOf(115);
      logInfo(`updateIntervalMinutesOf(updateDuration=115): actual=${actual}`);
      expect(actual).assertEqual(3450);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0030 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0031
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0031
     * @tc.desc      updateIntervalMinutesOf(updateDuration=120) returns 3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0031 begin`);
      const actual: number = updateIntervalMinutesOf(120);
      logInfo(`updateIntervalMinutesOf(updateDuration=120): actual=${actual}`);
      expect(actual).assertEqual(3600);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0031 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0032
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0032
     * @tc.desc      updateIntervalMinutesOf(updateDuration=125) returns 3750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0032 begin`);
      const actual: number = updateIntervalMinutesOf(125);
      logInfo(`updateIntervalMinutesOf(updateDuration=125): actual=${actual}`);
      expect(actual).assertEqual(3750);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0032 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0033
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0033
     * @tc.desc      updateIntervalMinutesOf(updateDuration=130) returns 3900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0033 begin`);
      const actual: number = updateIntervalMinutesOf(130);
      logInfo(`updateIntervalMinutesOf(updateDuration=130): actual=${actual}`);
      expect(actual).assertEqual(3900);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0033 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0034
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0034
     * @tc.desc      updateIntervalMinutesOf(updateDuration=135) returns 4050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0034 begin`);
      const actual: number = updateIntervalMinutesOf(135);
      logInfo(`updateIntervalMinutesOf(updateDuration=135): actual=${actual}`);
      expect(actual).assertEqual(4050);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0034 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0035
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0035
     * @tc.desc      updateIntervalMinutesOf(updateDuration=140) returns 4200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0035 begin`);
      const actual: number = updateIntervalMinutesOf(140);
      logInfo(`updateIntervalMinutesOf(updateDuration=140): actual=${actual}`);
      expect(actual).assertEqual(4200);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0035 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0036
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0036
     * @tc.desc      updateIntervalMinutesOf(updateDuration=145) returns 4350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0036 begin`);
      const actual: number = updateIntervalMinutesOf(145);
      logInfo(`updateIntervalMinutesOf(updateDuration=145): actual=${actual}`);
      expect(actual).assertEqual(4350);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0036 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0037
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0037
     * @tc.desc      updateIntervalMinutesOf(updateDuration=150) returns 4500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0037 begin`);
      const actual: number = updateIntervalMinutesOf(150);
      logInfo(`updateIntervalMinutesOf(updateDuration=150): actual=${actual}`);
      expect(actual).assertEqual(4500);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0037 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0038
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0038
     * @tc.desc      updateIntervalMinutesOf(updateDuration=155) returns 4650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0038 begin`);
      const actual: number = updateIntervalMinutesOf(155);
      logInfo(`updateIntervalMinutesOf(updateDuration=155): actual=${actual}`);
      expect(actual).assertEqual(4650);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0038 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0039
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0039
     * @tc.desc      updateIntervalMinutesOf(updateDuration=160) returns 4800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0039 begin`);
      const actual: number = updateIntervalMinutesOf(160);
      logInfo(`updateIntervalMinutesOf(updateDuration=160): actual=${actual}`);
      expect(actual).assertEqual(4800);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0039 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0040
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0040
     * @tc.desc      updateIntervalMinutesOf(updateDuration=165) returns 4950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0040 begin`);
      const actual: number = updateIntervalMinutesOf(165);
      logInfo(`updateIntervalMinutesOf(updateDuration=165): actual=${actual}`);
      expect(actual).assertEqual(4950);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0040 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0041
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0041
     * @tc.desc      updateIntervalMinutesOf(updateDuration=170) returns 5100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0041 begin`);
      const actual: number = updateIntervalMinutesOf(170);
      logInfo(`updateIntervalMinutesOf(updateDuration=170): actual=${actual}`);
      expect(actual).assertEqual(5100);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0041 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0042
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0042
     * @tc.desc      updateIntervalMinutesOf(updateDuration=175) returns 5250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0042 begin`);
      const actual: number = updateIntervalMinutesOf(175);
      logInfo(`updateIntervalMinutesOf(updateDuration=175): actual=${actual}`);
      expect(actual).assertEqual(5250);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0042 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0043
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0043
     * @tc.desc      updateIntervalMinutesOf(updateDuration=180) returns 5400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0043 begin`);
      const actual: number = updateIntervalMinutesOf(180);
      logInfo(`updateIntervalMinutesOf(updateDuration=180): actual=${actual}`);
      expect(actual).assertEqual(5400);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0043 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0044
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0044
     * @tc.desc      updateIntervalMinutesOf(updateDuration=185) returns 5550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0044 begin`);
      const actual: number = updateIntervalMinutesOf(185);
      logInfo(`updateIntervalMinutesOf(updateDuration=185): actual=${actual}`);
      expect(actual).assertEqual(5550);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0044 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0045
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0045
     * @tc.desc      updateIntervalMinutesOf(updateDuration=190) returns 5700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0045 begin`);
      const actual: number = updateIntervalMinutesOf(190);
      logInfo(`updateIntervalMinutesOf(updateDuration=190): actual=${actual}`);
      expect(actual).assertEqual(5700);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0045 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0046
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0046
     * @tc.desc      updateIntervalMinutesOf(updateDuration=195) returns 5850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0046 begin`);
      const actual: number = updateIntervalMinutesOf(195);
      logInfo(`updateIntervalMinutesOf(updateDuration=195): actual=${actual}`);
      expect(actual).assertEqual(5850);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0046 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0047
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0047
     * @tc.desc      updateIntervalMinutesOf(updateDuration=200) returns 6000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0047 begin`);
      const actual: number = updateIntervalMinutesOf(200);
      logInfo(`updateIntervalMinutesOf(updateDuration=200): actual=${actual}`);
      expect(actual).assertEqual(6000);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0047 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0048
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0048
     * @tc.desc      updateIntervalMinutesOf(updateDuration=66.14) returns 1984.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0048 begin`);
      const actual: number = updateIntervalMinutesOf(66.14);
      logInfo(`updateIntervalMinutesOf(updateDuration=66...: actual=${actual}`);
      expect(actual).assertClose(1984.2, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0048 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0049
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0049
     * @tc.desc      updateIntervalMinutesOf(updateDuration=76) returns 2280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0049 begin`);
      const actual: number = updateIntervalMinutesOf(76);
      logInfo(`updateIntervalMinutesOf(updateDuration=76): actual=${actual}`);
      expect(actual).assertEqual(2280);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0049 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0050
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0050
     * @tc.desc      updateIntervalMinutesOf(updateDuration=35.45) returns 1063.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0050 begin`);
      const actual: number = updateIntervalMinutesOf(35.45);
      logInfo(`updateIntervalMinutesOf(updateDuration=35...: actual=${actual}`);
      expect(actual).assertClose(1063.5, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0050 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0051
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0051
     * @tc.desc      updateIntervalMinutesOf(updateDuration=68) returns 2040
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0051 begin`);
      const actual: number = updateIntervalMinutesOf(68);
      logInfo(`updateIntervalMinutesOf(updateDuration=68): actual=${actual}`);
      expect(actual).assertEqual(2040);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0051 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0052
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0052
     * @tc.desc      updateIntervalMinutesOf(updateDuration=22) returns 660
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0052 begin`);
      const actual: number = updateIntervalMinutesOf(22);
      logInfo(`updateIntervalMinutesOf(updateDuration=22): actual=${actual}`);
      expect(actual).assertEqual(660);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0052 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0053
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0053
     * @tc.desc      updateIntervalMinutesOf(updateDuration=20.78) returns 623.4000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0053 begin`);
      const actual: number = updateIntervalMinutesOf(20.78);
      logInfo(`updateIntervalMinutesOf(updateDuration=20...: actual=${actual}`);
      expect(actual).assertClose(623.4000000000001, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0053 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0054
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0054
     * @tc.desc      updateIntervalMinutesOf(updateDuration=152) returns 4560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0054 begin`);
      const actual: number = updateIntervalMinutesOf(152);
      logInfo(`updateIntervalMinutesOf(updateDuration=152): actual=${actual}`);
      expect(actual).assertEqual(4560);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0054 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0055
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0055
     * @tc.desc      updateIntervalMinutesOf(updateDuration=191) returns 5730
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0055 begin`);
      const actual: number = updateIntervalMinutesOf(191);
      logInfo(`updateIntervalMinutesOf(updateDuration=191): actual=${actual}`);
      expect(actual).assertEqual(5730);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0055 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0056
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0056
     * @tc.desc      updateIntervalMinutesOf(updateDuration=49) returns 1470
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0056 begin`);
      const actual: number = updateIntervalMinutesOf(49);
      logInfo(`updateIntervalMinutesOf(updateDuration=49): actual=${actual}`);
      expect(actual).assertEqual(1470);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0056 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0057
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0057
     * @tc.desc      updateIntervalMinutesOf(updateDuration=37.58) returns 1127.3999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0057 begin`);
      const actual: number = updateIntervalMinutesOf(37.58);
      logInfo(`updateIntervalMinutesOf(updateDuration=37...: actual=${actual}`);
      expect(actual).assertClose(1127.3999999999999, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0057 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0058
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0058
     * @tc.desc      updateIntervalMinutesOf(updateDuration=29.49) returns 884.6999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0058 begin`);
      const actual: number = updateIntervalMinutesOf(29.49);
      logInfo(`updateIntervalMinutesOf(updateDuration=29...: actual=${actual}`);
      expect(actual).assertClose(884.6999999999999, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0058 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0059
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0059
     * @tc.desc      updateIntervalMinutesOf(updateDuration=97.2) returns 2916
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0059 begin`);
      const actual: number = updateIntervalMinutesOf(97.2);
      logInfo(`updateIntervalMinutesOf(updateDuration=97.2): actual=${actual}`);
      expect(actual).assertEqual(2916);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0059 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0060
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0060
     * @tc.desc      updateIntervalMinutesOf(updateDuration=121) returns 3630
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0060 begin`);
      const actual: number = updateIntervalMinutesOf(121);
      logInfo(`updateIntervalMinutesOf(updateDuration=121): actual=${actual}`);
      expect(actual).assertEqual(3630);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0060 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0061
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0061
     * @tc.desc      updateIntervalMinutesOf(updateDuration=146) returns 4380
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0061 begin`);
      const actual: number = updateIntervalMinutesOf(146);
      logInfo(`updateIntervalMinutesOf(updateDuration=146): actual=${actual}`);
      expect(actual).assertEqual(4380);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0061 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0062
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0062
     * @tc.desc      updateIntervalMinutesOf(updateDuration=177) returns 5310
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0062 begin`);
      const actual: number = updateIntervalMinutesOf(177);
      logInfo(`updateIntervalMinutesOf(updateDuration=177): actual=${actual}`);
      expect(actual).assertEqual(5310);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0062 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0063
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0063
     * @tc.desc      updateIntervalMinutesOf(updateDuration=149) returns 4470
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0063 begin`);
      const actual: number = updateIntervalMinutesOf(149);
      logInfo(`updateIntervalMinutesOf(updateDuration=149): actual=${actual}`);
      expect(actual).assertEqual(4470);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0063 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0064
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0064
     * @tc.desc      updateIntervalMinutesOf(updateDuration=19.29) returns 578.6999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0064 begin`);
      const actual: number = updateIntervalMinutesOf(19.29);
      logInfo(`updateIntervalMinutesOf(updateDuration=19...: actual=${actual}`);
      expect(actual).assertClose(578.6999999999999, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0064 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0065
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0065
     * @tc.desc      updateIntervalMinutesOf(updateDuration=36) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0065 begin`);
      const actual: number = updateIntervalMinutesOf(36);
      logInfo(`updateIntervalMinutesOf(updateDuration=36): actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0065 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0066
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0066
     * @tc.desc      updateIntervalMinutesOf(updateDuration=23.47) returns 704.0999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0066 begin`);
      const actual: number = updateIntervalMinutesOf(23.47);
      logInfo(`updateIntervalMinutesOf(updateDuration=23...: actual=${actual}`);
      expect(actual).assertClose(704.0999999999999, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0066 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0067
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0067
     * @tc.desc      updateIntervalMinutesOf(updateDuration=94) returns 2820
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0067 begin`);
      const actual: number = updateIntervalMinutesOf(94);
      logInfo(`updateIntervalMinutesOf(updateDuration=94): actual=${actual}`);
      expect(actual).assertEqual(2820);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0067 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0068
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0068
     * @tc.desc      updateIntervalMinutesOf(updateDuration=141) returns 4230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0068 begin`);
      const actual: number = updateIntervalMinutesOf(141);
      logInfo(`updateIntervalMinutesOf(updateDuration=141): actual=${actual}`);
      expect(actual).assertEqual(4230);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0068 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0069
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0069
     * @tc.desc      updateIntervalMinutesOf(updateDuration=129) returns 3870
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0069 begin`);
      const actual: number = updateIntervalMinutesOf(129);
      logInfo(`updateIntervalMinutesOf(updateDuration=129): actual=${actual}`);
      expect(actual).assertEqual(3870);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0069 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0070
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0070
     * @tc.desc      updateIntervalMinutesOf(updateDuration=192) returns 5760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0070 begin`);
      const actual: number = updateIntervalMinutesOf(192);
      logInfo(`updateIntervalMinutesOf(updateDuration=192): actual=${actual}`);
      expect(actual).assertEqual(5760);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0070 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0071
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0071
     * @tc.desc      updateIntervalMinutesOf(updateDuration=143) returns 4290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0071 begin`);
      const actual: number = updateIntervalMinutesOf(143);
      logInfo(`updateIntervalMinutesOf(updateDuration=143): actual=${actual}`);
      expect(actual).assertEqual(4290);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0071 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0072
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0072
     * @tc.desc      updateIntervalMinutesOf(updateDuration=1.52) returns 45.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0072 begin`);
      const actual: number = updateIntervalMinutesOf(1.52);
      logInfo(`updateIntervalMinutesOf(updateDuration=1.52): actual=${actual}`);
      expect(actual).assertClose(45.6, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0072 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0073
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0073
     * @tc.desc      updateIntervalMinutesOf(updateDuration=89.89) returns 2696.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0073 begin`);
      const actual: number = updateIntervalMinutesOf(89.89);
      logInfo(`updateIntervalMinutesOf(updateDuration=89...: actual=${actual}`);
      expect(actual).assertClose(2696.7, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0073 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0074
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0074
     * @tc.desc      updateIntervalMinutesOf(updateDuration=64.33) returns 1929.8999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0074 begin`);
      const actual: number = updateIntervalMinutesOf(64.33);
      logInfo(`updateIntervalMinutesOf(updateDuration=64...: actual=${actual}`);
      expect(actual).assertClose(1929.8999999999999, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0074 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0075
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0075
     * @tc.desc      updateIntervalMinutesOf(updateDuration=197) returns 5910
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0075 begin`);
      const actual: number = updateIntervalMinutesOf(197);
      logInfo(`updateIntervalMinutesOf(updateDuration=197): actual=${actual}`);
      expect(actual).assertEqual(5910);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0075 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0076
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0076
     * @tc.desc      updateIntervalMinutesOf(updateDuration=98) returns 2940
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0076 begin`);
      const actual: number = updateIntervalMinutesOf(98);
      logInfo(`updateIntervalMinutesOf(updateDuration=98): actual=${actual}`);
      expect(actual).assertEqual(2940);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0076 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0077
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0077
     * @tc.desc      updateIntervalMinutesOf(updateDuration=37.27) returns 1118.1000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0077 begin`);
      const actual: number = updateIntervalMinutesOf(37.27);
      logInfo(`updateIntervalMinutesOf(updateDuration=37...: actual=${actual}`);
      expect(actual).assertClose(1118.1000000000001, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0077 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0078
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0078
     * @tc.desc      updateIntervalMinutesOf(updateDuration=36.39) returns 1091.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0078 begin`);
      const actual: number = updateIntervalMinutesOf(36.39);
      logInfo(`updateIntervalMinutesOf(updateDuration=36...: actual=${actual}`);
      expect(actual).assertClose(1091.7, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0078 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0079
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0079
     * @tc.desc      updateIntervalMinutesOf(updateDuration=49.95) returns 1498.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0079 begin`);
      const actual: number = updateIntervalMinutesOf(49.95);
      logInfo(`updateIntervalMinutesOf(updateDuration=49...: actual=${actual}`);
      expect(actual).assertClose(1498.5, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0079 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0080
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0080
     * @tc.desc      updateIntervalMinutesOf(updateDuration=103) returns 3090
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0080 begin`);
      const actual: number = updateIntervalMinutesOf(103);
      logInfo(`updateIntervalMinutesOf(updateDuration=103): actual=${actual}`);
      expect(actual).assertEqual(3090);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0080 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0081
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0081
     * @tc.desc      updateIntervalMinutesOf(updateDuration=4.86) returns 145.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0081 begin`);
      const actual: number = updateIntervalMinutesOf(4.86);
      logInfo(`updateIntervalMinutesOf(updateDuration=4.86): actual=${actual}`);
      expect(actual).assertClose(145.8, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0081 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0082
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0082
     * @tc.desc      updateIntervalMinutesOf(updateDuration=187) returns 5610
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0082 begin`);
      const actual: number = updateIntervalMinutesOf(187);
      logInfo(`updateIntervalMinutesOf(updateDuration=187): actual=${actual}`);
      expect(actual).assertEqual(5610);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0082 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0083
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0083
     * @tc.desc      updateIntervalMinutesOf(updateDuration=65.62) returns 1968.6000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0083 begin`);
      const actual: number = updateIntervalMinutesOf(65.62);
      logInfo(`updateIntervalMinutesOf(updateDuration=65...: actual=${actual}`);
      expect(actual).assertClose(1968.6000000000001, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0083 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0084
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0084
     * @tc.desc      updateIntervalMinutesOf(updateDuration=172) returns 5160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0084 begin`);
      const actual: number = updateIntervalMinutesOf(172);
      logInfo(`updateIntervalMinutesOf(updateDuration=172): actual=${actual}`);
      expect(actual).assertEqual(5160);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0084 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0085
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0085
     * @tc.desc      updateIntervalMinutesOf(updateDuration=1.7) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0085 begin`);
      const actual: number = updateIntervalMinutesOf(1.7);
      logInfo(`updateIntervalMinutesOf(updateDuration=1.7): actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0085 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0086
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0086
     * @tc.desc      updateIntervalMinutesOf(updateDuration=56.51) returns 1695.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0086 begin`);
      const actual: number = updateIntervalMinutesOf(56.51);
      logInfo(`updateIntervalMinutesOf(updateDuration=56...: actual=${actual}`);
      expect(actual).assertClose(1695.3, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0086 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0087
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0087
     * @tc.desc      updateIntervalMinutesOf(updateDuration=42) returns 1260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0087 begin`);
      const actual: number = updateIntervalMinutesOf(42);
      logInfo(`updateIntervalMinutesOf(updateDuration=42): actual=${actual}`);
      expect(actual).assertEqual(1260);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0087 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0088
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0088
     * @tc.desc      updateIntervalMinutesOf(updateDuration=176) returns 5280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0088 begin`);
      const actual: number = updateIntervalMinutesOf(176);
      logInfo(`updateIntervalMinutesOf(updateDuration=176): actual=${actual}`);
      expect(actual).assertEqual(5280);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0088 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0089
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0089
     * @tc.desc      updateIntervalMinutesOf(updateDuration=32.01) returns 960.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0089 begin`);
      const actual: number = updateIntervalMinutesOf(32.01);
      logInfo(`updateIntervalMinutesOf(updateDuration=32...: actual=${actual}`);
      expect(actual).assertClose(960.3, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0089 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0090
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0090
     * @tc.desc      updateIntervalMinutesOf(updateDuration=138) returns 4140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0090 begin`);
      const actual: number = updateIntervalMinutesOf(138);
      logInfo(`updateIntervalMinutesOf(updateDuration=138): actual=${actual}`);
      expect(actual).assertEqual(4140);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0090 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0091
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0091
     * @tc.desc      updateIntervalMinutesOf(updateDuration=37) returns 1110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0091 begin`);
      const actual: number = updateIntervalMinutesOf(37);
      logInfo(`updateIntervalMinutesOf(updateDuration=37): actual=${actual}`);
      expect(actual).assertEqual(1110);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0091 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0092
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0092
     * @tc.desc      updateIntervalMinutesOf(updateDuration=44.03) returns 1320.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0092 begin`);
      const actual: number = updateIntervalMinutesOf(44.03);
      logInfo(`updateIntervalMinutesOf(updateDuration=44...: actual=${actual}`);
      expect(actual).assertClose(1320.9, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0092 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0093
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0093
     * @tc.desc      updateIntervalMinutesOf(updateDuration=44) returns 1320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0093 begin`);
      const actual: number = updateIntervalMinutesOf(44);
      logInfo(`updateIntervalMinutesOf(updateDuration=44): actual=${actual}`);
      expect(actual).assertEqual(1320);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0093 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0094
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0094
     * @tc.desc      updateIntervalMinutesOf(updateDuration=86.96) returns 2608.7999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0094 begin`);
      const actual: number = updateIntervalMinutesOf(86.96);
      logInfo(`updateIntervalMinutesOf(updateDuration=86...: actual=${actual}`);
      expect(actual).assertClose(2608.7999999999997, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0094 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0095
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0095
     * @tc.desc      updateIntervalMinutesOf(updateDuration=57) returns 1710
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0095 begin`);
      const actual: number = updateIntervalMinutesOf(57);
      logInfo(`updateIntervalMinutesOf(updateDuration=57): actual=${actual}`);
      expect(actual).assertEqual(1710);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0095 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0096
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0096
     * @tc.desc      updateIntervalMinutesOf(updateDuration=58) returns 1740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0096 begin`);
      const actual: number = updateIntervalMinutesOf(58);
      logInfo(`updateIntervalMinutesOf(updateDuration=58): actual=${actual}`);
      expect(actual).assertEqual(1740);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0096 end`);
    });
  });
}
