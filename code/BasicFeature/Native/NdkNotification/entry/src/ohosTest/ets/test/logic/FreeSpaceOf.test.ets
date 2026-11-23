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
export default function freeSpaceOfTest(): void {
  describe('FreeSpaceOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0001
     * @tc.name      NdkNotification_FreeSpaceOf_0001
     * @tc.desc      freeSpaceOf(pageHeightVp=0, density=0, buttonRowHeightVp=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_FreeSpaceOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0001 begin`);
      const actual: number = freeSpaceOf(0, 0, 0);
      logInfo(`freeSpaceOf(pageHeightVp=0, density=0, bu...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FreeSpaceOf_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0002
     * @tc.name      NdkNotification_FreeSpaceOf_0002
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=0, buttonRowHeightVp=0) returns 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_FreeSpaceOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0002 begin`);
      const actual: number = freeSpaceOf(100, 0, 0);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=0, ...: actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}FreeSpaceOf_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0003
     * @tc.name      NdkNotification_FreeSpaceOf_0003
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=0, buttonRowHeightVp=0) returns 344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0003 begin`);
      const actual: number = freeSpaceOf(360, 0, 0);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=0, ...: actual=${actual}`);
      expect(actual).assertEqual(344);
      logInfo(`${BUNDLE}FreeSpaceOf_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0004
     * @tc.name      NdkNotification_FreeSpaceOf_0004
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=0, buttonRowHeightVp=0) returns 704
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0004 begin`);
      const actual: number = freeSpaceOf(720, 0, 0);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=0, ...: actual=${actual}`);
      expect(actual).assertEqual(704);
      logInfo(`${BUNDLE}FreeSpaceOf_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0005
     * @tc.name      NdkNotification_FreeSpaceOf_0005
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=0, buttonRowHeightVp=0) returns 1064
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0005 begin`);
      const actual: number = freeSpaceOf(1080, 0, 0);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=0,...: actual=${actual}`);
      expect(actual).assertEqual(1064);
      logInfo(`${BUNDLE}FreeSpaceOf_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0006
     * @tc.name      NdkNotification_FreeSpaceOf_0006
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=0, buttonRowHeightVp=0) returns 1904
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0006 begin`);
      const actual: number = freeSpaceOf(1920, 0, 0);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=0,...: actual=${actual}`);
      expect(actual).assertEqual(1904);
      logInfo(`${BUNDLE}FreeSpaceOf_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0007
     * @tc.name      NdkNotification_FreeSpaceOf_0007
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=0, buttonRowHeightVp=0) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0007 begin`);
      const actual: number = freeSpaceOf(96, 0, 0);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=0, b...: actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}FreeSpaceOf_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0008
     * @tc.name      NdkNotification_FreeSpaceOf_0008
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=20, buttonRowHeightVp=2) returns 1888
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0008 begin`);
      const actual: number = freeSpaceOf(1920, 20, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=20...: actual=${actual}`);
      expect(actual).assertEqual(1888);
      logInfo(`${BUNDLE}FreeSpaceOf_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0009
     * @tc.name      NdkNotification_FreeSpaceOf_0009
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=10, buttonRowHeightVp=3) returns 1033
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0009 begin`);
      const actual: number = freeSpaceOf(1080, 10, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=10...: actual=${actual}`);
      expect(actual).assertEqual(1033);
      logInfo(`${BUNDLE}FreeSpaceOf_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0010
     * @tc.name      NdkNotification_FreeSpaceOf_0010
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=15, buttonRowHeightVp=2) returns 1883.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0010 begin`);
      const actual: number = freeSpaceOf(1920, 15, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=15...: actual=${actual}`);
      expect(actual).assertClose(1883.3333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0011
     * @tc.name      NdkNotification_FreeSpaceOf_0011
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=2, buttonRowHeightVp=10) returns 554
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0011 begin`);
      const actual: number = freeSpaceOf(720, 2, 10);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=2, ...: actual=${actual}`);
      expect(actual).assertEqual(554);
      logInfo(`${BUNDLE}FreeSpaceOf_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0012
     * @tc.name      NdkNotification_FreeSpaceOf_0012
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=20, buttonRowHeightVp=1) returns 329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0012 begin`);
      const actual: number = freeSpaceOf(360, 20, 1);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=20,...: actual=${actual}`);
      expect(actual).assertEqual(329);
      logInfo(`${BUNDLE}FreeSpaceOf_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0013
     * @tc.name      NdkNotification_FreeSpaceOf_0013
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=-1, buttonRowHeightVp=-1) returns 705
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0013 begin`);
      const actual: number = freeSpaceOf(720, -1, -1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=-1,...: actual=${actual}`);
      expect(actual).assertEqual(705);
      logInfo(`${BUNDLE}FreeSpaceOf_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0014
     * @tc.name      NdkNotification_FreeSpaceOf_0014
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=2, buttonRowHeightVp=-1) returns 1765
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0014 begin`);
      const actual: number = freeSpaceOf(1920, 2, -1);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=2,...: actual=${actual}`);
      expect(actual).assertEqual(1765);
      logInfo(`${BUNDLE}FreeSpaceOf_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0015
     * @tc.name      NdkNotification_FreeSpaceOf_0015
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=100, buttonRowHeightVp=0) returns 1901.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0015 begin`);
      const actual: number = freeSpaceOf(1920, 100, 0);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=10...: actual=${actual}`);
      expect(actual).assertClose(1901.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0016
     * @tc.name      NdkNotification_FreeSpaceOf_0016
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=0, buttonRowHeightVp=100) returns 1804
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0016 begin`);
      const actual: number = freeSpaceOf(1920, 0, 100);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=0,...: actual=${actual}`);
      expect(actual).assertEqual(1804);
      logInfo(`${BUNDLE}FreeSpaceOf_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0017
     * @tc.name      NdkNotification_FreeSpaceOf_0017
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=-1, buttonRowHeightVp=1) returns 1903
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0017 begin`);
      const actual: number = freeSpaceOf(1920, -1, 1);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=-1...: actual=${actual}`);
      expect(actual).assertEqual(1903);
      logInfo(`${BUNDLE}FreeSpaceOf_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0018
     * @tc.name      NdkNotification_FreeSpaceOf_0018
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=20, buttonRowHeightVp=0) returns 330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0018 begin`);
      const actual: number = freeSpaceOf(360, 20, 0);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=20,...: actual=${actual}`);
      expect(actual).assertEqual(330);
      logInfo(`${BUNDLE}FreeSpaceOf_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0019
     * @tc.name      NdkNotification_FreeSpaceOf_0019
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=0, buttonRowHeightVp=-1) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0019 begin`);
      const actual: number = freeSpaceOf(100, 0, -1);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=0, ...: actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}FreeSpaceOf_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0020
     * @tc.name      NdkNotification_FreeSpaceOf_0020
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=1, buttonRowHeightVp=96) returns 1528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0020 begin`);
      const actual: number = freeSpaceOf(1920, 1, 96);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=1,...: actual=${actual}`);
      expect(actual).assertEqual(1528);
      logInfo(`${BUNDLE}FreeSpaceOf_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0021
     * @tc.name      NdkNotification_FreeSpaceOf_0021
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=20, buttonRowHeightVp=10) returns 1040
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0021 begin`);
      const actual: number = freeSpaceOf(1080, 20, 10);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=20...: actual=${actual}`);
      expect(actual).assertEqual(1040);
      logInfo(`${BUNDLE}FreeSpaceOf_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0022
     * @tc.name      NdkNotification_FreeSpaceOf_0022
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=0, buttonRowHeightVp=2) returns 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0022 begin`);
      const actual: number = freeSpaceOf(96, 0, 2);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=0, b...: actual=${actual}`);
      expect(actual).assertEqual(78);
      logInfo(`${BUNDLE}FreeSpaceOf_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0023
     * @tc.name      NdkNotification_FreeSpaceOf_0023
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=24.6, buttonRowHeightVp=1) returns 331.6178861788618
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0023 begin`);
      const actual: number = freeSpaceOf(360, 24.6, 1);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=24....: actual=${actual}`);
      expect(actual).assertClose(331.6178861788618, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0024
     * @tc.name      NdkNotification_FreeSpaceOf_0024
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=20, buttonRowHeightVp=360) returns 1530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0024 begin`);
      const actual: number = freeSpaceOf(1920, 20, 360);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=20...: actual=${actual}`);
      expect(actual).assertEqual(1530);
      logInfo(`${BUNDLE}FreeSpaceOf_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0025
     * @tc.name      NdkNotification_FreeSpaceOf_0025
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=100, buttonRowHeightVp=2) returns 699.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0025 begin`);
      const actual: number = freeSpaceOf(720, 100, 2);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=100...: actual=${actual}`);
      expect(actual).assertClose(699.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0026
     * @tc.name      NdkNotification_FreeSpaceOf_0026
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=3, buttonRowHeightVp=0) returns 970.6666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0026 begin`);
      const actual: number = freeSpaceOf(1080, 3, 0);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=3,...: actual=${actual}`);
      expect(actual).assertClose(970.6666666666666, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0027
     * @tc.name      NdkNotification_FreeSpaceOf_0027
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=5, buttonRowHeightVp=2) returns 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0027 begin`);
      const actual: number = freeSpaceOf(100, 5, 2);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=5, ...: actual=${actual}`);
      expect(actual).assertEqual(26);
      logInfo(`${BUNDLE}FreeSpaceOf_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0028
     * @tc.name      NdkNotification_FreeSpaceOf_0028
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=0, buttonRowHeightVp=3) returns 1901
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0028 begin`);
      const actual: number = freeSpaceOf(1920, 0, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=0,...: actual=${actual}`);
      expect(actual).assertEqual(1901);
      logInfo(`${BUNDLE}FreeSpaceOf_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0029
     * @tc.name      NdkNotification_FreeSpaceOf_0029
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=0, buttonRowHeightVp=2) returns 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0029 begin`);
      const actual: number = freeSpaceOf(100, 0, 2);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=0, ...: actual=${actual}`);
      expect(actual).assertEqual(82);
      logInfo(`${BUNDLE}FreeSpaceOf_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0030
     * @tc.name      NdkNotification_FreeSpaceOf_0030
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=25, buttonRowHeightVp=2) returns 70.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0030 begin`);
      const actual: number = freeSpaceOf(100, 25, 2);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=25,...: actual=${actual}`);
      expect(actual).assertClose(70.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0031
     * @tc.name      NdkNotification_FreeSpaceOf_0031
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=15, buttonRowHeightVp=720) returns 1165.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0031 begin`);
      const actual: number = freeSpaceOf(1920, 15, 720);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=15...: actual=${actual}`);
      expect(actual).assertClose(1165.3333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0032
     * @tc.name      NdkNotification_FreeSpaceOf_0032
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=0, buttonRowHeightVp=96) returns 248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0032 begin`);
      const actual: number = freeSpaceOf(360, 0, 96);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=0, ...: actual=${actual}`);
      expect(actual).assertEqual(248);
      logInfo(`${BUNDLE}FreeSpaceOf_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0033
     * @tc.name      NdkNotification_FreeSpaceOf_0033
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=0, buttonRowHeightVp=3) returns 341
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0033 begin`);
      const actual: number = freeSpaceOf(360, 0, 3);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=0, ...: actual=${actual}`);
      expect(actual).assertEqual(341);
      logInfo(`${BUNDLE}FreeSpaceOf_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0034
     * @tc.name      NdkNotification_FreeSpaceOf_0034
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=2, buttonRowHeightVp=96) returns 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0034 begin`);
      const actual: number = freeSpaceOf(360, 2, 96);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=2, ...: actual=${actual}`);
      expect(actual).assertEqual(108);
      logInfo(`${BUNDLE}FreeSpaceOf_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0035
     * @tc.name      NdkNotification_FreeSpaceOf_0035
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=25, buttonRowHeightVp=0) returns 72.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0035 begin`);
      const actual: number = freeSpaceOf(100, 25, 0);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=25,...: actual=${actual}`);
      expect(actual).assertClose(72.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0036
     * @tc.name      NdkNotification_FreeSpaceOf_0036
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=24.6, buttonRowHeightVp=96) returns 1796.6178861788617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0036 begin`);
      const actual: number = freeSpaceOf(1920, 24.6, 96);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=24...: actual=${actual}`);
      expect(actual).assertClose(1796.6178861788617, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0037
     * @tc.name      NdkNotification_FreeSpaceOf_0037
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=15, buttonRowHeightVp=2) returns 1043.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0037 begin`);
      const actual: number = freeSpaceOf(1080, 15, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=15...: actual=${actual}`);
      expect(actual).assertClose(1043.3333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0038
     * @tc.name      NdkNotification_FreeSpaceOf_0038
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=0, buttonRowHeightVp=100) returns 964
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0038 begin`);
      const actual: number = freeSpaceOf(1080, 0, 100);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=0,...: actual=${actual}`);
      expect(actual).assertEqual(964);
      logInfo(`${BUNDLE}FreeSpaceOf_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0039
     * @tc.name      NdkNotification_FreeSpaceOf_0039
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=3, buttonRowHeightVp=10) returns 960.6666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0039 begin`);
      const actual: number = freeSpaceOf(1080, 3, 10);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=3,...: actual=${actual}`);
      expect(actual).assertClose(960.6666666666666, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0040
     * @tc.name      NdkNotification_FreeSpaceOf_0040
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=1, buttonRowHeightVp=2) returns 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0040 begin`);
      const actual: number = freeSpaceOf(360, 1, 2);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=1, ...: actual=${actual}`);
      expect(actual).assertEqual(62);
      logInfo(`${BUNDLE}FreeSpaceOf_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0041
     * @tc.name      NdkNotification_FreeSpaceOf_0041
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=100, buttonRowHeightVp=3) returns 74.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0041 begin`);
      const actual: number = freeSpaceOf(96, 100, 3);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=100,...: actual=${actual}`);
      expect(actual).assertClose(74.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0042
     * @tc.name      NdkNotification_FreeSpaceOf_0042
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=5, buttonRowHeightVp=96) returns 552
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0042 begin`);
      const actual: number = freeSpaceOf(720, 5, 96);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=5, ...: actual=${actual}`);
      expect(actual).assertEqual(552);
      logInfo(`${BUNDLE}FreeSpaceOf_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0043
     * @tc.name      NdkNotification_FreeSpaceOf_0043
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=-1, buttonRowHeightVp=10) returns 1894
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0043 begin`);
      const actual: number = freeSpaceOf(1920, -1, 10);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=-1...: actual=${actual}`);
      expect(actual).assertEqual(1894);
      logInfo(`${BUNDLE}FreeSpaceOf_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0044
     * @tc.name      NdkNotification_FreeSpaceOf_0044
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=15, buttonRowHeightVp=-1) returns 62.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0044 begin`);
      const actual: number = freeSpaceOf(96, 15, -1);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=15, ...: actual=${actual}`);
      expect(actual).assertClose(62.33333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0045
     * @tc.name      NdkNotification_FreeSpaceOf_0045
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=10, buttonRowHeightVp=1) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0045 begin`);
      const actual: number = freeSpaceOf(100, 10, 1);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=10,...: actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}FreeSpaceOf_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0046
     * @tc.name      NdkNotification_FreeSpaceOf_0046
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=24.6, buttonRowHeightVp=0) returns 1892.6178861788617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0046 begin`);
      const actual: number = freeSpaceOf(1920, 24.6, 0);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=24...: actual=${actual}`);
      expect(actual).assertClose(1892.6178861788617, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0047
     * @tc.name      NdkNotification_FreeSpaceOf_0047
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=24.6, buttonRowHeightVp=2) returns 690.6178861788618
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0047 begin`);
      const actual: number = freeSpaceOf(720, 24.6, 2);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=24....: actual=${actual}`);
      expect(actual).assertClose(690.6178861788618, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0048
     * @tc.name      NdkNotification_FreeSpaceOf_0048
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=15, buttonRowHeightVp=96) returns 229.33333333333331
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0048 begin`);
      const actual: number = freeSpaceOf(360, 15, 96);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=15,...: actual=${actual}`);
      expect(actual).assertClose(229.33333333333331, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0049
     * @tc.name      NdkNotification_FreeSpaceOf_0049
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=100, buttonRowHeightVp=1) returns 76.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0049 begin`);
      const actual: number = freeSpaceOf(96, 100, 1);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=100,...: actual=${actual}`);
      expect(actual).assertClose(76.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0050
     * @tc.name      NdkNotification_FreeSpaceOf_0050
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=1, buttonRowHeightVp=0) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0050 begin`);
      const actual: number = freeSpaceOf(360, 1, 0);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=1, ...: actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}FreeSpaceOf_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0051
     * @tc.name      NdkNotification_FreeSpaceOf_0051
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=15, buttonRowHeightVp=1) returns 684.3333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0051 begin`);
      const actual: number = freeSpaceOf(720, 15, 1);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=15,...: actual=${actual}`);
      expect(actual).assertClose(684.3333333333334, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0052
     * @tc.name      NdkNotification_FreeSpaceOf_0052
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=25, buttonRowHeightVp=100) returns 592.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0052 begin`);
      const actual: number = freeSpaceOf(720, 25, 100);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=25,...: actual=${actual}`);
      expect(actual).assertClose(592.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0053
     * @tc.name      NdkNotification_FreeSpaceOf_0053
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=-1, buttonRowHeightVp=100) returns 604
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0053 begin`);
      const actual: number = freeSpaceOf(720, -1, 100);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=-1,...: actual=${actual}`);
      expect(actual).assertEqual(604);
      logInfo(`${BUNDLE}FreeSpaceOf_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0054
     * @tc.name      NdkNotification_FreeSpaceOf_0054
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=100, buttonRowHeightVp=1) returns 80.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0054 begin`);
      const actual: number = freeSpaceOf(100, 100, 1);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=100...: actual=${actual}`);
      expect(actual).assertClose(80.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0055
     * @tc.name      NdkNotification_FreeSpaceOf_0055
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=3, buttonRowHeightVp=360) returns 250.66666666666663
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0055 begin`);
      const actual: number = freeSpaceOf(720, 3, 360);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=3, ...: actual=${actual}`);
      expect(actual).assertClose(250.66666666666663, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0056
     * @tc.name      NdkNotification_FreeSpaceOf_0056
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=25, buttonRowHeightVp=96) returns 236.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0056 begin`);
      const actual: number = freeSpaceOf(360, 25, 96);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=25,...: actual=${actual}`);
      expect(actual).assertClose(236.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0057
     * @tc.name      NdkNotification_FreeSpaceOf_0057
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=25, buttonRowHeightVp=1) returns 67.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0057 begin`);
      const actual: number = freeSpaceOf(96, 25, 1);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=25, ...: actual=${actual}`);
      expect(actual).assertClose(67.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0058
     * @tc.name      NdkNotification_FreeSpaceOf_0058
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=2, buttonRowHeightVp=0) returns 924
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0058 begin`);
      const actual: number = freeSpaceOf(1080, 2, 0);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=2,...: actual=${actual}`);
      expect(actual).assertEqual(924);
      logInfo(`${BUNDLE}FreeSpaceOf_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0059
     * @tc.name      NdkNotification_FreeSpaceOf_0059
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=25, buttonRowHeightVp=2) returns 1050.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0059 begin`);
      const actual: number = freeSpaceOf(1080, 25, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=25...: actual=${actual}`);
      expect(actual).assertClose(1050.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0060
     * @tc.name      NdkNotification_FreeSpaceOf_0060
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=-1, buttonRowHeightVp=3) returns 701
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0060 begin`);
      const actual: number = freeSpaceOf(720, -1, 3);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=-1,...: actual=${actual}`);
      expect(actual).assertEqual(701);
      logInfo(`${BUNDLE}FreeSpaceOf_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0061
     * @tc.name      NdkNotification_FreeSpaceOf_0061
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=25, buttonRowHeightVp=3) returns 69.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0061 begin`);
      const actual: number = freeSpaceOf(100, 25, 3);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=25,...: actual=${actual}`);
      expect(actual).assertClose(69.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0062
     * @tc.name      NdkNotification_FreeSpaceOf_0062
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=25, buttonRowHeightVp=0) returns 692.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0062 begin`);
      const actual: number = freeSpaceOf(720, 25, 0);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=25,...: actual=${actual}`);
      expect(actual).assertClose(692.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0063
     * @tc.name      NdkNotification_FreeSpaceOf_0063
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=-1, buttonRowHeightVp=-1) returns 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0063 begin`);
      const actual: number = freeSpaceOf(96, -1, -1);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(81);
      logInfo(`${BUNDLE}FreeSpaceOf_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0064
     * @tc.name      NdkNotification_FreeSpaceOf_0064
     * @tc.desc      freeSpaceOf(pageHeightVp=96, density=15, buttonRowHeightVp=1) returns 60.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0064 begin`);
      const actual: number = freeSpaceOf(96, 15, 1);
      logInfo(`freeSpaceOf(pageHeightVp=96, density=15, ...: actual=${actual}`);
      expect(actual).assertClose(60.33333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0065
     * @tc.name      NdkNotification_FreeSpaceOf_0065
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=10, buttonRowHeightVp=10) returns 306
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0065 begin`);
      const actual: number = freeSpaceOf(360, 10, 10);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=10,...: actual=${actual}`);
      expect(actual).assertEqual(306);
      logInfo(`${BUNDLE}FreeSpaceOf_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0066
     * @tc.name      NdkNotification_FreeSpaceOf_0066
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=25, buttonRowHeightVp=96) returns 596.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0066 begin`);
      const actual: number = freeSpaceOf(720, 25, 96);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=25,...: actual=${actual}`);
      expect(actual).assertClose(596.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0067
     * @tc.name      NdkNotification_FreeSpaceOf_0067
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=20, buttonRowHeightVp=1080) returns 810
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0067 begin`);
      const actual: number = freeSpaceOf(1920, 20, 1080);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=20...: actual=${actual}`);
      expect(actual).assertEqual(810);
      logInfo(`${BUNDLE}FreeSpaceOf_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0068
     * @tc.name      NdkNotification_FreeSpaceOf_0068
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=2, buttonRowHeightVp=1) returns 923
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0068 begin`);
      const actual: number = freeSpaceOf(1080, 2, 1);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=2,...: actual=${actual}`);
      expect(actual).assertEqual(923);
      logInfo(`${BUNDLE}FreeSpaceOf_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0069
     * @tc.name      NdkNotification_FreeSpaceOf_0069
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=15, buttonRowHeightVp=100) returns 225.33333333333331
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0069 begin`);
      const actual: number = freeSpaceOf(360, 15, 100);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=15,...: actual=${actual}`);
      expect(actual).assertClose(225.33333333333331, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0070
     * @tc.name      NdkNotification_FreeSpaceOf_0070
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=10, buttonRowHeightVp=100) returns 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0070 begin`);
      const actual: number = freeSpaceOf(360, 10, 100);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=10,...: actual=${actual}`);
      expect(actual).assertEqual(216);
      logInfo(`${BUNDLE}FreeSpaceOf_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0071
     * @tc.name      NdkNotification_FreeSpaceOf_0071
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=5, buttonRowHeightVp=-1) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0071 begin`);
      const actual: number = freeSpaceOf(100, 5, -1);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=5, ...: actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}FreeSpaceOf_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0072
     * @tc.name      NdkNotification_FreeSpaceOf_0072
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=3, buttonRowHeightVp=0) returns 1810.6666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0072 begin`);
      const actual: number = freeSpaceOf(1920, 3, 0);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=3,...: actual=${actual}`);
      expect(actual).assertClose(1810.6666666666667, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0073
     * @tc.name      NdkNotification_FreeSpaceOf_0073
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=2, buttonRowHeightVp=360) returns 564
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0073 begin`);
      const actual: number = freeSpaceOf(1080, 2, 360);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=2,...: actual=${actual}`);
      expect(actual).assertEqual(564);
      logInfo(`${BUNDLE}FreeSpaceOf_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0074
     * @tc.name      NdkNotification_FreeSpaceOf_0074
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=24.6, buttonRowHeightVp=0) returns 1052.6178861788617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0074 begin`);
      const actual: number = freeSpaceOf(1080, 24.6, 0);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=24...: actual=${actual}`);
      expect(actual).assertClose(1052.6178861788617, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0075
     * @tc.name      NdkNotification_FreeSpaceOf_0075
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=1, buttonRowHeightVp=1080) returns 544
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0075 begin`);
      const actual: number = freeSpaceOf(1920, 1, 1080);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=1,...: actual=${actual}`);
      expect(actual).assertEqual(544);
      logInfo(`${BUNDLE}FreeSpaceOf_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0076
     * @tc.name      NdkNotification_FreeSpaceOf_0076
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=25, buttonRowHeightVp=1) returns 71.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0076 begin`);
      const actual: number = freeSpaceOf(100, 25, 1);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=25,...: actual=${actual}`);
      expect(actual).assertClose(71.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0077
     * @tc.name      NdkNotification_FreeSpaceOf_0077
     * @tc.desc      freeSpaceOf(pageHeightVp=100, density=20, buttonRowHeightVp=10) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0077 begin`);
      const actual: number = freeSpaceOf(100, 20, 10);
      logInfo(`freeSpaceOf(pageHeightVp=100, density=20,...: actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}FreeSpaceOf_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0078
     * @tc.name      NdkNotification_FreeSpaceOf_0078
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=0, buttonRowHeightVp=720) returns 1184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0078 begin`);
      const actual: number = freeSpaceOf(1920, 0, 720);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=0,...: actual=${actual}`);
      expect(actual).assertEqual(1184);
      logInfo(`${BUNDLE}FreeSpaceOf_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0079
     * @tc.name      NdkNotification_FreeSpaceOf_0079
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=24.6, buttonRowHeightVp=720) returns 332.6178861788617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0079 begin`);
      const actual: number = freeSpaceOf(1080, 24.6, 720);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=24...: actual=${actual}`);
      expect(actual).assertClose(332.6178861788617, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0080
     * @tc.name      NdkNotification_FreeSpaceOf_0080
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=25, buttonRowHeightVp=2) returns 1890.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0080 begin`);
      const actual: number = freeSpaceOf(1920, 25, 2);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=25...: actual=${actual}`);
      expect(actual).assertClose(1890.8, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0081
     * @tc.name      NdkNotification_FreeSpaceOf_0081
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=2, buttonRowHeightVp=2) returns 562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0081 begin`);
      const actual: number = freeSpaceOf(720, 2, 2);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=2, ...: actual=${actual}`);
      expect(actual).assertEqual(562);
      logInfo(`${BUNDLE}FreeSpaceOf_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0082
     * @tc.name      NdkNotification_FreeSpaceOf_0082
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=24.6, buttonRowHeightVp=0) returns 332.6178861788618
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0082 begin`);
      const actual: number = freeSpaceOf(360, 24.6, 0);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=24....: actual=${actual}`);
      expect(actual).assertClose(332.6178861788618, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0083
     * @tc.name      NdkNotification_FreeSpaceOf_0083
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=20, buttonRowHeightVp=3) returns 327
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0083 begin`);
      const actual: number = freeSpaceOf(360, 20, 3);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=20,...: actual=${actual}`);
      expect(actual).assertEqual(327);
      logInfo(`${BUNDLE}FreeSpaceOf_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0084
     * @tc.name      NdkNotification_FreeSpaceOf_0084
     * @tc.desc      freeSpaceOf(pageHeightVp=720, density=20, buttonRowHeightVp=0) returns 690
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0084 begin`);
      const actual: number = freeSpaceOf(720, 20, 0);
      logInfo(`freeSpaceOf(pageHeightVp=720, density=20,...: actual=${actual}`);
      expect(actual).assertEqual(690);
      logInfo(`${BUNDLE}FreeSpaceOf_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0085
     * @tc.name      NdkNotification_FreeSpaceOf_0085
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=3, buttonRowHeightVp=100) returns 150.66666666666669
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0085 begin`);
      const actual: number = freeSpaceOf(360, 3, 100);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=3, ...: actual=${actual}`);
      expect(actual).assertClose(150.66666666666669, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0086
     * @tc.name      NdkNotification_FreeSpaceOf_0086
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=-1, buttonRowHeightVp=1) returns 343
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0086 begin`);
      const actual: number = freeSpaceOf(360, -1, 1);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=-1,...: actual=${actual}`);
      expect(actual).assertEqual(343);
      logInfo(`${BUNDLE}FreeSpaceOf_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0087
     * @tc.name      NdkNotification_FreeSpaceOf_0087
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=20, buttonRowHeightVp=-1) returns 331
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0087 begin`);
      const actual: number = freeSpaceOf(360, 20, -1);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=20,...: actual=${actual}`);
      expect(actual).assertEqual(331);
      logInfo(`${BUNDLE}FreeSpaceOf_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0088
     * @tc.name      NdkNotification_FreeSpaceOf_0088
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=24.6, buttonRowHeightVp=3) returns 1049.6178861788617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0088 begin`);
      const actual: number = freeSpaceOf(1080, 24.6, 3);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=24...: actual=${actual}`);
      expect(actual).assertClose(1049.6178861788617, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0089
     * @tc.name      NdkNotification_FreeSpaceOf_0089
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=10, buttonRowHeightVp=0) returns 1036
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0089 begin`);
      const actual: number = freeSpaceOf(1080, 10, 0);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=10...: actual=${actual}`);
      expect(actual).assertEqual(1036);
      logInfo(`${BUNDLE}FreeSpaceOf_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0090
     * @tc.name      NdkNotification_FreeSpaceOf_0090
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=5, buttonRowHeightVp=1) returns 1007
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0090 begin`);
      const actual: number = freeSpaceOf(1080, 5, 1);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=5,...: actual=${actual}`);
      expect(actual).assertEqual(1007);
      logInfo(`${BUNDLE}FreeSpaceOf_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0091
     * @tc.name      NdkNotification_FreeSpaceOf_0091
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=100, buttonRowHeightVp=720) returns 1181.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0091 begin`);
      const actual: number = freeSpaceOf(1920, 100, 720);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=10...: actual=${actual}`);
      expect(actual).assertClose(1181.2, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0092
     * @tc.name      NdkNotification_FreeSpaceOf_0092
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=10, buttonRowHeightVp=3) returns 313
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0092 begin`);
      const actual: number = freeSpaceOf(360, 10, 3);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=10,...: actual=${actual}`);
      expect(actual).assertEqual(313);
      logInfo(`${BUNDLE}FreeSpaceOf_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0093
     * @tc.name      NdkNotification_FreeSpaceOf_0093
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=24.6, buttonRowHeightVp=2) returns 330.6178861788618
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0093 begin`);
      const actual: number = freeSpaceOf(360, 24.6, 2);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=24....: actual=${actual}`);
      expect(actual).assertClose(330.6178861788618, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0094
     * @tc.name      NdkNotification_FreeSpaceOf_0094
     * @tc.desc      freeSpaceOf(pageHeightVp=360, density=15, buttonRowHeightVp=3) returns 322.3333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0094 begin`);
      const actual: number = freeSpaceOf(360, 15, 3);
      logInfo(`freeSpaceOf(pageHeightVp=360, density=15,...: actual=${actual}`);
      expect(actual).assertClose(322.3333333333333, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0095
     * @tc.name      NdkNotification_FreeSpaceOf_0095
     * @tc.desc      freeSpaceOf(pageHeightVp=1920, density=5, buttonRowHeightVp=-1) returns 1849
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_FreeSpaceOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0095 begin`);
      const actual: number = freeSpaceOf(1920, 5, -1);
      logInfo(`freeSpaceOf(pageHeightVp=1920, density=5,...: actual=${actual}`);
      expect(actual).assertEqual(1849);
      logInfo(`${BUNDLE}FreeSpaceOf_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_FREE_SPACE_OF_0096
     * @tc.name      NdkNotification_FreeSpaceOf_0096
     * @tc.desc      freeSpaceOf(pageHeightVp=1080, density=24.6, buttonRowHeightVp=100) returns 952.6178861788617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_FreeSpaceOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FreeSpaceOf_0096 begin`);
      const actual: number = freeSpaceOf(1080, 24.6, 100);
      logInfo(`freeSpaceOf(pageHeightVp=1080, density=24...: actual=${actual}`);
      expect(actual).assertClose(952.6178861788617, PRECISION);
      logInfo(`${BUNDLE}FreeSpaceOf_0096 end`);
    });
  });
}
