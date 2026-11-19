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
import { waterFlowImageOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for waterFlowImageOf (49 cases). */
export default function waterFlowImageOfTest(): void {
  describe('WaterFlowImageOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0001
     * @tc.name      ComponentCollection_WaterFlowImageOf_0001
     * @tc.desc      waterFlowImageOf(item=4) returns "resources/base/media/water_flow_0.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_WaterFlowImageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0001 begin`);
      const actual: string = waterFlowImageOf(4);
      logInfo(`waterFlowImageOf(item=4): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0002
     * @tc.name      ComponentCollection_WaterFlowImageOf_0002
     * @tc.desc      waterFlowImageOf(item=3) returns "resources/base/media/water_flow_3.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_WaterFlowImageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0002 begin`);
      const actual: string = waterFlowImageOf(3);
      logInfo(`waterFlowImageOf(item=3): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_3.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0003
     * @tc.name      ComponentCollection_WaterFlowImageOf_0003
     * @tc.desc      waterFlowImageOf(item=5) returns "resources/base/media/water_flow_1.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_WaterFlowImageOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0003 begin`);
      const actual: string = waterFlowImageOf(5);
      logInfo(`waterFlowImageOf(item=5): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_1.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0004
     * @tc.name      ComponentCollection_WaterFlowImageOf_0004
     * @tc.desc      waterFlowImageOf(item=-1) returns "resources/base/media/water_flow_-1.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_WaterFlowImageOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0004 begin`);
      const actual: string = waterFlowImageOf(-1);
      logInfo(`waterFlowImageOf(item=-1): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_-1.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0005
     * @tc.name      ComponentCollection_WaterFlowImageOf_0005
     * @tc.desc      waterFlowImageOf(item=2) returns "resources/base/media/water_flow_2.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0005 begin`);
      const actual: string = waterFlowImageOf(2);
      logInfo(`waterFlowImageOf(item=2): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_2.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0006
     * @tc.name      ComponentCollection_WaterFlowImageOf_0006
     * @tc.desc      waterFlowImageOf(item=93.79) returns "resources/base/media/water_flow_1.7900000000000063.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0006 begin`);
      const actual: string = waterFlowImageOf(93.79);
      logInfo(`waterFlowImageOf(item=93.79): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_1.7900000000000063.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0007
     * @tc.name      ComponentCollection_WaterFlowImageOf_0007
     * @tc.desc      waterFlowImageOf(item=19.01) returns "resources/base/media/water_flow_3.0100000000000016.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0007 begin`);
      const actual: string = waterFlowImageOf(19.01);
      logInfo(`waterFlowImageOf(item=19.01): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_3.0100000000000016.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0008
     * @tc.name      ComponentCollection_WaterFlowImageOf_0008
     * @tc.desc      waterFlowImageOf(item=75.28) returns "resources/base/media/water_flow_3.280000000000001.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0008 begin`);
      const actual: string = waterFlowImageOf(75.28);
      logInfo(`waterFlowImageOf(item=75.28): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_3.280000000000001.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0009
     * @tc.name      ComponentCollection_WaterFlowImageOf_0009
     * @tc.desc      waterFlowImageOf(item=31.07) returns "resources/base/media/water_flow_3.0700000000000003.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0009 begin`);
      const actual: string = waterFlowImageOf(31.07);
      logInfo(`waterFlowImageOf(item=31.07): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_3.0700000000000003.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0010
     * @tc.name      ComponentCollection_WaterFlowImageOf_0010
     * @tc.desc      waterFlowImageOf(item=-95) returns "resources/base/media/water_flow_-3.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_WaterFlowImageOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0010 begin`);
      const actual: string = waterFlowImageOf(-95);
      logInfo(`waterFlowImageOf(item=-95): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_-3.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0011
     * @tc.name      ComponentCollection_WaterFlowImageOf_0011
     * @tc.desc      waterFlowImageOf(item=-18) returns "resources/base/media/water_flow_-2.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_WaterFlowImageOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0011 begin`);
      const actual: string = waterFlowImageOf(-18);
      logInfo(`waterFlowImageOf(item=-18): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_-2.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0012
     * @tc.name      ComponentCollection_WaterFlowImageOf_0012
     * @tc.desc      waterFlowImageOf(item=97.23) returns "resources/base/media/water_flow_1.230000000000004.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0012 begin`);
      const actual: string = waterFlowImageOf(97.23);
      logInfo(`waterFlowImageOf(item=97.23): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_1.230000000000004.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0013
     * @tc.name      ComponentCollection_WaterFlowImageOf_0013
     * @tc.desc      waterFlowImageOf(item=36.84) returns "resources/base/media/water_flow_0.8400000000000034.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0013 begin`);
      const actual: string = waterFlowImageOf(36.84);
      logInfo(`waterFlowImageOf(item=36.84): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.8400000000000034.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0014
     * @tc.name      ComponentCollection_WaterFlowImageOf_0014
     * @tc.desc      waterFlowImageOf(item=33.18) returns "resources/base/media/water_flow_1.1799999999999997.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0014 begin`);
      const actual: string = waterFlowImageOf(33.18);
      logInfo(`waterFlowImageOf(item=33.18): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_1.1799999999999997.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0015
     * @tc.name      ComponentCollection_WaterFlowImageOf_0015
     * @tc.desc      waterFlowImageOf(item=68.21) returns "resources/base/media/water_flow_0.20999999999999375.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0015 begin`);
      const actual: string = waterFlowImageOf(68.21);
      logInfo(`waterFlowImageOf(item=68.21): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.20999999999999375.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0016
     * @tc.name      ComponentCollection_WaterFlowImageOf_0016
     * @tc.desc      waterFlowImageOf(item=85.27) returns "resources/base/media/water_flow_1.269999999999996.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0016 begin`);
      const actual: string = waterFlowImageOf(85.27);
      logInfo(`waterFlowImageOf(item=85.27): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_1.269999999999996.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0017
     * @tc.name      ComponentCollection_WaterFlowImageOf_0017
     * @tc.desc      waterFlowImageOf(item=64.61) returns "resources/base/media/water_flow_0.6099999999999994.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0017 begin`);
      const actual: string = waterFlowImageOf(64.61);
      logInfo(`waterFlowImageOf(item=64.61): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.6099999999999994.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0018
     * @tc.name      ComponentCollection_WaterFlowImageOf_0018
     * @tc.desc      waterFlowImageOf(item=7.04) returns "resources/base/media/water_flow_3.04.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0018 begin`);
      const actual: string = waterFlowImageOf(7.04);
      logInfo(`waterFlowImageOf(item=7.04): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_3.04.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0019
     * @tc.name      ComponentCollection_WaterFlowImageOf_0019
     * @tc.desc      waterFlowImageOf(item=60.85) returns "resources/base/media/water_flow_0.8500000000000014.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0019 begin`);
      const actual: string = waterFlowImageOf(60.85);
      logInfo(`waterFlowImageOf(item=60.85): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.8500000000000014.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0020
     * @tc.name      ComponentCollection_WaterFlowImageOf_0020
     * @tc.desc      waterFlowImageOf(item=46.92) returns "resources/base/media/water_flow_2.9200000000000017.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0020 begin`);
      const actual: string = waterFlowImageOf(46.92);
      logInfo(`waterFlowImageOf(item=46.92): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_2.9200000000000017.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0021
     * @tc.name      ComponentCollection_WaterFlowImageOf_0021
     * @tc.desc      waterFlowImageOf(item=92.54) returns "resources/base/media/water_flow_0.5400000000000063.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0021 begin`);
      const actual: string = waterFlowImageOf(92.54);
      logInfo(`waterFlowImageOf(item=92.54): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.5400000000000063.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0022
     * @tc.name      ComponentCollection_WaterFlowImageOf_0022
     * @tc.desc      waterFlowImageOf(item=85.36) returns "resources/base/media/water_flow_1.3599999999999994.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0022 begin`);
      const actual: string = waterFlowImageOf(85.36);
      logInfo(`waterFlowImageOf(item=85.36): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_1.3599999999999994.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0023
     * @tc.name      ComponentCollection_WaterFlowImageOf_0023
     * @tc.desc      waterFlowImageOf(item=29.22) returns "resources/base/media/water_flow_1.2199999999999989.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0023 begin`);
      const actual: string = waterFlowImageOf(29.22);
      logInfo(`waterFlowImageOf(item=29.22): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_1.2199999999999989.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0024
     * @tc.name      ComponentCollection_WaterFlowImageOf_0024
     * @tc.desc      waterFlowImageOf(item=7.34) returns "resources/base/media/water_flow_3.34.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0024 begin`);
      const actual: string = waterFlowImageOf(7.34);
      logInfo(`waterFlowImageOf(item=7.34): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_3.34.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0025
     * @tc.name      ComponentCollection_WaterFlowImageOf_0025
     * @tc.desc      waterFlowImageOf(item=53.97) returns "resources/base/media/water_flow_1.9699999999999989.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0025 begin`);
      const actual: string = waterFlowImageOf(53.97);
      logInfo(`waterFlowImageOf(item=53.97): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_1.9699999999999989.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0026
     * @tc.name      ComponentCollection_WaterFlowImageOf_0026
     * @tc.desc      waterFlowImageOf(item=55.06) returns "resources/base/media/water_flow_3.0600000000000023.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0026 begin`);
      const actual: string = waterFlowImageOf(55.06);
      logInfo(`waterFlowImageOf(item=55.06): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_3.0600000000000023.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0027
     * @tc.name      ComponentCollection_WaterFlowImageOf_0027
     * @tc.desc      waterFlowImageOf(item=64.72) returns "resources/base/media/water_flow_0.7199999999999989.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0027 begin`);
      const actual: string = waterFlowImageOf(64.72);
      logInfo(`waterFlowImageOf(item=64.72): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.7199999999999989.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0028
     * @tc.name      ComponentCollection_WaterFlowImageOf_0028
     * @tc.desc      waterFlowImageOf(item=46.72) returns "resources/base/media/water_flow_2.719999999999999.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0028 begin`);
      const actual: string = waterFlowImageOf(46.72);
      logInfo(`waterFlowImageOf(item=46.72): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_2.719999999999999.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0029
     * @tc.name      ComponentCollection_WaterFlowImageOf_0029
     * @tc.desc      waterFlowImageOf(item=36.25) returns "resources/base/media/water_flow_0.25.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0029 begin`);
      const actual: string = waterFlowImageOf(36.25);
      logInfo(`waterFlowImageOf(item=36.25): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.25.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0030
     * @tc.name      ComponentCollection_WaterFlowImageOf_0030
     * @tc.desc      waterFlowImageOf(item=57.93) returns "resources/base/media/water_flow_1.9299999999999997.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0030 begin`);
      const actual: string = waterFlowImageOf(57.93);
      logInfo(`waterFlowImageOf(item=57.93): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_1.9299999999999997.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0031
     * @tc.name      ComponentCollection_WaterFlowImageOf_0031
     * @tc.desc      waterFlowImageOf(item=80.03) returns "resources/base/media/water_flow_0.030000000000001137.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0031 begin`);
      const actual: string = waterFlowImageOf(80.03);
      logInfo(`waterFlowImageOf(item=80.03): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.030000000000001137.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0032
     * @tc.name      ComponentCollection_WaterFlowImageOf_0032
     * @tc.desc      waterFlowImageOf(item=0) returns "resources/base/media/water_flow_0.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0032 begin`);
      const actual: string = waterFlowImageOf(0);
      logInfo(`waterFlowImageOf(item=0): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0033
     * @tc.name      ComponentCollection_WaterFlowImageOf_0033
     * @tc.desc      waterFlowImageOf(item=1) returns "resources/base/media/water_flow_1.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0033 begin`);
      const actual: string = waterFlowImageOf(1);
      logInfo(`waterFlowImageOf(item=1): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_1.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0034
     * @tc.name      ComponentCollection_WaterFlowImageOf_0034
     * @tc.desc      waterFlowImageOf(item=10) returns "resources/base/media/water_flow_2.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0034 begin`);
      const actual: string = waterFlowImageOf(10);
      logInfo(`waterFlowImageOf(item=10): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_2.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0035
     * @tc.name      ComponentCollection_WaterFlowImageOf_0035
     * @tc.desc      waterFlowImageOf(item=100) returns "resources/base/media/water_flow_0.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0035 begin`);
      const actual: string = waterFlowImageOf(100);
      logInfo(`waterFlowImageOf(item=100): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0036
     * @tc.name      ComponentCollection_WaterFlowImageOf_0036
     * @tc.desc      waterFlowImageOf(item=15) returns "resources/base/media/water_flow_3.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0036 begin`);
      const actual: string = waterFlowImageOf(15);
      logInfo(`waterFlowImageOf(item=15): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_3.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0037
     * @tc.name      ComponentCollection_WaterFlowImageOf_0037
     * @tc.desc      waterFlowImageOf(item=20) returns "resources/base/media/water_flow_0.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0037 begin`);
      const actual: string = waterFlowImageOf(20);
      logInfo(`waterFlowImageOf(item=20): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0038
     * @tc.name      ComponentCollection_WaterFlowImageOf_0038
     * @tc.desc      waterFlowImageOf(item=25) returns "resources/base/media/water_flow_1.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0038 begin`);
      const actual: string = waterFlowImageOf(25);
      logInfo(`waterFlowImageOf(item=25): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_1.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0039
     * @tc.name      ComponentCollection_WaterFlowImageOf_0039
     * @tc.desc      waterFlowImageOf(item=30) returns "resources/base/media/water_flow_2.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0039 begin`);
      const actual: string = waterFlowImageOf(30);
      logInfo(`waterFlowImageOf(item=30): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_2.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0040
     * @tc.name      ComponentCollection_WaterFlowImageOf_0040
     * @tc.desc      waterFlowImageOf(item=35) returns "resources/base/media/water_flow_3.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0040 begin`);
      const actual: string = waterFlowImageOf(35);
      logInfo(`waterFlowImageOf(item=35): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_3.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0041
     * @tc.name      ComponentCollection_WaterFlowImageOf_0041
     * @tc.desc      waterFlowImageOf(item=40) returns "resources/base/media/water_flow_0.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0041 begin`);
      const actual: string = waterFlowImageOf(40);
      logInfo(`waterFlowImageOf(item=40): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0042
     * @tc.name      ComponentCollection_WaterFlowImageOf_0042
     * @tc.desc      waterFlowImageOf(item=45) returns "resources/base/media/water_flow_1.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0042 begin`);
      const actual: string = waterFlowImageOf(45);
      logInfo(`waterFlowImageOf(item=45): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_1.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0043
     * @tc.name      ComponentCollection_WaterFlowImageOf_0043
     * @tc.desc      waterFlowImageOf(item=50) returns "resources/base/media/water_flow_2.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0043 begin`);
      const actual: string = waterFlowImageOf(50);
      logInfo(`waterFlowImageOf(item=50): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_2.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0044
     * @tc.name      ComponentCollection_WaterFlowImageOf_0044
     * @tc.desc      waterFlowImageOf(item=55) returns "resources/base/media/water_flow_3.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0044 begin`);
      const actual: string = waterFlowImageOf(55);
      logInfo(`waterFlowImageOf(item=55): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_3.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0045
     * @tc.name      ComponentCollection_WaterFlowImageOf_0045
     * @tc.desc      waterFlowImageOf(item=60) returns "resources/base/media/water_flow_0.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0045 begin`);
      const actual: string = waterFlowImageOf(60);
      logInfo(`waterFlowImageOf(item=60): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0046
     * @tc.name      ComponentCollection_WaterFlowImageOf_0046
     * @tc.desc      waterFlowImageOf(item=65) returns "resources/base/media/water_flow_1.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0046 begin`);
      const actual: string = waterFlowImageOf(65);
      logInfo(`waterFlowImageOf(item=65): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_1.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0047
     * @tc.name      ComponentCollection_WaterFlowImageOf_0047
     * @tc.desc      waterFlowImageOf(item=70) returns "resources/base/media/water_flow_2.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0047 begin`);
      const actual: string = waterFlowImageOf(70);
      logInfo(`waterFlowImageOf(item=70): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_2.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0048
     * @tc.name      ComponentCollection_WaterFlowImageOf_0048
     * @tc.desc      waterFlowImageOf(item=75) returns "resources/base/media/water_flow_3.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0048 begin`);
      const actual: string = waterFlowImageOf(75);
      logInfo(`waterFlowImageOf(item=75): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_3.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WATER_FLOW_IMAGE_OF_0049
     * @tc.name      ComponentCollection_WaterFlowImageOf_0049
     * @tc.desc      waterFlowImageOf(item=80) returns "resources/base/media/water_flow_0.png"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_WaterFlowImageOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WaterFlowImageOf_0049 begin`);
      const actual: string = waterFlowImageOf(80);
      logInfo(`waterFlowImageOf(item=80): actual=${actual}`);
      expect(actual).assertEqual('resources/base/media/water_flow_0.png');
      logInfo(`${BUNDLE}WaterFlowImageOf_0049 end`);
    });
  });
}
