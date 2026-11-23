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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { nextCountOf } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for nextCountOf (60 cases). */
export default function nextCountOfTest(): void {
  describe('NextCountOfTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0001
     * @tc.name      TabContentTouchHotZone_NextCountOf_0001
     * @tc.desc      nextCountOf(count=0, isActive=true) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_NextCountOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0001 begin`);
      const actual: number = nextCountOf(0, true);
      logInfo(`nextCountOf(count=0, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextCountOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0002
     * @tc.name      TabContentTouchHotZone_NextCountOf_0002
     * @tc.desc      nextCountOf(count=0, isActive=false) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_NextCountOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0002 begin`);
      const actual: number = nextCountOf(0, false);
      logInfo(`nextCountOf(count=0, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextCountOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0003
     * @tc.name      TabContentTouchHotZone_NextCountOf_0003
     * @tc.desc      nextCountOf(count=1, isActive=true) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0003 begin`);
      const actual: number = nextCountOf(1, true);
      logInfo(`nextCountOf(count=1, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextCountOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0004
     * @tc.name      TabContentTouchHotZone_NextCountOf_0004
     * @tc.desc      nextCountOf(count=1, isActive=false) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0004 begin`);
      const actual: number = nextCountOf(1, false);
      logInfo(`nextCountOf(count=1, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextCountOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0005
     * @tc.name      TabContentTouchHotZone_NextCountOf_0005
     * @tc.desc      nextCountOf(count=2, isActive=false) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_NextCountOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0005 begin`);
      const actual: number = nextCountOf(2, false);
      logInfo(`nextCountOf(count=2, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextCountOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0006
     * @tc.name      TabContentTouchHotZone_NextCountOf_0006
     * @tc.desc      nextCountOf(count=5, isActive=true) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0006 begin`);
      const actual: number = nextCountOf(5, true);
      logInfo(`nextCountOf(count=5, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}NextCountOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0007
     * @tc.name      TabContentTouchHotZone_NextCountOf_0007
     * @tc.desc      nextCountOf(count=5, isActive=false) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0007 begin`);
      const actual: number = nextCountOf(5, false);
      logInfo(`nextCountOf(count=5, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}NextCountOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0008
     * @tc.name      TabContentTouchHotZone_NextCountOf_0008
     * @tc.desc      nextCountOf(count=10, isActive=true) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0008 begin`);
      const actual: number = nextCountOf(10, true);
      logInfo(`nextCountOf(count=10, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}NextCountOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0009
     * @tc.name      TabContentTouchHotZone_NextCountOf_0009
     * @tc.desc      nextCountOf(count=10, isActive=false) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0009 begin`);
      const actual: number = nextCountOf(10, false);
      logInfo(`nextCountOf(count=10, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}NextCountOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0010
     * @tc.name      TabContentTouchHotZone_NextCountOf_0010
     * @tc.desc      nextCountOf(count=100, isActive=true) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0010 begin`);
      const actual: number = nextCountOf(100, true);
      logInfo(`nextCountOf(count=100, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}NextCountOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0011
     * @tc.name      TabContentTouchHotZone_NextCountOf_0011
     * @tc.desc      nextCountOf(count=100, isActive=false) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0011 begin`);
      const actual: number = nextCountOf(100, false);
      logInfo(`nextCountOf(count=100, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}NextCountOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0012
     * @tc.name      TabContentTouchHotZone_NextCountOf_0012
     * @tc.desc      nextCountOf(count=-1, isActive=true) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_NextCountOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0012 begin`);
      const actual: number = nextCountOf(-1, true);
      logInfo(`nextCountOf(count=-1, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextCountOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0013
     * @tc.name      TabContentTouchHotZone_NextCountOf_0013
     * @tc.desc      nextCountOf(count=15, isActive=true) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0013 begin`);
      const actual: number = nextCountOf(15, true);
      logInfo(`nextCountOf(count=15, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}NextCountOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0014
     * @tc.name      TabContentTouchHotZone_NextCountOf_0014
     * @tc.desc      nextCountOf(count=15, isActive=false) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0014 begin`);
      const actual: number = nextCountOf(15, false);
      logInfo(`nextCountOf(count=15, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}NextCountOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0015
     * @tc.name      TabContentTouchHotZone_NextCountOf_0015
     * @tc.desc      nextCountOf(count=20, isActive=true) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0015 begin`);
      const actual: number = nextCountOf(20, true);
      logInfo(`nextCountOf(count=20, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}NextCountOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0016
     * @tc.name      TabContentTouchHotZone_NextCountOf_0016
     * @tc.desc      nextCountOf(count=20, isActive=false) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0016 begin`);
      const actual: number = nextCountOf(20, false);
      logInfo(`nextCountOf(count=20, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}NextCountOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0017
     * @tc.name      TabContentTouchHotZone_NextCountOf_0017
     * @tc.desc      nextCountOf(count=25, isActive=true) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0017 begin`);
      const actual: number = nextCountOf(25, true);
      logInfo(`nextCountOf(count=25, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}NextCountOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0018
     * @tc.name      TabContentTouchHotZone_NextCountOf_0018
     * @tc.desc      nextCountOf(count=25, isActive=false) returns 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0018 begin`);
      const actual: number = nextCountOf(25, false);
      logInfo(`nextCountOf(count=25, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(26);
      logInfo(`${BUNDLE}NextCountOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0019
     * @tc.name      TabContentTouchHotZone_NextCountOf_0019
     * @tc.desc      nextCountOf(count=30, isActive=true) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0019 begin`);
      const actual: number = nextCountOf(30, true);
      logInfo(`nextCountOf(count=30, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}NextCountOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0020
     * @tc.name      TabContentTouchHotZone_NextCountOf_0020
     * @tc.desc      nextCountOf(count=30, isActive=false) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0020 begin`);
      const actual: number = nextCountOf(30, false);
      logInfo(`nextCountOf(count=30, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}NextCountOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0021
     * @tc.name      TabContentTouchHotZone_NextCountOf_0021
     * @tc.desc      nextCountOf(count=35, isActive=true) returns 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0021 begin`);
      const actual: number = nextCountOf(35, true);
      logInfo(`nextCountOf(count=35, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(34);
      logInfo(`${BUNDLE}NextCountOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0022
     * @tc.name      TabContentTouchHotZone_NextCountOf_0022
     * @tc.desc      nextCountOf(count=35, isActive=false) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0022 begin`);
      const actual: number = nextCountOf(35, false);
      logInfo(`nextCountOf(count=35, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}NextCountOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0023
     * @tc.name      TabContentTouchHotZone_NextCountOf_0023
     * @tc.desc      nextCountOf(count=40, isActive=true) returns 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0023 begin`);
      const actual: number = nextCountOf(40, true);
      logInfo(`nextCountOf(count=40, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(39);
      logInfo(`${BUNDLE}NextCountOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0024
     * @tc.name      TabContentTouchHotZone_NextCountOf_0024
     * @tc.desc      nextCountOf(count=40, isActive=false) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0024 begin`);
      const actual: number = nextCountOf(40, false);
      logInfo(`nextCountOf(count=40, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}NextCountOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0025
     * @tc.name      TabContentTouchHotZone_NextCountOf_0025
     * @tc.desc      nextCountOf(count=45, isActive=true) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0025 begin`);
      const actual: number = nextCountOf(45, true);
      logInfo(`nextCountOf(count=45, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}NextCountOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0026
     * @tc.name      TabContentTouchHotZone_NextCountOf_0026
     * @tc.desc      nextCountOf(count=45, isActive=false) returns 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0026 begin`);
      const actual: number = nextCountOf(45, false);
      logInfo(`nextCountOf(count=45, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(46);
      logInfo(`${BUNDLE}NextCountOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0027
     * @tc.name      TabContentTouchHotZone_NextCountOf_0027
     * @tc.desc      nextCountOf(count=50, isActive=true) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0027 begin`);
      const actual: number = nextCountOf(50, true);
      logInfo(`nextCountOf(count=50, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}NextCountOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0028
     * @tc.name      TabContentTouchHotZone_NextCountOf_0028
     * @tc.desc      nextCountOf(count=50, isActive=false) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0028 begin`);
      const actual: number = nextCountOf(50, false);
      logInfo(`nextCountOf(count=50, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}NextCountOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0029
     * @tc.name      TabContentTouchHotZone_NextCountOf_0029
     * @tc.desc      nextCountOf(count=55, isActive=true) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0029 begin`);
      const actual: number = nextCountOf(55, true);
      logInfo(`nextCountOf(count=55, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}NextCountOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0030
     * @tc.name      TabContentTouchHotZone_NextCountOf_0030
     * @tc.desc      nextCountOf(count=55, isActive=false) returns 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0030 begin`);
      const actual: number = nextCountOf(55, false);
      logInfo(`nextCountOf(count=55, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}NextCountOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0031
     * @tc.name      TabContentTouchHotZone_NextCountOf_0031
     * @tc.desc      nextCountOf(count=60, isActive=true) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0031 begin`);
      const actual: number = nextCountOf(60, true);
      logInfo(`nextCountOf(count=60, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}NextCountOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0032
     * @tc.name      TabContentTouchHotZone_NextCountOf_0032
     * @tc.desc      nextCountOf(count=60, isActive=false) returns 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0032 begin`);
      const actual: number = nextCountOf(60, false);
      logInfo(`nextCountOf(count=60, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(61);
      logInfo(`${BUNDLE}NextCountOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0033
     * @tc.name      TabContentTouchHotZone_NextCountOf_0033
     * @tc.desc      nextCountOf(count=65, isActive=true) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0033 begin`);
      const actual: number = nextCountOf(65, true);
      logInfo(`nextCountOf(count=65, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}NextCountOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0034
     * @tc.name      TabContentTouchHotZone_NextCountOf_0034
     * @tc.desc      nextCountOf(count=65, isActive=false) returns 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0034 begin`);
      const actual: number = nextCountOf(65, false);
      logInfo(`nextCountOf(count=65, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(66);
      logInfo(`${BUNDLE}NextCountOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0035
     * @tc.name      TabContentTouchHotZone_NextCountOf_0035
     * @tc.desc      nextCountOf(count=70, isActive=true) returns 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0035 begin`);
      const actual: number = nextCountOf(70, true);
      logInfo(`nextCountOf(count=70, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(69);
      logInfo(`${BUNDLE}NextCountOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0036
     * @tc.name      TabContentTouchHotZone_NextCountOf_0036
     * @tc.desc      nextCountOf(count=70, isActive=false) returns 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0036 begin`);
      const actual: number = nextCountOf(70, false);
      logInfo(`nextCountOf(count=70, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(71);
      logInfo(`${BUNDLE}NextCountOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0037
     * @tc.name      TabContentTouchHotZone_NextCountOf_0037
     * @tc.desc      nextCountOf(count=75, isActive=true) returns 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0037 begin`);
      const actual: number = nextCountOf(75, true);
      logInfo(`nextCountOf(count=75, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(74);
      logInfo(`${BUNDLE}NextCountOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0038
     * @tc.name      TabContentTouchHotZone_NextCountOf_0038
     * @tc.desc      nextCountOf(count=75, isActive=false) returns 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0038 begin`);
      const actual: number = nextCountOf(75, false);
      logInfo(`nextCountOf(count=75, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(76);
      logInfo(`${BUNDLE}NextCountOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0039
     * @tc.name      TabContentTouchHotZone_NextCountOf_0039
     * @tc.desc      nextCountOf(count=80, isActive=true) returns 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0039 begin`);
      const actual: number = nextCountOf(80, true);
      logInfo(`nextCountOf(count=80, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(79);
      logInfo(`${BUNDLE}NextCountOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0040
     * @tc.name      TabContentTouchHotZone_NextCountOf_0040
     * @tc.desc      nextCountOf(count=80, isActive=false) returns 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0040 begin`);
      const actual: number = nextCountOf(80, false);
      logInfo(`nextCountOf(count=80, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(81);
      logInfo(`${BUNDLE}NextCountOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0041
     * @tc.name      TabContentTouchHotZone_NextCountOf_0041
     * @tc.desc      nextCountOf(count=85, isActive=true) returns 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0041 begin`);
      const actual: number = nextCountOf(85, true);
      logInfo(`nextCountOf(count=85, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}NextCountOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0042
     * @tc.name      TabContentTouchHotZone_NextCountOf_0042
     * @tc.desc      nextCountOf(count=85, isActive=false) returns 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0042 begin`);
      const actual: number = nextCountOf(85, false);
      logInfo(`nextCountOf(count=85, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(86);
      logInfo(`${BUNDLE}NextCountOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0043
     * @tc.name      TabContentTouchHotZone_NextCountOf_0043
     * @tc.desc      nextCountOf(count=90, isActive=true) returns 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0043 begin`);
      const actual: number = nextCountOf(90, true);
      logInfo(`nextCountOf(count=90, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(89);
      logInfo(`${BUNDLE}NextCountOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0044
     * @tc.name      TabContentTouchHotZone_NextCountOf_0044
     * @tc.desc      nextCountOf(count=90, isActive=false) returns 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0044 begin`);
      const actual: number = nextCountOf(90, false);
      logInfo(`nextCountOf(count=90, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(91);
      logInfo(`${BUNDLE}NextCountOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0045
     * @tc.name      TabContentTouchHotZone_NextCountOf_0045
     * @tc.desc      nextCountOf(count=95, isActive=true) returns 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0045 begin`);
      const actual: number = nextCountOf(95, true);
      logInfo(`nextCountOf(count=95, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(94);
      logInfo(`${BUNDLE}NextCountOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0046
     * @tc.name      TabContentTouchHotZone_NextCountOf_0046
     * @tc.desc      nextCountOf(count=95, isActive=false) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0046 begin`);
      const actual: number = nextCountOf(95, false);
      logInfo(`nextCountOf(count=95, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}NextCountOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0047
     * @tc.name      TabContentTouchHotZone_NextCountOf_0047
     * @tc.desc      nextCountOf(count=105, isActive=true) returns 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0047 begin`);
      const actual: number = nextCountOf(105, true);
      logInfo(`nextCountOf(count=105, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(104);
      logInfo(`${BUNDLE}NextCountOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0048
     * @tc.name      TabContentTouchHotZone_NextCountOf_0048
     * @tc.desc      nextCountOf(count=105, isActive=false) returns 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0048 begin`);
      const actual: number = nextCountOf(105, false);
      logInfo(`nextCountOf(count=105, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(106);
      logInfo(`${BUNDLE}NextCountOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0049
     * @tc.name      TabContentTouchHotZone_NextCountOf_0049
     * @tc.desc      nextCountOf(count=110, isActive=true) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0049 begin`);
      const actual: number = nextCountOf(110, true);
      logInfo(`nextCountOf(count=110, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}NextCountOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0050
     * @tc.name      TabContentTouchHotZone_NextCountOf_0050
     * @tc.desc      nextCountOf(count=110, isActive=false) returns 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0050 begin`);
      const actual: number = nextCountOf(110, false);
      logInfo(`nextCountOf(count=110, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(111);
      logInfo(`${BUNDLE}NextCountOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0051
     * @tc.name      TabContentTouchHotZone_NextCountOf_0051
     * @tc.desc      nextCountOf(count=194, isActive=true) returns 193
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0051 begin`);
      const actual: number = nextCountOf(194, true);
      logInfo(`nextCountOf(count=194, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(193);
      logInfo(`${BUNDLE}NextCountOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0052
     * @tc.name      TabContentTouchHotZone_NextCountOf_0052
     * @tc.desc      nextCountOf(count=194, isActive=false) returns 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0052 begin`);
      const actual: number = nextCountOf(194, false);
      logInfo(`nextCountOf(count=194, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(195);
      logInfo(`${BUNDLE}NextCountOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0053
     * @tc.name      TabContentTouchHotZone_NextCountOf_0053
     * @tc.desc      nextCountOf(count=98.64, isActive=true) returns 97.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0053 begin`);
      const actual: number = nextCountOf(98.64, true);
      logInfo(`nextCountOf(count=98.64, isActive=true): actual=${actual}`);
      expect(actual).assertClose(97.64, PRECISION);
      logInfo(`${BUNDLE}NextCountOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0054
     * @tc.name      TabContentTouchHotZone_NextCountOf_0054
     * @tc.desc      nextCountOf(count=98.64, isActive=false) returns 99.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0054 begin`);
      const actual: number = nextCountOf(98.64, false);
      logInfo(`nextCountOf(count=98.64, isActive=false): actual=${actual}`);
      expect(actual).assertClose(99.64, PRECISION);
      logInfo(`${BUNDLE}NextCountOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0055
     * @tc.name      TabContentTouchHotZone_NextCountOf_0055
     * @tc.desc      nextCountOf(count=-23, isActive=true) returns -24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_NextCountOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0055 begin`);
      const actual: number = nextCountOf(-23, true);
      logInfo(`nextCountOf(count=-23, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(-24);
      logInfo(`${BUNDLE}NextCountOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0056
     * @tc.name      TabContentTouchHotZone_NextCountOf_0056
     * @tc.desc      nextCountOf(count=-23, isActive=false) returns -22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_NextCountOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0056 begin`);
      const actual: number = nextCountOf(-23, false);
      logInfo(`nextCountOf(count=-23, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(-22);
      logInfo(`${BUNDLE}NextCountOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0057
     * @tc.name      TabContentTouchHotZone_NextCountOf_0057
     * @tc.desc      nextCountOf(count=2, isActive=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_NextCountOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0057 begin`);
      const actual: number = nextCountOf(2, true);
      logInfo(`nextCountOf(count=2, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextCountOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0058
     * @tc.name      TabContentTouchHotZone_NextCountOf_0058
     * @tc.desc      nextCountOf(count=-1, isActive=false) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_NextCountOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0058 begin`);
      const actual: number = nextCountOf(-1, false);
      logInfo(`nextCountOf(count=-1, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextCountOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0059
     * @tc.name      TabContentTouchHotZone_NextCountOf_0059
     * @tc.desc      nextCountOf(count=3, isActive=true) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0059 begin`);
      const actual: number = nextCountOf(3, true);
      logInfo(`nextCountOf(count=3, isActive=true): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextCountOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_NEXT_COUNT_OF_0060
     * @tc.name      TabContentTouchHotZone_NextCountOf_0060
     * @tc.desc      nextCountOf(count=3, isActive=false) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_NextCountOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextCountOf_0060 begin`);
      const actual: number = nextCountOf(3, false);
      logInfo(`nextCountOf(count=3, isActive=false): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}NextCountOf_0060 end`);
    });
  });
}
