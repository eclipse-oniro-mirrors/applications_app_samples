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
import {
  BUTTON_FONT_SIZE, CHECK_BUTTON_LABEL, DIALOG_BUTTON_FONT_WEIGHT, DIALOG_BUTTON_MARGIN, DIALOG_RESULT_PREFIX,
  DIALOG_TEXT_FONT_WEIGHT, DIALOG_TEXT_MARGIN_PX, DIALOG_TEXT_WIDTH_PERCENT, DIALOG_TITLE, DIALOG_TITLE_FONT_SIZE,
  DIALOG_TITLE_HEIGHT_PX, NAPI_METHOD_NAME, OK_BUTTON_LABEL, PAGE_MESSAGE, SIDE_MARGIN, TITLE_AREA_PX,
  TITLE_FONT_SIZE, TITLE_FONT_WEIGHT, TITLE_MARGIN_TOP
} from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for NdkNotificationLogic (19 cases). */
export default function ndkNotificationLogicConstantsTest(): void {
  describe('NdkNotificationLogicConstantsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0001
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0001
     * @tc.desc      PAGE_MESSAGE keeps value "Native Notification Sample"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_NdkNotificationLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0001 begin`);
      const actual: string = PAGE_MESSAGE;
      logInfo(`PAGE_MESSAGE: actual=${actual}`);
      expect(actual).assertEqual('Native Notification Sample');
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0002
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0002
     * @tc.desc      CHECK_BUTTON_LABEL keeps value "Check notification enabled"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_NdkNotificationLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0002 begin`);
      const actual: string = CHECK_BUTTON_LABEL;
      logInfo(`CHECK_BUTTON_LABEL: actual=${actual}`);
      expect(actual).assertEqual('Check notification enabled');
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0003
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0003
     * @tc.desc      DIALOG_RESULT_PREFIX keeps value "Current application notification enabled: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0003 begin`);
      const actual: string = DIALOG_RESULT_PREFIX;
      logInfo(`DIALOG_RESULT_PREFIX: actual=${actual}`);
      expect(actual).assertEqual('Current application notification enabled: ');
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0004
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0004
     * @tc.desc      OK_BUTTON_LABEL keeps value "OK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0004 begin`);
      const actual: string = OK_BUTTON_LABEL;
      logInfo(`OK_BUTTON_LABEL: actual=${actual}`);
      expect(actual).assertEqual('OK');
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0005
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0005
     * @tc.desc      TITLE_AREA_PX keeps value 280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0005 begin`);
      const actual: number = TITLE_AREA_PX;
      logInfo(`TITLE_AREA_PX: actual=${actual}`);
      expect(actual).assertEqual(280);
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0006
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0006
     * @tc.desc      DIALOG_TITLE_HEIGHT_PX keeps value 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0006 begin`);
      const actual: number = DIALOG_TITLE_HEIGHT_PX;
      logInfo(`DIALOG_TITLE_HEIGHT_PX: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0007
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0007
     * @tc.desc      DIALOG_TEXT_MARGIN_PX keeps value 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0007 begin`);
      const actual: number = DIALOG_TEXT_MARGIN_PX;
      logInfo(`DIALOG_TEXT_MARGIN_PX: actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0008
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0008
     * @tc.desc      TITLE_FONT_SIZE keeps value 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0008 begin`);
      const actual: number = TITLE_FONT_SIZE;
      logInfo(`TITLE_FONT_SIZE: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0009
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0009
     * @tc.desc      TITLE_FONT_WEIGHT keeps value 700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0009 begin`);
      const actual: number = TITLE_FONT_WEIGHT;
      logInfo(`TITLE_FONT_WEIGHT: actual=${actual}`);
      expect(actual).assertEqual(700);
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0010
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0010
     * @tc.desc      TITLE_MARGIN_TOP keeps value 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0010 begin`);
      const actual: number = TITLE_MARGIN_TOP;
      logInfo(`TITLE_MARGIN_TOP: actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0011
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0011
     * @tc.desc      SIDE_MARGIN keeps value 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0011 begin`);
      const actual: number = SIDE_MARGIN;
      logInfo(`SIDE_MARGIN: actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0012
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0012
     * @tc.desc      BUTTON_FONT_SIZE keeps value 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0012 begin`);
      const actual: number = BUTTON_FONT_SIZE;
      logInfo(`BUTTON_FONT_SIZE: actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0013
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0013
     * @tc.desc      DIALOG_TITLE_FONT_SIZE keeps value 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0013 begin`);
      const actual: number = DIALOG_TITLE_FONT_SIZE;
      logInfo(`DIALOG_TITLE_FONT_SIZE: actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0014
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0014
     * @tc.desc      DIALOG_TEXT_FONT_WEIGHT keeps value 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0014 begin`);
      const actual: number = DIALOG_TEXT_FONT_WEIGHT;
      logInfo(`DIALOG_TEXT_FONT_WEIGHT: actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0015
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0015
     * @tc.desc      DIALOG_BUTTON_FONT_WEIGHT keeps value 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0015 begin`);
      const actual: number = DIALOG_BUTTON_FONT_WEIGHT;
      logInfo(`DIALOG_BUTTON_FONT_WEIGHT: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0016
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0016
     * @tc.desc      DIALOG_BUTTON_MARGIN keeps value 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0016 begin`);
      const actual: number = DIALOG_BUTTON_MARGIN;
      logInfo(`DIALOG_BUTTON_MARGIN: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0017
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0017
     * @tc.desc      DIALOG_TEXT_WIDTH_PERCENT keeps value 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0017 begin`);
      const actual: number = DIALOG_TEXT_WIDTH_PERCENT;
      logInfo(`DIALOG_TEXT_WIDTH_PERCENT: actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0018
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0018
     * @tc.desc      NAPI_METHOD_NAME keeps value "isNotificationEnabled"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0018 begin`);
      const actual: string = NAPI_METHOD_NAME;
      logInfo(`NAPI_METHOD_NAME: actual=${actual}`);
      expect(actual).assertEqual('isNotificationEnabled');
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_NATIVE_NOTIFICATION_LOGIC_CONSTANTS_0019
     * @tc.name      NdkNotification_NdkNotificationLogicConstants_0019
     * @tc.desc      DIALOG_TITLE keeps value "Native Notification Sample"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_NdkNotificationLogicConstants_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0019 begin`);
      const actual: string = DIALOG_TITLE;
      logInfo(`DIALOG_TITLE: actual=${actual}`);
      expect(actual).assertEqual('Native Notification Sample');
      logInfo(`${BUNDLE}NdkNotificationLogicConstants_0019 end`);
    });
  });
}
