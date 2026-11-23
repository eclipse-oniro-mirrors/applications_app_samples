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
import { titleTextWidthOf } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for titleTextWidthOf (24 cases). */
export default function titleTextWidthOf2Test(): void {
  describe('TitleTextWidthOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0097
     * @tc.name      NdkNotification_TitleTextWidthOf_0097
     * @tc.desc      titleTextWidthOf(pageWidthVp=218) returns 186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0097 begin`);
      const actual: number = titleTextWidthOf(218);
      logInfo(`titleTextWidthOf(pageWidthVp=218): actual=${actual}`);
      expect(actual).assertEqual(186);
      logInfo(`${BUNDLE}TitleTextWidthOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0098
     * @tc.name      NdkNotification_TitleTextWidthOf_0098
     * @tc.desc      titleTextWidthOf(pageWidthVp=899.82) returns 867.82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0098 begin`);
      const actual: number = titleTextWidthOf(899.82);
      logInfo(`titleTextWidthOf(pageWidthVp=899.82): actual=${actual}`);
      expect(actual).assertClose(867.82, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0099
     * @tc.name      NdkNotification_TitleTextWidthOf_0099
     * @tc.desc      titleTextWidthOf(pageWidthVp=533.8) returns 501.79999999999995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0099 begin`);
      const actual: number = titleTextWidthOf(533.8);
      logInfo(`titleTextWidthOf(pageWidthVp=533.8): actual=${actual}`);
      expect(actual).assertClose(501.79999999999995, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0100
     * @tc.name      NdkNotification_TitleTextWidthOf_0100
     * @tc.desc      titleTextWidthOf(pageWidthVp=3144) returns 3112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0100 begin`);
      const actual: number = titleTextWidthOf(3144);
      logInfo(`titleTextWidthOf(pageWidthVp=3144): actual=${actual}`);
      expect(actual).assertEqual(3112);
      logInfo(`${BUNDLE}TitleTextWidthOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0101
     * @tc.name      NdkNotification_TitleTextWidthOf_0101
     * @tc.desc      titleTextWidthOf(pageWidthVp=1990) returns 1958
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0101 begin`);
      const actual: number = titleTextWidthOf(1990);
      logInfo(`titleTextWidthOf(pageWidthVp=1990): actual=${actual}`);
      expect(actual).assertEqual(1958);
      logInfo(`${BUNDLE}TitleTextWidthOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0102
     * @tc.name      NdkNotification_TitleTextWidthOf_0102
     * @tc.desc      titleTextWidthOf(pageWidthVp=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0102 begin`);
      const actual: number = titleTextWidthOf(1);
      logInfo(`titleTextWidthOf(pageWidthVp=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0103
     * @tc.name      NdkNotification_TitleTextWidthOf_0103
     * @tc.desc      titleTextWidthOf(pageWidthVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0103 begin`);
      const actual: number = titleTextWidthOf(-1);
      logInfo(`titleTextWidthOf(pageWidthVp=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0104
     * @tc.name      NdkNotification_TitleTextWidthOf_0104
     * @tc.desc      titleTextWidthOf(pageWidthVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0104 begin`);
      const actual: number = titleTextWidthOf(2);
      logInfo(`titleTextWidthOf(pageWidthVp=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0105
     * @tc.name      NdkNotification_TitleTextWidthOf_0105
     * @tc.desc      titleTextWidthOf(pageWidthVp=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0105 begin`);
      const actual: number = titleTextWidthOf(3);
      logInfo(`titleTextWidthOf(pageWidthVp=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0106
     * @tc.name      NdkNotification_TitleTextWidthOf_0106
     * @tc.desc      titleTextWidthOf(pageWidthVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0106 begin`);
      const actual: number = titleTextWidthOf(10);
      logInfo(`titleTextWidthOf(pageWidthVp=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0107
     * @tc.name      NdkNotification_TitleTextWidthOf_0107
     * @tc.desc      titleTextWidthOf(pageWidthVp=-1911) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0107 begin`);
      const actual: number = titleTextWidthOf(-1911);
      logInfo(`titleTextWidthOf(pageWidthVp=-1911): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0108
     * @tc.name      NdkNotification_TitleTextWidthOf_0108
     * @tc.desc      titleTextWidthOf(pageWidthVp=-1511) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0108 begin`);
      const actual: number = titleTextWidthOf(-1511);
      logInfo(`titleTextWidthOf(pageWidthVp=-1511): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0109
     * @tc.name      NdkNotification_TitleTextWidthOf_0109
     * @tc.desc      titleTextWidthOf(pageWidthVp=-1281) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0109 begin`);
      const actual: number = titleTextWidthOf(-1281);
      logInfo(`titleTextWidthOf(pageWidthVp=-1281): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0110
     * @tc.name      NdkNotification_TitleTextWidthOf_0110
     * @tc.desc      titleTextWidthOf(pageWidthVp=-1196) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0110 begin`);
      const actual: number = titleTextWidthOf(-1196);
      logInfo(`titleTextWidthOf(pageWidthVp=-1196): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0111
     * @tc.name      NdkNotification_TitleTextWidthOf_0111
     * @tc.desc      titleTextWidthOf(pageWidthVp=-1747) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0111 begin`);
      const actual: number = titleTextWidthOf(-1747);
      logInfo(`titleTextWidthOf(pageWidthVp=-1747): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0112
     * @tc.name      NdkNotification_TitleTextWidthOf_0112
     * @tc.desc      titleTextWidthOf(pageWidthVp=-331) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0112 begin`);
      const actual: number = titleTextWidthOf(-331);
      logInfo(`titleTextWidthOf(pageWidthVp=-331): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0113
     * @tc.name      NdkNotification_TitleTextWidthOf_0113
     * @tc.desc      titleTextWidthOf(pageWidthVp=-508) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0113 begin`);
      const actual: number = titleTextWidthOf(-508);
      logInfo(`titleTextWidthOf(pageWidthVp=-508): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0114
     * @tc.name      NdkNotification_TitleTextWidthOf_0114
     * @tc.desc      titleTextWidthOf(pageWidthVp=-552) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0114 begin`);
      const actual: number = titleTextWidthOf(-552);
      logInfo(`titleTextWidthOf(pageWidthVp=-552): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0115
     * @tc.name      NdkNotification_TitleTextWidthOf_0115
     * @tc.desc      titleTextWidthOf(pageWidthVp=-1199) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0115 begin`);
      const actual: number = titleTextWidthOf(-1199);
      logInfo(`titleTextWidthOf(pageWidthVp=-1199): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0116
     * @tc.name      NdkNotification_TitleTextWidthOf_0116
     * @tc.desc      titleTextWidthOf(pageWidthVp=-1489) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0116 begin`);
      const actual: number = titleTextWidthOf(-1489);
      logInfo(`titleTextWidthOf(pageWidthVp=-1489): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0117
     * @tc.name      NdkNotification_TitleTextWidthOf_0117
     * @tc.desc      titleTextWidthOf(pageWidthVp=-9) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0117 begin`);
      const actual: number = titleTextWidthOf(-9);
      logInfo(`titleTextWidthOf(pageWidthVp=-9): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0118
     * @tc.name      NdkNotification_TitleTextWidthOf_0118
     * @tc.desc      titleTextWidthOf(pageWidthVp=-1240) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0118 begin`);
      const actual: number = titleTextWidthOf(-1240);
      logInfo(`titleTextWidthOf(pageWidthVp=-1240): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0119
     * @tc.name      NdkNotification_TitleTextWidthOf_0119
     * @tc.desc      titleTextWidthOf(pageWidthVp=-729) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0119 begin`);
      const actual: number = titleTextWidthOf(-729);
      logInfo(`titleTextWidthOf(pageWidthVp=-729): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0120
     * @tc.name      NdkNotification_TitleTextWidthOf_0120
     * @tc.desc      titleTextWidthOf(pageWidthVp=-202) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleTextWidthOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0120 begin`);
      const actual: number = titleTextWidthOf(-202);
      logInfo(`titleTextWidthOf(pageWidthVp=-202): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0120 end`);
    });
  });
}
