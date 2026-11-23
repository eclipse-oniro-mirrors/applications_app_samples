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

/** Logic checks for dialogTextRoomAt (11 cases). */
export default function dialogTextRoomAt4Test(): void {
  describe('DialogTextRoomAt4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0289
     * @tc.name      NdkNotification_DialogTextRoomAt_0289
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=30) returns 378.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0289 begin`);
      const actual: number = dialogTextRoomAt(384, 30);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(378.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0289 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0290
     * @tc.name      NdkNotification_DialogTextRoomAt_0290
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=35) returns 379.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0290 begin`);
      const actual: number = dialogTextRoomAt(384, 35);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(379.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0290 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0291
     * @tc.name      NdkNotification_DialogTextRoomAt_0291
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=40) returns 379.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0291 begin`);
      const actual: number = dialogTextRoomAt(384, 40);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(379.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0291 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0292
     * @tc.name      NdkNotification_DialogTextRoomAt_0292
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=45) returns 380.26666666666665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0292 begin`);
      const actual: number = dialogTextRoomAt(384, 45);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(380.26666666666665, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0292 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0293
     * @tc.name      NdkNotification_DialogTextRoomAt_0293
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=50) returns 380.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0293 begin`);
      const actual: number = dialogTextRoomAt(384, 50);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(380.64, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0293 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0294
     * @tc.name      NdkNotification_DialogTextRoomAt_0294
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=55) returns 380.94545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0294 begin`);
      const actual: number = dialogTextRoomAt(384, 55);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(380.94545454545454, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0294 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0295
     * @tc.name      NdkNotification_DialogTextRoomAt_0295
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=60) returns 381.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0295 begin`);
      const actual: number = dialogTextRoomAt(384, 60);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(381.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0295 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0296
     * @tc.name      NdkNotification_DialogTextRoomAt_0296
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=65) returns 381.4153846153846
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0296 begin`);
      const actual: number = dialogTextRoomAt(384, 65);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(381.4153846153846, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0296 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0297
     * @tc.name      NdkNotification_DialogTextRoomAt_0297
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=70) returns 381.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0297 begin`);
      const actual: number = dialogTextRoomAt(384, 70);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(381.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0297 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0298
     * @tc.name      NdkNotification_DialogTextRoomAt_0298
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=75) returns 381.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0298 begin`);
      const actual: number = dialogTextRoomAt(384, 75);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(381.76, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0298 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_ROOM_AT_0299
     * @tc.name      NdkNotification_DialogTextRoomAt_0299
     * @tc.desc      dialogTextRoomAt(dialogWidthVp=384, density=80) returns 381.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextRoomAt_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextRoomAt_0299 begin`);
      const actual: number = dialogTextRoomAt(384, 80);
      logInfo(`dialogTextRoomAt(dialogWidthVp=384, densi...: actual=${actual}`);
      expect(actual).assertClose(381.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextRoomAt_0299 end`);
    });
  });
}
