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
import { canSwap } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for canSwap (50 cases). */
export default function canSwapTest(): void {
  describe('CanSwapTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0001
     * @tc.name      ListBeExchange_CanSwap_0001
     * @tc.desc      canSwap(index=0, direction=0, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_CanSwap_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}CanSwap_0001 begin`);
      const actual: boolean = canSwap(0, 0, 0);
      logInfo(`canSwap(index=0, direction=0, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0002
     * @tc.name      ListBeExchange_CanSwap_0002
     * @tc.desc      canSwap(index=0, direction=-1, length=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_CanSwap_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}CanSwap_0002 begin`);
      const actual: boolean = canSwap(0, -1, 0);
      logInfo(`canSwap(index=0, direction=-1, length=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CanSwap_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0003
     * @tc.name      ListBeExchange_CanSwap_0003
     * @tc.desc      canSwap(index=1, direction=0, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0003 begin`);
      const actual: boolean = canSwap(1, 0, 0);
      logInfo(`canSwap(index=1, direction=0, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0004
     * @tc.name      ListBeExchange_CanSwap_0004
     * @tc.desc      canSwap(index=-1, direction=0, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0004 begin`);
      const actual: boolean = canSwap(-1, 0, 0);
      logInfo(`canSwap(index=-1, direction=0, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0005
     * @tc.name      ListBeExchange_CanSwap_0005
     * @tc.desc      canSwap(index=-2, direction=0, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0005 begin`);
      const actual: boolean = canSwap(-2, 0, 0);
      logInfo(`canSwap(index=-2, direction=0, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0006
     * @tc.name      ListBeExchange_CanSwap_0006
     * @tc.desc      canSwap(index=2, direction=0, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0006 begin`);
      const actual: boolean = canSwap(2, 0, 0);
      logInfo(`canSwap(index=2, direction=0, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0007
     * @tc.name      ListBeExchange_CanSwap_0007
     * @tc.desc      canSwap(index=5, direction=0, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0007 begin`);
      const actual: boolean = canSwap(5, 0, 0);
      logInfo(`canSwap(index=5, direction=0, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0008
     * @tc.name      ListBeExchange_CanSwap_0008
     * @tc.desc      canSwap(index=10, direction=0, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0008 begin`);
      const actual: boolean = canSwap(10, 0, 0);
      logInfo(`canSwap(index=10, direction=0, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0009
     * @tc.name      ListBeExchange_CanSwap_0009
     * @tc.desc      canSwap(index=3, direction=0, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0009 begin`);
      const actual: boolean = canSwap(3, 0, 0);
      logInfo(`canSwap(index=3, direction=0, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0010
     * @tc.name      ListBeExchange_CanSwap_0010
     * @tc.desc      canSwap(index=100, direction=0, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0010 begin`);
      const actual: boolean = canSwap(100, 0, 0);
      logInfo(`canSwap(index=100, direction=0, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0011
     * @tc.name      ListBeExchange_CanSwap_0011
     * @tc.desc      canSwap(index=15, direction=0, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0011 begin`);
      const actual: boolean = canSwap(15, 0, 0);
      logInfo(`canSwap(index=15, direction=0, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0012
     * @tc.name      ListBeExchange_CanSwap_0012
     * @tc.desc      canSwap(index=-9, direction=0, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CanSwap_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CanSwap_0012 begin`);
      const actual: boolean = canSwap(-9, 0, 0);
      logInfo(`canSwap(index=-9, direction=0, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0013
     * @tc.name      ListBeExchange_CanSwap_0013
     * @tc.desc      canSwap(index=-85, direction=0, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CanSwap_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CanSwap_0013 begin`);
      const actual: boolean = canSwap(-85, 0, 0);
      logInfo(`canSwap(index=-85, direction=0, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0014
     * @tc.name      ListBeExchange_CanSwap_0014
     * @tc.desc      canSwap(index=0, direction=1, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0014 begin`);
      const actual: boolean = canSwap(0, 1, 0);
      logInfo(`canSwap(index=0, direction=1, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0015
     * @tc.name      ListBeExchange_CanSwap_0015
     * @tc.desc      canSwap(index=0, direction=-2, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0015 begin`);
      const actual: boolean = canSwap(0, -2, 0);
      logInfo(`canSwap(index=0, direction=-2, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0016
     * @tc.name      ListBeExchange_CanSwap_0016
     * @tc.desc      canSwap(index=0, direction=2, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0016 begin`);
      const actual: boolean = canSwap(0, 2, 0);
      logInfo(`canSwap(index=0, direction=2, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0017
     * @tc.name      ListBeExchange_CanSwap_0017
     * @tc.desc      canSwap(index=0, direction=3, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CanSwap_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CanSwap_0017 begin`);
      const actual: boolean = canSwap(0, 3, 0);
      logInfo(`canSwap(index=0, direction=3, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0018
     * @tc.name      ListBeExchange_CanSwap_0018
     * @tc.desc      canSwap(index=0, direction=10, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CanSwap_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CanSwap_0018 begin`);
      const actual: boolean = canSwap(0, 10, 0);
      logInfo(`canSwap(index=0, direction=10, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0019
     * @tc.name      ListBeExchange_CanSwap_0019
     * @tc.desc      canSwap(index=0, direction=100, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CanSwap_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CanSwap_0019 begin`);
      const actual: boolean = canSwap(0, 100, 0);
      logInfo(`canSwap(index=0, direction=100, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0020
     * @tc.name      ListBeExchange_CanSwap_0020
     * @tc.desc      canSwap(index=0, direction=5, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CanSwap_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CanSwap_0020 begin`);
      const actual: boolean = canSwap(0, 5, 0);
      logInfo(`canSwap(index=0, direction=5, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0021
     * @tc.name      ListBeExchange_CanSwap_0021
     * @tc.desc      canSwap(index=0, direction=15, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CanSwap_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CanSwap_0021 begin`);
      const actual: boolean = canSwap(0, 15, 0);
      logInfo(`canSwap(index=0, direction=15, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0022
     * @tc.name      ListBeExchange_CanSwap_0022
     * @tc.desc      canSwap(index=0, direction=20, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CanSwap_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CanSwap_0022 begin`);
      const actual: boolean = canSwap(0, 20, 0);
      logInfo(`canSwap(index=0, direction=20, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0023
     * @tc.name      ListBeExchange_CanSwap_0023
     * @tc.desc      canSwap(index=0, direction=-89, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CanSwap_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CanSwap_0023 begin`);
      const actual: boolean = canSwap(0, -89, 0);
      logInfo(`canSwap(index=0, direction=-89, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0024
     * @tc.name      ListBeExchange_CanSwap_0024
     * @tc.desc      canSwap(index=0, direction=0, length=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0024 begin`);
      const actual: boolean = canSwap(0, 0, 1);
      logInfo(`canSwap(index=0, direction=0, length=1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0025
     * @tc.name      ListBeExchange_CanSwap_0025
     * @tc.desc      canSwap(index=0, direction=0, length=-1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0025 begin`);
      const actual: boolean = canSwap(0, 0, -1);
      logInfo(`canSwap(index=0, direction=0, length=-1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0026
     * @tc.name      ListBeExchange_CanSwap_0026
     * @tc.desc      canSwap(index=0, direction=0, length=-2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0026 begin`);
      const actual: boolean = canSwap(0, 0, -2);
      logInfo(`canSwap(index=0, direction=0, length=-2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0027
     * @tc.name      ListBeExchange_CanSwap_0027
     * @tc.desc      canSwap(index=0, direction=0, length=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0027 begin`);
      const actual: boolean = canSwap(0, 0, 2);
      logInfo(`canSwap(index=0, direction=0, length=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0028
     * @tc.name      ListBeExchange_CanSwap_0028
     * @tc.desc      canSwap(index=0, direction=0, length=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0028 begin`);
      const actual: boolean = canSwap(0, 0, 5);
      logInfo(`canSwap(index=0, direction=0, length=5): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0029
     * @tc.name      ListBeExchange_CanSwap_0029
     * @tc.desc      canSwap(index=0, direction=0, length=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0029 begin`);
      const actual: boolean = canSwap(0, 0, 10);
      logInfo(`canSwap(index=0, direction=0, length=10): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0030
     * @tc.name      ListBeExchange_CanSwap_0030
     * @tc.desc      canSwap(index=0, direction=0, length=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0030 begin`);
      const actual: boolean = canSwap(0, 0, 100);
      logInfo(`canSwap(index=0, direction=0, length=100): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0030 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0031
     * @tc.name      ListBeExchange_CanSwap_0031
     * @tc.desc      canSwap(index=0, direction=0, length=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0031 begin`);
      const actual: boolean = canSwap(0, 0, 3);
      logInfo(`canSwap(index=0, direction=0, length=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0031 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0032
     * @tc.name      ListBeExchange_CanSwap_0032
     * @tc.desc      canSwap(index=0, direction=0, length=15) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0032 begin`);
      const actual: boolean = canSwap(0, 0, 15);
      logInfo(`canSwap(index=0, direction=0, length=15): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0032 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0033
     * @tc.name      ListBeExchange_CanSwap_0033
     * @tc.desc      canSwap(index=0, direction=0, length=49) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0033 begin`);
      const actual: boolean = canSwap(0, 0, 49);
      logInfo(`canSwap(index=0, direction=0, length=49): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0033 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0034
     * @tc.name      ListBeExchange_CanSwap_0034
     * @tc.desc      canSwap(index=0, direction=0, length=26) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0034 begin`);
      const actual: boolean = canSwap(0, 0, 26);
      logInfo(`canSwap(index=0, direction=0, length=26): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0034 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0035
     * @tc.name      ListBeExchange_CanSwap_0035
     * @tc.desc      canSwap(index=-2, direction=0, length=-2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0035 begin`);
      const actual: boolean = canSwap(-2, 0, -2);
      logInfo(`canSwap(index=-2, direction=0, length=-2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0035 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0036
     * @tc.name      ListBeExchange_CanSwap_0036
     * @tc.desc      canSwap(index=3, direction=20, length=26) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CanSwap_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CanSwap_0036 begin`);
      const actual: boolean = canSwap(3, 20, 26);
      logInfo(`canSwap(index=3, direction=20, length=26): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0036 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0037
     * @tc.name      ListBeExchange_CanSwap_0037
     * @tc.desc      canSwap(index=0, direction=20, length=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CanSwap_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CanSwap_0037 begin`);
      const actual: boolean = canSwap(0, 20, 3);
      logInfo(`canSwap(index=0, direction=20, length=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0037 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0038
     * @tc.name      ListBeExchange_CanSwap_0038
     * @tc.desc      canSwap(index=-2, direction=10, length=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0038 begin`);
      const actual: boolean = canSwap(-2, 10, 3);
      logInfo(`canSwap(index=-2, direction=10, length=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0038 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0039
     * @tc.name      ListBeExchange_CanSwap_0039
     * @tc.desc      canSwap(index=100, direction=20, length=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0039 begin`);
      const actual: boolean = canSwap(100, 20, 2);
      logInfo(`canSwap(index=100, direction=20, length=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0039 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0040
     * @tc.name      ListBeExchange_CanSwap_0040
     * @tc.desc      canSwap(index=10, direction=3, length=-2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0040 begin`);
      const actual: boolean = canSwap(10, 3, -2);
      logInfo(`canSwap(index=10, direction=3, length=-2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0040 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0041
     * @tc.name      ListBeExchange_CanSwap_0041
     * @tc.desc      canSwap(index=100, direction=2, length=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0041 begin`);
      const actual: boolean = canSwap(100, 2, 1);
      logInfo(`canSwap(index=100, direction=2, length=1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0041 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0042
     * @tc.name      ListBeExchange_CanSwap_0042
     * @tc.desc      canSwap(index=1, direction=-89, length=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CanSwap_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CanSwap_0042 begin`);
      const actual: boolean = canSwap(1, -89, 10);
      logInfo(`canSwap(index=1, direction=-89, length=10): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0042 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0043
     * @tc.name      ListBeExchange_CanSwap_0043
     * @tc.desc      canSwap(index=2, direction=20, length=26) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0043 begin`);
      const actual: boolean = canSwap(2, 20, 26);
      logInfo(`canSwap(index=2, direction=20, length=26): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0043 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0044
     * @tc.name      ListBeExchange_CanSwap_0044
     * @tc.desc      canSwap(index=100, direction=5, length=15) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CanSwap_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CanSwap_0044 begin`);
      const actual: boolean = canSwap(100, 5, 15);
      logInfo(`canSwap(index=100, direction=5, length=15): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0044 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0045
     * @tc.name      ListBeExchange_CanSwap_0045
     * @tc.desc      canSwap(index=3, direction=-1, length=-2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0045 begin`);
      const actual: boolean = canSwap(3, -1, -2);
      logInfo(`canSwap(index=3, direction=-1, length=-2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0045 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0046
     * @tc.name      ListBeExchange_CanSwap_0046
     * @tc.desc      canSwap(index=15, direction=1, length=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0046 begin`);
      const actual: boolean = canSwap(15, 1, 0);
      logInfo(`canSwap(index=15, direction=1, length=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0046 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0047
     * @tc.name      ListBeExchange_CanSwap_0047
     * @tc.desc      canSwap(index=3, direction=5, length=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CanSwap_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CanSwap_0047 begin`);
      const actual: boolean = canSwap(3, 5, 10);
      logInfo(`canSwap(index=3, direction=5, length=10): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0047 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0048
     * @tc.name      ListBeExchange_CanSwap_0048
     * @tc.desc      canSwap(index=-9, direction=-1, length=-1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CanSwap_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CanSwap_0048 begin`);
      const actual: boolean = canSwap(-9, -1, -1);
      logInfo(`canSwap(index=-9, direction=-1, length=-1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0048 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0049
     * @tc.name      ListBeExchange_CanSwap_0049
     * @tc.desc      canSwap(index=100, direction=5, length=49) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CanSwap_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CanSwap_0049 begin`);
      const actual: boolean = canSwap(100, 5, 49);
      logInfo(`canSwap(index=100, direction=5, length=49): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0049 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CAN_SWAP_0050
     * @tc.name      ListBeExchange_CanSwap_0050
     * @tc.desc      canSwap(index=-2, direction=20, length=-2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_CanSwap_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CanSwap_0050 begin`);
      const actual: boolean = canSwap(-2, 20, -2);
      logInfo(`canSwap(index=-2, direction=20, length=-2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}CanSwap_0050 end`);
    });
  });
}
