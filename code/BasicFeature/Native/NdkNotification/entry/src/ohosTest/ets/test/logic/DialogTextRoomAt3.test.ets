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
export default function dialogTextRoomAt3Test(): void {
  describe('DialogTextRoomAt3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0193
     * @tc.name      NdkNotification_DialogTextRoomAt_0193
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=71) returns 7.633802816901408
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0193 begin`);
      const actual: number = dialogTextRoomAt(10, 71);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(7.633802816901408, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0193 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0194
     * @tc.name      NdkNotification_DialogTextRoomAt_0194
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=10, density=199) returns 9.155778894472363
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0194 begin`);
      const actual: number = dialogTextRoomAt(10, 199);
      logInfo(`dialogTextRoomAt(dialogWidthVp=10, densit...: actual=${actual}`);
      expect(actual).assertClose(9.155778894472363, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0194 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0195
     * @tc.name      NdkNotification_DialogTextRoomAt_0195
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=2) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0195 begin`);
      const actual: number = dialogTextRoomAt(96, 2);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}DialogTextRoomAt_0195 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0196
     * @tc.name      NdkNotification_DialogTextRoomAt_0196
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=3) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0196 begin`);
      const actual: number = dialogTextRoomAt(96, 3);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}DialogTextRoomAt_0196 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0197
     * @tc.name      NdkNotification_DialogTextRoomAt_0197
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=0) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0197 begin`);
      const actual: number = dialogTextRoomAt(96, 0);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}DialogTextRoomAt_0197 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0198
     * @tc.name      NdkNotification_DialogTextRoomAt_0198
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=10) returns 79.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0198 begin`);
      const actual: number = dialogTextRoomAt(96, 10);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(79.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0198 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0199
     * @tc.name      NdkNotification_DialogTextRoomAt_0199
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=100) returns 94.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0199 begin`);
      const actual: number = dialogTextRoomAt(96, 100);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(94.32, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0199 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0200
     * @tc.name      NdkNotification_DialogTextRoomAt_0200
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=5) returns 62.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0200 begin`);
      const actual: number = dialogTextRoomAt(96, 5);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(62.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0200 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0201
     * @tc.name      NdkNotification_DialogTextRoomAt_0201
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=15) returns 84.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0201 begin`);
      const actual: number = dialogTextRoomAt(96, 15);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(84.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0201 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0202
     * @tc.name      NdkNotification_DialogTextRoomAt_0202
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=20) returns 87.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0202 begin`);
      const actual: number = dialogTextRoomAt(96, 20);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(87.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0202 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0203
     * @tc.name      NdkNotification_DialogTextRoomAt_0203
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=25) returns 89.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0203 begin`);
      const actual: number = dialogTextRoomAt(96, 25);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(89.28, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0203 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0204
     * @tc.name      NdkNotification_DialogTextRoomAt_0204
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=30) returns 90.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0204 begin`);
      const actual: number = dialogTextRoomAt(96, 30);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(90.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0204 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0205
     * @tc.name      NdkNotification_DialogTextRoomAt_0205
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=35) returns 91.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0205 begin`);
      const actual: number = dialogTextRoomAt(96, 35);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(91.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0205 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0206
     * @tc.name      NdkNotification_DialogTextRoomAt_0206
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=40) returns 91.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0206 begin`);
      const actual: number = dialogTextRoomAt(96, 40);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(91.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0206 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0207
     * @tc.name      NdkNotification_DialogTextRoomAt_0207
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=45) returns 92.26666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0207 begin`);
      const actual: number = dialogTextRoomAt(96, 45);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(92.26666666666667, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0207 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0208
     * @tc.name      NdkNotification_DialogTextRoomAt_0208
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=50) returns 92.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0208 begin`);
      const actual: number = dialogTextRoomAt(96, 50);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(92.64, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0208 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0209
     * @tc.name      NdkNotification_DialogTextRoomAt_0209
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=55) returns 92.94545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0209 begin`);
      const actual: number = dialogTextRoomAt(96, 55);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(92.94545454545454, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0209 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0210
     * @tc.name      NdkNotification_DialogTextRoomAt_0210
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=60) returns 93.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0210 begin`);
      const actual: number = dialogTextRoomAt(96, 60);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(93.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0210 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0211
     * @tc.name      NdkNotification_DialogTextRoomAt_0211
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=65) returns 93.41538461538461
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0211 begin`);
      const actual: number = dialogTextRoomAt(96, 65);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(93.41538461538461, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0211 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0212
     * @tc.name      NdkNotification_DialogTextRoomAt_0212
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=70) returns 93.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0212 begin`);
      const actual: number = dialogTextRoomAt(96, 70);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(93.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0212 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0213
     * @tc.name      NdkNotification_DialogTextRoomAt_0213
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=75) returns 93.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0213 begin`);
      const actual: number = dialogTextRoomAt(96, 75);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(93.76, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0213 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0214
     * @tc.name      NdkNotification_DialogTextRoomAt_0214
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=80) returns 93.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0214 begin`);
      const actual: number = dialogTextRoomAt(96, 80);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(93.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0214 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0215
     * @tc.name      NdkNotification_DialogTextRoomAt_0215
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=85) returns 94.02352941176471
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0215 begin`);
      const actual: number = dialogTextRoomAt(96, 85);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(94.02352941176471, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0215 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0216
     * @tc.name      NdkNotification_DialogTextRoomAt_0216
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=90) returns 94.13333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0216 begin`);
      const actual: number = dialogTextRoomAt(96, 90);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(94.13333333333334, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0216 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0217
     * @tc.name      NdkNotification_DialogTextRoomAt_0217
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=95) returns 94.23157894736842
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0217 begin`);
      const actual: number = dialogTextRoomAt(96, 95);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(94.23157894736842, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0217 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0218
     * @tc.name      NdkNotification_DialogTextRoomAt_0218
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=110) returns 94.47272727272727
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0218 begin`);
      const actual: number = dialogTextRoomAt(96, 110);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(94.47272727272727, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0218 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0219
     * @tc.name      NdkNotification_DialogTextRoomAt_0219
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=115) returns 94.5391304347826
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0219 begin`);
      const actual: number = dialogTextRoomAt(96, 115);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(94.5391304347826, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0219 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0220
     * @tc.name      NdkNotification_DialogTextRoomAt_0220
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=71) returns 93.63380281690141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0220 begin`);
      const actual: number = dialogTextRoomAt(96, 71);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(93.63380281690141, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0220 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0221
     * @tc.name      NdkNotification_DialogTextRoomAt_0221
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=96, density=199) returns 95.15577889447236
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0221 begin`);
      const actual: number = dialogTextRoomAt(96, 199);
      logInfo(`dialogTextRoomAt(dialogWidthVp=96, densit...: actual=${actual}`);
      expect(actual).assertClose(95.15577889447236, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0221 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0222
     * @tc.name      NdkNotification_DialogTextRoomAt_0222
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=2) returns 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0222 begin`);
      const actual: number = dialogTextRoomAt(192, 2);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertEqual(108);
      logInfo(`${BUNDLE}DialogTextRoomAt_0222 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0223
     * @tc.name      NdkNotification_DialogTextRoomAt_0223
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=1) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0223 begin`);
      const actual: number = dialogTextRoomAt(192, 1);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}DialogTextRoomAt_0223 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0224
     * @tc.name      NdkNotification_DialogTextRoomAt_0224
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=3) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0224 begin`);
      const actual: number = dialogTextRoomAt(192, 3);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}DialogTextRoomAt_0224 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0225
     * @tc.name      NdkNotification_DialogTextRoomAt_0225
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=10) returns 175.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0225 begin`);
      const actual: number = dialogTextRoomAt(192, 10);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(175.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0225 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0226
     * @tc.name      NdkNotification_DialogTextRoomAt_0226
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=100) returns 190.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0226 begin`);
      const actual: number = dialogTextRoomAt(192, 100);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(190.32, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0226 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0227
     * @tc.name      NdkNotification_DialogTextRoomAt_0227
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=5) returns 158.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0227 begin`);
      const actual: number = dialogTextRoomAt(192, 5);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(158.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0227 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0228
     * @tc.name      NdkNotification_DialogTextRoomAt_0228
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=15) returns 180.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0228 begin`);
      const actual: number = dialogTextRoomAt(192, 15);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(180.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0228 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0229
     * @tc.name      NdkNotification_DialogTextRoomAt_0229
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=20) returns 183.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0229 begin`);
      const actual: number = dialogTextRoomAt(192, 20);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(183.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0229 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0230
     * @tc.name      NdkNotification_DialogTextRoomAt_0230
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=25) returns 185.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0230 begin`);
      const actual: number = dialogTextRoomAt(192, 25);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(185.28, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0230 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0231
     * @tc.name      NdkNotification_DialogTextRoomAt_0231
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=30) returns 186.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0231 begin`);
      const actual: number = dialogTextRoomAt(192, 30);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(186.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0231 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0232
     * @tc.name      NdkNotification_DialogTextRoomAt_0232
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=35) returns 187.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0232 begin`);
      const actual: number = dialogTextRoomAt(192, 35);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(187.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0232 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0233
     * @tc.name      NdkNotification_DialogTextRoomAt_0233
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=40) returns 187.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0233 begin`);
      const actual: number = dialogTextRoomAt(192, 40);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(187.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0233 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0234
     * @tc.name      NdkNotification_DialogTextRoomAt_0234
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=45) returns 188.26666666666668
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0234 begin`);
      const actual: number = dialogTextRoomAt(192, 45);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(188.26666666666668, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0234 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0235
     * @tc.name      NdkNotification_DialogTextRoomAt_0235
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=50) returns 188.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0235 begin`);
      const actual: number = dialogTextRoomAt(192, 50);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(188.64, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0235 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0236
     * @tc.name      NdkNotification_DialogTextRoomAt_0236
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=55) returns 188.94545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0236 begin`);
      const actual: number = dialogTextRoomAt(192, 55);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(188.94545454545454, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0236 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0237
     * @tc.name      NdkNotification_DialogTextRoomAt_0237
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=60) returns 189.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0237 begin`);
      const actual: number = dialogTextRoomAt(192, 60);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(189.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0237 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0238
     * @tc.name      NdkNotification_DialogTextRoomAt_0238
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=65) returns 189.41538461538462
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0238 begin`);
      const actual: number = dialogTextRoomAt(192, 65);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(189.41538461538462, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0238 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0239
     * @tc.name      NdkNotification_DialogTextRoomAt_0239
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=70) returns 189.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0239 begin`);
      const actual: number = dialogTextRoomAt(192, 70);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(189.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0239 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0240
     * @tc.name      NdkNotification_DialogTextRoomAt_0240
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=75) returns 189.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0240 begin`);
      const actual: number = dialogTextRoomAt(192, 75);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(189.76, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0240 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0241
     * @tc.name      NdkNotification_DialogTextRoomAt_0241
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=80) returns 189.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0241 begin`);
      const actual: number = dialogTextRoomAt(192, 80);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(189.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0241 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0242
     * @tc.name      NdkNotification_DialogTextRoomAt_0242
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=85) returns 190.0235294117647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0242 begin`);
      const actual: number = dialogTextRoomAt(192, 85);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(190.0235294117647, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0242 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0243
     * @tc.name      NdkNotification_DialogTextRoomAt_0243
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=90) returns 190.13333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0243 begin`);
      const actual: number = dialogTextRoomAt(192, 90);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(190.13333333333333, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0243 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0244
     * @tc.name      NdkNotification_DialogTextRoomAt_0244
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=95) returns 190.23157894736843
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0244 begin`);
      const actual: number = dialogTextRoomAt(192, 95);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(190.23157894736843, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0244 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0245
     * @tc.name      NdkNotification_DialogTextRoomAt_0245
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=105) returns 190.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0245 begin`);
      const actual: number = dialogTextRoomAt(192, 105);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(190.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0245 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0246
     * @tc.name      NdkNotification_DialogTextRoomAt_0246
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=110) returns 190.47272727272727
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0246 begin`);
      const actual: number = dialogTextRoomAt(192, 110);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(190.47272727272727, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0246 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0247
     * @tc.name      NdkNotification_DialogTextRoomAt_0247
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=115) returns 190.5391304347826
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0247 begin`);
      const actual: number = dialogTextRoomAt(192, 115);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(190.5391304347826, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0247 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0248
     * @tc.name      NdkNotification_DialogTextRoomAt_0248
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=71) returns 189.6338028169014
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0248 begin`);
      const actual: number = dialogTextRoomAt(192, 71);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(189.6338028169014, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0248 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0249
     * @tc.name      NdkNotification_DialogTextRoomAt_0249
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=192, density=199) returns 191.15577889447235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0249 begin`);
      const actual: number = dialogTextRoomAt(192, 199);
      logInfo(`dialogTextRoomAt(dialogWidthVp=192, densi...: actual=${actual}`);
      expect(actual).assertClose(191.15577889447235, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0249 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0250
     * @tc.name      NdkNotification_DialogTextRoomAt_0250
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=2) returns 204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0250 begin`);
      const actual: number = dialogTextRoomAt(288, 2);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertEqual(204);
      logInfo(`${BUNDLE}DialogTextRoomAt_0250 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0251
     * @tc.name      NdkNotification_DialogTextRoomAt_0251
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=1) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0251 begin`);
      const actual: number = dialogTextRoomAt(288, 1);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}DialogTextRoomAt_0251 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0252
     * @tc.name      NdkNotification_DialogTextRoomAt_0252
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=3) returns 232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0252 begin`);
      const actual: number = dialogTextRoomAt(288, 3);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertEqual(232);
      logInfo(`${BUNDLE}DialogTextRoomAt_0252 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0253
     * @tc.name      NdkNotification_DialogTextRoomAt_0253
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=0) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0253 begin`);
      const actual: number = dialogTextRoomAt(288, 0);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}DialogTextRoomAt_0253 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0254
     * @tc.name      NdkNotification_DialogTextRoomAt_0254
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=10) returns 271.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0254 begin`);
      const actual: number = dialogTextRoomAt(288, 10);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(271.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0254 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0255
     * @tc.name      NdkNotification_DialogTextRoomAt_0255
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=100) returns 286.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0255 begin`);
      const actual: number = dialogTextRoomAt(288, 100);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(286.32, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0255 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0256
     * @tc.name      NdkNotification_DialogTextRoomAt_0256
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=5) returns 254.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0256 begin`);
      const actual: number = dialogTextRoomAt(288, 5);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(254.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0256 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0257
     * @tc.name      NdkNotification_DialogTextRoomAt_0257
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=15) returns 276.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0257 begin`);
      const actual: number = dialogTextRoomAt(288, 15);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(276.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0257 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0258
     * @tc.name      NdkNotification_DialogTextRoomAt_0258
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=20) returns 279.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0258 begin`);
      const actual: number = dialogTextRoomAt(288, 20);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(279.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0258 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0259
     * @tc.name      NdkNotification_DialogTextRoomAt_0259
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=25) returns 281.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0259 begin`);
      const actual: number = dialogTextRoomAt(288, 25);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(281.28, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0259 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0260
     * @tc.name      NdkNotification_DialogTextRoomAt_0260
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=30) returns 282.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0260 begin`);
      const actual: number = dialogTextRoomAt(288, 30);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(282.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0260 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0261
     * @tc.name      NdkNotification_DialogTextRoomAt_0261
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=35) returns 283.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0261 begin`);
      const actual: number = dialogTextRoomAt(288, 35);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(283.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0261 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0262
     * @tc.name      NdkNotification_DialogTextRoomAt_0262
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=40) returns 283.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0262 begin`);
      const actual: number = dialogTextRoomAt(288, 40);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(283.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0262 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0263
     * @tc.name      NdkNotification_DialogTextRoomAt_0263
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=45) returns 284.26666666666665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0263 begin`);
      const actual: number = dialogTextRoomAt(288, 45);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(284.26666666666665, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0263 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0264
     * @tc.name      NdkNotification_DialogTextRoomAt_0264
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=50) returns 284.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0264 begin`);
      const actual: number = dialogTextRoomAt(288, 50);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(284.64, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0264 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0265
     * @tc.name      NdkNotification_DialogTextRoomAt_0265
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=55) returns 284.94545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0265 begin`);
      const actual: number = dialogTextRoomAt(288, 55);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(284.94545454545454, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0265 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0266
     * @tc.name      NdkNotification_DialogTextRoomAt_0266
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=60) returns 285.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0266 begin`);
      const actual: number = dialogTextRoomAt(288, 60);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(285.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0266 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0267
     * @tc.name      NdkNotification_DialogTextRoomAt_0267
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=65) returns 285.4153846153846
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0267 begin`);
      const actual: number = dialogTextRoomAt(288, 65);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(285.4153846153846, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0267 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0268
     * @tc.name      NdkNotification_DialogTextRoomAt_0268
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=70) returns 285.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0268 begin`);
      const actual: number = dialogTextRoomAt(288, 70);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(285.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0268 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0269
     * @tc.name      NdkNotification_DialogTextRoomAt_0269
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=75) returns 285.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0269 begin`);
      const actual: number = dialogTextRoomAt(288, 75);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(285.76, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0269 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0270
     * @tc.name      NdkNotification_DialogTextRoomAt_0270
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=80) returns 285.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0270 begin`);
      const actual: number = dialogTextRoomAt(288, 80);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(285.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0270 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0271
     * @tc.name      NdkNotification_DialogTextRoomAt_0271
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=85) returns 286.0235294117647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0271 begin`);
      const actual: number = dialogTextRoomAt(288, 85);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(286.0235294117647, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0271 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0272
     * @tc.name      NdkNotification_DialogTextRoomAt_0272
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=90) returns 286.1333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0272 begin`);
      const actual: number = dialogTextRoomAt(288, 90);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(286.1333333333333, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0272 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0273
     * @tc.name      NdkNotification_DialogTextRoomAt_0273
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=95) returns 286.2315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0273 begin`);
      const actual: number = dialogTextRoomAt(288, 95);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(286.2315789473684, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0273 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0274
     * @tc.name      NdkNotification_DialogTextRoomAt_0274
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=105) returns 286.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0274 begin`);
      const actual: number = dialogTextRoomAt(288, 105);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(286.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0274 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0275
     * @tc.name      NdkNotification_DialogTextRoomAt_0275
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=110) returns 286.4727272727273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0275 begin`);
      const actual: number = dialogTextRoomAt(288, 110);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(286.4727272727273, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0275 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0276
     * @tc.name      NdkNotification_DialogTextRoomAt_0276
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=115) returns 286.53913043478263
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0276 begin`);
      const actual: number = dialogTextRoomAt(288, 115);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(286.53913043478263, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0276 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0277
     * @tc.name      NdkNotification_DialogTextRoomAt_0277
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=71) returns 285.63380281690144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0277 begin`);
      const actual: number = dialogTextRoomAt(288, 71);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(285.63380281690144, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0277 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0278
     * @tc.name      NdkNotification_DialogTextRoomAt_0278
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=288, density=199) returns 287.15577889447235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0278 begin`);
      const actual: number = dialogTextRoomAt(288, 199);
      logInfo(`dialogTextRoomAt(dialogWidthVp=288, densi...: actual=${actual}`);
      expect(actual).assertClose(287.15577889447235, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0278 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0279
     * @tc.name      NdkNotification_DialogTextRoomAt_0279
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=2) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0279 begin`);
      const actual: number = dialogTextRoomAt(384, 2);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}DialogTextRoomAt_0279 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0280
     * @tc.name      NdkNotification_DialogTextRoomAt_0280
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=1) returns 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0280 begin`);
      const actual: number = dialogTextRoomAt(384, 1);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertEqual(216);
      logInfo(`${BUNDLE}DialogTextRoomAt_0280 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0281
     * @tc.name      NdkNotification_DialogTextRoomAt_0281
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=3) returns 328
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0281 begin`);
      const actual: number = dialogTextRoomAt(384, 3);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertEqual(328);
      logInfo(`${BUNDLE}DialogTextRoomAt_0281 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0282
     * @tc.name      NdkNotification_DialogTextRoomAt_0282
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=0) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextRoomAt_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0282 begin`);
      const actual: number = dialogTextRoomAt(384, 0);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}DialogTextRoomAt_0282 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0283
     * @tc.name      NdkNotification_DialogTextRoomAt_0283
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=10) returns 367.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0283 begin`);
      const actual: number = dialogTextRoomAt(384, 10);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(367.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0283 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0284
     * @tc.name      NdkNotification_DialogTextRoomAt_0284
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=100) returns 382.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0284 begin`);
      const actual: number = dialogTextRoomAt(384, 100);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(382.32, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0284 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0285
     * @tc.name      NdkNotification_DialogTextRoomAt_0285
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=5) returns 350.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0285 begin`);
      const actual: number = dialogTextRoomAt(384, 5);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(350.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0285 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0286
     * @tc.name      NdkNotification_DialogTextRoomAt_0286
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=15) returns 372.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0286 begin`);
      const actual: number = dialogTextRoomAt(384, 15);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(372.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0286 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0287
     * @tc.name      NdkNotification_DialogTextRoomAt_0287
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=20) returns 375.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0287 begin`);
      const actual: number = dialogTextRoomAt(384, 20);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(375.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0287 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0288
     * @tc.name      NdkNotification_DialogTextRoomAt_0288
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=25) returns 377.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0288 begin`);
      const actual: number = dialogTextRoomAt(384, 25);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(377.28, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0288 end`);
    });
  });
}
