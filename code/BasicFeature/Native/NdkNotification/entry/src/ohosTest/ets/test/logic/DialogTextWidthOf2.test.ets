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
import { dialogTextWidthOf } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for dialogTextWidthOf (24 cases). */
export default function dialogTextWidthOf2Test(): void {
  describe('DialogTextWidthOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0097
     * @tc.name      NdkNotification_DialogTextWidthOf_0097
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1727.46) returns 1554.714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0097 begin`);
      const actual: number = dialogTextWidthOf(1727.46);
      logInfo(`dialogTextWidthOf(parentWidthVp=1727.46): actual=${actual}`);
      expect(actual).assertClose(1554.714, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0098
     * @tc.name      NdkNotification_DialogTextWidthOf_0098
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-1343) returns -1208.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0098 begin`);
      const actual: number = dialogTextWidthOf(-1343);
      logInfo(`dialogTextWidthOf(parentWidthVp=-1343): actual=${actual}`);
      expect(actual).assertClose(-1208.7, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0099
     * @tc.name      NdkNotification_DialogTextWidthOf_0099
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-566) returns -509.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0099 begin`);
      const actual: number = dialogTextWidthOf(-566);
      logInfo(`dialogTextWidthOf(parentWidthVp=-566): actual=${actual}`);
      expect(actual).assertClose(-509.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0100
     * @tc.name      NdkNotification_DialogTextWidthOf_0100
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-356) returns -320.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0100 begin`);
      const actual: number = dialogTextWidthOf(-356);
      logInfo(`dialogTextWidthOf(parentWidthVp=-356): actual=${actual}`);
      expect(actual).assertClose(-320.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0101
     * @tc.name      NdkNotification_DialogTextWidthOf_0101
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1211) returns 1089.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0101 begin`);
      const actual: number = dialogTextWidthOf(1211);
      logInfo(`dialogTextWidthOf(parentWidthVp=1211): actual=${actual}`);
      expect(actual).assertClose(1089.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0102
     * @tc.name      NdkNotification_DialogTextWidthOf_0102
     * @tc.desc      dialogTextWidthOf(parentWidthVp=241) returns 216.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0102 begin`);
      const actual: number = dialogTextWidthOf(241);
      logInfo(`dialogTextWidthOf(parentWidthVp=241): actual=${actual}`);
      expect(actual).assertClose(216.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0103
     * @tc.name      NdkNotification_DialogTextWidthOf_0103
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1866) returns 1679.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0103 begin`);
      const actual: number = dialogTextWidthOf(1866);
      logInfo(`dialogTextWidthOf(parentWidthVp=1866): actual=${actual}`);
      expect(actual).assertClose(1679.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0104
     * @tc.name      NdkNotification_DialogTextWidthOf_0104
     * @tc.desc      dialogTextWidthOf(parentWidthVp=326) returns 293.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0104 begin`);
      const actual: number = dialogTextWidthOf(326);
      logInfo(`dialogTextWidthOf(parentWidthVp=326): actual=${actual}`);
      expect(actual).assertClose(293.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0105
     * @tc.name      NdkNotification_DialogTextWidthOf_0105
     * @tc.desc      dialogTextWidthOf(parentWidthVp=861) returns 774.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0105 begin`);
      const actual: number = dialogTextWidthOf(861);
      logInfo(`dialogTextWidthOf(parentWidthVp=861): actual=${actual}`);
      expect(actual).assertClose(774.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0106
     * @tc.name      NdkNotification_DialogTextWidthOf_0106
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3152) returns 2836.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0106 begin`);
      const actual: number = dialogTextWidthOf(3152);
      logInfo(`dialogTextWidthOf(parentWidthVp=3152): actual=${actual}`);
      expect(actual).assertClose(2836.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0107
     * @tc.name      NdkNotification_DialogTextWidthOf_0107
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2164) returns 1947.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0107 begin`);
      const actual: number = dialogTextWidthOf(2164);
      logInfo(`dialogTextWidthOf(parentWidthVp=2164): actual=${actual}`);
      expect(actual).assertClose(1947.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0108
     * @tc.name      NdkNotification_DialogTextWidthOf_0108
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-507) returns -456.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0108 begin`);
      const actual: number = dialogTextWidthOf(-507);
      logInfo(`dialogTextWidthOf(parentWidthVp=-507): actual=${actual}`);
      expect(actual).assertClose(-456.3, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0109
     * @tc.name      NdkNotification_DialogTextWidthOf_0109
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-508) returns -457.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0109 begin`);
      const actual: number = dialogTextWidthOf(-508);
      logInfo(`dialogTextWidthOf(parentWidthVp=-508): actual=${actual}`);
      expect(actual).assertClose(-457.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0110
     * @tc.name      NdkNotification_DialogTextWidthOf_0110
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2983) returns 2684.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0110 begin`);
      const actual: number = dialogTextWidthOf(2983);
      logInfo(`dialogTextWidthOf(parentWidthVp=2983): actual=${actual}`);
      expect(actual).assertClose(2684.7, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0111
     * @tc.name      NdkNotification_DialogTextWidthOf_0111
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-1124) returns -1011.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0111 begin`);
      const actual: number = dialogTextWidthOf(-1124);
      logInfo(`dialogTextWidthOf(parentWidthVp=-1124): actual=${actual}`);
      expect(actual).assertClose(-1011.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0112
     * @tc.name      NdkNotification_DialogTextWidthOf_0112
     * @tc.desc      dialogTextWidthOf(parentWidthVp=105.71) returns 95.139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0112 begin`);
      const actual: number = dialogTextWidthOf(105.71);
      logInfo(`dialogTextWidthOf(parentWidthVp=105.71): actual=${actual}`);
      expect(actual).assertClose(95.139, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0113
     * @tc.name      NdkNotification_DialogTextWidthOf_0113
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-851) returns -765.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0113 begin`);
      const actual: number = dialogTextWidthOf(-851);
      logInfo(`dialogTextWidthOf(parentWidthVp=-851): actual=${actual}`);
      expect(actual).assertClose(-765.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0114
     * @tc.name      NdkNotification_DialogTextWidthOf_0114
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-30) returns -27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0114 begin`);
      const actual: number = dialogTextWidthOf(-30);
      logInfo(`dialogTextWidthOf(parentWidthVp=-30): actual=${actual}`);
      expect(actual).assertEqual(-27);
      logInfo(`${BUNDLE}DialogTextWidthOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0115
     * @tc.name      NdkNotification_DialogTextWidthOf_0115
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-935) returns -841.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0115 begin`);
      const actual: number = dialogTextWidthOf(-935);
      logInfo(`dialogTextWidthOf(parentWidthVp=-935): actual=${actual}`);
      expect(actual).assertClose(-841.5, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0116
     * @tc.name      NdkNotification_DialogTextWidthOf_0116
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1818) returns 1636.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0116 begin`);
      const actual: number = dialogTextWidthOf(1818);
      logInfo(`dialogTextWidthOf(parentWidthVp=1818): actual=${actual}`);
      expect(actual).assertClose(1636.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0117
     * @tc.name      NdkNotification_DialogTextWidthOf_0117
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-474) returns -426.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0117 begin`);
      const actual: number = dialogTextWidthOf(-474);
      logInfo(`dialogTextWidthOf(parentWidthVp=-474): actual=${actual}`);
      expect(actual).assertClose(-426.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0118
     * @tc.name      NdkNotification_DialogTextWidthOf_0118
     * @tc.desc      dialogTextWidthOf(parentWidthVp=988.19) returns 889.3710000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0118 begin`);
      const actual: number = dialogTextWidthOf(988.19);
      logInfo(`dialogTextWidthOf(parentWidthVp=988.19): actual=${actual}`);
      expect(actual).assertClose(889.3710000000001, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0119
     * @tc.name      NdkNotification_DialogTextWidthOf_0119
     * @tc.desc      dialogTextWidthOf(parentWidthVp=286) returns 257.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0119 begin`);
      const actual: number = dialogTextWidthOf(286);
      logInfo(`dialogTextWidthOf(parentWidthVp=286): actual=${actual}`);
      expect(actual).assertClose(257.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0120
     * @tc.name      NdkNotification_DialogTextWidthOf_0120
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2904) returns 2613.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0120 begin`);
      const actual: number = dialogTextWidthOf(2904);
      logInfo(`dialogTextWidthOf(parentWidthVp=2904): actual=${actual}`);
      expect(actual).assertClose(2613.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0120 end`);
    });
  });
}
