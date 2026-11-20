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
import { freeSpaceOf } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for freeSpaceOf (96 cases). */
export default function freeSpaceOf2Test(): void {
  describe('FreeSpaceOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0097
     * @tc.name      NdkNotification_FreeSpaceOf_0097
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=15, buttonRowHeightVp=1) returns 1044.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0097 begin`);
      const actual: number = freeSpaceOf(1080, 15, 1);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=15...: actual=${actual}`);
      expect(actual).assertClose(1044.3333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0098
     * @tc.name      NdkNotification_FreeSpaceOf_0098
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=25, buttonRowHeightVp=-1) returns 1053.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0098 begin`);
      const actual: number = freeSpaceOf(1080, 25, -1);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=25...: actual=${actual}`);
      expect(actual).assertClose(1053.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0099
     * @tc.name      NdkNotification_FreeSpaceOf_0099
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=15, buttonRowHeightVp=-1) returns 326.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0099 begin`);
      const actual: number = freeSpaceOf(360, 15, -1);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=15,...: actual=${actual}`);
      expect(actual).assertClose(326.3333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0100
     * @tc.name      NdkNotification_FreeSpaceOf_0100
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=5, buttonRowHeightVp=3) returns 1845
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0100 begin`);
      const actual: number = freeSpaceOf(1920, 5, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=5,...: actual=${actual}`);
      expect(actual).assertEqual(1845);
      logInfo(`${BUNDLE}FreeSpaceOf_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0101
     * @tc.name      NdkNotification_FreeSpaceOf_0101
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=20, buttonRowHeightVp=96) returns 954
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0101 begin`);
      const actual: number = freeSpaceOf(1080, 20, 96);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=20...: actual=${actual}`);
      expect(actual).assertEqual(954);
      logInfo(`${BUNDLE}FreeSpaceOf_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0102
     * @tc.name      NdkNotification_FreeSpaceOf_0102
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=3, buttonRowHeightVp=96) returns 874.6666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0102 begin`);
      const actual: number = freeSpaceOf(1080, 3, 96);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=3,...: actual=${actual}`);
      expect(actual).assertClose(874.6666666666666, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0103
     * @tc.name      NdkNotification_FreeSpaceOf_0103
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=15, buttonRowHeightVp=3) returns 58.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0103 begin`);
      const actual: number = freeSpaceOf(96, 15, 3);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=15, ...: actual=${actual}`);
      expect(actual).assertClose(58.33333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0104
     * @tc.name      NdkNotification_FreeSpaceOf_0104
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=100, buttonRowHeightVp=10) returns 67.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0104 begin`);
      const actual: number = freeSpaceOf(96, 100, 10);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=100,...: actual=${actual}`);
      expect(actual).assertClose(67.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0105
     * @tc.name      NdkNotification_FreeSpaceOf_0105
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=0, buttonRowHeightVp=1) returns 703
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0105 begin`);
      const actual: number = freeSpaceOf(720, 0, 1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=0, ...: actual=${actual}`);
      expect(actual).assertEqual(703);
      logInfo(`${BUNDLE}FreeSpaceOf_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0106
     * @tc.name      NdkNotification_FreeSpaceOf_0106
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=1, buttonRowHeightVp=2) returns 782
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0106 begin`);
      const actual: number = freeSpaceOf(1080, 1, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=1,...: actual=${actual}`);
      expect(actual).assertEqual(782);
      logInfo(`${BUNDLE}FreeSpaceOf_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0107
     * @tc.name      NdkNotification_FreeSpaceOf_0107
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=24.6, buttonRowHeightVp=10) returns 1042.6178861788617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0107 begin`);
      const actual: number = freeSpaceOf(1080, 24.6, 10);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=24...: actual=${actual}`);
      expect(actual).assertClose(1042.6178861788617, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0108
     * @tc.name      NdkNotification_FreeSpaceOf_0108
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=3, buttonRowHeightVp=-1) returns 971.6666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0108 begin`);
      const actual: number = freeSpaceOf(1080, 3, -1);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=3,...: actual=${actual}`);
      expect(actual).assertClose(971.6666666666666, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0109
     * @tc.name      NdkNotification_FreeSpaceOf_0109
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=1, buttonRowHeightVp=0) returns 784
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0109 begin`);
      const actual: number = freeSpaceOf(1080, 1, 0);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=1,...: actual=${actual}`);
      expect(actual).assertEqual(784);
      logInfo(`${BUNDLE}FreeSpaceOf_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0110
     * @tc.name      NdkNotification_FreeSpaceOf_0110
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=24.6, buttonRowHeightVp=3) returns 329.6178861788618
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0110 begin`);
      const actual: number = freeSpaceOf(360, 24.6, 3);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=24....: actual=${actual}`);
      expect(actual).assertClose(329.6178861788618, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0111
     * @tc.name      NdkNotification_FreeSpaceOf_0111
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=100, buttonRowHeightVp=2) returns 1059.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0111 begin`);
      const actual: number = freeSpaceOf(1080, 100, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=10...: actual=${actual}`);
      expect(actual).assertClose(1059.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0112
     * @tc.name      NdkNotification_FreeSpaceOf_0112
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=25, buttonRowHeightVp=-1) returns 693.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0112 begin`);
      const actual: number = freeSpaceOf(720, 25, -1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=25,...: actual=${actual}`);
      expect(actual).assertClose(693.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0113
     * @tc.name      NdkNotification_FreeSpaceOf_0113
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=24.6, buttonRowHeightVp=2) returns 70.6178861788618
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0113 begin`);
      const actual: number = freeSpaceOf(100, 24.6, 2);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=24....: actual=${actual}`);
      expect(actual).assertClose(70.6178861788618, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0114
     * @tc.name      NdkNotification_FreeSpaceOf_0114
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=24.6, buttonRowHeightVp=2) returns 1050.6178861788617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0114 begin`);
      const actual: number = freeSpaceOf(1080, 24.6, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=24...: actual=${actual}`);
      expect(actual).assertClose(1050.6178861788617, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0115
     * @tc.name      NdkNotification_FreeSpaceOf_0115
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=24.6, buttonRowHeightVp=100) returns 232.6178861788618
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0115 begin`);
      const actual: number = freeSpaceOf(360, 24.6, 100);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=24....: actual=${actual}`);
      expect(actual).assertClose(232.6178861788618, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0116
     * @tc.name      NdkNotification_FreeSpaceOf_0116
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=20, buttonRowHeightVp=3) returns 1047
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0116 begin`);
      const actual: number = freeSpaceOf(1080, 20, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=20...: actual=${actual}`);
      expect(actual).assertEqual(1047);
      logInfo(`${BUNDLE}FreeSpaceOf_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0117
     * @tc.name      NdkNotification_FreeSpaceOf_0117
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=25, buttonRowHeightVp=1080) returns 812.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0117 begin`);
      const actual: number = freeSpaceOf(1920, 25, 1080);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=25...: actual=${actual}`);
      expect(actual).assertClose(812.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0118
     * @tc.name      NdkNotification_FreeSpaceOf_0118
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=20, buttonRowHeightVp=96) returns 234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0118 begin`);
      const actual: number = freeSpaceOf(360, 20, 96);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=20,...: actual=${actual}`);
      expect(actual).assertEqual(234);
      logInfo(`${BUNDLE}FreeSpaceOf_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0119
     * @tc.name      NdkNotification_FreeSpaceOf_0119
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=100, buttonRowHeightVp=100) returns 241.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0119 begin`);
      const actual: number = freeSpaceOf(360, 100, 100);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=100...: actual=${actual}`);
      expect(actual).assertClose(241.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0120
     * @tc.name      NdkNotification_FreeSpaceOf_0120
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=1, buttonRowHeightVp=360) returns 424
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0120 begin`);
      const actual: number = freeSpaceOf(1080, 1, 360);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=1,...: actual=${actual}`);
      expect(actual).assertEqual(424);
      logInfo(`${BUNDLE}FreeSpaceOf_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0121
     * @tc.name      NdkNotification_FreeSpaceOf_0121
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=2, buttonRowHeightVp=0) returns 204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0121 begin`);
      const actual: number = freeSpaceOf(360, 2, 0);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=2, ...: actual=${actual}`);
      expect(actual).assertEqual(204);
      logInfo(`${BUNDLE}FreeSpaceOf_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0122
     * @tc.name      NdkNotification_FreeSpaceOf_0122
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=15, buttonRowHeightVp=10) returns 1035.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0122 begin`);
      const actual: number = freeSpaceOf(1080, 15, 10);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=15...: actual=${actual}`);
      expect(actual).assertClose(1035.3333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0123
     * @tc.name      NdkNotification_FreeSpaceOf_0123
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=10, buttonRowHeightVp=1) returns 675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0123 begin`);
      const actual: number = freeSpaceOf(720, 10, 1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=10,...: actual=${actual}`);
      expect(actual).assertEqual(675);
      logInfo(`${BUNDLE}FreeSpaceOf_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0124
     * @tc.name      NdkNotification_FreeSpaceOf_0124
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=2, buttonRowHeightVp=3) returns 561
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0124 begin`);
      const actual: number = freeSpaceOf(720, 2, 3);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=2, ...: actual=${actual}`);
      expect(actual).assertEqual(561);
      logInfo(`${BUNDLE}FreeSpaceOf_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0125
     * @tc.name      NdkNotification_FreeSpaceOf_0125
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=10, buttonRowHeightVp=0) returns 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0125 begin`);
      const actual: number = freeSpaceOf(96, 10, 0);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=10, ...: actual=${actual}`);
      expect(actual).assertEqual(52);
      logInfo(`${BUNDLE}FreeSpaceOf_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0126
     * @tc.name      NdkNotification_FreeSpaceOf_0126
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=10, buttonRowHeightVp=0) returns 676
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0126 begin`);
      const actual: number = freeSpaceOf(720, 10, 0);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=10,...: actual=${actual}`);
      expect(actual).assertEqual(676);
      logInfo(`${BUNDLE}FreeSpaceOf_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0127
     * @tc.name      NdkNotification_FreeSpaceOf_0127
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=100, buttonRowHeightVp=1) returns 700.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0127 begin`);
      const actual: number = freeSpaceOf(720, 100, 1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=100...: actual=${actual}`);
      expect(actual).assertClose(700.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0128
     * @tc.name      NdkNotification_FreeSpaceOf_0128
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=2, buttonRowHeightVp=10) returns 1754
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0128 begin`);
      const actual: number = freeSpaceOf(1920, 2, 10);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=2,...: actual=${actual}`);
      expect(actual).assertEqual(1754);
      logInfo(`${BUNDLE}FreeSpaceOf_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0129
     * @tc.name      NdkNotification_FreeSpaceOf_0129
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=2, buttonRowHeightVp=100) returns 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0129 begin`);
      const actual: number = freeSpaceOf(360, 2, 100);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=2, ...: actual=${actual}`);
      expect(actual).assertEqual(104);
      logInfo(`${BUNDLE}FreeSpaceOf_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0130
     * @tc.name      NdkNotification_FreeSpaceOf_0130
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=100, buttonRowHeightVp=0) returns 77.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0130 begin`);
      const actual: number = freeSpaceOf(96, 100, 0);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=100,...: actual=${actual}`);
      expect(actual).assertClose(77.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0131
     * @tc.name      NdkNotification_FreeSpaceOf_0131
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=3, buttonRowHeightVp=-1) returns 611.6666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0131 begin`);
      const actual: number = freeSpaceOf(720, 3, -1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=3, ...: actual=${actual}`);
      expect(actual).assertClose(611.6666666666666, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0132
     * @tc.name      NdkNotification_FreeSpaceOf_0132
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=3, buttonRowHeightVp=100) returns 1710.6666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0132 begin`);
      const actual: number = freeSpaceOf(1920, 3, 100);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=3,...: actual=${actual}`);
      expect(actual).assertClose(1710.6666666666667, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0133
     * @tc.name      NdkNotification_FreeSpaceOf_0133
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=10, buttonRowHeightVp=2) returns 1034
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0133 begin`);
      const actual: number = freeSpaceOf(1080, 10, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=10...: actual=${actual}`);
      expect(actual).assertEqual(1034);
      logInfo(`${BUNDLE}FreeSpaceOf_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0134
     * @tc.name      NdkNotification_FreeSpaceOf_0134
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=25, buttonRowHeightVp=-1) returns 333.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0134 begin`);
      const actual: number = freeSpaceOf(360, 25, -1);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=25,...: actual=${actual}`);
      expect(actual).assertClose(333.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0135
     * @tc.name      NdkNotification_FreeSpaceOf_0135
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=15, buttonRowHeightVp=100) returns 945.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0135 begin`);
      const actual: number = freeSpaceOf(1080, 15, 100);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=15...: actual=${actual}`);
      expect(actual).assertClose(945.3333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0136
     * @tc.name      NdkNotification_FreeSpaceOf_0136
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=2, buttonRowHeightVp=3) returns 921
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0136 begin`);
      const actual: number = freeSpaceOf(1080, 2, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=2,...: actual=${actual}`);
      expect(actual).assertEqual(921);
      logInfo(`${BUNDLE}FreeSpaceOf_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0137
     * @tc.name      NdkNotification_FreeSpaceOf_0137
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=5, buttonRowHeightVp=2) returns 1006
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0137 begin`);
      const actual: number = freeSpaceOf(1080, 5, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=5,...: actual=${actual}`);
      expect(actual).assertEqual(1006);
      logInfo(`${BUNDLE}FreeSpaceOf_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0138
     * @tc.name      NdkNotification_FreeSpaceOf_0138
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=10, buttonRowHeightVp=1) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0138 begin`);
      const actual: number = freeSpaceOf(96, 10, 1);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=10, ...: actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}FreeSpaceOf_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0139
     * @tc.name      NdkNotification_FreeSpaceOf_0139
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=5, buttonRowHeightVp=2) returns 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0139 begin`);
      const actual: number = freeSpaceOf(96, 5, 2);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=5, b...: actual=${actual}`);
      expect(actual).assertEqual(22);
      logInfo(`${BUNDLE}FreeSpaceOf_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0140
     * @tc.name      NdkNotification_FreeSpaceOf_0140
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=1, buttonRowHeightVp=1) returns 1623
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0140 begin`);
      const actual: number = freeSpaceOf(1920, 1, 1);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=1,...: actual=${actual}`);
      expect(actual).assertEqual(1623);
      logInfo(`${BUNDLE}FreeSpaceOf_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0141
     * @tc.name      NdkNotification_FreeSpaceOf_0141
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=0, buttonRowHeightVp=1) returns 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0141 begin`);
      const actual: number = freeSpaceOf(96, 0, 1);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=0, b...: actual=${actual}`);
      expect(actual).assertEqual(79);
      logInfo(`${BUNDLE}FreeSpaceOf_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0142
     * @tc.name      NdkNotification_FreeSpaceOf_0142
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=100, buttonRowHeightVp=10) returns 1051.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0142 begin`);
      const actual: number = freeSpaceOf(1080, 100, 10);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=10...: actual=${actual}`);
      expect(actual).assertClose(1051.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0143
     * @tc.name      NdkNotification_FreeSpaceOf_0143
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=5, buttonRowHeightVp=1) returns 647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0143 begin`);
      const actual: number = freeSpaceOf(720, 5, 1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=5, ...: actual=${actual}`);
      expect(actual).assertEqual(647);
      logInfo(`${BUNDLE}FreeSpaceOf_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0144
     * @tc.name      NdkNotification_FreeSpaceOf_0144
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=-1, buttonRowHeightVp=96) returns 1808
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0144 begin`);
      const actual: number = freeSpaceOf(1920, -1, 96);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=-1...: actual=${actual}`);
      expect(actual).assertEqual(1808);
      logInfo(`${BUNDLE}FreeSpaceOf_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0145
     * @tc.name      NdkNotification_FreeSpaceOf_0145
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=24.6, buttonRowHeightVp=100) returns 1792.6178861788617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0145 begin`);
      const actual: number = freeSpaceOf(1920, 24.6, 100);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=24...: actual=${actual}`);
      expect(actual).assertClose(1792.6178861788617, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0146
     * @tc.name      NdkNotification_FreeSpaceOf_0146
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=1, buttonRowHeightVp=96) returns 328
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0146 begin`);
      const actual: number = freeSpaceOf(720, 1, 96);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=1, ...: actual=${actual}`);
      expect(actual).assertEqual(328);
      logInfo(`${BUNDLE}FreeSpaceOf_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0147
     * @tc.name      NdkNotification_FreeSpaceOf_0147
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=10, buttonRowHeightVp=3) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0147 begin`);
      const actual: number = freeSpaceOf(96, 10, 3);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=10, ...: actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}FreeSpaceOf_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0148
     * @tc.name      NdkNotification_FreeSpaceOf_0148
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=20, buttonRowHeightVp=-1) returns 691
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0148 begin`);
      const actual: number = freeSpaceOf(720, 20, -1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=20,...: actual=${actual}`);
      expect(actual).assertEqual(691);
      logInfo(`${BUNDLE}FreeSpaceOf_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0149
     * @tc.name      NdkNotification_FreeSpaceOf_0149
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=5, buttonRowHeightVp=1) returns 287
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0149 begin`);
      const actual: number = freeSpaceOf(360, 5, 1);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=5, ...: actual=${actual}`);
      expect(actual).assertEqual(287);
      logInfo(`${BUNDLE}FreeSpaceOf_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0150
     * @tc.name      NdkNotification_FreeSpaceOf_0150
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=3, buttonRowHeightVp=2) returns 1808.6666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0150 begin`);
      const actual: number = freeSpaceOf(1920, 3, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=3,...: actual=${actual}`);
      expect(actual).assertClose(1808.6666666666667, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0151
     * @tc.name      NdkNotification_FreeSpaceOf_0151
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=5, buttonRowHeightVp=96) returns 912
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0151 begin`);
      const actual: number = freeSpaceOf(1080, 5, 96);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=5,...: actual=${actual}`);
      expect(actual).assertEqual(912);
      logInfo(`${BUNDLE}FreeSpaceOf_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0152
     * @tc.name      NdkNotification_FreeSpaceOf_0152
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=-1, buttonRowHeightVp=100) returns 244
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0152 begin`);
      const actual: number = freeSpaceOf(360, -1, 100);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=-1,...: actual=${actual}`);
      expect(actual).assertEqual(244);
      logInfo(`${BUNDLE}FreeSpaceOf_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0153
     * @tc.name      NdkNotification_FreeSpaceOf_0153
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=-1, buttonRowHeightVp=-1) returns 1905
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0153 begin`);
      const actual: number = freeSpaceOf(1920, -1, -1);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=-1...: actual=${actual}`);
      expect(actual).assertEqual(1905);
      logInfo(`${BUNDLE}FreeSpaceOf_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0154
     * @tc.name      NdkNotification_FreeSpaceOf_0154
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=25, buttonRowHeightVp=0) returns 332.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0154 begin`);
      const actual: number = freeSpaceOf(360, 25, 0);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=25,...: actual=${actual}`);
      expect(actual).assertClose(332.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0155
     * @tc.name      NdkNotification_FreeSpaceOf_0155
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=20, buttonRowHeightVp=-1) returns 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0155 begin`);
      const actual: number = freeSpaceOf(96, 20, -1);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=20, ...: actual=${actual}`);
      expect(actual).assertEqual(67);
      logInfo(`${BUNDLE}FreeSpaceOf_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0156
     * @tc.name      NdkNotification_FreeSpaceOf_0156
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=24.6, buttonRowHeightVp=-1) returns 73.6178861788618
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0156 begin`);
      const actual: number = freeSpaceOf(100, 24.6, -1);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=24....: actual=${actual}`);
      expect(actual).assertClose(73.6178861788618, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0157
     * @tc.name      NdkNotification_FreeSpaceOf_0157
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=25, buttonRowHeightVp=3) returns 689.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0157 begin`);
      const actual: number = freeSpaceOf(720, 25, 3);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=25,...: actual=${actual}`);
      expect(actual).assertClose(689.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0158
     * @tc.name      NdkNotification_FreeSpaceOf_0158
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=25, buttonRowHeightVp=3) returns 1889.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0158 begin`);
      const actual: number = freeSpaceOf(1920, 25, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=25...: actual=${actual}`);
      expect(actual).assertClose(1889.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0159
     * @tc.name      NdkNotification_FreeSpaceOf_0159
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=20, buttonRowHeightVp=1) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0159 begin`);
      const actual: number = freeSpaceOf(96, 20, 1);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=20, ...: actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}FreeSpaceOf_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0160
     * @tc.name      NdkNotification_FreeSpaceOf_0160
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=100, buttonRowHeightVp=1) returns 1900.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0160 begin`);
      const actual: number = freeSpaceOf(1920, 100, 1);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=10...: actual=${actual}`);
      expect(actual).assertClose(1900.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0161
     * @tc.name      NdkNotification_FreeSpaceOf_0161
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=25, buttonRowHeightVp=3) returns 65.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0161 begin`);
      const actual: number = freeSpaceOf(96, 25, 3);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=25, ...: actual=${actual}`);
      expect(actual).assertClose(65.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0162
     * @tc.name      NdkNotification_FreeSpaceOf_0162
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=5, buttonRowHeightVp=2) returns 286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0162 begin`);
      const actual: number = freeSpaceOf(360, 5, 2);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=5, ...: actual=${actual}`);
      expect(actual).assertEqual(286);
      logInfo(`${BUNDLE}FreeSpaceOf_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0163
     * @tc.name      NdkNotification_FreeSpaceOf_0163
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=25, buttonRowHeightVp=0) returns 1892.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0163 begin`);
      const actual: number = freeSpaceOf(1920, 25, 0);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=25...: actual=${actual}`);
      expect(actual).assertClose(1892.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0164
     * @tc.name      NdkNotification_FreeSpaceOf_0164
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=3, buttonRowHeightVp=1080) returns 730.6666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0164 begin`);
      const actual: number = freeSpaceOf(1920, 3, 1080);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=3,...: actual=${actual}`);
      expect(actual).assertClose(730.6666666666667, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0165
     * @tc.name      NdkNotification_FreeSpaceOf_0165
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=10, buttonRowHeightVp=2) returns 314
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0165 begin`);
      const actual: number = freeSpaceOf(360, 10, 2);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=10,...: actual=${actual}`);
      expect(actual).assertEqual(314);
      logInfo(`${BUNDLE}FreeSpaceOf_0165 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0166
     * @tc.name      NdkNotification_FreeSpaceOf_0166
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=10, buttonRowHeightVp=720) returns 1156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0166 begin`);
      const actual: number = freeSpaceOf(1920, 10, 720);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=10...: actual=${actual}`);
      expect(actual).assertEqual(1156);
      logInfo(`${BUNDLE}FreeSpaceOf_0166 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0167
     * @tc.name      NdkNotification_FreeSpaceOf_0167
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=10, buttonRowHeightVp=96) returns 940
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0167 begin`);
      const actual: number = freeSpaceOf(1080, 10, 96);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=10...: actual=${actual}`);
      expect(actual).assertEqual(940);
      logInfo(`${BUNDLE}FreeSpaceOf_0167 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0168
     * @tc.name      NdkNotification_FreeSpaceOf_0168
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=5, buttonRowHeightVp=0) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0168 begin`);
      const actual: number = freeSpaceOf(360, 5, 0);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=5, ...: actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}FreeSpaceOf_0168 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0169
     * @tc.name      NdkNotification_FreeSpaceOf_0169
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=20, buttonRowHeightVp=100) returns 590
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0169 begin`);
      const actual: number = freeSpaceOf(720, 20, 100);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=20,...: actual=${actual}`);
      expect(actual).assertEqual(590);
      logInfo(`${BUNDLE}FreeSpaceOf_0169 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0170
     * @tc.name      NdkNotification_FreeSpaceOf_0170
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=-1, buttonRowHeightVp=360) returns 1544
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0170 begin`);
      const actual: number = freeSpaceOf(1920, -1, 360);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=-1...: actual=${actual}`);
      expect(actual).assertEqual(1544);
      logInfo(`${BUNDLE}FreeSpaceOf_0170 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0171
     * @tc.name      NdkNotification_FreeSpaceOf_0171
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=2, buttonRowHeightVp=1) returns 563
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0171 begin`);
      const actual: number = freeSpaceOf(720, 2, 1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=2, ...: actual=${actual}`);
      expect(actual).assertEqual(563);
      logInfo(`${BUNDLE}FreeSpaceOf_0171 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0172
     * @tc.name      NdkNotification_FreeSpaceOf_0172
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=1, buttonRowHeightVp=2) returns 1622
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0172 begin`);
      const actual: number = freeSpaceOf(1920, 1, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=1,...: actual=${actual}`);
      expect(actual).assertEqual(1622);
      logInfo(`${BUNDLE}FreeSpaceOf_0172 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0173
     * @tc.name      NdkNotification_FreeSpaceOf_0173
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=-1, buttonRowHeightVp=1) returns 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0173 begin`);
      const actual: number = freeSpaceOf(100, -1, 1);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=-1,...: actual=${actual}`);
      expect(actual).assertEqual(83);
      logInfo(`${BUNDLE}FreeSpaceOf_0173 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0174
     * @tc.name      NdkNotification_FreeSpaceOf_0174
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=24.6, buttonRowHeightVp=1) returns 691.6178861788618
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0174 begin`);
      const actual: number = freeSpaceOf(720, 24.6, 1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=24....: actual=${actual}`);
      expect(actual).assertClose(691.6178861788618, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0174 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0175
     * @tc.name      NdkNotification_FreeSpaceOf_0175
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=1, buttonRowHeightVp=720) returns 904
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0175 begin`);
      const actual: number = freeSpaceOf(1920, 1, 720);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=1,...: actual=${actual}`);
      expect(actual).assertEqual(904);
      logInfo(`${BUNDLE}FreeSpaceOf_0175 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0176
     * @tc.name      NdkNotification_FreeSpaceOf_0176
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=15, buttonRowHeightVp=10) returns 675.3333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0176 begin`);
      const actual: number = freeSpaceOf(720, 15, 10);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=15,...: actual=${actual}`);
      expect(actual).assertClose(675.3333333333334, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0176 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0177
     * @tc.name      NdkNotification_FreeSpaceOf_0177
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=20, buttonRowHeightVp=0) returns 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0177 begin`);
      const actual: number = freeSpaceOf(96, 20, 0);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=20, ...: actual=${actual}`);
      expect(actual).assertEqual(66);
      logInfo(`${BUNDLE}FreeSpaceOf_0177 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0178
     * @tc.name      NdkNotification_FreeSpaceOf_0178
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=5, buttonRowHeightVp=100) returns 1748
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0178 begin`);
      const actual: number = freeSpaceOf(1920, 5, 100);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=5,...: actual=${actual}`);
      expect(actual).assertEqual(1748);
      logInfo(`${BUNDLE}FreeSpaceOf_0178 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0179
     * @tc.name      NdkNotification_FreeSpaceOf_0179
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=20, buttonRowHeightVp=2) returns 688
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0179 begin`);
      const actual: number = freeSpaceOf(720, 20, 2);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=20,...: actual=${actual}`);
      expect(actual).assertEqual(688);
      logInfo(`${BUNDLE}FreeSpaceOf_0179 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0180
     * @tc.name      NdkNotification_FreeSpaceOf_0180
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=15, buttonRowHeightVp=360) returns 685.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0180 begin`);
      const actual: number = freeSpaceOf(1080, 15, 360);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=15...: actual=${actual}`);
      expect(actual).assertClose(685.3333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0180 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0181
     * @tc.name      NdkNotification_FreeSpaceOf_0181
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=24.6, buttonRowHeightVp=360) returns 1532.6178861788617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0181 begin`);
      const actual: number = freeSpaceOf(1920, 24.6, 360);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=24...: actual=${actual}`);
      expect(actual).assertClose(1532.6178861788617, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0181 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0182
     * @tc.name      NdkNotification_FreeSpaceOf_0182
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=15, buttonRowHeightVp=2) returns 323.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0182 begin`);
      const actual: number = freeSpaceOf(360, 15, 2);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=15,...: actual=${actual}`);
      expect(actual).assertClose(323.3333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0182 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0183
     * @tc.name      NdkNotification_FreeSpaceOf_0183
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=5, buttonRowHeightVp=2) returns 646
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0183 begin`);
      const actual: number = freeSpaceOf(720, 5, 2);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=5, ...: actual=${actual}`);
      expect(actual).assertEqual(646);
      logInfo(`${BUNDLE}FreeSpaceOf_0183 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0184
     * @tc.name      NdkNotification_FreeSpaceOf_0184
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=10, buttonRowHeightVp=-1) returns 677
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0184 begin`);
      const actual: number = freeSpaceOf(720, 10, -1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=10,...: actual=${actual}`);
      expect(actual).assertEqual(677);
      logInfo(`${BUNDLE}FreeSpaceOf_0184 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0185
     * @tc.name      NdkNotification_FreeSpaceOf_0185
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=25, buttonRowHeightVp=1) returns 691.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0185 begin`);
      const actual: number = freeSpaceOf(720, 25, 1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=25,...: actual=${actual}`);
      expect(actual).assertClose(691.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0185 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0186
     * @tc.name      NdkNotification_FreeSpaceOf_0186
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=100, buttonRowHeightVp=1080) returns 821.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0186 begin`);
      const actual: number = freeSpaceOf(1920, 100, 1080);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=10...: actual=${actual}`);
      expect(actual).assertClose(821.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0186 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0187
     * @tc.name      NdkNotification_FreeSpaceOf_0187
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=5, buttonRowHeightVp=-1) returns 289
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0187 begin`);
      const actual: number = freeSpaceOf(360, 5, -1);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=5, ...: actual=${actual}`);
      expect(actual).assertEqual(289);
      logInfo(`${BUNDLE}FreeSpaceOf_0187 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0188
     * @tc.name      NdkNotification_FreeSpaceOf_0188
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=100, buttonRowHeightVp=360) returns 1541.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0188 begin`);
      const actual: number = freeSpaceOf(1920, 100, 360);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=10...: actual=${actual}`);
      expect(actual).assertClose(1541.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0188 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0189
     * @tc.name      NdkNotification_FreeSpaceOf_0189
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=5, buttonRowHeightVp=100) returns 188
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0189 begin`);
      const actual: number = freeSpaceOf(360, 5, 100);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=5, ...: actual=${actual}`);
      expect(actual).assertEqual(188);
      logInfo(`${BUNDLE}FreeSpaceOf_0189 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0190
     * @tc.name      NdkNotification_FreeSpaceOf_0190
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=15, buttonRowHeightVp=96) returns 949.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0190 begin`);
      const actual: number = freeSpaceOf(1080, 15, 96);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=15...: actual=${actual}`);
      expect(actual).assertClose(949.3333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0190 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0191
     * @tc.name      NdkNotification_FreeSpaceOf_0191
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=0, buttonRowHeightVp=3) returns 1061
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0191 begin`);
      const actual: number = freeSpaceOf(1080, 0, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=0,...: actual=${actual}`);
      expect(actual).assertEqual(1061);
      logInfo(`${BUNDLE}FreeSpaceOf_0191 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0192
     * @tc.name      NdkNotification_FreeSpaceOf_0192
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=15, buttonRowHeightVp=3) returns 682.3333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0192 begin`);
      const actual: number = freeSpaceOf(720, 15, 3);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=15,...: actual=${actual}`);
      expect(actual).assertClose(682.3333333333334, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0192 end`);
    });
  });
}
