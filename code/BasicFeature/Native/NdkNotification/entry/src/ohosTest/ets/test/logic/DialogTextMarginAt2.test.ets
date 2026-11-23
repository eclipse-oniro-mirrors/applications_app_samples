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

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for dialogTextMarginAt (24 cases). */
export default function dialogTextMarginAt2Test(): void {
  describe('DialogTextMarginAt2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0097
     * @tc.name      NdkNotification_DialogTextMarginAt_0097
     * @tc.desc      dialogTextMarginAt(density=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0097 begin`);
      const actual: number = dialogTextMarginAt(-1);
      logInfo(`dialogTextMarginAt(density=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0098
     * @tc.name      NdkNotification_DialogTextMarginAt_0098
     * @tc.desc      dialogTextMarginAt(density=-11) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0098 begin`);
      const actual: number = dialogTextMarginAt(-11);
      logInfo(`dialogTextMarginAt(density=-11): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0099
     * @tc.name      NdkNotification_DialogTextMarginAt_0099
     * @tc.desc      dialogTextMarginAt(density=-98) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0099 begin`);
      const actual: number = dialogTextMarginAt(-98);
      logInfo(`dialogTextMarginAt(density=-98): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0100
     * @tc.name      NdkNotification_DialogTextMarginAt_0100
     * @tc.desc      dialogTextMarginAt(density=-7) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0100 begin`);
      const actual: number = dialogTextMarginAt(-7);
      logInfo(`dialogTextMarginAt(density=-7): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0101
     * @tc.name      NdkNotification_DialogTextMarginAt_0101
     * @tc.desc      dialogTextMarginAt(density=-55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0101 begin`);
      const actual: number = dialogTextMarginAt(-55);
      logInfo(`dialogTextMarginAt(density=-55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0102
     * @tc.name      NdkNotification_DialogTextMarginAt_0102
     * @tc.desc      dialogTextMarginAt(density=-12) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0102 begin`);
      const actual: number = dialogTextMarginAt(-12);
      logInfo(`dialogTextMarginAt(density=-12): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0103
     * @tc.name      NdkNotification_DialogTextMarginAt_0103
     * @tc.desc      dialogTextMarginAt(density=-17) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0103 begin`);
      const actual: number = dialogTextMarginAt(-17);
      logInfo(`dialogTextMarginAt(density=-17): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0104
     * @tc.name      NdkNotification_DialogTextMarginAt_0104
     * @tc.desc      dialogTextMarginAt(density=-30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0104 begin`);
      const actual: number = dialogTextMarginAt(-30);
      logInfo(`dialogTextMarginAt(density=-30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0105
     * @tc.name      NdkNotification_DialogTextMarginAt_0105
     * @tc.desc      dialogTextMarginAt(density=-41) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0105 begin`);
      const actual: number = dialogTextMarginAt(-41);
      logInfo(`dialogTextMarginAt(density=-41): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0106
     * @tc.name      NdkNotification_DialogTextMarginAt_0106
     * @tc.desc      dialogTextMarginAt(density=-60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0106 begin`);
      const actual: number = dialogTextMarginAt(-60);
      logInfo(`dialogTextMarginAt(density=-60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0107
     * @tc.name      NdkNotification_DialogTextMarginAt_0107
     * @tc.desc      dialogTextMarginAt(density=-37) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0107 begin`);
      const actual: number = dialogTextMarginAt(-37);
      logInfo(`dialogTextMarginAt(density=-37): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0108
     * @tc.name      NdkNotification_DialogTextMarginAt_0108
     * @tc.desc      dialogTextMarginAt(density=-13) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0108 begin`);
      const actual: number = dialogTextMarginAt(-13);
      logInfo(`dialogTextMarginAt(density=-13): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0109
     * @tc.name      NdkNotification_DialogTextMarginAt_0109
     * @tc.desc      dialogTextMarginAt(density=-3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0109 begin`);
      const actual: number = dialogTextMarginAt(-3);
      logInfo(`dialogTextMarginAt(density=-3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0110
     * @tc.name      NdkNotification_DialogTextMarginAt_0110
     * @tc.desc      dialogTextMarginAt(density=-82) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0110 begin`);
      const actual: number = dialogTextMarginAt(-82);
      logInfo(`dialogTextMarginAt(density=-82): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0111
     * @tc.name      NdkNotification_DialogTextMarginAt_0111
     * @tc.desc      dialogTextMarginAt(density=-22) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0111 begin`);
      const actual: number = dialogTextMarginAt(-22);
      logInfo(`dialogTextMarginAt(density=-22): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0112
     * @tc.name      NdkNotification_DialogTextMarginAt_0112
     * @tc.desc      dialogTextMarginAt(density=-88) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0112 begin`);
      const actual: number = dialogTextMarginAt(-88);
      logInfo(`dialogTextMarginAt(density=-88): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0113
     * @tc.name      NdkNotification_DialogTextMarginAt_0113
     * @tc.desc      dialogTextMarginAt(density=-72) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0113 begin`);
      const actual: number = dialogTextMarginAt(-72);
      logInfo(`dialogTextMarginAt(density=-72): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0114
     * @tc.name      NdkNotification_DialogTextMarginAt_0114
     * @tc.desc      dialogTextMarginAt(density=-9) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0114 begin`);
      const actual: number = dialogTextMarginAt(-9);
      logInfo(`dialogTextMarginAt(density=-9): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0115
     * @tc.name      NdkNotification_DialogTextMarginAt_0115
     * @tc.desc      dialogTextMarginAt(density=-2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0115 begin`);
      const actual: number = dialogTextMarginAt(-2);
      logInfo(`dialogTextMarginAt(density=-2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0116
     * @tc.name      NdkNotification_DialogTextMarginAt_0116
     * @tc.desc      dialogTextMarginAt(density=-8) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0116 begin`);
      const actual: number = dialogTextMarginAt(-8);
      logInfo(`dialogTextMarginAt(density=-8): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0117
     * @tc.name      NdkNotification_DialogTextMarginAt_0117
     * @tc.desc      dialogTextMarginAt(density=-75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0117 begin`);
      const actual: number = dialogTextMarginAt(-75);
      logInfo(`dialogTextMarginAt(density=-75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0118
     * @tc.name      NdkNotification_DialogTextMarginAt_0118
     * @tc.desc      dialogTextMarginAt(density=-4) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0118 begin`);
      const actual: number = dialogTextMarginAt(-4);
      logInfo(`dialogTextMarginAt(density=-4): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0119
     * @tc.name      NdkNotification_DialogTextMarginAt_0119
     * @tc.desc      dialogTextMarginAt(density=-35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0119 begin`);
      const actual: number = dialogTextMarginAt(-35);
      logInfo(`dialogTextMarginAt(density=-35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_MARGIN_AT_0120
     * @tc.name      NdkNotification_DialogTextMarginAt_0120
     * @tc.desc      dialogTextMarginAt(density=-64) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextMarginAt_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextMarginAt_0120 begin`);
      const actual: number = dialogTextMarginAt(-64);
      logInfo(`dialogTextMarginAt(density=-64): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextMarginAt_0120 end`);
    });
  });
}
