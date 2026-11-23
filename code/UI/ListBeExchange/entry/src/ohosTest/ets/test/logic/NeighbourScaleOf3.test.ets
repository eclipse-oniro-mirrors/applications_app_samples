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
import { neighbourScaleOf } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for neighbourScaleOf (58 cases). */
export default function neighbourScaleOf3Test(): void {
  describe('NeighbourScaleOf3Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0193
     * @tc.name      ListBeExchange_NeighbourScaleOf_0193
     * @tc.desc      neighbourScaleOf(isNext=false, direction=3, shrinkScale=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0193 begin`);
      const actual: number = neighbourScaleOf(false, 3, 0);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0193 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0194
     * @tc.name      ListBeExchange_NeighbourScaleOf_0194
     * @tc.desc      neighbourScaleOf(isNext=false, direction=3, shrinkScale=0.25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0194 begin`);
      const actual: number = neighbourScaleOf(false, 3, 0.25);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0194 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0195
     * @tc.name      ListBeExchange_NeighbourScaleOf_0195
     * @tc.desc      neighbourScaleOf(isNext=false, direction=3, shrinkScale=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0195 begin`);
      const actual: number = neighbourScaleOf(false, 3, -1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0195 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0196
     * @tc.name      ListBeExchange_NeighbourScaleOf_0196
     * @tc.desc      neighbourScaleOf(isNext=false, direction=3, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0196 begin`);
      const actual: number = neighbourScaleOf(false, 3, 1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0196 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0197
     * @tc.name      ListBeExchange_NeighbourScaleOf_0197
     * @tc.desc      neighbourScaleOf(isNext=false, direction=3, shrinkScale=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0197 begin`);
      const actual: number = neighbourScaleOf(false, 3, 2);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0197 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0198
     * @tc.name      ListBeExchange_NeighbourScaleOf_0198
     * @tc.desc      neighbourScaleOf(isNext=false, direction=3, shrinkScale=0.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0198 begin`);
      const actual: number = neighbourScaleOf(false, 3, 0.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0198 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0199
     * @tc.name      ListBeExchange_NeighbourScaleOf_0199
     * @tc.desc      neighbourScaleOf(isNext=false, direction=3, shrinkScale=1.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0199 begin`);
      const actual: number = neighbourScaleOf(false, 3, 1.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0199 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0200
     * @tc.name      ListBeExchange_NeighbourScaleOf_0200
     * @tc.desc      neighbourScaleOf(isNext=false, direction=3, shrinkScale=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0200 begin`);
      const actual: number = neighbourScaleOf(false, 3, 3);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0200 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0201
     * @tc.name      ListBeExchange_NeighbourScaleOf_0201
     * @tc.desc      neighbourScaleOf(isNext=false, direction=3, shrinkScale=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0201 begin`);
      const actual: number = neighbourScaleOf(false, 3, 10);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0201 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0202
     * @tc.name      ListBeExchange_NeighbourScaleOf_0202
     * @tc.desc      neighbourScaleOf(isNext=false, direction=3, shrinkScale=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0202 begin`);
      const actual: number = neighbourScaleOf(false, 3, 100);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0202 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0203
     * @tc.name      ListBeExchange_NeighbourScaleOf_0203
     * @tc.desc      neighbourScaleOf(isNext=false, direction=3, shrinkScale=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0203 begin`);
      const actual: number = neighbourScaleOf(false, 3, 5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0203 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0204
     * @tc.name      ListBeExchange_NeighbourScaleOf_0204
     * @tc.desc      neighbourScaleOf(isNext=false, direction=3, shrinkScale=-18) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0204 begin`);
      const actual: number = neighbourScaleOf(false, 3, -18);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0204 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0205
     * @tc.name      ListBeExchange_NeighbourScaleOf_0205
     * @tc.desc      neighbourScaleOf(isNext=false, direction=10, shrinkScale=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0205 begin`);
      const actual: number = neighbourScaleOf(false, 10, 0);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0205 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0206
     * @tc.name      ListBeExchange_NeighbourScaleOf_0206
     * @tc.desc      neighbourScaleOf(isNext=false, direction=10, shrinkScale=0.25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0206 begin`);
      const actual: number = neighbourScaleOf(false, 10, 0.25);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0206 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0207
     * @tc.name      ListBeExchange_NeighbourScaleOf_0207
     * @tc.desc      neighbourScaleOf(isNext=false, direction=10, shrinkScale=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0207 begin`);
      const actual: number = neighbourScaleOf(false, 10, -1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0207 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0208
     * @tc.name      ListBeExchange_NeighbourScaleOf_0208
     * @tc.desc      neighbourScaleOf(isNext=false, direction=10, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0208 begin`);
      const actual: number = neighbourScaleOf(false, 10, 1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0208 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0209
     * @tc.name      ListBeExchange_NeighbourScaleOf_0209
     * @tc.desc      neighbourScaleOf(isNext=false, direction=10, shrinkScale=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0209 begin`);
      const actual: number = neighbourScaleOf(false, 10, 2);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0209 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0210
     * @tc.name      ListBeExchange_NeighbourScaleOf_0210
     * @tc.desc      neighbourScaleOf(isNext=false, direction=10, shrinkScale=0.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0210 begin`);
      const actual: number = neighbourScaleOf(false, 10, 0.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0210 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0211
     * @tc.name      ListBeExchange_NeighbourScaleOf_0211
     * @tc.desc      neighbourScaleOf(isNext=false, direction=10, shrinkScale=1.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0211 begin`);
      const actual: number = neighbourScaleOf(false, 10, 1.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0211 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0212
     * @tc.name      ListBeExchange_NeighbourScaleOf_0212
     * @tc.desc      neighbourScaleOf(isNext=false, direction=10, shrinkScale=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0212 begin`);
      const actual: number = neighbourScaleOf(false, 10, 3);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0212 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0213
     * @tc.name      ListBeExchange_NeighbourScaleOf_0213
     * @tc.desc      neighbourScaleOf(isNext=false, direction=10, shrinkScale=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0213 begin`);
      const actual: number = neighbourScaleOf(false, 10, 10);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0213 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0214
     * @tc.name      ListBeExchange_NeighbourScaleOf_0214
     * @tc.desc      neighbourScaleOf(isNext=false, direction=10, shrinkScale=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0214 begin`);
      const actual: number = neighbourScaleOf(false, 10, 100);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0214 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0215
     * @tc.name      ListBeExchange_NeighbourScaleOf_0215
     * @tc.desc      neighbourScaleOf(isNext=false, direction=10, shrinkScale=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0215 begin`);
      const actual: number = neighbourScaleOf(false, 10, 5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0215 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0216
     * @tc.name      ListBeExchange_NeighbourScaleOf_0216
     * @tc.desc      neighbourScaleOf(isNext=false, direction=10, shrinkScale=-18) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0216 begin`);
      const actual: number = neighbourScaleOf(false, 10, -18);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0216 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0217
     * @tc.name      ListBeExchange_NeighbourScaleOf_0217
     * @tc.desc      neighbourScaleOf(isNext=false, direction=100, shrinkScale=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0217 begin`);
      const actual: number = neighbourScaleOf(false, 100, 0);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0217 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0218
     * @tc.name      ListBeExchange_NeighbourScaleOf_0218
     * @tc.desc      neighbourScaleOf(isNext=false, direction=100, shrinkScale=0.25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0218 begin`);
      const actual: number = neighbourScaleOf(false, 100, 0.25);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0218 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0219
     * @tc.name      ListBeExchange_NeighbourScaleOf_0219
     * @tc.desc      neighbourScaleOf(isNext=false, direction=100, shrinkScale=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0219 begin`);
      const actual: number = neighbourScaleOf(false, 100, -1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0219 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0220
     * @tc.name      ListBeExchange_NeighbourScaleOf_0220
     * @tc.desc      neighbourScaleOf(isNext=false, direction=100, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0220 begin`);
      const actual: number = neighbourScaleOf(false, 100, 1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0220 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0221
     * @tc.name      ListBeExchange_NeighbourScaleOf_0221
     * @tc.desc      neighbourScaleOf(isNext=false, direction=100, shrinkScale=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0221 begin`);
      const actual: number = neighbourScaleOf(false, 100, 2);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0221 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0222
     * @tc.name      ListBeExchange_NeighbourScaleOf_0222
     * @tc.desc      neighbourScaleOf(isNext=false, direction=100, shrinkScale=0.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0222 begin`);
      const actual: number = neighbourScaleOf(false, 100, 0.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0222 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0223
     * @tc.name      ListBeExchange_NeighbourScaleOf_0223
     * @tc.desc      neighbourScaleOf(isNext=false, direction=100, shrinkScale=1.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0223 begin`);
      const actual: number = neighbourScaleOf(false, 100, 1.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0223 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0224
     * @tc.name      ListBeExchange_NeighbourScaleOf_0224
     * @tc.desc      neighbourScaleOf(isNext=false, direction=100, shrinkScale=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0224 begin`);
      const actual: number = neighbourScaleOf(false, 100, 3);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0224 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0225
     * @tc.name      ListBeExchange_NeighbourScaleOf_0225
     * @tc.desc      neighbourScaleOf(isNext=false, direction=100, shrinkScale=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0225 begin`);
      const actual: number = neighbourScaleOf(false, 100, 10);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0225 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0226
     * @tc.name      ListBeExchange_NeighbourScaleOf_0226
     * @tc.desc      neighbourScaleOf(isNext=false, direction=100, shrinkScale=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0226 begin`);
      const actual: number = neighbourScaleOf(false, 100, 100);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0226 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0227
     * @tc.name      ListBeExchange_NeighbourScaleOf_0227
     * @tc.desc      neighbourScaleOf(isNext=false, direction=100, shrinkScale=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0227 begin`);
      const actual: number = neighbourScaleOf(false, 100, 5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0227 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0228
     * @tc.name      ListBeExchange_NeighbourScaleOf_0228
     * @tc.desc      neighbourScaleOf(isNext=false, direction=100, shrinkScale=-18) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0228 begin`);
      const actual: number = neighbourScaleOf(false, 100, -18);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0228 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0229
     * @tc.name      ListBeExchange_NeighbourScaleOf_0229
     * @tc.desc      neighbourScaleOf(isNext=false, direction=5, shrinkScale=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0229 begin`);
      const actual: number = neighbourScaleOf(false, 5, 0);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0229 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0230
     * @tc.name      ListBeExchange_NeighbourScaleOf_0230
     * @tc.desc      neighbourScaleOf(isNext=false, direction=5, shrinkScale=0.25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0230 begin`);
      const actual: number = neighbourScaleOf(false, 5, 0.25);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0230 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0231
     * @tc.name      ListBeExchange_NeighbourScaleOf_0231
     * @tc.desc      neighbourScaleOf(isNext=false, direction=5, shrinkScale=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0231 begin`);
      const actual: number = neighbourScaleOf(false, 5, -1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0231 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0232
     * @tc.name      ListBeExchange_NeighbourScaleOf_0232
     * @tc.desc      neighbourScaleOf(isNext=false, direction=5, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0232 begin`);
      const actual: number = neighbourScaleOf(false, 5, 1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0232 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0233
     * @tc.name      ListBeExchange_NeighbourScaleOf_0233
     * @tc.desc      neighbourScaleOf(isNext=false, direction=5, shrinkScale=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0233 begin`);
      const actual: number = neighbourScaleOf(false, 5, 2);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0233 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0234
     * @tc.name      ListBeExchange_NeighbourScaleOf_0234
     * @tc.desc      neighbourScaleOf(isNext=false, direction=5, shrinkScale=0.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0234 begin`);
      const actual: number = neighbourScaleOf(false, 5, 0.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0234 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0235
     * @tc.name      ListBeExchange_NeighbourScaleOf_0235
     * @tc.desc      neighbourScaleOf(isNext=false, direction=5, shrinkScale=1.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0235 begin`);
      const actual: number = neighbourScaleOf(false, 5, 1.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0235 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0236
     * @tc.name      ListBeExchange_NeighbourScaleOf_0236
     * @tc.desc      neighbourScaleOf(isNext=false, direction=5, shrinkScale=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0236 begin`);
      const actual: number = neighbourScaleOf(false, 5, 3);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0236 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0237
     * @tc.name      ListBeExchange_NeighbourScaleOf_0237
     * @tc.desc      neighbourScaleOf(isNext=false, direction=5, shrinkScale=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0237 begin`);
      const actual: number = neighbourScaleOf(false, 5, 10);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0237 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0238
     * @tc.name      ListBeExchange_NeighbourScaleOf_0238
     * @tc.desc      neighbourScaleOf(isNext=false, direction=5, shrinkScale=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0238 begin`);
      const actual: number = neighbourScaleOf(false, 5, 100);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0238 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0239
     * @tc.name      ListBeExchange_NeighbourScaleOf_0239
     * @tc.desc      neighbourScaleOf(isNext=false, direction=5, shrinkScale=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0239 begin`);
      const actual: number = neighbourScaleOf(false, 5, 5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0239 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0240
     * @tc.name      ListBeExchange_NeighbourScaleOf_0240
     * @tc.desc      neighbourScaleOf(isNext=false, direction=5, shrinkScale=-18) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0240 begin`);
      const actual: number = neighbourScaleOf(false, 5, -18);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0240 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0241
     * @tc.name      ListBeExchange_NeighbourScaleOf_0241
     * @tc.desc      neighbourScaleOf(isNext=false, direction=15, shrinkScale=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0241 begin`);
      const actual: number = neighbourScaleOf(false, 15, 0);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0241 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0242
     * @tc.name      ListBeExchange_NeighbourScaleOf_0242
     * @tc.desc      neighbourScaleOf(isNext=false, direction=15, shrinkScale=0.25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0242 begin`);
      const actual: number = neighbourScaleOf(false, 15, 0.25);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0242 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0243
     * @tc.name      ListBeExchange_NeighbourScaleOf_0243
     * @tc.desc      neighbourScaleOf(isNext=false, direction=15, shrinkScale=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0243 begin`);
      const actual: number = neighbourScaleOf(false, 15, -1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0243 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0244
     * @tc.name      ListBeExchange_NeighbourScaleOf_0244
     * @tc.desc      neighbourScaleOf(isNext=false, direction=15, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0244 begin`);
      const actual: number = neighbourScaleOf(false, 15, 1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0244 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0245
     * @tc.name      ListBeExchange_NeighbourScaleOf_0245
     * @tc.desc      neighbourScaleOf(isNext=false, direction=15, shrinkScale=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0245 begin`);
      const actual: number = neighbourScaleOf(false, 15, 2);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0245 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0246
     * @tc.name      ListBeExchange_NeighbourScaleOf_0246
     * @tc.desc      neighbourScaleOf(isNext=false, direction=15, shrinkScale=0.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0246 begin`);
      const actual: number = neighbourScaleOf(false, 15, 0.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0246 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0247
     * @tc.name      ListBeExchange_NeighbourScaleOf_0247
     * @tc.desc      neighbourScaleOf(isNext=false, direction=15, shrinkScale=1.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0247 begin`);
      const actual: number = neighbourScaleOf(false, 15, 1.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0247 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0248
     * @tc.name      ListBeExchange_NeighbourScaleOf_0248
     * @tc.desc      neighbourScaleOf(isNext=false, direction=15, shrinkScale=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0248 begin`);
      const actual: number = neighbourScaleOf(false, 15, 3);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0248 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0249
     * @tc.name      ListBeExchange_NeighbourScaleOf_0249
     * @tc.desc      neighbourScaleOf(isNext=false, direction=15, shrinkScale=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0249 begin`);
      const actual: number = neighbourScaleOf(false, 15, 10);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0249 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0250
     * @tc.name      ListBeExchange_NeighbourScaleOf_0250
     * @tc.desc      neighbourScaleOf(isNext=false, direction=15, shrinkScale=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0250 begin`);
      const actual: number = neighbourScaleOf(false, 15, 100);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0250 end`);
    });
  });
}
