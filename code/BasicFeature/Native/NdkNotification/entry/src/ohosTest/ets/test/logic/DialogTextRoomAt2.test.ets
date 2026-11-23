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
export default function dialogTextRoomAt2Test(): void {
  describe('DialogTextRoomAt2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0097
     * @tc.name      NdkNotification_DialogTextRoomAt_0097
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=40) returns 715.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0097 begin`);
      const actual: number = dialogTextRoomAt(720, 40);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(715.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0098
     * @tc.name      NdkNotification_DialogTextRoomAt_0098
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=45) returns 716.2666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0098 begin`);
      const actual: number = dialogTextRoomAt(720, 45);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(716.2666666666667, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0099
     * @tc.name      NdkNotification_DialogTextRoomAt_0099
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=50) returns 716.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0099 begin`);
      const actual: number = dialogTextRoomAt(720, 50);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(716.64, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0100
     * @tc.name      NdkNotification_DialogTextRoomAt_0100
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=55) returns 716.9454545454546
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0100 begin`);
      const actual: number = dialogTextRoomAt(720, 55);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(716.9454545454546, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0101
     * @tc.name      NdkNotification_DialogTextRoomAt_0101
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=60) returns 717.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0101 begin`);
      const actual: number = dialogTextRoomAt(720, 60);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(717.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0102
     * @tc.name      NdkNotification_DialogTextRoomAt_0102
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=65) returns 717.4153846153846
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0102 begin`);
      const actual: number = dialogTextRoomAt(720, 65);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(717.4153846153846, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0103
     * @tc.name      NdkNotification_DialogTextRoomAt_0103
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=70) returns 717.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0103 begin`);
      const actual: number = dialogTextRoomAt(720, 70);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(717.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0104
     * @tc.name      NdkNotification_DialogTextRoomAt_0104
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=75) returns 717.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0104 begin`);
      const actual: number = dialogTextRoomAt(720, 75);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(717.76, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0105
     * @tc.name      NdkNotification_DialogTextRoomAt_0105
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=80) returns 717.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0105 begin`);
      const actual: number = dialogTextRoomAt(720, 80);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(717.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0106
     * @tc.name      NdkNotification_DialogTextRoomAt_0106
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=85) returns 718.0235294117647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0106 begin`);
      const actual: number = dialogTextRoomAt(720, 85);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(718.0235294117647, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0107
     * @tc.name      NdkNotification_DialogTextRoomAt_0107
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=90) returns 718.1333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0107 begin`);
      const actual: number = dialogTextRoomAt(720, 90);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(718.1333333333333, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0108
     * @tc.name      NdkNotification_DialogTextRoomAt_0108
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=95) returns 718.2315789473685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0108 begin`);
      const actual: number = dialogTextRoomAt(720, 95);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(718.2315789473685, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0109
     * @tc.name      NdkNotification_DialogTextRoomAt_0109
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=105) returns 718.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0109 begin`);
      const actual: number = dialogTextRoomAt(720, 105);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(718.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0110
     * @tc.name      NdkNotification_DialogTextRoomAt_0110
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=110) returns 718.4727272727273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0110 begin`);
      const actual: number = dialogTextRoomAt(720, 110);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(718.4727272727273, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0111
     * @tc.name      NdkNotification_DialogTextRoomAt_0111
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=115) returns 718.5391304347826
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0111 begin`);
      const actual: number = dialogTextRoomAt(720, 115);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(718.5391304347826, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0112
     * @tc.name      NdkNotification_DialogTextRoomAt_0112
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=71) returns 717.6338028169014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0112 begin`);
      const actual: number = dialogTextRoomAt(720, 71);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(717.6338028169014, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0113
     * @tc.name      NdkNotification_DialogTextRoomAt_0113
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=720, density=199) returns 719.1557788944724
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0113 begin`);
      const actual: number = dialogTextRoomAt(720, 199);
      logInfo(`dialogTextRoomAt(dialogWidthVp=720, densi...: actual=${actual}`);
      expect(actual).assertClose(719.1557788944724, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0114
     * @tc.name      NdkNotification_DialogTextRoomAt_0114
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=2) returns 996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0114 begin`);
      const actual: number = dialogTextRoomAt(1080, 2);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertEqual(996);
      logInfo(`${BUNDLE}DialogTextRoomAt_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0115
     * @tc.name      NdkNotification_DialogTextRoomAt_0115
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=1) returns 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0115 begin`);
      const actual: number = dialogTextRoomAt(1080, 1);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`${BUNDLE}DialogTextRoomAt_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0116
     * @tc.name      NdkNotification_DialogTextRoomAt_0116
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=3) returns 1024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0116 begin`);
      const actual: number = dialogTextRoomAt(1080, 3);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertEqual(1024);
      logInfo(`${BUNDLE}DialogTextRoomAt_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0117
     * @tc.name      NdkNotification_DialogTextRoomAt_0117
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=0) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0117 begin`);
      const actual: number = dialogTextRoomAt(1080, 0);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}DialogTextRoomAt_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0118
     * @tc.name      NdkNotification_DialogTextRoomAt_0118
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=10) returns 1063.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0118 begin`);
      const actual: number = dialogTextRoomAt(1080, 10);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1063.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0119
     * @tc.name      NdkNotification_DialogTextRoomAt_0119
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=100) returns 1078.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0119 begin`);
      const actual: number = dialogTextRoomAt(1080, 100);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1078.32, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0120
     * @tc.name      NdkNotification_DialogTextRoomAt_0120
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=5) returns 1046.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0120 begin`);
      const actual: number = dialogTextRoomAt(1080, 5);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1046.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0121
     * @tc.name      NdkNotification_DialogTextRoomAt_0121
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=15) returns 1068.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0121 begin`);
      const actual: number = dialogTextRoomAt(1080, 15);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1068.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0122
     * @tc.name      NdkNotification_DialogTextRoomAt_0122
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=20) returns 1071.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0122 begin`);
      const actual: number = dialogTextRoomAt(1080, 20);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1071.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0123
     * @tc.name      NdkNotification_DialogTextRoomAt_0123
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=25) returns 1073.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0123 begin`);
      const actual: number = dialogTextRoomAt(1080, 25);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1073.28, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0124
     * @tc.name      NdkNotification_DialogTextRoomAt_0124
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=30) returns 1074.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0124 begin`);
      const actual: number = dialogTextRoomAt(1080, 30);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1074.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0125
     * @tc.name      NdkNotification_DialogTextRoomAt_0125
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=35) returns 1075.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0125 begin`);
      const actual: number = dialogTextRoomAt(1080, 35);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1075.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0126
     * @tc.name      NdkNotification_DialogTextRoomAt_0126
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=40) returns 1075.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0126 begin`);
      const actual: number = dialogTextRoomAt(1080, 40);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1075.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0127
     * @tc.name      NdkNotification_DialogTextRoomAt_0127
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=45) returns 1076.2666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0127 begin`);
      const actual: number = dialogTextRoomAt(1080, 45);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1076.2666666666667, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0128
     * @tc.name      NdkNotification_DialogTextRoomAt_0128
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=50) returns 1076.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0128 begin`);
      const actual: number = dialogTextRoomAt(1080, 50);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1076.64, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0129
     * @tc.name      NdkNotification_DialogTextRoomAt_0129
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=55) returns 1076.9454545454546
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0129 begin`);
      const actual: number = dialogTextRoomAt(1080, 55);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1076.9454545454546, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0130
     * @tc.name      NdkNotification_DialogTextRoomAt_0130
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=60) returns 1077.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0130 begin`);
      const actual: number = dialogTextRoomAt(1080, 60);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1077.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0131
     * @tc.name      NdkNotification_DialogTextRoomAt_0131
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=65) returns 1077.4153846153847
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0131 begin`);
      const actual: number = dialogTextRoomAt(1080, 65);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1077.4153846153847, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0132
     * @tc.name      NdkNotification_DialogTextRoomAt_0132
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=70) returns 1077.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0132 begin`);
      const actual: number = dialogTextRoomAt(1080, 70);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1077.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0133
     * @tc.name      NdkNotification_DialogTextRoomAt_0133
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=75) returns 1077.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0133 begin`);
      const actual: number = dialogTextRoomAt(1080, 75);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1077.76, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0134
     * @tc.name      NdkNotification_DialogTextRoomAt_0134
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=80) returns 1077.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0134 begin`);
      const actual: number = dialogTextRoomAt(1080, 80);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1077.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0135
     * @tc.name      NdkNotification_DialogTextRoomAt_0135
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=85) returns 1078.0235294117647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0135 begin`);
      const actual: number = dialogTextRoomAt(1080, 85);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1078.0235294117647, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0136
     * @tc.name      NdkNotification_DialogTextRoomAt_0136
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=90) returns 1078.1333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0136 begin`);
      const actual: number = dialogTextRoomAt(1080, 90);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1078.1333333333334, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0137
     * @tc.name      NdkNotification_DialogTextRoomAt_0137
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=95) returns 1078.2315789473685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0137 begin`);
      const actual: number = dialogTextRoomAt(1080, 95);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1078.2315789473685, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0138
     * @tc.name      NdkNotification_DialogTextRoomAt_0138
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=105) returns 1078.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0138 begin`);
      const actual: number = dialogTextRoomAt(1080, 105);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1078.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0139
     * @tc.name      NdkNotification_DialogTextRoomAt_0139
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=110) returns 1078.4727272727273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0139 begin`);
      const actual: number = dialogTextRoomAt(1080, 110);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1078.4727272727273, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0140
     * @tc.name      NdkNotification_DialogTextRoomAt_0140
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=115) returns 1078.5391304347827
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0140 begin`);
      const actual: number = dialogTextRoomAt(1080, 115);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1078.5391304347827, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0141
     * @tc.name      NdkNotification_DialogTextRoomAt_0141
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=71) returns 1077.6338028169014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0141 begin`);
      const actual: number = dialogTextRoomAt(1080, 71);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1077.6338028169014, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0142
     * @tc.name      NdkNotification_DialogTextRoomAt_0142
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1080, density=199) returns 1079.1557788944724
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0142 begin`);
      const actual: number = dialogTextRoomAt(1080, 199);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1080, dens...: actual=${actual}`);
      expect(actual).assertClose(1079.1557788944724, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0143
     * @tc.name      NdkNotification_DialogTextRoomAt_0143
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=2) returns 1836
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0143 begin`);
      const actual: number = dialogTextRoomAt(1920, 2);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertEqual(1836);
      logInfo(`${BUNDLE}DialogTextRoomAt_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0144
     * @tc.name      NdkNotification_DialogTextRoomAt_0144
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=1) returns 1752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0144 begin`);
      const actual: number = dialogTextRoomAt(1920, 1);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertEqual(1752);
      logInfo(`${BUNDLE}DialogTextRoomAt_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0145
     * @tc.name      NdkNotification_DialogTextRoomAt_0145
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=3) returns 1864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0145 begin`);
      const actual: number = dialogTextRoomAt(1920, 3);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertEqual(1864);
      logInfo(`${BUNDLE}DialogTextRoomAt_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0146
     * @tc.name      NdkNotification_DialogTextRoomAt_0146
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=0) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0146 begin`);
      const actual: number = dialogTextRoomAt(1920, 0);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}DialogTextRoomAt_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0147
     * @tc.name      NdkNotification_DialogTextRoomAt_0147
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=10) returns 1903.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0147 begin`);
      const actual: number = dialogTextRoomAt(1920, 10);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1903.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0148
     * @tc.name      NdkNotification_DialogTextRoomAt_0148
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=100) returns 1918.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0148 begin`);
      const actual: number = dialogTextRoomAt(1920, 100);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1918.32, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0149
     * @tc.name      NdkNotification_DialogTextRoomAt_0149
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=5) returns 1886.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0149 begin`);
      const actual: number = dialogTextRoomAt(1920, 5);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1886.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0150
     * @tc.name      NdkNotification_DialogTextRoomAt_0150
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=15) returns 1908.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0150 begin`);
      const actual: number = dialogTextRoomAt(1920, 15);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1908.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0151
     * @tc.name      NdkNotification_DialogTextRoomAt_0151
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=20) returns 1911.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0151 begin`);
      const actual: number = dialogTextRoomAt(1920, 20);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1911.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0152
     * @tc.name      NdkNotification_DialogTextRoomAt_0152
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=25) returns 1913.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0152 begin`);
      const actual: number = dialogTextRoomAt(1920, 25);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1913.28, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0153
     * @tc.name      NdkNotification_DialogTextRoomAt_0153
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=30) returns 1914.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0153 begin`);
      const actual: number = dialogTextRoomAt(1920, 30);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1914.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0154
     * @tc.name      NdkNotification_DialogTextRoomAt_0154
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=35) returns 1915.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0154 begin`);
      const actual: number = dialogTextRoomAt(1920, 35);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1915.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0155
     * @tc.name      NdkNotification_DialogTextRoomAt_0155
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=40) returns 1915.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0155 begin`);
      const actual: number = dialogTextRoomAt(1920, 40);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1915.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0156
     * @tc.name      NdkNotification_DialogTextRoomAt_0156
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=45) returns 1916.2666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0156 begin`);
      const actual: number = dialogTextRoomAt(1920, 45);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1916.2666666666667, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0157
     * @tc.name      NdkNotification_DialogTextRoomAt_0157
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=50) returns 1916.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0157 begin`);
      const actual: number = dialogTextRoomAt(1920, 50);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1916.64, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0158
     * @tc.name      NdkNotification_DialogTextRoomAt_0158
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=55) returns 1916.9454545454546
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0158 begin`);
      const actual: number = dialogTextRoomAt(1920, 55);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1916.9454545454546, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0159
     * @tc.name      NdkNotification_DialogTextRoomAt_0159
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=60) returns 1917.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0159 begin`);
      const actual: number = dialogTextRoomAt(1920, 60);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1917.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0160
     * @tc.name      NdkNotification_DialogTextRoomAt_0160
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=65) returns 1917.4153846153847
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0160 begin`);
      const actual: number = dialogTextRoomAt(1920, 65);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1917.4153846153847, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0161
     * @tc.name      NdkNotification_DialogTextRoomAt_0161
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=70) returns 1917.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0161 begin`);
      const actual: number = dialogTextRoomAt(1920, 70);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1917.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0162
     * @tc.name      NdkNotification_DialogTextRoomAt_0162
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=75) returns 1917.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0162 begin`);
      const actual: number = dialogTextRoomAt(1920, 75);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1917.76, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0163
     * @tc.name      NdkNotification_DialogTextRoomAt_0163
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=80) returns 1917.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0163 begin`);
      const actual: number = dialogTextRoomAt(1920, 80);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1917.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0164
     * @tc.name      NdkNotification_DialogTextRoomAt_0164
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=85) returns 1918.0235294117647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0164 begin`);
      const actual: number = dialogTextRoomAt(1920, 85);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1918.0235294117647, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0165
     * @tc.name      NdkNotification_DialogTextRoomAt_0165
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=90) returns 1918.1333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0165 begin`);
      const actual: number = dialogTextRoomAt(1920, 90);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1918.1333333333334, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0165 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0166
     * @tc.name      NdkNotification_DialogTextRoomAt_0166
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=95) returns 1918.2315789473685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0166 begin`);
      const actual: number = dialogTextRoomAt(1920, 95);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1918.2315789473685, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0166 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0167
     * @tc.name      NdkNotification_DialogTextRoomAt_0167
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=105) returns 1918.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0167 begin`);
      const actual: number = dialogTextRoomAt(1920, 105);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1918.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0167 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0168
     * @tc.name      NdkNotification_DialogTextRoomAt_0168
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=110) returns 1918.4727272727273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0168 begin`);
      const actual: number = dialogTextRoomAt(1920, 110);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1918.4727272727273, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0168 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0169
     * @tc.name      NdkNotification_DialogTextRoomAt_0169
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=115) returns 1918.5391304347827
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0169 begin`);
      const actual: number = dialogTextRoomAt(1920, 115);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1918.5391304347827, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0169 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0170
     * @tc.name      NdkNotification_DialogTextRoomAt_0170
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=71) returns 1917.6338028169014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0170 begin`);
      const actual: number = dialogTextRoomAt(1920, 71);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1917.6338028169014, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0170 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0171
     * @tc.name      NdkNotification_DialogTextRoomAt_0171
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=1920, density=199) returns 1919.1557788944724
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0171 begin`);
      const actual: number = dialogTextRoomAt(1920, 199);
      logInfo(`dialogTextRoomAt(dialogWidthVp=1920, dens...: actual=${actual}`);
      expect(actual).assertClose(1919.1557788944724, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0171 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0172
     * @tc.name      NdkNotification_DialogTextRoomAt_0172
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=0) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0172 begin`);
      const actual: number = dialogTextRoomAt(10, 0);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}DialogTextRoomAt_0172 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0173
     * @tc.name      NdkNotification_DialogTextRoomAt_0173
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=100) returns 8.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0173 begin`);
      const actual: number = dialogTextRoomAt(10, 100);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(8.32, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0173 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0174
     * @tc.name      NdkNotification_DialogTextRoomAt_0174
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=20) returns 1.5999999999999996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0174 begin`);
      const actual: number = dialogTextRoomAt(10, 20);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(1.5999999999999996, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0174 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0175
     * @tc.name      NdkNotification_DialogTextRoomAt_0175
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=25) returns 3.2800000000000002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0175 begin`);
      const actual: number = dialogTextRoomAt(10, 25);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(3.2800000000000002, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0175 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0176
     * @tc.name      NdkNotification_DialogTextRoomAt_0176
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=30) returns 4.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0176 begin`);
      const actual: number = dialogTextRoomAt(10, 30);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(4.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0176 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0177
     * @tc.name      NdkNotification_DialogTextRoomAt_0177
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=35) returns 5.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0177 begin`);
      const actual: number = dialogTextRoomAt(10, 35);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(5.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0177 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0178
     * @tc.name      NdkNotification_DialogTextRoomAt_0178
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=40) returns 5.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0178 begin`);
      const actual: number = dialogTextRoomAt(10, 40);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(5.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0178 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0179
     * @tc.name      NdkNotification_DialogTextRoomAt_0179
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=45) returns 6.266666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0179 begin`);
      const actual: number = dialogTextRoomAt(10, 45);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(6.266666666666667, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0179 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0180
     * @tc.name      NdkNotification_DialogTextRoomAt_0180
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=50) returns 6.640000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0180 begin`);
      const actual: number = dialogTextRoomAt(10, 50);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(6.640000000000001, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0180 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0181
     * @tc.name      NdkNotification_DialogTextRoomAt_0181
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=55) returns 6.945454545454545
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0181 begin`);
      const actual: number = dialogTextRoomAt(10, 55);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(6.945454545454545, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0181 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0182
     * @tc.name      NdkNotification_DialogTextRoomAt_0182
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=60) returns 7.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0182 begin`);
      const actual: number = dialogTextRoomAt(10, 60);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(7.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0182 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0183
     * @tc.name      NdkNotification_DialogTextRoomAt_0183
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=65) returns 7.415384615384616
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0183 begin`);
      const actual: number = dialogTextRoomAt(10, 65);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(7.415384615384616, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0183 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0184
     * @tc.name      NdkNotification_DialogTextRoomAt_0184
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=70) returns 7.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0184 begin`);
      const actual: number = dialogTextRoomAt(10, 70);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(7.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0184 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0185
     * @tc.name      NdkNotification_DialogTextRoomAt_0185
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=75) returns 7.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0185 begin`);
      const actual: number = dialogTextRoomAt(10, 75);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(7.76, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0185 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0186
     * @tc.name      NdkNotification_DialogTextRoomAt_0186
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=80) returns 7.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0186 begin`);
      const actual: number = dialogTextRoomAt(10, 80);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(7.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0186 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0187
     * @tc.name      NdkNotification_DialogTextRoomAt_0187
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=85) returns 8.023529411764706
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0187 begin`);
      const actual: number = dialogTextRoomAt(10, 85);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(8.023529411764706, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0187 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0188
     * @tc.name      NdkNotification_DialogTextRoomAt_0188
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=90) returns 8.133333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0188 begin`);
      const actual: number = dialogTextRoomAt(10, 90);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(8.133333333333333, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0188 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0189
     * @tc.name      NdkNotification_DialogTextRoomAt_0189
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=95) returns 8.23157894736842
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0189 begin`);
      const actual: number = dialogTextRoomAt(10, 95);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(8.23157894736842, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0189 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0190
     * @tc.name      NdkNotification_DialogTextRoomAt_0190
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=105) returns 8.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0190 begin`);
      const actual: number = dialogTextRoomAt(10, 105);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(8.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0190 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0191
     * @tc.name      NdkNotification_DialogTextRoomAt_0191
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=110) returns 8.472727272727273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0191 begin`);
      const actual: number = dialogTextRoomAt(10, 110);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(8.472727272727273, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0191 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0192
     * @tc.name      NdkNotification_DialogTextRoomAt_0192
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=115) returns 8.539130434782608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0192 begin`);
      const actual: number = dialogTextRoomAt(10, 115);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(8.539130434782608, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0192 end`);
    });
  });
}
