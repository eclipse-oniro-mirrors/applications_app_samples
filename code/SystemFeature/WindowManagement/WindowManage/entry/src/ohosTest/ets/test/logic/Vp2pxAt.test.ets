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
export default function vp2pxAtTest(): void {
  describe('Vp2pxAtTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0001
     * @tc.name      WindowManage_Vp2pxAt_0001
     * @tc.desc      vp2pxAt(vp=0, density=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_Vp2pxAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0001 begin`);
      const actual: number = vp2pxAt(0, 0);
      logInfo(`vp2pxAt(vp=0, density=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Vp2pxAt_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0002
     * @tc.name      WindowManage_Vp2pxAt_0002
     * @tc.desc      vp2pxAt(vp=1, density=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_Vp2pxAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0002 begin`);
      const actual: number = vp2pxAt(1, 1);
      logInfo(`vp2pxAt(vp=1, density=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}Vp2pxAt_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0003
     * @tc.name      WindowManage_Vp2pxAt_0003
     * @tc.desc      vp2pxAt(vp=1, density=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0003 begin`);
      const actual: number = vp2pxAt(1, -1);
      logInfo(`vp2pxAt(vp=1, density=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}Vp2pxAt_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0004
     * @tc.name      WindowManage_Vp2pxAt_0004
     * @tc.desc      vp2pxAt(vp=1, density=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0004 begin`);
      const actual: number = vp2pxAt(1, 2);
      logInfo(`vp2pxAt(vp=1, density=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}Vp2pxAt_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0005
     * @tc.name      WindowManage_Vp2pxAt_0005
     * @tc.desc      vp2pxAt(vp=1, density=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0005 begin`);
      const actual: number = vp2pxAt(1, 3);
      logInfo(`vp2pxAt(vp=1, density=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}Vp2pxAt_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0006
     * @tc.name      WindowManage_Vp2pxAt_0006
     * @tc.desc      vp2pxAt(vp=1, density=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0006 begin`);
      const actual: number = vp2pxAt(1, 10);
      logInfo(`vp2pxAt(vp=1, density=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}Vp2pxAt_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0007
     * @tc.name      WindowManage_Vp2pxAt_0007
     * @tc.desc      vp2pxAt(vp=1, density=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0007 begin`);
      const actual: number = vp2pxAt(1, 100);
      logInfo(`vp2pxAt(vp=1, density=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}Vp2pxAt_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0008
     * @tc.name      WindowManage_Vp2pxAt_0008
     * @tc.desc      vp2pxAt(vp=1, density=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0008 begin`);
      const actual: number = vp2pxAt(1, 5);
      logInfo(`vp2pxAt(vp=1, density=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}Vp2pxAt_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0009
     * @tc.name      WindowManage_Vp2pxAt_0009
     * @tc.desc      vp2pxAt(vp=1, density=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0009 begin`);
      const actual: number = vp2pxAt(1, 15);
      logInfo(`vp2pxAt(vp=1, density=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}Vp2pxAt_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0010
     * @tc.name      WindowManage_Vp2pxAt_0010
     * @tc.desc      vp2pxAt(vp=1, density=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0010 begin`);
      const actual: number = vp2pxAt(1, 20);
      logInfo(`vp2pxAt(vp=1, density=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}Vp2pxAt_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0011
     * @tc.name      WindowManage_Vp2pxAt_0011
     * @tc.desc      vp2pxAt(vp=1, density=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0011 begin`);
      const actual: number = vp2pxAt(1, 25);
      logInfo(`vp2pxAt(vp=1, density=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}Vp2pxAt_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0012
     * @tc.name      WindowManage_Vp2pxAt_0012
     * @tc.desc      vp2pxAt(vp=1, density=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0012 begin`);
      const actual: number = vp2pxAt(1, 30);
      logInfo(`vp2pxAt(vp=1, density=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}Vp2pxAt_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0013
     * @tc.name      WindowManage_Vp2pxAt_0013
     * @tc.desc      vp2pxAt(vp=1, density=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0013 begin`);
      const actual: number = vp2pxAt(1, 35);
      logInfo(`vp2pxAt(vp=1, density=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}Vp2pxAt_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0014
     * @tc.name      WindowManage_Vp2pxAt_0014
     * @tc.desc      vp2pxAt(vp=1, density=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0014 begin`);
      const actual: number = vp2pxAt(1, 40);
      logInfo(`vp2pxAt(vp=1, density=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}Vp2pxAt_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0015
     * @tc.name      WindowManage_Vp2pxAt_0015
     * @tc.desc      vp2pxAt(vp=1, density=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0015 begin`);
      const actual: number = vp2pxAt(1, 45);
      logInfo(`vp2pxAt(vp=1, density=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}Vp2pxAt_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0016
     * @tc.name      WindowManage_Vp2pxAt_0016
     * @tc.desc      vp2pxAt(vp=1, density=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0016 begin`);
      const actual: number = vp2pxAt(1, 50);
      logInfo(`vp2pxAt(vp=1, density=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}Vp2pxAt_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0017
     * @tc.name      WindowManage_Vp2pxAt_0017
     * @tc.desc      vp2pxAt(vp=1, density=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0017 begin`);
      const actual: number = vp2pxAt(1, 55);
      logInfo(`vp2pxAt(vp=1, density=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}Vp2pxAt_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0018
     * @tc.name      WindowManage_Vp2pxAt_0018
     * @tc.desc      vp2pxAt(vp=1, density=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0018 begin`);
      const actual: number = vp2pxAt(1, 60);
      logInfo(`vp2pxAt(vp=1, density=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}Vp2pxAt_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0019
     * @tc.name      WindowManage_Vp2pxAt_0019
     * @tc.desc      vp2pxAt(vp=1, density=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0019 begin`);
      const actual: number = vp2pxAt(1, 65);
      logInfo(`vp2pxAt(vp=1, density=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}Vp2pxAt_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0020
     * @tc.name      WindowManage_Vp2pxAt_0020
     * @tc.desc      vp2pxAt(vp=1, density=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0020 begin`);
      const actual: number = vp2pxAt(1, 70);
      logInfo(`vp2pxAt(vp=1, density=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}Vp2pxAt_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0021
     * @tc.name      WindowManage_Vp2pxAt_0021
     * @tc.desc      vp2pxAt(vp=1, density=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0021 begin`);
      const actual: number = vp2pxAt(1, 75);
      logInfo(`vp2pxAt(vp=1, density=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}Vp2pxAt_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0022
     * @tc.name      WindowManage_Vp2pxAt_0022
     * @tc.desc      vp2pxAt(vp=1, density=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0022 begin`);
      const actual: number = vp2pxAt(1, 80);
      logInfo(`vp2pxAt(vp=1, density=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}Vp2pxAt_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0023
     * @tc.name      WindowManage_Vp2pxAt_0023
     * @tc.desc      vp2pxAt(vp=1, density=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0023 begin`);
      const actual: number = vp2pxAt(1, 85);
      logInfo(`vp2pxAt(vp=1, density=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}Vp2pxAt_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0024
     * @tc.name      WindowManage_Vp2pxAt_0024
     * @tc.desc      vp2pxAt(vp=1, density=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0024 begin`);
      const actual: number = vp2pxAt(1, 90);
      logInfo(`vp2pxAt(vp=1, density=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}Vp2pxAt_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0025
     * @tc.name      WindowManage_Vp2pxAt_0025
     * @tc.desc      vp2pxAt(vp=1, density=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0025 begin`);
      const actual: number = vp2pxAt(1, 95);
      logInfo(`vp2pxAt(vp=1, density=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}Vp2pxAt_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0026
     * @tc.name      WindowManage_Vp2pxAt_0026
     * @tc.desc      vp2pxAt(vp=1, density=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0026 begin`);
      const actual: number = vp2pxAt(1, 105);
      logInfo(`vp2pxAt(vp=1, density=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}Vp2pxAt_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0027
     * @tc.name      WindowManage_Vp2pxAt_0027
     * @tc.desc      vp2pxAt(vp=1, density=110) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0027 begin`);
      const actual: number = vp2pxAt(1, 110);
      logInfo(`vp2pxAt(vp=1, density=110): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}Vp2pxAt_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0028
     * @tc.name      WindowManage_Vp2pxAt_0028
     * @tc.desc      vp2pxAt(vp=1, density=115) returns 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0028 begin`);
      const actual: number = vp2pxAt(1, 115);
      logInfo(`vp2pxAt(vp=1, density=115): actual=${actual}`);
      expect(actual).assertEqual(115);
      logInfo(`${BUNDLE}Vp2pxAt_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0029
     * @tc.name      WindowManage_Vp2pxAt_0029
     * @tc.desc      vp2pxAt(vp=1, density=66.02) returns 66.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0029 begin`);
      const actual: number = vp2pxAt(1, 66.02);
      logInfo(`vp2pxAt(vp=1, density=66.02): actual=${actual}`);
      expect(actual).assertClose(66.02, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0030
     * @tc.name      WindowManage_Vp2pxAt_0030
     * @tc.desc      vp2pxAt(vp=1, density=-36) returns -36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0030 begin`);
      const actual: number = vp2pxAt(1, -36);
      logInfo(`vp2pxAt(vp=1, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-36);
      logInfo(`${BUNDLE}Vp2pxAt_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0031
     * @tc.name      WindowManage_Vp2pxAt_0031
     * @tc.desc      vp2pxAt(vp=-1, density=2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0031 begin`);
      const actual: number = vp2pxAt(-1, 2);
      logInfo(`vp2pxAt(vp=-1, density=2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}Vp2pxAt_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0032
     * @tc.name      WindowManage_Vp2pxAt_0032
     * @tc.desc      vp2pxAt(vp=-1, density=3) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0032 begin`);
      const actual: number = vp2pxAt(-1, 3);
      logInfo(`vp2pxAt(vp=-1, density=3): actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}Vp2pxAt_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0033
     * @tc.name      WindowManage_Vp2pxAt_0033
     * @tc.desc      vp2pxAt(vp=-1, density=10) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0033 begin`);
      const actual: number = vp2pxAt(-1, 10);
      logInfo(`vp2pxAt(vp=-1, density=10): actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}Vp2pxAt_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0034
     * @tc.name      WindowManage_Vp2pxAt_0034
     * @tc.desc      vp2pxAt(vp=-1, density=100) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0034 begin`);
      const actual: number = vp2pxAt(-1, 100);
      logInfo(`vp2pxAt(vp=-1, density=100): actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}Vp2pxAt_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0035
     * @tc.name      WindowManage_Vp2pxAt_0035
     * @tc.desc      vp2pxAt(vp=-1, density=5) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0035 begin`);
      const actual: number = vp2pxAt(-1, 5);
      logInfo(`vp2pxAt(vp=-1, density=5): actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}Vp2pxAt_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0036
     * @tc.name      WindowManage_Vp2pxAt_0036
     * @tc.desc      vp2pxAt(vp=-1, density=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0036 begin`);
      const actual: number = vp2pxAt(-1, 15);
      logInfo(`vp2pxAt(vp=-1, density=15): actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}Vp2pxAt_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0037
     * @tc.name      WindowManage_Vp2pxAt_0037
     * @tc.desc      vp2pxAt(vp=-1, density=20) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0037 begin`);
      const actual: number = vp2pxAt(-1, 20);
      logInfo(`vp2pxAt(vp=-1, density=20): actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}Vp2pxAt_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0038
     * @tc.name      WindowManage_Vp2pxAt_0038
     * @tc.desc      vp2pxAt(vp=-1, density=25) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0038 begin`);
      const actual: number = vp2pxAt(-1, 25);
      logInfo(`vp2pxAt(vp=-1, density=25): actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}Vp2pxAt_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0039
     * @tc.name      WindowManage_Vp2pxAt_0039
     * @tc.desc      vp2pxAt(vp=-1, density=30) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0039 begin`);
      const actual: number = vp2pxAt(-1, 30);
      logInfo(`vp2pxAt(vp=-1, density=30): actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}Vp2pxAt_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0040
     * @tc.name      WindowManage_Vp2pxAt_0040
     * @tc.desc      vp2pxAt(vp=-1, density=35) returns -35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0040 begin`);
      const actual: number = vp2pxAt(-1, 35);
      logInfo(`vp2pxAt(vp=-1, density=35): actual=${actual}`);
      expect(actual).assertEqual(-35);
      logInfo(`${BUNDLE}Vp2pxAt_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0041
     * @tc.name      WindowManage_Vp2pxAt_0041
     * @tc.desc      vp2pxAt(vp=-1, density=40) returns -40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0041 begin`);
      const actual: number = vp2pxAt(-1, 40);
      logInfo(`vp2pxAt(vp=-1, density=40): actual=${actual}`);
      expect(actual).assertEqual(-40);
      logInfo(`${BUNDLE}Vp2pxAt_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0042
     * @tc.name      WindowManage_Vp2pxAt_0042
     * @tc.desc      vp2pxAt(vp=-1, density=45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0042 begin`);
      const actual: number = vp2pxAt(-1, 45);
      logInfo(`vp2pxAt(vp=-1, density=45): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}Vp2pxAt_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0043
     * @tc.name      WindowManage_Vp2pxAt_0043
     * @tc.desc      vp2pxAt(vp=-1, density=50) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0043 begin`);
      const actual: number = vp2pxAt(-1, 50);
      logInfo(`vp2pxAt(vp=-1, density=50): actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}Vp2pxAt_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0044
     * @tc.name      WindowManage_Vp2pxAt_0044
     * @tc.desc      vp2pxAt(vp=-1, density=55) returns -55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0044 begin`);
      const actual: number = vp2pxAt(-1, 55);
      logInfo(`vp2pxAt(vp=-1, density=55): actual=${actual}`);
      expect(actual).assertEqual(-55);
      logInfo(`${BUNDLE}Vp2pxAt_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0045
     * @tc.name      WindowManage_Vp2pxAt_0045
     * @tc.desc      vp2pxAt(vp=-1, density=60) returns -60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0045 begin`);
      const actual: number = vp2pxAt(-1, 60);
      logInfo(`vp2pxAt(vp=-1, density=60): actual=${actual}`);
      expect(actual).assertEqual(-60);
      logInfo(`${BUNDLE}Vp2pxAt_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0046
     * @tc.name      WindowManage_Vp2pxAt_0046
     * @tc.desc      vp2pxAt(vp=-1, density=65) returns -65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0046 begin`);
      const actual: number = vp2pxAt(-1, 65);
      logInfo(`vp2pxAt(vp=-1, density=65): actual=${actual}`);
      expect(actual).assertEqual(-65);
      logInfo(`${BUNDLE}Vp2pxAt_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0047
     * @tc.name      WindowManage_Vp2pxAt_0047
     * @tc.desc      vp2pxAt(vp=-1, density=70) returns -70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0047 begin`);
      const actual: number = vp2pxAt(-1, 70);
      logInfo(`vp2pxAt(vp=-1, density=70): actual=${actual}`);
      expect(actual).assertEqual(-70);
      logInfo(`${BUNDLE}Vp2pxAt_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0048
     * @tc.name      WindowManage_Vp2pxAt_0048
     * @tc.desc      vp2pxAt(vp=-1, density=75) returns -75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0048 begin`);
      const actual: number = vp2pxAt(-1, 75);
      logInfo(`vp2pxAt(vp=-1, density=75): actual=${actual}`);
      expect(actual).assertEqual(-75);
      logInfo(`${BUNDLE}Vp2pxAt_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0049
     * @tc.name      WindowManage_Vp2pxAt_0049
     * @tc.desc      vp2pxAt(vp=-1, density=80) returns -80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0049 begin`);
      const actual: number = vp2pxAt(-1, 80);
      logInfo(`vp2pxAt(vp=-1, density=80): actual=${actual}`);
      expect(actual).assertEqual(-80);
      logInfo(`${BUNDLE}Vp2pxAt_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0050
     * @tc.name      WindowManage_Vp2pxAt_0050
     * @tc.desc      vp2pxAt(vp=-1, density=85) returns -85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0050 begin`);
      const actual: number = vp2pxAt(-1, 85);
      logInfo(`vp2pxAt(vp=-1, density=85): actual=${actual}`);
      expect(actual).assertEqual(-85);
      logInfo(`${BUNDLE}Vp2pxAt_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0051
     * @tc.name      WindowManage_Vp2pxAt_0051
     * @tc.desc      vp2pxAt(vp=-1, density=90) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0051 begin`);
      const actual: number = vp2pxAt(-1, 90);
      logInfo(`vp2pxAt(vp=-1, density=90): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}Vp2pxAt_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0052
     * @tc.name      WindowManage_Vp2pxAt_0052
     * @tc.desc      vp2pxAt(vp=-1, density=95) returns -95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0052 begin`);
      const actual: number = vp2pxAt(-1, 95);
      logInfo(`vp2pxAt(vp=-1, density=95): actual=${actual}`);
      expect(actual).assertEqual(-95);
      logInfo(`${BUNDLE}Vp2pxAt_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0053
     * @tc.name      WindowManage_Vp2pxAt_0053
     * @tc.desc      vp2pxAt(vp=-1, density=105) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0053 begin`);
      const actual: number = vp2pxAt(-1, 105);
      logInfo(`vp2pxAt(vp=-1, density=105): actual=${actual}`);
      expect(actual).assertEqual(-105);
      logInfo(`${BUNDLE}Vp2pxAt_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0054
     * @tc.name      WindowManage_Vp2pxAt_0054
     * @tc.desc      vp2pxAt(vp=-1, density=110) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0054 begin`);
      const actual: number = vp2pxAt(-1, 110);
      logInfo(`vp2pxAt(vp=-1, density=110): actual=${actual}`);
      expect(actual).assertEqual(-110);
      logInfo(`${BUNDLE}Vp2pxAt_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0055
     * @tc.name      WindowManage_Vp2pxAt_0055
     * @tc.desc      vp2pxAt(vp=-1, density=115) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0055 begin`);
      const actual: number = vp2pxAt(-1, 115);
      logInfo(`vp2pxAt(vp=-1, density=115): actual=${actual}`);
      expect(actual).assertEqual(-115);
      logInfo(`${BUNDLE}Vp2pxAt_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0056
     * @tc.name      WindowManage_Vp2pxAt_0056
     * @tc.desc      vp2pxAt(vp=-1, density=66.02) returns -66.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0056 begin`);
      const actual: number = vp2pxAt(-1, 66.02);
      logInfo(`vp2pxAt(vp=-1, density=66.02): actual=${actual}`);
      expect(actual).assertClose(-66.02, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0057
     * @tc.name      WindowManage_Vp2pxAt_0057
     * @tc.desc      vp2pxAt(vp=-1, density=-36) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0057 begin`);
      const actual: number = vp2pxAt(-1, -36);
      logInfo(`vp2pxAt(vp=-1, density=-36): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}Vp2pxAt_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0058
     * @tc.name      WindowManage_Vp2pxAt_0058
     * @tc.desc      vp2pxAt(vp=2, density=2) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0058 begin`);
      const actual: number = vp2pxAt(2, 2);
      logInfo(`vp2pxAt(vp=2, density=2): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}Vp2pxAt_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0059
     * @tc.name      WindowManage_Vp2pxAt_0059
     * @tc.desc      vp2pxAt(vp=2, density=3) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0059 begin`);
      const actual: number = vp2pxAt(2, 3);
      logInfo(`vp2pxAt(vp=2, density=3): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}Vp2pxAt_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0060
     * @tc.name      WindowManage_Vp2pxAt_0060
     * @tc.desc      vp2pxAt(vp=2, density=100) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0060 begin`);
      const actual: number = vp2pxAt(2, 100);
      logInfo(`vp2pxAt(vp=2, density=100): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}Vp2pxAt_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0061
     * @tc.name      WindowManage_Vp2pxAt_0061
     * @tc.desc      vp2pxAt(vp=2, density=60) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0061 begin`);
      const actual: number = vp2pxAt(2, 60);
      logInfo(`vp2pxAt(vp=2, density=60): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}Vp2pxAt_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0062
     * @tc.name      WindowManage_Vp2pxAt_0062
     * @tc.desc      vp2pxAt(vp=2, density=65) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0062 begin`);
      const actual: number = vp2pxAt(2, 65);
      logInfo(`vp2pxAt(vp=2, density=65): actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}Vp2pxAt_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0063
     * @tc.name      WindowManage_Vp2pxAt_0063
     * @tc.desc      vp2pxAt(vp=2, density=70) returns 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0063 begin`);
      const actual: number = vp2pxAt(2, 70);
      logInfo(`vp2pxAt(vp=2, density=70): actual=${actual}`);
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}Vp2pxAt_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0064
     * @tc.name      WindowManage_Vp2pxAt_0064
     * @tc.desc      vp2pxAt(vp=2, density=75) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0064 begin`);
      const actual: number = vp2pxAt(2, 75);
      logInfo(`vp2pxAt(vp=2, density=75): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}Vp2pxAt_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0065
     * @tc.name      WindowManage_Vp2pxAt_0065
     * @tc.desc      vp2pxAt(vp=2, density=80) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0065 begin`);
      const actual: number = vp2pxAt(2, 80);
      logInfo(`vp2pxAt(vp=2, density=80): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}Vp2pxAt_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0066
     * @tc.name      WindowManage_Vp2pxAt_0066
     * @tc.desc      vp2pxAt(vp=2, density=85) returns 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0066 begin`);
      const actual: number = vp2pxAt(2, 85);
      logInfo(`vp2pxAt(vp=2, density=85): actual=${actual}`);
      expect(actual).assertEqual(170);
      logInfo(`${BUNDLE}Vp2pxAt_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0067
     * @tc.name      WindowManage_Vp2pxAt_0067
     * @tc.desc      vp2pxAt(vp=2, density=90) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0067 begin`);
      const actual: number = vp2pxAt(2, 90);
      logInfo(`vp2pxAt(vp=2, density=90): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}Vp2pxAt_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0068
     * @tc.name      WindowManage_Vp2pxAt_0068
     * @tc.desc      vp2pxAt(vp=2, density=95) returns 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0068 begin`);
      const actual: number = vp2pxAt(2, 95);
      logInfo(`vp2pxAt(vp=2, density=95): actual=${actual}`);
      expect(actual).assertEqual(190);
      logInfo(`${BUNDLE}Vp2pxAt_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0069
     * @tc.name      WindowManage_Vp2pxAt_0069
     * @tc.desc      vp2pxAt(vp=2, density=105) returns 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0069 begin`);
      const actual: number = vp2pxAt(2, 105);
      logInfo(`vp2pxAt(vp=2, density=105): actual=${actual}`);
      expect(actual).assertEqual(210);
      logInfo(`${BUNDLE}Vp2pxAt_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0070
     * @tc.name      WindowManage_Vp2pxAt_0070
     * @tc.desc      vp2pxAt(vp=2, density=110) returns 220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0070 begin`);
      const actual: number = vp2pxAt(2, 110);
      logInfo(`vp2pxAt(vp=2, density=110): actual=${actual}`);
      expect(actual).assertEqual(220);
      logInfo(`${BUNDLE}Vp2pxAt_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0071
     * @tc.name      WindowManage_Vp2pxAt_0071
     * @tc.desc      vp2pxAt(vp=2, density=115) returns 230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0071 begin`);
      const actual: number = vp2pxAt(2, 115);
      logInfo(`vp2pxAt(vp=2, density=115): actual=${actual}`);
      expect(actual).assertEqual(230);
      logInfo(`${BUNDLE}Vp2pxAt_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0072
     * @tc.name      WindowManage_Vp2pxAt_0072
     * @tc.desc      vp2pxAt(vp=2, density=66.02) returns 132.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0072 begin`);
      const actual: number = vp2pxAt(2, 66.02);
      logInfo(`vp2pxAt(vp=2, density=66.02): actual=${actual}`);
      expect(actual).assertClose(132.04, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0073
     * @tc.name      WindowManage_Vp2pxAt_0073
     * @tc.desc      vp2pxAt(vp=2, density=-36) returns -72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0073 begin`);
      const actual: number = vp2pxAt(2, -36);
      logInfo(`vp2pxAt(vp=2, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-72);
      logInfo(`${BUNDLE}Vp2pxAt_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0074
     * @tc.name      WindowManage_Vp2pxAt_0074
     * @tc.desc      vp2pxAt(vp=3, density=3) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0074 begin`);
      const actual: number = vp2pxAt(3, 3);
      logInfo(`vp2pxAt(vp=3, density=3): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}Vp2pxAt_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0075
     * @tc.name      WindowManage_Vp2pxAt_0075
     * @tc.desc      vp2pxAt(vp=3, density=100) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0075 begin`);
      const actual: number = vp2pxAt(3, 100);
      logInfo(`vp2pxAt(vp=3, density=100): actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}Vp2pxAt_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0076
     * @tc.name      WindowManage_Vp2pxAt_0076
     * @tc.desc      vp2pxAt(vp=3, density=45) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0076 begin`);
      const actual: number = vp2pxAt(3, 45);
      logInfo(`vp2pxAt(vp=3, density=45): actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}Vp2pxAt_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0077
     * @tc.name      WindowManage_Vp2pxAt_0077
     * @tc.desc      vp2pxAt(vp=3, density=55) returns 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0077 begin`);
      const actual: number = vp2pxAt(3, 55);
      logInfo(`vp2pxAt(vp=3, density=55): actual=${actual}`);
      expect(actual).assertEqual(165);
      logInfo(`${BUNDLE}Vp2pxAt_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0078
     * @tc.name      WindowManage_Vp2pxAt_0078
     * @tc.desc      vp2pxAt(vp=3, density=65) returns 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0078 begin`);
      const actual: number = vp2pxAt(3, 65);
      logInfo(`vp2pxAt(vp=3, density=65): actual=${actual}`);
      expect(actual).assertEqual(195);
      logInfo(`${BUNDLE}Vp2pxAt_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0079
     * @tc.name      WindowManage_Vp2pxAt_0079
     * @tc.desc      vp2pxAt(vp=3, density=75) returns 225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0079 begin`);
      const actual: number = vp2pxAt(3, 75);
      logInfo(`vp2pxAt(vp=3, density=75): actual=${actual}`);
      expect(actual).assertEqual(225);
      logInfo(`${BUNDLE}Vp2pxAt_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0080
     * @tc.name      WindowManage_Vp2pxAt_0080
     * @tc.desc      vp2pxAt(vp=3, density=80) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0080 begin`);
      const actual: number = vp2pxAt(3, 80);
      logInfo(`vp2pxAt(vp=3, density=80): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}Vp2pxAt_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0081
     * @tc.name      WindowManage_Vp2pxAt_0081
     * @tc.desc      vp2pxAt(vp=3, density=85) returns 255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0081 begin`);
      const actual: number = vp2pxAt(3, 85);
      logInfo(`vp2pxAt(vp=3, density=85): actual=${actual}`);
      expect(actual).assertEqual(255);
      logInfo(`${BUNDLE}Vp2pxAt_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0082
     * @tc.name      WindowManage_Vp2pxAt_0082
     * @tc.desc      vp2pxAt(vp=3, density=90) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0082 begin`);
      const actual: number = vp2pxAt(3, 90);
      logInfo(`vp2pxAt(vp=3, density=90): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}Vp2pxAt_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0083
     * @tc.name      WindowManage_Vp2pxAt_0083
     * @tc.desc      vp2pxAt(vp=3, density=95) returns 285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0083 begin`);
      const actual: number = vp2pxAt(3, 95);
      logInfo(`vp2pxAt(vp=3, density=95): actual=${actual}`);
      expect(actual).assertEqual(285);
      logInfo(`${BUNDLE}Vp2pxAt_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0084
     * @tc.name      WindowManage_Vp2pxAt_0084
     * @tc.desc      vp2pxAt(vp=3, density=105) returns 315
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0084 begin`);
      const actual: number = vp2pxAt(3, 105);
      logInfo(`vp2pxAt(vp=3, density=105): actual=${actual}`);
      expect(actual).assertEqual(315);
      logInfo(`${BUNDLE}Vp2pxAt_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0085
     * @tc.name      WindowManage_Vp2pxAt_0085
     * @tc.desc      vp2pxAt(vp=3, density=110) returns 330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0085 begin`);
      const actual: number = vp2pxAt(3, 110);
      logInfo(`vp2pxAt(vp=3, density=110): actual=${actual}`);
      expect(actual).assertEqual(330);
      logInfo(`${BUNDLE}Vp2pxAt_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0086
     * @tc.name      WindowManage_Vp2pxAt_0086
     * @tc.desc      vp2pxAt(vp=3, density=115) returns 345
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0086 begin`);
      const actual: number = vp2pxAt(3, 115);
      logInfo(`vp2pxAt(vp=3, density=115): actual=${actual}`);
      expect(actual).assertEqual(345);
      logInfo(`${BUNDLE}Vp2pxAt_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0087
     * @tc.name      WindowManage_Vp2pxAt_0087
     * @tc.desc      vp2pxAt(vp=3, density=66.02) returns 198.06
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0087 begin`);
      const actual: number = vp2pxAt(3, 66.02);
      logInfo(`vp2pxAt(vp=3, density=66.02): actual=${actual}`);
      expect(actual).assertClose(198.06, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0088
     * @tc.name      WindowManage_Vp2pxAt_0088
     * @tc.desc      vp2pxAt(vp=3, density=-36) returns -108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0088 begin`);
      const actual: number = vp2pxAt(3, -36);
      logInfo(`vp2pxAt(vp=3, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-108);
      logInfo(`${BUNDLE}Vp2pxAt_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0089
     * @tc.name      WindowManage_Vp2pxAt_0089
     * @tc.desc      vp2pxAt(vp=10, density=100) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0089 begin`);
      const actual: number = vp2pxAt(10, 100);
      logInfo(`vp2pxAt(vp=10, density=100): actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}Vp2pxAt_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0090
     * @tc.name      WindowManage_Vp2pxAt_0090
     * @tc.desc      vp2pxAt(vp=10, density=25) returns 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0090 begin`);
      const actual: number = vp2pxAt(10, 25);
      logInfo(`vp2pxAt(vp=10, density=25): actual=${actual}`);
      expect(actual).assertEqual(250);
      logInfo(`${BUNDLE}Vp2pxAt_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0091
     * @tc.name      WindowManage_Vp2pxAt_0091
     * @tc.desc      vp2pxAt(vp=10, density=35) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0091 begin`);
      const actual: number = vp2pxAt(10, 35);
      logInfo(`vp2pxAt(vp=10, density=35): actual=${actual}`);
      expect(actual).assertEqual(350);
      logInfo(`${BUNDLE}Vp2pxAt_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0092
     * @tc.name      WindowManage_Vp2pxAt_0092
     * @tc.desc      vp2pxAt(vp=10, density=40) returns 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0092 begin`);
      const actual: number = vp2pxAt(10, 40);
      logInfo(`vp2pxAt(vp=10, density=40): actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}Vp2pxAt_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0093
     * @tc.name      WindowManage_Vp2pxAt_0093
     * @tc.desc      vp2pxAt(vp=10, density=45) returns 450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0093 begin`);
      const actual: number = vp2pxAt(10, 45);
      logInfo(`vp2pxAt(vp=10, density=45): actual=${actual}`);
      expect(actual).assertEqual(450);
      logInfo(`${BUNDLE}Vp2pxAt_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0094
     * @tc.name      WindowManage_Vp2pxAt_0094
     * @tc.desc      vp2pxAt(vp=10, density=50) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0094 begin`);
      const actual: number = vp2pxAt(10, 50);
      logInfo(`vp2pxAt(vp=10, density=50): actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}Vp2pxAt_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0095
     * @tc.name      WindowManage_Vp2pxAt_0095
     * @tc.desc      vp2pxAt(vp=10, density=55) returns 550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0095 begin`);
      const actual: number = vp2pxAt(10, 55);
      logInfo(`vp2pxAt(vp=10, density=55): actual=${actual}`);
      expect(actual).assertEqual(550);
      logInfo(`${BUNDLE}Vp2pxAt_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0096
     * @tc.name      WindowManage_Vp2pxAt_0096
     * @tc.desc      vp2pxAt(vp=10, density=60) returns 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0096 begin`);
      const actual: number = vp2pxAt(10, 60);
      logInfo(`vp2pxAt(vp=10, density=60): actual=${actual}`);
      expect(actual).assertEqual(600);
      logInfo(`${BUNDLE}Vp2pxAt_0096 end`);
    });
  });
}
