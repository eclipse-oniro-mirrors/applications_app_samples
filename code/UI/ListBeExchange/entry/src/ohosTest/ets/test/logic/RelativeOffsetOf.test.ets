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
import { relativeOffsetOf } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for relativeOffsetOf (96 cases). */
export default function relativeOffsetOfTest(): void {
  describe('RelativeOffsetOfTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0001
     * @tc.name      ListBeExchange_RelativeOffsetOf_0001
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=-100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_RelativeOffsetOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0001 begin`);
      const actual: number = relativeOffsetOf(-100, -100);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RelativeOffsetOf_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0002
     * @tc.name      ListBeExchange_RelativeOffsetOf_0002
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=-1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_RelativeOffsetOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0002 begin`);
      const actual: number = relativeOffsetOf(-100, -1);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-99);
      logInfo(`${BUNDLE}RelativeOffsetOf_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0003
     * @tc.name      ListBeExchange_RelativeOffsetOf_0003
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=0) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0003 begin`);
      const actual: number = relativeOffsetOf(-100, 0);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}RelativeOffsetOf_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0004
     * @tc.name      ListBeExchange_RelativeOffsetOf_0004
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=1) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0004 begin`);
      const actual: number = relativeOffsetOf(-100, 1);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-101);
      logInfo(`${BUNDLE}RelativeOffsetOf_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0005
     * @tc.name      ListBeExchange_RelativeOffsetOf_0005
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=50) returns -150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0005 begin`);
      const actual: number = relativeOffsetOf(-100, 50);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-150);
      logInfo(`${BUNDLE}RelativeOffsetOf_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0006
     * @tc.name      ListBeExchange_RelativeOffsetOf_0006
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0006 begin`);
      const actual: number = relativeOffsetOf(-100, 100);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-200);
      logInfo(`${BUNDLE}RelativeOffsetOf_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0007
     * @tc.name      ListBeExchange_RelativeOffsetOf_0007
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=2) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0007 begin`);
      const actual: number = relativeOffsetOf(-100, 2);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-102);
      logInfo(`${BUNDLE}RelativeOffsetOf_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0008
     * @tc.name      ListBeExchange_RelativeOffsetOf_0008
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=3) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0008 begin`);
      const actual: number = relativeOffsetOf(-100, 3);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-103);
      logInfo(`${BUNDLE}RelativeOffsetOf_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0009
     * @tc.name      ListBeExchange_RelativeOffsetOf_0009
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=10) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0009 begin`);
      const actual: number = relativeOffsetOf(-100, 10);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-110);
      logInfo(`${BUNDLE}RelativeOffsetOf_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0010
     * @tc.name      ListBeExchange_RelativeOffsetOf_0010
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=5) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0010 begin`);
      const actual: number = relativeOffsetOf(-100, 5);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-105);
      logInfo(`${BUNDLE}RelativeOffsetOf_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0011
     * @tc.name      ListBeExchange_RelativeOffsetOf_0011
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=15) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0011 begin`);
      const actual: number = relativeOffsetOf(-100, 15);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-115);
      logInfo(`${BUNDLE}RelativeOffsetOf_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0012
     * @tc.name      ListBeExchange_RelativeOffsetOf_0012
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=20) returns -120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0012 begin`);
      const actual: number = relativeOffsetOf(-100, 20);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-120);
      logInfo(`${BUNDLE}RelativeOffsetOf_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0013
     * @tc.name      ListBeExchange_RelativeOffsetOf_0013
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=25) returns -125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0013 begin`);
      const actual: number = relativeOffsetOf(-100, 25);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-125);
      logInfo(`${BUNDLE}RelativeOffsetOf_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0014
     * @tc.name      ListBeExchange_RelativeOffsetOf_0014
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=30) returns -130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0014 begin`);
      const actual: number = relativeOffsetOf(-100, 30);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-130);
      logInfo(`${BUNDLE}RelativeOffsetOf_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0015
     * @tc.name      ListBeExchange_RelativeOffsetOf_0015
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=35) returns -135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0015 begin`);
      const actual: number = relativeOffsetOf(-100, 35);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-135);
      logInfo(`${BUNDLE}RelativeOffsetOf_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0016
     * @tc.name      ListBeExchange_RelativeOffsetOf_0016
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=40) returns -140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0016 begin`);
      const actual: number = relativeOffsetOf(-100, 40);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-140);
      logInfo(`${BUNDLE}RelativeOffsetOf_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0017
     * @tc.name      ListBeExchange_RelativeOffsetOf_0017
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=45) returns -145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0017 begin`);
      const actual: number = relativeOffsetOf(-100, 45);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-145);
      logInfo(`${BUNDLE}RelativeOffsetOf_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0018
     * @tc.name      ListBeExchange_RelativeOffsetOf_0018
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=55) returns -155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0018 begin`);
      const actual: number = relativeOffsetOf(-100, 55);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-155);
      logInfo(`${BUNDLE}RelativeOffsetOf_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0019
     * @tc.name      ListBeExchange_RelativeOffsetOf_0019
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=60) returns -160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0019 begin`);
      const actual: number = relativeOffsetOf(-100, 60);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-160);
      logInfo(`${BUNDLE}RelativeOffsetOf_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0020
     * @tc.name      ListBeExchange_RelativeOffsetOf_0020
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=65) returns -165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0020 begin`);
      const actual: number = relativeOffsetOf(-100, 65);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-165);
      logInfo(`${BUNDLE}RelativeOffsetOf_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0021
     * @tc.name      ListBeExchange_RelativeOffsetOf_0021
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=70) returns -170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0021 begin`);
      const actual: number = relativeOffsetOf(-100, 70);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-170);
      logInfo(`${BUNDLE}RelativeOffsetOf_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0022
     * @tc.name      ListBeExchange_RelativeOffsetOf_0022
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=75) returns -175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0022 begin`);
      const actual: number = relativeOffsetOf(-100, 75);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-175);
      logInfo(`${BUNDLE}RelativeOffsetOf_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0023
     * @tc.name      ListBeExchange_RelativeOffsetOf_0023
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=80) returns -180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0023 begin`);
      const actual: number = relativeOffsetOf(-100, 80);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-180);
      logInfo(`${BUNDLE}RelativeOffsetOf_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0024
     * @tc.name      ListBeExchange_RelativeOffsetOf_0024
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=85) returns -185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0024 begin`);
      const actual: number = relativeOffsetOf(-100, 85);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-185);
      logInfo(`${BUNDLE}RelativeOffsetOf_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0025
     * @tc.name      ListBeExchange_RelativeOffsetOf_0025
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=90) returns -190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0025 begin`);
      const actual: number = relativeOffsetOf(-100, 90);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-190);
      logInfo(`${BUNDLE}RelativeOffsetOf_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0026
     * @tc.name      ListBeExchange_RelativeOffsetOf_0026
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=95) returns -195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0026 begin`);
      const actual: number = relativeOffsetOf(-100, 95);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-195);
      logInfo(`${BUNDLE}RelativeOffsetOf_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0027
     * @tc.name      ListBeExchange_RelativeOffsetOf_0027
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=105) returns -205
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0027 begin`);
      const actual: number = relativeOffsetOf(-100, 105);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-205);
      logInfo(`${BUNDLE}RelativeOffsetOf_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0028
     * @tc.name      ListBeExchange_RelativeOffsetOf_0028
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=133) returns -233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0028 begin`);
      const actual: number = relativeOffsetOf(-100, 133);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-233);
      logInfo(`${BUNDLE}RelativeOffsetOf_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0029
     * @tc.name      ListBeExchange_RelativeOffsetOf_0029
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=134) returns -234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0029 begin`);
      const actual: number = relativeOffsetOf(-100, 134);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-234);
      logInfo(`${BUNDLE}RelativeOffsetOf_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0030
     * @tc.name      ListBeExchange_RelativeOffsetOf_0030
     * @tc.desc      relativeOffsetOf(offsetY=-100, dragRefOffset=143) returns -243
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0030 begin`);
      const actual: number = relativeOffsetOf(-100, 143);
      logInfo(`relativeOffsetOf(offsetY=-100, dragRefOff...: actual=${actual}`);
      expect(actual).assertEqual(-243);
      logInfo(`${BUNDLE}RelativeOffsetOf_0030 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0031
     * @tc.name      ListBeExchange_RelativeOffsetOf_0031
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=-100) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0031 begin`);
      const actual: number = relativeOffsetOf(-1, -100);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}RelativeOffsetOf_0031 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0032
     * @tc.name      ListBeExchange_RelativeOffsetOf_0032
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0032 begin`);
      const actual: number = relativeOffsetOf(-1, 0);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}RelativeOffsetOf_0032 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0033
     * @tc.name      ListBeExchange_RelativeOffsetOf_0033
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=1) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0033 begin`);
      const actual: number = relativeOffsetOf(-1, 1);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}RelativeOffsetOf_0033 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0034
     * @tc.name      ListBeExchange_RelativeOffsetOf_0034
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=50) returns -51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0034 begin`);
      const actual: number = relativeOffsetOf(-1, 50);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-51);
      logInfo(`${BUNDLE}RelativeOffsetOf_0034 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0035
     * @tc.name      ListBeExchange_RelativeOffsetOf_0035
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=2) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0035 begin`);
      const actual: number = relativeOffsetOf(-1, 2);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}RelativeOffsetOf_0035 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0036
     * @tc.name      ListBeExchange_RelativeOffsetOf_0036
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=3) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0036 begin`);
      const actual: number = relativeOffsetOf(-1, 3);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}RelativeOffsetOf_0036 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0037
     * @tc.name      ListBeExchange_RelativeOffsetOf_0037
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=10) returns -11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0037 begin`);
      const actual: number = relativeOffsetOf(-1, 10);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-11);
      logInfo(`${BUNDLE}RelativeOffsetOf_0037 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0038
     * @tc.name      ListBeExchange_RelativeOffsetOf_0038
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=5) returns -6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0038 begin`);
      const actual: number = relativeOffsetOf(-1, 5);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-6);
      logInfo(`${BUNDLE}RelativeOffsetOf_0038 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0039
     * @tc.name      ListBeExchange_RelativeOffsetOf_0039
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=15) returns -16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0039 begin`);
      const actual: number = relativeOffsetOf(-1, 15);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-16);
      logInfo(`${BUNDLE}RelativeOffsetOf_0039 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0040
     * @tc.name      ListBeExchange_RelativeOffsetOf_0040
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=20) returns -21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0040 begin`);
      const actual: number = relativeOffsetOf(-1, 20);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-21);
      logInfo(`${BUNDLE}RelativeOffsetOf_0040 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0041
     * @tc.name      ListBeExchange_RelativeOffsetOf_0041
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=25) returns -26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0041 begin`);
      const actual: number = relativeOffsetOf(-1, 25);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-26);
      logInfo(`${BUNDLE}RelativeOffsetOf_0041 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0042
     * @tc.name      ListBeExchange_RelativeOffsetOf_0042
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=30) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0042 begin`);
      const actual: number = relativeOffsetOf(-1, 30);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}RelativeOffsetOf_0042 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0043
     * @tc.name      ListBeExchange_RelativeOffsetOf_0043
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=35) returns -36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0043 begin`);
      const actual: number = relativeOffsetOf(-1, 35);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-36);
      logInfo(`${BUNDLE}RelativeOffsetOf_0043 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0044
     * @tc.name      ListBeExchange_RelativeOffsetOf_0044
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=40) returns -41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0044 begin`);
      const actual: number = relativeOffsetOf(-1, 40);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-41);
      logInfo(`${BUNDLE}RelativeOffsetOf_0044 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0045
     * @tc.name      ListBeExchange_RelativeOffsetOf_0045
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=45) returns -46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0045 begin`);
      const actual: number = relativeOffsetOf(-1, 45);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-46);
      logInfo(`${BUNDLE}RelativeOffsetOf_0045 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0046
     * @tc.name      ListBeExchange_RelativeOffsetOf_0046
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=55) returns -56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0046 begin`);
      const actual: number = relativeOffsetOf(-1, 55);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-56);
      logInfo(`${BUNDLE}RelativeOffsetOf_0046 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0047
     * @tc.name      ListBeExchange_RelativeOffsetOf_0047
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=60) returns -61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0047 begin`);
      const actual: number = relativeOffsetOf(-1, 60);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-61);
      logInfo(`${BUNDLE}RelativeOffsetOf_0047 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0048
     * @tc.name      ListBeExchange_RelativeOffsetOf_0048
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=65) returns -66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0048 begin`);
      const actual: number = relativeOffsetOf(-1, 65);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-66);
      logInfo(`${BUNDLE}RelativeOffsetOf_0048 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0049
     * @tc.name      ListBeExchange_RelativeOffsetOf_0049
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=70) returns -71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0049 begin`);
      const actual: number = relativeOffsetOf(-1, 70);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-71);
      logInfo(`${BUNDLE}RelativeOffsetOf_0049 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0050
     * @tc.name      ListBeExchange_RelativeOffsetOf_0050
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=75) returns -76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0050 begin`);
      const actual: number = relativeOffsetOf(-1, 75);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-76);
      logInfo(`${BUNDLE}RelativeOffsetOf_0050 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0051
     * @tc.name      ListBeExchange_RelativeOffsetOf_0051
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=80) returns -81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0051 begin`);
      const actual: number = relativeOffsetOf(-1, 80);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-81);
      logInfo(`${BUNDLE}RelativeOffsetOf_0051 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0052
     * @tc.name      ListBeExchange_RelativeOffsetOf_0052
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=85) returns -86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0052 begin`);
      const actual: number = relativeOffsetOf(-1, 85);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-86);
      logInfo(`${BUNDLE}RelativeOffsetOf_0052 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0053
     * @tc.name      ListBeExchange_RelativeOffsetOf_0053
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=90) returns -91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0053 begin`);
      const actual: number = relativeOffsetOf(-1, 90);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-91);
      logInfo(`${BUNDLE}RelativeOffsetOf_0053 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0054
     * @tc.name      ListBeExchange_RelativeOffsetOf_0054
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=95) returns -96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0054 begin`);
      const actual: number = relativeOffsetOf(-1, 95);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-96);
      logInfo(`${BUNDLE}RelativeOffsetOf_0054 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0055
     * @tc.name      ListBeExchange_RelativeOffsetOf_0055
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=105) returns -106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0055 begin`);
      const actual: number = relativeOffsetOf(-1, 105);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-106);
      logInfo(`${BUNDLE}RelativeOffsetOf_0055 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0056
     * @tc.name      ListBeExchange_RelativeOffsetOf_0056
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=133) returns -134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0056 begin`);
      const actual: number = relativeOffsetOf(-1, 133);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-134);
      logInfo(`${BUNDLE}RelativeOffsetOf_0056 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0057
     * @tc.name      ListBeExchange_RelativeOffsetOf_0057
     * @tc.desc      relativeOffsetOf(offsetY=-1, dragRefOffset=143) returns -144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0057 begin`);
      const actual: number = relativeOffsetOf(-1, 143);
      logInfo(`relativeOffsetOf(offsetY=-1, dragRefOffse...: actual=${actual}`);
      expect(actual).assertEqual(-144);
      logInfo(`${BUNDLE}RelativeOffsetOf_0057 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0058
     * @tc.name      ListBeExchange_RelativeOffsetOf_0058
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=-100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0058 begin`);
      const actual: number = relativeOffsetOf(0, -100);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}RelativeOffsetOf_0058 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0059
     * @tc.name      ListBeExchange_RelativeOffsetOf_0059
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0059 begin`);
      const actual: number = relativeOffsetOf(0, -1);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RelativeOffsetOf_0059 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0060
     * @tc.name      ListBeExchange_RelativeOffsetOf_0060
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=50) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0060 begin`);
      const actual: number = relativeOffsetOf(0, 50);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}RelativeOffsetOf_0060 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0061
     * @tc.name      ListBeExchange_RelativeOffsetOf_0061
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=10) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0061 begin`);
      const actual: number = relativeOffsetOf(0, 10);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}RelativeOffsetOf_0061 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0062
     * @tc.name      ListBeExchange_RelativeOffsetOf_0062
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=5) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0062 begin`);
      const actual: number = relativeOffsetOf(0, 5);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset=5): actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}RelativeOffsetOf_0062 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0063
     * @tc.name      ListBeExchange_RelativeOffsetOf_0063
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0063 begin`);
      const actual: number = relativeOffsetOf(0, 15);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}RelativeOffsetOf_0063 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0064
     * @tc.name      ListBeExchange_RelativeOffsetOf_0064
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=20) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0064 begin`);
      const actual: number = relativeOffsetOf(0, 20);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}RelativeOffsetOf_0064 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0065
     * @tc.name      ListBeExchange_RelativeOffsetOf_0065
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=25) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0065 begin`);
      const actual: number = relativeOffsetOf(0, 25);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}RelativeOffsetOf_0065 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0066
     * @tc.name      ListBeExchange_RelativeOffsetOf_0066
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=30) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0066 begin`);
      const actual: number = relativeOffsetOf(0, 30);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}RelativeOffsetOf_0066 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0067
     * @tc.name      ListBeExchange_RelativeOffsetOf_0067
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=35) returns -35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0067 begin`);
      const actual: number = relativeOffsetOf(0, 35);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-35);
      logInfo(`${BUNDLE}RelativeOffsetOf_0067 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0068
     * @tc.name      ListBeExchange_RelativeOffsetOf_0068
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=40) returns -40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0068 begin`);
      const actual: number = relativeOffsetOf(0, 40);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-40);
      logInfo(`${BUNDLE}RelativeOffsetOf_0068 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0069
     * @tc.name      ListBeExchange_RelativeOffsetOf_0069
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0069 begin`);
      const actual: number = relativeOffsetOf(0, 45);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}RelativeOffsetOf_0069 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0070
     * @tc.name      ListBeExchange_RelativeOffsetOf_0070
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=55) returns -55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0070 begin`);
      const actual: number = relativeOffsetOf(0, 55);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-55);
      logInfo(`${BUNDLE}RelativeOffsetOf_0070 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0071
     * @tc.name      ListBeExchange_RelativeOffsetOf_0071
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=60) returns -60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0071 begin`);
      const actual: number = relativeOffsetOf(0, 60);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-60);
      logInfo(`${BUNDLE}RelativeOffsetOf_0071 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0072
     * @tc.name      ListBeExchange_RelativeOffsetOf_0072
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=65) returns -65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0072 begin`);
      const actual: number = relativeOffsetOf(0, 65);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-65);
      logInfo(`${BUNDLE}RelativeOffsetOf_0072 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0073
     * @tc.name      ListBeExchange_RelativeOffsetOf_0073
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=70) returns -70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0073 begin`);
      const actual: number = relativeOffsetOf(0, 70);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-70);
      logInfo(`${BUNDLE}RelativeOffsetOf_0073 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0074
     * @tc.name      ListBeExchange_RelativeOffsetOf_0074
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=75) returns -75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0074 begin`);
      const actual: number = relativeOffsetOf(0, 75);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-75);
      logInfo(`${BUNDLE}RelativeOffsetOf_0074 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0075
     * @tc.name      ListBeExchange_RelativeOffsetOf_0075
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=80) returns -80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0075 begin`);
      const actual: number = relativeOffsetOf(0, 80);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-80);
      logInfo(`${BUNDLE}RelativeOffsetOf_0075 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0076
     * @tc.name      ListBeExchange_RelativeOffsetOf_0076
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=85) returns -85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0076 begin`);
      const actual: number = relativeOffsetOf(0, 85);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-85);
      logInfo(`${BUNDLE}RelativeOffsetOf_0076 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0077
     * @tc.name      ListBeExchange_RelativeOffsetOf_0077
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=90) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0077 begin`);
      const actual: number = relativeOffsetOf(0, 90);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}RelativeOffsetOf_0077 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0078
     * @tc.name      ListBeExchange_RelativeOffsetOf_0078
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=95) returns -95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0078 begin`);
      const actual: number = relativeOffsetOf(0, 95);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-95);
      logInfo(`${BUNDLE}RelativeOffsetOf_0078 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0079
     * @tc.name      ListBeExchange_RelativeOffsetOf_0079
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=133) returns -133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0079 begin`);
      const actual: number = relativeOffsetOf(0, 133);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-133);
      logInfo(`${BUNDLE}RelativeOffsetOf_0079 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0080
     * @tc.name      ListBeExchange_RelativeOffsetOf_0080
     * @tc.desc      relativeOffsetOf(offsetY=0, dragRefOffset=143) returns -143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0080 begin`);
      const actual: number = relativeOffsetOf(0, 143);
      logInfo(`relativeOffsetOf(offsetY=0, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-143);
      logInfo(`${BUNDLE}RelativeOffsetOf_0080 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0081
     * @tc.name      ListBeExchange_RelativeOffsetOf_0081
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=-100) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0081 begin`);
      const actual: number = relativeOffsetOf(1, -100);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}RelativeOffsetOf_0081 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0082
     * @tc.name      ListBeExchange_RelativeOffsetOf_0082
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=-1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_RelativeOffsetOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0082 begin`);
      const actual: number = relativeOffsetOf(1, -1);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}RelativeOffsetOf_0082 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0083
     * @tc.name      ListBeExchange_RelativeOffsetOf_0083
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=50) returns -49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0083 begin`);
      const actual: number = relativeOffsetOf(1, 50);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-49);
      logInfo(`${BUNDLE}RelativeOffsetOf_0083 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0084
     * @tc.name      ListBeExchange_RelativeOffsetOf_0084
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=10) returns -9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0084 begin`);
      const actual: number = relativeOffsetOf(1, 10);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-9);
      logInfo(`${BUNDLE}RelativeOffsetOf_0084 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0085
     * @tc.name      ListBeExchange_RelativeOffsetOf_0085
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=15) returns -14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0085 begin`);
      const actual: number = relativeOffsetOf(1, 15);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-14);
      logInfo(`${BUNDLE}RelativeOffsetOf_0085 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0086
     * @tc.name      ListBeExchange_RelativeOffsetOf_0086
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=20) returns -19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0086 begin`);
      const actual: number = relativeOffsetOf(1, 20);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-19);
      logInfo(`${BUNDLE}RelativeOffsetOf_0086 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0087
     * @tc.name      ListBeExchange_RelativeOffsetOf_0087
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=25) returns -24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0087 begin`);
      const actual: number = relativeOffsetOf(1, 25);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-24);
      logInfo(`${BUNDLE}RelativeOffsetOf_0087 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0088
     * @tc.name      ListBeExchange_RelativeOffsetOf_0088
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=30) returns -29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0088 begin`);
      const actual: number = relativeOffsetOf(1, 30);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-29);
      logInfo(`${BUNDLE}RelativeOffsetOf_0088 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0089
     * @tc.name      ListBeExchange_RelativeOffsetOf_0089
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=35) returns -34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0089 begin`);
      const actual: number = relativeOffsetOf(1, 35);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-34);
      logInfo(`${BUNDLE}RelativeOffsetOf_0089 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0090
     * @tc.name      ListBeExchange_RelativeOffsetOf_0090
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=40) returns -39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0090 begin`);
      const actual: number = relativeOffsetOf(1, 40);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-39);
      logInfo(`${BUNDLE}RelativeOffsetOf_0090 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0091
     * @tc.name      ListBeExchange_RelativeOffsetOf_0091
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=45) returns -44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0091 begin`);
      const actual: number = relativeOffsetOf(1, 45);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-44);
      logInfo(`${BUNDLE}RelativeOffsetOf_0091 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0092
     * @tc.name      ListBeExchange_RelativeOffsetOf_0092
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=55) returns -54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0092 begin`);
      const actual: number = relativeOffsetOf(1, 55);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-54);
      logInfo(`${BUNDLE}RelativeOffsetOf_0092 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0093
     * @tc.name      ListBeExchange_RelativeOffsetOf_0093
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=60) returns -59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0093 begin`);
      const actual: number = relativeOffsetOf(1, 60);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-59);
      logInfo(`${BUNDLE}RelativeOffsetOf_0093 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0094
     * @tc.name      ListBeExchange_RelativeOffsetOf_0094
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=65) returns -64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0094 begin`);
      const actual: number = relativeOffsetOf(1, 65);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-64);
      logInfo(`${BUNDLE}RelativeOffsetOf_0094 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0095
     * @tc.name      ListBeExchange_RelativeOffsetOf_0095
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=70) returns -69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0095 begin`);
      const actual: number = relativeOffsetOf(1, 70);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-69);
      logInfo(`${BUNDLE}RelativeOffsetOf_0095 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_RELATIVE_OFFSET_OF_0096
     * @tc.name      ListBeExchange_RelativeOffsetOf_0096
     * @tc.desc      relativeOffsetOf(offsetY=1, dragRefOffset=75) returns -74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_RelativeOffsetOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RelativeOffsetOf_0096 begin`);
      const actual: number = relativeOffsetOf(1, 75);
      logInfo(`relativeOffsetOf(offsetY=1, dragRefOffset...: actual=${actual}`);
      expect(actual).assertEqual(-74);
      logInfo(`${BUNDLE}RelativeOffsetOf_0096 end`);
    });
  });
}
