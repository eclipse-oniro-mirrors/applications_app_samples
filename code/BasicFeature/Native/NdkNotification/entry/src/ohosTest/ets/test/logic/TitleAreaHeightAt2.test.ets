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
import { titleAreaHeightAt } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for titleAreaHeightAt (24 cases). */
export default function titleAreaHeightAt2Test(): void {
  describe('TitleAreaHeightAt2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0097
     * @tc.name      NdkNotification_TitleAreaHeightAt_0097
     * @tc.desc      titleAreaHeightAt(density=143) returns 1.9580419580419581
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0097 begin`);
      const actual: number = titleAreaHeightAt(143);
      logInfo(`titleAreaHeightAt(density=143): actual=${actual}`);
      expect(actual).assertClose(1.9580419580419581, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0098
     * @tc.name      NdkNotification_TitleAreaHeightAt_0098
     * @tc.desc      titleAreaHeightAt(density=11.36) returns 24.647887323943664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0098 begin`);
      const actual: number = titleAreaHeightAt(11.36);
      logInfo(`titleAreaHeightAt(density=11.36): actual=${actual}`);
      expect(actual).assertClose(24.647887323943664, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0099
     * @tc.name      NdkNotification_TitleAreaHeightAt_0099
     * @tc.desc      titleAreaHeightAt(density=57.95) returns 4.831751509922347
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0099 begin`);
      const actual: number = titleAreaHeightAt(57.95);
      logInfo(`titleAreaHeightAt(density=57.95): actual=${actual}`);
      expect(actual).assertClose(4.831751509922347, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0100
     * @tc.name      NdkNotification_TitleAreaHeightAt_0100
     * @tc.desc      titleAreaHeightAt(density=1.68) returns 166.66666666666669
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0100 begin`);
      const actual: number = titleAreaHeightAt(1.68);
      logInfo(`titleAreaHeightAt(density=1.68): actual=${actual}`);
      expect(actual).assertClose(166.66666666666669, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0101
     * @tc.name      NdkNotification_TitleAreaHeightAt_0101
     * @tc.desc      titleAreaHeightAt(density=6.11) returns 45.82651391162029
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0101 begin`);
      const actual: number = titleAreaHeightAt(6.11);
      logInfo(`titleAreaHeightAt(density=6.11): actual=${actual}`);
      expect(actual).assertClose(45.82651391162029, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0102
     * @tc.name      NdkNotification_TitleAreaHeightAt_0102
     * @tc.desc      titleAreaHeightAt(density=33) returns 8.484848484848484
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0102 begin`);
      const actual: number = titleAreaHeightAt(33);
      logInfo(`titleAreaHeightAt(density=33): actual=${actual}`);
      expect(actual).assertClose(8.484848484848484, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0103
     * @tc.name      NdkNotification_TitleAreaHeightAt_0103
     * @tc.desc      titleAreaHeightAt(density=98.98) returns 2.828854314002829
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleAreaHeightAt_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0103 begin`);
      const actual: number = titleAreaHeightAt(98.98);
      logInfo(`titleAreaHeightAt(density=98.98): actual=${actual}`);
      expect(actual).assertClose(2.828854314002829, PRECISION);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0104
     * @tc.name      NdkNotification_TitleAreaHeightAt_0104
     * @tc.desc      titleAreaHeightAt(density=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0104 begin`);
      const actual: number = titleAreaHeightAt(-1);
      logInfo(`titleAreaHeightAt(density=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0105
     * @tc.name      NdkNotification_TitleAreaHeightAt_0105
     * @tc.desc      titleAreaHeightAt(density=-63) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0105 begin`);
      const actual: number = titleAreaHeightAt(-63);
      logInfo(`titleAreaHeightAt(density=-63): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0106
     * @tc.name      NdkNotification_TitleAreaHeightAt_0106
     * @tc.desc      titleAreaHeightAt(density=-87) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0106 begin`);
      const actual: number = titleAreaHeightAt(-87);
      logInfo(`titleAreaHeightAt(density=-87): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0107
     * @tc.name      NdkNotification_TitleAreaHeightAt_0107
     * @tc.desc      titleAreaHeightAt(density=-72) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0107 begin`);
      const actual: number = titleAreaHeightAt(-72);
      logInfo(`titleAreaHeightAt(density=-72): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0108
     * @tc.name      NdkNotification_TitleAreaHeightAt_0108
     * @tc.desc      titleAreaHeightAt(density=-35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0108 begin`);
      const actual: number = titleAreaHeightAt(-35);
      logInfo(`titleAreaHeightAt(density=-35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0109
     * @tc.name      NdkNotification_TitleAreaHeightAt_0109
     * @tc.desc      titleAreaHeightAt(density=-44) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0109 begin`);
      const actual: number = titleAreaHeightAt(-44);
      logInfo(`titleAreaHeightAt(density=-44): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0110
     * @tc.name      NdkNotification_TitleAreaHeightAt_0110
     * @tc.desc      titleAreaHeightAt(density=-26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0110 begin`);
      const actual: number = titleAreaHeightAt(-26);
      logInfo(`titleAreaHeightAt(density=-26): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0111
     * @tc.name      NdkNotification_TitleAreaHeightAt_0111
     * @tc.desc      titleAreaHeightAt(density=-76) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0111 begin`);
      const actual: number = titleAreaHeightAt(-76);
      logInfo(`titleAreaHeightAt(density=-76): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0112
     * @tc.name      NdkNotification_TitleAreaHeightAt_0112
     * @tc.desc      titleAreaHeightAt(density=-13) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0112 begin`);
      const actual: number = titleAreaHeightAt(-13);
      logInfo(`titleAreaHeightAt(density=-13): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0113
     * @tc.name      NdkNotification_TitleAreaHeightAt_0113
     * @tc.desc      titleAreaHeightAt(density=-3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0113 begin`);
      const actual: number = titleAreaHeightAt(-3);
      logInfo(`titleAreaHeightAt(density=-3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0114
     * @tc.name      NdkNotification_TitleAreaHeightAt_0114
     * @tc.desc      titleAreaHeightAt(density=-58) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0114 begin`);
      const actual: number = titleAreaHeightAt(-58);
      logInfo(`titleAreaHeightAt(density=-58): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0115
     * @tc.name      NdkNotification_TitleAreaHeightAt_0115
     * @tc.desc      titleAreaHeightAt(density=-55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0115 begin`);
      const actual: number = titleAreaHeightAt(-55);
      logInfo(`titleAreaHeightAt(density=-55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0116
     * @tc.name      NdkNotification_TitleAreaHeightAt_0116
     * @tc.desc      titleAreaHeightAt(density=-41) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0116 begin`);
      const actual: number = titleAreaHeightAt(-41);
      logInfo(`titleAreaHeightAt(density=-41): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0117
     * @tc.name      NdkNotification_TitleAreaHeightAt_0117
     * @tc.desc      titleAreaHeightAt(density=-23) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0117 begin`);
      const actual: number = titleAreaHeightAt(-23);
      logInfo(`titleAreaHeightAt(density=-23): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0118
     * @tc.name      NdkNotification_TitleAreaHeightAt_0118
     * @tc.desc      titleAreaHeightAt(density=-14) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0118 begin`);
      const actual: number = titleAreaHeightAt(-14);
      logInfo(`titleAreaHeightAt(density=-14): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0119
     * @tc.name      NdkNotification_TitleAreaHeightAt_0119
     * @tc.desc      titleAreaHeightAt(density=-91) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0119 begin`);
      const actual: number = titleAreaHeightAt(-91);
      logInfo(`titleAreaHeightAt(density=-91): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_AREA_HEIGHT_AT_0120
     * @tc.name      NdkNotification_TitleAreaHeightAt_0120
     * @tc.desc      titleAreaHeightAt(density=-88) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_TitleAreaHeightAt_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleAreaHeightAt_0120 begin`);
      const actual: number = titleAreaHeightAt(-88);
      logInfo(`titleAreaHeightAt(density=-88): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleAreaHeightAt_0120 end`);
    });
  });
}
