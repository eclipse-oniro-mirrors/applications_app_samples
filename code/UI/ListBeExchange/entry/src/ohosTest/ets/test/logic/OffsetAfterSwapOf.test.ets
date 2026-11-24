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
import { offsetAfterSwapOf } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for offsetAfterSwapOf (96 cases). */
export default function offsetAfterSwapOfTest(): void {
  describe('OffsetAfterSwapOfTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0001
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0001
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_OffsetAfterSwapOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0001 begin`);
      const actual: number = offsetAfterSwapOf(-100, 0);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction=0): actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0002
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0002
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=1) returns -150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_OffsetAfterSwapOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0002 begin`);
      const actual: number = offsetAfterSwapOf(-100, 1);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction=1): actual=${actual}`);
      expect(actual).assertEqual(-150);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0003
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0003
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=-1) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0003 begin`);
      const actual: number = offsetAfterSwapOf(-100, -1);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0004
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0004
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=2) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0004 begin`);
      const actual: number = offsetAfterSwapOf(-100, 2);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction=2): actual=${actual}`);
      expect(actual).assertEqual(-200);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0005
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0005
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=3) returns -250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0005 begin`);
      const actual: number = offsetAfterSwapOf(-100, 3);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction=3): actual=${actual}`);
      expect(actual).assertEqual(-250);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0006
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0006
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=10) returns -600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0006 begin`);
      const actual: number = offsetAfterSwapOf(-100, 10);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-600);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0007
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0007
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=100) returns -5100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0007 begin`);
      const actual: number = offsetAfterSwapOf(-100, 100);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-5100);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0008
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0008
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=5) returns -350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0008 begin`);
      const actual: number = offsetAfterSwapOf(-100, 5);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction=5): actual=${actual}`);
      expect(actual).assertEqual(-350);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0009
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0009
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=15) returns -850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0009 begin`);
      const actual: number = offsetAfterSwapOf(-100, 15);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-850);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0010
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0010
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=20) returns -1100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0010 begin`);
      const actual: number = offsetAfterSwapOf(-100, 20);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-1100);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0011
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0011
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=25) returns -1350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0011 begin`);
      const actual: number = offsetAfterSwapOf(-100, 25);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-1350);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0012
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0012
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=30) returns -1600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0012 begin`);
      const actual: number = offsetAfterSwapOf(-100, 30);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-1600);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0013
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0013
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=35) returns -1850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0013 begin`);
      const actual: number = offsetAfterSwapOf(-100, 35);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-1850);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0014
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0014
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=40) returns -2100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0014 begin`);
      const actual: number = offsetAfterSwapOf(-100, 40);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-2100);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0015
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0015
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=45) returns -2350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0015 begin`);
      const actual: number = offsetAfterSwapOf(-100, 45);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-2350);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0016
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0016
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=50) returns -2600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0016 begin`);
      const actual: number = offsetAfterSwapOf(-100, 50);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-2600);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0017
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0017
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=55) returns -2850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0017 begin`);
      const actual: number = offsetAfterSwapOf(-100, 55);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-2850);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0018
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0018
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=60) returns -3100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0018 begin`);
      const actual: number = offsetAfterSwapOf(-100, 60);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-3100);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0019
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0019
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=65) returns -3350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0019 begin`);
      const actual: number = offsetAfterSwapOf(-100, 65);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-3350);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0020
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0020
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=70) returns -3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0020 begin`);
      const actual: number = offsetAfterSwapOf(-100, 70);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-3600);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0021
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0021
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=75) returns -3850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0021 begin`);
      const actual: number = offsetAfterSwapOf(-100, 75);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-3850);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0022
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0022
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=80) returns -4100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0022 begin`);
      const actual: number = offsetAfterSwapOf(-100, 80);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-4100);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0023
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0023
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=85) returns -4350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0023 begin`);
      const actual: number = offsetAfterSwapOf(-100, 85);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-4350);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0024
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0024
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=90) returns -4600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0024 begin`);
      const actual: number = offsetAfterSwapOf(-100, 90);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-4600);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0025
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0025
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=95) returns -4850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0025 begin`);
      const actual: number = offsetAfterSwapOf(-100, 95);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-4850);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0026
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0026
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=105) returns -5350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0026 begin`);
      const actual: number = offsetAfterSwapOf(-100, 105);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-5350);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0027
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0027
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=110) returns -5600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0027 begin`);
      const actual: number = offsetAfterSwapOf(-100, 110);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-5600);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0028
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0028
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=115) returns -5850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0028 begin`);
      const actual: number = offsetAfterSwapOf(-100, 115);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-5850);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0029
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0029
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=-49) returns 2350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0029 begin`);
      const actual: number = offsetAfterSwapOf(-100, -49);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(2350);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0030
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0030
     * @tc.desc      offsetAfterSwapOf(offsetY=-100, direction=173) returns -8750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0030 begin`);
      const actual: number = offsetAfterSwapOf(-100, 173);
      logInfo(`offsetAfterSwapOf(offsetY=-100, direction...: actual=${actual}`);
      expect(actual).assertEqual(-8750);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0030 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0031
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0031
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0031 begin`);
      const actual: number = offsetAfterSwapOf(-1, 0);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0031 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0032
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0032
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=1) returns -51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0032 begin`);
      const actual: number = offsetAfterSwapOf(-1, 1);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=1): actual=${actual}`);
      expect(actual).assertEqual(-51);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0032 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0033
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0033
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=-1) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0033 begin`);
      const actual: number = offsetAfterSwapOf(-1, -1);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=-1): actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0033 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0034
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0034
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=2) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0034 begin`);
      const actual: number = offsetAfterSwapOf(-1, 2);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=2): actual=${actual}`);
      expect(actual).assertEqual(-101);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0034 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0035
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0035
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=3) returns -151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0035 begin`);
      const actual: number = offsetAfterSwapOf(-1, 3);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=3): actual=${actual}`);
      expect(actual).assertEqual(-151);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0035 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0036
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0036
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=10) returns -501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0036 begin`);
      const actual: number = offsetAfterSwapOf(-1, 10);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=10): actual=${actual}`);
      expect(actual).assertEqual(-501);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0036 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0037
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0037
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=100) returns -5001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0037 begin`);
      const actual: number = offsetAfterSwapOf(-1, 100);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=100): actual=${actual}`);
      expect(actual).assertEqual(-5001);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0037 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0038
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0038
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=5) returns -251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0038 begin`);
      const actual: number = offsetAfterSwapOf(-1, 5);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=5): actual=${actual}`);
      expect(actual).assertEqual(-251);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0038 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0039
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0039
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=15) returns -751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0039 begin`);
      const actual: number = offsetAfterSwapOf(-1, 15);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=15): actual=${actual}`);
      expect(actual).assertEqual(-751);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0039 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0040
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0040
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=20) returns -1001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0040 begin`);
      const actual: number = offsetAfterSwapOf(-1, 20);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=20): actual=${actual}`);
      expect(actual).assertEqual(-1001);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0040 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0041
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0041
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=25) returns -1251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0041 begin`);
      const actual: number = offsetAfterSwapOf(-1, 25);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=25): actual=${actual}`);
      expect(actual).assertEqual(-1251);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0041 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0042
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0042
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=30) returns -1501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0042 begin`);
      const actual: number = offsetAfterSwapOf(-1, 30);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=30): actual=${actual}`);
      expect(actual).assertEqual(-1501);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0042 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0043
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0043
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=35) returns -1751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0043 begin`);
      const actual: number = offsetAfterSwapOf(-1, 35);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=35): actual=${actual}`);
      expect(actual).assertEqual(-1751);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0043 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0044
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0044
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=40) returns -2001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0044 begin`);
      const actual: number = offsetAfterSwapOf(-1, 40);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=40): actual=${actual}`);
      expect(actual).assertEqual(-2001);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0044 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0045
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0045
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=45) returns -2251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0045 begin`);
      const actual: number = offsetAfterSwapOf(-1, 45);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=45): actual=${actual}`);
      expect(actual).assertEqual(-2251);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0045 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0046
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0046
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=50) returns -2501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0046 begin`);
      const actual: number = offsetAfterSwapOf(-1, 50);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=50): actual=${actual}`);
      expect(actual).assertEqual(-2501);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0046 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0047
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0047
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=55) returns -2751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0047 begin`);
      const actual: number = offsetAfterSwapOf(-1, 55);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=55): actual=${actual}`);
      expect(actual).assertEqual(-2751);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0047 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0048
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0048
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=60) returns -3001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0048 begin`);
      const actual: number = offsetAfterSwapOf(-1, 60);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=60): actual=${actual}`);
      expect(actual).assertEqual(-3001);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0048 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0049
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0049
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=65) returns -3251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0049 begin`);
      const actual: number = offsetAfterSwapOf(-1, 65);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=65): actual=${actual}`);
      expect(actual).assertEqual(-3251);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0049 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0050
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0050
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=70) returns -3501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0050 begin`);
      const actual: number = offsetAfterSwapOf(-1, 70);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=70): actual=${actual}`);
      expect(actual).assertEqual(-3501);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0050 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0051
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0051
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=75) returns -3751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0051 begin`);
      const actual: number = offsetAfterSwapOf(-1, 75);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=75): actual=${actual}`);
      expect(actual).assertEqual(-3751);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0051 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0052
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0052
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=80) returns -4001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0052 begin`);
      const actual: number = offsetAfterSwapOf(-1, 80);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=80): actual=${actual}`);
      expect(actual).assertEqual(-4001);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0052 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0053
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0053
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=85) returns -4251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0053 begin`);
      const actual: number = offsetAfterSwapOf(-1, 85);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=85): actual=${actual}`);
      expect(actual).assertEqual(-4251);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0053 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0054
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0054
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=90) returns -4501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0054 begin`);
      const actual: number = offsetAfterSwapOf(-1, 90);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=90): actual=${actual}`);
      expect(actual).assertEqual(-4501);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0054 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0055
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0055
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=95) returns -4751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0055 begin`);
      const actual: number = offsetAfterSwapOf(-1, 95);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=95): actual=${actual}`);
      expect(actual).assertEqual(-4751);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0055 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0056
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0056
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=105) returns -5251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0056 begin`);
      const actual: number = offsetAfterSwapOf(-1, 105);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=105): actual=${actual}`);
      expect(actual).assertEqual(-5251);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0056 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0057
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0057
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=110) returns -5501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0057 begin`);
      const actual: number = offsetAfterSwapOf(-1, 110);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=110): actual=${actual}`);
      expect(actual).assertEqual(-5501);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0057 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0058
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0058
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=115) returns -5751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0058 begin`);
      const actual: number = offsetAfterSwapOf(-1, 115);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=115): actual=${actual}`);
      expect(actual).assertEqual(-5751);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0058 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0059
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0059
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=-49) returns 2449
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0059 begin`);
      const actual: number = offsetAfterSwapOf(-1, -49);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=-49): actual=${actual}`);
      expect(actual).assertEqual(2449);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0059 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0060
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0060
     * @tc.desc      offsetAfterSwapOf(offsetY=-1, direction=173) returns -8651
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0060 begin`);
      const actual: number = offsetAfterSwapOf(-1, 173);
      logInfo(`offsetAfterSwapOf(offsetY=-1, direction=173): actual=${actual}`);
      expect(actual).assertEqual(-8651);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0060 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0061
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0061
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0061 begin`);
      const actual: number = offsetAfterSwapOf(0, 0);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0061 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0062
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0062
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=-1) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0062 begin`);
      const actual: number = offsetAfterSwapOf(0, -1);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=-1): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0062 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0063
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0063
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=10) returns -500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0063 begin`);
      const actual: number = offsetAfterSwapOf(0, 10);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=10): actual=${actual}`);
      expect(actual).assertEqual(-500);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0063 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0064
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0064
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=100) returns -5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0064 begin`);
      const actual: number = offsetAfterSwapOf(0, 100);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=100): actual=${actual}`);
      expect(actual).assertEqual(-5000);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0064 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0065
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0065
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=15) returns -750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0065 begin`);
      const actual: number = offsetAfterSwapOf(0, 15);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=15): actual=${actual}`);
      expect(actual).assertEqual(-750);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0065 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0066
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0066
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=20) returns -1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0066 begin`);
      const actual: number = offsetAfterSwapOf(0, 20);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=20): actual=${actual}`);
      expect(actual).assertEqual(-1000);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0066 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0067
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0067
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=25) returns -1250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0067 begin`);
      const actual: number = offsetAfterSwapOf(0, 25);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=25): actual=${actual}`);
      expect(actual).assertEqual(-1250);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0067 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0068
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0068
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=30) returns -1500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0068 begin`);
      const actual: number = offsetAfterSwapOf(0, 30);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=30): actual=${actual}`);
      expect(actual).assertEqual(-1500);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0068 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0069
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0069
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=35) returns -1750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0069 begin`);
      const actual: number = offsetAfterSwapOf(0, 35);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=35): actual=${actual}`);
      expect(actual).assertEqual(-1750);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0069 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0070
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0070
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=40) returns -2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0070 begin`);
      const actual: number = offsetAfterSwapOf(0, 40);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=40): actual=${actual}`);
      expect(actual).assertEqual(-2000);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0070 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0071
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0071
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=45) returns -2250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0071 begin`);
      const actual: number = offsetAfterSwapOf(0, 45);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=45): actual=${actual}`);
      expect(actual).assertEqual(-2250);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0071 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0072
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0072
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=50) returns -2500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0072 begin`);
      const actual: number = offsetAfterSwapOf(0, 50);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=50): actual=${actual}`);
      expect(actual).assertEqual(-2500);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0072 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0073
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0073
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=55) returns -2750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0073 begin`);
      const actual: number = offsetAfterSwapOf(0, 55);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=55): actual=${actual}`);
      expect(actual).assertEqual(-2750);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0073 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0074
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0074
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=60) returns -3000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0074 begin`);
      const actual: number = offsetAfterSwapOf(0, 60);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=60): actual=${actual}`);
      expect(actual).assertEqual(-3000);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0074 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0075
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0075
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=65) returns -3250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0075 begin`);
      const actual: number = offsetAfterSwapOf(0, 65);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=65): actual=${actual}`);
      expect(actual).assertEqual(-3250);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0075 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0076
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0076
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=70) returns -3500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0076 begin`);
      const actual: number = offsetAfterSwapOf(0, 70);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=70): actual=${actual}`);
      expect(actual).assertEqual(-3500);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0076 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0077
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0077
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=75) returns -3750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0077 begin`);
      const actual: number = offsetAfterSwapOf(0, 75);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=75): actual=${actual}`);
      expect(actual).assertEqual(-3750);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0077 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0078
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0078
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=80) returns -4000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0078 begin`);
      const actual: number = offsetAfterSwapOf(0, 80);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=80): actual=${actual}`);
      expect(actual).assertEqual(-4000);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0078 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0079
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0079
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=85) returns -4250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0079 begin`);
      const actual: number = offsetAfterSwapOf(0, 85);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=85): actual=${actual}`);
      expect(actual).assertEqual(-4250);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0079 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0080
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0080
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=90) returns -4500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0080 begin`);
      const actual: number = offsetAfterSwapOf(0, 90);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=90): actual=${actual}`);
      expect(actual).assertEqual(-4500);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0080 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0081
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0081
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=95) returns -4750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0081 begin`);
      const actual: number = offsetAfterSwapOf(0, 95);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=95): actual=${actual}`);
      expect(actual).assertEqual(-4750);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0081 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0082
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0082
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=105) returns -5250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0082 begin`);
      const actual: number = offsetAfterSwapOf(0, 105);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=105): actual=${actual}`);
      expect(actual).assertEqual(-5250);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0082 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0083
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0083
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=110) returns -5500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0083 begin`);
      const actual: number = offsetAfterSwapOf(0, 110);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=110): actual=${actual}`);
      expect(actual).assertEqual(-5500);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0083 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0084
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0084
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=115) returns -5750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0084 begin`);
      const actual: number = offsetAfterSwapOf(0, 115);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=115): actual=${actual}`);
      expect(actual).assertEqual(-5750);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0084 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0085
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0085
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=-49) returns 2450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0085 begin`);
      const actual: number = offsetAfterSwapOf(0, -49);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=-49): actual=${actual}`);
      expect(actual).assertEqual(2450);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0085 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0086
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0086
     * @tc.desc      offsetAfterSwapOf(offsetY=0, direction=173) returns -8650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0086 begin`);
      const actual: number = offsetAfterSwapOf(0, 173);
      logInfo(`offsetAfterSwapOf(offsetY=0, direction=173): actual=${actual}`);
      expect(actual).assertEqual(-8650);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0086 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0087
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0087
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0087 begin`);
      const actual: number = offsetAfterSwapOf(1, 0);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0087 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0088
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0088
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=1) returns -49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0088 begin`);
      const actual: number = offsetAfterSwapOf(1, 1);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=1): actual=${actual}`);
      expect(actual).assertEqual(-49);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0088 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0089
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0089
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=-1) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_OffsetAfterSwapOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0089 begin`);
      const actual: number = offsetAfterSwapOf(1, -1);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=-1): actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0089 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0090
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0090
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=2) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0090 begin`);
      const actual: number = offsetAfterSwapOf(1, 2);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=2): actual=${actual}`);
      expect(actual).assertEqual(-99);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0090 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0091
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0091
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=3) returns -149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0091 begin`);
      const actual: number = offsetAfterSwapOf(1, 3);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=3): actual=${actual}`);
      expect(actual).assertEqual(-149);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0091 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0092
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0092
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=10) returns -499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0092 begin`);
      const actual: number = offsetAfterSwapOf(1, 10);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=10): actual=${actual}`);
      expect(actual).assertEqual(-499);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0092 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0093
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0093
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=100) returns -4999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0093 begin`);
      const actual: number = offsetAfterSwapOf(1, 100);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=100): actual=${actual}`);
      expect(actual).assertEqual(-4999);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0093 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0094
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0094
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=5) returns -249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0094 begin`);
      const actual: number = offsetAfterSwapOf(1, 5);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=5): actual=${actual}`);
      expect(actual).assertEqual(-249);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0094 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0095
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0095
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=15) returns -749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0095 begin`);
      const actual: number = offsetAfterSwapOf(1, 15);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=15): actual=${actual}`);
      expect(actual).assertEqual(-749);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0095 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_OFFSET_AFTER_SWAP_OF_0096
     * @tc.name      ListBeExchange_OffsetAfterSwapOf_0096
     * @tc.desc      offsetAfterSwapOf(offsetY=1, direction=20) returns -999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_OffsetAfterSwapOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0096 begin`);
      const actual: number = offsetAfterSwapOf(1, 20);
      logInfo(`offsetAfterSwapOf(offsetY=1, direction=20): actual=${actual}`);
      expect(actual).assertEqual(-999);
      logInfo(`${BUNDLE}OffsetAfterSwapOf_0096 end`);
    });
  });
}
