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
import { dialogTextRoomAt } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for dialogTextRoomAt (96 cases). */
export default function dialogTextRoomAtTest(): void {
  describe('DialogTextRoomAtTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0001
     * @tc.name      NdkNotification_DialogTextRoomAt_0001
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=0, density=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_DialogTextRoomAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0001 begin`);
      const actual: number = dialogTextRoomAt(0, 2);
      logInfo(`dialogTextRoomAt(dialogWidthVp=0, density=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextRoomAt_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0002
     * @tc.name      NdkNotification_DialogTextRoomAt_0002
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1, density=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_DialogTextRoomAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0002 begin`);
      const actual: number = dialogTextRoomAt(1, 0);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1, density=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DialogTextRoomAt_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0003
     * @tc.name      NdkNotification_DialogTextRoomAt_0003
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1, density=199) returns 0.15577889447236182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0003 begin`);
      const actual: number = dialogTextRoomAt(1, 199);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1, density...: actual=${actual}`);
      expect(actual).assertClose(0.15577889447236182, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0004
     * @tc.name      NdkNotification_DialogTextRoomAt_0004
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=2, density=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0004 begin`);
      const actual: number = dialogTextRoomAt(2, 0);
      logInfo(`dialogTextRoomAt(dialogWidthVp=2, density=0): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}DialogTextRoomAt_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0005
     * @tc.name      NdkNotification_DialogTextRoomAt_0005
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=2, density=100) returns 0.32000000000000006
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0005 begin`);
      const actual: number = dialogTextRoomAt(2, 100);
      logInfo(`dialogTextRoomAt(dialogWidthVp=2, density...: actual=${actual}`);
      expect(actual).assertClose(0.32000000000000006, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0006
     * @tc.name      NdkNotification_DialogTextRoomAt_0006
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=2, density=85) returns 0.0235294117647058
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0006 begin`);
      const actual: number = dialogTextRoomAt(2, 85);
      logInfo(`dialogTextRoomAt(dialogWidthVp=2, density...: actual=${actual}`);
      expect(actual).assertClose(0.0235294117647058, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0007
     * @tc.name      NdkNotification_DialogTextRoomAt_0007
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=2, density=90) returns 0.1333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0007 begin`);
      const actual: number = dialogTextRoomAt(2, 90);
      logInfo(`dialogTextRoomAt(dialogWidthVp=2, density...: actual=${actual}`);
      expect(actual).assertClose(0.1333333333333333, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0008
     * @tc.name      NdkNotification_DialogTextRoomAt_0008
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=2, density=95) returns 0.2315789473684211
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0008 begin`);
      const actual: number = dialogTextRoomAt(2, 95);
      logInfo(`dialogTextRoomAt(dialogWidthVp=2, density...: actual=${actual}`);
      expect(actual).assertClose(0.2315789473684211, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0009
     * @tc.name      NdkNotification_DialogTextRoomAt_0009
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=2, density=105) returns 0.3999999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0009 begin`);
      const actual: number = dialogTextRoomAt(2, 105);
      logInfo(`dialogTextRoomAt(dialogWidthVp=2, density...: actual=${actual}`);
      expect(actual).assertClose(0.3999999999999999, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0010
     * @tc.name      NdkNotification_DialogTextRoomAt_0010
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=2, density=110) returns 0.47272727272727266
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0010 begin`);
      const actual: number = dialogTextRoomAt(2, 110);
      logInfo(`dialogTextRoomAt(dialogWidthVp=2, density...: actual=${actual}`);
      expect(actual).assertClose(0.47272727272727266, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0011
     * @tc.name      NdkNotification_DialogTextRoomAt_0011
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=2, density=115) returns 0.5391304347826087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0011 begin`);
      const actual: number = dialogTextRoomAt(2, 115);
      logInfo(`dialogTextRoomAt(dialogWidthVp=2, density...: actual=${actual}`);
      expect(actual).assertClose(0.5391304347826087, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0012
     * @tc.name      NdkNotification_DialogTextRoomAt_0012
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=2, density=199) returns 1.1557788944723617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0012 begin`);
      const actual: number = dialogTextRoomAt(2, 199);
      logInfo(`dialogTextRoomAt(dialogWidthVp=2, density...: actual=${actual}`);
      expect(actual).assertClose(1.1557788944723617, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0013
     * @tc.name      NdkNotification_DialogTextRoomAt_0013
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0013 begin`);
      const actual: number = dialogTextRoomAt(3, 0);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density=0): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}DialogTextRoomAt_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0014
     * @tc.name      NdkNotification_DialogTextRoomAt_0014
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=100) returns 1.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0014 begin`);
      const actual: number = dialogTextRoomAt(3, 100);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(1.32, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0015
     * @tc.name      NdkNotification_DialogTextRoomAt_0015
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=60) returns 0.20000000000000018
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0015 begin`);
      const actual: number = dialogTextRoomAt(3, 60);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(0.20000000000000018, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0016
     * @tc.name      NdkNotification_DialogTextRoomAt_0016
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=65) returns 0.41538461538461524
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0016 begin`);
      const actual: number = dialogTextRoomAt(3, 65);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(0.41538461538461524, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0017
     * @tc.name      NdkNotification_DialogTextRoomAt_0017
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=70) returns 0.6000000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0017 begin`);
      const actual: number = dialogTextRoomAt(3, 70);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(0.6000000000000001, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0018
     * @tc.name      NdkNotification_DialogTextRoomAt_0018
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=75) returns 0.7599999999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0018 begin`);
      const actual: number = dialogTextRoomAt(3, 75);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(0.7599999999999998, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0019
     * @tc.name      NdkNotification_DialogTextRoomAt_0019
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=80) returns 0.8999999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0019 begin`);
      const actual: number = dialogTextRoomAt(3, 80);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(0.8999999999999999, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0020
     * @tc.name      NdkNotification_DialogTextRoomAt_0020
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=85) returns 1.0235294117647058
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0020 begin`);
      const actual: number = dialogTextRoomAt(3, 85);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(1.0235294117647058, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0021
     * @tc.name      NdkNotification_DialogTextRoomAt_0021
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=90) returns 1.1333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0021 begin`);
      const actual: number = dialogTextRoomAt(3, 90);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(1.1333333333333333, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0022
     * @tc.name      NdkNotification_DialogTextRoomAt_0022
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=95) returns 1.231578947368421
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0022 begin`);
      const actual: number = dialogTextRoomAt(3, 95);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(1.231578947368421, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0023
     * @tc.name      NdkNotification_DialogTextRoomAt_0023
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=105) returns 1.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0023 begin`);
      const actual: number = dialogTextRoomAt(3, 105);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(1.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0024
     * @tc.name      NdkNotification_DialogTextRoomAt_0024
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=110) returns 1.4727272727272727
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0024 begin`);
      const actual: number = dialogTextRoomAt(3, 110);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(1.4727272727272727, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0025
     * @tc.name      NdkNotification_DialogTextRoomAt_0025
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=115) returns 1.5391304347826087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0025 begin`);
      const actual: number = dialogTextRoomAt(3, 115);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(1.5391304347826087, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0026
     * @tc.name      NdkNotification_DialogTextRoomAt_0026
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=71) returns 0.6338028169014085
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0026 begin`);
      const actual: number = dialogTextRoomAt(3, 71);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(0.6338028169014085, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0027
     * @tc.name      NdkNotification_DialogTextRoomAt_0027
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=3, density=199) returns 2.1557788944723617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0027 begin`);
      const actual: number = dialogTextRoomAt(3, 199);
      logInfo(`dialogTextRoomAt(dialogWidthVp=3, density...: actual=${actual}`);
      expect(actual).assertClose(2.1557788944723617, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0028
     * @tc.name      NdkNotification_DialogTextRoomAt_0028
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=2) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0028 begin`);
      const actual: number = dialogTextRoomAt(100, 2);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}DialogTextRoomAt_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0029
     * @tc.name      NdkNotification_DialogTextRoomAt_0029
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=3) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0029 begin`);
      const actual: number = dialogTextRoomAt(100, 3);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}DialogTextRoomAt_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0030
     * @tc.name      NdkNotification_DialogTextRoomAt_0030
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=0) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0030 begin`);
      const actual: number = dialogTextRoomAt(100, 0);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}DialogTextRoomAt_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0031
     * @tc.name      NdkNotification_DialogTextRoomAt_0031
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=10) returns 83.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0031 begin`);
      const actual: number = dialogTextRoomAt(100, 10);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(83.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0032
     * @tc.name      NdkNotification_DialogTextRoomAt_0032
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=100) returns 98.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0032 begin`);
      const actual: number = dialogTextRoomAt(100, 100);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(98.32, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0033
     * @tc.name      NdkNotification_DialogTextRoomAt_0033
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=5) returns 66.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0033 begin`);
      const actual: number = dialogTextRoomAt(100, 5);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(66.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0034
     * @tc.name      NdkNotification_DialogTextRoomAt_0034
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=15) returns 88.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0034 begin`);
      const actual: number = dialogTextRoomAt(100, 15);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(88.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0035
     * @tc.name      NdkNotification_DialogTextRoomAt_0035
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=20) returns 91.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0035 begin`);
      const actual: number = dialogTextRoomAt(100, 20);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(91.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0036
     * @tc.name      NdkNotification_DialogTextRoomAt_0036
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=25) returns 93.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0036 begin`);
      const actual: number = dialogTextRoomAt(100, 25);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(93.28, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0037
     * @tc.name      NdkNotification_DialogTextRoomAt_0037
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=30) returns 94.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0037 begin`);
      const actual: number = dialogTextRoomAt(100, 30);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(94.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0038
     * @tc.name      NdkNotification_DialogTextRoomAt_0038
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=35) returns 95.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0038 begin`);
      const actual: number = dialogTextRoomAt(100, 35);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(95.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0039
     * @tc.name      NdkNotification_DialogTextRoomAt_0039
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=40) returns 95.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0039 begin`);
      const actual: number = dialogTextRoomAt(100, 40);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(95.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0040
     * @tc.name      NdkNotification_DialogTextRoomAt_0040
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=45) returns 96.26666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0040 begin`);
      const actual: number = dialogTextRoomAt(100, 45);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(96.26666666666667, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0041
     * @tc.name      NdkNotification_DialogTextRoomAt_0041
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=50) returns 96.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0041 begin`);
      const actual: number = dialogTextRoomAt(100, 50);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(96.64, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0042
     * @tc.name      NdkNotification_DialogTextRoomAt_0042
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=55) returns 96.94545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0042 begin`);
      const actual: number = dialogTextRoomAt(100, 55);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(96.94545454545454, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0043
     * @tc.name      NdkNotification_DialogTextRoomAt_0043
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=60) returns 97.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0043 begin`);
      const actual: number = dialogTextRoomAt(100, 60);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(97.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0044
     * @tc.name      NdkNotification_DialogTextRoomAt_0044
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=65) returns 97.41538461538461
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0044 begin`);
      const actual: number = dialogTextRoomAt(100, 65);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(97.41538461538461, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0045
     * @tc.name      NdkNotification_DialogTextRoomAt_0045
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=70) returns 97.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0045 begin`);
      const actual: number = dialogTextRoomAt(100, 70);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(97.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0046
     * @tc.name      NdkNotification_DialogTextRoomAt_0046
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=75) returns 97.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0046 begin`);
      const actual: number = dialogTextRoomAt(100, 75);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(97.76, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0047
     * @tc.name      NdkNotification_DialogTextRoomAt_0047
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=80) returns 97.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0047 begin`);
      const actual: number = dialogTextRoomAt(100, 80);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(97.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0048
     * @tc.name      NdkNotification_DialogTextRoomAt_0048
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=85) returns 98.02352941176471
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0048 begin`);
      const actual: number = dialogTextRoomAt(100, 85);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(98.02352941176471, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0049
     * @tc.name      NdkNotification_DialogTextRoomAt_0049
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=90) returns 98.13333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0049 begin`);
      const actual: number = dialogTextRoomAt(100, 90);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(98.13333333333334, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0050
     * @tc.name      NdkNotification_DialogTextRoomAt_0050
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=95) returns 98.23157894736842
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0050 begin`);
      const actual: number = dialogTextRoomAt(100, 95);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(98.23157894736842, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0051
     * @tc.name      NdkNotification_DialogTextRoomAt_0051
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=105) returns 98.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0051 begin`);
      const actual: number = dialogTextRoomAt(100, 105);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(98.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0052
     * @tc.name      NdkNotification_DialogTextRoomAt_0052
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=110) returns 98.47272727272727
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0052 begin`);
      const actual: number = dialogTextRoomAt(100, 110);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(98.47272727272727, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0053
     * @tc.name      NdkNotification_DialogTextRoomAt_0053
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=115) returns 98.5391304347826
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0053 begin`);
      const actual: number = dialogTextRoomAt(100, 115);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(98.5391304347826, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0054
     * @tc.name      NdkNotification_DialogTextRoomAt_0054
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=71) returns 97.63380281690141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0054 begin`);
      const actual: number = dialogTextRoomAt(100, 71);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(97.63380281690141, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0055
     * @tc.name      NdkNotification_DialogTextRoomAt_0055
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=100, density=199) returns 99.15577889447236
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0055 begin`);
      const actual: number = dialogTextRoomAt(100, 199);
      logInfo(`dialogTextRoomAt(dialogWidthVp=100, densi...: actual=${actual}`);
      expect(actual).assertClose(99.15577889447236, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0056
     * @tc.name      NdkNotification_DialogTextRoomAt_0056
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=2) returns 276
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0056 begin`);
      const actual: number = dialogTextRoomAt(360, 2);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertEqual(276);
      logInfo(`${BUNDLE}DialogTextRoomAt_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0057
     * @tc.name      NdkNotification_DialogTextRoomAt_0057
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=1) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0057 begin`);
      const actual: number = dialogTextRoomAt(360, 1);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}DialogTextRoomAt_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0058
     * @tc.name      NdkNotification_DialogTextRoomAt_0058
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=3) returns 304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0058 begin`);
      const actual: number = dialogTextRoomAt(360, 3);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertEqual(304);
      logInfo(`${BUNDLE}DialogTextRoomAt_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0059
     * @tc.name      NdkNotification_DialogTextRoomAt_0059
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=0) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0059 begin`);
      const actual: number = dialogTextRoomAt(360, 0);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}DialogTextRoomAt_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0060
     * @tc.name      NdkNotification_DialogTextRoomAt_0060
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=10) returns 343.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0060 begin`);
      const actual: number = dialogTextRoomAt(360, 10);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(343.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0061
     * @tc.name      NdkNotification_DialogTextRoomAt_0061
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=100) returns 358.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0061 begin`);
      const actual: number = dialogTextRoomAt(360, 100);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(358.32, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0062
     * @tc.name      NdkNotification_DialogTextRoomAt_0062
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=5) returns 326.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0062 begin`);
      const actual: number = dialogTextRoomAt(360, 5);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(326.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0063
     * @tc.name      NdkNotification_DialogTextRoomAt_0063
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=15) returns 348.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0063 begin`);
      const actual: number = dialogTextRoomAt(360, 15);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(348.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0064
     * @tc.name      NdkNotification_DialogTextRoomAt_0064
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=20) returns 351.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0064 begin`);
      const actual: number = dialogTextRoomAt(360, 20);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(351.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0065
     * @tc.name      NdkNotification_DialogTextRoomAt_0065
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=25) returns 353.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0065 begin`);
      const actual: number = dialogTextRoomAt(360, 25);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(353.28, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0066
     * @tc.name      NdkNotification_DialogTextRoomAt_0066
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=30) returns 354.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0066 begin`);
      const actual: number = dialogTextRoomAt(360, 30);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(354.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0067
     * @tc.name      NdkNotification_DialogTextRoomAt_0067
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=35) returns 355.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0067 begin`);
      const actual: number = dialogTextRoomAt(360, 35);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(355.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0068
     * @tc.name      NdkNotification_DialogTextRoomAt_0068
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=40) returns 355.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0068 begin`);
      const actual: number = dialogTextRoomAt(360, 40);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(355.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0069
     * @tc.name      NdkNotification_DialogTextRoomAt_0069
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=45) returns 356.26666666666665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0069 begin`);
      const actual: number = dialogTextRoomAt(360, 45);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(356.26666666666665, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0070
     * @tc.name      NdkNotification_DialogTextRoomAt_0070
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=50) returns 356.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0070 begin`);
      const actual: number = dialogTextRoomAt(360, 50);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(356.64, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0071
     * @tc.name      NdkNotification_DialogTextRoomAt_0071
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=55) returns 356.94545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0071 begin`);
      const actual: number = dialogTextRoomAt(360, 55);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(356.94545454545454, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0072
     * @tc.name      NdkNotification_DialogTextRoomAt_0072
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=60) returns 357.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0072 begin`);
      const actual: number = dialogTextRoomAt(360, 60);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(357.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0073
     * @tc.name      NdkNotification_DialogTextRoomAt_0073
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=65) returns 357.4153846153846
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0073 begin`);
      const actual: number = dialogTextRoomAt(360, 65);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(357.4153846153846, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0074
     * @tc.name      NdkNotification_DialogTextRoomAt_0074
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=70) returns 357.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0074 begin`);
      const actual: number = dialogTextRoomAt(360, 70);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(357.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0075
     * @tc.name      NdkNotification_DialogTextRoomAt_0075
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=75) returns 357.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0075 begin`);
      const actual: number = dialogTextRoomAt(360, 75);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(357.76, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0076
     * @tc.name      NdkNotification_DialogTextRoomAt_0076
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=80) returns 357.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0076 begin`);
      const actual: number = dialogTextRoomAt(360, 80);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(357.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0077
     * @tc.name      NdkNotification_DialogTextRoomAt_0077
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=85) returns 358.0235294117647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0077 begin`);
      const actual: number = dialogTextRoomAt(360, 85);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(358.0235294117647, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0078
     * @tc.name      NdkNotification_DialogTextRoomAt_0078
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=90) returns 358.1333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0078 begin`);
      const actual: number = dialogTextRoomAt(360, 90);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(358.1333333333333, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0079
     * @tc.name      NdkNotification_DialogTextRoomAt_0079
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=95) returns 358.2315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0079 begin`);
      const actual: number = dialogTextRoomAt(360, 95);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(358.2315789473684, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0080
     * @tc.name      NdkNotification_DialogTextRoomAt_0080
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=105) returns 358.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0080 begin`);
      const actual: number = dialogTextRoomAt(360, 105);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(358.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0081
     * @tc.name      NdkNotification_DialogTextRoomAt_0081
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=110) returns 358.4727272727273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0081 begin`);
      const actual: number = dialogTextRoomAt(360, 110);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(358.4727272727273, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0082
     * @tc.name      NdkNotification_DialogTextRoomAt_0082
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=115) returns 358.53913043478263
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0082 begin`);
      const actual: number = dialogTextRoomAt(360, 115);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(358.53913043478263, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0083
     * @tc.name      NdkNotification_DialogTextRoomAt_0083
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=71) returns 357.63380281690144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0083 begin`);
      const actual: number = dialogTextRoomAt(360, 71);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(357.63380281690144, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0084
     * @tc.name      NdkNotification_DialogTextRoomAt_0084
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=360, density=199) returns 359.15577889447235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0084 begin`);
      const actual: number = dialogTextRoomAt(360, 199);
      logInfo(`dialogTextRoomAt(dialogWidthVp=360, densi...: actual=${actual}`);
      expect(actual).assertClose(359.15577889447235, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0085
     * @tc.name      NdkNotification_DialogTextRoomAt_0085
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=2) returns 636
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0085 begin`);
      const actual: number = dialogTextRoomAt(720, 2);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertEqual(636);
      logInfo(`${BUNDLE}DialogTextRoomAt_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0086
     * @tc.name      NdkNotification_DialogTextRoomAt_0086
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=1) returns 552
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0086 begin`);
      const actual: number = dialogTextRoomAt(720, 1);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertEqual(552);
      logInfo(`${BUNDLE}DialogTextRoomAt_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0087
     * @tc.name      NdkNotification_DialogTextRoomAt_0087
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=3) returns 664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0087 begin`);
      const actual: number = dialogTextRoomAt(720, 3);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertEqual(664);
      logInfo(`${BUNDLE}DialogTextRoomAt_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0088
     * @tc.name      NdkNotification_DialogTextRoomAt_0088
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=0) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0088 begin`);
      const actual: number = dialogTextRoomAt(720, 0);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}DialogTextRoomAt_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0089
     * @tc.name      NdkNotification_DialogTextRoomAt_0089
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=10) returns 703.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0089 begin`);
      const actual: number = dialogTextRoomAt(720, 10);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(703.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0090
     * @tc.name      NdkNotification_DialogTextRoomAt_0090
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=100) returns 718.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0090 begin`);
      const actual: number = dialogTextRoomAt(720, 100);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(718.32, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0091
     * @tc.name      NdkNotification_DialogTextRoomAt_0091
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=5) returns 686.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0091 begin`);
      const actual: number = dialogTextRoomAt(720, 5);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(686.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0092
     * @tc.name      NdkNotification_DialogTextRoomAt_0092
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=15) returns 708.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0092 begin`);
      const actual: number = dialogTextRoomAt(720, 15);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(708.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0093
     * @tc.name      NdkNotification_DialogTextRoomAt_0093
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=20) returns 711.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0093 begin`);
      const actual: number = dialogTextRoomAt(720, 20);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(711.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0094
     * @tc.name      NdkNotification_DialogTextRoomAt_0094
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=25) returns 713.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0094 begin`);
      const actual: number = dialogTextRoomAt(720, 25);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(713.28, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0095
     * @tc.name      NdkNotification_DialogTextRoomAt_0095
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=30) returns 714.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0095 begin`);
      const actual: number = dialogTextRoomAt(720, 30);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(714.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0096
     * @tc.name      NdkNotification_DialogTextRoomAt_0096
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=35) returns 715.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0096 begin`);
      const actual: number = dialogTextRoomAt(720, 35);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(715.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0096 end`);
    });
  });
}
