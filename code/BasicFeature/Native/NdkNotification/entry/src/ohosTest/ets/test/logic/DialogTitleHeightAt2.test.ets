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
import { dialogTitleHeightAt } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for dialogTitleHeightAt (24 cases). */
export default function dialogTitleHeightAt2Test(): void {
  describe('DialogTitleHeightAt2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0097
     * @tc.name      NdkNotification_DialogTitleHeightAt_0097
     * @tc.desc      dialogTitleHeightAt(density=-26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0097 begin`);
      const actual: number = dialogTitleHeightAt(-26);
      logInfo(`dialogTitleHeightAt(density=-26): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0098
     * @tc.name      NdkNotification_DialogTitleHeightAt_0098
     * @tc.desc      dialogTitleHeightAt(density=-98) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0098 begin`);
      const actual: number = dialogTitleHeightAt(-98);
      logInfo(`dialogTitleHeightAt(density=-98): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0099
     * @tc.name      NdkNotification_DialogTitleHeightAt_0099
     * @tc.desc      dialogTitleHeightAt(density=-16) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0099 begin`);
      const actual: number = dialogTitleHeightAt(-16);
      logInfo(`dialogTitleHeightAt(density=-16): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0100
     * @tc.name      NdkNotification_DialogTitleHeightAt_0100
     * @tc.desc      dialogTitleHeightAt(density=-7) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0100 begin`);
      const actual: number = dialogTitleHeightAt(-7);
      logInfo(`dialogTitleHeightAt(density=-7): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0101
     * @tc.name      NdkNotification_DialogTitleHeightAt_0101
     * @tc.desc      dialogTitleHeightAt(density=-11) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0101 begin`);
      const actual: number = dialogTitleHeightAt(-11);
      logInfo(`dialogTitleHeightAt(density=-11): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0102
     * @tc.name      NdkNotification_DialogTitleHeightAt_0102
     * @tc.desc      dialogTitleHeightAt(density=-66) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0102 begin`);
      const actual: number = dialogTitleHeightAt(-66);
      logInfo(`dialogTitleHeightAt(density=-66): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0103
     * @tc.name      NdkNotification_DialogTitleHeightAt_0103
     * @tc.desc      dialogTitleHeightAt(density=-2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0103 begin`);
      const actual: number = dialogTitleHeightAt(-2);
      logInfo(`dialogTitleHeightAt(density=-2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0104
     * @tc.name      NdkNotification_DialogTitleHeightAt_0104
     * @tc.desc      dialogTitleHeightAt(density=-21) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0104 begin`);
      const actual: number = dialogTitleHeightAt(-21);
      logInfo(`dialogTitleHeightAt(density=-21): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0105
     * @tc.name      NdkNotification_DialogTitleHeightAt_0105
     * @tc.desc      dialogTitleHeightAt(density=-62) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0105 begin`);
      const actual: number = dialogTitleHeightAt(-62);
      logInfo(`dialogTitleHeightAt(density=-62): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0106
     * @tc.name      NdkNotification_DialogTitleHeightAt_0106
     * @tc.desc      dialogTitleHeightAt(density=-17) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0106 begin`);
      const actual: number = dialogTitleHeightAt(-17);
      logInfo(`dialogTitleHeightAt(density=-17): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0107
     * @tc.name      NdkNotification_DialogTitleHeightAt_0107
     * @tc.desc      dialogTitleHeightAt(density=-75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0107 begin`);
      const actual: number = dialogTitleHeightAt(-75);
      logInfo(`dialogTitleHeightAt(density=-75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0108
     * @tc.name      NdkNotification_DialogTitleHeightAt_0108
     * @tc.desc      dialogTitleHeightAt(density=-4) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0108 begin`);
      const actual: number = dialogTitleHeightAt(-4);
      logInfo(`dialogTitleHeightAt(density=-4): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0109
     * @tc.name      NdkNotification_DialogTitleHeightAt_0109
     * @tc.desc      dialogTitleHeightAt(density=-9) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0109 begin`);
      const actual: number = dialogTitleHeightAt(-9);
      logInfo(`dialogTitleHeightAt(density=-9): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0110
     * @tc.name      NdkNotification_DialogTitleHeightAt_0110
     * @tc.desc      dialogTitleHeightAt(density=-87) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0110 begin`);
      const actual: number = dialogTitleHeightAt(-87);
      logInfo(`dialogTitleHeightAt(density=-87): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0111
     * @tc.name      NdkNotification_DialogTitleHeightAt_0111
     * @tc.desc      dialogTitleHeightAt(density=-97) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0111 begin`);
      const actual: number = dialogTitleHeightAt(-97);
      logInfo(`dialogTitleHeightAt(density=-97): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0112
     * @tc.name      NdkNotification_DialogTitleHeightAt_0112
     * @tc.desc      dialogTitleHeightAt(density=-74) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0112 begin`);
      const actual: number = dialogTitleHeightAt(-74);
      logInfo(`dialogTitleHeightAt(density=-74): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0113
     * @tc.name      NdkNotification_DialogTitleHeightAt_0113
     * @tc.desc      dialogTitleHeightAt(density=-86) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0113 begin`);
      const actual: number = dialogTitleHeightAt(-86);
      logInfo(`dialogTitleHeightAt(density=-86): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0114
     * @tc.name      NdkNotification_DialogTitleHeightAt_0114
     * @tc.desc      dialogTitleHeightAt(density=-91) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0114 begin`);
      const actual: number = dialogTitleHeightAt(-91);
      logInfo(`dialogTitleHeightAt(density=-91): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0115
     * @tc.name      NdkNotification_DialogTitleHeightAt_0115
     * @tc.desc      dialogTitleHeightAt(density=-95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0115 begin`);
      const actual: number = dialogTitleHeightAt(-95);
      logInfo(`dialogTitleHeightAt(density=-95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0116
     * @tc.name      NdkNotification_DialogTitleHeightAt_0116
     * @tc.desc      dialogTitleHeightAt(density=-51) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0116 begin`);
      const actual: number = dialogTitleHeightAt(-51);
      logInfo(`dialogTitleHeightAt(density=-51): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0117
     * @tc.name      NdkNotification_DialogTitleHeightAt_0117
     * @tc.desc      dialogTitleHeightAt(density=-29) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0117 begin`);
      const actual: number = dialogTitleHeightAt(-29);
      logInfo(`dialogTitleHeightAt(density=-29): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0118
     * @tc.name      NdkNotification_DialogTitleHeightAt_0118
     * @tc.desc      dialogTitleHeightAt(density=-57) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0118 begin`);
      const actual: number = dialogTitleHeightAt(-57);
      logInfo(`dialogTitleHeightAt(density=-57): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0119
     * @tc.name      NdkNotification_DialogTitleHeightAt_0119
     * @tc.desc      dialogTitleHeightAt(density=-23) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0119 begin`);
      const actual: number = dialogTitleHeightAt(-23);
      logInfo(`dialogTitleHeightAt(density=-23): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TITLE_HEIGHT_AT_0120
     * @tc.name      NdkNotification_DialogTitleHeightAt_0120
     * @tc.desc      dialogTitleHeightAt(density=-68) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTitleHeightAt_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTitleHeightAt_0120 begin`);
      const actual: number = dialogTitleHeightAt(-68);
      logInfo(`dialogTitleHeightAt(density=-68): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTitleHeightAt_0120 end`);
    });
  });
}
