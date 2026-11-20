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

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for freeSpaceOf (11 cases). */
export default function freeSpaceOf4Test(): void {
  describe('FreeSpaceOf4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0289
     * @tc.name      NdkNotification_FreeSpaceOf_0289
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=1, buttonRowHeightVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0289 begin`);
      const actual: number = freeSpaceOf(100, 1, 2);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=1, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0289 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0290
     * @tc.name      NdkNotification_FreeSpaceOf_0290
     * @tc.desc      freeSpaceOf(pageHeightVp=2, density=1, buttonRowHeightVp=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0290 begin`);
      const actual: number = freeSpaceOf(2, 1, 2);
      logInfo(`freeSpaceOf(pageHeightVp=2, density=1, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0290 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0291
     * @tc.name      NdkNotification_FreeSpaceOf_0291
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=-1, buttonRowHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0291 begin`);
      const actual: number = freeSpaceOf(100, -1, 1920);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=-1,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0291 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0292
     * @tc.name      NdkNotification_FreeSpaceOf_0292
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=2, buttonRowHeightVp=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0292 begin`);
      const actual: number = freeSpaceOf(0, 2, -1);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=2, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0292 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0293
     * @tc.name      NdkNotification_FreeSpaceOf_0293
     * @tc.desc      freeSpaceOf(pageHeightVp=10, density=-1, buttonRowHeightVp=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0293 begin`);
      const actual: number = freeSpaceOf(10, -1, 720);
      logInfo(`freeSpaceOf(pageHeightVp=10, density=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0293 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0294
     * @tc.name      NdkNotification_FreeSpaceOf_0294
     * @tc.desc      freeSpaceOf(pageHeightVp=-1, density=25, buttonRowHeightVp=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0294 begin`);
      const actual: number = freeSpaceOf(-1, 25, 1080);
      logInfo(`freeSpaceOf(pageHeightVp=-1, density=25, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0294 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0295
     * @tc.name      NdkNotification_FreeSpaceOf_0295
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=100, buttonRowHeightVp=360) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0295 begin`);
      const actual: number = freeSpaceOf(96, 100, 360);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=100,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0295 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0296
     * @tc.name      NdkNotification_FreeSpaceOf_0296
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=0, buttonRowHeightVp=360) returns 344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0296 begin`);
      const actual: number = freeSpaceOf(720, 0, 360);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=0, ...: actual=${actual}`);
      expect(actual).assertEqual(344);
      logInfo(`${BUNDLE}FreeSpaceOf_0296 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0297
     * @tc.name      NdkNotification_FreeSpaceOf_0297
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=2, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0297 begin`);
      const actual: number = freeSpaceOf(96, 2, 0);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=2, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0297 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0298
     * @tc.name      NdkNotification_FreeSpaceOf_0298
     * @tc.desc      freeSpaceOf(pageHeightVp=10, density=15, buttonRowHeightVp=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0298 begin`);
      const actual: number = freeSpaceOf(10, 15, 100);
      logInfo(`freeSpaceOf(pageHeightVp=10, density=15, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0298 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0299
     * @tc.name      NdkNotification_FreeSpaceOf_0299
     * @tc.desc      freeSpaceOf(pageHeightVp=1, density=20, buttonRowHeightVp=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0299 begin`);
      const actual: number = freeSpaceOf(1, 20, 1920);
      logInfo(`freeSpaceOf(pageHeightVp=1, density=20, b...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0299 end`);
    });
  });
}
