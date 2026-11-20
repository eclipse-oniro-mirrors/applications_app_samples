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
import { waterFlowTotalHeightOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for waterFlowTotalHeightOf (49 cases). */
export default function waterFlowTotalHeightOfTest(): void {
  describe('WaterFlowTotalHeightOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0001
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0001
     * @tc.desc      waterFlowTotalHeightOf(count=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0001 begin`);
      const actual: number = waterFlowTotalHeightOf(0);
      logInfo(`waterFlowTotalHeightOf(count=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0002
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0002
     * @tc.desc      waterFlowTotalHeightOf(count=1) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0002 begin`);
      const actual: number = waterFlowTotalHeightOf(1);
      logInfo(`waterFlowTotalHeightOf(count=1): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0003
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0003
     * @tc.desc      waterFlowTotalHeightOf(count=2) returns 238
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0003 begin`);
      const actual: number = waterFlowTotalHeightOf(2);
      logInfo(`waterFlowTotalHeightOf(count=2): actual=${actual}`);
      expect(actual).assertEqual(238);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0004
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0004
     * @tc.desc      waterFlowTotalHeightOf(count=5) returns 578
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0004 begin`);
      const actual: number = waterFlowTotalHeightOf(5);
      logInfo(`waterFlowTotalHeightOf(count=5): actual=${actual}`);
      expect(actual).assertEqual(578);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0005
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0005
     * @tc.desc      waterFlowTotalHeightOf(count=10) returns 1190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0005 begin`);
      const actual: number = waterFlowTotalHeightOf(10);
      logInfo(`waterFlowTotalHeightOf(count=10): actual=${actual}`);
      expect(actual).assertEqual(1190);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0006
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0006
     * @tc.desc      waterFlowTotalHeightOf(count=100) returns 11900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0006 begin`);
      const actual: number = waterFlowTotalHeightOf(100);
      logInfo(`waterFlowTotalHeightOf(count=100): actual=${actual}`);
      expect(actual).assertEqual(11900);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0007
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0007
     * @tc.desc      waterFlowTotalHeightOf(count=3) returns 374
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0007 begin`);
      const actual: number = waterFlowTotalHeightOf(3);
      logInfo(`waterFlowTotalHeightOf(count=3): actual=${actual}`);
      expect(actual).assertEqual(374);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0008
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0008
     * @tc.desc      waterFlowTotalHeightOf(count=15) returns 1802
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0008 begin`);
      const actual: number = waterFlowTotalHeightOf(15);
      logInfo(`waterFlowTotalHeightOf(count=15): actual=${actual}`);
      expect(actual).assertEqual(1802);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0009
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0009
     * @tc.desc      waterFlowTotalHeightOf(count=20) returns 2380
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0009 begin`);
      const actual: number = waterFlowTotalHeightOf(20);
      logInfo(`waterFlowTotalHeightOf(count=20): actual=${actual}`);
      expect(actual).assertEqual(2380);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0010
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0010
     * @tc.desc      waterFlowTotalHeightOf(count=25) returns 2958
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0010 begin`);
      const actual: number = waterFlowTotalHeightOf(25);
      logInfo(`waterFlowTotalHeightOf(count=25): actual=${actual}`);
      expect(actual).assertEqual(2958);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0011
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0011
     * @tc.desc      waterFlowTotalHeightOf(count=30) returns 3570
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0011 begin`);
      const actual: number = waterFlowTotalHeightOf(30);
      logInfo(`waterFlowTotalHeightOf(count=30): actual=${actual}`);
      expect(actual).assertEqual(3570);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0012
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0012
     * @tc.desc      waterFlowTotalHeightOf(count=35) returns 4182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0012 begin`);
      const actual: number = waterFlowTotalHeightOf(35);
      logInfo(`waterFlowTotalHeightOf(count=35): actual=${actual}`);
      expect(actual).assertEqual(4182);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0013
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0013
     * @tc.desc      waterFlowTotalHeightOf(count=40) returns 4760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0013 begin`);
      const actual: number = waterFlowTotalHeightOf(40);
      logInfo(`waterFlowTotalHeightOf(count=40): actual=${actual}`);
      expect(actual).assertEqual(4760);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0014
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0014
     * @tc.desc      waterFlowTotalHeightOf(count=45) returns 5338
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0014 begin`);
      const actual: number = waterFlowTotalHeightOf(45);
      logInfo(`waterFlowTotalHeightOf(count=45): actual=${actual}`);
      expect(actual).assertEqual(5338);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0015
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0015
     * @tc.desc      waterFlowTotalHeightOf(count=50) returns 5950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0015 begin`);
      const actual: number = waterFlowTotalHeightOf(50);
      logInfo(`waterFlowTotalHeightOf(count=50): actual=${actual}`);
      expect(actual).assertEqual(5950);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0016
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0016
     * @tc.desc      waterFlowTotalHeightOf(count=55) returns 6562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0016 begin`);
      const actual: number = waterFlowTotalHeightOf(55);
      logInfo(`waterFlowTotalHeightOf(count=55): actual=${actual}`);
      expect(actual).assertEqual(6562);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0017
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0017
     * @tc.desc      waterFlowTotalHeightOf(count=60) returns 7140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0017 begin`);
      const actual: number = waterFlowTotalHeightOf(60);
      logInfo(`waterFlowTotalHeightOf(count=60): actual=${actual}`);
      expect(actual).assertEqual(7140);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0018
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0018
     * @tc.desc      waterFlowTotalHeightOf(count=65) returns 7718
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0018 begin`);
      const actual: number = waterFlowTotalHeightOf(65);
      logInfo(`waterFlowTotalHeightOf(count=65): actual=${actual}`);
      expect(actual).assertEqual(7718);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0019
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0019
     * @tc.desc      waterFlowTotalHeightOf(count=70) returns 8330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0019 begin`);
      const actual: number = waterFlowTotalHeightOf(70);
      logInfo(`waterFlowTotalHeightOf(count=70): actual=${actual}`);
      expect(actual).assertEqual(8330);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0020
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0020
     * @tc.desc      waterFlowTotalHeightOf(count=75) returns 8942
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0020 begin`);
      const actual: number = waterFlowTotalHeightOf(75);
      logInfo(`waterFlowTotalHeightOf(count=75): actual=${actual}`);
      expect(actual).assertEqual(8942);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0021
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0021
     * @tc.desc      waterFlowTotalHeightOf(count=80) returns 9520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0021 begin`);
      const actual: number = waterFlowTotalHeightOf(80);
      logInfo(`waterFlowTotalHeightOf(count=80): actual=${actual}`);
      expect(actual).assertEqual(9520);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0022
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0022
     * @tc.desc      waterFlowTotalHeightOf(count=85) returns 10098
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0022 begin`);
      const actual: number = waterFlowTotalHeightOf(85);
      logInfo(`waterFlowTotalHeightOf(count=85): actual=${actual}`);
      expect(actual).assertEqual(10098);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0023
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0023
     * @tc.desc      waterFlowTotalHeightOf(count=90) returns 10710
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0023 begin`);
      const actual: number = waterFlowTotalHeightOf(90);
      logInfo(`waterFlowTotalHeightOf(count=90): actual=${actual}`);
      expect(actual).assertEqual(10710);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0024
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0024
     * @tc.desc      waterFlowTotalHeightOf(count=95) returns 11322
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0024 begin`);
      const actual: number = waterFlowTotalHeightOf(95);
      logInfo(`waterFlowTotalHeightOf(count=95): actual=${actual}`);
      expect(actual).assertEqual(11322);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0025
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0025
     * @tc.desc      waterFlowTotalHeightOf(count=105) returns 12478
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0025 begin`);
      const actual: number = waterFlowTotalHeightOf(105);
      logInfo(`waterFlowTotalHeightOf(count=105): actual=${actual}`);
      expect(actual).assertEqual(12478);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0026
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0026
     * @tc.desc      waterFlowTotalHeightOf(count=110) returns 13090
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0026 begin`);
      const actual: number = waterFlowTotalHeightOf(110);
      logInfo(`waterFlowTotalHeightOf(count=110): actual=${actual}`);
      expect(actual).assertEqual(13090);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0027
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0027
     * @tc.desc      waterFlowTotalHeightOf(count=115) returns 13702
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0027 begin`);
      const actual: number = waterFlowTotalHeightOf(115);
      logInfo(`waterFlowTotalHeightOf(count=115): actual=${actual}`);
      expect(actual).assertEqual(13702);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0028
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0028
     * @tc.desc      waterFlowTotalHeightOf(count=120) returns 14280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0028 begin`);
      const actual: number = waterFlowTotalHeightOf(120);
      logInfo(`waterFlowTotalHeightOf(count=120): actual=${actual}`);
      expect(actual).assertEqual(14280);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0029
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0029
     * @tc.desc      waterFlowTotalHeightOf(count=125) returns 14858
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0029 begin`);
      const actual: number = waterFlowTotalHeightOf(125);
      logInfo(`waterFlowTotalHeightOf(count=125): actual=${actual}`);
      expect(actual).assertEqual(14858);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0030
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0030
     * @tc.desc      waterFlowTotalHeightOf(count=130) returns 15470
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0030 begin`);
      const actual: number = waterFlowTotalHeightOf(130);
      logInfo(`waterFlowTotalHeightOf(count=130): actual=${actual}`);
      expect(actual).assertEqual(15470);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0031
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0031
     * @tc.desc      waterFlowTotalHeightOf(count=135) returns 16082
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0031 begin`);
      const actual: number = waterFlowTotalHeightOf(135);
      logInfo(`waterFlowTotalHeightOf(count=135): actual=${actual}`);
      expect(actual).assertEqual(16082);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0032
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0032
     * @tc.desc      waterFlowTotalHeightOf(count=140) returns 16660
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0032 begin`);
      const actual: number = waterFlowTotalHeightOf(140);
      logInfo(`waterFlowTotalHeightOf(count=140): actual=${actual}`);
      expect(actual).assertEqual(16660);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0033
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0033
     * @tc.desc      waterFlowTotalHeightOf(count=145) returns 17238
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0033 begin`);
      const actual: number = waterFlowTotalHeightOf(145);
      logInfo(`waterFlowTotalHeightOf(count=145): actual=${actual}`);
      expect(actual).assertEqual(17238);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0034
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0034
     * @tc.desc      waterFlowTotalHeightOf(count=150) returns 17850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0034 begin`);
      const actual: number = waterFlowTotalHeightOf(150);
      logInfo(`waterFlowTotalHeightOf(count=150): actual=${actual}`);
      expect(actual).assertEqual(17850);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0035
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0035
     * @tc.desc      waterFlowTotalHeightOf(count=155) returns 18462
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0035 begin`);
      const actual: number = waterFlowTotalHeightOf(155);
      logInfo(`waterFlowTotalHeightOf(count=155): actual=${actual}`);
      expect(actual).assertEqual(18462);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0036
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0036
     * @tc.desc      waterFlowTotalHeightOf(count=160) returns 19040
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0036 begin`);
      const actual: number = waterFlowTotalHeightOf(160);
      logInfo(`waterFlowTotalHeightOf(count=160): actual=${actual}`);
      expect(actual).assertEqual(19040);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0037
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0037
     * @tc.desc      waterFlowTotalHeightOf(count=165) returns 19618
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0037 begin`);
      const actual: number = waterFlowTotalHeightOf(165);
      logInfo(`waterFlowTotalHeightOf(count=165): actual=${actual}`);
      expect(actual).assertEqual(19618);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0038
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0038
     * @tc.desc      waterFlowTotalHeightOf(count=170) returns 20230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0038 begin`);
      const actual: number = waterFlowTotalHeightOf(170);
      logInfo(`waterFlowTotalHeightOf(count=170): actual=${actual}`);
      expect(actual).assertEqual(20230);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0039
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0039
     * @tc.desc      waterFlowTotalHeightOf(count=175) returns 20842
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0039 begin`);
      const actual: number = waterFlowTotalHeightOf(175);
      logInfo(`waterFlowTotalHeightOf(count=175): actual=${actual}`);
      expect(actual).assertEqual(20842);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0040
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0040
     * @tc.desc      waterFlowTotalHeightOf(count=180) returns 21420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0040 begin`);
      const actual: number = waterFlowTotalHeightOf(180);
      logInfo(`waterFlowTotalHeightOf(count=180): actual=${actual}`);
      expect(actual).assertEqual(21420);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0041
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0041
     * @tc.desc      waterFlowTotalHeightOf(count=185) returns 21998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0041 begin`);
      const actual: number = waterFlowTotalHeightOf(185);
      logInfo(`waterFlowTotalHeightOf(count=185): actual=${actual}`);
      expect(actual).assertEqual(21998);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0042
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0042
     * @tc.desc      waterFlowTotalHeightOf(count=190) returns 22610
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0042 begin`);
      const actual: number = waterFlowTotalHeightOf(190);
      logInfo(`waterFlowTotalHeightOf(count=190): actual=${actual}`);
      expect(actual).assertEqual(22610);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0043
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0043
     * @tc.desc      waterFlowTotalHeightOf(count=195) returns 23222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0043 begin`);
      const actual: number = waterFlowTotalHeightOf(195);
      logInfo(`waterFlowTotalHeightOf(count=195): actual=${actual}`);
      expect(actual).assertEqual(23222);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0044
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0044
     * @tc.desc      waterFlowTotalHeightOf(count=200) returns 23800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0044 begin`);
      const actual: number = waterFlowTotalHeightOf(200);
      logInfo(`waterFlowTotalHeightOf(count=200): actual=${actual}`);
      expect(actual).assertEqual(23800);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0045
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0045
     * @tc.desc      waterFlowTotalHeightOf(count=97.32) returns 11662
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0045 begin`);
      const actual: number = waterFlowTotalHeightOf(97.32);
      logInfo(`waterFlowTotalHeightOf(count=97.32): actual=${actual}`);
      expect(actual).assertEqual(11662);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0046
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0046
     * @tc.desc      waterFlowTotalHeightOf(count=4) returns 476
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0046 begin`);
      const actual: number = waterFlowTotalHeightOf(4);
      logInfo(`waterFlowTotalHeightOf(count=4): actual=${actual}`);
      expect(actual).assertEqual(476);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0047
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0047
     * @tc.desc      waterFlowTotalHeightOf(count=14) returns 1666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0047 begin`);
      const actual: number = waterFlowTotalHeightOf(14);
      logInfo(`waterFlowTotalHeightOf(count=14): actual=${actual}`);
      expect(actual).assertEqual(1666);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0048
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0048
     * @tc.desc      waterFlowTotalHeightOf(count=56.04) returns 6766
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0048 begin`);
      const actual: number = waterFlowTotalHeightOf(56.04);
      logInfo(`waterFlowTotalHeightOf(count=56.04): actual=${actual}`);
      expect(actual).assertEqual(6766);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_TOTAL_HEIGHT_OF_0049
     * @tc.name      ComponentCollection_WaterFlowTotalHeightOf_0049
     * @tc.desc      waterFlowTotalHeightOf(count=11.58) returns 1428
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowTotalHeightOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0049 begin`);
      const actual: number = waterFlowTotalHeightOf(11.58);
      logInfo(`waterFlowTotalHeightOf(count=11.58): actual=${actual}`);
      expect(actual).assertEqual(1428);
      logInfo(`${BUNDLE}WaterFlowTotalHeightOf_0049 end`);
    });
  });
}
