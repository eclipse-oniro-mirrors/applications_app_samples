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
import { waterFlowHeightOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for waterFlowHeightOf (49 cases). */
export default function waterFlowHeightOfTest(): void {
  describe('WaterFlowHeightOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0001
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0001
     * @tc.desc      waterFlowHeightOf(index=0) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_WaterFlowHeightOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0001 begin`);
      const actual: number = waterFlowHeightOf(0);
      logInfo(`waterFlowHeightOf(index=0): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0002
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0002
     * @tc.desc      waterFlowHeightOf(index=1) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_WaterFlowHeightOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0002 begin`);
      const actual: number = waterFlowHeightOf(1);
      logInfo(`waterFlowHeightOf(index=1): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0003
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0003
     * @tc.desc      waterFlowHeightOf(index=23.65) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0003 begin`);
      const actual: number = waterFlowHeightOf(23.65);
      logInfo(`waterFlowHeightOf(index=23.65): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}WaterFlowHeightOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0004
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0004
     * @tc.desc      waterFlowHeightOf(index=4) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_WaterFlowHeightOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0004 begin`);
      const actual: number = waterFlowHeightOf(4);
      logInfo(`waterFlowHeightOf(index=4): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0005
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0005
     * @tc.desc      waterFlowHeightOf(index=3) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_WaterFlowHeightOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0005 begin`);
      const actual: number = waterFlowHeightOf(3);
      logInfo(`waterFlowHeightOf(index=3): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0006
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0006
     * @tc.desc      waterFlowHeightOf(index=5) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_WaterFlowHeightOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0006 begin`);
      const actual: number = waterFlowHeightOf(5);
      logInfo(`waterFlowHeightOf(index=5): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0007
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0007
     * @tc.desc      waterFlowHeightOf(index=2) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0007 begin`);
      const actual: number = waterFlowHeightOf(2);
      logInfo(`waterFlowHeightOf(index=2): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0008
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0008
     * @tc.desc      waterFlowHeightOf(index=-1) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_WaterFlowHeightOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0008 begin`);
      const actual: number = waterFlowHeightOf(-1);
      logInfo(`waterFlowHeightOf(index=-1): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0009
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0009
     * @tc.desc      waterFlowHeightOf(index=10) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0009 begin`);
      const actual: number = waterFlowHeightOf(10);
      logInfo(`waterFlowHeightOf(index=10): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0010
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0010
     * @tc.desc      waterFlowHeightOf(index=100) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0010 begin`);
      const actual: number = waterFlowHeightOf(100);
      logInfo(`waterFlowHeightOf(index=100): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0011
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0011
     * @tc.desc      waterFlowHeightOf(index=15) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0011 begin`);
      const actual: number = waterFlowHeightOf(15);
      logInfo(`waterFlowHeightOf(index=15): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0012
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0012
     * @tc.desc      waterFlowHeightOf(index=20) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0012 begin`);
      const actual: number = waterFlowHeightOf(20);
      logInfo(`waterFlowHeightOf(index=20): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0013
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0013
     * @tc.desc      waterFlowHeightOf(index=25) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0013 begin`);
      const actual: number = waterFlowHeightOf(25);
      logInfo(`waterFlowHeightOf(index=25): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0014
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0014
     * @tc.desc      waterFlowHeightOf(index=30) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0014 begin`);
      const actual: number = waterFlowHeightOf(30);
      logInfo(`waterFlowHeightOf(index=30): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0015
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0015
     * @tc.desc      waterFlowHeightOf(index=35) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0015 begin`);
      const actual: number = waterFlowHeightOf(35);
      logInfo(`waterFlowHeightOf(index=35): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0016
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0016
     * @tc.desc      waterFlowHeightOf(index=40) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0016 begin`);
      const actual: number = waterFlowHeightOf(40);
      logInfo(`waterFlowHeightOf(index=40): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0017
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0017
     * @tc.desc      waterFlowHeightOf(index=45) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0017 begin`);
      const actual: number = waterFlowHeightOf(45);
      logInfo(`waterFlowHeightOf(index=45): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0018
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0018
     * @tc.desc      waterFlowHeightOf(index=50) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0018 begin`);
      const actual: number = waterFlowHeightOf(50);
      logInfo(`waterFlowHeightOf(index=50): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0019
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0019
     * @tc.desc      waterFlowHeightOf(index=55) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0019 begin`);
      const actual: number = waterFlowHeightOf(55);
      logInfo(`waterFlowHeightOf(index=55): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0020
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0020
     * @tc.desc      waterFlowHeightOf(index=60) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0020 begin`);
      const actual: number = waterFlowHeightOf(60);
      logInfo(`waterFlowHeightOf(index=60): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0021
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0021
     * @tc.desc      waterFlowHeightOf(index=65) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0021 begin`);
      const actual: number = waterFlowHeightOf(65);
      logInfo(`waterFlowHeightOf(index=65): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0022
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0022
     * @tc.desc      waterFlowHeightOf(index=70) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0022 begin`);
      const actual: number = waterFlowHeightOf(70);
      logInfo(`waterFlowHeightOf(index=70): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0023
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0023
     * @tc.desc      waterFlowHeightOf(index=75) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0023 begin`);
      const actual: number = waterFlowHeightOf(75);
      logInfo(`waterFlowHeightOf(index=75): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0024
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0024
     * @tc.desc      waterFlowHeightOf(index=80) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0024 begin`);
      const actual: number = waterFlowHeightOf(80);
      logInfo(`waterFlowHeightOf(index=80): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0025
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0025
     * @tc.desc      waterFlowHeightOf(index=85) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0025 begin`);
      const actual: number = waterFlowHeightOf(85);
      logInfo(`waterFlowHeightOf(index=85): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0026
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0026
     * @tc.desc      waterFlowHeightOf(index=90) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0026 begin`);
      const actual: number = waterFlowHeightOf(90);
      logInfo(`waterFlowHeightOf(index=90): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0027
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0027
     * @tc.desc      waterFlowHeightOf(index=95) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0027 begin`);
      const actual: number = waterFlowHeightOf(95);
      logInfo(`waterFlowHeightOf(index=95): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0028
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0028
     * @tc.desc      waterFlowHeightOf(index=105) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0028 begin`);
      const actual: number = waterFlowHeightOf(105);
      logInfo(`waterFlowHeightOf(index=105): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0029
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0029
     * @tc.desc      waterFlowHeightOf(index=110) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0029 begin`);
      const actual: number = waterFlowHeightOf(110);
      logInfo(`waterFlowHeightOf(index=110): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0030
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0030
     * @tc.desc      waterFlowHeightOf(index=115) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0030 begin`);
      const actual: number = waterFlowHeightOf(115);
      logInfo(`waterFlowHeightOf(index=115): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0031
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0031
     * @tc.desc      waterFlowHeightOf(index=120) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0031 begin`);
      const actual: number = waterFlowHeightOf(120);
      logInfo(`waterFlowHeightOf(index=120): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0032
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0032
     * @tc.desc      waterFlowHeightOf(index=125) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0032 begin`);
      const actual: number = waterFlowHeightOf(125);
      logInfo(`waterFlowHeightOf(index=125): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0033
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0033
     * @tc.desc      waterFlowHeightOf(index=130) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0033 begin`);
      const actual: number = waterFlowHeightOf(130);
      logInfo(`waterFlowHeightOf(index=130): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0034
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0034
     * @tc.desc      waterFlowHeightOf(index=135) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0034 begin`);
      const actual: number = waterFlowHeightOf(135);
      logInfo(`waterFlowHeightOf(index=135): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0035
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0035
     * @tc.desc      waterFlowHeightOf(index=140) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0035 begin`);
      const actual: number = waterFlowHeightOf(140);
      logInfo(`waterFlowHeightOf(index=140): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0036
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0036
     * @tc.desc      waterFlowHeightOf(index=145) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0036 begin`);
      const actual: number = waterFlowHeightOf(145);
      logInfo(`waterFlowHeightOf(index=145): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0037
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0037
     * @tc.desc      waterFlowHeightOf(index=150) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0037 begin`);
      const actual: number = waterFlowHeightOf(150);
      logInfo(`waterFlowHeightOf(index=150): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0038
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0038
     * @tc.desc      waterFlowHeightOf(index=155) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0038 begin`);
      const actual: number = waterFlowHeightOf(155);
      logInfo(`waterFlowHeightOf(index=155): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0039
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0039
     * @tc.desc      waterFlowHeightOf(index=160) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0039 begin`);
      const actual: number = waterFlowHeightOf(160);
      logInfo(`waterFlowHeightOf(index=160): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0040
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0040
     * @tc.desc      waterFlowHeightOf(index=165) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0040 begin`);
      const actual: number = waterFlowHeightOf(165);
      logInfo(`waterFlowHeightOf(index=165): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0041
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0041
     * @tc.desc      waterFlowHeightOf(index=170) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0041 begin`);
      const actual: number = waterFlowHeightOf(170);
      logInfo(`waterFlowHeightOf(index=170): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0042
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0042
     * @tc.desc      waterFlowHeightOf(index=175) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0042 begin`);
      const actual: number = waterFlowHeightOf(175);
      logInfo(`waterFlowHeightOf(index=175): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0043
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0043
     * @tc.desc      waterFlowHeightOf(index=180) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0043 begin`);
      const actual: number = waterFlowHeightOf(180);
      logInfo(`waterFlowHeightOf(index=180): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0044
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0044
     * @tc.desc      waterFlowHeightOf(index=185) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0044 begin`);
      const actual: number = waterFlowHeightOf(185);
      logInfo(`waterFlowHeightOf(index=185): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0045
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0045
     * @tc.desc      waterFlowHeightOf(index=190) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0045 begin`);
      const actual: number = waterFlowHeightOf(190);
      logInfo(`waterFlowHeightOf(index=190): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0046
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0046
     * @tc.desc      waterFlowHeightOf(index=195) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0046 begin`);
      const actual: number = waterFlowHeightOf(195);
      logInfo(`waterFlowHeightOf(index=195): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0047
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0047
     * @tc.desc      waterFlowHeightOf(index=200) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0047 begin`);
      const actual: number = waterFlowHeightOf(200);
      logInfo(`waterFlowHeightOf(index=200): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0048
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0048
     * @tc.desc      waterFlowHeightOf(index=63) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowHeightOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0048 begin`);
      const actual: number = waterFlowHeightOf(63);
      logInfo(`waterFlowHeightOf(index=63): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_HEIGHT_OF_0049
     * @tc.name      ComponentCollection_WaterFlowHeightOf_0049
     * @tc.desc      waterFlowHeightOf(index=-77) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_WaterFlowHeightOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WaterFlowHeightOf_0049 begin`);
      const actual: number = waterFlowHeightOf(-77);
      logInfo(`waterFlowHeightOf(index=-77): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}WaterFlowHeightOf_0049 end`);
    });
  });
}
