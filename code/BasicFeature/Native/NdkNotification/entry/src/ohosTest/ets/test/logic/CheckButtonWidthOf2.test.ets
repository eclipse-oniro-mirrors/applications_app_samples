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
import { checkButtonWidthOf } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for checkButtonWidthOf (24 cases). */
export default function checkButtonWidthOf2Test(): void {
  describe('CheckButtonWidthOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0097
     * @tc.name      NdkNotification_CheckButtonWidthOf_0097
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1297) returns 1265
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0097 begin`);
      const actual: number = checkButtonWidthOf(1297);
      logInfo(`checkButtonWidthOf(rowWidthVp=1297): actual=${actual}`);
      expect(actual).assertEqual(1265);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0098
     * @tc.name      NdkNotification_CheckButtonWidthOf_0098
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3809) returns 3777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0098 begin`);
      const actual: number = checkButtonWidthOf(3809);
      logInfo(`checkButtonWidthOf(rowWidthVp=3809): actual=${actual}`);
      expect(actual).assertEqual(3777);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0099
     * @tc.name      NdkNotification_CheckButtonWidthOf_0099
     * @tc.desc      checkButtonWidthOf(rowWidthVp=99.35) returns 67.35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0099 begin`);
      const actual: number = checkButtonWidthOf(99.35);
      logInfo(`checkButtonWidthOf(rowWidthVp=99.35): actual=${actual}`);
      expect(actual).assertClose(67.35, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0100
     * @tc.name      NdkNotification_CheckButtonWidthOf_0100
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3289) returns 3257
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0100 begin`);
      const actual: number = checkButtonWidthOf(3289);
      logInfo(`checkButtonWidthOf(rowWidthVp=3289): actual=${actual}`);
      expect(actual).assertEqual(3257);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0101
     * @tc.name      NdkNotification_CheckButtonWidthOf_0101
     * @tc.desc      checkButtonWidthOf(rowWidthVp=327) returns 295
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0101 begin`);
      const actual: number = checkButtonWidthOf(327);
      logInfo(`checkButtonWidthOf(rowWidthVp=327): actual=${actual}`);
      expect(actual).assertEqual(295);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0102
     * @tc.name      NdkNotification_CheckButtonWidthOf_0102
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0102 begin`);
      const actual: number = checkButtonWidthOf(1);
      logInfo(`checkButtonWidthOf(rowWidthVp=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0103
     * @tc.name      NdkNotification_CheckButtonWidthOf_0103
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_CheckButtonWidthOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0103 begin`);
      const actual: number = checkButtonWidthOf(2);
      logInfo(`checkButtonWidthOf(rowWidthVp=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0104
     * @tc.name      NdkNotification_CheckButtonWidthOf_0104
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_CheckButtonWidthOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0104 begin`);
      const actual: number = checkButtonWidthOf(3);
      logInfo(`checkButtonWidthOf(rowWidthVp=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0105
     * @tc.name      NdkNotification_CheckButtonWidthOf_0105
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_CheckButtonWidthOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0105 begin`);
      const actual: number = checkButtonWidthOf(-1);
      logInfo(`checkButtonWidthOf(rowWidthVp=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0106
     * @tc.name      NdkNotification_CheckButtonWidthOf_0106
     * @tc.desc      checkButtonWidthOf(rowWidthVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0106 begin`);
      const actual: number = checkButtonWidthOf(10);
      logInfo(`checkButtonWidthOf(rowWidthVp=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0107
     * @tc.name      NdkNotification_CheckButtonWidthOf_0107
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-43) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_CheckButtonWidthOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0107 begin`);
      const actual: number = checkButtonWidthOf(-43);
      logInfo(`checkButtonWidthOf(rowWidthVp=-43): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0108
     * @tc.name      NdkNotification_CheckButtonWidthOf_0108
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-1171) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_CheckButtonWidthOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0108 begin`);
      const actual: number = checkButtonWidthOf(-1171);
      logInfo(`checkButtonWidthOf(rowWidthVp=-1171): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0109
     * @tc.name      NdkNotification_CheckButtonWidthOf_0109
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-186) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_CheckButtonWidthOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0109 begin`);
      const actual: number = checkButtonWidthOf(-186);
      logInfo(`checkButtonWidthOf(rowWidthVp=-186): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0110
     * @tc.name      NdkNotification_CheckButtonWidthOf_0110
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-1133) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_CheckButtonWidthOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0110 begin`);
      const actual: number = checkButtonWidthOf(-1133);
      logInfo(`checkButtonWidthOf(rowWidthVp=-1133): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0111
     * @tc.name      NdkNotification_CheckButtonWidthOf_0111
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-1314) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_CheckButtonWidthOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0111 begin`);
      const actual: number = checkButtonWidthOf(-1314);
      logInfo(`checkButtonWidthOf(rowWidthVp=-1314): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0112
     * @tc.name      NdkNotification_CheckButtonWidthOf_0112
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-1189) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_CheckButtonWidthOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0112 begin`);
      const actual: number = checkButtonWidthOf(-1189);
      logInfo(`checkButtonWidthOf(rowWidthVp=-1189): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0113
     * @tc.name      NdkNotification_CheckButtonWidthOf_0113
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-1374) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_CheckButtonWidthOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0113 begin`);
      const actual: number = checkButtonWidthOf(-1374);
      logInfo(`checkButtonWidthOf(rowWidthVp=-1374): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0114
     * @tc.name      NdkNotification_CheckButtonWidthOf_0114
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-150) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_CheckButtonWidthOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0114 begin`);
      const actual: number = checkButtonWidthOf(-150);
      logInfo(`checkButtonWidthOf(rowWidthVp=-150): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0115
     * @tc.name      NdkNotification_CheckButtonWidthOf_0115
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-530) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_CheckButtonWidthOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0115 begin`);
      const actual: number = checkButtonWidthOf(-530);
      logInfo(`checkButtonWidthOf(rowWidthVp=-530): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0116
     * @tc.name      NdkNotification_CheckButtonWidthOf_0116
     * @tc.desc      checkButtonWidthOf(rowWidthVp=17) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0116 begin`);
      const actual: number = checkButtonWidthOf(17);
      logInfo(`checkButtonWidthOf(rowWidthVp=17): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0117
     * @tc.name      NdkNotification_CheckButtonWidthOf_0117
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-409) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_CheckButtonWidthOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0117 begin`);
      const actual: number = checkButtonWidthOf(-409);
      logInfo(`checkButtonWidthOf(rowWidthVp=-409): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0118
     * @tc.name      NdkNotification_CheckButtonWidthOf_0118
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-282) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_CheckButtonWidthOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0118 begin`);
      const actual: number = checkButtonWidthOf(-282);
      logInfo(`checkButtonWidthOf(rowWidthVp=-282): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0119
     * @tc.name      NdkNotification_CheckButtonWidthOf_0119
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-1906) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_CheckButtonWidthOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0119 begin`);
      const actual: number = checkButtonWidthOf(-1906);
      logInfo(`checkButtonWidthOf(rowWidthVp=-1906): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0120
     * @tc.name      NdkNotification_CheckButtonWidthOf_0120
     * @tc.desc      checkButtonWidthOf(rowWidthVp=-278) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_CheckButtonWidthOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0120 begin`);
      const actual: number = checkButtonWidthOf(-278);
      logInfo(`checkButtonWidthOf(rowWidthVp=-278): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0120 end`);
    });
  });
}
