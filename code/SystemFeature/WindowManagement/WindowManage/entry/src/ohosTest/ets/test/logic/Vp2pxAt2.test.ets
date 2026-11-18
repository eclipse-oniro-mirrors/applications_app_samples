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
import { vp2pxAt } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for vp2pxAt (96 cases). */
export default function vp2pxAt2Test(): void {
  describe('Vp2pxAt2Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0097
     * @tc.name      WindowManage_Vp2pxAt_0097
     * @tc.desc      vp2pxAt(vp=10, density=65) returns 650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0097 begin`);
      const actual: number = vp2pxAt(10, 65);
      logInfo(`vp2pxAt(vp=10, density=65): actual=${actual}`);
      expect(actual).assertEqual(650);
      logInfo(`${BUNDLE}Vp2pxAt_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0098
     * @tc.name      WindowManage_Vp2pxAt_0098
     * @tc.desc      vp2pxAt(vp=10, density=70) returns 700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0098 begin`);
      const actual: number = vp2pxAt(10, 70);
      logInfo(`vp2pxAt(vp=10, density=70): actual=${actual}`);
      expect(actual).assertEqual(700);
      logInfo(`${BUNDLE}Vp2pxAt_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0099
     * @tc.name      WindowManage_Vp2pxAt_0099
     * @tc.desc      vp2pxAt(vp=10, density=75) returns 750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0099 begin`);
      const actual: number = vp2pxAt(10, 75);
      logInfo(`vp2pxAt(vp=10, density=75): actual=${actual}`);
      expect(actual).assertEqual(750);
      logInfo(`${BUNDLE}Vp2pxAt_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0100
     * @tc.name      WindowManage_Vp2pxAt_0100
     * @tc.desc      vp2pxAt(vp=10, density=80) returns 800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0100 begin`);
      const actual: number = vp2pxAt(10, 80);
      logInfo(`vp2pxAt(vp=10, density=80): actual=${actual}`);
      expect(actual).assertEqual(800);
      logInfo(`${BUNDLE}Vp2pxAt_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0101
     * @tc.name      WindowManage_Vp2pxAt_0101
     * @tc.desc      vp2pxAt(vp=10, density=85) returns 850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0101 begin`);
      const actual: number = vp2pxAt(10, 85);
      logInfo(`vp2pxAt(vp=10, density=85): actual=${actual}`);
      expect(actual).assertEqual(850);
      logInfo(`${BUNDLE}Vp2pxAt_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0102
     * @tc.name      WindowManage_Vp2pxAt_0102
     * @tc.desc      vp2pxAt(vp=10, density=90) returns 900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0102 begin`);
      const actual: number = vp2pxAt(10, 90);
      logInfo(`vp2pxAt(vp=10, density=90): actual=${actual}`);
      expect(actual).assertEqual(900);
      logInfo(`${BUNDLE}Vp2pxAt_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0103
     * @tc.name      WindowManage_Vp2pxAt_0103
     * @tc.desc      vp2pxAt(vp=10, density=95) returns 950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0103 begin`);
      const actual: number = vp2pxAt(10, 95);
      logInfo(`vp2pxAt(vp=10, density=95): actual=${actual}`);
      expect(actual).assertEqual(950);
      logInfo(`${BUNDLE}Vp2pxAt_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0104
     * @tc.name      WindowManage_Vp2pxAt_0104
     * @tc.desc      vp2pxAt(vp=10, density=105) returns 1050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0104 begin`);
      const actual: number = vp2pxAt(10, 105);
      logInfo(`vp2pxAt(vp=10, density=105): actual=${actual}`);
      expect(actual).assertEqual(1050);
      logInfo(`${BUNDLE}Vp2pxAt_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0105
     * @tc.name      WindowManage_Vp2pxAt_0105
     * @tc.desc      vp2pxAt(vp=10, density=110) returns 1100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0105 begin`);
      const actual: number = vp2pxAt(10, 110);
      logInfo(`vp2pxAt(vp=10, density=110): actual=${actual}`);
      expect(actual).assertEqual(1100);
      logInfo(`${BUNDLE}Vp2pxAt_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0106
     * @tc.name      WindowManage_Vp2pxAt_0106
     * @tc.desc      vp2pxAt(vp=10, density=115) returns 1150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0106 begin`);
      const actual: number = vp2pxAt(10, 115);
      logInfo(`vp2pxAt(vp=10, density=115): actual=${actual}`);
      expect(actual).assertEqual(1150);
      logInfo(`${BUNDLE}Vp2pxAt_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0107
     * @tc.name      WindowManage_Vp2pxAt_0107
     * @tc.desc      vp2pxAt(vp=10, density=66.02) returns 660.1999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0107 begin`);
      const actual: number = vp2pxAt(10, 66.02);
      logInfo(`vp2pxAt(vp=10, density=66.02): actual=${actual}`);
      expect(actual).assertClose(660.1999999999999, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0108
     * @tc.name      WindowManage_Vp2pxAt_0108
     * @tc.desc      vp2pxAt(vp=10, density=-36) returns -360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0108 begin`);
      const actual: number = vp2pxAt(10, -36);
      logInfo(`vp2pxAt(vp=10, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-360);
      logInfo(`${BUNDLE}Vp2pxAt_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0109
     * @tc.name      WindowManage_Vp2pxAt_0109
     * @tc.desc      vp2pxAt(vp=100, density=100) returns 10000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0109 begin`);
      const actual: number = vp2pxAt(100, 100);
      logInfo(`vp2pxAt(vp=100, density=100): actual=${actual}`);
      expect(actual).assertEqual(10000);
      logInfo(`${BUNDLE}Vp2pxAt_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0110
     * @tc.name      WindowManage_Vp2pxAt_0110
     * @tc.desc      vp2pxAt(vp=100, density=15) returns 1500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0110 begin`);
      const actual: number = vp2pxAt(100, 15);
      logInfo(`vp2pxAt(vp=100, density=15): actual=${actual}`);
      expect(actual).assertEqual(1500);
      logInfo(`${BUNDLE}Vp2pxAt_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0111
     * @tc.name      WindowManage_Vp2pxAt_0111
     * @tc.desc      vp2pxAt(vp=100, density=20) returns 2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0111 begin`);
      const actual: number = vp2pxAt(100, 20);
      logInfo(`vp2pxAt(vp=100, density=20): actual=${actual}`);
      expect(actual).assertEqual(2000);
      logInfo(`${BUNDLE}Vp2pxAt_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0112
     * @tc.name      WindowManage_Vp2pxAt_0112
     * @tc.desc      vp2pxAt(vp=100, density=25) returns 2500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0112 begin`);
      const actual: number = vp2pxAt(100, 25);
      logInfo(`vp2pxAt(vp=100, density=25): actual=${actual}`);
      expect(actual).assertEqual(2500);
      logInfo(`${BUNDLE}Vp2pxAt_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0113
     * @tc.name      WindowManage_Vp2pxAt_0113
     * @tc.desc      vp2pxAt(vp=100, density=30) returns 3000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0113 begin`);
      const actual: number = vp2pxAt(100, 30);
      logInfo(`vp2pxAt(vp=100, density=30): actual=${actual}`);
      expect(actual).assertEqual(3000);
      logInfo(`${BUNDLE}Vp2pxAt_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0114
     * @tc.name      WindowManage_Vp2pxAt_0114
     * @tc.desc      vp2pxAt(vp=100, density=35) returns 3500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0114 begin`);
      const actual: number = vp2pxAt(100, 35);
      logInfo(`vp2pxAt(vp=100, density=35): actual=${actual}`);
      expect(actual).assertEqual(3500);
      logInfo(`${BUNDLE}Vp2pxAt_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0115
     * @tc.name      WindowManage_Vp2pxAt_0115
     * @tc.desc      vp2pxAt(vp=100, density=40) returns 4000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0115 begin`);
      const actual: number = vp2pxAt(100, 40);
      logInfo(`vp2pxAt(vp=100, density=40): actual=${actual}`);
      expect(actual).assertEqual(4000);
      logInfo(`${BUNDLE}Vp2pxAt_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0116
     * @tc.name      WindowManage_Vp2pxAt_0116
     * @tc.desc      vp2pxAt(vp=100, density=45) returns 4500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0116 begin`);
      const actual: number = vp2pxAt(100, 45);
      logInfo(`vp2pxAt(vp=100, density=45): actual=${actual}`);
      expect(actual).assertEqual(4500);
      logInfo(`${BUNDLE}Vp2pxAt_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0117
     * @tc.name      WindowManage_Vp2pxAt_0117
     * @tc.desc      vp2pxAt(vp=100, density=50) returns 5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0117 begin`);
      const actual: number = vp2pxAt(100, 50);
      logInfo(`vp2pxAt(vp=100, density=50): actual=${actual}`);
      expect(actual).assertEqual(5000);
      logInfo(`${BUNDLE}Vp2pxAt_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0118
     * @tc.name      WindowManage_Vp2pxAt_0118
     * @tc.desc      vp2pxAt(vp=100, density=55) returns 5500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0118 begin`);
      const actual: number = vp2pxAt(100, 55);
      logInfo(`vp2pxAt(vp=100, density=55): actual=${actual}`);
      expect(actual).assertEqual(5500);
      logInfo(`${BUNDLE}Vp2pxAt_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0119
     * @tc.name      WindowManage_Vp2pxAt_0119
     * @tc.desc      vp2pxAt(vp=100, density=60) returns 6000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0119 begin`);
      const actual: number = vp2pxAt(100, 60);
      logInfo(`vp2pxAt(vp=100, density=60): actual=${actual}`);
      expect(actual).assertEqual(6000);
      logInfo(`${BUNDLE}Vp2pxAt_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0120
     * @tc.name      WindowManage_Vp2pxAt_0120
     * @tc.desc      vp2pxAt(vp=100, density=65) returns 6500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0120 begin`);
      const actual: number = vp2pxAt(100, 65);
      logInfo(`vp2pxAt(vp=100, density=65): actual=${actual}`);
      expect(actual).assertEqual(6500);
      logInfo(`${BUNDLE}Vp2pxAt_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0121
     * @tc.name      WindowManage_Vp2pxAt_0121
     * @tc.desc      vp2pxAt(vp=100, density=70) returns 7000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0121 begin`);
      const actual: number = vp2pxAt(100, 70);
      logInfo(`vp2pxAt(vp=100, density=70): actual=${actual}`);
      expect(actual).assertEqual(7000);
      logInfo(`${BUNDLE}Vp2pxAt_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0122
     * @tc.name      WindowManage_Vp2pxAt_0122
     * @tc.desc      vp2pxAt(vp=100, density=75) returns 7500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0122 begin`);
      const actual: number = vp2pxAt(100, 75);
      logInfo(`vp2pxAt(vp=100, density=75): actual=${actual}`);
      expect(actual).assertEqual(7500);
      logInfo(`${BUNDLE}Vp2pxAt_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0123
     * @tc.name      WindowManage_Vp2pxAt_0123
     * @tc.desc      vp2pxAt(vp=100, density=80) returns 8000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0123 begin`);
      const actual: number = vp2pxAt(100, 80);
      logInfo(`vp2pxAt(vp=100, density=80): actual=${actual}`);
      expect(actual).assertEqual(8000);
      logInfo(`${BUNDLE}Vp2pxAt_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0124
     * @tc.name      WindowManage_Vp2pxAt_0124
     * @tc.desc      vp2pxAt(vp=100, density=85) returns 8500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0124 begin`);
      const actual: number = vp2pxAt(100, 85);
      logInfo(`vp2pxAt(vp=100, density=85): actual=${actual}`);
      expect(actual).assertEqual(8500);
      logInfo(`${BUNDLE}Vp2pxAt_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0125
     * @tc.name      WindowManage_Vp2pxAt_0125
     * @tc.desc      vp2pxAt(vp=100, density=90) returns 9000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0125 begin`);
      const actual: number = vp2pxAt(100, 90);
      logInfo(`vp2pxAt(vp=100, density=90): actual=${actual}`);
      expect(actual).assertEqual(9000);
      logInfo(`${BUNDLE}Vp2pxAt_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0126
     * @tc.name      WindowManage_Vp2pxAt_0126
     * @tc.desc      vp2pxAt(vp=100, density=95) returns 9500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0126 begin`);
      const actual: number = vp2pxAt(100, 95);
      logInfo(`vp2pxAt(vp=100, density=95): actual=${actual}`);
      expect(actual).assertEqual(9500);
      logInfo(`${BUNDLE}Vp2pxAt_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0127
     * @tc.name      WindowManage_Vp2pxAt_0127
     * @tc.desc      vp2pxAt(vp=100, density=105) returns 10500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0127 begin`);
      const actual: number = vp2pxAt(100, 105);
      logInfo(`vp2pxAt(vp=100, density=105): actual=${actual}`);
      expect(actual).assertEqual(10500);
      logInfo(`${BUNDLE}Vp2pxAt_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0128
     * @tc.name      WindowManage_Vp2pxAt_0128
     * @tc.desc      vp2pxAt(vp=100, density=110) returns 11000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0128 begin`);
      const actual: number = vp2pxAt(100, 110);
      logInfo(`vp2pxAt(vp=100, density=110): actual=${actual}`);
      expect(actual).assertEqual(11000);
      logInfo(`${BUNDLE}Vp2pxAt_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0129
     * @tc.name      WindowManage_Vp2pxAt_0129
     * @tc.desc      vp2pxAt(vp=100, density=115) returns 11500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0129 begin`);
      const actual: number = vp2pxAt(100, 115);
      logInfo(`vp2pxAt(vp=100, density=115): actual=${actual}`);
      expect(actual).assertEqual(11500);
      logInfo(`${BUNDLE}Vp2pxAt_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0130
     * @tc.name      WindowManage_Vp2pxAt_0130
     * @tc.desc      vp2pxAt(vp=100, density=66.02) returns 6602
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0130 begin`);
      const actual: number = vp2pxAt(100, 66.02);
      logInfo(`vp2pxAt(vp=100, density=66.02): actual=${actual}`);
      expect(actual).assertEqual(6602);
      logInfo(`${BUNDLE}Vp2pxAt_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0131
     * @tc.name      WindowManage_Vp2pxAt_0131
     * @tc.desc      vp2pxAt(vp=100, density=-36) returns -3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0131 begin`);
      const actual: number = vp2pxAt(100, -36);
      logInfo(`vp2pxAt(vp=100, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-3600);
      logInfo(`${BUNDLE}Vp2pxAt_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0132
     * @tc.name      WindowManage_Vp2pxAt_0132
     * @tc.desc      vp2pxAt(vp=5, density=25) returns 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0132 begin`);
      const actual: number = vp2pxAt(5, 25);
      logInfo(`vp2pxAt(vp=5, density=25): actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}Vp2pxAt_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0133
     * @tc.name      WindowManage_Vp2pxAt_0133
     * @tc.desc      vp2pxAt(vp=5, density=35) returns 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0133 begin`);
      const actual: number = vp2pxAt(5, 35);
      logInfo(`vp2pxAt(vp=5, density=35): actual=${actual}`);
      expect(actual).assertEqual(175);
      logInfo(`${BUNDLE}Vp2pxAt_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0134
     * @tc.name      WindowManage_Vp2pxAt_0134
     * @tc.desc      vp2pxAt(vp=5, density=55) returns 275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0134 begin`);
      const actual: number = vp2pxAt(5, 55);
      logInfo(`vp2pxAt(vp=5, density=55): actual=${actual}`);
      expect(actual).assertEqual(275);
      logInfo(`${BUNDLE}Vp2pxAt_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0135
     * @tc.name      WindowManage_Vp2pxAt_0135
     * @tc.desc      vp2pxAt(vp=5, density=65) returns 325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0135 begin`);
      const actual: number = vp2pxAt(5, 65);
      logInfo(`vp2pxAt(vp=5, density=65): actual=${actual}`);
      expect(actual).assertEqual(325);
      logInfo(`${BUNDLE}Vp2pxAt_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0136
     * @tc.name      WindowManage_Vp2pxAt_0136
     * @tc.desc      vp2pxAt(vp=5, density=75) returns 375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0136 begin`);
      const actual: number = vp2pxAt(5, 75);
      logInfo(`vp2pxAt(vp=5, density=75): actual=${actual}`);
      expect(actual).assertEqual(375);
      logInfo(`${BUNDLE}Vp2pxAt_0136 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0137
     * @tc.name      WindowManage_Vp2pxAt_0137
     * @tc.desc      vp2pxAt(vp=5, density=85) returns 425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0137 begin`);
      const actual: number = vp2pxAt(5, 85);
      logInfo(`vp2pxAt(vp=5, density=85): actual=${actual}`);
      expect(actual).assertEqual(425);
      logInfo(`${BUNDLE}Vp2pxAt_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0138
     * @tc.name      WindowManage_Vp2pxAt_0138
     * @tc.desc      vp2pxAt(vp=5, density=95) returns 475
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0138 begin`);
      const actual: number = vp2pxAt(5, 95);
      logInfo(`vp2pxAt(vp=5, density=95): actual=${actual}`);
      expect(actual).assertEqual(475);
      logInfo(`${BUNDLE}Vp2pxAt_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0139
     * @tc.name      WindowManage_Vp2pxAt_0139
     * @tc.desc      vp2pxAt(vp=5, density=105) returns 525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0139 begin`);
      const actual: number = vp2pxAt(5, 105);
      logInfo(`vp2pxAt(vp=5, density=105): actual=${actual}`);
      expect(actual).assertEqual(525);
      logInfo(`${BUNDLE}Vp2pxAt_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0140
     * @tc.name      WindowManage_Vp2pxAt_0140
     * @tc.desc      vp2pxAt(vp=5, density=115) returns 575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0140 begin`);
      const actual: number = vp2pxAt(5, 115);
      logInfo(`vp2pxAt(vp=5, density=115): actual=${actual}`);
      expect(actual).assertEqual(575);
      logInfo(`${BUNDLE}Vp2pxAt_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0141
     * @tc.name      WindowManage_Vp2pxAt_0141
     * @tc.desc      vp2pxAt(vp=5, density=66.02) returns 330.09999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0141 begin`);
      const actual: number = vp2pxAt(5, 66.02);
      logInfo(`vp2pxAt(vp=5, density=66.02): actual=${actual}`);
      expect(actual).assertClose(330.09999999999997, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0142
     * @tc.name      WindowManage_Vp2pxAt_0142
     * @tc.desc      vp2pxAt(vp=5, density=-36) returns -180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0142 begin`);
      const actual: number = vp2pxAt(5, -36);
      logInfo(`vp2pxAt(vp=5, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-180);
      logInfo(`${BUNDLE}Vp2pxAt_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0143
     * @tc.name      WindowManage_Vp2pxAt_0143
     * @tc.desc      vp2pxAt(vp=15, density=45) returns 675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0143 begin`);
      const actual: number = vp2pxAt(15, 45);
      logInfo(`vp2pxAt(vp=15, density=45): actual=${actual}`);
      expect(actual).assertEqual(675);
      logInfo(`${BUNDLE}Vp2pxAt_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0144
     * @tc.name      WindowManage_Vp2pxAt_0144
     * @tc.desc      vp2pxAt(vp=15, density=55) returns 825
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0144 begin`);
      const actual: number = vp2pxAt(15, 55);
      logInfo(`vp2pxAt(vp=15, density=55): actual=${actual}`);
      expect(actual).assertEqual(825);
      logInfo(`${BUNDLE}Vp2pxAt_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0145
     * @tc.name      WindowManage_Vp2pxAt_0145
     * @tc.desc      vp2pxAt(vp=15, density=65) returns 975
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0145 begin`);
      const actual: number = vp2pxAt(15, 65);
      logInfo(`vp2pxAt(vp=15, density=65): actual=${actual}`);
      expect(actual).assertEqual(975);
      logInfo(`${BUNDLE}Vp2pxAt_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0146
     * @tc.name      WindowManage_Vp2pxAt_0146
     * @tc.desc      vp2pxAt(vp=15, density=75) returns 1125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0146 begin`);
      const actual: number = vp2pxAt(15, 75);
      logInfo(`vp2pxAt(vp=15, density=75): actual=${actual}`);
      expect(actual).assertEqual(1125);
      logInfo(`${BUNDLE}Vp2pxAt_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0147
     * @tc.name      WindowManage_Vp2pxAt_0147
     * @tc.desc      vp2pxAt(vp=15, density=80) returns 1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0147 begin`);
      const actual: number = vp2pxAt(15, 80);
      logInfo(`vp2pxAt(vp=15, density=80): actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}Vp2pxAt_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0148
     * @tc.name      WindowManage_Vp2pxAt_0148
     * @tc.desc      vp2pxAt(vp=15, density=85) returns 1275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0148 begin`);
      const actual: number = vp2pxAt(15, 85);
      logInfo(`vp2pxAt(vp=15, density=85): actual=${actual}`);
      expect(actual).assertEqual(1275);
      logInfo(`${BUNDLE}Vp2pxAt_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0149
     * @tc.name      WindowManage_Vp2pxAt_0149
     * @tc.desc      vp2pxAt(vp=15, density=90) returns 1350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0149 begin`);
      const actual: number = vp2pxAt(15, 90);
      logInfo(`vp2pxAt(vp=15, density=90): actual=${actual}`);
      expect(actual).assertEqual(1350);
      logInfo(`${BUNDLE}Vp2pxAt_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0150
     * @tc.name      WindowManage_Vp2pxAt_0150
     * @tc.desc      vp2pxAt(vp=15, density=95) returns 1425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0150 begin`);
      const actual: number = vp2pxAt(15, 95);
      logInfo(`vp2pxAt(vp=15, density=95): actual=${actual}`);
      expect(actual).assertEqual(1425);
      logInfo(`${BUNDLE}Vp2pxAt_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0151
     * @tc.name      WindowManage_Vp2pxAt_0151
     * @tc.desc      vp2pxAt(vp=15, density=105) returns 1575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0151 begin`);
      const actual: number = vp2pxAt(15, 105);
      logInfo(`vp2pxAt(vp=15, density=105): actual=${actual}`);
      expect(actual).assertEqual(1575);
      logInfo(`${BUNDLE}Vp2pxAt_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0152
     * @tc.name      WindowManage_Vp2pxAt_0152
     * @tc.desc      vp2pxAt(vp=15, density=110) returns 1650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0152 begin`);
      const actual: number = vp2pxAt(15, 110);
      logInfo(`vp2pxAt(vp=15, density=110): actual=${actual}`);
      expect(actual).assertEqual(1650);
      logInfo(`${BUNDLE}Vp2pxAt_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0153
     * @tc.name      WindowManage_Vp2pxAt_0153
     * @tc.desc      vp2pxAt(vp=15, density=115) returns 1725
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0153 begin`);
      const actual: number = vp2pxAt(15, 115);
      logInfo(`vp2pxAt(vp=15, density=115): actual=${actual}`);
      expect(actual).assertEqual(1725);
      logInfo(`${BUNDLE}Vp2pxAt_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0154
     * @tc.name      WindowManage_Vp2pxAt_0154
     * @tc.desc      vp2pxAt(vp=15, density=66.02) returns 990.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0154 begin`);
      const actual: number = vp2pxAt(15, 66.02);
      logInfo(`vp2pxAt(vp=15, density=66.02): actual=${actual}`);
      expect(actual).assertClose(990.3, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0155
     * @tc.name      WindowManage_Vp2pxAt_0155
     * @tc.desc      vp2pxAt(vp=15, density=-36) returns -540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0155 begin`);
      const actual: number = vp2pxAt(15, -36);
      logInfo(`vp2pxAt(vp=15, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-540);
      logInfo(`${BUNDLE}Vp2pxAt_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0156
     * @tc.name      WindowManage_Vp2pxAt_0156
     * @tc.desc      vp2pxAt(vp=20, density=65) returns 1300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0156 begin`);
      const actual: number = vp2pxAt(20, 65);
      logInfo(`vp2pxAt(vp=20, density=65): actual=${actual}`);
      expect(actual).assertEqual(1300);
      logInfo(`${BUNDLE}Vp2pxAt_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0157
     * @tc.name      WindowManage_Vp2pxAt_0157
     * @tc.desc      vp2pxAt(vp=20, density=70) returns 1400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0157 begin`);
      const actual: number = vp2pxAt(20, 70);
      logInfo(`vp2pxAt(vp=20, density=70): actual=${actual}`);
      expect(actual).assertEqual(1400);
      logInfo(`${BUNDLE}Vp2pxAt_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0158
     * @tc.name      WindowManage_Vp2pxAt_0158
     * @tc.desc      vp2pxAt(vp=20, density=80) returns 1600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0158 begin`);
      const actual: number = vp2pxAt(20, 80);
      logInfo(`vp2pxAt(vp=20, density=80): actual=${actual}`);
      expect(actual).assertEqual(1600);
      logInfo(`${BUNDLE}Vp2pxAt_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0159
     * @tc.name      WindowManage_Vp2pxAt_0159
     * @tc.desc      vp2pxAt(vp=20, density=85) returns 1700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0159 begin`);
      const actual: number = vp2pxAt(20, 85);
      logInfo(`vp2pxAt(vp=20, density=85): actual=${actual}`);
      expect(actual).assertEqual(1700);
      logInfo(`${BUNDLE}Vp2pxAt_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0160
     * @tc.name      WindowManage_Vp2pxAt_0160
     * @tc.desc      vp2pxAt(vp=20, density=90) returns 1800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0160 begin`);
      const actual: number = vp2pxAt(20, 90);
      logInfo(`vp2pxAt(vp=20, density=90): actual=${actual}`);
      expect(actual).assertEqual(1800);
      logInfo(`${BUNDLE}Vp2pxAt_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0161
     * @tc.name      WindowManage_Vp2pxAt_0161
     * @tc.desc      vp2pxAt(vp=20, density=95) returns 1900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0161 begin`);
      const actual: number = vp2pxAt(20, 95);
      logInfo(`vp2pxAt(vp=20, density=95): actual=${actual}`);
      expect(actual).assertEqual(1900);
      logInfo(`${BUNDLE}Vp2pxAt_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0162
     * @tc.name      WindowManage_Vp2pxAt_0162
     * @tc.desc      vp2pxAt(vp=20, density=105) returns 2100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0162 begin`);
      const actual: number = vp2pxAt(20, 105);
      logInfo(`vp2pxAt(vp=20, density=105): actual=${actual}`);
      expect(actual).assertEqual(2100);
      logInfo(`${BUNDLE}Vp2pxAt_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0163
     * @tc.name      WindowManage_Vp2pxAt_0163
     * @tc.desc      vp2pxAt(vp=20, density=110) returns 2200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0163 begin`);
      const actual: number = vp2pxAt(20, 110);
      logInfo(`vp2pxAt(vp=20, density=110): actual=${actual}`);
      expect(actual).assertEqual(2200);
      logInfo(`${BUNDLE}Vp2pxAt_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0164
     * @tc.name      WindowManage_Vp2pxAt_0164
     * @tc.desc      vp2pxAt(vp=20, density=115) returns 2300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0164 begin`);
      const actual: number = vp2pxAt(20, 115);
      logInfo(`vp2pxAt(vp=20, density=115): actual=${actual}`);
      expect(actual).assertEqual(2300);
      logInfo(`${BUNDLE}Vp2pxAt_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0165
     * @tc.name      WindowManage_Vp2pxAt_0165
     * @tc.desc      vp2pxAt(vp=20, density=66.02) returns 1320.3999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0165 begin`);
      const actual: number = vp2pxAt(20, 66.02);
      logInfo(`vp2pxAt(vp=20, density=66.02): actual=${actual}`);
      expect(actual).assertClose(1320.3999999999999, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0166
     * @tc.name      WindowManage_Vp2pxAt_0166
     * @tc.desc      vp2pxAt(vp=20, density=-36) returns -720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0166 begin`);
      const actual: number = vp2pxAt(20, -36);
      logInfo(`vp2pxAt(vp=20, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-720);
      logInfo(`${BUNDLE}Vp2pxAt_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0167
     * @tc.name      WindowManage_Vp2pxAt_0167
     * @tc.desc      vp2pxAt(vp=25, density=25) returns 625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0167 begin`);
      const actual: number = vp2pxAt(25, 25);
      logInfo(`vp2pxAt(vp=25, density=25): actual=${actual}`);
      expect(actual).assertEqual(625);
      logInfo(`${BUNDLE}Vp2pxAt_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0168
     * @tc.name      WindowManage_Vp2pxAt_0168
     * @tc.desc      vp2pxAt(vp=25, density=35) returns 875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0168 begin`);
      const actual: number = vp2pxAt(25, 35);
      logInfo(`vp2pxAt(vp=25, density=35): actual=${actual}`);
      expect(actual).assertEqual(875);
      logInfo(`${BUNDLE}Vp2pxAt_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0169
     * @tc.name      WindowManage_Vp2pxAt_0169
     * @tc.desc      vp2pxAt(vp=25, density=50) returns 1250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0169 begin`);
      const actual: number = vp2pxAt(25, 50);
      logInfo(`vp2pxAt(vp=25, density=50): actual=${actual}`);
      expect(actual).assertEqual(1250);
      logInfo(`${BUNDLE}Vp2pxAt_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0170
     * @tc.name      WindowManage_Vp2pxAt_0170
     * @tc.desc      vp2pxAt(vp=25, density=55) returns 1375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0170 begin`);
      const actual: number = vp2pxAt(25, 55);
      logInfo(`vp2pxAt(vp=25, density=55): actual=${actual}`);
      expect(actual).assertEqual(1375);
      logInfo(`${BUNDLE}Vp2pxAt_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0171
     * @tc.name      WindowManage_Vp2pxAt_0171
     * @tc.desc      vp2pxAt(vp=25, density=65) returns 1625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0171 begin`);
      const actual: number = vp2pxAt(25, 65);
      logInfo(`vp2pxAt(vp=25, density=65): actual=${actual}`);
      expect(actual).assertEqual(1625);
      logInfo(`${BUNDLE}Vp2pxAt_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0172
     * @tc.name      WindowManage_Vp2pxAt_0172
     * @tc.desc      vp2pxAt(vp=25, density=70) returns 1750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0172 begin`);
      const actual: number = vp2pxAt(25, 70);
      logInfo(`vp2pxAt(vp=25, density=70): actual=${actual}`);
      expect(actual).assertEqual(1750);
      logInfo(`${BUNDLE}Vp2pxAt_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0173
     * @tc.name      WindowManage_Vp2pxAt_0173
     * @tc.desc      vp2pxAt(vp=25, density=75) returns 1875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0173 begin`);
      const actual: number = vp2pxAt(25, 75);
      logInfo(`vp2pxAt(vp=25, density=75): actual=${actual}`);
      expect(actual).assertEqual(1875);
      logInfo(`${BUNDLE}Vp2pxAt_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0174
     * @tc.name      WindowManage_Vp2pxAt_0174
     * @tc.desc      vp2pxAt(vp=25, density=85) returns 2125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0174 begin`);
      const actual: number = vp2pxAt(25, 85);
      logInfo(`vp2pxAt(vp=25, density=85): actual=${actual}`);
      expect(actual).assertEqual(2125);
      logInfo(`${BUNDLE}Vp2pxAt_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0175
     * @tc.name      WindowManage_Vp2pxAt_0175
     * @tc.desc      vp2pxAt(vp=25, density=90) returns 2250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0175 begin`);
      const actual: number = vp2pxAt(25, 90);
      logInfo(`vp2pxAt(vp=25, density=90): actual=${actual}`);
      expect(actual).assertEqual(2250);
      logInfo(`${BUNDLE}Vp2pxAt_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0176
     * @tc.name      WindowManage_Vp2pxAt_0176
     * @tc.desc      vp2pxAt(vp=25, density=95) returns 2375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0176 begin`);
      const actual: number = vp2pxAt(25, 95);
      logInfo(`vp2pxAt(vp=25, density=95): actual=${actual}`);
      expect(actual).assertEqual(2375);
      logInfo(`${BUNDLE}Vp2pxAt_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0177
     * @tc.name      WindowManage_Vp2pxAt_0177
     * @tc.desc      vp2pxAt(vp=25, density=105) returns 2625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0177 begin`);
      const actual: number = vp2pxAt(25, 105);
      logInfo(`vp2pxAt(vp=25, density=105): actual=${actual}`);
      expect(actual).assertEqual(2625);
      logInfo(`${BUNDLE}Vp2pxAt_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0178
     * @tc.name      WindowManage_Vp2pxAt_0178
     * @tc.desc      vp2pxAt(vp=25, density=110) returns 2750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0178 begin`);
      const actual: number = vp2pxAt(25, 110);
      logInfo(`vp2pxAt(vp=25, density=110): actual=${actual}`);
      expect(actual).assertEqual(2750);
      logInfo(`${BUNDLE}Vp2pxAt_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0179
     * @tc.name      WindowManage_Vp2pxAt_0179
     * @tc.desc      vp2pxAt(vp=25, density=115) returns 2875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0179 begin`);
      const actual: number = vp2pxAt(25, 115);
      logInfo(`vp2pxAt(vp=25, density=115): actual=${actual}`);
      expect(actual).assertEqual(2875);
      logInfo(`${BUNDLE}Vp2pxAt_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0180
     * @tc.name      WindowManage_Vp2pxAt_0180
     * @tc.desc      vp2pxAt(vp=25, density=66.02) returns 1650.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0180 begin`);
      const actual: number = vp2pxAt(25, 66.02);
      logInfo(`vp2pxAt(vp=25, density=66.02): actual=${actual}`);
      expect(actual).assertClose(1650.5, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0181
     * @tc.name      WindowManage_Vp2pxAt_0181
     * @tc.desc      vp2pxAt(vp=25, density=-36) returns -900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0181 begin`);
      const actual: number = vp2pxAt(25, -36);
      logInfo(`vp2pxAt(vp=25, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-900);
      logInfo(`${BUNDLE}Vp2pxAt_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0182
     * @tc.name      WindowManage_Vp2pxAt_0182
     * @tc.desc      vp2pxAt(vp=30, density=65) returns 1950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0182 begin`);
      const actual: number = vp2pxAt(30, 65);
      logInfo(`vp2pxAt(vp=30, density=65): actual=${actual}`);
      expect(actual).assertEqual(1950);
      logInfo(`${BUNDLE}Vp2pxAt_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0183
     * @tc.name      WindowManage_Vp2pxAt_0183
     * @tc.desc      vp2pxAt(vp=30, density=80) returns 2400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0183 begin`);
      const actual: number = vp2pxAt(30, 80);
      logInfo(`vp2pxAt(vp=30, density=80): actual=${actual}`);
      expect(actual).assertEqual(2400);
      logInfo(`${BUNDLE}Vp2pxAt_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0184
     * @tc.name      WindowManage_Vp2pxAt_0184
     * @tc.desc      vp2pxAt(vp=30, density=85) returns 2550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0184 begin`);
      const actual: number = vp2pxAt(30, 85);
      logInfo(`vp2pxAt(vp=30, density=85): actual=${actual}`);
      expect(actual).assertEqual(2550);
      logInfo(`${BUNDLE}Vp2pxAt_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0185
     * @tc.name      WindowManage_Vp2pxAt_0185
     * @tc.desc      vp2pxAt(vp=30, density=90) returns 2700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0185 begin`);
      const actual: number = vp2pxAt(30, 90);
      logInfo(`vp2pxAt(vp=30, density=90): actual=${actual}`);
      expect(actual).assertEqual(2700);
      logInfo(`${BUNDLE}Vp2pxAt_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0186
     * @tc.name      WindowManage_Vp2pxAt_0186
     * @tc.desc      vp2pxAt(vp=30, density=95) returns 2850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0186 begin`);
      const actual: number = vp2pxAt(30, 95);
      logInfo(`vp2pxAt(vp=30, density=95): actual=${actual}`);
      expect(actual).assertEqual(2850);
      logInfo(`${BUNDLE}Vp2pxAt_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0187
     * @tc.name      WindowManage_Vp2pxAt_0187
     * @tc.desc      vp2pxAt(vp=30, density=105) returns 3150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0187 begin`);
      const actual: number = vp2pxAt(30, 105);
      logInfo(`vp2pxAt(vp=30, density=105): actual=${actual}`);
      expect(actual).assertEqual(3150);
      logInfo(`${BUNDLE}Vp2pxAt_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0188
     * @tc.name      WindowManage_Vp2pxAt_0188
     * @tc.desc      vp2pxAt(vp=30, density=110) returns 3300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0188 begin`);
      const actual: number = vp2pxAt(30, 110);
      logInfo(`vp2pxAt(vp=30, density=110): actual=${actual}`);
      expect(actual).assertEqual(3300);
      logInfo(`${BUNDLE}Vp2pxAt_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0189
     * @tc.name      WindowManage_Vp2pxAt_0189
     * @tc.desc      vp2pxAt(vp=30, density=115) returns 3450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0189 begin`);
      const actual: number = vp2pxAt(30, 115);
      logInfo(`vp2pxAt(vp=30, density=115): actual=${actual}`);
      expect(actual).assertEqual(3450);
      logInfo(`${BUNDLE}Vp2pxAt_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0190
     * @tc.name      WindowManage_Vp2pxAt_0190
     * @tc.desc      vp2pxAt(vp=30, density=66.02) returns 1980.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0190 begin`);
      const actual: number = vp2pxAt(30, 66.02);
      logInfo(`vp2pxAt(vp=30, density=66.02): actual=${actual}`);
      expect(actual).assertClose(1980.6, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0191
     * @tc.name      WindowManage_Vp2pxAt_0191
     * @tc.desc      vp2pxAt(vp=30, density=-36) returns -1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0191 begin`);
      const actual: number = vp2pxAt(30, -36);
      logInfo(`vp2pxAt(vp=30, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-1080);
      logInfo(`${BUNDLE}Vp2pxAt_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0192
     * @tc.name      WindowManage_Vp2pxAt_0192
     * @tc.desc      vp2pxAt(vp=35, density=35) returns 1225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0192 begin`);
      const actual: number = vp2pxAt(35, 35);
      logInfo(`vp2pxAt(vp=35, density=35): actual=${actual}`);
      expect(actual).assertEqual(1225);
      logInfo(`${BUNDLE}Vp2pxAt_0192 end`);
    });
  });
}
