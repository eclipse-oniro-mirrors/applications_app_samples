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
import { directionOf } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for directionOf (50 cases). */
export default function directionOfTest(): void {
  describe('DirectionOfTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0001
     * @tc.name      ListBeExchange_DirectionOf_0001
     * @tc.desc      directionOf(offsetY=-100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_DirectionOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0001 begin`);
      const actual: number = directionOf(-100);
      logInfo(`directionOf(offsetY=-100): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DirectionOf_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0002
     * @tc.name      ListBeExchange_DirectionOf_0002
     * @tc.desc      directionOf(offsetY=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_DirectionOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0002 begin`);
      const actual: number = directionOf(1);
      logInfo(`directionOf(offsetY=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0003
     * @tc.name      ListBeExchange_DirectionOf_0003
     * @tc.desc      directionOf(offsetY=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_DirectionOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0003 begin`);
      const actual: number = directionOf(-1);
      logInfo(`directionOf(offsetY=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DirectionOf_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0004
     * @tc.name      ListBeExchange_DirectionOf_0004
     * @tc.desc      directionOf(offsetY=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_DirectionOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0004 begin`);
      const actual: number = directionOf(0);
      logInfo(`directionOf(offsetY=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DirectionOf_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0005
     * @tc.name      ListBeExchange_DirectionOf_0005
     * @tc.desc      directionOf(offsetY=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_DirectionOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0005 begin`);
      const actual: number = directionOf(2);
      logInfo(`directionOf(offsetY=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0006
     * @tc.name      ListBeExchange_DirectionOf_0006
     * @tc.desc      directionOf(offsetY=-2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_DirectionOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0006 begin`);
      const actual: number = directionOf(-2);
      logInfo(`directionOf(offsetY=-2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DirectionOf_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0007
     * @tc.name      ListBeExchange_DirectionOf_0007
     * @tc.desc      directionOf(offsetY=50) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0007 begin`);
      const actual: number = directionOf(50);
      logInfo(`directionOf(offsetY=50): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0008
     * @tc.name      ListBeExchange_DirectionOf_0008
     * @tc.desc      directionOf(offsetY=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0008 begin`);
      const actual: number = directionOf(100);
      logInfo(`directionOf(offsetY=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0009
     * @tc.name      ListBeExchange_DirectionOf_0009
     * @tc.desc      directionOf(offsetY=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0009 begin`);
      const actual: number = directionOf(3);
      logInfo(`directionOf(offsetY=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0010
     * @tc.name      ListBeExchange_DirectionOf_0010
     * @tc.desc      directionOf(offsetY=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0010 begin`);
      const actual: number = directionOf(10);
      logInfo(`directionOf(offsetY=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0011
     * @tc.name      ListBeExchange_DirectionOf_0011
     * @tc.desc      directionOf(offsetY=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0011 begin`);
      const actual: number = directionOf(5);
      logInfo(`directionOf(offsetY=5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0012
     * @tc.name      ListBeExchange_DirectionOf_0012
     * @tc.desc      directionOf(offsetY=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0012 begin`);
      const actual: number = directionOf(15);
      logInfo(`directionOf(offsetY=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0013
     * @tc.name      ListBeExchange_DirectionOf_0013
     * @tc.desc      directionOf(offsetY=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0013 begin`);
      const actual: number = directionOf(20);
      logInfo(`directionOf(offsetY=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0014
     * @tc.name      ListBeExchange_DirectionOf_0014
     * @tc.desc      directionOf(offsetY=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0014 begin`);
      const actual: number = directionOf(25);
      logInfo(`directionOf(offsetY=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0015
     * @tc.name      ListBeExchange_DirectionOf_0015
     * @tc.desc      directionOf(offsetY=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0015 begin`);
      const actual: number = directionOf(30);
      logInfo(`directionOf(offsetY=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0016
     * @tc.name      ListBeExchange_DirectionOf_0016
     * @tc.desc      directionOf(offsetY=35) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0016 begin`);
      const actual: number = directionOf(35);
      logInfo(`directionOf(offsetY=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0017
     * @tc.name      ListBeExchange_DirectionOf_0017
     * @tc.desc      directionOf(offsetY=40) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0017 begin`);
      const actual: number = directionOf(40);
      logInfo(`directionOf(offsetY=40): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0018
     * @tc.name      ListBeExchange_DirectionOf_0018
     * @tc.desc      directionOf(offsetY=45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0018 begin`);
      const actual: number = directionOf(45);
      logInfo(`directionOf(offsetY=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0019
     * @tc.name      ListBeExchange_DirectionOf_0019
     * @tc.desc      directionOf(offsetY=55) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0019 begin`);
      const actual: number = directionOf(55);
      logInfo(`directionOf(offsetY=55): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0020
     * @tc.name      ListBeExchange_DirectionOf_0020
     * @tc.desc      directionOf(offsetY=60) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0020 begin`);
      const actual: number = directionOf(60);
      logInfo(`directionOf(offsetY=60): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0021
     * @tc.name      ListBeExchange_DirectionOf_0021
     * @tc.desc      directionOf(offsetY=65) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0021 begin`);
      const actual: number = directionOf(65);
      logInfo(`directionOf(offsetY=65): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0022
     * @tc.name      ListBeExchange_DirectionOf_0022
     * @tc.desc      directionOf(offsetY=70) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0022 begin`);
      const actual: number = directionOf(70);
      logInfo(`directionOf(offsetY=70): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0023
     * @tc.name      ListBeExchange_DirectionOf_0023
     * @tc.desc      directionOf(offsetY=75) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0023 begin`);
      const actual: number = directionOf(75);
      logInfo(`directionOf(offsetY=75): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0024
     * @tc.name      ListBeExchange_DirectionOf_0024
     * @tc.desc      directionOf(offsetY=80) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0024 begin`);
      const actual: number = directionOf(80);
      logInfo(`directionOf(offsetY=80): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0025
     * @tc.name      ListBeExchange_DirectionOf_0025
     * @tc.desc      directionOf(offsetY=85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0025 begin`);
      const actual: number = directionOf(85);
      logInfo(`directionOf(offsetY=85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0026
     * @tc.name      ListBeExchange_DirectionOf_0026
     * @tc.desc      directionOf(offsetY=90) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0026 begin`);
      const actual: number = directionOf(90);
      logInfo(`directionOf(offsetY=90): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0027
     * @tc.name      ListBeExchange_DirectionOf_0027
     * @tc.desc      directionOf(offsetY=95) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0027 begin`);
      const actual: number = directionOf(95);
      logInfo(`directionOf(offsetY=95): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0028
     * @tc.name      ListBeExchange_DirectionOf_0028
     * @tc.desc      directionOf(offsetY=105) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0028 begin`);
      const actual: number = directionOf(105);
      logInfo(`directionOf(offsetY=105): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0029
     * @tc.name      ListBeExchange_DirectionOf_0029
     * @tc.desc      directionOf(offsetY=110) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0029 begin`);
      const actual: number = directionOf(110);
      logInfo(`directionOf(offsetY=110): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0030
     * @tc.name      ListBeExchange_DirectionOf_0030
     * @tc.desc      directionOf(offsetY=115) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0030 begin`);
      const actual: number = directionOf(115);
      logInfo(`directionOf(offsetY=115): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0030 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0031
     * @tc.name      ListBeExchange_DirectionOf_0031
     * @tc.desc      directionOf(offsetY=120) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0031 begin`);
      const actual: number = directionOf(120);
      logInfo(`directionOf(offsetY=120): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0031 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0032
     * @tc.name      ListBeExchange_DirectionOf_0032
     * @tc.desc      directionOf(offsetY=125) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0032 begin`);
      const actual: number = directionOf(125);
      logInfo(`directionOf(offsetY=125): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0032 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0033
     * @tc.name      ListBeExchange_DirectionOf_0033
     * @tc.desc      directionOf(offsetY=130) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0033 begin`);
      const actual: number = directionOf(130);
      logInfo(`directionOf(offsetY=130): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0033 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0034
     * @tc.name      ListBeExchange_DirectionOf_0034
     * @tc.desc      directionOf(offsetY=135) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0034 begin`);
      const actual: number = directionOf(135);
      logInfo(`directionOf(offsetY=135): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0034 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0035
     * @tc.name      ListBeExchange_DirectionOf_0035
     * @tc.desc      directionOf(offsetY=140) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0035 begin`);
      const actual: number = directionOf(140);
      logInfo(`directionOf(offsetY=140): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0035 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0036
     * @tc.name      ListBeExchange_DirectionOf_0036
     * @tc.desc      directionOf(offsetY=145) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0036 begin`);
      const actual: number = directionOf(145);
      logInfo(`directionOf(offsetY=145): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0036 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0037
     * @tc.name      ListBeExchange_DirectionOf_0037
     * @tc.desc      directionOf(offsetY=150) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0037 begin`);
      const actual: number = directionOf(150);
      logInfo(`directionOf(offsetY=150): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0037 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0038
     * @tc.name      ListBeExchange_DirectionOf_0038
     * @tc.desc      directionOf(offsetY=155) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0038 begin`);
      const actual: number = directionOf(155);
      logInfo(`directionOf(offsetY=155): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0038 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0039
     * @tc.name      ListBeExchange_DirectionOf_0039
     * @tc.desc      directionOf(offsetY=160) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0039 begin`);
      const actual: number = directionOf(160);
      logInfo(`directionOf(offsetY=160): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0039 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0040
     * @tc.name      ListBeExchange_DirectionOf_0040
     * @tc.desc      directionOf(offsetY=165) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0040 begin`);
      const actual: number = directionOf(165);
      logInfo(`directionOf(offsetY=165): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0040 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0041
     * @tc.name      ListBeExchange_DirectionOf_0041
     * @tc.desc      directionOf(offsetY=170) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0041 begin`);
      const actual: number = directionOf(170);
      logInfo(`directionOf(offsetY=170): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0041 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0042
     * @tc.name      ListBeExchange_DirectionOf_0042
     * @tc.desc      directionOf(offsetY=175) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0042 begin`);
      const actual: number = directionOf(175);
      logInfo(`directionOf(offsetY=175): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0042 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0043
     * @tc.name      ListBeExchange_DirectionOf_0043
     * @tc.desc      directionOf(offsetY=180) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0043 begin`);
      const actual: number = directionOf(180);
      logInfo(`directionOf(offsetY=180): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0043 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0044
     * @tc.name      ListBeExchange_DirectionOf_0044
     * @tc.desc      directionOf(offsetY=185) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0044 begin`);
      const actual: number = directionOf(185);
      logInfo(`directionOf(offsetY=185): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0044 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0045
     * @tc.name      ListBeExchange_DirectionOf_0045
     * @tc.desc      directionOf(offsetY=190) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0045 begin`);
      const actual: number = directionOf(190);
      logInfo(`directionOf(offsetY=190): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0045 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0046
     * @tc.name      ListBeExchange_DirectionOf_0046
     * @tc.desc      directionOf(offsetY=195) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0046 begin`);
      const actual: number = directionOf(195);
      logInfo(`directionOf(offsetY=195): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0046 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0047
     * @tc.name      ListBeExchange_DirectionOf_0047
     * @tc.desc      directionOf(offsetY=200) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0047 begin`);
      const actual: number = directionOf(200);
      logInfo(`directionOf(offsetY=200): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0047 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0048
     * @tc.name      ListBeExchange_DirectionOf_0048
     * @tc.desc      directionOf(offsetY=39.54) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0048 begin`);
      const actual: number = directionOf(39.54);
      logInfo(`directionOf(offsetY=39.54): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0048 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0049
     * @tc.name      ListBeExchange_DirectionOf_0049
     * @tc.desc      directionOf(offsetY=94.11) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_DirectionOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0049 begin`);
      const actual: number = directionOf(94.11);
      logInfo(`directionOf(offsetY=94.11): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DirectionOf_0049 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_DIRECTION_OF_0050
     * @tc.name      ListBeExchange_DirectionOf_0050
     * @tc.desc      directionOf(offsetY=-35) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_DirectionOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DirectionOf_0050 begin`);
      const actual: number = directionOf(-35);
      logInfo(`directionOf(offsetY=-35): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DirectionOf_0050 end`);
    });
  });
}
