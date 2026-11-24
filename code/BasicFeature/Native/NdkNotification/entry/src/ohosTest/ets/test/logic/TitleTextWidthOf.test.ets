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

/** Logic checks for titleTextWidthOf (96 cases). */
export default function titleTextWidthOfTest(): void {
  describe('TitleTextWidthOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0001
     * @tc.name      NdkNotification_TitleTextWidthOf_0001
     * @tc.desc      titleTextWidthOf(pageWidthVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_TitleTextWidthOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0001 begin`);
      const actual: number = titleTextWidthOf(0);
      logInfo(`titleTextWidthOf(pageWidthVp=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleTextWidthOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0002
     * @tc.name      NdkNotification_TitleTextWidthOf_0002
     * @tc.desc      titleTextWidthOf(pageWidthVp=100) returns 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_TitleTextWidthOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0002 begin`);
      const actual: number = titleTextWidthOf(100);
      logInfo(`titleTextWidthOf(pageWidthVp=100): actual=${actual}`);
      expect(actual).assertEqual(68);
      logInfo(`${BUNDLE}TitleTextWidthOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0003
     * @tc.name      NdkNotification_TitleTextWidthOf_0003
     * @tc.desc      titleTextWidthOf(pageWidthVp=360) returns 328
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0003 begin`);
      const actual: number = titleTextWidthOf(360);
      logInfo(`titleTextWidthOf(pageWidthVp=360): actual=${actual}`);
      expect(actual).assertEqual(328);
      logInfo(`${BUNDLE}TitleTextWidthOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0004
     * @tc.name      NdkNotification_TitleTextWidthOf_0004
     * @tc.desc      titleTextWidthOf(pageWidthVp=720) returns 688
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0004 begin`);
      const actual: number = titleTextWidthOf(720);
      logInfo(`titleTextWidthOf(pageWidthVp=720): actual=${actual}`);
      expect(actual).assertEqual(688);
      logInfo(`${BUNDLE}TitleTextWidthOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0005
     * @tc.name      NdkNotification_TitleTextWidthOf_0005
     * @tc.desc      titleTextWidthOf(pageWidthVp=1080) returns 1048
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0005 begin`);
      const actual: number = titleTextWidthOf(1080);
      logInfo(`titleTextWidthOf(pageWidthVp=1080): actual=${actual}`);
      expect(actual).assertEqual(1048);
      logInfo(`${BUNDLE}TitleTextWidthOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0006
     * @tc.name      NdkNotification_TitleTextWidthOf_0006
     * @tc.desc      titleTextWidthOf(pageWidthVp=1920) returns 1888
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0006 begin`);
      const actual: number = titleTextWidthOf(1920);
      logInfo(`titleTextWidthOf(pageWidthVp=1920): actual=${actual}`);
      expect(actual).assertEqual(1888);
      logInfo(`${BUNDLE}TitleTextWidthOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0007
     * @tc.name      NdkNotification_TitleTextWidthOf_0007
     * @tc.desc      titleTextWidthOf(pageWidthVp=96) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0007 begin`);
      const actual: number = titleTextWidthOf(96);
      logInfo(`titleTextWidthOf(pageWidthVp=96): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}TitleTextWidthOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0008
     * @tc.name      NdkNotification_TitleTextWidthOf_0008
     * @tc.desc      titleTextWidthOf(pageWidthVp=192) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0008 begin`);
      const actual: number = titleTextWidthOf(192);
      logInfo(`titleTextWidthOf(pageWidthVp=192): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}TitleTextWidthOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0009
     * @tc.name      NdkNotification_TitleTextWidthOf_0009
     * @tc.desc      titleTextWidthOf(pageWidthVp=288) returns 256
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0009 begin`);
      const actual: number = titleTextWidthOf(288);
      logInfo(`titleTextWidthOf(pageWidthVp=288): actual=${actual}`);
      expect(actual).assertEqual(256);
      logInfo(`${BUNDLE}TitleTextWidthOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0010
     * @tc.name      NdkNotification_TitleTextWidthOf_0010
     * @tc.desc      titleTextWidthOf(pageWidthVp=384) returns 352
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0010 begin`);
      const actual: number = titleTextWidthOf(384);
      logInfo(`titleTextWidthOf(pageWidthVp=384): actual=${actual}`);
      expect(actual).assertEqual(352);
      logInfo(`${BUNDLE}TitleTextWidthOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0011
     * @tc.name      NdkNotification_TitleTextWidthOf_0011
     * @tc.desc      titleTextWidthOf(pageWidthVp=480) returns 448
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0011 begin`);
      const actual: number = titleTextWidthOf(480);
      logInfo(`titleTextWidthOf(pageWidthVp=480): actual=${actual}`);
      expect(actual).assertEqual(448);
      logInfo(`${BUNDLE}TitleTextWidthOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0012
     * @tc.name      NdkNotification_TitleTextWidthOf_0012
     * @tc.desc      titleTextWidthOf(pageWidthVp=576) returns 544
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0012 begin`);
      const actual: number = titleTextWidthOf(576);
      logInfo(`titleTextWidthOf(pageWidthVp=576): actual=${actual}`);
      expect(actual).assertEqual(544);
      logInfo(`${BUNDLE}TitleTextWidthOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0013
     * @tc.name      NdkNotification_TitleTextWidthOf_0013
     * @tc.desc      titleTextWidthOf(pageWidthVp=672) returns 640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0013 begin`);
      const actual: number = titleTextWidthOf(672);
      logInfo(`titleTextWidthOf(pageWidthVp=672): actual=${actual}`);
      expect(actual).assertEqual(640);
      logInfo(`${BUNDLE}TitleTextWidthOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0014
     * @tc.name      NdkNotification_TitleTextWidthOf_0014
     * @tc.desc      titleTextWidthOf(pageWidthVp=768) returns 736
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0014 begin`);
      const actual: number = titleTextWidthOf(768);
      logInfo(`titleTextWidthOf(pageWidthVp=768): actual=${actual}`);
      expect(actual).assertEqual(736);
      logInfo(`${BUNDLE}TitleTextWidthOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0015
     * @tc.name      NdkNotification_TitleTextWidthOf_0015
     * @tc.desc      titleTextWidthOf(pageWidthVp=864) returns 832
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0015 begin`);
      const actual: number = titleTextWidthOf(864);
      logInfo(`titleTextWidthOf(pageWidthVp=864): actual=${actual}`);
      expect(actual).assertEqual(832);
      logInfo(`${BUNDLE}TitleTextWidthOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0016
     * @tc.name      NdkNotification_TitleTextWidthOf_0016
     * @tc.desc      titleTextWidthOf(pageWidthVp=960) returns 928
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0016 begin`);
      const actual: number = titleTextWidthOf(960);
      logInfo(`titleTextWidthOf(pageWidthVp=960): actual=${actual}`);
      expect(actual).assertEqual(928);
      logInfo(`${BUNDLE}TitleTextWidthOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0017
     * @tc.name      NdkNotification_TitleTextWidthOf_0017
     * @tc.desc      titleTextWidthOf(pageWidthVp=1056) returns 1024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0017 begin`);
      const actual: number = titleTextWidthOf(1056);
      logInfo(`titleTextWidthOf(pageWidthVp=1056): actual=${actual}`);
      expect(actual).assertEqual(1024);
      logInfo(`${BUNDLE}TitleTextWidthOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0018
     * @tc.name      NdkNotification_TitleTextWidthOf_0018
     * @tc.desc      titleTextWidthOf(pageWidthVp=1152) returns 1120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0018 begin`);
      const actual: number = titleTextWidthOf(1152);
      logInfo(`titleTextWidthOf(pageWidthVp=1152): actual=${actual}`);
      expect(actual).assertEqual(1120);
      logInfo(`${BUNDLE}TitleTextWidthOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0019
     * @tc.name      NdkNotification_TitleTextWidthOf_0019
     * @tc.desc      titleTextWidthOf(pageWidthVp=1248) returns 1216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0019 begin`);
      const actual: number = titleTextWidthOf(1248);
      logInfo(`titleTextWidthOf(pageWidthVp=1248): actual=${actual}`);
      expect(actual).assertEqual(1216);
      logInfo(`${BUNDLE}TitleTextWidthOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0020
     * @tc.name      NdkNotification_TitleTextWidthOf_0020
     * @tc.desc      titleTextWidthOf(pageWidthVp=1344) returns 1312
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0020 begin`);
      const actual: number = titleTextWidthOf(1344);
      logInfo(`titleTextWidthOf(pageWidthVp=1344): actual=${actual}`);
      expect(actual).assertEqual(1312);
      logInfo(`${BUNDLE}TitleTextWidthOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0021
     * @tc.name      NdkNotification_TitleTextWidthOf_0021
     * @tc.desc      titleTextWidthOf(pageWidthVp=1440) returns 1408
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0021 begin`);
      const actual: number = titleTextWidthOf(1440);
      logInfo(`titleTextWidthOf(pageWidthVp=1440): actual=${actual}`);
      expect(actual).assertEqual(1408);
      logInfo(`${BUNDLE}TitleTextWidthOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0022
     * @tc.name      NdkNotification_TitleTextWidthOf_0022
     * @tc.desc      titleTextWidthOf(pageWidthVp=1536) returns 1504
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0022 begin`);
      const actual: number = titleTextWidthOf(1536);
      logInfo(`titleTextWidthOf(pageWidthVp=1536): actual=${actual}`);
      expect(actual).assertEqual(1504);
      logInfo(`${BUNDLE}TitleTextWidthOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0023
     * @tc.name      NdkNotification_TitleTextWidthOf_0023
     * @tc.desc      titleTextWidthOf(pageWidthVp=1632) returns 1600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0023 begin`);
      const actual: number = titleTextWidthOf(1632);
      logInfo(`titleTextWidthOf(pageWidthVp=1632): actual=${actual}`);
      expect(actual).assertEqual(1600);
      logInfo(`${BUNDLE}TitleTextWidthOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0024
     * @tc.name      NdkNotification_TitleTextWidthOf_0024
     * @tc.desc      titleTextWidthOf(pageWidthVp=1728) returns 1696
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0024 begin`);
      const actual: number = titleTextWidthOf(1728);
      logInfo(`titleTextWidthOf(pageWidthVp=1728): actual=${actual}`);
      expect(actual).assertEqual(1696);
      logInfo(`${BUNDLE}TitleTextWidthOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0025
     * @tc.name      NdkNotification_TitleTextWidthOf_0025
     * @tc.desc      titleTextWidthOf(pageWidthVp=1824) returns 1792
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0025 begin`);
      const actual: number = titleTextWidthOf(1824);
      logInfo(`titleTextWidthOf(pageWidthVp=1824): actual=${actual}`);
      expect(actual).assertEqual(1792);
      logInfo(`${BUNDLE}TitleTextWidthOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0026
     * @tc.name      NdkNotification_TitleTextWidthOf_0026
     * @tc.desc      titleTextWidthOf(pageWidthVp=2016) returns 1984
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0026 begin`);
      const actual: number = titleTextWidthOf(2016);
      logInfo(`titleTextWidthOf(pageWidthVp=2016): actual=${actual}`);
      expect(actual).assertEqual(1984);
      logInfo(`${BUNDLE}TitleTextWidthOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0027
     * @tc.name      NdkNotification_TitleTextWidthOf_0027
     * @tc.desc      titleTextWidthOf(pageWidthVp=2112) returns 2080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0027 begin`);
      const actual: number = titleTextWidthOf(2112);
      logInfo(`titleTextWidthOf(pageWidthVp=2112): actual=${actual}`);
      expect(actual).assertEqual(2080);
      logInfo(`${BUNDLE}TitleTextWidthOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0028
     * @tc.name      NdkNotification_TitleTextWidthOf_0028
     * @tc.desc      titleTextWidthOf(pageWidthVp=2208) returns 2176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0028 begin`);
      const actual: number = titleTextWidthOf(2208);
      logInfo(`titleTextWidthOf(pageWidthVp=2208): actual=${actual}`);
      expect(actual).assertEqual(2176);
      logInfo(`${BUNDLE}TitleTextWidthOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0029
     * @tc.name      NdkNotification_TitleTextWidthOf_0029
     * @tc.desc      titleTextWidthOf(pageWidthVp=2304) returns 2272
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0029 begin`);
      const actual: number = titleTextWidthOf(2304);
      logInfo(`titleTextWidthOf(pageWidthVp=2304): actual=${actual}`);
      expect(actual).assertEqual(2272);
      logInfo(`${BUNDLE}TitleTextWidthOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0030
     * @tc.name      NdkNotification_TitleTextWidthOf_0030
     * @tc.desc      titleTextWidthOf(pageWidthVp=2400) returns 2368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0030 begin`);
      const actual: number = titleTextWidthOf(2400);
      logInfo(`titleTextWidthOf(pageWidthVp=2400): actual=${actual}`);
      expect(actual).assertEqual(2368);
      logInfo(`${BUNDLE}TitleTextWidthOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0031
     * @tc.name      NdkNotification_TitleTextWidthOf_0031
     * @tc.desc      titleTextWidthOf(pageWidthVp=2496) returns 2464
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0031 begin`);
      const actual: number = titleTextWidthOf(2496);
      logInfo(`titleTextWidthOf(pageWidthVp=2496): actual=${actual}`);
      expect(actual).assertEqual(2464);
      logInfo(`${BUNDLE}TitleTextWidthOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0032
     * @tc.name      NdkNotification_TitleTextWidthOf_0032
     * @tc.desc      titleTextWidthOf(pageWidthVp=2592) returns 2560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0032 begin`);
      const actual: number = titleTextWidthOf(2592);
      logInfo(`titleTextWidthOf(pageWidthVp=2592): actual=${actual}`);
      expect(actual).assertEqual(2560);
      logInfo(`${BUNDLE}TitleTextWidthOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0033
     * @tc.name      NdkNotification_TitleTextWidthOf_0033
     * @tc.desc      titleTextWidthOf(pageWidthVp=2688) returns 2656
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0033 begin`);
      const actual: number = titleTextWidthOf(2688);
      logInfo(`titleTextWidthOf(pageWidthVp=2688): actual=${actual}`);
      expect(actual).assertEqual(2656);
      logInfo(`${BUNDLE}TitleTextWidthOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0034
     * @tc.name      NdkNotification_TitleTextWidthOf_0034
     * @tc.desc      titleTextWidthOf(pageWidthVp=2784) returns 2752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0034 begin`);
      const actual: number = titleTextWidthOf(2784);
      logInfo(`titleTextWidthOf(pageWidthVp=2784): actual=${actual}`);
      expect(actual).assertEqual(2752);
      logInfo(`${BUNDLE}TitleTextWidthOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0035
     * @tc.name      NdkNotification_TitleTextWidthOf_0035
     * @tc.desc      titleTextWidthOf(pageWidthVp=2880) returns 2848
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0035 begin`);
      const actual: number = titleTextWidthOf(2880);
      logInfo(`titleTextWidthOf(pageWidthVp=2880): actual=${actual}`);
      expect(actual).assertEqual(2848);
      logInfo(`${BUNDLE}TitleTextWidthOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0036
     * @tc.name      NdkNotification_TitleTextWidthOf_0036
     * @tc.desc      titleTextWidthOf(pageWidthVp=2976) returns 2944
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0036 begin`);
      const actual: number = titleTextWidthOf(2976);
      logInfo(`titleTextWidthOf(pageWidthVp=2976): actual=${actual}`);
      expect(actual).assertEqual(2944);
      logInfo(`${BUNDLE}TitleTextWidthOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0037
     * @tc.name      NdkNotification_TitleTextWidthOf_0037
     * @tc.desc      titleTextWidthOf(pageWidthVp=3072) returns 3040
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0037 begin`);
      const actual: number = titleTextWidthOf(3072);
      logInfo(`titleTextWidthOf(pageWidthVp=3072): actual=${actual}`);
      expect(actual).assertEqual(3040);
      logInfo(`${BUNDLE}TitleTextWidthOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0038
     * @tc.name      NdkNotification_TitleTextWidthOf_0038
     * @tc.desc      titleTextWidthOf(pageWidthVp=3168) returns 3136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0038 begin`);
      const actual: number = titleTextWidthOf(3168);
      logInfo(`titleTextWidthOf(pageWidthVp=3168): actual=${actual}`);
      expect(actual).assertEqual(3136);
      logInfo(`${BUNDLE}TitleTextWidthOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0039
     * @tc.name      NdkNotification_TitleTextWidthOf_0039
     * @tc.desc      titleTextWidthOf(pageWidthVp=3264) returns 3232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0039 begin`);
      const actual: number = titleTextWidthOf(3264);
      logInfo(`titleTextWidthOf(pageWidthVp=3264): actual=${actual}`);
      expect(actual).assertEqual(3232);
      logInfo(`${BUNDLE}TitleTextWidthOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0040
     * @tc.name      NdkNotification_TitleTextWidthOf_0040
     * @tc.desc      titleTextWidthOf(pageWidthVp=3360) returns 3328
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0040 begin`);
      const actual: number = titleTextWidthOf(3360);
      logInfo(`titleTextWidthOf(pageWidthVp=3360): actual=${actual}`);
      expect(actual).assertEqual(3328);
      logInfo(`${BUNDLE}TitleTextWidthOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0041
     * @tc.name      NdkNotification_TitleTextWidthOf_0041
     * @tc.desc      titleTextWidthOf(pageWidthVp=3456) returns 3424
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0041 begin`);
      const actual: number = titleTextWidthOf(3456);
      logInfo(`titleTextWidthOf(pageWidthVp=3456): actual=${actual}`);
      expect(actual).assertEqual(3424);
      logInfo(`${BUNDLE}TitleTextWidthOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0042
     * @tc.name      NdkNotification_TitleTextWidthOf_0042
     * @tc.desc      titleTextWidthOf(pageWidthVp=3552) returns 3520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0042 begin`);
      const actual: number = titleTextWidthOf(3552);
      logInfo(`titleTextWidthOf(pageWidthVp=3552): actual=${actual}`);
      expect(actual).assertEqual(3520);
      logInfo(`${BUNDLE}TitleTextWidthOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0043
     * @tc.name      NdkNotification_TitleTextWidthOf_0043
     * @tc.desc      titleTextWidthOf(pageWidthVp=3648) returns 3616
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0043 begin`);
      const actual: number = titleTextWidthOf(3648);
      logInfo(`titleTextWidthOf(pageWidthVp=3648): actual=${actual}`);
      expect(actual).assertEqual(3616);
      logInfo(`${BUNDLE}TitleTextWidthOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0044
     * @tc.name      NdkNotification_TitleTextWidthOf_0044
     * @tc.desc      titleTextWidthOf(pageWidthVp=3744) returns 3712
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0044 begin`);
      const actual: number = titleTextWidthOf(3744);
      logInfo(`titleTextWidthOf(pageWidthVp=3744): actual=${actual}`);
      expect(actual).assertEqual(3712);
      logInfo(`${BUNDLE}TitleTextWidthOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0045
     * @tc.name      NdkNotification_TitleTextWidthOf_0045
     * @tc.desc      titleTextWidthOf(pageWidthVp=3840) returns 3808
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0045 begin`);
      const actual: number = titleTextWidthOf(3840);
      logInfo(`titleTextWidthOf(pageWidthVp=3840): actual=${actual}`);
      expect(actual).assertEqual(3808);
      logInfo(`${BUNDLE}TitleTextWidthOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0046
     * @tc.name      NdkNotification_TitleTextWidthOf_0046
     * @tc.desc      titleTextWidthOf(pageWidthVp=467.41) returns 435.41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0046 begin`);
      const actual: number = titleTextWidthOf(467.41);
      logInfo(`titleTextWidthOf(pageWidthVp=467.41): actual=${actual}`);
      expect(actual).assertClose(435.41, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0047
     * @tc.name      NdkNotification_TitleTextWidthOf_0047
     * @tc.desc      titleTextWidthOf(pageWidthVp=186) returns 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0047 begin`);
      const actual: number = titleTextWidthOf(186);
      logInfo(`titleTextWidthOf(pageWidthVp=186): actual=${actual}`);
      expect(actual).assertEqual(154);
      logInfo(`${BUNDLE}TitleTextWidthOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0048
     * @tc.name      NdkNotification_TitleTextWidthOf_0048
     * @tc.desc      titleTextWidthOf(pageWidthVp=3353) returns 3321
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0048 begin`);
      const actual: number = titleTextWidthOf(3353);
      logInfo(`titleTextWidthOf(pageWidthVp=3353): actual=${actual}`);
      expect(actual).assertEqual(3321);
      logInfo(`${BUNDLE}TitleTextWidthOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0049
     * @tc.name      NdkNotification_TitleTextWidthOf_0049
     * @tc.desc      titleTextWidthOf(pageWidthVp=2244) returns 2212
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0049 begin`);
      const actual: number = titleTextWidthOf(2244);
      logInfo(`titleTextWidthOf(pageWidthVp=2244): actual=${actual}`);
      expect(actual).assertEqual(2212);
      logInfo(`${BUNDLE}TitleTextWidthOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0050
     * @tc.name      NdkNotification_TitleTextWidthOf_0050
     * @tc.desc      titleTextWidthOf(pageWidthVp=2640) returns 2608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0050 begin`);
      const actual: number = titleTextWidthOf(2640);
      logInfo(`titleTextWidthOf(pageWidthVp=2640): actual=${actual}`);
      expect(actual).assertEqual(2608);
      logInfo(`${BUNDLE}TitleTextWidthOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0051
     * @tc.name      NdkNotification_TitleTextWidthOf_0051
     * @tc.desc      titleTextWidthOf(pageWidthVp=1373) returns 1341
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0051 begin`);
      const actual: number = titleTextWidthOf(1373);
      logInfo(`titleTextWidthOf(pageWidthVp=1373): actual=${actual}`);
      expect(actual).assertEqual(1341);
      logInfo(`${BUNDLE}TitleTextWidthOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0052
     * @tc.name      NdkNotification_TitleTextWidthOf_0052
     * @tc.desc      titleTextWidthOf(pageWidthVp=1249.36) returns 1217.36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0052 begin`);
      const actual: number = titleTextWidthOf(1249.36);
      logInfo(`titleTextWidthOf(pageWidthVp=1249.36): actual=${actual}`);
      expect(actual).assertClose(1217.36, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0053
     * @tc.name      NdkNotification_TitleTextWidthOf_0053
     * @tc.desc      titleTextWidthOf(pageWidthVp=1676) returns 1644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0053 begin`);
      const actual: number = titleTextWidthOf(1676);
      logInfo(`titleTextWidthOf(pageWidthVp=1676): actual=${actual}`);
      expect(actual).assertEqual(1644);
      logInfo(`${BUNDLE}TitleTextWidthOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0054
     * @tc.name      NdkNotification_TitleTextWidthOf_0054
     * @tc.desc      titleTextWidthOf(pageWidthVp=970) returns 938
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0054 begin`);
      const actual: number = titleTextWidthOf(970);
      logInfo(`titleTextWidthOf(pageWidthVp=970): actual=${actual}`);
      expect(actual).assertEqual(938);
      logInfo(`${BUNDLE}TitleTextWidthOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0055
     * @tc.name      NdkNotification_TitleTextWidthOf_0055
     * @tc.desc      titleTextWidthOf(pageWidthVp=1753) returns 1721
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0055 begin`);
      const actual: number = titleTextWidthOf(1753);
      logInfo(`titleTextWidthOf(pageWidthVp=1753): actual=${actual}`);
      expect(actual).assertEqual(1721);
      logInfo(`${BUNDLE}TitleTextWidthOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0056
     * @tc.name      NdkNotification_TitleTextWidthOf_0056
     * @tc.desc      titleTextWidthOf(pageWidthVp=1276.69) returns 1244.69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0056 begin`);
      const actual: number = titleTextWidthOf(1276.69);
      logInfo(`titleTextWidthOf(pageWidthVp=1276.69): actual=${actual}`);
      expect(actual).assertClose(1244.69, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0057
     * @tc.name      NdkNotification_TitleTextWidthOf_0057
     * @tc.desc      titleTextWidthOf(pageWidthVp=872.14) returns 840.14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0057 begin`);
      const actual: number = titleTextWidthOf(872.14);
      logInfo(`titleTextWidthOf(pageWidthVp=872.14): actual=${actual}`);
      expect(actual).assertClose(840.14, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0058
     * @tc.name      NdkNotification_TitleTextWidthOf_0058
     * @tc.desc      titleTextWidthOf(pageWidthVp=2662) returns 2630
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0058 begin`);
      const actual: number = titleTextWidthOf(2662);
      logInfo(`titleTextWidthOf(pageWidthVp=2662): actual=${actual}`);
      expect(actual).assertEqual(2630);
      logInfo(`${BUNDLE}TitleTextWidthOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0059
     * @tc.name      NdkNotification_TitleTextWidthOf_0059
     * @tc.desc      titleTextWidthOf(pageWidthVp=957) returns 925
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0059 begin`);
      const actual: number = titleTextWidthOf(957);
      logInfo(`titleTextWidthOf(pageWidthVp=957): actual=${actual}`);
      expect(actual).assertEqual(925);
      logInfo(`${BUNDLE}TitleTextWidthOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0060
     * @tc.name      NdkNotification_TitleTextWidthOf_0060
     * @tc.desc      titleTextWidthOf(pageWidthVp=2006) returns 1974
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0060 begin`);
      const actual: number = titleTextWidthOf(2006);
      logInfo(`titleTextWidthOf(pageWidthVp=2006): actual=${actual}`);
      expect(actual).assertEqual(1974);
      logInfo(`${BUNDLE}TitleTextWidthOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0061
     * @tc.name      NdkNotification_TitleTextWidthOf_0061
     * @tc.desc      titleTextWidthOf(pageWidthVp=3562) returns 3530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0061 begin`);
      const actual: number = titleTextWidthOf(3562);
      logInfo(`titleTextWidthOf(pageWidthVp=3562): actual=${actual}`);
      expect(actual).assertEqual(3530);
      logInfo(`${BUNDLE}TitleTextWidthOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0062
     * @tc.name      NdkNotification_TitleTextWidthOf_0062
     * @tc.desc      titleTextWidthOf(pageWidthVp=1954) returns 1922
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0062 begin`);
      const actual: number = titleTextWidthOf(1954);
      logInfo(`titleTextWidthOf(pageWidthVp=1954): actual=${actual}`);
      expect(actual).assertEqual(1922);
      logInfo(`${BUNDLE}TitleTextWidthOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0063
     * @tc.name      NdkNotification_TitleTextWidthOf_0063
     * @tc.desc      titleTextWidthOf(pageWidthVp=1829.22) returns 1797.22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0063 begin`);
      const actual: number = titleTextWidthOf(1829.22);
      logInfo(`titleTextWidthOf(pageWidthVp=1829.22): actual=${actual}`);
      expect(actual).assertClose(1797.22, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0064
     * @tc.name      NdkNotification_TitleTextWidthOf_0064
     * @tc.desc      titleTextWidthOf(pageWidthVp=335) returns 303
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0064 begin`);
      const actual: number = titleTextWidthOf(335);
      logInfo(`titleTextWidthOf(pageWidthVp=335): actual=${actual}`);
      expect(actual).assertEqual(303);
      logInfo(`${BUNDLE}TitleTextWidthOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0065
     * @tc.name      NdkNotification_TitleTextWidthOf_0065
     * @tc.desc      titleTextWidthOf(pageWidthVp=3583) returns 3551
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0065 begin`);
      const actual: number = titleTextWidthOf(3583);
      logInfo(`titleTextWidthOf(pageWidthVp=3583): actual=${actual}`);
      expect(actual).assertEqual(3551);
      logInfo(`${BUNDLE}TitleTextWidthOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0066
     * @tc.name      NdkNotification_TitleTextWidthOf_0066
     * @tc.desc      titleTextWidthOf(pageWidthVp=2175) returns 2143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0066 begin`);
      const actual: number = titleTextWidthOf(2175);
      logInfo(`titleTextWidthOf(pageWidthVp=2175): actual=${actual}`);
      expect(actual).assertEqual(2143);
      logInfo(`${BUNDLE}TitleTextWidthOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0067
     * @tc.name      NdkNotification_TitleTextWidthOf_0067
     * @tc.desc      titleTextWidthOf(pageWidthVp=239) returns 207
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0067 begin`);
      const actual: number = titleTextWidthOf(239);
      logInfo(`titleTextWidthOf(pageWidthVp=239): actual=${actual}`);
      expect(actual).assertEqual(207);
      logInfo(`${BUNDLE}TitleTextWidthOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0068
     * @tc.name      NdkNotification_TitleTextWidthOf_0068
     * @tc.desc      titleTextWidthOf(pageWidthVp=852.47) returns 820.47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0068 begin`);
      const actual: number = titleTextWidthOf(852.47);
      logInfo(`titleTextWidthOf(pageWidthVp=852.47): actual=${actual}`);
      expect(actual).assertClose(820.47, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0069
     * @tc.name      NdkNotification_TitleTextWidthOf_0069
     * @tc.desc      titleTextWidthOf(pageWidthVp=1217.13) returns 1185.13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0069 begin`);
      const actual: number = titleTextWidthOf(1217.13);
      logInfo(`titleTextWidthOf(pageWidthVp=1217.13): actual=${actual}`);
      expect(actual).assertClose(1185.13, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0070
     * @tc.name      NdkNotification_TitleTextWidthOf_0070
     * @tc.desc      titleTextWidthOf(pageWidthVp=1364) returns 1332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0070 begin`);
      const actual: number = titleTextWidthOf(1364);
      logInfo(`titleTextWidthOf(pageWidthVp=1364): actual=${actual}`);
      expect(actual).assertEqual(1332);
      logInfo(`${BUNDLE}TitleTextWidthOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0071
     * @tc.name      NdkNotification_TitleTextWidthOf_0071
     * @tc.desc      titleTextWidthOf(pageWidthVp=3191) returns 3159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0071 begin`);
      const actual: number = titleTextWidthOf(3191);
      logInfo(`titleTextWidthOf(pageWidthVp=3191): actual=${actual}`);
      expect(actual).assertEqual(3159);
      logInfo(`${BUNDLE}TitleTextWidthOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0072
     * @tc.name      NdkNotification_TitleTextWidthOf_0072
     * @tc.desc      titleTextWidthOf(pageWidthVp=2938) returns 2906
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0072 begin`);
      const actual: number = titleTextWidthOf(2938);
      logInfo(`titleTextWidthOf(pageWidthVp=2938): actual=${actual}`);
      expect(actual).assertEqual(2906);
      logInfo(`${BUNDLE}TitleTextWidthOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0073
     * @tc.name      NdkNotification_TitleTextWidthOf_0073
     * @tc.desc      titleTextWidthOf(pageWidthVp=112) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0073 begin`);
      const actual: number = titleTextWidthOf(112);
      logInfo(`titleTextWidthOf(pageWidthVp=112): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}TitleTextWidthOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0074
     * @tc.name      NdkNotification_TitleTextWidthOf_0074
     * @tc.desc      titleTextWidthOf(pageWidthVp=1820) returns 1788
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0074 begin`);
      const actual: number = titleTextWidthOf(1820);
      logInfo(`titleTextWidthOf(pageWidthVp=1820): actual=${actual}`);
      expect(actual).assertEqual(1788);
      logInfo(`${BUNDLE}TitleTextWidthOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0075
     * @tc.name      NdkNotification_TitleTextWidthOf_0075
     * @tc.desc      titleTextWidthOf(pageWidthVp=682) returns 650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0075 begin`);
      const actual: number = titleTextWidthOf(682);
      logInfo(`titleTextWidthOf(pageWidthVp=682): actual=${actual}`);
      expect(actual).assertEqual(650);
      logInfo(`${BUNDLE}TitleTextWidthOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0076
     * @tc.name      NdkNotification_TitleTextWidthOf_0076
     * @tc.desc      titleTextWidthOf(pageWidthVp=3566) returns 3534
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0076 begin`);
      const actual: number = titleTextWidthOf(3566);
      logInfo(`titleTextWidthOf(pageWidthVp=3566): actual=${actual}`);
      expect(actual).assertEqual(3534);
      logInfo(`${BUNDLE}TitleTextWidthOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0077
     * @tc.name      NdkNotification_TitleTextWidthOf_0077
     * @tc.desc      titleTextWidthOf(pageWidthVp=1646.29) returns 1614.29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0077 begin`);
      const actual: number = titleTextWidthOf(1646.29);
      logInfo(`titleTextWidthOf(pageWidthVp=1646.29): actual=${actual}`);
      expect(actual).assertClose(1614.29, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0078
     * @tc.name      NdkNotification_TitleTextWidthOf_0078
     * @tc.desc      titleTextWidthOf(pageWidthVp=1546.25) returns 1514.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0078 begin`);
      const actual: number = titleTextWidthOf(1546.25);
      logInfo(`titleTextWidthOf(pageWidthVp=1546.25): actual=${actual}`);
      expect(actual).assertClose(1514.25, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0079
     * @tc.name      NdkNotification_TitleTextWidthOf_0079
     * @tc.desc      titleTextWidthOf(pageWidthVp=2630) returns 2598
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0079 begin`);
      const actual: number = titleTextWidthOf(2630);
      logInfo(`titleTextWidthOf(pageWidthVp=2630): actual=${actual}`);
      expect(actual).assertEqual(2598);
      logInfo(`${BUNDLE}TitleTextWidthOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0080
     * @tc.name      NdkNotification_TitleTextWidthOf_0080
     * @tc.desc      titleTextWidthOf(pageWidthVp=1555) returns 1523
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0080 begin`);
      const actual: number = titleTextWidthOf(1555);
      logInfo(`titleTextWidthOf(pageWidthVp=1555): actual=${actual}`);
      expect(actual).assertEqual(1523);
      logInfo(`${BUNDLE}TitleTextWidthOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0081
     * @tc.name      NdkNotification_TitleTextWidthOf_0081
     * @tc.desc      titleTextWidthOf(pageWidthVp=1784.35) returns 1752.35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0081 begin`);
      const actual: number = titleTextWidthOf(1784.35);
      logInfo(`titleTextWidthOf(pageWidthVp=1784.35): actual=${actual}`);
      expect(actual).assertClose(1752.35, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0082
     * @tc.name      NdkNotification_TitleTextWidthOf_0082
     * @tc.desc      titleTextWidthOf(pageWidthVp=168) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0082 begin`);
      const actual: number = titleTextWidthOf(168);
      logInfo(`titleTextWidthOf(pageWidthVp=168): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}TitleTextWidthOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0083
     * @tc.name      NdkNotification_TitleTextWidthOf_0083
     * @tc.desc      titleTextWidthOf(pageWidthVp=318) returns 286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0083 begin`);
      const actual: number = titleTextWidthOf(318);
      logInfo(`titleTextWidthOf(pageWidthVp=318): actual=${actual}`);
      expect(actual).assertEqual(286);
      logInfo(`${BUNDLE}TitleTextWidthOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0084
     * @tc.name      NdkNotification_TitleTextWidthOf_0084
     * @tc.desc      titleTextWidthOf(pageWidthVp=1121) returns 1089
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0084 begin`);
      const actual: number = titleTextWidthOf(1121);
      logInfo(`titleTextWidthOf(pageWidthVp=1121): actual=${actual}`);
      expect(actual).assertEqual(1089);
      logInfo(`${BUNDLE}TitleTextWidthOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0085
     * @tc.name      NdkNotification_TitleTextWidthOf_0085
     * @tc.desc      titleTextWidthOf(pageWidthVp=1386) returns 1354
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0085 begin`);
      const actual: number = titleTextWidthOf(1386);
      logInfo(`titleTextWidthOf(pageWidthVp=1386): actual=${actual}`);
      expect(actual).assertEqual(1354);
      logInfo(`${BUNDLE}TitleTextWidthOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0086
     * @tc.name      NdkNotification_TitleTextWidthOf_0086
     * @tc.desc      titleTextWidthOf(pageWidthVp=1279) returns 1247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0086 begin`);
      const actual: number = titleTextWidthOf(1279);
      logInfo(`titleTextWidthOf(pageWidthVp=1279): actual=${actual}`);
      expect(actual).assertEqual(1247);
      logInfo(`${BUNDLE}TitleTextWidthOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0087
     * @tc.name      NdkNotification_TitleTextWidthOf_0087
     * @tc.desc      titleTextWidthOf(pageWidthVp=1233.05) returns 1201.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0087 begin`);
      const actual: number = titleTextWidthOf(1233.05);
      logInfo(`titleTextWidthOf(pageWidthVp=1233.05): actual=${actual}`);
      expect(actual).assertClose(1201.05, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0088
     * @tc.name      NdkNotification_TitleTextWidthOf_0088
     * @tc.desc      titleTextWidthOf(pageWidthVp=53) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0088 begin`);
      const actual: number = titleTextWidthOf(53);
      logInfo(`titleTextWidthOf(pageWidthVp=53): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}TitleTextWidthOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0089
     * @tc.name      NdkNotification_TitleTextWidthOf_0089
     * @tc.desc      titleTextWidthOf(pageWidthVp=1683) returns 1651
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0089 begin`);
      const actual: number = titleTextWidthOf(1683);
      logInfo(`titleTextWidthOf(pageWidthVp=1683): actual=${actual}`);
      expect(actual).assertEqual(1651);
      logInfo(`${BUNDLE}TitleTextWidthOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0090
     * @tc.name      NdkNotification_TitleTextWidthOf_0090
     * @tc.desc      titleTextWidthOf(pageWidthVp=722) returns 690
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0090 begin`);
      const actual: number = titleTextWidthOf(722);
      logInfo(`titleTextWidthOf(pageWidthVp=722): actual=${actual}`);
      expect(actual).assertEqual(690);
      logInfo(`${BUNDLE}TitleTextWidthOf_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0091
     * @tc.name      NdkNotification_TitleTextWidthOf_0091
     * @tc.desc      titleTextWidthOf(pageWidthVp=2128) returns 2096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0091 begin`);
      const actual: number = titleTextWidthOf(2128);
      logInfo(`titleTextWidthOf(pageWidthVp=2128): actual=${actual}`);
      expect(actual).assertEqual(2096);
      logInfo(`${BUNDLE}TitleTextWidthOf_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0092
     * @tc.name      NdkNotification_TitleTextWidthOf_0092
     * @tc.desc      titleTextWidthOf(pageWidthVp=1692) returns 1660
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0092 begin`);
      const actual: number = titleTextWidthOf(1692);
      logInfo(`titleTextWidthOf(pageWidthVp=1692): actual=${actual}`);
      expect(actual).assertEqual(1660);
      logInfo(`${BUNDLE}TitleTextWidthOf_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0093
     * @tc.name      NdkNotification_TitleTextWidthOf_0093
     * @tc.desc      titleTextWidthOf(pageWidthVp=901.76) returns 869.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0093 begin`);
      const actual: number = titleTextWidthOf(901.76);
      logInfo(`titleTextWidthOf(pageWidthVp=901.76): actual=${actual}`);
      expect(actual).assertClose(869.76, PRECISION);
      logInfo(`${BUNDLE}TitleTextWidthOf_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0094
     * @tc.name      NdkNotification_TitleTextWidthOf_0094
     * @tc.desc      titleTextWidthOf(pageWidthVp=3729) returns 3697
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0094 begin`);
      const actual: number = titleTextWidthOf(3729);
      logInfo(`titleTextWidthOf(pageWidthVp=3729): actual=${actual}`);
      expect(actual).assertEqual(3697);
      logInfo(`${BUNDLE}TitleTextWidthOf_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0095
     * @tc.name      NdkNotification_TitleTextWidthOf_0095
     * @tc.desc      titleTextWidthOf(pageWidthVp=176) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0095 begin`);
      const actual: number = titleTextWidthOf(176);
      logInfo(`titleTextWidthOf(pageWidthVp=176): actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}TitleTextWidthOf_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_TITLE_TEXT_WIDTH_OF_0096
     * @tc.name      NdkNotification_TitleTextWidthOf_0096
     * @tc.desc      titleTextWidthOf(pageWidthVp=2264) returns 2232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_TitleTextWidthOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleTextWidthOf_0096 begin`);
      const actual: number = titleTextWidthOf(2264);
      logInfo(`titleTextWidthOf(pageWidthVp=2264): actual=${actual}`);
      expect(actual).assertEqual(2232);
      logInfo(`${BUNDLE}TitleTextWidthOf_0096 end`);
    });
  });
}
