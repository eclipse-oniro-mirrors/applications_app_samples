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
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for neighbourScaleOf (96 cases). */
export default function neighbourScaleOfTest(): void {
  describe('NeighbourScaleOfTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0001
     * @tc.name      ListBeExchange_NeighbourScaleOf_0001
     * @tc.desc      neighbourScaleOf(isNext=true, direction=0, shrinkScale=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_NeighbourScaleOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0001 begin`);
      const actual: number = neighbourScaleOf(true, 0, 0);
      logInfo(`neighbourScaleOf(isNext=true, direction=0...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0002
     * @tc.name      ListBeExchange_NeighbourScaleOf_0002
     * @tc.desc      neighbourScaleOf(isNext=true, direction=1, shrinkScale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_NeighbourScaleOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0002 begin`);
      const actual: number = neighbourScaleOf(true, 1, 0);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NeighbourScaleOf_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0003
     * @tc.name      ListBeExchange_NeighbourScaleOf_0003
     * @tc.desc      neighbourScaleOf(isNext=true, direction=1, shrinkScale=0.25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0003 begin`);
      const actual: number = neighbourScaleOf(true, 1, 0.25);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0004
     * @tc.name      ListBeExchange_NeighbourScaleOf_0004
     * @tc.desc      neighbourScaleOf(isNext=true, direction=1, shrinkScale=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0004 begin`);
      const actual: number = neighbourScaleOf(true, 1, -1);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0005
     * @tc.name      ListBeExchange_NeighbourScaleOf_0005
     * @tc.desc      neighbourScaleOf(isNext=true, direction=1, shrinkScale=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0005 begin`);
      const actual: number = neighbourScaleOf(true, 1, 2);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NeighbourScaleOf_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0006
     * @tc.name      ListBeExchange_NeighbourScaleOf_0006
     * @tc.desc      neighbourScaleOf(isNext=true, direction=1, shrinkScale=0.5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0006 begin`);
      const actual: number = neighbourScaleOf(true, 1, 0.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0007
     * @tc.name      ListBeExchange_NeighbourScaleOf_0007
     * @tc.desc      neighbourScaleOf(isNext=true, direction=1, shrinkScale=1.5) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0007 begin`);
      const actual: number = neighbourScaleOf(true, 1, 1.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0008
     * @tc.name      ListBeExchange_NeighbourScaleOf_0008
     * @tc.desc      neighbourScaleOf(isNext=true, direction=1, shrinkScale=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0008 begin`);
      const actual: number = neighbourScaleOf(true, 1, 3);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NeighbourScaleOf_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0009
     * @tc.name      ListBeExchange_NeighbourScaleOf_0009
     * @tc.desc      neighbourScaleOf(isNext=true, direction=1, shrinkScale=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0009 begin`);
      const actual: number = neighbourScaleOf(true, 1, 10);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NeighbourScaleOf_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0010
     * @tc.name      ListBeExchange_NeighbourScaleOf_0010
     * @tc.desc      neighbourScaleOf(isNext=true, direction=1, shrinkScale=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0010 begin`);
      const actual: number = neighbourScaleOf(true, 1, 100);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NeighbourScaleOf_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0011
     * @tc.name      ListBeExchange_NeighbourScaleOf_0011
     * @tc.desc      neighbourScaleOf(isNext=true, direction=1, shrinkScale=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0011 begin`);
      const actual: number = neighbourScaleOf(true, 1, 5);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NeighbourScaleOf_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0012
     * @tc.name      ListBeExchange_NeighbourScaleOf_0012
     * @tc.desc      neighbourScaleOf(isNext=true, direction=1, shrinkScale=-18) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0012 begin`);
      const actual: number = neighbourScaleOf(true, 1, -18);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NeighbourScaleOf_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0013
     * @tc.name      ListBeExchange_NeighbourScaleOf_0013
     * @tc.desc      neighbourScaleOf(isNext=true, direction=0, shrinkScale=0.25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0013 begin`);
      const actual: number = neighbourScaleOf(true, 0, 0.25);
      logInfo(`neighbourScaleOf(isNext=true, direction=0...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0014
     * @tc.name      ListBeExchange_NeighbourScaleOf_0014
     * @tc.desc      neighbourScaleOf(isNext=true, direction=0, shrinkScale=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0014 begin`);
      const actual: number = neighbourScaleOf(true, 0, -1);
      logInfo(`neighbourScaleOf(isNext=true, direction=0...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0015
     * @tc.name      ListBeExchange_NeighbourScaleOf_0015
     * @tc.desc      neighbourScaleOf(isNext=true, direction=0, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0015 begin`);
      const actual: number = neighbourScaleOf(true, 0, 1);
      logInfo(`neighbourScaleOf(isNext=true, direction=0...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0016
     * @tc.name      ListBeExchange_NeighbourScaleOf_0016
     * @tc.desc      neighbourScaleOf(isNext=true, direction=0, shrinkScale=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0016 begin`);
      const actual: number = neighbourScaleOf(true, 0, 2);
      logInfo(`neighbourScaleOf(isNext=true, direction=0...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0017
     * @tc.name      ListBeExchange_NeighbourScaleOf_0017
     * @tc.desc      neighbourScaleOf(isNext=true, direction=0, shrinkScale=0.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0017 begin`);
      const actual: number = neighbourScaleOf(true, 0, 0.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=0...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0018
     * @tc.name      ListBeExchange_NeighbourScaleOf_0018
     * @tc.desc      neighbourScaleOf(isNext=true, direction=0, shrinkScale=1.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0018 begin`);
      const actual: number = neighbourScaleOf(true, 0, 1.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=0...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0019
     * @tc.name      ListBeExchange_NeighbourScaleOf_0019
     * @tc.desc      neighbourScaleOf(isNext=true, direction=0, shrinkScale=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0019 begin`);
      const actual: number = neighbourScaleOf(true, 0, 3);
      logInfo(`neighbourScaleOf(isNext=true, direction=0...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0020
     * @tc.name      ListBeExchange_NeighbourScaleOf_0020
     * @tc.desc      neighbourScaleOf(isNext=true, direction=0, shrinkScale=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0020 begin`);
      const actual: number = neighbourScaleOf(true, 0, 10);
      logInfo(`neighbourScaleOf(isNext=true, direction=0...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0021
     * @tc.name      ListBeExchange_NeighbourScaleOf_0021
     * @tc.desc      neighbourScaleOf(isNext=true, direction=0, shrinkScale=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0021 begin`);
      const actual: number = neighbourScaleOf(true, 0, 100);
      logInfo(`neighbourScaleOf(isNext=true, direction=0...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0022
     * @tc.name      ListBeExchange_NeighbourScaleOf_0022
     * @tc.desc      neighbourScaleOf(isNext=true, direction=0, shrinkScale=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0022 begin`);
      const actual: number = neighbourScaleOf(true, 0, 5);
      logInfo(`neighbourScaleOf(isNext=true, direction=0...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0023
     * @tc.name      ListBeExchange_NeighbourScaleOf_0023
     * @tc.desc      neighbourScaleOf(isNext=true, direction=0, shrinkScale=-18) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0023 begin`);
      const actual: number = neighbourScaleOf(true, 0, -18);
      logInfo(`neighbourScaleOf(isNext=true, direction=0...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0024
     * @tc.name      ListBeExchange_NeighbourScaleOf_0024
     * @tc.desc      neighbourScaleOf(isNext=true, direction=-1, shrinkScale=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0024 begin`);
      const actual: number = neighbourScaleOf(true, -1, 0);
      logInfo(`neighbourScaleOf(isNext=true, direction=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0025
     * @tc.name      ListBeExchange_NeighbourScaleOf_0025
     * @tc.desc      neighbourScaleOf(isNext=true, direction=-1, shrinkScale=0.25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0025 begin`);
      const actual: number = neighbourScaleOf(true, -1, 0.25);
      logInfo(`neighbourScaleOf(isNext=true, direction=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0026
     * @tc.name      ListBeExchange_NeighbourScaleOf_0026
     * @tc.desc      neighbourScaleOf(isNext=true, direction=-1, shrinkScale=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0026 begin`);
      const actual: number = neighbourScaleOf(true, -1, -1);
      logInfo(`neighbourScaleOf(isNext=true, direction=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0027
     * @tc.name      ListBeExchange_NeighbourScaleOf_0027
     * @tc.desc      neighbourScaleOf(isNext=true, direction=-1, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0027 begin`);
      const actual: number = neighbourScaleOf(true, -1, 1);
      logInfo(`neighbourScaleOf(isNext=true, direction=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0028
     * @tc.name      ListBeExchange_NeighbourScaleOf_0028
     * @tc.desc      neighbourScaleOf(isNext=true, direction=-1, shrinkScale=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0028 begin`);
      const actual: number = neighbourScaleOf(true, -1, 2);
      logInfo(`neighbourScaleOf(isNext=true, direction=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0029
     * @tc.name      ListBeExchange_NeighbourScaleOf_0029
     * @tc.desc      neighbourScaleOf(isNext=true, direction=-1, shrinkScale=0.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0029 begin`);
      const actual: number = neighbourScaleOf(true, -1, 0.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0030
     * @tc.name      ListBeExchange_NeighbourScaleOf_0030
     * @tc.desc      neighbourScaleOf(isNext=true, direction=-1, shrinkScale=1.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0030 begin`);
      const actual: number = neighbourScaleOf(true, -1, 1.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0030 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0031
     * @tc.name      ListBeExchange_NeighbourScaleOf_0031
     * @tc.desc      neighbourScaleOf(isNext=true, direction=-1, shrinkScale=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0031 begin`);
      const actual: number = neighbourScaleOf(true, -1, 3);
      logInfo(`neighbourScaleOf(isNext=true, direction=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0031 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0032
     * @tc.name      ListBeExchange_NeighbourScaleOf_0032
     * @tc.desc      neighbourScaleOf(isNext=true, direction=-1, shrinkScale=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0032 begin`);
      const actual: number = neighbourScaleOf(true, -1, 10);
      logInfo(`neighbourScaleOf(isNext=true, direction=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0032 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0033
     * @tc.name      ListBeExchange_NeighbourScaleOf_0033
     * @tc.desc      neighbourScaleOf(isNext=true, direction=-1, shrinkScale=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0033 begin`);
      const actual: number = neighbourScaleOf(true, -1, 100);
      logInfo(`neighbourScaleOf(isNext=true, direction=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0033 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0034
     * @tc.name      ListBeExchange_NeighbourScaleOf_0034
     * @tc.desc      neighbourScaleOf(isNext=true, direction=-1, shrinkScale=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0034 begin`);
      const actual: number = neighbourScaleOf(true, -1, 5);
      logInfo(`neighbourScaleOf(isNext=true, direction=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0034 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0035
     * @tc.name      ListBeExchange_NeighbourScaleOf_0035
     * @tc.desc      neighbourScaleOf(isNext=true, direction=-1, shrinkScale=-18) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0035 begin`);
      const actual: number = neighbourScaleOf(true, -1, -18);
      logInfo(`neighbourScaleOf(isNext=true, direction=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0035 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0036
     * @tc.name      ListBeExchange_NeighbourScaleOf_0036
     * @tc.desc      neighbourScaleOf(isNext=true, direction=1, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0036 begin`);
      const actual: number = neighbourScaleOf(true, 1, 1);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0036 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0037
     * @tc.name      ListBeExchange_NeighbourScaleOf_0037
     * @tc.desc      neighbourScaleOf(isNext=true, direction=2, shrinkScale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0037 begin`);
      const actual: number = neighbourScaleOf(true, 2, 0);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NeighbourScaleOf_0037 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0038
     * @tc.name      ListBeExchange_NeighbourScaleOf_0038
     * @tc.desc      neighbourScaleOf(isNext=true, direction=2, shrinkScale=0.25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0038 begin`);
      const actual: number = neighbourScaleOf(true, 2, 0.25);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0038 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0039
     * @tc.name      ListBeExchange_NeighbourScaleOf_0039
     * @tc.desc      neighbourScaleOf(isNext=true, direction=2, shrinkScale=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0039 begin`);
      const actual: number = neighbourScaleOf(true, 2, -1);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0039 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0040
     * @tc.name      ListBeExchange_NeighbourScaleOf_0040
     * @tc.desc      neighbourScaleOf(isNext=true, direction=2, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0040 begin`);
      const actual: number = neighbourScaleOf(true, 2, 1);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0040 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0041
     * @tc.name      ListBeExchange_NeighbourScaleOf_0041
     * @tc.desc      neighbourScaleOf(isNext=true, direction=2, shrinkScale=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0041 begin`);
      const actual: number = neighbourScaleOf(true, 2, 2);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NeighbourScaleOf_0041 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0042
     * @tc.name      ListBeExchange_NeighbourScaleOf_0042
     * @tc.desc      neighbourScaleOf(isNext=true, direction=2, shrinkScale=0.5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0042 begin`);
      const actual: number = neighbourScaleOf(true, 2, 0.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0042 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0043
     * @tc.name      ListBeExchange_NeighbourScaleOf_0043
     * @tc.desc      neighbourScaleOf(isNext=true, direction=2, shrinkScale=1.5) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0043 begin`);
      const actual: number = neighbourScaleOf(true, 2, 1.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0043 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0044
     * @tc.name      ListBeExchange_NeighbourScaleOf_0044
     * @tc.desc      neighbourScaleOf(isNext=true, direction=2, shrinkScale=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0044 begin`);
      const actual: number = neighbourScaleOf(true, 2, 3);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NeighbourScaleOf_0044 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0045
     * @tc.name      ListBeExchange_NeighbourScaleOf_0045
     * @tc.desc      neighbourScaleOf(isNext=true, direction=2, shrinkScale=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0045 begin`);
      const actual: number = neighbourScaleOf(true, 2, 10);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NeighbourScaleOf_0045 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0046
     * @tc.name      ListBeExchange_NeighbourScaleOf_0046
     * @tc.desc      neighbourScaleOf(isNext=true, direction=2, shrinkScale=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0046 begin`);
      const actual: number = neighbourScaleOf(true, 2, 100);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NeighbourScaleOf_0046 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0047
     * @tc.name      ListBeExchange_NeighbourScaleOf_0047
     * @tc.desc      neighbourScaleOf(isNext=true, direction=2, shrinkScale=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0047 begin`);
      const actual: number = neighbourScaleOf(true, 2, 5);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NeighbourScaleOf_0047 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0048
     * @tc.name      ListBeExchange_NeighbourScaleOf_0048
     * @tc.desc      neighbourScaleOf(isNext=true, direction=2, shrinkScale=-18) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0048 begin`);
      const actual: number = neighbourScaleOf(true, 2, -18);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NeighbourScaleOf_0048 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0049
     * @tc.name      ListBeExchange_NeighbourScaleOf_0049
     * @tc.desc      neighbourScaleOf(isNext=true, direction=3, shrinkScale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0049 begin`);
      const actual: number = neighbourScaleOf(true, 3, 0);
      logInfo(`neighbourScaleOf(isNext=true, direction=3...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NeighbourScaleOf_0049 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0050
     * @tc.name      ListBeExchange_NeighbourScaleOf_0050
     * @tc.desc      neighbourScaleOf(isNext=true, direction=3, shrinkScale=0.25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0050 begin`);
      const actual: number = neighbourScaleOf(true, 3, 0.25);
      logInfo(`neighbourScaleOf(isNext=true, direction=3...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0050 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0051
     * @tc.name      ListBeExchange_NeighbourScaleOf_0051
     * @tc.desc      neighbourScaleOf(isNext=true, direction=3, shrinkScale=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0051 begin`);
      const actual: number = neighbourScaleOf(true, 3, -1);
      logInfo(`neighbourScaleOf(isNext=true, direction=3...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0051 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0052
     * @tc.name      ListBeExchange_NeighbourScaleOf_0052
     * @tc.desc      neighbourScaleOf(isNext=true, direction=3, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0052 begin`);
      const actual: number = neighbourScaleOf(true, 3, 1);
      logInfo(`neighbourScaleOf(isNext=true, direction=3...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0052 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0053
     * @tc.name      ListBeExchange_NeighbourScaleOf_0053
     * @tc.desc      neighbourScaleOf(isNext=true, direction=3, shrinkScale=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0053 begin`);
      const actual: number = neighbourScaleOf(true, 3, 2);
      logInfo(`neighbourScaleOf(isNext=true, direction=3...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NeighbourScaleOf_0053 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0054
     * @tc.name      ListBeExchange_NeighbourScaleOf_0054
     * @tc.desc      neighbourScaleOf(isNext=true, direction=3, shrinkScale=0.5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0054 begin`);
      const actual: number = neighbourScaleOf(true, 3, 0.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=3...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0054 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0055
     * @tc.name      ListBeExchange_NeighbourScaleOf_0055
     * @tc.desc      neighbourScaleOf(isNext=true, direction=3, shrinkScale=1.5) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0055 begin`);
      const actual: number = neighbourScaleOf(true, 3, 1.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=3...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0055 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0056
     * @tc.name      ListBeExchange_NeighbourScaleOf_0056
     * @tc.desc      neighbourScaleOf(isNext=true, direction=3, shrinkScale=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0056 begin`);
      const actual: number = neighbourScaleOf(true, 3, 3);
      logInfo(`neighbourScaleOf(isNext=true, direction=3...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NeighbourScaleOf_0056 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0057
     * @tc.name      ListBeExchange_NeighbourScaleOf_0057
     * @tc.desc      neighbourScaleOf(isNext=true, direction=3, shrinkScale=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0057 begin`);
      const actual: number = neighbourScaleOf(true, 3, 10);
      logInfo(`neighbourScaleOf(isNext=true, direction=3...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NeighbourScaleOf_0057 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0058
     * @tc.name      ListBeExchange_NeighbourScaleOf_0058
     * @tc.desc      neighbourScaleOf(isNext=true, direction=3, shrinkScale=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0058 begin`);
      const actual: number = neighbourScaleOf(true, 3, 100);
      logInfo(`neighbourScaleOf(isNext=true, direction=3...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NeighbourScaleOf_0058 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0059
     * @tc.name      ListBeExchange_NeighbourScaleOf_0059
     * @tc.desc      neighbourScaleOf(isNext=true, direction=3, shrinkScale=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0059 begin`);
      const actual: number = neighbourScaleOf(true, 3, 5);
      logInfo(`neighbourScaleOf(isNext=true, direction=3...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NeighbourScaleOf_0059 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0060
     * @tc.name      ListBeExchange_NeighbourScaleOf_0060
     * @tc.desc      neighbourScaleOf(isNext=true, direction=3, shrinkScale=-18) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0060 begin`);
      const actual: number = neighbourScaleOf(true, 3, -18);
      logInfo(`neighbourScaleOf(isNext=true, direction=3...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NeighbourScaleOf_0060 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0061
     * @tc.name      ListBeExchange_NeighbourScaleOf_0061
     * @tc.desc      neighbourScaleOf(isNext=true, direction=10, shrinkScale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0061 begin`);
      const actual: number = neighbourScaleOf(true, 10, 0);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NeighbourScaleOf_0061 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0062
     * @tc.name      ListBeExchange_NeighbourScaleOf_0062
     * @tc.desc      neighbourScaleOf(isNext=true, direction=10, shrinkScale=0.25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0062 begin`);
      const actual: number = neighbourScaleOf(true, 10, 0.25);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0062 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0063
     * @tc.name      ListBeExchange_NeighbourScaleOf_0063
     * @tc.desc      neighbourScaleOf(isNext=true, direction=10, shrinkScale=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0063 begin`);
      const actual: number = neighbourScaleOf(true, 10, -1);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0063 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0064
     * @tc.name      ListBeExchange_NeighbourScaleOf_0064
     * @tc.desc      neighbourScaleOf(isNext=true, direction=10, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0064 begin`);
      const actual: number = neighbourScaleOf(true, 10, 1);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0064 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0065
     * @tc.name      ListBeExchange_NeighbourScaleOf_0065
     * @tc.desc      neighbourScaleOf(isNext=true, direction=10, shrinkScale=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0065 begin`);
      const actual: number = neighbourScaleOf(true, 10, 2);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NeighbourScaleOf_0065 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0066
     * @tc.name      ListBeExchange_NeighbourScaleOf_0066
     * @tc.desc      neighbourScaleOf(isNext=true, direction=10, shrinkScale=0.5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0066 begin`);
      const actual: number = neighbourScaleOf(true, 10, 0.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0066 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0067
     * @tc.name      ListBeExchange_NeighbourScaleOf_0067
     * @tc.desc      neighbourScaleOf(isNext=true, direction=10, shrinkScale=1.5) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0067 begin`);
      const actual: number = neighbourScaleOf(true, 10, 1.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0067 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0068
     * @tc.name      ListBeExchange_NeighbourScaleOf_0068
     * @tc.desc      neighbourScaleOf(isNext=true, direction=10, shrinkScale=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0068 begin`);
      const actual: number = neighbourScaleOf(true, 10, 3);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NeighbourScaleOf_0068 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0069
     * @tc.name      ListBeExchange_NeighbourScaleOf_0069
     * @tc.desc      neighbourScaleOf(isNext=true, direction=10, shrinkScale=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0069 begin`);
      const actual: number = neighbourScaleOf(true, 10, 10);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NeighbourScaleOf_0069 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0070
     * @tc.name      ListBeExchange_NeighbourScaleOf_0070
     * @tc.desc      neighbourScaleOf(isNext=true, direction=10, shrinkScale=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0070 begin`);
      const actual: number = neighbourScaleOf(true, 10, 100);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NeighbourScaleOf_0070 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0071
     * @tc.name      ListBeExchange_NeighbourScaleOf_0071
     * @tc.desc      neighbourScaleOf(isNext=true, direction=10, shrinkScale=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0071 begin`);
      const actual: number = neighbourScaleOf(true, 10, 5);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NeighbourScaleOf_0071 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0072
     * @tc.name      ListBeExchange_NeighbourScaleOf_0072
     * @tc.desc      neighbourScaleOf(isNext=true, direction=10, shrinkScale=-18) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0072 begin`);
      const actual: number = neighbourScaleOf(true, 10, -18);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NeighbourScaleOf_0072 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0073
     * @tc.name      ListBeExchange_NeighbourScaleOf_0073
     * @tc.desc      neighbourScaleOf(isNext=true, direction=100, shrinkScale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0073 begin`);
      const actual: number = neighbourScaleOf(true, 100, 0);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NeighbourScaleOf_0073 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0074
     * @tc.name      ListBeExchange_NeighbourScaleOf_0074
     * @tc.desc      neighbourScaleOf(isNext=true, direction=100, shrinkScale=0.25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0074 begin`);
      const actual: number = neighbourScaleOf(true, 100, 0.25);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0074 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0075
     * @tc.name      ListBeExchange_NeighbourScaleOf_0075
     * @tc.desc      neighbourScaleOf(isNext=true, direction=100, shrinkScale=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0075 begin`);
      const actual: number = neighbourScaleOf(true, 100, -1);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0075 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0076
     * @tc.name      ListBeExchange_NeighbourScaleOf_0076
     * @tc.desc      neighbourScaleOf(isNext=true, direction=100, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0076 begin`);
      const actual: number = neighbourScaleOf(true, 100, 1);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0076 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0077
     * @tc.name      ListBeExchange_NeighbourScaleOf_0077
     * @tc.desc      neighbourScaleOf(isNext=true, direction=100, shrinkScale=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0077 begin`);
      const actual: number = neighbourScaleOf(true, 100, 2);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NeighbourScaleOf_0077 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0078
     * @tc.name      ListBeExchange_NeighbourScaleOf_0078
     * @tc.desc      neighbourScaleOf(isNext=true, direction=100, shrinkScale=0.5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0078 begin`);
      const actual: number = neighbourScaleOf(true, 100, 0.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0078 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0079
     * @tc.name      ListBeExchange_NeighbourScaleOf_0079
     * @tc.desc      neighbourScaleOf(isNext=true, direction=100, shrinkScale=1.5) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0079 begin`);
      const actual: number = neighbourScaleOf(true, 100, 1.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0079 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0080
     * @tc.name      ListBeExchange_NeighbourScaleOf_0080
     * @tc.desc      neighbourScaleOf(isNext=true, direction=100, shrinkScale=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0080 begin`);
      const actual: number = neighbourScaleOf(true, 100, 3);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NeighbourScaleOf_0080 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0081
     * @tc.name      ListBeExchange_NeighbourScaleOf_0081
     * @tc.desc      neighbourScaleOf(isNext=true, direction=100, shrinkScale=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0081 begin`);
      const actual: number = neighbourScaleOf(true, 100, 10);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NeighbourScaleOf_0081 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0082
     * @tc.name      ListBeExchange_NeighbourScaleOf_0082
     * @tc.desc      neighbourScaleOf(isNext=true, direction=100, shrinkScale=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0082 begin`);
      const actual: number = neighbourScaleOf(true, 100, 100);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NeighbourScaleOf_0082 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0083
     * @tc.name      ListBeExchange_NeighbourScaleOf_0083
     * @tc.desc      neighbourScaleOf(isNext=true, direction=100, shrinkScale=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0083 begin`);
      const actual: number = neighbourScaleOf(true, 100, 5);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NeighbourScaleOf_0083 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0084
     * @tc.name      ListBeExchange_NeighbourScaleOf_0084
     * @tc.desc      neighbourScaleOf(isNext=true, direction=100, shrinkScale=-18) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0084 begin`);
      const actual: number = neighbourScaleOf(true, 100, -18);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NeighbourScaleOf_0084 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0085
     * @tc.name      ListBeExchange_NeighbourScaleOf_0085
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5, shrinkScale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0085 begin`);
      const actual: number = neighbourScaleOf(true, 5, 0);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NeighbourScaleOf_0085 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0086
     * @tc.name      ListBeExchange_NeighbourScaleOf_0086
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5, shrinkScale=0.25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0086 begin`);
      const actual: number = neighbourScaleOf(true, 5, 0.25);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0086 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0087
     * @tc.name      ListBeExchange_NeighbourScaleOf_0087
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5, shrinkScale=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0087 begin`);
      const actual: number = neighbourScaleOf(true, 5, -1);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0087 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0088
     * @tc.name      ListBeExchange_NeighbourScaleOf_0088
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0088 begin`);
      const actual: number = neighbourScaleOf(true, 5, 1);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0088 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0089
     * @tc.name      ListBeExchange_NeighbourScaleOf_0089
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5, shrinkScale=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0089 begin`);
      const actual: number = neighbourScaleOf(true, 5, 2);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NeighbourScaleOf_0089 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0090
     * @tc.name      ListBeExchange_NeighbourScaleOf_0090
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5, shrinkScale=0.5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0090 begin`);
      const actual: number = neighbourScaleOf(true, 5, 0.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0090 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0091
     * @tc.name      ListBeExchange_NeighbourScaleOf_0091
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5, shrinkScale=1.5) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0091 begin`);
      const actual: number = neighbourScaleOf(true, 5, 1.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0091 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0092
     * @tc.name      ListBeExchange_NeighbourScaleOf_0092
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5, shrinkScale=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0092 begin`);
      const actual: number = neighbourScaleOf(true, 5, 3);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NeighbourScaleOf_0092 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0093
     * @tc.name      ListBeExchange_NeighbourScaleOf_0093
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5, shrinkScale=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0093 begin`);
      const actual: number = neighbourScaleOf(true, 5, 10);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NeighbourScaleOf_0093 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0094
     * @tc.name      ListBeExchange_NeighbourScaleOf_0094
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5, shrinkScale=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0094 begin`);
      const actual: number = neighbourScaleOf(true, 5, 100);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NeighbourScaleOf_0094 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0095
     * @tc.name      ListBeExchange_NeighbourScaleOf_0095
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5, shrinkScale=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0095 begin`);
      const actual: number = neighbourScaleOf(true, 5, 5);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NeighbourScaleOf_0095 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0096
     * @tc.name      ListBeExchange_NeighbourScaleOf_0096
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5, shrinkScale=-18) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0096 begin`);
      const actual: number = neighbourScaleOf(true, 5, -18);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NeighbourScaleOf_0096 end`);
    });
  });
}
