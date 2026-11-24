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
export default function freeSpaceOf3Test(): void {
  describe('FreeSpaceOf3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0193
     * @tc.name      NdkNotification_FreeSpaceOf_0193
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=24.6, buttonRowHeightVp=-1) returns 1893.6178861788617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0193 begin`);
      const actual: number = freeSpaceOf(1920, 24.6, -1);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=24...: actual=${actual}`);
      expect(actual).assertClose(1893.6178861788617, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0193 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0194
     * @tc.name      NdkNotification_FreeSpaceOf_0194
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=10, buttonRowHeightVp=2) returns 1874
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0194 begin`);
      const actual: number = freeSpaceOf(1920, 10, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=10...: actual=${actual}`);
      expect(actual).assertEqual(1874);
      logInfo(`${BUNDLE}FreeSpaceOf_0194 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0195
     * @tc.name      NdkNotification_FreeSpaceOf_0195
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=2, buttonRowHeightVp=96) returns 828
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0195 begin`);
      const actual: number = freeSpaceOf(1080, 2, 96);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=2,...: actual=${actual}`);
      expect(actual).assertEqual(828);
      logInfo(`${BUNDLE}FreeSpaceOf_0195 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0196
     * @tc.name      NdkNotification_FreeSpaceOf_0196
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=3, buttonRowHeightVp=3) returns 967.6666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0196 begin`);
      const actual: number = freeSpaceOf(1080, 3, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=3,...: actual=${actual}`);
      expect(actual).assertClose(967.6666666666666, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0196 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0197
     * @tc.name      NdkNotification_FreeSpaceOf_0197
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=100, buttonRowHeightVp=2) returns 339.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0197 begin`);
      const actual: number = freeSpaceOf(360, 100, 2);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=100...: actual=${actual}`);
      expect(actual).assertClose(339.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0197 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0198
     * @tc.name      NdkNotification_FreeSpaceOf_0198
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=5, buttonRowHeightVp=3) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0198 begin`);
      const actual: number = freeSpaceOf(100, 5, 3);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=5, ...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}FreeSpaceOf_0198 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0199
     * @tc.name      NdkNotification_FreeSpaceOf_0199
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=15, buttonRowHeightVp=0) returns 61.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0199 begin`);
      const actual: number = freeSpaceOf(96, 15, 0);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=15, ...: actual=${actual}`);
      expect(actual).assertClose(61.33333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0199 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0200
     * @tc.name      NdkNotification_FreeSpaceOf_0200
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=100, buttonRowHeightVp=-1) returns 82.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0200 begin`);
      const actual: number = freeSpaceOf(100, 100, -1);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=100...: actual=${actual}`);
      expect(actual).assertClose(82.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0200 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0201
     * @tc.name      NdkNotification_FreeSpaceOf_0201
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=24.6, buttonRowHeightVp=3) returns 1889.6178861788617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0201 begin`);
      const actual: number = freeSpaceOf(1920, 24.6, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=24...: actual=${actual}`);
      expect(actual).assertClose(1889.6178861788617, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0201 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0202
     * @tc.name      NdkNotification_FreeSpaceOf_0202
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=3, buttonRowHeightVp=3) returns 247.66666666666669
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0202 begin`);
      const actual: number = freeSpaceOf(360, 3, 3);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=3, ...: actual=${actual}`);
      expect(actual).assertClose(247.66666666666669, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0202 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0203
     * @tc.name      NdkNotification_FreeSpaceOf_0203
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=0, buttonRowHeightVp=96) returns 968
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0203 begin`);
      const actual: number = freeSpaceOf(1080, 0, 96);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=0,...: actual=${actual}`);
      expect(actual).assertEqual(968);
      logInfo(`${BUNDLE}FreeSpaceOf_0203 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0204
     * @tc.name      NdkNotification_FreeSpaceOf_0204
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=1, buttonRowHeightVp=1) returns 423
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0204 begin`);
      const actual: number = freeSpaceOf(720, 1, 1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=1, ...: actual=${actual}`);
      expect(actual).assertEqual(423);
      logInfo(`${BUNDLE}FreeSpaceOf_0204 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0205
     * @tc.name      NdkNotification_FreeSpaceOf_0205
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=25, buttonRowHeightVp=360) returns 332.79999999999995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0205 begin`);
      const actual: number = freeSpaceOf(720, 25, 360);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=25,...: actual=${actual}`);
      expect(actual).assertClose(332.79999999999995, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0205 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0206
     * @tc.name      NdkNotification_FreeSpaceOf_0206
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=100, buttonRowHeightVp=96) returns 245.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0206 begin`);
      const actual: number = freeSpaceOf(360, 100, 96);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=100...: actual=${actual}`);
      expect(actual).assertClose(245.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0206 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0207
     * @tc.name      NdkNotification_FreeSpaceOf_0207
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=100, buttonRowHeightVp=360) returns 341.20000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0207 begin`);
      const actual: number = freeSpaceOf(720, 100, 360);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=100...: actual=${actual}`);
      expect(actual).assertClose(341.20000000000005, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0207 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0208
     * @tc.name      NdkNotification_FreeSpaceOf_0208
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=10, buttonRowHeightVp=3) returns 673
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0208 begin`);
      const actual: number = freeSpaceOf(720, 10, 3);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=10,...: actual=${actual}`);
      expect(actual).assertEqual(673);
      logInfo(`${BUNDLE}FreeSpaceOf_0208 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0209
     * @tc.name      NdkNotification_FreeSpaceOf_0209
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=25, buttonRowHeightVp=1) returns 331.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0209 begin`);
      const actual: number = freeSpaceOf(360, 25, 1);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=25,...: actual=${actual}`);
      expect(actual).assertClose(331.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0209 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0210
     * @tc.name      NdkNotification_FreeSpaceOf_0210
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=24.6, buttonRowHeightVp=10) returns 62.617886178861795
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0210 begin`);
      const actual: number = freeSpaceOf(100, 24.6, 10);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=24....: actual=${actual}`);
      expect(actual).assertClose(62.617886178861795, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0210 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0211
     * @tc.name      NdkNotification_FreeSpaceOf_0211
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=5, buttonRowHeightVp=3) returns 1005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0211 begin`);
      const actual: number = freeSpaceOf(1080, 5, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=5,...: actual=${actual}`);
      expect(actual).assertEqual(1005);
      logInfo(`${BUNDLE}FreeSpaceOf_0211 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0212
     * @tc.name      NdkNotification_FreeSpaceOf_0212
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=20, buttonRowHeightVp=1) returns 1889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0212 begin`);
      const actual: number = freeSpaceOf(1920, 20, 1);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=20...: actual=${actual}`);
      expect(actual).assertEqual(1889);
      logInfo(`${BUNDLE}FreeSpaceOf_0212 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0213
     * @tc.name      NdkNotification_FreeSpaceOf_0213
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=24.6, buttonRowHeightVp=96) returns 956.6178861788617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0213 begin`);
      const actual: number = freeSpaceOf(1080, 24.6, 96);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=24...: actual=${actual}`);
      expect(actual).assertClose(956.6178861788617, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0213 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0214
     * @tc.name      NdkNotification_FreeSpaceOf_0214
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=0, buttonRowHeightVp=-1) returns 345
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0214 begin`);
      const actual: number = freeSpaceOf(360, 0, -1);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=0, ...: actual=${actual}`);
      expect(actual).assertEqual(345);
      logInfo(`${BUNDLE}FreeSpaceOf_0214 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0215
     * @tc.name      NdkNotification_FreeSpaceOf_0215
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=100, buttonRowHeightVp=-1) returns 702.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0215 begin`);
      const actual: number = freeSpaceOf(720, 100, -1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=100...: actual=${actual}`);
      expect(actual).assertClose(702.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0215 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0216
     * @tc.name      NdkNotification_FreeSpaceOf_0216
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=25, buttonRowHeightVp=10) returns 58.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0216 begin`);
      const actual: number = freeSpaceOf(96, 25, 10);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=25, ...: actual=${actual}`);
      expect(actual).assertClose(58.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0216 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0217
     * @tc.name      NdkNotification_FreeSpaceOf_0217
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=100, buttonRowHeightVp=100) returns 961.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0217 begin`);
      const actual: number = freeSpaceOf(1080, 100, 100);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=10...: actual=${actual}`);
      expect(actual).assertClose(961.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0217 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0218
     * @tc.name      NdkNotification_FreeSpaceOf_0218
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=3, buttonRowHeightVp=3) returns 1807.6666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0218 begin`);
      const actual: number = freeSpaceOf(1920, 3, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=3,...: actual=${actual}`);
      expect(actual).assertClose(1807.6666666666667, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0218 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0219
     * @tc.name      NdkNotification_FreeSpaceOf_0219
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=1, buttonRowHeightVp=10) returns 774
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0219 begin`);
      const actual: number = freeSpaceOf(1080, 1, 10);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=1,...: actual=${actual}`);
      expect(actual).assertEqual(774);
      logInfo(`${BUNDLE}FreeSpaceOf_0219 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0220
     * @tc.name      NdkNotification_FreeSpaceOf_0220
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=0, buttonRowHeightVp=2) returns 342
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0220 begin`);
      const actual: number = freeSpaceOf(360, 0, 2);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=0, ...: actual=${actual}`);
      expect(actual).assertEqual(342);
      logInfo(`${BUNDLE}FreeSpaceOf_0220 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0221
     * @tc.name      NdkNotification_FreeSpaceOf_0221
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=2, buttonRowHeightVp=3) returns 1761
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0221 begin`);
      const actual: number = freeSpaceOf(1920, 2, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=2,...: actual=${actual}`);
      expect(actual).assertEqual(1761);
      logInfo(`${BUNDLE}FreeSpaceOf_0221 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0222
     * @tc.name      NdkNotification_FreeSpaceOf_0222
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=0, buttonRowHeightVp=3) returns 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0222 begin`);
      const actual: number = freeSpaceOf(96, 0, 3);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=0, b...: actual=${actual}`);
      expect(actual).assertEqual(77);
      logInfo(`${BUNDLE}FreeSpaceOf_0222 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0223
     * @tc.name      NdkNotification_FreeSpaceOf_0223
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=25, buttonRowHeightVp=-1) returns 1893.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0223 begin`);
      const actual: number = freeSpaceOf(1920, 25, -1);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=25...: actual=${actual}`);
      expect(actual).assertClose(1893.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0223 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0224
     * @tc.name      NdkNotification_FreeSpaceOf_0224
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=1, buttonRowHeightVp=3) returns 1621
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0224 begin`);
      const actual: number = freeSpaceOf(1920, 1, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=1,...: actual=${actual}`);
      expect(actual).assertEqual(1621);
      logInfo(`${BUNDLE}FreeSpaceOf_0224 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0225
     * @tc.name      NdkNotification_FreeSpaceOf_0225
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=15, buttonRowHeightVp=0) returns 685.3333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0225 begin`);
      const actual: number = freeSpaceOf(720, 15, 0);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=15,...: actual=${actual}`);
      expect(actual).assertClose(685.3333333333334, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0225 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0226
     * @tc.name      NdkNotification_FreeSpaceOf_0226
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=10, buttonRowHeightVp=-1) returns 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0226 begin`);
      const actual: number = freeSpaceOf(100, 10, -1);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=10,...: actual=${actual}`);
      expect(actual).assertEqual(57);
      logInfo(`${BUNDLE}FreeSpaceOf_0226 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0227
     * @tc.name      NdkNotification_FreeSpaceOf_0227
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=100, buttonRowHeightVp=3) returns 698.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0227 begin`);
      const actual: number = freeSpaceOf(720, 100, 3);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=100...: actual=${actual}`);
      expect(actual).assertClose(698.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0227 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0228
     * @tc.name      NdkNotification_FreeSpaceOf_0228
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=15, buttonRowHeightVp=360) returns 1525.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0228 begin`);
      const actual: number = freeSpaceOf(1920, 15, 360);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=15...: actual=${actual}`);
      expect(actual).assertClose(1525.3333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0228 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0229
     * @tc.name      NdkNotification_FreeSpaceOf_0229
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=3, buttonRowHeightVp=720) returns 1090.6666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0229 begin`);
      const actual: number = freeSpaceOf(1920, 3, 720);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=3,...: actual=${actual}`);
      expect(actual).assertClose(1090.6666666666667, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0229 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0230
     * @tc.name      NdkNotification_FreeSpaceOf_0230
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=1, buttonRowHeightVp=-1) returns 785
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0230 begin`);
      const actual: number = freeSpaceOf(1080, 1, -1);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=1,...: actual=${actual}`);
      expect(actual).assertEqual(785);
      logInfo(`${BUNDLE}FreeSpaceOf_0230 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0231
     * @tc.name      NdkNotification_FreeSpaceOf_0231
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=20, buttonRowHeightVp=3) returns 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0231 begin`);
      const actual: number = freeSpaceOf(96, 20, 3);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=20, ...: actual=${actual}`);
      expect(actual).assertEqual(63);
      logInfo(`${BUNDLE}FreeSpaceOf_0231 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0232
     * @tc.name      NdkNotification_FreeSpaceOf_0232
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=-1, buttonRowHeightVp=10) returns 694
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0232 begin`);
      const actual: number = freeSpaceOf(720, -1, 10);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=-1,...: actual=${actual}`);
      expect(actual).assertEqual(694);
      logInfo(`${BUNDLE}FreeSpaceOf_0232 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0233
     * @tc.name      NdkNotification_FreeSpaceOf_0233
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=25, buttonRowHeightVp=360) returns 1532.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0233 begin`);
      const actual: number = freeSpaceOf(1920, 25, 360);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=25...: actual=${actual}`);
      expect(actual).assertClose(1532.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0233 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0234
     * @tc.name      NdkNotification_FreeSpaceOf_0234
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=20, buttonRowHeightVp=3) returns 687
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0234 begin`);
      const actual: number = freeSpaceOf(720, 20, 3);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=20,...: actual=${actual}`);
      expect(actual).assertEqual(687);
      logInfo(`${BUNDLE}FreeSpaceOf_0234 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0235
     * @tc.name      NdkNotification_FreeSpaceOf_0235
     * @tc.desc      freeSpaceOf(pageHeightVp=1, density=0, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0235 begin`);
      const actual: number = freeSpaceOf(1, 0, 0);
      logInfo(`freeSpaceOf(pageHeightVp=1, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0235 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0236
     * @tc.name      NdkNotification_FreeSpaceOf_0236
     * @tc.desc      freeSpaceOf(pageHeightVp=-1, density=0, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0236 begin`);
      const actual: number = freeSpaceOf(-1, 0, 0);
      logInfo(`freeSpaceOf(pageHeightVp=-1, density=0, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0236 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0237
     * @tc.name      NdkNotification_FreeSpaceOf_0237
     * @tc.desc      freeSpaceOf(pageHeightVp=2, density=0, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0237 begin`);
      const actual: number = freeSpaceOf(2, 0, 0);
      logInfo(`freeSpaceOf(pageHeightVp=2, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0237 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0238
     * @tc.name      NdkNotification_FreeSpaceOf_0238
     * @tc.desc      freeSpaceOf(pageHeightVp=3, density=0, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0238 begin`);
      const actual: number = freeSpaceOf(3, 0, 0);
      logInfo(`freeSpaceOf(pageHeightVp=3, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0238 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0239
     * @tc.name      NdkNotification_FreeSpaceOf_0239
     * @tc.desc      freeSpaceOf(pageHeightVp=10, density=0, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0239 begin`);
      const actual: number = freeSpaceOf(10, 0, 0);
      logInfo(`freeSpaceOf(pageHeightVp=10, density=0, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0239 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0240
     * @tc.name      NdkNotification_FreeSpaceOf_0240
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=-1, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0240 begin`);
      const actual: number = freeSpaceOf(0, -1, 0);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=-1, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0240 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0241
     * @tc.name      NdkNotification_FreeSpaceOf_0241
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=1, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0241 begin`);
      const actual: number = freeSpaceOf(0, 1, 0);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=1, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0241 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0242
     * @tc.name      NdkNotification_FreeSpaceOf_0242
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=2, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0242 begin`);
      const actual: number = freeSpaceOf(0, 2, 0);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=2, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0242 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0243
     * @tc.name      NdkNotification_FreeSpaceOf_0243
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=3, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0243 begin`);
      const actual: number = freeSpaceOf(0, 3, 0);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=3, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0243 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0244
     * @tc.name      NdkNotification_FreeSpaceOf_0244
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=10, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0244 begin`);
      const actual: number = freeSpaceOf(0, 10, 0);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=10, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0244 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0245
     * @tc.name      NdkNotification_FreeSpaceOf_0245
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=100, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0245 begin`);
      const actual: number = freeSpaceOf(0, 100, 0);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=100, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0245 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0246
     * @tc.name      NdkNotification_FreeSpaceOf_0246
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=5, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0246 begin`);
      const actual: number = freeSpaceOf(0, 5, 0);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=5, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0246 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0247
     * @tc.name      NdkNotification_FreeSpaceOf_0247
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=15, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0247 begin`);
      const actual: number = freeSpaceOf(0, 15, 0);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=15, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0247 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0248
     * @tc.name      NdkNotification_FreeSpaceOf_0248
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=20, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0248 begin`);
      const actual: number = freeSpaceOf(0, 20, 0);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=20, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0248 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0249
     * @tc.name      NdkNotification_FreeSpaceOf_0249
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=25, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0249 begin`);
      const actual: number = freeSpaceOf(0, 25, 0);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=25, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0249 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0250
     * @tc.name      NdkNotification_FreeSpaceOf_0250
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=24.6, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0250 begin`);
      const actual: number = freeSpaceOf(0, 24.6, 0);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=24.6,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0250 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0251
     * @tc.name      NdkNotification_FreeSpaceOf_0251
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=0, buttonRowHeightVp=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0251 begin`);
      const actual: number = freeSpaceOf(0, 0, 1);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0251 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0252
     * @tc.name      NdkNotification_FreeSpaceOf_0252
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=0, buttonRowHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0252 begin`);
      const actual: number = freeSpaceOf(0, 0, -1);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0252 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0253
     * @tc.name      NdkNotification_FreeSpaceOf_0253
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=0, buttonRowHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0253 begin`);
      const actual: number = freeSpaceOf(0, 0, 100);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0253 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0254
     * @tc.name      NdkNotification_FreeSpaceOf_0254
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=0, buttonRowHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0254 begin`);
      const actual: number = freeSpaceOf(0, 0, 360);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0254 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0255
     * @tc.name      NdkNotification_FreeSpaceOf_0255
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=0, buttonRowHeightVp=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0255 begin`);
      const actual: number = freeSpaceOf(0, 0, 720);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0255 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0256
     * @tc.name      NdkNotification_FreeSpaceOf_0256
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=0, buttonRowHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0256 begin`);
      const actual: number = freeSpaceOf(0, 0, 1080);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0256 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0257
     * @tc.name      NdkNotification_FreeSpaceOf_0257
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=0, buttonRowHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0257 begin`);
      const actual: number = freeSpaceOf(0, 0, 1920);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0257 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0258
     * @tc.name      NdkNotification_FreeSpaceOf_0258
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=0, buttonRowHeightVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0258 begin`);
      const actual: number = freeSpaceOf(0, 0, 2);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0258 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0259
     * @tc.name      NdkNotification_FreeSpaceOf_0259
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=0, buttonRowHeightVp=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0259 begin`);
      const actual: number = freeSpaceOf(0, 0, 3);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0259 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0260
     * @tc.name      NdkNotification_FreeSpaceOf_0260
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=0, buttonRowHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0260 begin`);
      const actual: number = freeSpaceOf(0, 0, 10);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0260 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0261
     * @tc.name      NdkNotification_FreeSpaceOf_0261
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=0, buttonRowHeightVp=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0261 begin`);
      const actual: number = freeSpaceOf(0, 0, 96);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0261 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0262
     * @tc.name      NdkNotification_FreeSpaceOf_0262
     * @tc.desc      freeSpaceOf(pageHeightVp=1, density=24.6, buttonRowHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0262 begin`);
      const actual: number = freeSpaceOf(1, 24.6, -1);
      logInfo(`freeSpaceOf(pageHeightVp=1, density=24.6,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0262 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0263
     * @tc.name      NdkNotification_FreeSpaceOf_0263
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=3, buttonRowHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0263 begin`);
      const actual: number = freeSpaceOf(360, 3, 1080);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=3, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0263 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0264
     * @tc.name      NdkNotification_FreeSpaceOf_0264
     * @tc.desc      freeSpaceOf(pageHeightVp=1, density=1, buttonRowHeightVp=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0264 begin`);
      const actual: number = freeSpaceOf(1, 1, 1);
      logInfo(`freeSpaceOf(pageHeightVp=1, density=1, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0264 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0265
     * @tc.name      NdkNotification_FreeSpaceOf_0265
     * @tc.desc      freeSpaceOf(pageHeightVp=2, density=10, buttonRowHeightVp=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0265 begin`);
      const actual: number = freeSpaceOf(2, 10, 96);
      logInfo(`freeSpaceOf(pageHeightVp=2, density=10, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0265 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0266
     * @tc.name      NdkNotification_FreeSpaceOf_0266
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=2, buttonRowHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0266 begin`);
      const actual: number = freeSpaceOf(96, 2, 10);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=2, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0266 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0267
     * @tc.name      NdkNotification_FreeSpaceOf_0267
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=1, buttonRowHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0267 begin`);
      const actual: number = freeSpaceOf(100, 1, -1);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=1, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0267 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0268
     * @tc.name      NdkNotification_FreeSpaceOf_0268
     * @tc.desc      freeSpaceOf(pageHeightVp=2, density=10, buttonRowHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0268 begin`);
      const actual: number = freeSpaceOf(2, 10, 10);
      logInfo(`freeSpaceOf(pageHeightVp=2, density=10, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0268 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0269
     * @tc.name      NdkNotification_FreeSpaceOf_0269
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=25, buttonRowHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0269 begin`);
      const actual: number = freeSpaceOf(0, 25, -1);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=25, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0269 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0270
     * @tc.name      NdkNotification_FreeSpaceOf_0270
     * @tc.desc      freeSpaceOf(pageHeightVp=10, density=15, buttonRowHeightVp=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0270 begin`);
      const actual: number = freeSpaceOf(10, 15, 96);
      logInfo(`freeSpaceOf(pageHeightVp=10, density=15, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0270 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0271
     * @tc.name      NdkNotification_FreeSpaceOf_0271
     * @tc.desc      freeSpaceOf(pageHeightVp=10, density=5, buttonRowHeightVp=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0271 begin`);
      const actual: number = freeSpaceOf(10, 5, 96);
      logInfo(`freeSpaceOf(pageHeightVp=10, density=5, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0271 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0272
     * @tc.name      NdkNotification_FreeSpaceOf_0272
     * @tc.desc      freeSpaceOf(pageHeightVp=3, density=25, buttonRowHeightVp=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0272 begin`);
      const actual: number = freeSpaceOf(3, 25, 720);
      logInfo(`freeSpaceOf(pageHeightVp=3, density=25, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0272 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0273
     * @tc.name      NdkNotification_FreeSpaceOf_0273
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=25, buttonRowHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0273 begin`);
      const actual: number = freeSpaceOf(720, 25, 1080);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=25,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0273 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0274
     * @tc.name      NdkNotification_FreeSpaceOf_0274
     * @tc.desc      freeSpaceOf(pageHeightVp=-1, density=2, buttonRowHeightVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0274 begin`);
      const actual: number = freeSpaceOf(-1, 2, 2);
      logInfo(`freeSpaceOf(pageHeightVp=-1, density=2, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0274 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0275
     * @tc.name      NdkNotification_FreeSpaceOf_0275
     * @tc.desc      freeSpaceOf(pageHeightVp=3, density=100, buttonRowHeightVp=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0275 begin`);
      const actual: number = freeSpaceOf(3, 100, 3);
      logInfo(`freeSpaceOf(pageHeightVp=3, density=100, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0275 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0276
     * @tc.name      NdkNotification_FreeSpaceOf_0276
     * @tc.desc      freeSpaceOf(pageHeightVp=-1, density=15, buttonRowHeightVp=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0276 begin`);
      const actual: number = freeSpaceOf(-1, 15, 3);
      logInfo(`freeSpaceOf(pageHeightVp=-1, density=15, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0276 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0277
     * @tc.name      NdkNotification_FreeSpaceOf_0277
     * @tc.desc      freeSpaceOf(pageHeightVp=3, density=2, buttonRowHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0277 begin`);
      const actual: number = freeSpaceOf(3, 2, 10);
      logInfo(`freeSpaceOf(pageHeightVp=3, density=2, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0277 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0278
     * @tc.name      NdkNotification_FreeSpaceOf_0278
     * @tc.desc      freeSpaceOf(pageHeightVp=1, density=24.6, buttonRowHeightVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0278 begin`);
      const actual: number = freeSpaceOf(1, 24.6, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1, density=24.6,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0278 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0279
     * @tc.name      NdkNotification_FreeSpaceOf_0279
     * @tc.desc      freeSpaceOf(pageHeightVp=10, density=24.6, buttonRowHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0279 begin`);
      const actual: number = freeSpaceOf(10, 24.6, -1);
      logInfo(`freeSpaceOf(pageHeightVp=10, density=24.6...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0279 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0280
     * @tc.name      NdkNotification_FreeSpaceOf_0280
     * @tc.desc      freeSpaceOf(pageHeightVp=1, density=10, buttonRowHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0280 begin`);
      const actual: number = freeSpaceOf(1, 10, 100);
      logInfo(`freeSpaceOf(pageHeightVp=1, density=10, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0280 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0281
     * @tc.name      NdkNotification_FreeSpaceOf_0281
     * @tc.desc      freeSpaceOf(pageHeightVp=1, density=5, buttonRowHeightVp=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0281 begin`);
      const actual: number = freeSpaceOf(1, 5, 720);
      logInfo(`freeSpaceOf(pageHeightVp=1, density=5, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0281 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0282
     * @tc.name      NdkNotification_FreeSpaceOf_0282
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=3, buttonRowHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0282 begin`);
      const actual: number = freeSpaceOf(1080, 3, 1080);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=3,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0282 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0283
     * @tc.name      NdkNotification_FreeSpaceOf_0283
     * @tc.desc      freeSpaceOf(pageHeightVp=2, density=15, buttonRowHeightVp=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0283 begin`);
      const actual: number = freeSpaceOf(2, 15, 10);
      logInfo(`freeSpaceOf(pageHeightVp=2, density=15, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0283 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0284
     * @tc.name      NdkNotification_FreeSpaceOf_0284
     * @tc.desc      freeSpaceOf(pageHeightVp=3, density=25, buttonRowHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0284 begin`);
      const actual: number = freeSpaceOf(3, 25, 100);
      logInfo(`freeSpaceOf(pageHeightVp=3, density=25, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0284 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0285
     * @tc.name      NdkNotification_FreeSpaceOf_0285
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=15, buttonRowHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0285 begin`);
      const actual: number = freeSpaceOf(0, 15, 1920);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=15, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0285 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0286
     * @tc.name      NdkNotification_FreeSpaceOf_0286
     * @tc.desc      freeSpaceOf(pageHeightVp=-1, density=25, buttonRowHeightVp=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0286 begin`);
      const actual: number = freeSpaceOf(-1, 25, 3);
      logInfo(`freeSpaceOf(pageHeightVp=-1, density=25, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0286 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0287
     * @tc.name      NdkNotification_FreeSpaceOf_0287
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=1, buttonRowHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0287 begin`);
      const actual: number = freeSpaceOf(100, 1, 1920);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=1, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0287 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0288
     * @tc.name      NdkNotification_FreeSpaceOf_0288
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=-1, buttonRowHeightVp=0) returns 1904
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0288 begin`);
      const actual: number = freeSpaceOf(1920, -1, 0);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=-1...: actual=${actual}`);
      expect(actual).assertEqual(1904);
      logInfo(`${BUNDLE}FreeSpaceOf_0288 end`);
    });
  });
}
