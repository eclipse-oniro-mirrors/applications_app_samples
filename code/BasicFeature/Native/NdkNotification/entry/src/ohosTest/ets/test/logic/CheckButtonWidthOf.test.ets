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

/** Logic checks for checkButtonWidthOf (96 cases). */
export default function checkButtonWidthOfTest(): void {
  describe('CheckButtonWidthOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0001
     * @tc.name      NdkNotification_CheckButtonWidthOf_0001
     * @tc.desc      checkButtonWidthOf(rowWidthVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_CheckButtonWidthOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0001 begin`);
      const actual: number = checkButtonWidthOf(0);
      logInfo(`checkButtonWidthOf(rowWidthVp=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0002
     * @tc.name      NdkNotification_CheckButtonWidthOf_0002
     * @tc.desc      checkButtonWidthOf(rowWidthVp=100) returns 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_CheckButtonWidthOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0002 begin`);
      const actual: number = checkButtonWidthOf(100);
      logInfo(`checkButtonWidthOf(rowWidthVp=100): actual=${actual}`);
      expect(actual).assertEqual(68);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0003
     * @tc.name      NdkNotification_CheckButtonWidthOf_0003
     * @tc.desc      checkButtonWidthOf(rowWidthVp=360) returns 328
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0003 begin`);
      const actual: number = checkButtonWidthOf(360);
      logInfo(`checkButtonWidthOf(rowWidthVp=360): actual=${actual}`);
      expect(actual).assertEqual(328);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0004
     * @tc.name      NdkNotification_CheckButtonWidthOf_0004
     * @tc.desc      checkButtonWidthOf(rowWidthVp=720) returns 688
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0004 begin`);
      const actual: number = checkButtonWidthOf(720);
      logInfo(`checkButtonWidthOf(rowWidthVp=720): actual=${actual}`);
      expect(actual).assertEqual(688);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0005
     * @tc.name      NdkNotification_CheckButtonWidthOf_0005
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1080) returns 1048
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0005 begin`);
      const actual: number = checkButtonWidthOf(1080);
      logInfo(`checkButtonWidthOf(rowWidthVp=1080): actual=${actual}`);
      expect(actual).assertEqual(1048);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0006
     * @tc.name      NdkNotification_CheckButtonWidthOf_0006
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1920) returns 1888
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0006 begin`);
      const actual: number = checkButtonWidthOf(1920);
      logInfo(`checkButtonWidthOf(rowWidthVp=1920): actual=${actual}`);
      expect(actual).assertEqual(1888);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0007
     * @tc.name      NdkNotification_CheckButtonWidthOf_0007
     * @tc.desc      checkButtonWidthOf(rowWidthVp=96) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0007 begin`);
      const actual: number = checkButtonWidthOf(96);
      logInfo(`checkButtonWidthOf(rowWidthVp=96): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0008
     * @tc.name      NdkNotification_CheckButtonWidthOf_0008
     * @tc.desc      checkButtonWidthOf(rowWidthVp=192) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0008 begin`);
      const actual: number = checkButtonWidthOf(192);
      logInfo(`checkButtonWidthOf(rowWidthVp=192): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0009
     * @tc.name      NdkNotification_CheckButtonWidthOf_0009
     * @tc.desc      checkButtonWidthOf(rowWidthVp=288) returns 256
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0009 begin`);
      const actual: number = checkButtonWidthOf(288);
      logInfo(`checkButtonWidthOf(rowWidthVp=288): actual=${actual}`);
      expect(actual).assertEqual(256);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0010
     * @tc.name      NdkNotification_CheckButtonWidthOf_0010
     * @tc.desc      checkButtonWidthOf(rowWidthVp=384) returns 352
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0010 begin`);
      const actual: number = checkButtonWidthOf(384);
      logInfo(`checkButtonWidthOf(rowWidthVp=384): actual=${actual}`);
      expect(actual).assertEqual(352);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0011
     * @tc.name      NdkNotification_CheckButtonWidthOf_0011
     * @tc.desc      checkButtonWidthOf(rowWidthVp=480) returns 448
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0011 begin`);
      const actual: number = checkButtonWidthOf(480);
      logInfo(`checkButtonWidthOf(rowWidthVp=480): actual=${actual}`);
      expect(actual).assertEqual(448);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0012
     * @tc.name      NdkNotification_CheckButtonWidthOf_0012
     * @tc.desc      checkButtonWidthOf(rowWidthVp=576) returns 544
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0012 begin`);
      const actual: number = checkButtonWidthOf(576);
      logInfo(`checkButtonWidthOf(rowWidthVp=576): actual=${actual}`);
      expect(actual).assertEqual(544);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0013
     * @tc.name      NdkNotification_CheckButtonWidthOf_0013
     * @tc.desc      checkButtonWidthOf(rowWidthVp=672) returns 640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0013 begin`);
      const actual: number = checkButtonWidthOf(672);
      logInfo(`checkButtonWidthOf(rowWidthVp=672): actual=${actual}`);
      expect(actual).assertEqual(640);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0014
     * @tc.name      NdkNotification_CheckButtonWidthOf_0014
     * @tc.desc      checkButtonWidthOf(rowWidthVp=768) returns 736
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0014 begin`);
      const actual: number = checkButtonWidthOf(768);
      logInfo(`checkButtonWidthOf(rowWidthVp=768): actual=${actual}`);
      expect(actual).assertEqual(736);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0015
     * @tc.name      NdkNotification_CheckButtonWidthOf_0015
     * @tc.desc      checkButtonWidthOf(rowWidthVp=864) returns 832
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0015 begin`);
      const actual: number = checkButtonWidthOf(864);
      logInfo(`checkButtonWidthOf(rowWidthVp=864): actual=${actual}`);
      expect(actual).assertEqual(832);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0016
     * @tc.name      NdkNotification_CheckButtonWidthOf_0016
     * @tc.desc      checkButtonWidthOf(rowWidthVp=960) returns 928
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0016 begin`);
      const actual: number = checkButtonWidthOf(960);
      logInfo(`checkButtonWidthOf(rowWidthVp=960): actual=${actual}`);
      expect(actual).assertEqual(928);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0017
     * @tc.name      NdkNotification_CheckButtonWidthOf_0017
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1056) returns 1024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0017 begin`);
      const actual: number = checkButtonWidthOf(1056);
      logInfo(`checkButtonWidthOf(rowWidthVp=1056): actual=${actual}`);
      expect(actual).assertEqual(1024);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0018
     * @tc.name      NdkNotification_CheckButtonWidthOf_0018
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1152) returns 1120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0018 begin`);
      const actual: number = checkButtonWidthOf(1152);
      logInfo(`checkButtonWidthOf(rowWidthVp=1152): actual=${actual}`);
      expect(actual).assertEqual(1120);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0019
     * @tc.name      NdkNotification_CheckButtonWidthOf_0019
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1248) returns 1216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0019 begin`);
      const actual: number = checkButtonWidthOf(1248);
      logInfo(`checkButtonWidthOf(rowWidthVp=1248): actual=${actual}`);
      expect(actual).assertEqual(1216);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0020
     * @tc.name      NdkNotification_CheckButtonWidthOf_0020
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1344) returns 1312
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0020 begin`);
      const actual: number = checkButtonWidthOf(1344);
      logInfo(`checkButtonWidthOf(rowWidthVp=1344): actual=${actual}`);
      expect(actual).assertEqual(1312);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0021
     * @tc.name      NdkNotification_CheckButtonWidthOf_0021
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1440) returns 1408
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0021 begin`);
      const actual: number = checkButtonWidthOf(1440);
      logInfo(`checkButtonWidthOf(rowWidthVp=1440): actual=${actual}`);
      expect(actual).assertEqual(1408);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0022
     * @tc.name      NdkNotification_CheckButtonWidthOf_0022
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1536) returns 1504
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0022 begin`);
      const actual: number = checkButtonWidthOf(1536);
      logInfo(`checkButtonWidthOf(rowWidthVp=1536): actual=${actual}`);
      expect(actual).assertEqual(1504);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0023
     * @tc.name      NdkNotification_CheckButtonWidthOf_0023
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1632) returns 1600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0023 begin`);
      const actual: number = checkButtonWidthOf(1632);
      logInfo(`checkButtonWidthOf(rowWidthVp=1632): actual=${actual}`);
      expect(actual).assertEqual(1600);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0024
     * @tc.name      NdkNotification_CheckButtonWidthOf_0024
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1728) returns 1696
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0024 begin`);
      const actual: number = checkButtonWidthOf(1728);
      logInfo(`checkButtonWidthOf(rowWidthVp=1728): actual=${actual}`);
      expect(actual).assertEqual(1696);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0025
     * @tc.name      NdkNotification_CheckButtonWidthOf_0025
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1824) returns 1792
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0025 begin`);
      const actual: number = checkButtonWidthOf(1824);
      logInfo(`checkButtonWidthOf(rowWidthVp=1824): actual=${actual}`);
      expect(actual).assertEqual(1792);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0026
     * @tc.name      NdkNotification_CheckButtonWidthOf_0026
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2016) returns 1984
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0026 begin`);
      const actual: number = checkButtonWidthOf(2016);
      logInfo(`checkButtonWidthOf(rowWidthVp=2016): actual=${actual}`);
      expect(actual).assertEqual(1984);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0027
     * @tc.name      NdkNotification_CheckButtonWidthOf_0027
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2112) returns 2080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0027 begin`);
      const actual: number = checkButtonWidthOf(2112);
      logInfo(`checkButtonWidthOf(rowWidthVp=2112): actual=${actual}`);
      expect(actual).assertEqual(2080);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0028
     * @tc.name      NdkNotification_CheckButtonWidthOf_0028
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2208) returns 2176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0028 begin`);
      const actual: number = checkButtonWidthOf(2208);
      logInfo(`checkButtonWidthOf(rowWidthVp=2208): actual=${actual}`);
      expect(actual).assertEqual(2176);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0029
     * @tc.name      NdkNotification_CheckButtonWidthOf_0029
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2304) returns 2272
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0029 begin`);
      const actual: number = checkButtonWidthOf(2304);
      logInfo(`checkButtonWidthOf(rowWidthVp=2304): actual=${actual}`);
      expect(actual).assertEqual(2272);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0030
     * @tc.name      NdkNotification_CheckButtonWidthOf_0030
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2400) returns 2368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0030 begin`);
      const actual: number = checkButtonWidthOf(2400);
      logInfo(`checkButtonWidthOf(rowWidthVp=2400): actual=${actual}`);
      expect(actual).assertEqual(2368);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0031
     * @tc.name      NdkNotification_CheckButtonWidthOf_0031
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2496) returns 2464
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0031 begin`);
      const actual: number = checkButtonWidthOf(2496);
      logInfo(`checkButtonWidthOf(rowWidthVp=2496): actual=${actual}`);
      expect(actual).assertEqual(2464);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0032
     * @tc.name      NdkNotification_CheckButtonWidthOf_0032
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2592) returns 2560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0032 begin`);
      const actual: number = checkButtonWidthOf(2592);
      logInfo(`checkButtonWidthOf(rowWidthVp=2592): actual=${actual}`);
      expect(actual).assertEqual(2560);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0033
     * @tc.name      NdkNotification_CheckButtonWidthOf_0033
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2688) returns 2656
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0033 begin`);
      const actual: number = checkButtonWidthOf(2688);
      logInfo(`checkButtonWidthOf(rowWidthVp=2688): actual=${actual}`);
      expect(actual).assertEqual(2656);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0034
     * @tc.name      NdkNotification_CheckButtonWidthOf_0034
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2784) returns 2752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0034 begin`);
      const actual: number = checkButtonWidthOf(2784);
      logInfo(`checkButtonWidthOf(rowWidthVp=2784): actual=${actual}`);
      expect(actual).assertEqual(2752);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0035
     * @tc.name      NdkNotification_CheckButtonWidthOf_0035
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2880) returns 2848
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0035 begin`);
      const actual: number = checkButtonWidthOf(2880);
      logInfo(`checkButtonWidthOf(rowWidthVp=2880): actual=${actual}`);
      expect(actual).assertEqual(2848);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0036
     * @tc.name      NdkNotification_CheckButtonWidthOf_0036
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2976) returns 2944
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0036 begin`);
      const actual: number = checkButtonWidthOf(2976);
      logInfo(`checkButtonWidthOf(rowWidthVp=2976): actual=${actual}`);
      expect(actual).assertEqual(2944);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0037
     * @tc.name      NdkNotification_CheckButtonWidthOf_0037
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3072) returns 3040
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0037 begin`);
      const actual: number = checkButtonWidthOf(3072);
      logInfo(`checkButtonWidthOf(rowWidthVp=3072): actual=${actual}`);
      expect(actual).assertEqual(3040);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0038
     * @tc.name      NdkNotification_CheckButtonWidthOf_0038
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3168) returns 3136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0038 begin`);
      const actual: number = checkButtonWidthOf(3168);
      logInfo(`checkButtonWidthOf(rowWidthVp=3168): actual=${actual}`);
      expect(actual).assertEqual(3136);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0039
     * @tc.name      NdkNotification_CheckButtonWidthOf_0039
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3264) returns 3232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0039 begin`);
      const actual: number = checkButtonWidthOf(3264);
      logInfo(`checkButtonWidthOf(rowWidthVp=3264): actual=${actual}`);
      expect(actual).assertEqual(3232);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0040
     * @tc.name      NdkNotification_CheckButtonWidthOf_0040
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3360) returns 3328
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0040 begin`);
      const actual: number = checkButtonWidthOf(3360);
      logInfo(`checkButtonWidthOf(rowWidthVp=3360): actual=${actual}`);
      expect(actual).assertEqual(3328);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0041
     * @tc.name      NdkNotification_CheckButtonWidthOf_0041
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3456) returns 3424
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0041 begin`);
      const actual: number = checkButtonWidthOf(3456);
      logInfo(`checkButtonWidthOf(rowWidthVp=3456): actual=${actual}`);
      expect(actual).assertEqual(3424);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0042
     * @tc.name      NdkNotification_CheckButtonWidthOf_0042
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3552) returns 3520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0042 begin`);
      const actual: number = checkButtonWidthOf(3552);
      logInfo(`checkButtonWidthOf(rowWidthVp=3552): actual=${actual}`);
      expect(actual).assertEqual(3520);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0043
     * @tc.name      NdkNotification_CheckButtonWidthOf_0043
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3648) returns 3616
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0043 begin`);
      const actual: number = checkButtonWidthOf(3648);
      logInfo(`checkButtonWidthOf(rowWidthVp=3648): actual=${actual}`);
      expect(actual).assertEqual(3616);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0044
     * @tc.name      NdkNotification_CheckButtonWidthOf_0044
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3744) returns 3712
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0044 begin`);
      const actual: number = checkButtonWidthOf(3744);
      logInfo(`checkButtonWidthOf(rowWidthVp=3744): actual=${actual}`);
      expect(actual).assertEqual(3712);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0045
     * @tc.name      NdkNotification_CheckButtonWidthOf_0045
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3840) returns 3808
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0045 begin`);
      const actual: number = checkButtonWidthOf(3840);
      logInfo(`checkButtonWidthOf(rowWidthVp=3840): actual=${actual}`);
      expect(actual).assertEqual(3808);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0046
     * @tc.name      NdkNotification_CheckButtonWidthOf_0046
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1350.9) returns 1318.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0046 begin`);
      const actual: number = checkButtonWidthOf(1350.9);
      logInfo(`checkButtonWidthOf(rowWidthVp=1350.9): actual=${actual}`);
      expect(actual).assertClose(1318.9, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0047
     * @tc.name      NdkNotification_CheckButtonWidthOf_0047
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2428) returns 2396
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0047 begin`);
      const actual: number = checkButtonWidthOf(2428);
      logInfo(`checkButtonWidthOf(rowWidthVp=2428): actual=${actual}`);
      expect(actual).assertEqual(2396);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0048
     * @tc.name      NdkNotification_CheckButtonWidthOf_0048
     * @tc.desc      checkButtonWidthOf(rowWidthVp=341.85) returns 309.85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0048 begin`);
      const actual: number = checkButtonWidthOf(341.85);
      logInfo(`checkButtonWidthOf(rowWidthVp=341.85): actual=${actual}`);
      expect(actual).assertClose(309.85, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0049
     * @tc.name      NdkNotification_CheckButtonWidthOf_0049
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1092) returns 1060
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0049 begin`);
      const actual: number = checkButtonWidthOf(1092);
      logInfo(`checkButtonWidthOf(rowWidthVp=1092): actual=${actual}`);
      expect(actual).assertEqual(1060);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0050
     * @tc.name      NdkNotification_CheckButtonWidthOf_0050
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1818) returns 1786
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0050 begin`);
      const actual: number = checkButtonWidthOf(1818);
      logInfo(`checkButtonWidthOf(rowWidthVp=1818): actual=${actual}`);
      expect(actual).assertEqual(1786);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0051
     * @tc.name      NdkNotification_CheckButtonWidthOf_0051
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2078) returns 2046
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0051 begin`);
      const actual: number = checkButtonWidthOf(2078);
      logInfo(`checkButtonWidthOf(rowWidthVp=2078): actual=${actual}`);
      expect(actual).assertEqual(2046);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0052
     * @tc.name      NdkNotification_CheckButtonWidthOf_0052
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2231) returns 2199
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0052 begin`);
      const actual: number = checkButtonWidthOf(2231);
      logInfo(`checkButtonWidthOf(rowWidthVp=2231): actual=${actual}`);
      expect(actual).assertEqual(2199);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0053
     * @tc.name      NdkNotification_CheckButtonWidthOf_0053
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1937) returns 1905
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0053 begin`);
      const actual: number = checkButtonWidthOf(1937);
      logInfo(`checkButtonWidthOf(rowWidthVp=1937): actual=${actual}`);
      expect(actual).assertEqual(1905);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0054
     * @tc.name      NdkNotification_CheckButtonWidthOf_0054
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1610) returns 1578
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0054 begin`);
      const actual: number = checkButtonWidthOf(1610);
      logInfo(`checkButtonWidthOf(rowWidthVp=1610): actual=${actual}`);
      expect(actual).assertEqual(1578);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0055
     * @tc.name      NdkNotification_CheckButtonWidthOf_0055
     * @tc.desc      checkButtonWidthOf(rowWidthVp=501.54) returns 469.54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0055 begin`);
      const actual: number = checkButtonWidthOf(501.54);
      logInfo(`checkButtonWidthOf(rowWidthVp=501.54): actual=${actual}`);
      expect(actual).assertClose(469.54, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0056
     * @tc.name      NdkNotification_CheckButtonWidthOf_0056
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1193.24) returns 1161.24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0056 begin`);
      const actual: number = checkButtonWidthOf(1193.24);
      logInfo(`checkButtonWidthOf(rowWidthVp=1193.24): actual=${actual}`);
      expect(actual).assertClose(1161.24, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0057
     * @tc.name      NdkNotification_CheckButtonWidthOf_0057
     * @tc.desc      checkButtonWidthOf(rowWidthVp=612) returns 580
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0057 begin`);
      const actual: number = checkButtonWidthOf(612);
      logInfo(`checkButtonWidthOf(rowWidthVp=612): actual=${actual}`);
      expect(actual).assertEqual(580);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0058
     * @tc.name      NdkNotification_CheckButtonWidthOf_0058
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1121) returns 1089
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0058 begin`);
      const actual: number = checkButtonWidthOf(1121);
      logInfo(`checkButtonWidthOf(rowWidthVp=1121): actual=${actual}`);
      expect(actual).assertEqual(1089);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0059
     * @tc.name      NdkNotification_CheckButtonWidthOf_0059
     * @tc.desc      checkButtonWidthOf(rowWidthVp=635.8) returns 603.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0059 begin`);
      const actual: number = checkButtonWidthOf(635.8);
      logInfo(`checkButtonWidthOf(rowWidthVp=635.8): actual=${actual}`);
      expect(actual).assertClose(603.8, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0060
     * @tc.name      NdkNotification_CheckButtonWidthOf_0060
     * @tc.desc      checkButtonWidthOf(rowWidthVp=544) returns 512
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0060 begin`);
      const actual: number = checkButtonWidthOf(544);
      logInfo(`checkButtonWidthOf(rowWidthVp=544): actual=${actual}`);
      expect(actual).assertEqual(512);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0061
     * @tc.name      NdkNotification_CheckButtonWidthOf_0061
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1862.2) returns 1830.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0061 begin`);
      const actual: number = checkButtonWidthOf(1862.2);
      logInfo(`checkButtonWidthOf(rowWidthVp=1862.2): actual=${actual}`);
      expect(actual).assertClose(1830.2, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0062
     * @tc.name      NdkNotification_CheckButtonWidthOf_0062
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1823) returns 1791
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0062 begin`);
      const actual: number = checkButtonWidthOf(1823);
      logInfo(`checkButtonWidthOf(rowWidthVp=1823): actual=${actual}`);
      expect(actual).assertEqual(1791);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0063
     * @tc.name      NdkNotification_CheckButtonWidthOf_0063
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1792.83) returns 1760.83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0063 begin`);
      const actual: number = checkButtonWidthOf(1792.83);
      logInfo(`checkButtonWidthOf(rowWidthVp=1792.83): actual=${actual}`);
      expect(actual).assertClose(1760.83, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0064
     * @tc.name      NdkNotification_CheckButtonWidthOf_0064
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3032) returns 3000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0064 begin`);
      const actual: number = checkButtonWidthOf(3032);
      logInfo(`checkButtonWidthOf(rowWidthVp=3032): actual=${actual}`);
      expect(actual).assertEqual(3000);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0065
     * @tc.name      NdkNotification_CheckButtonWidthOf_0065
     * @tc.desc      checkButtonWidthOf(rowWidthVp=615.29) returns 583.29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0065 begin`);
      const actual: number = checkButtonWidthOf(615.29);
      logInfo(`checkButtonWidthOf(rowWidthVp=615.29): actual=${actual}`);
      expect(actual).assertClose(583.29, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0066
     * @tc.name      NdkNotification_CheckButtonWidthOf_0066
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3588) returns 3556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0066 begin`);
      const actual: number = checkButtonWidthOf(3588);
      logInfo(`checkButtonWidthOf(rowWidthVp=3588): actual=${actual}`);
      expect(actual).assertEqual(3556);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0067
     * @tc.name      NdkNotification_CheckButtonWidthOf_0067
     * @tc.desc      checkButtonWidthOf(rowWidthVp=669.77) returns 637.77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0067 begin`);
      const actual: number = checkButtonWidthOf(669.77);
      logInfo(`checkButtonWidthOf(rowWidthVp=669.77): actual=${actual}`);
      expect(actual).assertClose(637.77, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0068
     * @tc.name      NdkNotification_CheckButtonWidthOf_0068
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1060.1) returns 1028.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0068 begin`);
      const actual: number = checkButtonWidthOf(1060.1);
      logInfo(`checkButtonWidthOf(rowWidthVp=1060.1): actual=${actual}`);
      expect(actual).assertClose(1028.1, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0069
     * @tc.name      NdkNotification_CheckButtonWidthOf_0069
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1550.35) returns 1518.35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0069 begin`);
      const actual: number = checkButtonWidthOf(1550.35);
      logInfo(`checkButtonWidthOf(rowWidthVp=1550.35): actual=${actual}`);
      expect(actual).assertClose(1518.35, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0070
     * @tc.name      NdkNotification_CheckButtonWidthOf_0070
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1737.11) returns 1705.11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0070 begin`);
      const actual: number = checkButtonWidthOf(1737.11);
      logInfo(`checkButtonWidthOf(rowWidthVp=1737.11): actual=${actual}`);
      expect(actual).assertClose(1705.11, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0071
     * @tc.name      NdkNotification_CheckButtonWidthOf_0071
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3538) returns 3506
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0071 begin`);
      const actual: number = checkButtonWidthOf(3538);
      logInfo(`checkButtonWidthOf(rowWidthVp=3538): actual=${actual}`);
      expect(actual).assertEqual(3506);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0072
     * @tc.name      NdkNotification_CheckButtonWidthOf_0072
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2215) returns 2183
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0072 begin`);
      const actual: number = checkButtonWidthOf(2215);
      logInfo(`checkButtonWidthOf(rowWidthVp=2215): actual=${actual}`);
      expect(actual).assertEqual(2183);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0073
     * @tc.name      NdkNotification_CheckButtonWidthOf_0073
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1901) returns 1869
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0073 begin`);
      const actual: number = checkButtonWidthOf(1901);
      logInfo(`checkButtonWidthOf(rowWidthVp=1901): actual=${actual}`);
      expect(actual).assertEqual(1869);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0074
     * @tc.name      NdkNotification_CheckButtonWidthOf_0074
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2549) returns 2517
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0074 begin`);
      const actual: number = checkButtonWidthOf(2549);
      logInfo(`checkButtonWidthOf(rowWidthVp=2549): actual=${actual}`);
      expect(actual).assertEqual(2517);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0075
     * @tc.name      NdkNotification_CheckButtonWidthOf_0075
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2005) returns 1973
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0075 begin`);
      const actual: number = checkButtonWidthOf(2005);
      logInfo(`checkButtonWidthOf(rowWidthVp=2005): actual=${actual}`);
      expect(actual).assertEqual(1973);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0076
     * @tc.name      NdkNotification_CheckButtonWidthOf_0076
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2312) returns 2280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0076 begin`);
      const actual: number = checkButtonWidthOf(2312);
      logInfo(`checkButtonWidthOf(rowWidthVp=2312): actual=${actual}`);
      expect(actual).assertEqual(2280);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0077
     * @tc.name      NdkNotification_CheckButtonWidthOf_0077
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3297) returns 3265
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0077 begin`);
      const actual: number = checkButtonWidthOf(3297);
      logInfo(`checkButtonWidthOf(rowWidthVp=3297): actual=${actual}`);
      expect(actual).assertEqual(3265);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0078
     * @tc.name      NdkNotification_CheckButtonWidthOf_0078
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1674) returns 1642
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0078 begin`);
      const actual: number = checkButtonWidthOf(1674);
      logInfo(`checkButtonWidthOf(rowWidthVp=1674): actual=${actual}`);
      expect(actual).assertEqual(1642);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0079
     * @tc.name      NdkNotification_CheckButtonWidthOf_0079
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1145.91) returns 1113.91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0079 begin`);
      const actual: number = checkButtonWidthOf(1145.91);
      logInfo(`checkButtonWidthOf(rowWidthVp=1145.91): actual=${actual}`);
      expect(actual).assertClose(1113.91, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0080
     * @tc.name      NdkNotification_CheckButtonWidthOf_0080
     * @tc.desc      checkButtonWidthOf(rowWidthVp=203) returns 171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0080 begin`);
      const actual: number = checkButtonWidthOf(203);
      logInfo(`checkButtonWidthOf(rowWidthVp=203): actual=${actual}`);
      expect(actual).assertEqual(171);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0081
     * @tc.name      NdkNotification_CheckButtonWidthOf_0081
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1820) returns 1788
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0081 begin`);
      const actual: number = checkButtonWidthOf(1820);
      logInfo(`checkButtonWidthOf(rowWidthVp=1820): actual=${actual}`);
      expect(actual).assertEqual(1788);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0082
     * @tc.name      NdkNotification_CheckButtonWidthOf_0082
     * @tc.desc      checkButtonWidthOf(rowWidthVp=993.33) returns 961.33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0082 begin`);
      const actual: number = checkButtonWidthOf(993.33);
      logInfo(`checkButtonWidthOf(rowWidthVp=993.33): actual=${actual}`);
      expect(actual).assertClose(961.33, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0083
     * @tc.name      NdkNotification_CheckButtonWidthOf_0083
     * @tc.desc      checkButtonWidthOf(rowWidthVp=2540) returns 2508
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0083 begin`);
      const actual: number = checkButtonWidthOf(2540);
      logInfo(`checkButtonWidthOf(rowWidthVp=2540): actual=${actual}`);
      expect(actual).assertEqual(2508);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0084
     * @tc.name      NdkNotification_CheckButtonWidthOf_0084
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3261) returns 3229
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0084 begin`);
      const actual: number = checkButtonWidthOf(3261);
      logInfo(`checkButtonWidthOf(rowWidthVp=3261): actual=${actual}`);
      expect(actual).assertEqual(3229);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0085
     * @tc.name      NdkNotification_CheckButtonWidthOf_0085
     * @tc.desc      checkButtonWidthOf(rowWidthVp=312) returns 280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0085 begin`);
      const actual: number = checkButtonWidthOf(312);
      logInfo(`checkButtonWidthOf(rowWidthVp=312): actual=${actual}`);
      expect(actual).assertEqual(280);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0086
     * @tc.name      NdkNotification_CheckButtonWidthOf_0086
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1203.87) returns 1171.87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0086 begin`);
      const actual: number = checkButtonWidthOf(1203.87);
      logInfo(`checkButtonWidthOf(rowWidthVp=1203.87): actual=${actual}`);
      expect(actual).assertClose(1171.87, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0087
     * @tc.name      NdkNotification_CheckButtonWidthOf_0087
     * @tc.desc      checkButtonWidthOf(rowWidthVp=358.53) returns 326.53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0087 begin`);
      const actual: number = checkButtonWidthOf(358.53);
      logInfo(`checkButtonWidthOf(rowWidthVp=358.53): actual=${actual}`);
      expect(actual).assertClose(326.53, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0088
     * @tc.name      NdkNotification_CheckButtonWidthOf_0088
     * @tc.desc      checkButtonWidthOf(rowWidthVp=358.5) returns 326.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0088 begin`);
      const actual: number = checkButtonWidthOf(358.5);
      logInfo(`checkButtonWidthOf(rowWidthVp=358.5): actual=${actual}`);
      expect(actual).assertClose(326.5, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0089
     * @tc.name      NdkNotification_CheckButtonWidthOf_0089
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1243.5) returns 1211.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0089 begin`);
      const actual: number = checkButtonWidthOf(1243.5);
      logInfo(`checkButtonWidthOf(rowWidthVp=1243.5): actual=${actual}`);
      expect(actual).assertClose(1211.5, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0090
     * @tc.name      NdkNotification_CheckButtonWidthOf_0090
     * @tc.desc      checkButtonWidthOf(rowWidthVp=3121) returns 3089
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0090 begin`);
      const actual: number = checkButtonWidthOf(3121);
      logInfo(`checkButtonWidthOf(rowWidthVp=3121): actual=${actual}`);
      expect(actual).assertEqual(3089);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0091
     * @tc.name      NdkNotification_CheckButtonWidthOf_0091
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1477.95) returns 1445.95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0091 begin`);
      const actual: number = checkButtonWidthOf(1477.95);
      logInfo(`checkButtonWidthOf(rowWidthVp=1477.95): actual=${actual}`);
      expect(actual).assertClose(1445.95, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0092
     * @tc.name      NdkNotification_CheckButtonWidthOf_0092
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1919.62) returns 1887.62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0092 begin`);
      const actual: number = checkButtonWidthOf(1919.62);
      logInfo(`checkButtonWidthOf(rowWidthVp=1919.62): actual=${actual}`);
      expect(actual).assertClose(1887.62, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0093
     * @tc.name      NdkNotification_CheckButtonWidthOf_0093
     * @tc.desc      checkButtonWidthOf(rowWidthVp=818) returns 786
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0093 begin`);
      const actual: number = checkButtonWidthOf(818);
      logInfo(`checkButtonWidthOf(rowWidthVp=818): actual=${actual}`);
      expect(actual).assertEqual(786);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0094
     * @tc.name      NdkNotification_CheckButtonWidthOf_0094
     * @tc.desc      checkButtonWidthOf(rowWidthVp=1788) returns 1756
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0094 begin`);
      const actual: number = checkButtonWidthOf(1788);
      logInfo(`checkButtonWidthOf(rowWidthVp=1788): actual=${actual}`);
      expect(actual).assertEqual(1756);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0095
     * @tc.name      NdkNotification_CheckButtonWidthOf_0095
     * @tc.desc      checkButtonWidthOf(rowWidthVp=776.14) returns 744.14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0095 begin`);
      const actual: number = checkButtonWidthOf(776.14);
      logInfo(`checkButtonWidthOf(rowWidthVp=776.14): actual=${actual}`);
      expect(actual).assertClose(744.14, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_CHECK_BUTTON_WIDTH_OF_0096
     * @tc.name      NdkNotification_CheckButtonWidthOf_0096
     * @tc.desc      checkButtonWidthOf(rowWidthVp=230.89) returns 198.89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_CheckButtonWidthOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CheckButtonWidthOf_0096 begin`);
      const actual: number = checkButtonWidthOf(230.89);
      logInfo(`checkButtonWidthOf(rowWidthVp=230.89): actual=${actual}`);
      expect(actual).assertClose(198.89, PRECISION);
      logInfo(`${BUNDLE}CheckButtonWidthOf_0096 end`);
    });
  });
}
