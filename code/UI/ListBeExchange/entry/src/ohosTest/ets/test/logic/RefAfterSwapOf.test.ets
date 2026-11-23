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
import { refAfterSwapOf } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for refAfterSwapOf (96 cases). */
export default function refAfterSwapOfTest(): void {
  describe('RefAfterSwapOfTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0001
     * @tc.name      ListBeExchange_RefAfterSwapOf_0001
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_RefAfterSwapOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0001 begin`);
      const actual: number = refAfterSwapOf(-100, 0);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}RefAfterSwapOf_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0002
     * @tc.name      ListBeExchange_RefAfterSwapOf_0002
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=1) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_RefAfterSwapOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0002 begin`);
      const actual: number = refAfterSwapOf(-100, 1);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}RefAfterSwapOf_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0003
     * @tc.name      ListBeExchange_RefAfterSwapOf_0003
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=-1) returns -150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0003 begin`);
      const actual: number = refAfterSwapOf(-100, -1);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(-150);
      logInfo(`${BUNDLE}RefAfterSwapOf_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0004
     * @tc.name      ListBeExchange_RefAfterSwapOf_0004
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0004 begin`);
      const actual: number = refAfterSwapOf(-100, 2);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefAfterSwapOf_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0005
     * @tc.name      ListBeExchange_RefAfterSwapOf_0005
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=3) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0005 begin`);
      const actual: number = refAfterSwapOf(-100, 3);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}RefAfterSwapOf_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0006
     * @tc.name      ListBeExchange_RefAfterSwapOf_0006
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=10) returns 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0006 begin`);
      const actual: number = refAfterSwapOf(-100, 10);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}RefAfterSwapOf_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0007
     * @tc.name      ListBeExchange_RefAfterSwapOf_0007
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=100) returns 4900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0007 begin`);
      const actual: number = refAfterSwapOf(-100, 100);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(4900);
      logInfo(`${BUNDLE}RefAfterSwapOf_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0008
     * @tc.name      ListBeExchange_RefAfterSwapOf_0008
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=5) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0008 begin`);
      const actual: number = refAfterSwapOf(-100, 5);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}RefAfterSwapOf_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0009
     * @tc.name      ListBeExchange_RefAfterSwapOf_0009
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=15) returns 650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0009 begin`);
      const actual: number = refAfterSwapOf(-100, 15);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(650);
      logInfo(`${BUNDLE}RefAfterSwapOf_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0010
     * @tc.name      ListBeExchange_RefAfterSwapOf_0010
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=20) returns 900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0010 begin`);
      const actual: number = refAfterSwapOf(-100, 20);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(900);
      logInfo(`${BUNDLE}RefAfterSwapOf_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0011
     * @tc.name      ListBeExchange_RefAfterSwapOf_0011
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=25) returns 1150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0011 begin`);
      const actual: number = refAfterSwapOf(-100, 25);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(1150);
      logInfo(`${BUNDLE}RefAfterSwapOf_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0012
     * @tc.name      ListBeExchange_RefAfterSwapOf_0012
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=30) returns 1400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0012 begin`);
      const actual: number = refAfterSwapOf(-100, 30);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(1400);
      logInfo(`${BUNDLE}RefAfterSwapOf_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0013
     * @tc.name      ListBeExchange_RefAfterSwapOf_0013
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=35) returns 1650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0013 begin`);
      const actual: number = refAfterSwapOf(-100, 35);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(1650);
      logInfo(`${BUNDLE}RefAfterSwapOf_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0014
     * @tc.name      ListBeExchange_RefAfterSwapOf_0014
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=40) returns 1900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0014 begin`);
      const actual: number = refAfterSwapOf(-100, 40);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(1900);
      logInfo(`${BUNDLE}RefAfterSwapOf_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0015
     * @tc.name      ListBeExchange_RefAfterSwapOf_0015
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=45) returns 2150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0015 begin`);
      const actual: number = refAfterSwapOf(-100, 45);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(2150);
      logInfo(`${BUNDLE}RefAfterSwapOf_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0016
     * @tc.name      ListBeExchange_RefAfterSwapOf_0016
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=50) returns 2400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0016 begin`);
      const actual: number = refAfterSwapOf(-100, 50);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(2400);
      logInfo(`${BUNDLE}RefAfterSwapOf_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0017
     * @tc.name      ListBeExchange_RefAfterSwapOf_0017
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=55) returns 2650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0017 begin`);
      const actual: number = refAfterSwapOf(-100, 55);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(2650);
      logInfo(`${BUNDLE}RefAfterSwapOf_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0018
     * @tc.name      ListBeExchange_RefAfterSwapOf_0018
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=60) returns 2900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0018 begin`);
      const actual: number = refAfterSwapOf(-100, 60);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(2900);
      logInfo(`${BUNDLE}RefAfterSwapOf_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0019
     * @tc.name      ListBeExchange_RefAfterSwapOf_0019
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=65) returns 3150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0019 begin`);
      const actual: number = refAfterSwapOf(-100, 65);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(3150);
      logInfo(`${BUNDLE}RefAfterSwapOf_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0020
     * @tc.name      ListBeExchange_RefAfterSwapOf_0020
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=70) returns 3400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0020 begin`);
      const actual: number = refAfterSwapOf(-100, 70);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(3400);
      logInfo(`${BUNDLE}RefAfterSwapOf_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0021
     * @tc.name      ListBeExchange_RefAfterSwapOf_0021
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=75) returns 3650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0021 begin`);
      const actual: number = refAfterSwapOf(-100, 75);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(3650);
      logInfo(`${BUNDLE}RefAfterSwapOf_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0022
     * @tc.name      ListBeExchange_RefAfterSwapOf_0022
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=80) returns 3900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0022 begin`);
      const actual: number = refAfterSwapOf(-100, 80);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(3900);
      logInfo(`${BUNDLE}RefAfterSwapOf_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0023
     * @tc.name      ListBeExchange_RefAfterSwapOf_0023
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=85) returns 4150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0023 begin`);
      const actual: number = refAfterSwapOf(-100, 85);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(4150);
      logInfo(`${BUNDLE}RefAfterSwapOf_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0024
     * @tc.name      ListBeExchange_RefAfterSwapOf_0024
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=90) returns 4400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0024 begin`);
      const actual: number = refAfterSwapOf(-100, 90);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(4400);
      logInfo(`${BUNDLE}RefAfterSwapOf_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0025
     * @tc.name      ListBeExchange_RefAfterSwapOf_0025
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=95) returns 4650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0025 begin`);
      const actual: number = refAfterSwapOf(-100, 95);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(4650);
      logInfo(`${BUNDLE}RefAfterSwapOf_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0026
     * @tc.name      ListBeExchange_RefAfterSwapOf_0026
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=105) returns 5150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0026 begin`);
      const actual: number = refAfterSwapOf(-100, 105);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(5150);
      logInfo(`${BUNDLE}RefAfterSwapOf_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0027
     * @tc.name      ListBeExchange_RefAfterSwapOf_0027
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=110) returns 5400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0027 begin`);
      const actual: number = refAfterSwapOf(-100, 110);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(5400);
      logInfo(`${BUNDLE}RefAfterSwapOf_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0028
     * @tc.name      ListBeExchange_RefAfterSwapOf_0028
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=115) returns 5650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0028 begin`);
      const actual: number = refAfterSwapOf(-100, 115);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(5650);
      logInfo(`${BUNDLE}RefAfterSwapOf_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0029
     * @tc.name      ListBeExchange_RefAfterSwapOf_0029
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=78.64) returns 3832
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0029 begin`);
      const actual: number = refAfterSwapOf(-100, 78.64);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(3832);
      logInfo(`${BUNDLE}RefAfterSwapOf_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0030
     * @tc.name      ListBeExchange_RefAfterSwapOf_0030
     * @tc.desc      refAfterSwapOf(dragRefOffset=-100, direction=37) returns 1750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0030 begin`);
      const actual: number = refAfterSwapOf(-100, 37);
      logInfo(`refAfterSwapOf(dragRefOffset=-100, direct...: actual=${actual}`);
      expect(actual).assertEqual(1750);
      logInfo(`${BUNDLE}RefAfterSwapOf_0030 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0031
     * @tc.name      ListBeExchange_RefAfterSwapOf_0031
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0031 begin`);
      const actual: number = refAfterSwapOf(-1, 0);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}RefAfterSwapOf_0031 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0032
     * @tc.name      ListBeExchange_RefAfterSwapOf_0032
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=1) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0032 begin`);
      const actual: number = refAfterSwapOf(-1, 1);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}RefAfterSwapOf_0032 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0033
     * @tc.name      ListBeExchange_RefAfterSwapOf_0033
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=-1) returns -51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0033 begin`);
      const actual: number = refAfterSwapOf(-1, -1);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(-51);
      logInfo(`${BUNDLE}RefAfterSwapOf_0033 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0034
     * @tc.name      ListBeExchange_RefAfterSwapOf_0034
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=2) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0034 begin`);
      const actual: number = refAfterSwapOf(-1, 2);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}RefAfterSwapOf_0034 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0035
     * @tc.name      ListBeExchange_RefAfterSwapOf_0035
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=3) returns 149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0035 begin`);
      const actual: number = refAfterSwapOf(-1, 3);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(149);
      logInfo(`${BUNDLE}RefAfterSwapOf_0035 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0036
     * @tc.name      ListBeExchange_RefAfterSwapOf_0036
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=10) returns 499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0036 begin`);
      const actual: number = refAfterSwapOf(-1, 10);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(499);
      logInfo(`${BUNDLE}RefAfterSwapOf_0036 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0037
     * @tc.name      ListBeExchange_RefAfterSwapOf_0037
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=100) returns 4999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0037 begin`);
      const actual: number = refAfterSwapOf(-1, 100);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(4999);
      logInfo(`${BUNDLE}RefAfterSwapOf_0037 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0038
     * @tc.name      ListBeExchange_RefAfterSwapOf_0038
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=5) returns 249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0038 begin`);
      const actual: number = refAfterSwapOf(-1, 5);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(249);
      logInfo(`${BUNDLE}RefAfterSwapOf_0038 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0039
     * @tc.name      ListBeExchange_RefAfterSwapOf_0039
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=15) returns 749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0039 begin`);
      const actual: number = refAfterSwapOf(-1, 15);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(749);
      logInfo(`${BUNDLE}RefAfterSwapOf_0039 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0040
     * @tc.name      ListBeExchange_RefAfterSwapOf_0040
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=20) returns 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0040 begin`);
      const actual: number = refAfterSwapOf(-1, 20);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(999);
      logInfo(`${BUNDLE}RefAfterSwapOf_0040 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0041
     * @tc.name      ListBeExchange_RefAfterSwapOf_0041
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=25) returns 1249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0041 begin`);
      const actual: number = refAfterSwapOf(-1, 25);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(1249);
      logInfo(`${BUNDLE}RefAfterSwapOf_0041 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0042
     * @tc.name      ListBeExchange_RefAfterSwapOf_0042
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=30) returns 1499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0042 begin`);
      const actual: number = refAfterSwapOf(-1, 30);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(1499);
      logInfo(`${BUNDLE}RefAfterSwapOf_0042 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0043
     * @tc.name      ListBeExchange_RefAfterSwapOf_0043
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=35) returns 1749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0043 begin`);
      const actual: number = refAfterSwapOf(-1, 35);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(1749);
      logInfo(`${BUNDLE}RefAfterSwapOf_0043 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0044
     * @tc.name      ListBeExchange_RefAfterSwapOf_0044
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=40) returns 1999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0044 begin`);
      const actual: number = refAfterSwapOf(-1, 40);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(1999);
      logInfo(`${BUNDLE}RefAfterSwapOf_0044 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0045
     * @tc.name      ListBeExchange_RefAfterSwapOf_0045
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=45) returns 2249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0045 begin`);
      const actual: number = refAfterSwapOf(-1, 45);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(2249);
      logInfo(`${BUNDLE}RefAfterSwapOf_0045 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0046
     * @tc.name      ListBeExchange_RefAfterSwapOf_0046
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=50) returns 2499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0046 begin`);
      const actual: number = refAfterSwapOf(-1, 50);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(2499);
      logInfo(`${BUNDLE}RefAfterSwapOf_0046 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0047
     * @tc.name      ListBeExchange_RefAfterSwapOf_0047
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=55) returns 2749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0047 begin`);
      const actual: number = refAfterSwapOf(-1, 55);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(2749);
      logInfo(`${BUNDLE}RefAfterSwapOf_0047 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0048
     * @tc.name      ListBeExchange_RefAfterSwapOf_0048
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=60) returns 2999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0048 begin`);
      const actual: number = refAfterSwapOf(-1, 60);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(2999);
      logInfo(`${BUNDLE}RefAfterSwapOf_0048 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0049
     * @tc.name      ListBeExchange_RefAfterSwapOf_0049
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=65) returns 3249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0049 begin`);
      const actual: number = refAfterSwapOf(-1, 65);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(3249);
      logInfo(`${BUNDLE}RefAfterSwapOf_0049 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0050
     * @tc.name      ListBeExchange_RefAfterSwapOf_0050
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=70) returns 3499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0050 begin`);
      const actual: number = refAfterSwapOf(-1, 70);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(3499);
      logInfo(`${BUNDLE}RefAfterSwapOf_0050 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0051
     * @tc.name      ListBeExchange_RefAfterSwapOf_0051
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=75) returns 3749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0051 begin`);
      const actual: number = refAfterSwapOf(-1, 75);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(3749);
      logInfo(`${BUNDLE}RefAfterSwapOf_0051 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0052
     * @tc.name      ListBeExchange_RefAfterSwapOf_0052
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=80) returns 3999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0052 begin`);
      const actual: number = refAfterSwapOf(-1, 80);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(3999);
      logInfo(`${BUNDLE}RefAfterSwapOf_0052 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0053
     * @tc.name      ListBeExchange_RefAfterSwapOf_0053
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=85) returns 4249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0053 begin`);
      const actual: number = refAfterSwapOf(-1, 85);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(4249);
      logInfo(`${BUNDLE}RefAfterSwapOf_0053 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0054
     * @tc.name      ListBeExchange_RefAfterSwapOf_0054
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=90) returns 4499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0054 begin`);
      const actual: number = refAfterSwapOf(-1, 90);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(4499);
      logInfo(`${BUNDLE}RefAfterSwapOf_0054 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0055
     * @tc.name      ListBeExchange_RefAfterSwapOf_0055
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=95) returns 4749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0055 begin`);
      const actual: number = refAfterSwapOf(-1, 95);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(4749);
      logInfo(`${BUNDLE}RefAfterSwapOf_0055 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0056
     * @tc.name      ListBeExchange_RefAfterSwapOf_0056
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=105) returns 5249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0056 begin`);
      const actual: number = refAfterSwapOf(-1, 105);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(5249);
      logInfo(`${BUNDLE}RefAfterSwapOf_0056 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0057
     * @tc.name      ListBeExchange_RefAfterSwapOf_0057
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=110) returns 5499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0057 begin`);
      const actual: number = refAfterSwapOf(-1, 110);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(5499);
      logInfo(`${BUNDLE}RefAfterSwapOf_0057 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0058
     * @tc.name      ListBeExchange_RefAfterSwapOf_0058
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=115) returns 5749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0058 begin`);
      const actual: number = refAfterSwapOf(-1, 115);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(5749);
      logInfo(`${BUNDLE}RefAfterSwapOf_0058 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0059
     * @tc.name      ListBeExchange_RefAfterSwapOf_0059
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=78.64) returns 3931
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0059 begin`);
      const actual: number = refAfterSwapOf(-1, 78.64);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(3931);
      logInfo(`${BUNDLE}RefAfterSwapOf_0059 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0060
     * @tc.name      ListBeExchange_RefAfterSwapOf_0060
     * @tc.desc      refAfterSwapOf(dragRefOffset=-1, direction=37) returns 1849
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0060 begin`);
      const actual: number = refAfterSwapOf(-1, 37);
      logInfo(`refAfterSwapOf(dragRefOffset=-1, directio...: actual=${actual}`);
      expect(actual).assertEqual(1849);
      logInfo(`${BUNDLE}RefAfterSwapOf_0060 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0061
     * @tc.name      ListBeExchange_RefAfterSwapOf_0061
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=2) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0061 begin`);
      const actual: number = refAfterSwapOf(0, 2);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction=2): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}RefAfterSwapOf_0061 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0062
     * @tc.name      ListBeExchange_RefAfterSwapOf_0062
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=10) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0062 begin`);
      const actual: number = refAfterSwapOf(0, 10);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}RefAfterSwapOf_0062 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0063
     * @tc.name      ListBeExchange_RefAfterSwapOf_0063
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=100) returns 5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0063 begin`);
      const actual: number = refAfterSwapOf(0, 100);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(5000);
      logInfo(`${BUNDLE}RefAfterSwapOf_0063 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0064
     * @tc.name      ListBeExchange_RefAfterSwapOf_0064
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=5) returns 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0064 begin`);
      const actual: number = refAfterSwapOf(0, 5);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction=5): actual=${actual}`);
      expect(actual).assertEqual(250);
      logInfo(`${BUNDLE}RefAfterSwapOf_0064 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0065
     * @tc.name      ListBeExchange_RefAfterSwapOf_0065
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=15) returns 750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0065 begin`);
      const actual: number = refAfterSwapOf(0, 15);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(750);
      logInfo(`${BUNDLE}RefAfterSwapOf_0065 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0066
     * @tc.name      ListBeExchange_RefAfterSwapOf_0066
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=20) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0066 begin`);
      const actual: number = refAfterSwapOf(0, 20);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}RefAfterSwapOf_0066 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0067
     * @tc.name      ListBeExchange_RefAfterSwapOf_0067
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=25) returns 1250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0067 begin`);
      const actual: number = refAfterSwapOf(0, 25);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(1250);
      logInfo(`${BUNDLE}RefAfterSwapOf_0067 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0068
     * @tc.name      ListBeExchange_RefAfterSwapOf_0068
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=30) returns 1500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0068 begin`);
      const actual: number = refAfterSwapOf(0, 30);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(1500);
      logInfo(`${BUNDLE}RefAfterSwapOf_0068 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0069
     * @tc.name      ListBeExchange_RefAfterSwapOf_0069
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=40) returns 2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0069 begin`);
      const actual: number = refAfterSwapOf(0, 40);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(2000);
      logInfo(`${BUNDLE}RefAfterSwapOf_0069 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0070
     * @tc.name      ListBeExchange_RefAfterSwapOf_0070
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=45) returns 2250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0070 begin`);
      const actual: number = refAfterSwapOf(0, 45);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(2250);
      logInfo(`${BUNDLE}RefAfterSwapOf_0070 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0071
     * @tc.name      ListBeExchange_RefAfterSwapOf_0071
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=50) returns 2500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0071 begin`);
      const actual: number = refAfterSwapOf(0, 50);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(2500);
      logInfo(`${BUNDLE}RefAfterSwapOf_0071 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0072
     * @tc.name      ListBeExchange_RefAfterSwapOf_0072
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=55) returns 2750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0072 begin`);
      const actual: number = refAfterSwapOf(0, 55);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(2750);
      logInfo(`${BUNDLE}RefAfterSwapOf_0072 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0073
     * @tc.name      ListBeExchange_RefAfterSwapOf_0073
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=60) returns 3000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0073 begin`);
      const actual: number = refAfterSwapOf(0, 60);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(3000);
      logInfo(`${BUNDLE}RefAfterSwapOf_0073 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0074
     * @tc.name      ListBeExchange_RefAfterSwapOf_0074
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=65) returns 3250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0074 begin`);
      const actual: number = refAfterSwapOf(0, 65);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(3250);
      logInfo(`${BUNDLE}RefAfterSwapOf_0074 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0075
     * @tc.name      ListBeExchange_RefAfterSwapOf_0075
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=70) returns 3500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0075 begin`);
      const actual: number = refAfterSwapOf(0, 70);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(3500);
      logInfo(`${BUNDLE}RefAfterSwapOf_0075 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0076
     * @tc.name      ListBeExchange_RefAfterSwapOf_0076
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=75) returns 3750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0076 begin`);
      const actual: number = refAfterSwapOf(0, 75);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(3750);
      logInfo(`${BUNDLE}RefAfterSwapOf_0076 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0077
     * @tc.name      ListBeExchange_RefAfterSwapOf_0077
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=80) returns 4000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0077 begin`);
      const actual: number = refAfterSwapOf(0, 80);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(4000);
      logInfo(`${BUNDLE}RefAfterSwapOf_0077 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0078
     * @tc.name      ListBeExchange_RefAfterSwapOf_0078
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=85) returns 4250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0078 begin`);
      const actual: number = refAfterSwapOf(0, 85);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(4250);
      logInfo(`${BUNDLE}RefAfterSwapOf_0078 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0079
     * @tc.name      ListBeExchange_RefAfterSwapOf_0079
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=90) returns 4500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0079 begin`);
      const actual: number = refAfterSwapOf(0, 90);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(4500);
      logInfo(`${BUNDLE}RefAfterSwapOf_0079 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0080
     * @tc.name      ListBeExchange_RefAfterSwapOf_0080
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=95) returns 4750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0080 begin`);
      const actual: number = refAfterSwapOf(0, 95);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(4750);
      logInfo(`${BUNDLE}RefAfterSwapOf_0080 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0081
     * @tc.name      ListBeExchange_RefAfterSwapOf_0081
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=105) returns 5250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0081 begin`);
      const actual: number = refAfterSwapOf(0, 105);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(5250);
      logInfo(`${BUNDLE}RefAfterSwapOf_0081 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0082
     * @tc.name      ListBeExchange_RefAfterSwapOf_0082
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=110) returns 5500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0082 begin`);
      const actual: number = refAfterSwapOf(0, 110);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(5500);
      logInfo(`${BUNDLE}RefAfterSwapOf_0082 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0083
     * @tc.name      ListBeExchange_RefAfterSwapOf_0083
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=115) returns 5750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0083 begin`);
      const actual: number = refAfterSwapOf(0, 115);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(5750);
      logInfo(`${BUNDLE}RefAfterSwapOf_0083 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0084
     * @tc.name      ListBeExchange_RefAfterSwapOf_0084
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=78.64) returns 3932
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0084 begin`);
      const actual: number = refAfterSwapOf(0, 78.64);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(3932);
      logInfo(`${BUNDLE}RefAfterSwapOf_0084 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0085
     * @tc.name      ListBeExchange_RefAfterSwapOf_0085
     * @tc.desc      refAfterSwapOf(dragRefOffset=0, direction=37) returns 1850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0085 begin`);
      const actual: number = refAfterSwapOf(0, 37);
      logInfo(`refAfterSwapOf(dragRefOffset=0, direction...: actual=${actual}`);
      expect(actual).assertEqual(1850);
      logInfo(`${BUNDLE}RefAfterSwapOf_0085 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0086
     * @tc.name      ListBeExchange_RefAfterSwapOf_0086
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0086 begin`);
      const actual: number = refAfterSwapOf(1, 0);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RefAfterSwapOf_0086 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0087
     * @tc.name      ListBeExchange_RefAfterSwapOf_0087
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=1) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0087 begin`);
      const actual: number = refAfterSwapOf(1, 1);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction=1): actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}RefAfterSwapOf_0087 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0088
     * @tc.name      ListBeExchange_RefAfterSwapOf_0088
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=-1) returns -49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RefAfterSwapOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0088 begin`);
      const actual: number = refAfterSwapOf(1, -1);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(-49);
      logInfo(`${BUNDLE}RefAfterSwapOf_0088 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0089
     * @tc.name      ListBeExchange_RefAfterSwapOf_0089
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=2) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0089 begin`);
      const actual: number = refAfterSwapOf(1, 2);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction=2): actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}RefAfterSwapOf_0089 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0090
     * @tc.name      ListBeExchange_RefAfterSwapOf_0090
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=3) returns 151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0090 begin`);
      const actual: number = refAfterSwapOf(1, 3);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction=3): actual=${actual}`);
      expect(actual).assertEqual(151);
      logInfo(`${BUNDLE}RefAfterSwapOf_0090 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0091
     * @tc.name      ListBeExchange_RefAfterSwapOf_0091
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=10) returns 501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0091 begin`);
      const actual: number = refAfterSwapOf(1, 10);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(501);
      logInfo(`${BUNDLE}RefAfterSwapOf_0091 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0092
     * @tc.name      ListBeExchange_RefAfterSwapOf_0092
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=100) returns 5001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0092 begin`);
      const actual: number = refAfterSwapOf(1, 100);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(5001);
      logInfo(`${BUNDLE}RefAfterSwapOf_0092 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0093
     * @tc.name      ListBeExchange_RefAfterSwapOf_0093
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=5) returns 251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0093 begin`);
      const actual: number = refAfterSwapOf(1, 5);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction=5): actual=${actual}`);
      expect(actual).assertEqual(251);
      logInfo(`${BUNDLE}RefAfterSwapOf_0093 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0094
     * @tc.name      ListBeExchange_RefAfterSwapOf_0094
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=15) returns 751
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0094 begin`);
      const actual: number = refAfterSwapOf(1, 15);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(751);
      logInfo(`${BUNDLE}RefAfterSwapOf_0094 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0095
     * @tc.name      ListBeExchange_RefAfterSwapOf_0095
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=20) returns 1001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0095 begin`);
      const actual: number = refAfterSwapOf(1, 20);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(1001);
      logInfo(`${BUNDLE}RefAfterSwapOf_0095 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_REF_AFTER_SWAP_OF_0096
     * @tc.name      ListBeExchange_RefAfterSwapOf_0096
     * @tc.desc      refAfterSwapOf(dragRefOffset=1, direction=25) returns 1251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RefAfterSwapOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RefAfterSwapOf_0096 begin`);
      const actual: number = refAfterSwapOf(1, 25);
      logInfo(`refAfterSwapOf(dragRefOffset=1, direction...: actual=${actual}`);
      expect(actual).assertEqual(1251);
      logInfo(`${BUNDLE}RefAfterSwapOf_0096 end`);
    });
  });
}
