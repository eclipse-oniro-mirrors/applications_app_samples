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
import { nextEndOf } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for nextEndOf (96 cases). */
export default function nextEndOfTest(): void {
  describe('NextEndOfTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0001
     * @tc.name      WindowManage_NextEndOf_0001
     * @tc.desc      nextEndOf(end=0, current=0, previous=0, density=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_NextEndOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0001 begin`);
      const actual: number = nextEndOf(0, 0, 0, 0);
      logInfo(`nextEndOf(end=0, current=0, previous=0, d...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextEndOf_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0002
     * @tc.name      WindowManage_NextEndOf_0002
     * @tc.desc      nextEndOf(end=1, current=0, previous=0, density=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_NextEndOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0002 begin`);
      const actual: number = nextEndOf(1, 0, 0, 0);
      logInfo(`nextEndOf(end=1, current=0, previous=0, d...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextEndOf_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0003
     * @tc.name      WindowManage_NextEndOf_0003
     * @tc.desc      nextEndOf(end=-1, current=0, previous=0, density=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0003 begin`);
      const actual: number = nextEndOf(-1, 0, 0, 0);
      logInfo(`nextEndOf(end=-1, current=0, previous=0, ...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextEndOf_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0004
     * @tc.name      WindowManage_NextEndOf_0004
     * @tc.desc      nextEndOf(end=2, current=0, previous=0, density=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0004 begin`);
      const actual: number = nextEndOf(2, 0, 0, 0);
      logInfo(`nextEndOf(end=2, current=0, previous=0, d...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextEndOf_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0005
     * @tc.name      WindowManage_NextEndOf_0005
     * @tc.desc      nextEndOf(end=3, current=0, previous=0, density=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0005 begin`);
      const actual: number = nextEndOf(3, 0, 0, 0);
      logInfo(`nextEndOf(end=3, current=0, previous=0, d...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextEndOf_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0006
     * @tc.name      WindowManage_NextEndOf_0006
     * @tc.desc      nextEndOf(end=10, current=0, previous=0, density=0) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0006 begin`);
      const actual: number = nextEndOf(10, 0, 0, 0);
      logInfo(`nextEndOf(end=10, current=0, previous=0, ...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextEndOf_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0007
     * @tc.name      WindowManage_NextEndOf_0007
     * @tc.desc      nextEndOf(end=100, current=0, previous=0, density=0) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0007 begin`);
      const actual: number = nextEndOf(100, 0, 0, 0);
      logInfo(`nextEndOf(end=100, current=0, previous=0,...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextEndOf_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0008
     * @tc.name      WindowManage_NextEndOf_0008
     * @tc.desc      nextEndOf(end=5, current=0, previous=0, density=0) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0008 begin`);
      const actual: number = nextEndOf(5, 0, 0, 0);
      logInfo(`nextEndOf(end=5, current=0, previous=0, d...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextEndOf_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0009
     * @tc.name      WindowManage_NextEndOf_0009
     * @tc.desc      nextEndOf(end=100, current=61000, previous=2, density=-1) returns -60898
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0009 begin`);
      const actual: number = nextEndOf(100, 61000, 2, -1);
      logInfo(`nextEndOf(end=100, current=61000, previou...: actual=${actual}`);
      expect(actual).assertEqual(-60898);
      logInfo(`${BUNDLE}NextEndOf_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0010
     * @tc.name      WindowManage_NextEndOf_0010
     * @tc.desc      nextEndOf(end=2, current=1000, previous=2, density=1) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0010 begin`);
      const actual: number = nextEndOf(2, 1000, 2, 1);
      logInfo(`nextEndOf(end=2, current=1000, previous=2...: actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}NextEndOf_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0011
     * @tc.name      WindowManage_NextEndOf_0011
     * @tc.desc      nextEndOf(end=0, current=61000, previous=2, density=1) returns 60998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0011 begin`);
      const actual: number = nextEndOf(0, 61000, 2, 1);
      logInfo(`nextEndOf(end=0, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(60998);
      logInfo(`${BUNDLE}NextEndOf_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0012
     * @tc.name      WindowManage_NextEndOf_0012
     * @tc.desc      nextEndOf(end=1, current=60000, previous=-1, density=5) returns 300006
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0012 begin`);
      const actual: number = nextEndOf(1, 60000, -1, 5);
      logInfo(`nextEndOf(end=1, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(300006);
      logInfo(`${BUNDLE}NextEndOf_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0013
     * @tc.name      WindowManage_NextEndOf_0013
     * @tc.desc      nextEndOf(end=10, current=500, previous=3, density=10) returns 4980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0013 begin`);
      const actual: number = nextEndOf(10, 500, 3, 10);
      logInfo(`nextEndOf(end=10, current=500, previous=3...: actual=${actual}`);
      expect(actual).assertEqual(4980);
      logInfo(`${BUNDLE}NextEndOf_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0014
     * @tc.name      WindowManage_NextEndOf_0014
     * @tc.desc      nextEndOf(end=-1, current=500, previous=2, density=10) returns 4979
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0014 begin`);
      const actual: number = nextEndOf(-1, 500, 2, 10);
      logInfo(`nextEndOf(end=-1, current=500, previous=2...: actual=${actual}`);
      expect(actual).assertEqual(4979);
      logInfo(`${BUNDLE}NextEndOf_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0015
     * @tc.name      WindowManage_NextEndOf_0015
     * @tc.desc      nextEndOf(end=100, current=61000, previous=2, density=3) returns 183094
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0015 begin`);
      const actual: number = nextEndOf(100, 61000, 2, 3);
      logInfo(`nextEndOf(end=100, current=61000, previou...: actual=${actual}`);
      expect(actual).assertEqual(183094);
      logInfo(`${BUNDLE}NextEndOf_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0016
     * @tc.name      WindowManage_NextEndOf_0016
     * @tc.desc      nextEndOf(end=3, current=0, previous=10, density=100) returns -997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0016 begin`);
      const actual: number = nextEndOf(3, 0, 10, 100);
      logInfo(`nextEndOf(end=3, current=0, previous=10, ...: actual=${actual}`);
      expect(actual).assertEqual(-997);
      logInfo(`${BUNDLE}NextEndOf_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0017
     * @tc.name      WindowManage_NextEndOf_0017
     * @tc.desc      nextEndOf(end=0, current=1000, previous=100, density=2) returns 1800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0017 begin`);
      const actual: number = nextEndOf(0, 1000, 100, 2);
      logInfo(`nextEndOf(end=0, current=1000, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(1800);
      logInfo(`${BUNDLE}NextEndOf_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0018
     * @tc.name      WindowManage_NextEndOf_0018
     * @tc.desc      nextEndOf(end=10, current=59999, previous=5, density=1) returns 60004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0018 begin`);
      const actual: number = nextEndOf(10, 59999, 5, 1);
      logInfo(`nextEndOf(end=10, current=59999, previous...: actual=${actual}`);
      expect(actual).assertEqual(60004);
      logInfo(`${BUNDLE}NextEndOf_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0019
     * @tc.name      WindowManage_NextEndOf_0019
     * @tc.desc      nextEndOf(end=100, current=1000, previous=10, density=5) returns 5050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0019 begin`);
      const actual: number = nextEndOf(100, 1000, 10, 5);
      logInfo(`nextEndOf(end=100, current=1000, previous...: actual=${actual}`);
      expect(actual).assertEqual(5050);
      logInfo(`${BUNDLE}NextEndOf_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0020
     * @tc.name      WindowManage_NextEndOf_0020
     * @tc.desc      nextEndOf(end=100, current=500, previous=2, density=2) returns 1096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0020 begin`);
      const actual: number = nextEndOf(100, 500, 2, 2);
      logInfo(`nextEndOf(end=100, current=500, previous=...: actual=${actual}`);
      expect(actual).assertEqual(1096);
      logInfo(`${BUNDLE}NextEndOf_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0021
     * @tc.name      WindowManage_NextEndOf_0021
     * @tc.desc      nextEndOf(end=1, current=999, previous=-1, density=2) returns 2001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0021 begin`);
      const actual: number = nextEndOf(1, 999, -1, 2);
      logInfo(`nextEndOf(end=1, current=999, previous=-1...: actual=${actual}`);
      expect(actual).assertEqual(2001);
      logInfo(`${BUNDLE}NextEndOf_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0022
     * @tc.name      WindowManage_NextEndOf_0022
     * @tc.desc      nextEndOf(end=0, current=999, previous=100, density=1) returns 899
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0022 begin`);
      const actual: number = nextEndOf(0, 999, 100, 1);
      logInfo(`nextEndOf(end=0, current=999, previous=10...: actual=${actual}`);
      expect(actual).assertEqual(899);
      logInfo(`${BUNDLE}NextEndOf_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0023
     * @tc.name      WindowManage_NextEndOf_0023
     * @tc.desc      nextEndOf(end=5, current=3599000, previous=5, density=1) returns 3599000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0023 begin`);
      const actual: number = nextEndOf(5, 3599000, 5, 1);
      logInfo(`nextEndOf(end=5, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(3599000);
      logInfo(`${BUNDLE}NextEndOf_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0024
     * @tc.name      WindowManage_NextEndOf_0024
     * @tc.desc      nextEndOf(end=5, current=60000, previous=10, density=10) returns 599905
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0024 begin`);
      const actual: number = nextEndOf(5, 60000, 10, 10);
      logInfo(`nextEndOf(end=5, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(599905);
      logInfo(`${BUNDLE}NextEndOf_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0025
     * @tc.name      WindowManage_NextEndOf_0025
     * @tc.desc      nextEndOf(end=0, current=60000, previous=0, density=2) returns 120000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0025 begin`);
      const actual: number = nextEndOf(0, 60000, 0, 2);
      logInfo(`nextEndOf(end=0, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(120000);
      logInfo(`${BUNDLE}NextEndOf_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0026
     * @tc.name      WindowManage_NextEndOf_0026
     * @tc.desc      nextEndOf(end=5, current=61000, previous=0, density=3) returns 183005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0026 begin`);
      const actual: number = nextEndOf(5, 61000, 0, 3);
      logInfo(`nextEndOf(end=5, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(183005);
      logInfo(`${BUNDLE}NextEndOf_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0027
     * @tc.name      WindowManage_NextEndOf_0027
     * @tc.desc      nextEndOf(end=-1, current=1000, previous=1, density=2) returns 1997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0027 begin`);
      const actual: number = nextEndOf(-1, 1000, 1, 2);
      logInfo(`nextEndOf(end=-1, current=1000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(1997);
      logInfo(`${BUNDLE}NextEndOf_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0028
     * @tc.name      WindowManage_NextEndOf_0028
     * @tc.desc      nextEndOf(end=10, current=60000, previous=-1, density=2) returns 120012
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0028 begin`);
      const actual: number = nextEndOf(10, 60000, -1, 2);
      logInfo(`nextEndOf(end=10, current=60000, previous...: actual=${actual}`);
      expect(actual).assertEqual(120012);
      logInfo(`${BUNDLE}NextEndOf_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0029
     * @tc.name      WindowManage_NextEndOf_0029
     * @tc.desc      nextEndOf(end=5, current=999, previous=100, density=1) returns 904
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0029 begin`);
      const actual: number = nextEndOf(5, 999, 100, 1);
      logInfo(`nextEndOf(end=5, current=999, previous=10...: actual=${actual}`);
      expect(actual).assertEqual(904);
      logInfo(`${BUNDLE}NextEndOf_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0030
     * @tc.name      WindowManage_NextEndOf_0030
     * @tc.desc      nextEndOf(end=3, current=61000, previous=10, density=1) returns 60993
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0030 begin`);
      const actual: number = nextEndOf(3, 61000, 10, 1);
      logInfo(`nextEndOf(end=3, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(60993);
      logInfo(`${BUNDLE}NextEndOf_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0031
     * @tc.name      WindowManage_NextEndOf_0031
     * @tc.desc      nextEndOf(end=2, current=500, previous=5, density=10) returns 4952
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0031 begin`);
      const actual: number = nextEndOf(2, 500, 5, 10);
      logInfo(`nextEndOf(end=2, current=500, previous=5,...: actual=${actual}`);
      expect(actual).assertEqual(4952);
      logInfo(`${BUNDLE}NextEndOf_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0032
     * @tc.name      WindowManage_NextEndOf_0032
     * @tc.desc      nextEndOf(end=3, current=61000, previous=10, density=-1) returns -60987
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0032 begin`);
      const actual: number = nextEndOf(3, 61000, 10, -1);
      logInfo(`nextEndOf(end=3, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(-60987);
      logInfo(`${BUNDLE}NextEndOf_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0033
     * @tc.name      WindowManage_NextEndOf_0033
     * @tc.desc      nextEndOf(end=1, current=0, previous=3, density=3) returns -8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0033 begin`);
      const actual: number = nextEndOf(1, 0, 3, 3);
      logInfo(`nextEndOf(end=1, current=0, previous=3, d...: actual=${actual}`);
      expect(actual).assertEqual(-8);
      logInfo(`${BUNDLE}NextEndOf_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0034
     * @tc.name      WindowManage_NextEndOf_0034
     * @tc.desc      nextEndOf(end=1, current=60000, previous=3, density=3) returns 179992
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0034 begin`);
      const actual: number = nextEndOf(1, 60000, 3, 3);
      logInfo(`nextEndOf(end=1, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(179992);
      logInfo(`${BUNDLE}NextEndOf_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0035
     * @tc.name      WindowManage_NextEndOf_0035
     * @tc.desc      nextEndOf(end=5, current=60000, previous=1, density=-1) returns -59994
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0035 begin`);
      const actual: number = nextEndOf(5, 60000, 1, -1);
      logInfo(`nextEndOf(end=5, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(-59994);
      logInfo(`${BUNDLE}NextEndOf_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0036
     * @tc.name      WindowManage_NextEndOf_0036
     * @tc.desc      nextEndOf(end=5, current=500, previous=10, density=3) returns 1475
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0036 begin`);
      const actual: number = nextEndOf(5, 500, 10, 3);
      logInfo(`nextEndOf(end=5, current=500, previous=10...: actual=${actual}`);
      expect(actual).assertEqual(1475);
      logInfo(`${BUNDLE}NextEndOf_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0037
     * @tc.name      WindowManage_NextEndOf_0037
     * @tc.desc      nextEndOf(end=0, current=3599000, previous=0, density=10) returns 35990000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0037 begin`);
      const actual: number = nextEndOf(0, 3599000, 0, 10);
      logInfo(`nextEndOf(end=0, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(35990000);
      logInfo(`${BUNDLE}NextEndOf_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0038
     * @tc.name      WindowManage_NextEndOf_0038
     * @tc.desc      nextEndOf(end=2, current=61000, previous=0, density=10) returns 610002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0038 begin`);
      const actual: number = nextEndOf(2, 61000, 0, 10);
      logInfo(`nextEndOf(end=2, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(610002);
      logInfo(`${BUNDLE}NextEndOf_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0039
     * @tc.name      WindowManage_NextEndOf_0039
     * @tc.desc      nextEndOf(end=3, current=59999, previous=100, density=10) returns 598993
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0039 begin`);
      const actual: number = nextEndOf(3, 59999, 100, 10);
      logInfo(`nextEndOf(end=3, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(598993);
      logInfo(`${BUNDLE}NextEndOf_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0040
     * @tc.name      WindowManage_NextEndOf_0040
     * @tc.desc      nextEndOf(end=5, current=0, previous=3, density=10) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0040 begin`);
      const actual: number = nextEndOf(5, 0, 3, 10);
      logInfo(`nextEndOf(end=5, current=0, previous=3, d...: actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}NextEndOf_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0041
     * @tc.name      WindowManage_NextEndOf_0041
     * @tc.desc      nextEndOf(end=100, current=61000, previous=-1, density=-1) returns -60901
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0041 begin`);
      const actual: number = nextEndOf(100, 61000, -1, -1);
      logInfo(`nextEndOf(end=100, current=61000, previou...: actual=${actual}`);
      expect(actual).assertEqual(-60901);
      logInfo(`${BUNDLE}NextEndOf_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0042
     * @tc.name      WindowManage_NextEndOf_0042
     * @tc.desc      nextEndOf(end=10, current=1000, previous=3, density=-1) returns -987
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0042 begin`);
      const actual: number = nextEndOf(10, 1000, 3, -1);
      logInfo(`nextEndOf(end=10, current=1000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(-987);
      logInfo(`${BUNDLE}NextEndOf_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0043
     * @tc.name      WindowManage_NextEndOf_0043
     * @tc.desc      nextEndOf(end=5, current=61000, previous=3, density=5) returns 304990
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0043 begin`);
      const actual: number = nextEndOf(5, 61000, 3, 5);
      logInfo(`nextEndOf(end=5, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(304990);
      logInfo(`${BUNDLE}NextEndOf_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0044
     * @tc.name      WindowManage_NextEndOf_0044
     * @tc.desc      nextEndOf(end=-1, current=59999, previous=3, density=10) returns 599959
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0044 begin`);
      const actual: number = nextEndOf(-1, 59999, 3, 10);
      logInfo(`nextEndOf(end=-1, current=59999, previous...: actual=${actual}`);
      expect(actual).assertEqual(599959);
      logInfo(`${BUNDLE}NextEndOf_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0045
     * @tc.name      WindowManage_NextEndOf_0045
     * @tc.desc      nextEndOf(end=2, current=61000, previous=100, density=1) returns 60902
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0045 begin`);
      const actual: number = nextEndOf(2, 61000, 100, 1);
      logInfo(`nextEndOf(end=2, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(60902);
      logInfo(`${BUNDLE}NextEndOf_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0046
     * @tc.name      WindowManage_NextEndOf_0046
     * @tc.desc      nextEndOf(end=0, current=59999, previous=100, density=3) returns 179697
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0046 begin`);
      const actual: number = nextEndOf(0, 59999, 100, 3);
      logInfo(`nextEndOf(end=0, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(179697);
      logInfo(`${BUNDLE}NextEndOf_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0047
     * @tc.name      WindowManage_NextEndOf_0047
     * @tc.desc      nextEndOf(end=2, current=61000, previous=1, density=10) returns 609992
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0047 begin`);
      const actual: number = nextEndOf(2, 61000, 1, 10);
      logInfo(`nextEndOf(end=2, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(609992);
      logInfo(`${BUNDLE}NextEndOf_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0048
     * @tc.name      WindowManage_NextEndOf_0048
     * @tc.desc      nextEndOf(end=3, current=999, previous=2, density=5) returns 4988
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0048 begin`);
      const actual: number = nextEndOf(3, 999, 2, 5);
      logInfo(`nextEndOf(end=3, current=999, previous=2,...: actual=${actual}`);
      expect(actual).assertEqual(4988);
      logInfo(`${BUNDLE}NextEndOf_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0049
     * @tc.name      WindowManage_NextEndOf_0049
     * @tc.desc      nextEndOf(end=-1, current=999, previous=10, density=100) returns 98899
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0049 begin`);
      const actual: number = nextEndOf(-1, 999, 10, 100);
      logInfo(`nextEndOf(end=-1, current=999, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(98899);
      logInfo(`${BUNDLE}NextEndOf_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0050
     * @tc.name      WindowManage_NextEndOf_0050
     * @tc.desc      nextEndOf(end=100, current=61000, previous=5, density=100) returns 6099600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0050 begin`);
      const actual: number = nextEndOf(100, 61000, 5, 100);
      logInfo(`nextEndOf(end=100, current=61000, previou...: actual=${actual}`);
      expect(actual).assertEqual(6099600);
      logInfo(`${BUNDLE}NextEndOf_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0051
     * @tc.name      WindowManage_NextEndOf_0051
     * @tc.desc      nextEndOf(end=1, current=0, previous=3, density=10) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0051 begin`);
      const actual: number = nextEndOf(1, 0, 3, 10);
      logInfo(`nextEndOf(end=1, current=0, previous=3, d...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}NextEndOf_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0052
     * @tc.name      WindowManage_NextEndOf_0052
     * @tc.desc      nextEndOf(end=-1, current=1000, previous=-1, density=-1) returns -1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0052 begin`);
      const actual: number = nextEndOf(-1, 1000, -1, -1);
      logInfo(`nextEndOf(end=-1, current=1000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(-1002);
      logInfo(`${BUNDLE}NextEndOf_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0053
     * @tc.name      WindowManage_NextEndOf_0053
     * @tc.desc      nextEndOf(end=10, current=500, previous=100, density=-1) returns -390
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0053 begin`);
      const actual: number = nextEndOf(10, 500, 100, -1);
      logInfo(`nextEndOf(end=10, current=500, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(-390);
      logInfo(`${BUNDLE}NextEndOf_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0054
     * @tc.name      WindowManage_NextEndOf_0054
     * @tc.desc      nextEndOf(end=10, current=60000, previous=0, density=2) returns 120010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0054 begin`);
      const actual: number = nextEndOf(10, 60000, 0, 2);
      logInfo(`nextEndOf(end=10, current=60000, previous...: actual=${actual}`);
      expect(actual).assertEqual(120010);
      logInfo(`${BUNDLE}NextEndOf_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0055
     * @tc.name      WindowManage_NextEndOf_0055
     * @tc.desc      nextEndOf(end=3, current=61000, previous=-1, density=10) returns 610013
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0055 begin`);
      const actual: number = nextEndOf(3, 61000, -1, 10);
      logInfo(`nextEndOf(end=3, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(610013);
      logInfo(`${BUNDLE}NextEndOf_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0056
     * @tc.name      WindowManage_NextEndOf_0056
     * @tc.desc      nextEndOf(end=5, current=500, previous=2, density=2) returns 1001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0056 begin`);
      const actual: number = nextEndOf(5, 500, 2, 2);
      logInfo(`nextEndOf(end=5, current=500, previous=2,...: actual=${actual}`);
      expect(actual).assertEqual(1001);
      logInfo(`${BUNDLE}NextEndOf_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0057
     * @tc.name      WindowManage_NextEndOf_0057
     * @tc.desc      nextEndOf(end=100, current=61000, previous=1, density=1) returns 61099
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0057 begin`);
      const actual: number = nextEndOf(100, 61000, 1, 1);
      logInfo(`nextEndOf(end=100, current=61000, previou...: actual=${actual}`);
      expect(actual).assertEqual(61099);
      logInfo(`${BUNDLE}NextEndOf_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0058
     * @tc.name      WindowManage_NextEndOf_0058
     * @tc.desc      nextEndOf(end=5, current=1000, previous=0, density=2) returns 2005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0058 begin`);
      const actual: number = nextEndOf(5, 1000, 0, 2);
      logInfo(`nextEndOf(end=5, current=1000, previous=0...: actual=${actual}`);
      expect(actual).assertEqual(2005);
      logInfo(`${BUNDLE}NextEndOf_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0059
     * @tc.name      WindowManage_NextEndOf_0059
     * @tc.desc      nextEndOf(end=0, current=61000, previous=-1, density=3) returns 183003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0059 begin`);
      const actual: number = nextEndOf(0, 61000, -1, 3);
      logInfo(`nextEndOf(end=0, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(183003);
      logInfo(`${BUNDLE}NextEndOf_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0060
     * @tc.name      WindowManage_NextEndOf_0060
     * @tc.desc      nextEndOf(end=5, current=3599000, previous=1, density=100) returns 359899905
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0060 begin`);
      const actual: number = nextEndOf(5, 3599000, 1, 100);
      logInfo(`nextEndOf(end=5, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(359899905);
      logInfo(`${BUNDLE}NextEndOf_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0061
     * @tc.name      WindowManage_NextEndOf_0061
     * @tc.desc      nextEndOf(end=2, current=60000, previous=2, density=5) returns 299992
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0061 begin`);
      const actual: number = nextEndOf(2, 60000, 2, 5);
      logInfo(`nextEndOf(end=2, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(299992);
      logInfo(`${BUNDLE}NextEndOf_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0062
     * @tc.name      WindowManage_NextEndOf_0062
     * @tc.desc      nextEndOf(end=3, current=61000, previous=5, density=10) returns 609953
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0062 begin`);
      const actual: number = nextEndOf(3, 61000, 5, 10);
      logInfo(`nextEndOf(end=3, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(609953);
      logInfo(`${BUNDLE}NextEndOf_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0063
     * @tc.name      WindowManage_NextEndOf_0063
     * @tc.desc      nextEndOf(end=3, current=1000, previous=100, density=-1) returns -897
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0063 begin`);
      const actual: number = nextEndOf(3, 1000, 100, -1);
      logInfo(`nextEndOf(end=3, current=1000, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(-897);
      logInfo(`${BUNDLE}NextEndOf_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0064
     * @tc.name      WindowManage_NextEndOf_0064
     * @tc.desc      nextEndOf(end=1, current=59999, previous=0, density=2) returns 119999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0064 begin`);
      const actual: number = nextEndOf(1, 59999, 0, 2);
      logInfo(`nextEndOf(end=1, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(119999);
      logInfo(`${BUNDLE}NextEndOf_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0065
     * @tc.name      WindowManage_NextEndOf_0065
     * @tc.desc      nextEndOf(end=5, current=999, previous=-1, density=3) returns 3005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0065 begin`);
      const actual: number = nextEndOf(5, 999, -1, 3);
      logInfo(`nextEndOf(end=5, current=999, previous=-1...: actual=${actual}`);
      expect(actual).assertEqual(3005);
      logInfo(`${BUNDLE}NextEndOf_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0066
     * @tc.name      WindowManage_NextEndOf_0066
     * @tc.desc      nextEndOf(end=10, current=59999, previous=100, density=-1) returns -59889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0066 begin`);
      const actual: number = nextEndOf(10, 59999, 100, -1);
      logInfo(`nextEndOf(end=10, current=59999, previous...: actual=${actual}`);
      expect(actual).assertEqual(-59889);
      logInfo(`${BUNDLE}NextEndOf_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0067
     * @tc.name      WindowManage_NextEndOf_0067
     * @tc.desc      nextEndOf(end=-1, current=500, previous=5, density=1) returns 494
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0067 begin`);
      const actual: number = nextEndOf(-1, 500, 5, 1);
      logInfo(`nextEndOf(end=-1, current=500, previous=5...: actual=${actual}`);
      expect(actual).assertEqual(494);
      logInfo(`${BUNDLE}NextEndOf_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0068
     * @tc.name      WindowManage_NextEndOf_0068
     * @tc.desc      nextEndOf(end=10, current=60000, previous=100, density=10) returns 599010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0068 begin`);
      const actual: number = nextEndOf(10, 60000, 100, 10);
      logInfo(`nextEndOf(end=10, current=60000, previous...: actual=${actual}`);
      expect(actual).assertEqual(599010);
      logInfo(`${BUNDLE}NextEndOf_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0069
     * @tc.name      WindowManage_NextEndOf_0069
     * @tc.desc      nextEndOf(end=3, current=60000, previous=0, density=5) returns 300003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0069 begin`);
      const actual: number = nextEndOf(3, 60000, 0, 5);
      logInfo(`nextEndOf(end=3, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(300003);
      logInfo(`${BUNDLE}NextEndOf_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0070
     * @tc.name      WindowManage_NextEndOf_0070
     * @tc.desc      nextEndOf(end=5, current=3599000, previous=0, density=10) returns 35990005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0070 begin`);
      const actual: number = nextEndOf(5, 3599000, 0, 10);
      logInfo(`nextEndOf(end=5, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(35990005);
      logInfo(`${BUNDLE}NextEndOf_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0071
     * @tc.name      WindowManage_NextEndOf_0071
     * @tc.desc      nextEndOf(end=100, current=60000, previous=1, density=1) returns 60099
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0071 begin`);
      const actual: number = nextEndOf(100, 60000, 1, 1);
      logInfo(`nextEndOf(end=100, current=60000, previou...: actual=${actual}`);
      expect(actual).assertEqual(60099);
      logInfo(`${BUNDLE}NextEndOf_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0072
     * @tc.name      WindowManage_NextEndOf_0072
     * @tc.desc      nextEndOf(end=3, current=1000, previous=2, density=-1) returns -995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0072 begin`);
      const actual: number = nextEndOf(3, 1000, 2, -1);
      logInfo(`nextEndOf(end=3, current=1000, previous=2...: actual=${actual}`);
      expect(actual).assertEqual(-995);
      logInfo(`${BUNDLE}NextEndOf_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0073
     * @tc.name      WindowManage_NextEndOf_0073
     * @tc.desc      nextEndOf(end=100, current=500, previous=1, density=5) returns 2595
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0073 begin`);
      const actual: number = nextEndOf(100, 500, 1, 5);
      logInfo(`nextEndOf(end=100, current=500, previous=...: actual=${actual}`);
      expect(actual).assertEqual(2595);
      logInfo(`${BUNDLE}NextEndOf_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0074
     * @tc.name      WindowManage_NextEndOf_0074
     * @tc.desc      nextEndOf(end=1, current=0, previous=1, density=3) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0074 begin`);
      const actual: number = nextEndOf(1, 0, 1, 3);
      logInfo(`nextEndOf(end=1, current=0, previous=1, d...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextEndOf_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0075
     * @tc.name      WindowManage_NextEndOf_0075
     * @tc.desc      nextEndOf(end=2, current=3599000, previous=-1, density=-1) returns -3598999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0075 begin`);
      const actual: number = nextEndOf(2, 3599000, -1, -1);
      logInfo(`nextEndOf(end=2, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(-3598999);
      logInfo(`${BUNDLE}NextEndOf_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0076
     * @tc.name      WindowManage_NextEndOf_0076
     * @tc.desc      nextEndOf(end=-1, current=500, previous=1, density=10) returns 4989
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0076 begin`);
      const actual: number = nextEndOf(-1, 500, 1, 10);
      logInfo(`nextEndOf(end=-1, current=500, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(4989);
      logInfo(`${BUNDLE}NextEndOf_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0077
     * @tc.name      WindowManage_NextEndOf_0077
     * @tc.desc      nextEndOf(end=100, current=1000, previous=1, density=10) returns 10090
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0077 begin`);
      const actual: number = nextEndOf(100, 1000, 1, 10);
      logInfo(`nextEndOf(end=100, current=1000, previous...: actual=${actual}`);
      expect(actual).assertEqual(10090);
      logInfo(`${BUNDLE}NextEndOf_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0078
     * @tc.name      WindowManage_NextEndOf_0078
     * @tc.desc      nextEndOf(end=-1, current=3599000, previous=-1, density=5) returns 17995004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0078 begin`);
      const actual: number = nextEndOf(-1, 3599000, -1, 5);
      logInfo(`nextEndOf(end=-1, current=3599000, previo...: actual=${actual}`);
      expect(actual).assertEqual(17995004);
      logInfo(`${BUNDLE}NextEndOf_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0079
     * @tc.name      WindowManage_NextEndOf_0079
     * @tc.desc      nextEndOf(end=3, current=61000, previous=100, density=100) returns 6090003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0079 begin`);
      const actual: number = nextEndOf(3, 61000, 100, 100);
      logInfo(`nextEndOf(end=3, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(6090003);
      logInfo(`${BUNDLE}NextEndOf_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0080
     * @tc.name      WindowManage_NextEndOf_0080
     * @tc.desc      nextEndOf(end=5, current=0, previous=3, density=-1) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0080 begin`);
      const actual: number = nextEndOf(5, 0, 3, -1);
      logInfo(`nextEndOf(end=5, current=0, previous=3, d...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}NextEndOf_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0081
     * @tc.name      WindowManage_NextEndOf_0081
     * @tc.desc      nextEndOf(end=1, current=61000, previous=10, density=100) returns 6099001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0081 begin`);
      const actual: number = nextEndOf(1, 61000, 10, 100);
      logInfo(`nextEndOf(end=1, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(6099001);
      logInfo(`${BUNDLE}NextEndOf_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0082
     * @tc.name      WindowManage_NextEndOf_0082
     * @tc.desc      nextEndOf(end=10, current=61000, previous=3, density=10) returns 609980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0082 begin`);
      const actual: number = nextEndOf(10, 61000, 3, 10);
      logInfo(`nextEndOf(end=10, current=61000, previous...: actual=${actual}`);
      expect(actual).assertEqual(609980);
      logInfo(`${BUNDLE}NextEndOf_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0083
     * @tc.name      WindowManage_NextEndOf_0083
     * @tc.desc      nextEndOf(end=100, current=0, previous=2, density=5) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0083 begin`);
      const actual: number = nextEndOf(100, 0, 2, 5);
      logInfo(`nextEndOf(end=100, current=0, previous=2,...: actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}NextEndOf_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0084
     * @tc.name      WindowManage_NextEndOf_0084
     * @tc.desc      nextEndOf(end=100, current=999, previous=-1, density=2) returns 2100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0084 begin`);
      const actual: number = nextEndOf(100, 999, -1, 2);
      logInfo(`nextEndOf(end=100, current=999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(2100);
      logInfo(`${BUNDLE}NextEndOf_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0085
     * @tc.name      WindowManage_NextEndOf_0085
     * @tc.desc      nextEndOf(end=5, current=59999, previous=1, density=3) returns 179999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0085 begin`);
      const actual: number = nextEndOf(5, 59999, 1, 3);
      logInfo(`nextEndOf(end=5, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(179999);
      logInfo(`${BUNDLE}NextEndOf_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0086
     * @tc.name      WindowManage_NextEndOf_0086
     * @tc.desc      nextEndOf(end=2, current=3599000, previous=-1, density=100) returns 359900102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0086 begin`);
      const actual: number = nextEndOf(2, 3599000, -1, 100);
      logInfo(`nextEndOf(end=2, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(359900102);
      logInfo(`${BUNDLE}NextEndOf_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0087
     * @tc.name      WindowManage_NextEndOf_0087
     * @tc.desc      nextEndOf(end=10, current=1000, previous=100, density=2) returns 1810
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0087 begin`);
      const actual: number = nextEndOf(10, 1000, 100, 2);
      logInfo(`nextEndOf(end=10, current=1000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(1810);
      logInfo(`${BUNDLE}NextEndOf_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0088
     * @tc.name      WindowManage_NextEndOf_0088
     * @tc.desc      nextEndOf(end=0, current=500, previous=1, density=1) returns 499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0088 begin`);
      const actual: number = nextEndOf(0, 500, 1, 1);
      logInfo(`nextEndOf(end=0, current=500, previous=1,...: actual=${actual}`);
      expect(actual).assertEqual(499);
      logInfo(`${BUNDLE}NextEndOf_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0089
     * @tc.name      WindowManage_NextEndOf_0089
     * @tc.desc      nextEndOf(end=2, current=1000, previous=3, density=2) returns 1996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0089 begin`);
      const actual: number = nextEndOf(2, 1000, 3, 2);
      logInfo(`nextEndOf(end=2, current=1000, previous=3...: actual=${actual}`);
      expect(actual).assertEqual(1996);
      logInfo(`${BUNDLE}NextEndOf_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0090
     * @tc.name      WindowManage_NextEndOf_0090
     * @tc.desc      nextEndOf(end=0, current=1000, previous=10, density=100) returns 99000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0090 begin`);
      const actual: number = nextEndOf(0, 1000, 10, 100);
      logInfo(`nextEndOf(end=0, current=1000, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(99000);
      logInfo(`${BUNDLE}NextEndOf_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0091
     * @tc.name      WindowManage_NextEndOf_0091
     * @tc.desc      nextEndOf(end=-1, current=61000, previous=2, density=-1) returns -60999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0091 begin`);
      const actual: number = nextEndOf(-1, 61000, 2, -1);
      logInfo(`nextEndOf(end=-1, current=61000, previous...: actual=${actual}`);
      expect(actual).assertEqual(-60999);
      logInfo(`${BUNDLE}NextEndOf_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0092
     * @tc.name      WindowManage_NextEndOf_0092
     * @tc.desc      nextEndOf(end=5, current=999, previous=2, density=3) returns 2996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0092 begin`);
      const actual: number = nextEndOf(5, 999, 2, 3);
      logInfo(`nextEndOf(end=5, current=999, previous=2,...: actual=${actual}`);
      expect(actual).assertEqual(2996);
      logInfo(`${BUNDLE}NextEndOf_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0093
     * @tc.name      WindowManage_NextEndOf_0093
     * @tc.desc      nextEndOf(end=10, current=59999, previous=2, density=100) returns 5999710
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0093 begin`);
      const actual: number = nextEndOf(10, 59999, 2, 100);
      logInfo(`nextEndOf(end=10, current=59999, previous...: actual=${actual}`);
      expect(actual).assertEqual(5999710);
      logInfo(`${BUNDLE}NextEndOf_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0094
     * @tc.name      WindowManage_NextEndOf_0094
     * @tc.desc      nextEndOf(end=10, current=1000, previous=3, density=3) returns 3001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0094 begin`);
      const actual: number = nextEndOf(10, 1000, 3, 3);
      logInfo(`nextEndOf(end=10, current=1000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(3001);
      logInfo(`${BUNDLE}NextEndOf_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0095
     * @tc.name      WindowManage_NextEndOf_0095
     * @tc.desc      nextEndOf(end=1, current=0, previous=-1, density=3) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0095 begin`);
      const actual: number = nextEndOf(1, 0, -1, 3);
      logInfo(`nextEndOf(end=1, current=0, previous=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}NextEndOf_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0096
     * @tc.name      WindowManage_NextEndOf_0096
     * @tc.desc      nextEndOf(end=100, current=61000, previous=1, density=5) returns 305095
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0096 begin`);
      const actual: number = nextEndOf(100, 61000, 1, 5);
      logInfo(`nextEndOf(end=100, current=61000, previou...: actual=${actual}`);
      expect(actual).assertEqual(305095);
      logInfo(`${BUNDLE}NextEndOf_0096 end`);
    });
  });
}
