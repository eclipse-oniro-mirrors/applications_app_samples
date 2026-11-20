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
export default function nextEndOf2Test(): void {
  describe('NextEndOf2Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0097
     * @tc.name      WindowManage_NextEndOf_0097
     * @tc.desc      nextEndOf(end=100, current=1000, previous=1, density=3) returns 3097
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0097 begin`);
      const actual: number = nextEndOf(100, 1000, 1, 3);
      logInfo(`nextEndOf(end=100, current=1000, previous...: actual=${actual}`);
      expect(actual).assertEqual(3097);
      logInfo(`${BUNDLE}NextEndOf_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0098
     * @tc.name      WindowManage_NextEndOf_0098
     * @tc.desc      nextEndOf(end=100, current=0, previous=-1, density=3) returns 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0098 begin`);
      const actual: number = nextEndOf(100, 0, -1, 3);
      logInfo(`nextEndOf(end=100, current=0, previous=-1...: actual=${actual}`);
      expect(actual).assertEqual(103);
      logInfo(`${BUNDLE}NextEndOf_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0099
     * @tc.name      WindowManage_NextEndOf_0099
     * @tc.desc      nextEndOf(end=3, current=3599000, previous=5, density=100) returns 359899503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0099 begin`);
      const actual: number = nextEndOf(3, 3599000, 5, 100);
      logInfo(`nextEndOf(end=3, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(359899503);
      logInfo(`${BUNDLE}NextEndOf_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0100
     * @tc.name      WindowManage_NextEndOf_0100
     * @tc.desc      nextEndOf(end=2, current=59999, previous=10, density=-1) returns -59987
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0100 begin`);
      const actual: number = nextEndOf(2, 59999, 10, -1);
      logInfo(`nextEndOf(end=2, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(-59987);
      logInfo(`${BUNDLE}NextEndOf_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0101
     * @tc.name      WindowManage_NextEndOf_0101
     * @tc.desc      nextEndOf(end=-1, current=999, previous=100, density=5) returns 4494
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0101 begin`);
      const actual: number = nextEndOf(-1, 999, 100, 5);
      logInfo(`nextEndOf(end=-1, current=999, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(4494);
      logInfo(`${BUNDLE}NextEndOf_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0102
     * @tc.name      WindowManage_NextEndOf_0102
     * @tc.desc      nextEndOf(end=1, current=999, previous=1, density=1) returns 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0102 begin`);
      const actual: number = nextEndOf(1, 999, 1, 1);
      logInfo(`nextEndOf(end=1, current=999, previous=1,...: actual=${actual}`);
      expect(actual).assertEqual(999);
      logInfo(`${BUNDLE}NextEndOf_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0103
     * @tc.name      WindowManage_NextEndOf_0103
     * @tc.desc      nextEndOf(end=1, current=1000, previous=1, density=100) returns 99901
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0103 begin`);
      const actual: number = nextEndOf(1, 1000, 1, 100);
      logInfo(`nextEndOf(end=1, current=1000, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(99901);
      logInfo(`${BUNDLE}NextEndOf_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0104
     * @tc.name      WindowManage_NextEndOf_0104
     * @tc.desc      nextEndOf(end=3, current=60000, previous=3, density=3) returns 179994
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0104 begin`);
      const actual: number = nextEndOf(3, 60000, 3, 3);
      logInfo(`nextEndOf(end=3, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(179994);
      logInfo(`${BUNDLE}NextEndOf_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0105
     * @tc.name      WindowManage_NextEndOf_0105
     * @tc.desc      nextEndOf(end=-1, current=3599000, previous=10, density=1) returns 3598989
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0105 begin`);
      const actual: number = nextEndOf(-1, 3599000, 10, 1);
      logInfo(`nextEndOf(end=-1, current=3599000, previo...: actual=${actual}`);
      expect(actual).assertEqual(3598989);
      logInfo(`${BUNDLE}NextEndOf_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0106
     * @tc.name      WindowManage_NextEndOf_0106
     * @tc.desc      nextEndOf(end=10, current=59999, previous=5, density=10) returns 599950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0106 begin`);
      const actual: number = nextEndOf(10, 59999, 5, 10);
      logInfo(`nextEndOf(end=10, current=59999, previous...: actual=${actual}`);
      expect(actual).assertEqual(599950);
      logInfo(`${BUNDLE}NextEndOf_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0107
     * @tc.name      WindowManage_NextEndOf_0107
     * @tc.desc      nextEndOf(end=2, current=3599000, previous=3, density=-1) returns -3598995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0107 begin`);
      const actual: number = nextEndOf(2, 3599000, 3, -1);
      logInfo(`nextEndOf(end=2, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(-3598995);
      logInfo(`${BUNDLE}NextEndOf_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0108
     * @tc.name      WindowManage_NextEndOf_0108
     * @tc.desc      nextEndOf(end=10, current=60000, previous=1, density=2) returns 120008
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0108 begin`);
      const actual: number = nextEndOf(10, 60000, 1, 2);
      logInfo(`nextEndOf(end=10, current=60000, previous...: actual=${actual}`);
      expect(actual).assertEqual(120008);
      logInfo(`${BUNDLE}NextEndOf_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0109
     * @tc.name      WindowManage_NextEndOf_0109
     * @tc.desc      nextEndOf(end=100, current=0, previous=10, density=5) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0109 begin`);
      const actual: number = nextEndOf(100, 0, 10, 5);
      logInfo(`nextEndOf(end=100, current=0, previous=10...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}NextEndOf_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0110
     * @tc.name      WindowManage_NextEndOf_0110
     * @tc.desc      nextEndOf(end=2, current=61000, previous=100, density=2) returns 121802
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0110 begin`);
      const actual: number = nextEndOf(2, 61000, 100, 2);
      logInfo(`nextEndOf(end=2, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(121802);
      logInfo(`${BUNDLE}NextEndOf_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0111
     * @tc.name      WindowManage_NextEndOf_0111
     * @tc.desc      nextEndOf(end=0, current=500, previous=2, density=100) returns 49800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0111 begin`);
      const actual: number = nextEndOf(0, 500, 2, 100);
      logInfo(`nextEndOf(end=0, current=500, previous=2,...: actual=${actual}`);
      expect(actual).assertEqual(49800);
      logInfo(`${BUNDLE}NextEndOf_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0112
     * @tc.name      WindowManage_NextEndOf_0112
     * @tc.desc      nextEndOf(end=-1, current=500, previous=-1, density=3) returns 1502
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0112 begin`);
      const actual: number = nextEndOf(-1, 500, -1, 3);
      logInfo(`nextEndOf(end=-1, current=500, previous=-...: actual=${actual}`);
      expect(actual).assertEqual(1502);
      logInfo(`${BUNDLE}NextEndOf_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0113
     * @tc.name      WindowManage_NextEndOf_0113
     * @tc.desc      nextEndOf(end=10, current=0, previous=2, density=10) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0113 begin`);
      const actual: number = nextEndOf(10, 0, 2, 10);
      logInfo(`nextEndOf(end=10, current=0, previous=2, ...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}NextEndOf_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0114
     * @tc.name      WindowManage_NextEndOf_0114
     * @tc.desc      nextEndOf(end=10, current=3599000, previous=5, density=3) returns 10796995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0114 begin`);
      const actual: number = nextEndOf(10, 3599000, 5, 3);
      logInfo(`nextEndOf(end=10, current=3599000, previo...: actual=${actual}`);
      expect(actual).assertEqual(10796995);
      logInfo(`${BUNDLE}NextEndOf_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0115
     * @tc.name      WindowManage_NextEndOf_0115
     * @tc.desc      nextEndOf(end=100, current=999, previous=5, density=-1) returns -894
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0115 begin`);
      const actual: number = nextEndOf(100, 999, 5, -1);
      logInfo(`nextEndOf(end=100, current=999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(-894);
      logInfo(`${BUNDLE}NextEndOf_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0116
     * @tc.name      WindowManage_NextEndOf_0116
     * @tc.desc      nextEndOf(end=5, current=61000, previous=10, density=5) returns 304955
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0116 begin`);
      const actual: number = nextEndOf(5, 61000, 10, 5);
      logInfo(`nextEndOf(end=5, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(304955);
      logInfo(`${BUNDLE}NextEndOf_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0117
     * @tc.name      WindowManage_NextEndOf_0117
     * @tc.desc      nextEndOf(end=-1, current=59999, previous=2, density=-1) returns -59998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0117 begin`);
      const actual: number = nextEndOf(-1, 59999, 2, -1);
      logInfo(`nextEndOf(end=-1, current=59999, previous...: actual=${actual}`);
      expect(actual).assertEqual(-59998);
      logInfo(`${BUNDLE}NextEndOf_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0118
     * @tc.name      WindowManage_NextEndOf_0118
     * @tc.desc      nextEndOf(end=-1, current=999, previous=-1, density=5) returns 4999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0118 begin`);
      const actual: number = nextEndOf(-1, 999, -1, 5);
      logInfo(`nextEndOf(end=-1, current=999, previous=-...: actual=${actual}`);
      expect(actual).assertEqual(4999);
      logInfo(`${BUNDLE}NextEndOf_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0119
     * @tc.name      WindowManage_NextEndOf_0119
     * @tc.desc      nextEndOf(end=0, current=59999, previous=0, density=100) returns 5999900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0119 begin`);
      const actual: number = nextEndOf(0, 59999, 0, 100);
      logInfo(`nextEndOf(end=0, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(5999900);
      logInfo(`${BUNDLE}NextEndOf_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0120
     * @tc.name      WindowManage_NextEndOf_0120
     * @tc.desc      nextEndOf(end=-1, current=500, previous=2, density=5) returns 2489
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0120 begin`);
      const actual: number = nextEndOf(-1, 500, 2, 5);
      logInfo(`nextEndOf(end=-1, current=500, previous=2...: actual=${actual}`);
      expect(actual).assertEqual(2489);
      logInfo(`${BUNDLE}NextEndOf_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0121
     * @tc.name      WindowManage_NextEndOf_0121
     * @tc.desc      nextEndOf(end=-1, current=0, previous=2, density=10) returns -21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0121 begin`);
      const actual: number = nextEndOf(-1, 0, 2, 10);
      logInfo(`nextEndOf(end=-1, current=0, previous=2, ...: actual=${actual}`);
      expect(actual).assertEqual(-21);
      logInfo(`${BUNDLE}NextEndOf_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0122
     * @tc.name      WindowManage_NextEndOf_0122
     * @tc.desc      nextEndOf(end=3, current=61000, previous=-1, density=5) returns 305008
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0122 begin`);
      const actual: number = nextEndOf(3, 61000, -1, 5);
      logInfo(`nextEndOf(end=3, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(305008);
      logInfo(`${BUNDLE}NextEndOf_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0123
     * @tc.name      WindowManage_NextEndOf_0123
     * @tc.desc      nextEndOf(end=1, current=59999, previous=1, density=5) returns 299991
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0123 begin`);
      const actual: number = nextEndOf(1, 59999, 1, 5);
      logInfo(`nextEndOf(end=1, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(299991);
      logInfo(`${BUNDLE}NextEndOf_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0124
     * @tc.name      WindowManage_NextEndOf_0124
     * @tc.desc      nextEndOf(end=100, current=999, previous=-1, density=-1) returns -900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0124 begin`);
      const actual: number = nextEndOf(100, 999, -1, -1);
      logInfo(`nextEndOf(end=100, current=999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(-900);
      logInfo(`${BUNDLE}NextEndOf_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0125
     * @tc.name      WindowManage_NextEndOf_0125
     * @tc.desc      nextEndOf(end=5, current=0, previous=2, density=5) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0125 begin`);
      const actual: number = nextEndOf(5, 0, 2, 5);
      logInfo(`nextEndOf(end=5, current=0, previous=2, d...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}NextEndOf_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0126
     * @tc.name      WindowManage_NextEndOf_0126
     * @tc.desc      nextEndOf(end=-1, current=0, previous=3, density=1) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0126 begin`);
      const actual: number = nextEndOf(-1, 0, 3, 1);
      logInfo(`nextEndOf(end=-1, current=0, previous=3, ...: actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}NextEndOf_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0127
     * @tc.name      WindowManage_NextEndOf_0127
     * @tc.desc      nextEndOf(end=5, current=500, previous=5, density=3) returns 1490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0127 begin`);
      const actual: number = nextEndOf(5, 500, 5, 3);
      logInfo(`nextEndOf(end=5, current=500, previous=5,...: actual=${actual}`);
      expect(actual).assertEqual(1490);
      logInfo(`${BUNDLE}NextEndOf_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0128
     * @tc.name      WindowManage_NextEndOf_0128
     * @tc.desc      nextEndOf(end=5, current=3599000, previous=-1, density=10) returns 35990015
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0128 begin`);
      const actual: number = nextEndOf(5, 3599000, -1, 10);
      logInfo(`nextEndOf(end=5, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(35990015);
      logInfo(`${BUNDLE}NextEndOf_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0129
     * @tc.name      WindowManage_NextEndOf_0129
     * @tc.desc      nextEndOf(end=-1, current=59999, previous=1, density=100) returns 5999799
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0129 begin`);
      const actual: number = nextEndOf(-1, 59999, 1, 100);
      logInfo(`nextEndOf(end=-1, current=59999, previous...: actual=${actual}`);
      expect(actual).assertEqual(5999799);
      logInfo(`${BUNDLE}NextEndOf_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0130
     * @tc.name      WindowManage_NextEndOf_0130
     * @tc.desc      nextEndOf(end=1, current=3599000, previous=0, density=1) returns 3599001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0130 begin`);
      const actual: number = nextEndOf(1, 3599000, 0, 1);
      logInfo(`nextEndOf(end=1, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(3599001);
      logInfo(`${BUNDLE}NextEndOf_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0131
     * @tc.name      WindowManage_NextEndOf_0131
     * @tc.desc      nextEndOf(end=10, current=61000, previous=100, density=5) returns 304510
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0131 begin`);
      const actual: number = nextEndOf(10, 61000, 100, 5);
      logInfo(`nextEndOf(end=10, current=61000, previous...: actual=${actual}`);
      expect(actual).assertEqual(304510);
      logInfo(`${BUNDLE}NextEndOf_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0132
     * @tc.name      WindowManage_NextEndOf_0132
     * @tc.desc      nextEndOf(end=1, current=60000, previous=0, density=10) returns 600001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0132 begin`);
      const actual: number = nextEndOf(1, 60000, 0, 10);
      logInfo(`nextEndOf(end=1, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(600001);
      logInfo(`${BUNDLE}NextEndOf_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0133
     * @tc.name      WindowManage_NextEndOf_0133
     * @tc.desc      nextEndOf(end=10, current=60000, previous=3, density=3) returns 180001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0133 begin`);
      const actual: number = nextEndOf(10, 60000, 3, 3);
      logInfo(`nextEndOf(end=10, current=60000, previous...: actual=${actual}`);
      expect(actual).assertEqual(180001);
      logInfo(`${BUNDLE}NextEndOf_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0134
     * @tc.name      WindowManage_NextEndOf_0134
     * @tc.desc      nextEndOf(end=3, current=1000, previous=1, density=-1) returns -996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0134 begin`);
      const actual: number = nextEndOf(3, 1000, 1, -1);
      logInfo(`nextEndOf(end=3, current=1000, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(-996);
      logInfo(`${BUNDLE}NextEndOf_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0135
     * @tc.name      WindowManage_NextEndOf_0135
     * @tc.desc      nextEndOf(end=5, current=3599000, previous=10, density=1) returns 3598995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0135 begin`);
      const actual: number = nextEndOf(5, 3599000, 10, 1);
      logInfo(`nextEndOf(end=5, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(3598995);
      logInfo(`${BUNDLE}NextEndOf_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0136
     * @tc.name      WindowManage_NextEndOf_0136
     * @tc.desc      nextEndOf(end=10, current=1000, previous=-1, density=3) returns 3013
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0136 begin`);
      const actual: number = nextEndOf(10, 1000, -1, 3);
      logInfo(`nextEndOf(end=10, current=1000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(3013);
      logInfo(`${BUNDLE}NextEndOf_0136 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0137
     * @tc.name      WindowManage_NextEndOf_0137
     * @tc.desc      nextEndOf(end=3, current=60000, previous=0, density=1) returns 60003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0137 begin`);
      const actual: number = nextEndOf(3, 60000, 0, 1);
      logInfo(`nextEndOf(end=3, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(60003);
      logInfo(`${BUNDLE}NextEndOf_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0138
     * @tc.name      WindowManage_NextEndOf_0138
     * @tc.desc      nextEndOf(end=3, current=61000, previous=100, density=3) returns 182703
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0138 begin`);
      const actual: number = nextEndOf(3, 61000, 100, 3);
      logInfo(`nextEndOf(end=3, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(182703);
      logInfo(`${BUNDLE}NextEndOf_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0139
     * @tc.name      WindowManage_NextEndOf_0139
     * @tc.desc      nextEndOf(end=2, current=999, previous=1, density=2) returns 1998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0139 begin`);
      const actual: number = nextEndOf(2, 999, 1, 2);
      logInfo(`nextEndOf(end=2, current=999, previous=1,...: actual=${actual}`);
      expect(actual).assertEqual(1998);
      logInfo(`${BUNDLE}NextEndOf_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0140
     * @tc.name      WindowManage_NextEndOf_0140
     * @tc.desc      nextEndOf(end=5, current=59999, previous=10, density=10) returns 599895
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0140 begin`);
      const actual: number = nextEndOf(5, 59999, 10, 10);
      logInfo(`nextEndOf(end=5, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(599895);
      logInfo(`${BUNDLE}NextEndOf_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0141
     * @tc.name      WindowManage_NextEndOf_0141
     * @tc.desc      nextEndOf(end=0, current=60000, previous=3, density=2) returns 119994
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0141 begin`);
      const actual: number = nextEndOf(0, 60000, 3, 2);
      logInfo(`nextEndOf(end=0, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(119994);
      logInfo(`${BUNDLE}NextEndOf_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0142
     * @tc.name      WindowManage_NextEndOf_0142
     * @tc.desc      nextEndOf(end=2, current=60000, previous=100, density=10) returns 599002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0142 begin`);
      const actual: number = nextEndOf(2, 60000, 100, 10);
      logInfo(`nextEndOf(end=2, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(599002);
      logInfo(`${BUNDLE}NextEndOf_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0143
     * @tc.name      WindowManage_NextEndOf_0143
     * @tc.desc      nextEndOf(end=5, current=999, previous=100, density=10) returns 8995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0143 begin`);
      const actual: number = nextEndOf(5, 999, 100, 10);
      logInfo(`nextEndOf(end=5, current=999, previous=10...: actual=${actual}`);
      expect(actual).assertEqual(8995);
      logInfo(`${BUNDLE}NextEndOf_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0144
     * @tc.name      WindowManage_NextEndOf_0144
     * @tc.desc      nextEndOf(end=10, current=500, previous=10, density=10) returns 4910
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0144 begin`);
      const actual: number = nextEndOf(10, 500, 10, 10);
      logInfo(`nextEndOf(end=10, current=500, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(4910);
      logInfo(`${BUNDLE}NextEndOf_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0145
     * @tc.name      WindowManage_NextEndOf_0145
     * @tc.desc      nextEndOf(end=100, current=999, previous=1, density=100) returns 99900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0145 begin`);
      const actual: number = nextEndOf(100, 999, 1, 100);
      logInfo(`nextEndOf(end=100, current=999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(99900);
      logInfo(`${BUNDLE}NextEndOf_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0146
     * @tc.name      WindowManage_NextEndOf_0146
     * @tc.desc      nextEndOf(end=100, current=1000, previous=-1, density=-1) returns -901
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0146 begin`);
      const actual: number = nextEndOf(100, 1000, -1, -1);
      logInfo(`nextEndOf(end=100, current=1000, previous...: actual=${actual}`);
      expect(actual).assertEqual(-901);
      logInfo(`${BUNDLE}NextEndOf_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0147
     * @tc.name      WindowManage_NextEndOf_0147
     * @tc.desc      nextEndOf(end=5, current=60000, previous=3, density=10) returns 599975
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0147 begin`);
      const actual: number = nextEndOf(5, 60000, 3, 10);
      logInfo(`nextEndOf(end=5, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(599975);
      logInfo(`${BUNDLE}NextEndOf_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0148
     * @tc.name      WindowManage_NextEndOf_0148
     * @tc.desc      nextEndOf(end=100, current=59999, previous=5, density=100) returns 5999500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0148 begin`);
      const actual: number = nextEndOf(100, 59999, 5, 100);
      logInfo(`nextEndOf(end=100, current=59999, previou...: actual=${actual}`);
      expect(actual).assertEqual(5999500);
      logInfo(`${BUNDLE}NextEndOf_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0149
     * @tc.name      WindowManage_NextEndOf_0149
     * @tc.desc      nextEndOf(end=2, current=59999, previous=5, density=-1) returns -59992
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0149 begin`);
      const actual: number = nextEndOf(2, 59999, 5, -1);
      logInfo(`nextEndOf(end=2, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(-59992);
      logInfo(`${BUNDLE}NextEndOf_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0150
     * @tc.name      WindowManage_NextEndOf_0150
     * @tc.desc      nextEndOf(end=3, current=59999, previous=3, density=3) returns 179991
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0150 begin`);
      const actual: number = nextEndOf(3, 59999, 3, 3);
      logInfo(`nextEndOf(end=3, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(179991);
      logInfo(`${BUNDLE}NextEndOf_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0151
     * @tc.name      WindowManage_NextEndOf_0151
     * @tc.desc      nextEndOf(end=3, current=61000, previous=3, density=100) returns 6099703
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0151 begin`);
      const actual: number = nextEndOf(3, 61000, 3, 100);
      logInfo(`nextEndOf(end=3, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(6099703);
      logInfo(`${BUNDLE}NextEndOf_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0152
     * @tc.name      WindowManage_NextEndOf_0152
     * @tc.desc      nextEndOf(end=1, current=59999, previous=3, density=1) returns 59997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0152 begin`);
      const actual: number = nextEndOf(1, 59999, 3, 1);
      logInfo(`nextEndOf(end=1, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(59997);
      logInfo(`${BUNDLE}NextEndOf_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0153
     * @tc.name      WindowManage_NextEndOf_0153
     * @tc.desc      nextEndOf(end=0, current=61000, previous=3, density=5) returns 304985
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0153 begin`);
      const actual: number = nextEndOf(0, 61000, 3, 5);
      logInfo(`nextEndOf(end=0, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(304985);
      logInfo(`${BUNDLE}NextEndOf_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0154
     * @tc.name      WindowManage_NextEndOf_0154
     * @tc.desc      nextEndOf(end=3, current=999, previous=-1, density=1) returns 1003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0154 begin`);
      const actual: number = nextEndOf(3, 999, -1, 1);
      logInfo(`nextEndOf(end=3, current=999, previous=-1...: actual=${actual}`);
      expect(actual).assertEqual(1003);
      logInfo(`${BUNDLE}NextEndOf_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0155
     * @tc.name      WindowManage_NextEndOf_0155
     * @tc.desc      nextEndOf(end=-1, current=500, previous=-1, density=10) returns 5009
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0155 begin`);
      const actual: number = nextEndOf(-1, 500, -1, 10);
      logInfo(`nextEndOf(end=-1, current=500, previous=-...: actual=${actual}`);
      expect(actual).assertEqual(5009);
      logInfo(`${BUNDLE}NextEndOf_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0156
     * @tc.name      WindowManage_NextEndOf_0156
     * @tc.desc      nextEndOf(end=1, current=59999, previous=5, density=3) returns 179983
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0156 begin`);
      const actual: number = nextEndOf(1, 59999, 5, 3);
      logInfo(`nextEndOf(end=1, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(179983);
      logInfo(`${BUNDLE}NextEndOf_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0157
     * @tc.name      WindowManage_NextEndOf_0157
     * @tc.desc      nextEndOf(end=-1, current=0, previous=10, density=3) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0157 begin`);
      const actual: number = nextEndOf(-1, 0, 10, 3);
      logInfo(`nextEndOf(end=-1, current=0, previous=10,...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}NextEndOf_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0158
     * @tc.name      WindowManage_NextEndOf_0158
     * @tc.desc      nextEndOf(end=1, current=61000, previous=2, density=10) returns 609981
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0158 begin`);
      const actual: number = nextEndOf(1, 61000, 2, 10);
      logInfo(`nextEndOf(end=1, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(609981);
      logInfo(`${BUNDLE}NextEndOf_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0159
     * @tc.name      WindowManage_NextEndOf_0159
     * @tc.desc      nextEndOf(end=10, current=60000, previous=10, density=100) returns 5999010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0159 begin`);
      const actual: number = nextEndOf(10, 60000, 10, 100);
      logInfo(`nextEndOf(end=10, current=60000, previous...: actual=${actual}`);
      expect(actual).assertEqual(5999010);
      logInfo(`${BUNDLE}NextEndOf_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0160
     * @tc.name      WindowManage_NextEndOf_0160
     * @tc.desc      nextEndOf(end=10, current=1000, previous=0, density=3) returns 3010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0160 begin`);
      const actual: number = nextEndOf(10, 1000, 0, 3);
      logInfo(`nextEndOf(end=10, current=1000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(3010);
      logInfo(`${BUNDLE}NextEndOf_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0161
     * @tc.name      WindowManage_NextEndOf_0161
     * @tc.desc      nextEndOf(end=-1, current=999, previous=1, density=2) returns 1995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0161 begin`);
      const actual: number = nextEndOf(-1, 999, 1, 2);
      logInfo(`nextEndOf(end=-1, current=999, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(1995);
      logInfo(`${BUNDLE}NextEndOf_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0162
     * @tc.name      WindowManage_NextEndOf_0162
     * @tc.desc      nextEndOf(end=2, current=500, previous=100, density=10) returns 4002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0162 begin`);
      const actual: number = nextEndOf(2, 500, 100, 10);
      logInfo(`nextEndOf(end=2, current=500, previous=10...: actual=${actual}`);
      expect(actual).assertEqual(4002);
      logInfo(`${BUNDLE}NextEndOf_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0163
     * @tc.name      WindowManage_NextEndOf_0163
     * @tc.desc      nextEndOf(end=3, current=500, previous=5, density=2) returns 993
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0163 begin`);
      const actual: number = nextEndOf(3, 500, 5, 2);
      logInfo(`nextEndOf(end=3, current=500, previous=5,...: actual=${actual}`);
      expect(actual).assertEqual(993);
      logInfo(`${BUNDLE}NextEndOf_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0164
     * @tc.name      WindowManage_NextEndOf_0164
     * @tc.desc      nextEndOf(end=-1, current=61000, previous=1, density=100) returns 6099899
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0164 begin`);
      const actual: number = nextEndOf(-1, 61000, 1, 100);
      logInfo(`nextEndOf(end=-1, current=61000, previous...: actual=${actual}`);
      expect(actual).assertEqual(6099899);
      logInfo(`${BUNDLE}NextEndOf_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0165
     * @tc.name      WindowManage_NextEndOf_0165
     * @tc.desc      nextEndOf(end=0, current=60000, previous=100, density=3) returns 179700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0165 begin`);
      const actual: number = nextEndOf(0, 60000, 100, 3);
      logInfo(`nextEndOf(end=0, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(179700);
      logInfo(`${BUNDLE}NextEndOf_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0166
     * @tc.name      WindowManage_NextEndOf_0166
     * @tc.desc      nextEndOf(end=3, current=0, previous=2, density=3) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0166 begin`);
      const actual: number = nextEndOf(3, 0, 2, 3);
      logInfo(`nextEndOf(end=3, current=0, previous=2, d...: actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}NextEndOf_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0167
     * @tc.name      WindowManage_NextEndOf_0167
     * @tc.desc      nextEndOf(end=100, current=3599000, previous=5, density=1) returns 3599095
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0167 begin`);
      const actual: number = nextEndOf(100, 3599000, 5, 1);
      logInfo(`nextEndOf(end=100, current=3599000, previ...: actual=${actual}`);
      expect(actual).assertEqual(3599095);
      logInfo(`${BUNDLE}NextEndOf_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0168
     * @tc.name      WindowManage_NextEndOf_0168
     * @tc.desc      nextEndOf(end=10, current=3599000, previous=2, density=-1) returns -3598988
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0168 begin`);
      const actual: number = nextEndOf(10, 3599000, 2, -1);
      logInfo(`nextEndOf(end=10, current=3599000, previo...: actual=${actual}`);
      expect(actual).assertEqual(-3598988);
      logInfo(`${BUNDLE}NextEndOf_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0169
     * @tc.name      WindowManage_NextEndOf_0169
     * @tc.desc      nextEndOf(end=2, current=60000, previous=0, density=1) returns 60002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0169 begin`);
      const actual: number = nextEndOf(2, 60000, 0, 1);
      logInfo(`nextEndOf(end=2, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(60002);
      logInfo(`${BUNDLE}NextEndOf_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0170
     * @tc.name      WindowManage_NextEndOf_0170
     * @tc.desc      nextEndOf(end=100, current=0, previous=5, density=3) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0170 begin`);
      const actual: number = nextEndOf(100, 0, 5, 3);
      logInfo(`nextEndOf(end=100, current=0, previous=5,...: actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}NextEndOf_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0171
     * @tc.name      WindowManage_NextEndOf_0171
     * @tc.desc      nextEndOf(end=1, current=500, previous=10, density=3) returns 1471
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0171 begin`);
      const actual: number = nextEndOf(1, 500, 10, 3);
      logInfo(`nextEndOf(end=1, current=500, previous=10...: actual=${actual}`);
      expect(actual).assertEqual(1471);
      logInfo(`${BUNDLE}NextEndOf_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0172
     * @tc.name      WindowManage_NextEndOf_0172
     * @tc.desc      nextEndOf(end=2, current=3599000, previous=100, density=3) returns 10796702
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0172 begin`);
      const actual: number = nextEndOf(2, 3599000, 100, 3);
      logInfo(`nextEndOf(end=2, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(10796702);
      logInfo(`${BUNDLE}NextEndOf_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0173
     * @tc.name      WindowManage_NextEndOf_0173
     * @tc.desc      nextEndOf(end=2, current=61000, previous=0, density=1) returns 61002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0173 begin`);
      const actual: number = nextEndOf(2, 61000, 0, 1);
      logInfo(`nextEndOf(end=2, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(61002);
      logInfo(`${BUNDLE}NextEndOf_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0174
     * @tc.name      WindowManage_NextEndOf_0174
     * @tc.desc      nextEndOf(end=1, current=60000, previous=100, density=3) returns 179701
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0174 begin`);
      const actual: number = nextEndOf(1, 60000, 100, 3);
      logInfo(`nextEndOf(end=1, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(179701);
      logInfo(`${BUNDLE}NextEndOf_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0175
     * @tc.name      WindowManage_NextEndOf_0175
     * @tc.desc      nextEndOf(end=3, current=59999, previous=2, density=100) returns 5999703
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0175 begin`);
      const actual: number = nextEndOf(3, 59999, 2, 100);
      logInfo(`nextEndOf(end=3, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(5999703);
      logInfo(`${BUNDLE}NextEndOf_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0176
     * @tc.name      WindowManage_NextEndOf_0176
     * @tc.desc      nextEndOf(end=2, current=59999, previous=1, density=10) returns 599982
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0176 begin`);
      const actual: number = nextEndOf(2, 59999, 1, 10);
      logInfo(`nextEndOf(end=2, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(599982);
      logInfo(`${BUNDLE}NextEndOf_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0177
     * @tc.name      WindowManage_NextEndOf_0177
     * @tc.desc      nextEndOf(end=1, current=1000, previous=5, density=3) returns 2986
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0177 begin`);
      const actual: number = nextEndOf(1, 1000, 5, 3);
      logInfo(`nextEndOf(end=1, current=1000, previous=5...: actual=${actual}`);
      expect(actual).assertEqual(2986);
      logInfo(`${BUNDLE}NextEndOf_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0178
     * @tc.name      WindowManage_NextEndOf_0178
     * @tc.desc      nextEndOf(end=10, current=500, previous=2, density=3) returns 1504
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0178 begin`);
      const actual: number = nextEndOf(10, 500, 2, 3);
      logInfo(`nextEndOf(end=10, current=500, previous=2...: actual=${actual}`);
      expect(actual).assertEqual(1504);
      logInfo(`${BUNDLE}NextEndOf_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0179
     * @tc.name      WindowManage_NextEndOf_0179
     * @tc.desc      nextEndOf(end=5, current=1000, previous=3, density=1) returns 1002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0179 begin`);
      const actual: number = nextEndOf(5, 1000, 3, 1);
      logInfo(`nextEndOf(end=5, current=1000, previous=3...: actual=${actual}`);
      expect(actual).assertEqual(1002);
      logInfo(`${BUNDLE}NextEndOf_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0180
     * @tc.name      WindowManage_NextEndOf_0180
     * @tc.desc      nextEndOf(end=100, current=60000, previous=3, density=5) returns 300085
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0180 begin`);
      const actual: number = nextEndOf(100, 60000, 3, 5);
      logInfo(`nextEndOf(end=100, current=60000, previou...: actual=${actual}`);
      expect(actual).assertEqual(300085);
      logInfo(`${BUNDLE}NextEndOf_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0181
     * @tc.name      WindowManage_NextEndOf_0181
     * @tc.desc      nextEndOf(end=-1, current=3599000, previous=2, density=3) returns 10796993
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0181 begin`);
      const actual: number = nextEndOf(-1, 3599000, 2, 3);
      logInfo(`nextEndOf(end=-1, current=3599000, previo...: actual=${actual}`);
      expect(actual).assertEqual(10796993);
      logInfo(`${BUNDLE}NextEndOf_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0182
     * @tc.name      WindowManage_NextEndOf_0182
     * @tc.desc      nextEndOf(end=100, current=61000, previous=0, density=2) returns 122100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0182 begin`);
      const actual: number = nextEndOf(100, 61000, 0, 2);
      logInfo(`nextEndOf(end=100, current=61000, previou...: actual=${actual}`);
      expect(actual).assertEqual(122100);
      logInfo(`${BUNDLE}NextEndOf_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0183
     * @tc.name      WindowManage_NextEndOf_0183
     * @tc.desc      nextEndOf(end=10, current=1000, previous=-1, density=100) returns 100110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0183 begin`);
      const actual: number = nextEndOf(10, 1000, -1, 100);
      logInfo(`nextEndOf(end=10, current=1000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(100110);
      logInfo(`${BUNDLE}NextEndOf_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0184
     * @tc.name      WindowManage_NextEndOf_0184
     * @tc.desc      nextEndOf(end=2, current=0, previous=10, density=-1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0184 begin`);
      const actual: number = nextEndOf(2, 0, 10, -1);
      logInfo(`nextEndOf(end=2, current=0, previous=10, ...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}NextEndOf_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0185
     * @tc.name      WindowManage_NextEndOf_0185
     * @tc.desc      nextEndOf(end=100, current=59999, previous=100, density=2) returns 119898
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0185 begin`);
      const actual: number = nextEndOf(100, 59999, 100, 2);
      logInfo(`nextEndOf(end=100, current=59999, previou...: actual=${actual}`);
      expect(actual).assertEqual(119898);
      logInfo(`${BUNDLE}NextEndOf_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0186
     * @tc.name      WindowManage_NextEndOf_0186
     * @tc.desc      nextEndOf(end=1, current=3599000, previous=5, density=1) returns 3598996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0186 begin`);
      const actual: number = nextEndOf(1, 3599000, 5, 1);
      logInfo(`nextEndOf(end=1, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(3598996);
      logInfo(`${BUNDLE}NextEndOf_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0187
     * @tc.name      WindowManage_NextEndOf_0187
     * @tc.desc      nextEndOf(end=100, current=0, previous=5, density=1) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0187 begin`);
      const actual: number = nextEndOf(100, 0, 5, 1);
      logInfo(`nextEndOf(end=100, current=0, previous=5,...: actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}NextEndOf_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0188
     * @tc.name      WindowManage_NextEndOf_0188
     * @tc.desc      nextEndOf(end=10, current=500, previous=0, density=-1) returns -490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0188 begin`);
      const actual: number = nextEndOf(10, 500, 0, -1);
      logInfo(`nextEndOf(end=10, current=500, previous=0...: actual=${actual}`);
      expect(actual).assertEqual(-490);
      logInfo(`${BUNDLE}NextEndOf_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0189
     * @tc.name      WindowManage_NextEndOf_0189
     * @tc.desc      nextEndOf(end=1, current=59999, previous=10, density=-1) returns -59988
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0189 begin`);
      const actual: number = nextEndOf(1, 59999, 10, -1);
      logInfo(`nextEndOf(end=1, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(-59988);
      logInfo(`${BUNDLE}NextEndOf_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0190
     * @tc.name      WindowManage_NextEndOf_0190
     * @tc.desc      nextEndOf(end=2, current=3599000, previous=2, density=2) returns 7197998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0190 begin`);
      const actual: number = nextEndOf(2, 3599000, 2, 2);
      logInfo(`nextEndOf(end=2, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(7197998);
      logInfo(`${BUNDLE}NextEndOf_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0191
     * @tc.name      WindowManage_NextEndOf_0191
     * @tc.desc      nextEndOf(end=5, current=500, previous=-1, density=1) returns 506
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0191 begin`);
      const actual: number = nextEndOf(5, 500, -1, 1);
      logInfo(`nextEndOf(end=5, current=500, previous=-1...: actual=${actual}`);
      expect(actual).assertEqual(506);
      logInfo(`${BUNDLE}NextEndOf_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0192
     * @tc.name      WindowManage_NextEndOf_0192
     * @tc.desc      nextEndOf(end=100, current=60000, previous=2, density=10) returns 600080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0192 begin`);
      const actual: number = nextEndOf(100, 60000, 2, 10);
      logInfo(`nextEndOf(end=100, current=60000, previou...: actual=${actual}`);
      expect(actual).assertEqual(600080);
      logInfo(`${BUNDLE}NextEndOf_0192 end`);
    });
  });
}
