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

/** Logic checks for dialogTextWidthOf (96 cases). */
export default function dialogTextWidthOfTest(): void {
  describe('DialogTextWidthOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0001
     * @tc.name      NdkNotification_DialogTextWidthOf_0001
     * @tc.desc      dialogTextWidthOf(parentWidthVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_DialogTextWidthOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0001 begin`);
      const actual: number = dialogTextWidthOf(0);
      logInfo(`dialogTextWidthOf(parentWidthVp=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DialogTextWidthOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0002
     * @tc.name      NdkNotification_DialogTextWidthOf_0002
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1) returns 0.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_DialogTextWidthOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0002 begin`);
      const actual: number = dialogTextWidthOf(1);
      logInfo(`dialogTextWidthOf(parentWidthVp=1): actual=${actual}`);
      expect(actual).assertClose(0.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0003
     * @tc.name      NdkNotification_DialogTextWidthOf_0003
     * @tc.desc      dialogTextWidthOf(parentWidthVp=100) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextWidthOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0003 begin`);
      const actual: number = dialogTextWidthOf(100);
      logInfo(`dialogTextWidthOf(parentWidthVp=100): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}DialogTextWidthOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0004
     * @tc.name      NdkNotification_DialogTextWidthOf_0004
     * @tc.desc      dialogTextWidthOf(parentWidthVp=99) returns 89.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextWidthOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0004 begin`);
      const actual: number = dialogTextWidthOf(99);
      logInfo(`dialogTextWidthOf(parentWidthVp=99): actual=${actual}`);
      expect(actual).assertClose(89.1, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0005
     * @tc.name      NdkNotification_DialogTextWidthOf_0005
     * @tc.desc      dialogTextWidthOf(parentWidthVp=101) returns 90.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_DialogTextWidthOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0005 begin`);
      const actual: number = dialogTextWidthOf(101);
      logInfo(`dialogTextWidthOf(parentWidthVp=101): actual=${actual}`);
      expect(actual).assertClose(90.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0006
     * @tc.name      NdkNotification_DialogTextWidthOf_0006
     * @tc.desc      dialogTextWidthOf(parentWidthVp=200) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0006 begin`);
      const actual: number = dialogTextWidthOf(200);
      logInfo(`dialogTextWidthOf(parentWidthVp=200): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}DialogTextWidthOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0007
     * @tc.name      NdkNotification_DialogTextWidthOf_0007
     * @tc.desc      dialogTextWidthOf(parentWidthVp=50) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0007 begin`);
      const actual: number = dialogTextWidthOf(50);
      logInfo(`dialogTextWidthOf(parentWidthVp=50): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}DialogTextWidthOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0008
     * @tc.name      NdkNotification_DialogTextWidthOf_0008
     * @tc.desc      dialogTextWidthOf(parentWidthVp=360) returns 324
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0008 begin`);
      const actual: number = dialogTextWidthOf(360);
      logInfo(`dialogTextWidthOf(parentWidthVp=360): actual=${actual}`);
      expect(actual).assertEqual(324);
      logInfo(`${BUNDLE}DialogTextWidthOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0009
     * @tc.name      NdkNotification_DialogTextWidthOf_0009
     * @tc.desc      dialogTextWidthOf(parentWidthVp=720) returns 648
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0009 begin`);
      const actual: number = dialogTextWidthOf(720);
      logInfo(`dialogTextWidthOf(parentWidthVp=720): actual=${actual}`);
      expect(actual).assertEqual(648);
      logInfo(`${BUNDLE}DialogTextWidthOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0010
     * @tc.name      NdkNotification_DialogTextWidthOf_0010
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1080) returns 972
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0010 begin`);
      const actual: number = dialogTextWidthOf(1080);
      logInfo(`dialogTextWidthOf(parentWidthVp=1080): actual=${actual}`);
      expect(actual).assertEqual(972);
      logInfo(`${BUNDLE}DialogTextWidthOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0011
     * @tc.name      NdkNotification_DialogTextWidthOf_0011
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1920) returns 1728
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0011 begin`);
      const actual: number = dialogTextWidthOf(1920);
      logInfo(`dialogTextWidthOf(parentWidthVp=1920): actual=${actual}`);
      expect(actual).assertEqual(1728);
      logInfo(`${BUNDLE}DialogTextWidthOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0012
     * @tc.name      NdkNotification_DialogTextWidthOf_0012
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-1) returns -0.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0012 begin`);
      const actual: number = dialogTextWidthOf(-1);
      logInfo(`dialogTextWidthOf(parentWidthVp=-1): actual=${actual}`);
      expect(actual).assertClose(-0.9, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0013
     * @tc.name      NdkNotification_DialogTextWidthOf_0013
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2) returns 1.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0013 begin`);
      const actual: number = dialogTextWidthOf(2);
      logInfo(`dialogTextWidthOf(parentWidthVp=2): actual=${actual}`);
      expect(actual).assertClose(1.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0014
     * @tc.name      NdkNotification_DialogTextWidthOf_0014
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3) returns 2.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0014 begin`);
      const actual: number = dialogTextWidthOf(3);
      logInfo(`dialogTextWidthOf(parentWidthVp=3): actual=${actual}`);
      expect(actual).assertClose(2.7, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0015
     * @tc.name      NdkNotification_DialogTextWidthOf_0015
     * @tc.desc      dialogTextWidthOf(parentWidthVp=10) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0015 begin`);
      const actual: number = dialogTextWidthOf(10);
      logInfo(`dialogTextWidthOf(parentWidthVp=10): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}DialogTextWidthOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0016
     * @tc.name      NdkNotification_DialogTextWidthOf_0016
     * @tc.desc      dialogTextWidthOf(parentWidthVp=96) returns 86.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0016 begin`);
      const actual: number = dialogTextWidthOf(96);
      logInfo(`dialogTextWidthOf(parentWidthVp=96): actual=${actual}`);
      expect(actual).assertClose(86.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0017
     * @tc.name      NdkNotification_DialogTextWidthOf_0017
     * @tc.desc      dialogTextWidthOf(parentWidthVp=192) returns 172.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0017 begin`);
      const actual: number = dialogTextWidthOf(192);
      logInfo(`dialogTextWidthOf(parentWidthVp=192): actual=${actual}`);
      expect(actual).assertClose(172.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0018
     * @tc.name      NdkNotification_DialogTextWidthOf_0018
     * @tc.desc      dialogTextWidthOf(parentWidthVp=288) returns 259.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0018 begin`);
      const actual: number = dialogTextWidthOf(288);
      logInfo(`dialogTextWidthOf(parentWidthVp=288): actual=${actual}`);
      expect(actual).assertClose(259.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0019
     * @tc.name      NdkNotification_DialogTextWidthOf_0019
     * @tc.desc      dialogTextWidthOf(parentWidthVp=384) returns 345.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0019 begin`);
      const actual: number = dialogTextWidthOf(384);
      logInfo(`dialogTextWidthOf(parentWidthVp=384): actual=${actual}`);
      expect(actual).assertClose(345.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0020
     * @tc.name      NdkNotification_DialogTextWidthOf_0020
     * @tc.desc      dialogTextWidthOf(parentWidthVp=480) returns 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0020 begin`);
      const actual: number = dialogTextWidthOf(480);
      logInfo(`dialogTextWidthOf(parentWidthVp=480): actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`${BUNDLE}DialogTextWidthOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0021
     * @tc.name      NdkNotification_DialogTextWidthOf_0021
     * @tc.desc      dialogTextWidthOf(parentWidthVp=576) returns 518.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0021 begin`);
      const actual: number = dialogTextWidthOf(576);
      logInfo(`dialogTextWidthOf(parentWidthVp=576): actual=${actual}`);
      expect(actual).assertClose(518.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0022
     * @tc.name      NdkNotification_DialogTextWidthOf_0022
     * @tc.desc      dialogTextWidthOf(parentWidthVp=672) returns 604.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0022 begin`);
      const actual: number = dialogTextWidthOf(672);
      logInfo(`dialogTextWidthOf(parentWidthVp=672): actual=${actual}`);
      expect(actual).assertClose(604.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0023
     * @tc.name      NdkNotification_DialogTextWidthOf_0023
     * @tc.desc      dialogTextWidthOf(parentWidthVp=768) returns 691.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0023 begin`);
      const actual: number = dialogTextWidthOf(768);
      logInfo(`dialogTextWidthOf(parentWidthVp=768): actual=${actual}`);
      expect(actual).assertClose(691.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0024
     * @tc.name      NdkNotification_DialogTextWidthOf_0024
     * @tc.desc      dialogTextWidthOf(parentWidthVp=864) returns 777.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0024 begin`);
      const actual: number = dialogTextWidthOf(864);
      logInfo(`dialogTextWidthOf(parentWidthVp=864): actual=${actual}`);
      expect(actual).assertClose(777.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0025
     * @tc.name      NdkNotification_DialogTextWidthOf_0025
     * @tc.desc      dialogTextWidthOf(parentWidthVp=960) returns 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0025 begin`);
      const actual: number = dialogTextWidthOf(960);
      logInfo(`dialogTextWidthOf(parentWidthVp=960): actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`${BUNDLE}DialogTextWidthOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0026
     * @tc.name      NdkNotification_DialogTextWidthOf_0026
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1056) returns 950.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0026 begin`);
      const actual: number = dialogTextWidthOf(1056);
      logInfo(`dialogTextWidthOf(parentWidthVp=1056): actual=${actual}`);
      expect(actual).assertClose(950.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0027
     * @tc.name      NdkNotification_DialogTextWidthOf_0027
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1152) returns 1036.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0027 begin`);
      const actual: number = dialogTextWidthOf(1152);
      logInfo(`dialogTextWidthOf(parentWidthVp=1152): actual=${actual}`);
      expect(actual).assertClose(1036.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0028
     * @tc.name      NdkNotification_DialogTextWidthOf_0028
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1248) returns 1123.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0028 begin`);
      const actual: number = dialogTextWidthOf(1248);
      logInfo(`dialogTextWidthOf(parentWidthVp=1248): actual=${actual}`);
      expect(actual).assertClose(1123.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0029
     * @tc.name      NdkNotification_DialogTextWidthOf_0029
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1344) returns 1209.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0029 begin`);
      const actual: number = dialogTextWidthOf(1344);
      logInfo(`dialogTextWidthOf(parentWidthVp=1344): actual=${actual}`);
      expect(actual).assertClose(1209.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0030
     * @tc.name      NdkNotification_DialogTextWidthOf_0030
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1440) returns 1296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0030 begin`);
      const actual: number = dialogTextWidthOf(1440);
      logInfo(`dialogTextWidthOf(parentWidthVp=1440): actual=${actual}`);
      expect(actual).assertEqual(1296);
      logInfo(`${BUNDLE}DialogTextWidthOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0031
     * @tc.name      NdkNotification_DialogTextWidthOf_0031
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1536) returns 1382.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0031 begin`);
      const actual: number = dialogTextWidthOf(1536);
      logInfo(`dialogTextWidthOf(parentWidthVp=1536): actual=${actual}`);
      expect(actual).assertClose(1382.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0032
     * @tc.name      NdkNotification_DialogTextWidthOf_0032
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1632) returns 1468.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0032 begin`);
      const actual: number = dialogTextWidthOf(1632);
      logInfo(`dialogTextWidthOf(parentWidthVp=1632): actual=${actual}`);
      expect(actual).assertClose(1468.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0033
     * @tc.name      NdkNotification_DialogTextWidthOf_0033
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1728) returns 1555.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0033 begin`);
      const actual: number = dialogTextWidthOf(1728);
      logInfo(`dialogTextWidthOf(parentWidthVp=1728): actual=${actual}`);
      expect(actual).assertClose(1555.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0034
     * @tc.name      NdkNotification_DialogTextWidthOf_0034
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1824) returns 1641.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0034 begin`);
      const actual: number = dialogTextWidthOf(1824);
      logInfo(`dialogTextWidthOf(parentWidthVp=1824): actual=${actual}`);
      expect(actual).assertClose(1641.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0035
     * @tc.name      NdkNotification_DialogTextWidthOf_0035
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2016) returns 1814.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0035 begin`);
      const actual: number = dialogTextWidthOf(2016);
      logInfo(`dialogTextWidthOf(parentWidthVp=2016): actual=${actual}`);
      expect(actual).assertClose(1814.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0036
     * @tc.name      NdkNotification_DialogTextWidthOf_0036
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2112) returns 1900.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0036 begin`);
      const actual: number = dialogTextWidthOf(2112);
      logInfo(`dialogTextWidthOf(parentWidthVp=2112): actual=${actual}`);
      expect(actual).assertClose(1900.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0037
     * @tc.name      NdkNotification_DialogTextWidthOf_0037
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2208) returns 1987.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0037 begin`);
      const actual: number = dialogTextWidthOf(2208);
      logInfo(`dialogTextWidthOf(parentWidthVp=2208): actual=${actual}`);
      expect(actual).assertClose(1987.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0038
     * @tc.name      NdkNotification_DialogTextWidthOf_0038
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2304) returns 2073.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0038 begin`);
      const actual: number = dialogTextWidthOf(2304);
      logInfo(`dialogTextWidthOf(parentWidthVp=2304): actual=${actual}`);
      expect(actual).assertClose(2073.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0039
     * @tc.name      NdkNotification_DialogTextWidthOf_0039
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2400) returns 2160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0039 begin`);
      const actual: number = dialogTextWidthOf(2400);
      logInfo(`dialogTextWidthOf(parentWidthVp=2400): actual=${actual}`);
      expect(actual).assertEqual(2160);
      logInfo(`${BUNDLE}DialogTextWidthOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0040
     * @tc.name      NdkNotification_DialogTextWidthOf_0040
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2496) returns 2246.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0040 begin`);
      const actual: number = dialogTextWidthOf(2496);
      logInfo(`dialogTextWidthOf(parentWidthVp=2496): actual=${actual}`);
      expect(actual).assertClose(2246.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0041
     * @tc.name      NdkNotification_DialogTextWidthOf_0041
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2592) returns 2332.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0041 begin`);
      const actual: number = dialogTextWidthOf(2592);
      logInfo(`dialogTextWidthOf(parentWidthVp=2592): actual=${actual}`);
      expect(actual).assertClose(2332.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0042
     * @tc.name      NdkNotification_DialogTextWidthOf_0042
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2688) returns 2419.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0042 begin`);
      const actual: number = dialogTextWidthOf(2688);
      logInfo(`dialogTextWidthOf(parentWidthVp=2688): actual=${actual}`);
      expect(actual).assertClose(2419.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0043
     * @tc.name      NdkNotification_DialogTextWidthOf_0043
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2784) returns 2505.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0043 begin`);
      const actual: number = dialogTextWidthOf(2784);
      logInfo(`dialogTextWidthOf(parentWidthVp=2784): actual=${actual}`);
      expect(actual).assertClose(2505.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0044
     * @tc.name      NdkNotification_DialogTextWidthOf_0044
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2880) returns 2592
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0044 begin`);
      const actual: number = dialogTextWidthOf(2880);
      logInfo(`dialogTextWidthOf(parentWidthVp=2880): actual=${actual}`);
      expect(actual).assertEqual(2592);
      logInfo(`${BUNDLE}DialogTextWidthOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0045
     * @tc.name      NdkNotification_DialogTextWidthOf_0045
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2976) returns 2678.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0045 begin`);
      const actual: number = dialogTextWidthOf(2976);
      logInfo(`dialogTextWidthOf(parentWidthVp=2976): actual=${actual}`);
      expect(actual).assertClose(2678.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0046
     * @tc.name      NdkNotification_DialogTextWidthOf_0046
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3072) returns 2764.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0046 begin`);
      const actual: number = dialogTextWidthOf(3072);
      logInfo(`dialogTextWidthOf(parentWidthVp=3072): actual=${actual}`);
      expect(actual).assertClose(2764.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0047
     * @tc.name      NdkNotification_DialogTextWidthOf_0047
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3168) returns 2851.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0047 begin`);
      const actual: number = dialogTextWidthOf(3168);
      logInfo(`dialogTextWidthOf(parentWidthVp=3168): actual=${actual}`);
      expect(actual).assertClose(2851.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0048
     * @tc.name      NdkNotification_DialogTextWidthOf_0048
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3264) returns 2937.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0048 begin`);
      const actual: number = dialogTextWidthOf(3264);
      logInfo(`dialogTextWidthOf(parentWidthVp=3264): actual=${actual}`);
      expect(actual).assertClose(2937.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0049
     * @tc.name      NdkNotification_DialogTextWidthOf_0049
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3360) returns 3024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0049 begin`);
      const actual: number = dialogTextWidthOf(3360);
      logInfo(`dialogTextWidthOf(parentWidthVp=3360): actual=${actual}`);
      expect(actual).assertEqual(3024);
      logInfo(`${BUNDLE}DialogTextWidthOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0050
     * @tc.name      NdkNotification_DialogTextWidthOf_0050
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3456) returns 3110.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0050 begin`);
      const actual: number = dialogTextWidthOf(3456);
      logInfo(`dialogTextWidthOf(parentWidthVp=3456): actual=${actual}`);
      expect(actual).assertClose(3110.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0051
     * @tc.name      NdkNotification_DialogTextWidthOf_0051
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3552) returns 3196.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0051 begin`);
      const actual: number = dialogTextWidthOf(3552);
      logInfo(`dialogTextWidthOf(parentWidthVp=3552): actual=${actual}`);
      expect(actual).assertClose(3196.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0052
     * @tc.name      NdkNotification_DialogTextWidthOf_0052
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3648) returns 3283.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0052 begin`);
      const actual: number = dialogTextWidthOf(3648);
      logInfo(`dialogTextWidthOf(parentWidthVp=3648): actual=${actual}`);
      expect(actual).assertClose(3283.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0053
     * @tc.name      NdkNotification_DialogTextWidthOf_0053
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3744) returns 3369.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0053 begin`);
      const actual: number = dialogTextWidthOf(3744);
      logInfo(`dialogTextWidthOf(parentWidthVp=3744): actual=${actual}`);
      expect(actual).assertClose(3369.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0054
     * @tc.name      NdkNotification_DialogTextWidthOf_0054
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3840) returns 3456
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0054 begin`);
      const actual: number = dialogTextWidthOf(3840);
      logInfo(`dialogTextWidthOf(parentWidthVp=3840): actual=${actual}`);
      expect(actual).assertEqual(3456);
      logInfo(`${BUNDLE}DialogTextWidthOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0055
     * @tc.name      NdkNotification_DialogTextWidthOf_0055
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2740) returns 2466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0055 begin`);
      const actual: number = dialogTextWidthOf(2740);
      logInfo(`dialogTextWidthOf(parentWidthVp=2740): actual=${actual}`);
      expect(actual).assertEqual(2466);
      logInfo(`${BUNDLE}DialogTextWidthOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0056
     * @tc.name      NdkNotification_DialogTextWidthOf_0056
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1625.72) returns 1463.148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0056 begin`);
      const actual: number = dialogTextWidthOf(1625.72);
      logInfo(`dialogTextWidthOf(parentWidthVp=1625.72): actual=${actual}`);
      expect(actual).assertClose(1463.148, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0057
     * @tc.name      NdkNotification_DialogTextWidthOf_0057
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-558) returns -502.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0057 begin`);
      const actual: number = dialogTextWidthOf(-558);
      logInfo(`dialogTextWidthOf(parentWidthVp=-558): actual=${actual}`);
      expect(actual).assertClose(-502.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0058
     * @tc.name      NdkNotification_DialogTextWidthOf_0058
     * @tc.desc      dialogTextWidthOf(parentWidthVp=95.71) returns 86.139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0058 begin`);
      const actual: number = dialogTextWidthOf(95.71);
      logInfo(`dialogTextWidthOf(parentWidthVp=95.71): actual=${actual}`);
      expect(actual).assertClose(86.139, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0059
     * @tc.name      NdkNotification_DialogTextWidthOf_0059
     * @tc.desc      dialogTextWidthOf(parentWidthVp=803) returns 722.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0059 begin`);
      const actual: number = dialogTextWidthOf(803);
      logInfo(`dialogTextWidthOf(parentWidthVp=803): actual=${actual}`);
      expect(actual).assertClose(722.7, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0060
     * @tc.name      NdkNotification_DialogTextWidthOf_0060
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1365.23) returns 1228.7069999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0060 begin`);
      const actual: number = dialogTextWidthOf(1365.23);
      logInfo(`dialogTextWidthOf(parentWidthVp=1365.23): actual=${actual}`);
      expect(actual).assertClose(1228.7069999999999, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0061
     * @tc.name      NdkNotification_DialogTextWidthOf_0061
     * @tc.desc      dialogTextWidthOf(parentWidthVp=24.67) returns 22.203000000000003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0061 begin`);
      const actual: number = dialogTextWidthOf(24.67);
      logInfo(`dialogTextWidthOf(parentWidthVp=24.67): actual=${actual}`);
      expect(actual).assertClose(22.203000000000003, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0062
     * @tc.name      NdkNotification_DialogTextWidthOf_0062
     * @tc.desc      dialogTextWidthOf(parentWidthVp=314.04) returns 282.636
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0062 begin`);
      const actual: number = dialogTextWidthOf(314.04);
      logInfo(`dialogTextWidthOf(parentWidthVp=314.04): actual=${actual}`);
      expect(actual).assertClose(282.636, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0063
     * @tc.name      NdkNotification_DialogTextWidthOf_0063
     * @tc.desc      dialogTextWidthOf(parentWidthVp=249) returns 224.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0063 begin`);
      const actual: number = dialogTextWidthOf(249);
      logInfo(`dialogTextWidthOf(parentWidthVp=249): actual=${actual}`);
      expect(actual).assertClose(224.1, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0064
     * @tc.name      NdkNotification_DialogTextWidthOf_0064
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3342) returns 3007.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0064 begin`);
      const actual: number = dialogTextWidthOf(3342);
      logInfo(`dialogTextWidthOf(parentWidthVp=3342): actual=${actual}`);
      expect(actual).assertClose(3007.8, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0065
     * @tc.name      NdkNotification_DialogTextWidthOf_0065
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3324) returns 2991.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0065 begin`);
      const actual: number = dialogTextWidthOf(3324);
      logInfo(`dialogTextWidthOf(parentWidthVp=3324): actual=${actual}`);
      expect(actual).assertClose(2991.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0066
     * @tc.name      NdkNotification_DialogTextWidthOf_0066
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-263) returns -236.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0066 begin`);
      const actual: number = dialogTextWidthOf(-263);
      logInfo(`dialogTextWidthOf(parentWidthVp=-263): actual=${actual}`);
      expect(actual).assertClose(-236.7, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0067
     * @tc.name      NdkNotification_DialogTextWidthOf_0067
     * @tc.desc      dialogTextWidthOf(parentWidthVp=838) returns 754.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0067 begin`);
      const actual: number = dialogTextWidthOf(838);
      logInfo(`dialogTextWidthOf(parentWidthVp=838): actual=${actual}`);
      expect(actual).assertClose(754.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0068
     * @tc.name      NdkNotification_DialogTextWidthOf_0068
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2285) returns 2056.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0068 begin`);
      const actual: number = dialogTextWidthOf(2285);
      logInfo(`dialogTextWidthOf(parentWidthVp=2285): actual=${actual}`);
      expect(actual).assertClose(2056.5, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0069
     * @tc.name      NdkNotification_DialogTextWidthOf_0069
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2634) returns 2370.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0069 begin`);
      const actual: number = dialogTextWidthOf(2634);
      logInfo(`dialogTextWidthOf(parentWidthVp=2634): actual=${actual}`);
      expect(actual).assertClose(2370.6, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0070
     * @tc.name      NdkNotification_DialogTextWidthOf_0070
     * @tc.desc      dialogTextWidthOf(parentWidthVp=193.5) returns 174.15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0070 begin`);
      const actual: number = dialogTextWidthOf(193.5);
      logInfo(`dialogTextWidthOf(parentWidthVp=193.5): actual=${actual}`);
      expect(actual).assertClose(174.15, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0071
     * @tc.name      NdkNotification_DialogTextWidthOf_0071
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3123) returns 2810.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0071 begin`);
      const actual: number = dialogTextWidthOf(3123);
      logInfo(`dialogTextWidthOf(parentWidthVp=3123): actual=${actual}`);
      expect(actual).assertClose(2810.7, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0072
     * @tc.name      NdkNotification_DialogTextWidthOf_0072
     * @tc.desc      dialogTextWidthOf(parentWidthVp=127) returns 114.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0072 begin`);
      const actual: number = dialogTextWidthOf(127);
      logInfo(`dialogTextWidthOf(parentWidthVp=127): actual=${actual}`);
      expect(actual).assertClose(114.3, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0073
     * @tc.name      NdkNotification_DialogTextWidthOf_0073
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-866) returns -779.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0073 begin`);
      const actual: number = dialogTextWidthOf(-866);
      logInfo(`dialogTextWidthOf(parentWidthVp=-866): actual=${actual}`);
      expect(actual).assertClose(-779.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0074
     * @tc.name      NdkNotification_DialogTextWidthOf_0074
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2960) returns 2664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0074 begin`);
      const actual: number = dialogTextWidthOf(2960);
      logInfo(`dialogTextWidthOf(parentWidthVp=2960): actual=${actual}`);
      expect(actual).assertEqual(2664);
      logInfo(`${BUNDLE}DialogTextWidthOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0075
     * @tc.name      NdkNotification_DialogTextWidthOf_0075
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-618) returns -556.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0075 begin`);
      const actual: number = dialogTextWidthOf(-618);
      logInfo(`dialogTextWidthOf(parentWidthVp=-618): actual=${actual}`);
      expect(actual).assertClose(-556.2, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0076
     * @tc.name      NdkNotification_DialogTextWidthOf_0076
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-1586) returns -1427.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0076 begin`);
      const actual: number = dialogTextWidthOf(-1586);
      logInfo(`dialogTextWidthOf(parentWidthVp=-1586): actual=${actual}`);
      expect(actual).assertClose(-1427.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0077
     * @tc.name      NdkNotification_DialogTextWidthOf_0077
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1533.78) returns 1380.402
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0077 begin`);
      const actual: number = dialogTextWidthOf(1533.78);
      logInfo(`dialogTextWidthOf(parentWidthVp=1533.78): actual=${actual}`);
      expect(actual).assertClose(1380.402, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0078
     * @tc.name      NdkNotification_DialogTextWidthOf_0078
     * @tc.desc      dialogTextWidthOf(parentWidthVp=881.34) returns 793.206
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0078 begin`);
      const actual: number = dialogTextWidthOf(881.34);
      logInfo(`dialogTextWidthOf(parentWidthVp=881.34): actual=${actual}`);
      expect(actual).assertClose(793.206, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0079
     * @tc.name      NdkNotification_DialogTextWidthOf_0079
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-1880) returns -1692
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0079 begin`);
      const actual: number = dialogTextWidthOf(-1880);
      logInfo(`dialogTextWidthOf(parentWidthVp=-1880): actual=${actual}`);
      expect(actual).assertEqual(-1692);
      logInfo(`${BUNDLE}DialogTextWidthOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0080
     * @tc.name      NdkNotification_DialogTextWidthOf_0080
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2503) returns 2252.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0080 begin`);
      const actual: number = dialogTextWidthOf(2503);
      logInfo(`dialogTextWidthOf(parentWidthVp=2503): actual=${actual}`);
      expect(actual).assertClose(2252.7, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0081
     * @tc.name      NdkNotification_DialogTextWidthOf_0081
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1303.85) returns 1173.465
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0081 begin`);
      const actual: number = dialogTextWidthOf(1303.85);
      logInfo(`dialogTextWidthOf(parentWidthVp=1303.85): actual=${actual}`);
      expect(actual).assertClose(1173.465, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0082
     * @tc.name      NdkNotification_DialogTextWidthOf_0082
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1240.62) returns 1116.558
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0082 begin`);
      const actual: number = dialogTextWidthOf(1240.62);
      logInfo(`dialogTextWidthOf(parentWidthVp=1240.62): actual=${actual}`);
      expect(actual).assertClose(1116.558, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0083
     * @tc.name      NdkNotification_DialogTextWidthOf_0083
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2895) returns 2605.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0083 begin`);
      const actual: number = dialogTextWidthOf(2895);
      logInfo(`dialogTextWidthOf(parentWidthVp=2895): actual=${actual}`);
      expect(actual).assertClose(2605.5, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0084
     * @tc.name      NdkNotification_DialogTextWidthOf_0084
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1956) returns 1760.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0084 begin`);
      const actual: number = dialogTextWidthOf(1956);
      logInfo(`dialogTextWidthOf(parentWidthVp=1956): actual=${actual}`);
      expect(actual).assertClose(1760.4, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0085
     * @tc.name      NdkNotification_DialogTextWidthOf_0085
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1544.17) returns 1389.7530000000002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0085 begin`);
      const actual: number = dialogTextWidthOf(1544.17);
      logInfo(`dialogTextWidthOf(parentWidthVp=1544.17): actual=${actual}`);
      expect(actual).assertClose(1389.7530000000002, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0086
     * @tc.name      NdkNotification_DialogTextWidthOf_0086
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-1559) returns -1403.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0086 begin`);
      const actual: number = dialogTextWidthOf(-1559);
      logInfo(`dialogTextWidthOf(parentWidthVp=-1559): actual=${actual}`);
      expect(actual).assertClose(-1403.1, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0087
     * @tc.name      NdkNotification_DialogTextWidthOf_0087
     * @tc.desc      dialogTextWidthOf(parentWidthVp=3749) returns 3374.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0087 begin`);
      const actual: number = dialogTextWidthOf(3749);
      logInfo(`dialogTextWidthOf(parentWidthVp=3749): actual=${actual}`);
      expect(actual).assertClose(3374.1, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0088
     * @tc.name      NdkNotification_DialogTextWidthOf_0088
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2929) returns 2636.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0088 begin`);
      const actual: number = dialogTextWidthOf(2929);
      logInfo(`dialogTextWidthOf(parentWidthVp=2929): actual=${actual}`);
      expect(actual).assertClose(2636.1, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0089
     * @tc.name      NdkNotification_DialogTextWidthOf_0089
     * @tc.desc      dialogTextWidthOf(parentWidthVp=2660) returns 2394
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0089 begin`);
      const actual: number = dialogTextWidthOf(2660);
      logInfo(`dialogTextWidthOf(parentWidthVp=2660): actual=${actual}`);
      expect(actual).assertEqual(2394);
      logInfo(`${BUNDLE}DialogTextWidthOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0090
     * @tc.name      NdkNotification_DialogTextWidthOf_0090
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1133.9) returns 1020.5100000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0090 begin`);
      const actual: number = dialogTextWidthOf(1133.9);
      logInfo(`dialogTextWidthOf(parentWidthVp=1133.9): actual=${actual}`);
      expect(actual).assertClose(1020.5100000000001, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0091
     * @tc.name      NdkNotification_DialogTextWidthOf_0091
     * @tc.desc      dialogTextWidthOf(parentWidthVp=179.18) returns 161.262
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0091 begin`);
      const actual: number = dialogTextWidthOf(179.18);
      logInfo(`dialogTextWidthOf(parentWidthVp=179.18): actual=${actual}`);
      expect(actual).assertClose(161.262, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0092
     * @tc.name      NdkNotification_DialogTextWidthOf_0092
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-1845) returns -1660.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0092 begin`);
      const actual: number = dialogTextWidthOf(-1845);
      logInfo(`dialogTextWidthOf(parentWidthVp=-1845): actual=${actual}`);
      expect(actual).assertClose(-1660.5, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0093
     * @tc.name      NdkNotification_DialogTextWidthOf_0093
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1070.5) returns 963.45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0093 begin`);
      const actual: number = dialogTextWidthOf(1070.5);
      logInfo(`dialogTextWidthOf(parentWidthVp=1070.5): actual=${actual}`);
      expect(actual).assertClose(963.45, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0094
     * @tc.name      NdkNotification_DialogTextWidthOf_0094
     * @tc.desc      dialogTextWidthOf(parentWidthVp=-580) returns -522
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_DialogTextWidthOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0094 begin`);
      const actual: number = dialogTextWidthOf(-580);
      logInfo(`dialogTextWidthOf(parentWidthVp=-580): actual=${actual}`);
      expect(actual).assertEqual(-522);
      logInfo(`${BUNDLE}DialogTextWidthOf_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0095
     * @tc.name      NdkNotification_DialogTextWidthOf_0095
     * @tc.desc      dialogTextWidthOf(parentWidthVp=971.91) returns 874.7189999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0095 begin`);
      const actual: number = dialogTextWidthOf(971.91);
      logInfo(`dialogTextWidthOf(parentWidthVp=971.91): actual=${actual}`);
      expect(actual).assertClose(874.7189999999999, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_DIALOG_TEXT_WIDTH_OF_0096
     * @tc.name      NdkNotification_DialogTextWidthOf_0096
     * @tc.desc      dialogTextWidthOf(parentWidthVp=1135) returns 1021.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_DialogTextWidthOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DialogTextWidthOf_0096 begin`);
      const actual: number = dialogTextWidthOf(1135);
      logInfo(`dialogTextWidthOf(parentWidthVp=1135): actual=${actual}`);
      expect(actual).assertClose(1021.5, PRECISION);
      logInfo(`${BUNDLE}DialogTextWidthOf_0096 end`);
    });
  });
}
