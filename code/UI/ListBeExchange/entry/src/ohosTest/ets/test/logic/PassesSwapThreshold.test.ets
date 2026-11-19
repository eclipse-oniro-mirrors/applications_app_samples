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
import { passesSwapThreshold } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for passesSwapThreshold (50 cases). */
export default function passesSwapThresholdTest(): void {
  describe('PassesSwapThresholdTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0001
     * @tc.name      ListBeExchange_PassesSwapThreshold_0001
     * @tc.desc      passesSwapThreshold(offsetY=-100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_PassesSwapThreshold_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0001 begin`);
      const actual: boolean = passesSwapThreshold(-100);
      logInfo(`passesSwapThreshold(offsetY=-100): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0002
     * @tc.name      ListBeExchange_PassesSwapThreshold_0002
     * @tc.desc      passesSwapThreshold(offsetY=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_PassesSwapThreshold_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0002 begin`);
      const actual: boolean = passesSwapThreshold(-1);
      logInfo(`passesSwapThreshold(offsetY=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}PassesSwapThreshold_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0003
     * @tc.name      ListBeExchange_PassesSwapThreshold_0003
     * @tc.desc      passesSwapThreshold(offsetY=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_PassesSwapThreshold_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0003 begin`);
      const actual: boolean = passesSwapThreshold(2);
      logInfo(`passesSwapThreshold(offsetY=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}PassesSwapThreshold_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0004
     * @tc.name      ListBeExchange_PassesSwapThreshold_0004
     * @tc.desc      passesSwapThreshold(offsetY=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_PassesSwapThreshold_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0004 begin`);
      const actual: boolean = passesSwapThreshold(1);
      logInfo(`passesSwapThreshold(offsetY=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}PassesSwapThreshold_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0005
     * @tc.name      ListBeExchange_PassesSwapThreshold_0005
     * @tc.desc      passesSwapThreshold(offsetY=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_PassesSwapThreshold_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0005 begin`);
      const actual: boolean = passesSwapThreshold(3);
      logInfo(`passesSwapThreshold(offsetY=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}PassesSwapThreshold_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0006
     * @tc.name      ListBeExchange_PassesSwapThreshold_0006
     * @tc.desc      passesSwapThreshold(offsetY=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0006 begin`);
      const actual: boolean = passesSwapThreshold(0);
      logInfo(`passesSwapThreshold(offsetY=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}PassesSwapThreshold_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0007
     * @tc.name      ListBeExchange_PassesSwapThreshold_0007
     * @tc.desc      passesSwapThreshold(offsetY=50) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0007 begin`);
      const actual: boolean = passesSwapThreshold(50);
      logInfo(`passesSwapThreshold(offsetY=50): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0008
     * @tc.name      ListBeExchange_PassesSwapThreshold_0008
     * @tc.desc      passesSwapThreshold(offsetY=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0008 begin`);
      const actual: boolean = passesSwapThreshold(100);
      logInfo(`passesSwapThreshold(offsetY=100): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0009
     * @tc.name      ListBeExchange_PassesSwapThreshold_0009
     * @tc.desc      passesSwapThreshold(offsetY=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0009 begin`);
      const actual: boolean = passesSwapThreshold(10);
      logInfo(`passesSwapThreshold(offsetY=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}PassesSwapThreshold_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0010
     * @tc.name      ListBeExchange_PassesSwapThreshold_0010
     * @tc.desc      passesSwapThreshold(offsetY=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0010 begin`);
      const actual: boolean = passesSwapThreshold(5);
      logInfo(`passesSwapThreshold(offsetY=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}PassesSwapThreshold_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0011
     * @tc.name      ListBeExchange_PassesSwapThreshold_0011
     * @tc.desc      passesSwapThreshold(offsetY=15) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0011 begin`);
      const actual: boolean = passesSwapThreshold(15);
      logInfo(`passesSwapThreshold(offsetY=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}PassesSwapThreshold_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0012
     * @tc.name      ListBeExchange_PassesSwapThreshold_0012
     * @tc.desc      passesSwapThreshold(offsetY=20) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0012 begin`);
      const actual: boolean = passesSwapThreshold(20);
      logInfo(`passesSwapThreshold(offsetY=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}PassesSwapThreshold_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0013
     * @tc.name      ListBeExchange_PassesSwapThreshold_0013
     * @tc.desc      passesSwapThreshold(offsetY=25) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0013 begin`);
      const actual: boolean = passesSwapThreshold(25);
      logInfo(`passesSwapThreshold(offsetY=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}PassesSwapThreshold_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0014
     * @tc.name      ListBeExchange_PassesSwapThreshold_0014
     * @tc.desc      passesSwapThreshold(offsetY=30) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0014 begin`);
      const actual: boolean = passesSwapThreshold(30);
      logInfo(`passesSwapThreshold(offsetY=30): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0015
     * @tc.name      ListBeExchange_PassesSwapThreshold_0015
     * @tc.desc      passesSwapThreshold(offsetY=35) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0015 begin`);
      const actual: boolean = passesSwapThreshold(35);
      logInfo(`passesSwapThreshold(offsetY=35): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0016
     * @tc.name      ListBeExchange_PassesSwapThreshold_0016
     * @tc.desc      passesSwapThreshold(offsetY=40) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0016 begin`);
      const actual: boolean = passesSwapThreshold(40);
      logInfo(`passesSwapThreshold(offsetY=40): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0017
     * @tc.name      ListBeExchange_PassesSwapThreshold_0017
     * @tc.desc      passesSwapThreshold(offsetY=45) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0017 begin`);
      const actual: boolean = passesSwapThreshold(45);
      logInfo(`passesSwapThreshold(offsetY=45): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0018
     * @tc.name      ListBeExchange_PassesSwapThreshold_0018
     * @tc.desc      passesSwapThreshold(offsetY=55) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0018 begin`);
      const actual: boolean = passesSwapThreshold(55);
      logInfo(`passesSwapThreshold(offsetY=55): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0019
     * @tc.name      ListBeExchange_PassesSwapThreshold_0019
     * @tc.desc      passesSwapThreshold(offsetY=60) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0019 begin`);
      const actual: boolean = passesSwapThreshold(60);
      logInfo(`passesSwapThreshold(offsetY=60): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0020
     * @tc.name      ListBeExchange_PassesSwapThreshold_0020
     * @tc.desc      passesSwapThreshold(offsetY=65) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0020 begin`);
      const actual: boolean = passesSwapThreshold(65);
      logInfo(`passesSwapThreshold(offsetY=65): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0021
     * @tc.name      ListBeExchange_PassesSwapThreshold_0021
     * @tc.desc      passesSwapThreshold(offsetY=70) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0021 begin`);
      const actual: boolean = passesSwapThreshold(70);
      logInfo(`passesSwapThreshold(offsetY=70): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0022
     * @tc.name      ListBeExchange_PassesSwapThreshold_0022
     * @tc.desc      passesSwapThreshold(offsetY=75) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0022 begin`);
      const actual: boolean = passesSwapThreshold(75);
      logInfo(`passesSwapThreshold(offsetY=75): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0023
     * @tc.name      ListBeExchange_PassesSwapThreshold_0023
     * @tc.desc      passesSwapThreshold(offsetY=80) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0023 begin`);
      const actual: boolean = passesSwapThreshold(80);
      logInfo(`passesSwapThreshold(offsetY=80): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0024
     * @tc.name      ListBeExchange_PassesSwapThreshold_0024
     * @tc.desc      passesSwapThreshold(offsetY=85) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0024 begin`);
      const actual: boolean = passesSwapThreshold(85);
      logInfo(`passesSwapThreshold(offsetY=85): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0025
     * @tc.name      ListBeExchange_PassesSwapThreshold_0025
     * @tc.desc      passesSwapThreshold(offsetY=90) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0025 begin`);
      const actual: boolean = passesSwapThreshold(90);
      logInfo(`passesSwapThreshold(offsetY=90): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0026
     * @tc.name      ListBeExchange_PassesSwapThreshold_0026
     * @tc.desc      passesSwapThreshold(offsetY=95) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0026 begin`);
      const actual: boolean = passesSwapThreshold(95);
      logInfo(`passesSwapThreshold(offsetY=95): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0027
     * @tc.name      ListBeExchange_PassesSwapThreshold_0027
     * @tc.desc      passesSwapThreshold(offsetY=105) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0027 begin`);
      const actual: boolean = passesSwapThreshold(105);
      logInfo(`passesSwapThreshold(offsetY=105): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0028
     * @tc.name      ListBeExchange_PassesSwapThreshold_0028
     * @tc.desc      passesSwapThreshold(offsetY=110) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0028 begin`);
      const actual: boolean = passesSwapThreshold(110);
      logInfo(`passesSwapThreshold(offsetY=110): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0029
     * @tc.name      ListBeExchange_PassesSwapThreshold_0029
     * @tc.desc      passesSwapThreshold(offsetY=115) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0029 begin`);
      const actual: boolean = passesSwapThreshold(115);
      logInfo(`passesSwapThreshold(offsetY=115): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0030
     * @tc.name      ListBeExchange_PassesSwapThreshold_0030
     * @tc.desc      passesSwapThreshold(offsetY=120) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0030 begin`);
      const actual: boolean = passesSwapThreshold(120);
      logInfo(`passesSwapThreshold(offsetY=120): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0030 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0031
     * @tc.name      ListBeExchange_PassesSwapThreshold_0031
     * @tc.desc      passesSwapThreshold(offsetY=125) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0031 begin`);
      const actual: boolean = passesSwapThreshold(125);
      logInfo(`passesSwapThreshold(offsetY=125): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0031 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0032
     * @tc.name      ListBeExchange_PassesSwapThreshold_0032
     * @tc.desc      passesSwapThreshold(offsetY=130) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0032 begin`);
      const actual: boolean = passesSwapThreshold(130);
      logInfo(`passesSwapThreshold(offsetY=130): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0032 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0033
     * @tc.name      ListBeExchange_PassesSwapThreshold_0033
     * @tc.desc      passesSwapThreshold(offsetY=135) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0033 begin`);
      const actual: boolean = passesSwapThreshold(135);
      logInfo(`passesSwapThreshold(offsetY=135): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0033 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0034
     * @tc.name      ListBeExchange_PassesSwapThreshold_0034
     * @tc.desc      passesSwapThreshold(offsetY=140) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0034 begin`);
      const actual: boolean = passesSwapThreshold(140);
      logInfo(`passesSwapThreshold(offsetY=140): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0034 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0035
     * @tc.name      ListBeExchange_PassesSwapThreshold_0035
     * @tc.desc      passesSwapThreshold(offsetY=145) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0035 begin`);
      const actual: boolean = passesSwapThreshold(145);
      logInfo(`passesSwapThreshold(offsetY=145): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0035 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0036
     * @tc.name      ListBeExchange_PassesSwapThreshold_0036
     * @tc.desc      passesSwapThreshold(offsetY=150) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0036 begin`);
      const actual: boolean = passesSwapThreshold(150);
      logInfo(`passesSwapThreshold(offsetY=150): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0036 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0037
     * @tc.name      ListBeExchange_PassesSwapThreshold_0037
     * @tc.desc      passesSwapThreshold(offsetY=155) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0037 begin`);
      const actual: boolean = passesSwapThreshold(155);
      logInfo(`passesSwapThreshold(offsetY=155): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0037 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0038
     * @tc.name      ListBeExchange_PassesSwapThreshold_0038
     * @tc.desc      passesSwapThreshold(offsetY=160) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0038 begin`);
      const actual: boolean = passesSwapThreshold(160);
      logInfo(`passesSwapThreshold(offsetY=160): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0038 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0039
     * @tc.name      ListBeExchange_PassesSwapThreshold_0039
     * @tc.desc      passesSwapThreshold(offsetY=165) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0039 begin`);
      const actual: boolean = passesSwapThreshold(165);
      logInfo(`passesSwapThreshold(offsetY=165): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0039 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0040
     * @tc.name      ListBeExchange_PassesSwapThreshold_0040
     * @tc.desc      passesSwapThreshold(offsetY=170) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0040 begin`);
      const actual: boolean = passesSwapThreshold(170);
      logInfo(`passesSwapThreshold(offsetY=170): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0040 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0041
     * @tc.name      ListBeExchange_PassesSwapThreshold_0041
     * @tc.desc      passesSwapThreshold(offsetY=175) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0041 begin`);
      const actual: boolean = passesSwapThreshold(175);
      logInfo(`passesSwapThreshold(offsetY=175): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0041 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0042
     * @tc.name      ListBeExchange_PassesSwapThreshold_0042
     * @tc.desc      passesSwapThreshold(offsetY=180) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0042 begin`);
      const actual: boolean = passesSwapThreshold(180);
      logInfo(`passesSwapThreshold(offsetY=180): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0042 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0043
     * @tc.name      ListBeExchange_PassesSwapThreshold_0043
     * @tc.desc      passesSwapThreshold(offsetY=185) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0043 begin`);
      const actual: boolean = passesSwapThreshold(185);
      logInfo(`passesSwapThreshold(offsetY=185): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0043 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0044
     * @tc.name      ListBeExchange_PassesSwapThreshold_0044
     * @tc.desc      passesSwapThreshold(offsetY=190) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0044 begin`);
      const actual: boolean = passesSwapThreshold(190);
      logInfo(`passesSwapThreshold(offsetY=190): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0044 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0045
     * @tc.name      ListBeExchange_PassesSwapThreshold_0045
     * @tc.desc      passesSwapThreshold(offsetY=195) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0045 begin`);
      const actual: boolean = passesSwapThreshold(195);
      logInfo(`passesSwapThreshold(offsetY=195): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0045 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0046
     * @tc.name      ListBeExchange_PassesSwapThreshold_0046
     * @tc.desc      passesSwapThreshold(offsetY=200) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0046 begin`);
      const actual: boolean = passesSwapThreshold(200);
      logInfo(`passesSwapThreshold(offsetY=200): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0046 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0047
     * @tc.name      ListBeExchange_PassesSwapThreshold_0047
     * @tc.desc      passesSwapThreshold(offsetY=-4) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_PassesSwapThreshold_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0047 begin`);
      const actual: boolean = passesSwapThreshold(-4);
      logInfo(`passesSwapThreshold(offsetY=-4): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}PassesSwapThreshold_0047 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0048
     * @tc.name      ListBeExchange_PassesSwapThreshold_0048
     * @tc.desc      passesSwapThreshold(offsetY=92) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0048 begin`);
      const actual: boolean = passesSwapThreshold(92);
      logInfo(`passesSwapThreshold(offsetY=92): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0048 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0049
     * @tc.name      ListBeExchange_PassesSwapThreshold_0049
     * @tc.desc      passesSwapThreshold(offsetY=36) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0049 begin`);
      const actual: boolean = passesSwapThreshold(36);
      logInfo(`passesSwapThreshold(offsetY=36): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}PassesSwapThreshold_0049 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_PASSES_SWAP_THRESHOLD_0050
     * @tc.name      ListBeExchange_PassesSwapThreshold_0050
     * @tc.desc      passesSwapThreshold(offsetY=1.22) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_PassesSwapThreshold_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PassesSwapThreshold_0050 begin`);
      const actual: boolean = passesSwapThreshold(1.22);
      logInfo(`passesSwapThreshold(offsetY=1.22): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}PassesSwapThreshold_0050 end`);
    });
  });
}
