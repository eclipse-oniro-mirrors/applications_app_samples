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

/** Logic checks for nextEndOf (51 cases). */
export default function nextEndOf3Test(): void {
  describe('NextEndOf3Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0193
     * @tc.name      WindowManage_NextEndOf_0193
     * @tc.desc      nextEndOf(end=3, current=61000, previous=2, density=5) returns 304993
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0193 begin`);
      const actual: number = nextEndOf(3, 61000, 2, 5);
      logInfo(`nextEndOf(end=3, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(304993);
      logInfo(`${BUNDLE}NextEndOf_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0194
     * @tc.name      WindowManage_NextEndOf_0194
     * @tc.desc      nextEndOf(end=3, current=59999, previous=5, density=10) returns 599943
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0194 begin`);
      const actual: number = nextEndOf(3, 59999, 5, 10);
      logInfo(`nextEndOf(end=3, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(599943);
      logInfo(`${BUNDLE}NextEndOf_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0195
     * @tc.name      WindowManage_NextEndOf_0195
     * @tc.desc      nextEndOf(end=100, current=61000, previous=-1, density=10) returns 610110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0195 begin`);
      const actual: number = nextEndOf(100, 61000, -1, 10);
      logInfo(`nextEndOf(end=100, current=61000, previou...: actual=${actual}`);
      expect(actual).assertEqual(610110);
      logInfo(`${BUNDLE}NextEndOf_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0196
     * @tc.name      WindowManage_NextEndOf_0196
     * @tc.desc      nextEndOf(end=3, current=3599000, previous=1, density=5) returns 17994998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0196 begin`);
      const actual: number = nextEndOf(3, 3599000, 1, 5);
      logInfo(`nextEndOf(end=3, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(17994998);
      logInfo(`${BUNDLE}NextEndOf_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0197
     * @tc.name      WindowManage_NextEndOf_0197
     * @tc.desc      nextEndOf(end=100, current=0, previous=3, density=10) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0197 begin`);
      const actual: number = nextEndOf(100, 0, 3, 10);
      logInfo(`nextEndOf(end=100, current=0, previous=3,...: actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}NextEndOf_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0198
     * @tc.name      WindowManage_NextEndOf_0198
     * @tc.desc      nextEndOf(end=2, current=61000, previous=0, density=100) returns 6100002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0198 begin`);
      const actual: number = nextEndOf(2, 61000, 0, 100);
      logInfo(`nextEndOf(end=2, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(6100002);
      logInfo(`${BUNDLE}NextEndOf_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0199
     * @tc.name      WindowManage_NextEndOf_0199
     * @tc.desc      nextEndOf(end=10, current=999, previous=10, density=2) returns 1988
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0199 begin`);
      const actual: number = nextEndOf(10, 999, 10, 2);
      logInfo(`nextEndOf(end=10, current=999, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(1988);
      logInfo(`${BUNDLE}NextEndOf_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0200
     * @tc.name      WindowManage_NextEndOf_0200
     * @tc.desc      nextEndOf(end=3, current=59999, previous=3, density=2) returns 119995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0200 begin`);
      const actual: number = nextEndOf(3, 59999, 3, 2);
      logInfo(`nextEndOf(end=3, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(119995);
      logInfo(`${BUNDLE}NextEndOf_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0201
     * @tc.name      WindowManage_NextEndOf_0201
     * @tc.desc      nextEndOf(end=1, current=3599000, previous=3, density=10) returns 35989971
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0201 begin`);
      const actual: number = nextEndOf(1, 3599000, 3, 10);
      logInfo(`nextEndOf(end=1, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(35989971);
      logInfo(`${BUNDLE}NextEndOf_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0202
     * @tc.name      WindowManage_NextEndOf_0202
     * @tc.desc      nextEndOf(end=0, current=1000, previous=0, density=2) returns 2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0202 begin`);
      const actual: number = nextEndOf(0, 1000, 0, 2);
      logInfo(`nextEndOf(end=0, current=1000, previous=0...: actual=${actual}`);
      expect(actual).assertEqual(2000);
      logInfo(`${BUNDLE}NextEndOf_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0203
     * @tc.name      WindowManage_NextEndOf_0203
     * @tc.desc      nextEndOf(end=-1, current=60000, previous=3, density=5) returns 299984
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0203 begin`);
      const actual: number = nextEndOf(-1, 60000, 3, 5);
      logInfo(`nextEndOf(end=-1, current=60000, previous...: actual=${actual}`);
      expect(actual).assertEqual(299984);
      logInfo(`${BUNDLE}NextEndOf_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0204
     * @tc.name      WindowManage_NextEndOf_0204
     * @tc.desc      nextEndOf(end=3, current=61000, previous=3, density=5) returns 304988
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0204 begin`);
      const actual: number = nextEndOf(3, 61000, 3, 5);
      logInfo(`nextEndOf(end=3, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(304988);
      logInfo(`${BUNDLE}NextEndOf_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0205
     * @tc.name      WindowManage_NextEndOf_0205
     * @tc.desc      nextEndOf(end=5, current=61000, previous=-1, density=100) returns 6100105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0205 begin`);
      const actual: number = nextEndOf(5, 61000, -1, 100);
      logInfo(`nextEndOf(end=5, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(6100105);
      logInfo(`${BUNDLE}NextEndOf_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0206
     * @tc.name      WindowManage_NextEndOf_0206
     * @tc.desc      nextEndOf(end=0, current=0, previous=10, density=10) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0206 begin`);
      const actual: number = nextEndOf(0, 0, 10, 10);
      logInfo(`nextEndOf(end=0, current=0, previous=10, ...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}NextEndOf_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0207
     * @tc.name      WindowManage_NextEndOf_0207
     * @tc.desc      nextEndOf(end=0, current=3599000, previous=-1, density=3) returns 10797003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0207 begin`);
      const actual: number = nextEndOf(0, 3599000, -1, 3);
      logInfo(`nextEndOf(end=0, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(10797003);
      logInfo(`${BUNDLE}NextEndOf_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0208
     * @tc.name      WindowManage_NextEndOf_0208
     * @tc.desc      nextEndOf(end=100, current=999, previous=3, density=10) returns 10060
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0208 begin`);
      const actual: number = nextEndOf(100, 999, 3, 10);
      logInfo(`nextEndOf(end=100, current=999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(10060);
      logInfo(`${BUNDLE}NextEndOf_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0209
     * @tc.name      WindowManage_NextEndOf_0209
     * @tc.desc      nextEndOf(end=100, current=999, previous=3, density=2) returns 2092
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0209 begin`);
      const actual: number = nextEndOf(100, 999, 3, 2);
      logInfo(`nextEndOf(end=100, current=999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(2092);
      logInfo(`${BUNDLE}NextEndOf_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0210
     * @tc.name      WindowManage_NextEndOf_0210
     * @tc.desc      nextEndOf(end=2, current=0, previous=10, density=100) returns -998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0210 begin`);
      const actual: number = nextEndOf(2, 0, 10, 100);
      logInfo(`nextEndOf(end=2, current=0, previous=10, ...: actual=${actual}`);
      expect(actual).assertEqual(-998);
      logInfo(`${BUNDLE}NextEndOf_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0211
     * @tc.name      WindowManage_NextEndOf_0211
     * @tc.desc      nextEndOf(end=3, current=59999, previous=1, density=1) returns 60001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0211 begin`);
      const actual: number = nextEndOf(3, 59999, 1, 1);
      logInfo(`nextEndOf(end=3, current=59999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(60001);
      logInfo(`${BUNDLE}NextEndOf_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0212
     * @tc.name      WindowManage_NextEndOf_0212
     * @tc.desc      nextEndOf(end=1, current=500, previous=0, density=10) returns 5001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0212 begin`);
      const actual: number = nextEndOf(1, 500, 0, 10);
      logInfo(`nextEndOf(end=1, current=500, previous=0,...: actual=${actual}`);
      expect(actual).assertEqual(5001);
      logInfo(`${BUNDLE}NextEndOf_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0213
     * @tc.name      WindowManage_NextEndOf_0213
     * @tc.desc      nextEndOf(end=2, current=500, previous=2, density=-1) returns -496
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0213 begin`);
      const actual: number = nextEndOf(2, 500, 2, -1);
      logInfo(`nextEndOf(end=2, current=500, previous=2,...: actual=${actual}`);
      expect(actual).assertEqual(-496);
      logInfo(`${BUNDLE}NextEndOf_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0214
     * @tc.name      WindowManage_NextEndOf_0214
     * @tc.desc      nextEndOf(end=2, current=0, previous=10, density=2) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0214 begin`);
      const actual: number = nextEndOf(2, 0, 10, 2);
      logInfo(`nextEndOf(end=2, current=0, previous=10, ...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NextEndOf_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0215
     * @tc.name      WindowManage_NextEndOf_0215
     * @tc.desc      nextEndOf(end=10, current=60000, previous=2, density=2) returns 120006
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0215 begin`);
      const actual: number = nextEndOf(10, 60000, 2, 2);
      logInfo(`nextEndOf(end=10, current=60000, previous...: actual=${actual}`);
      expect(actual).assertEqual(120006);
      logInfo(`${BUNDLE}NextEndOf_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0216
     * @tc.name      WindowManage_NextEndOf_0216
     * @tc.desc      nextEndOf(end=0, current=60000, previous=10, density=2) returns 119980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0216 begin`);
      const actual: number = nextEndOf(0, 60000, 10, 2);
      logInfo(`nextEndOf(end=0, current=60000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(119980);
      logInfo(`${BUNDLE}NextEndOf_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0217
     * @tc.name      WindowManage_NextEndOf_0217
     * @tc.desc      nextEndOf(end=100, current=999, previous=-1, density=5) returns 5100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0217 begin`);
      const actual: number = nextEndOf(100, 999, -1, 5);
      logInfo(`nextEndOf(end=100, current=999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(5100);
      logInfo(`${BUNDLE}NextEndOf_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0218
     * @tc.name      WindowManage_NextEndOf_0218
     * @tc.desc      nextEndOf(end=5, current=61000, previous=10, density=100) returns 6099005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0218 begin`);
      const actual: number = nextEndOf(5, 61000, 10, 100);
      logInfo(`nextEndOf(end=5, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(6099005);
      logInfo(`${BUNDLE}NextEndOf_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0219
     * @tc.name      WindowManage_NextEndOf_0219
     * @tc.desc      nextEndOf(end=1, current=999, previous=0, density=10) returns 9991
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0219 begin`);
      const actual: number = nextEndOf(1, 999, 0, 10);
      logInfo(`nextEndOf(end=1, current=999, previous=0,...: actual=${actual}`);
      expect(actual).assertEqual(9991);
      logInfo(`${BUNDLE}NextEndOf_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0220
     * @tc.name      WindowManage_NextEndOf_0220
     * @tc.desc      nextEndOf(end=100, current=60000, previous=10, density=2) returns 120080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0220 begin`);
      const actual: number = nextEndOf(100, 60000, 10, 2);
      logInfo(`nextEndOf(end=100, current=60000, previou...: actual=${actual}`);
      expect(actual).assertEqual(120080);
      logInfo(`${BUNDLE}NextEndOf_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0221
     * @tc.name      WindowManage_NextEndOf_0221
     * @tc.desc      nextEndOf(end=0, current=3599000, previous=-1, density=-1) returns -3599001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0221 begin`);
      const actual: number = nextEndOf(0, 3599000, -1, -1);
      logInfo(`nextEndOf(end=0, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(-3599001);
      logInfo(`${BUNDLE}NextEndOf_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0222
     * @tc.name      WindowManage_NextEndOf_0222
     * @tc.desc      nextEndOf(end=10, current=999, previous=-1, density=100) returns 100010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0222 begin`);
      const actual: number = nextEndOf(10, 999, -1, 100);
      logInfo(`nextEndOf(end=10, current=999, previous=-...: actual=${actual}`);
      expect(actual).assertEqual(100010);
      logInfo(`${BUNDLE}NextEndOf_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0223
     * @tc.name      WindowManage_NextEndOf_0223
     * @tc.desc      nextEndOf(end=3, current=1000, previous=5, density=-1) returns -992
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0223 begin`);
      const actual: number = nextEndOf(3, 1000, 5, -1);
      logInfo(`nextEndOf(end=3, current=1000, previous=5...: actual=${actual}`);
      expect(actual).assertEqual(-992);
      logInfo(`${BUNDLE}NextEndOf_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0224
     * @tc.name      WindowManage_NextEndOf_0224
     * @tc.desc      nextEndOf(end=100, current=1000, previous=0, density=1) returns 1100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0224 begin`);
      const actual: number = nextEndOf(100, 1000, 0, 1);
      logInfo(`nextEndOf(end=100, current=1000, previous...: actual=${actual}`);
      expect(actual).assertEqual(1100);
      logInfo(`${BUNDLE}NextEndOf_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0225
     * @tc.name      WindowManage_NextEndOf_0225
     * @tc.desc      nextEndOf(end=5, current=3599000, previous=1, density=10) returns 35989995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0225 begin`);
      const actual: number = nextEndOf(5, 3599000, 1, 10);
      logInfo(`nextEndOf(end=5, current=3599000, previou...: actual=${actual}`);
      expect(actual).assertEqual(35989995);
      logInfo(`${BUNDLE}NextEndOf_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0226
     * @tc.name      WindowManage_NextEndOf_0226
     * @tc.desc      nextEndOf(end=-1, current=3599000, previous=-1, density=3) returns 10797002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0226 begin`);
      const actual: number = nextEndOf(-1, 3599000, -1, 3);
      logInfo(`nextEndOf(end=-1, current=3599000, previo...: actual=${actual}`);
      expect(actual).assertEqual(10797002);
      logInfo(`${BUNDLE}NextEndOf_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0227
     * @tc.name      WindowManage_NextEndOf_0227
     * @tc.desc      nextEndOf(end=-1, current=999, previous=100, density=100) returns 89899
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0227 begin`);
      const actual: number = nextEndOf(-1, 999, 100, 100);
      logInfo(`nextEndOf(end=-1, current=999, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(89899);
      logInfo(`${BUNDLE}NextEndOf_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0228
     * @tc.name      WindowManage_NextEndOf_0228
     * @tc.desc      nextEndOf(end=100, current=999, previous=100, density=-1) returns -799
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0228 begin`);
      const actual: number = nextEndOf(100, 999, 100, -1);
      logInfo(`nextEndOf(end=100, current=999, previous=...: actual=${actual}`);
      expect(actual).assertEqual(-799);
      logInfo(`${BUNDLE}NextEndOf_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0229
     * @tc.name      WindowManage_NextEndOf_0229
     * @tc.desc      nextEndOf(end=2, current=999, previous=3, density=100) returns 99602
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0229 begin`);
      const actual: number = nextEndOf(2, 999, 3, 100);
      logInfo(`nextEndOf(end=2, current=999, previous=3,...: actual=${actual}`);
      expect(actual).assertEqual(99602);
      logInfo(`${BUNDLE}NextEndOf_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0230
     * @tc.name      WindowManage_NextEndOf_0230
     * @tc.desc      nextEndOf(end=3, current=61000, previous=-1, density=1) returns 61004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0230 begin`);
      const actual: number = nextEndOf(3, 61000, -1, 1);
      logInfo(`nextEndOf(end=3, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(61004);
      logInfo(`${BUNDLE}NextEndOf_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0231
     * @tc.name      WindowManage_NextEndOf_0231
     * @tc.desc      nextEndOf(end=0, current=500, previous=1, density=3) returns 1497
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0231 begin`);
      const actual: number = nextEndOf(0, 500, 1, 3);
      logInfo(`nextEndOf(end=0, current=500, previous=1,...: actual=${actual}`);
      expect(actual).assertEqual(1497);
      logInfo(`${BUNDLE}NextEndOf_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0232
     * @tc.name      WindowManage_NextEndOf_0232
     * @tc.desc      nextEndOf(end=10, current=999, previous=2, density=2) returns 2004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0232 begin`);
      const actual: number = nextEndOf(10, 999, 2, 2);
      logInfo(`nextEndOf(end=10, current=999, previous=2...: actual=${actual}`);
      expect(actual).assertEqual(2004);
      logInfo(`${BUNDLE}NextEndOf_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0233
     * @tc.name      WindowManage_NextEndOf_0233
     * @tc.desc      nextEndOf(end=1, current=1000, previous=2, density=3) returns 2995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0233 begin`);
      const actual: number = nextEndOf(1, 1000, 2, 3);
      logInfo(`nextEndOf(end=1, current=1000, previous=2...: actual=${actual}`);
      expect(actual).assertEqual(2995);
      logInfo(`${BUNDLE}NextEndOf_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0234
     * @tc.name      WindowManage_NextEndOf_0234
     * @tc.desc      nextEndOf(end=1, current=1000, previous=100, density=-1) returns -899
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0234 begin`);
      const actual: number = nextEndOf(1, 1000, 100, -1);
      logInfo(`nextEndOf(end=1, current=1000, previous=1...: actual=${actual}`);
      expect(actual).assertEqual(-899);
      logInfo(`${BUNDLE}NextEndOf_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0235
     * @tc.name      WindowManage_NextEndOf_0235
     * @tc.desc      nextEndOf(end=100, current=3599000, previous=-1, density=-1) returns -3598901
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0235 begin`);
      const actual: number = nextEndOf(100, 3599000, -1, -1);
      logInfo(`nextEndOf(end=100, current=3599000, previ...: actual=${actual}`);
      expect(actual).assertEqual(-3598901);
      logInfo(`${BUNDLE}NextEndOf_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0236
     * @tc.name      WindowManage_NextEndOf_0236
     * @tc.desc      nextEndOf(end=5, current=61000, previous=2, density=5) returns 304995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0236 begin`);
      const actual: number = nextEndOf(5, 61000, 2, 5);
      logInfo(`nextEndOf(end=5, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(304995);
      logInfo(`${BUNDLE}NextEndOf_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0237
     * @tc.name      WindowManage_NextEndOf_0237
     * @tc.desc      nextEndOf(end=3, current=61000, previous=2, density=1) returns 61001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0237 begin`);
      const actual: number = nextEndOf(3, 61000, 2, 1);
      logInfo(`nextEndOf(end=3, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(61001);
      logInfo(`${BUNDLE}NextEndOf_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0238
     * @tc.name      WindowManage_NextEndOf_0238
     * @tc.desc      nextEndOf(end=-1, current=3599000, previous=5, density=10) returns 35989949
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0238 begin`);
      const actual: number = nextEndOf(-1, 3599000, 5, 10);
      logInfo(`nextEndOf(end=-1, current=3599000, previo...: actual=${actual}`);
      expect(actual).assertEqual(35989949);
      logInfo(`${BUNDLE}NextEndOf_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0239
     * @tc.name      WindowManage_NextEndOf_0239
     * @tc.desc      nextEndOf(end=0, current=500, previous=3, density=100) returns 49700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0239 begin`);
      const actual: number = nextEndOf(0, 500, 3, 100);
      logInfo(`nextEndOf(end=0, current=500, previous=3,...: actual=${actual}`);
      expect(actual).assertEqual(49700);
      logInfo(`${BUNDLE}NextEndOf_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0240
     * @tc.name      WindowManage_NextEndOf_0240
     * @tc.desc      nextEndOf(end=5, current=61000, previous=1, density=3) returns 183002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_NextEndOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0240 begin`);
      const actual: number = nextEndOf(5, 61000, 1, 3);
      logInfo(`nextEndOf(end=5, current=61000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(183002);
      logInfo(`${BUNDLE}NextEndOf_0240 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0241
     * @tc.name      WindowManage_NextEndOf_0241
     * @tc.desc      nextEndOf(end=-1, current=1000, previous=5, density=1) returns 994
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0241 begin`);
      const actual: number = nextEndOf(-1, 1000, 5, 1);
      logInfo(`nextEndOf(end=-1, current=1000, previous=...: actual=${actual}`);
      expect(actual).assertEqual(994);
      logInfo(`${BUNDLE}NextEndOf_0241 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0242
     * @tc.name      WindowManage_NextEndOf_0242
     * @tc.desc      nextEndOf(end=-1, current=60000, previous=1, density=2) returns 119997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0242 begin`);
      const actual: number = nextEndOf(-1, 60000, 1, 2);
      logInfo(`nextEndOf(end=-1, current=60000, previous...: actual=${actual}`);
      expect(actual).assertEqual(119997);
      logInfo(`${BUNDLE}NextEndOf_0242 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_NEXT_END_OF_0243
     * @tc.name      WindowManage_NextEndOf_0243
     * @tc.desc      nextEndOf(end=100, current=1000, previous=-1, density=3) returns 3103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_NextEndOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextEndOf_0243 begin`);
      const actual: number = nextEndOf(100, 1000, -1, 3);
      logInfo(`nextEndOf(end=100, current=1000, previous...: actual=${actual}`);
      expect(actual).assertEqual(3103);
      logInfo(`${BUNDLE}NextEndOf_0243 end`);
    });
  });
}
