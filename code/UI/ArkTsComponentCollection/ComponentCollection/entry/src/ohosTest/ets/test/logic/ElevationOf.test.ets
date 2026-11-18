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
import { elevationOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for elevationOf (50 cases). */
export default function elevationOfTest(): void {
  describe('ElevationOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0001
     * @tc.name      ComponentCollection_ElevationOf_0001
     * @tc.desc      elevationOf(x=-100, y=-100, z=0) returns 1.5707963267948966
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ElevationOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ElevationOf_0001 begin`);
      const actual: number = elevationOf(-100, -100, 0);
      logInfo(`elevationOf(x=-100, y=-100, z=0): actual=${actual}`);
      expect(actual).assertClose(1.5707963267948966, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0002
     * @tc.name      ComponentCollection_ElevationOf_0002
     * @tc.desc      elevationOf(x=-100, y=-100, z=-1) returns 1.5778672767591673
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ElevationOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ElevationOf_0002 begin`);
      const actual: number = elevationOf(-100, -100, -1);
      logInfo(`elevationOf(x=-100, y=-100, z=-1): actual=${actual}`);
      expect(actual).assertClose(1.5778672767591673, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0003
     * @tc.name      ComponentCollection_ElevationOf_0003
     * @tc.desc      elevationOf(x=-100, y=-100, z=1) returns 1.5637253768306258
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0003 begin`);
      const actual: number = elevationOf(-100, -100, 1);
      logInfo(`elevationOf(x=-100, y=-100, z=1): actual=${actual}`);
      expect(actual).assertClose(1.5637253768306258, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0004
     * @tc.name      ComponentCollection_ElevationOf_0004
     * @tc.desc      elevationOf(x=-100, y=-100, z=-2) returns 1.584937519722707
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0004 begin`);
      const actual: number = elevationOf(-100, -100, -2);
      logInfo(`elevationOf(x=-100, y=-100, z=-2): actual=${actual}`);
      expect(actual).assertClose(1.584937519722707, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0005
     * @tc.name      ComponentCollection_ElevationOf_0005
     * @tc.desc      elevationOf(x=-100, y=-100, z=2) returns 1.5566551338670864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0005 begin`);
      const actual: number = elevationOf(-100, -100, 2);
      logInfo(`elevationOf(x=-100, y=-100, z=2): actual=${actual}`);
      expect(actual).assertClose(1.5566551338670864, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0006
     * @tc.name      ComponentCollection_ElevationOf_0006
     * @tc.desc      elevationOf(x=-100, y=-100, z=1e-8) returns 1.570796326724186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0006 begin`);
      const actual: number = elevationOf(-100, -100, 1e-8);
      logInfo(`elevationOf(x=-100, y=-100, z=1e-8): actual=${actual}`);
      expect(actual).assertClose(1.570796326724186, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0007
     * @tc.name      ComponentCollection_ElevationOf_0007
     * @tc.desc      elevationOf(x=-100, y=-100, z=2e-8) returns 1.5707963266534752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0007 begin`);
      const actual: number = elevationOf(-100, -100, 2e-8);
      logInfo(`elevationOf(x=-100, y=-100, z=2e-8): actual=${actual}`);
      expect(actual).assertClose(1.5707963266534752, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0008
     * @tc.name      ComponentCollection_ElevationOf_0008
     * @tc.desc      elevationOf(x=-100, y=-100, z=5e-9) returns 1.5707963267595413
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0008 begin`);
      const actual: number = elevationOf(-100, -100, 5e-9);
      logInfo(`elevationOf(x=-100, y=-100, z=5e-9): actual=${actual}`);
      expect(actual).assertClose(1.5707963267595413, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0009
     * @tc.name      ComponentCollection_ElevationOf_0009
     * @tc.desc      elevationOf(x=-100, y=-100, z=3) returns 1.5495863044809568
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0009 begin`);
      const actual: number = elevationOf(-100, -100, 3);
      logInfo(`elevationOf(x=-100, y=-100, z=3): actual=${actual}`);
      expect(actual).assertClose(1.5495863044809568, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0010
     * @tc.name      ComponentCollection_ElevationOf_0010
     * @tc.desc      elevationOf(x=-100, y=-100, z=10) returns 1.5002031475108493
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0010 begin`);
      const actual: number = elevationOf(-100, -100, 10);
      logInfo(`elevationOf(x=-100, y=-100, z=10): actual=${actual}`);
      expect(actual).assertClose(1.5002031475108493, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0011
     * @tc.name      ComponentCollection_ElevationOf_0011
     * @tc.desc      elevationOf(x=-100, y=-100, z=100) returns 0.9553166181245093
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0011 begin`);
      const actual: number = elevationOf(-100, -100, 100);
      logInfo(`elevationOf(x=-100, y=-100, z=100): actual=${actual}`);
      expect(actual).assertClose(0.9553166181245093, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0012
     * @tc.name      ComponentCollection_ElevationOf_0012
     * @tc.desc      elevationOf(x=-100, y=-100, z=5) returns 1.5354557080881557
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0012 begin`);
      const actual: number = elevationOf(-100, -100, 5);
      logInfo(`elevationOf(x=-100, y=-100, z=5): actual=${actual}`);
      expect(actual).assertClose(1.5354557080881557, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0013
     * @tc.name      ComponentCollection_ElevationOf_0013
     * @tc.desc      elevationOf(x=-2, y=-1, z=3) returns 0.6405223126794245
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0013 begin`);
      const actual: number = elevationOf(-2, -1, 3);
      logInfo(`elevationOf(x=-2, y=-1, z=3): actual=${actual}`);
      expect(actual).assertClose(0.6405223126794245, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0014
     * @tc.name      ComponentCollection_ElevationOf_0014
     * @tc.desc      elevationOf(x=-1, y=50, z=3) returns 1.5108801250513322
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0014 begin`);
      const actual: number = elevationOf(-1, 50, 3);
      logInfo(`elevationOf(x=-1, y=50, z=3): actual=${actual}`);
      expect(actual).assertClose(1.5108801250513322, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0015
     * @tc.name      ComponentCollection_ElevationOf_0015
     * @tc.desc      elevationOf(x=5e-9, y=-2, z=2e-8) returns 1.5707963167948966
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0015 begin`);
      const actual: number = elevationOf(5e-9, -2, 2e-8);
      logInfo(`elevationOf(x=5e-9, y=-2, z=2e-8): actual=${actual}`);
      expect(actual).assertClose(1.5707963167948966, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0016
     * @tc.name      ComponentCollection_ElevationOf_0016
     * @tc.desc      elevationOf(x=3, y=5e-9, z=-1) returns 1.8925468811915387
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0016 begin`);
      const actual: number = elevationOf(3, 5e-9, -1);
      logInfo(`elevationOf(x=3, y=5e-9, z=-1): actual=${actual}`);
      expect(actual).assertClose(1.8925468811915387, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0017
     * @tc.name      ComponentCollection_ElevationOf_0017
     * @tc.desc      elevationOf(x=2e-8, y=2, z=3) returns 0.5880026035475675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0017 begin`);
      const actual: number = elevationOf(2e-8, 2, 3);
      logInfo(`elevationOf(x=2e-8, y=2, z=3): actual=${actual}`);
      expect(actual).assertClose(0.5880026035475675, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0018
     * @tc.name      ComponentCollection_ElevationOf_0018
     * @tc.desc      elevationOf(x=1e-8, y=2, z=5) returns 0.3805063771123646
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0018 begin`);
      const actual: number = elevationOf(1e-8, 2, 5);
      logInfo(`elevationOf(x=1e-8, y=2, z=5): actual=${actual}`);
      expect(actual).assertClose(0.3805063771123646, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0019
     * @tc.name      ComponentCollection_ElevationOf_0019
     * @tc.desc      elevationOf(x=-100, y=1, z=5) returns 1.5208404246518339
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0019 begin`);
      const actual: number = elevationOf(-100, 1, 5);
      logInfo(`elevationOf(x=-100, y=1, z=5): actual=${actual}`);
      expect(actual).assertClose(1.5208404246518339, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0020
     * @tc.name      ComponentCollection_ElevationOf_0020
     * @tc.desc      elevationOf(x=1e-8, y=2, z=2) returns 0.7853981633974484
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0020 begin`);
      const actual: number = elevationOf(1e-8, 2, 2);
      logInfo(`elevationOf(x=1e-8, y=2, z=2): actual=${actual}`);
      expect(actual).assertClose(0.7853981633974484, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0021
     * @tc.name      ComponentCollection_ElevationOf_0021
     * @tc.desc      elevationOf(x=3, y=100, z=5) returns 1.5208603598501043
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ElevationOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElevationOf_0021 begin`);
      const actual: number = elevationOf(3, 100, 5);
      logInfo(`elevationOf(x=3, y=100, z=5): actual=${actual}`);
      expect(actual).assertClose(1.5208603598501043, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0022
     * @tc.name      ComponentCollection_ElevationOf_0022
     * @tc.desc      elevationOf(x=-2, y=5e-9, z=100) returns 0.019997333973145695
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0022 begin`);
      const actual: number = elevationOf(-2, 5e-9, 100);
      logInfo(`elevationOf(x=-2, y=5e-9, z=100): actual=${actual}`);
      expect(actual).assertClose(0.019997333973145695, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0023
     * @tc.name      ComponentCollection_ElevationOf_0023
     * @tc.desc      elevationOf(x=50, y=2, z=2) returns 1.530849550306505
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0023 begin`);
      const actual: number = elevationOf(50, 2, 2);
      logInfo(`elevationOf(x=50, y=2, z=2): actual=${actual}`);
      expect(actual).assertClose(1.530849550306505, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0024
     * @tc.name      ComponentCollection_ElevationOf_0024
     * @tc.desc      elevationOf(x=-1, y=1, z=100) returns 0.014141192927815505
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0024 begin`);
      const actual: number = elevationOf(-1, 1, 100);
      logInfo(`elevationOf(x=-1, y=1, z=100): actual=${actual}`);
      expect(actual).assertClose(0.014141192927815505, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0025
     * @tc.name      ComponentCollection_ElevationOf_0025
     * @tc.desc      elevationOf(x=-1, y=-1, z=10) returns 0.1404897017535197
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0025 begin`);
      const actual: number = elevationOf(-1, -1, 10);
      logInfo(`elevationOf(x=-1, y=-1, z=10): actual=${actual}`);
      expect(actual).assertClose(0.1404897017535197, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0026
     * @tc.name      ComponentCollection_ElevationOf_0026
     * @tc.desc      elevationOf(x=2e-8, y=5e-9, z=5e-9) returns 1.3328552019646884
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ElevationOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElevationOf_0026 begin`);
      const actual: number = elevationOf(2e-8, 5e-9, 5e-9);
      logInfo(`elevationOf(x=2e-8, y=5e-9, z=5e-9): actual=${actual}`);
      expect(actual).assertClose(1.3328552019646884, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0027
     * @tc.name      ComponentCollection_ElevationOf_0027
     * @tc.desc      elevationOf(x=5e-9, y=100, z=2e-8) returns 1.5707963265948965
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ElevationOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElevationOf_0027 begin`);
      const actual: number = elevationOf(5e-9, 100, 2e-8);
      logInfo(`elevationOf(x=5e-9, y=100, z=2e-8): actual=${actual}`);
      expect(actual).assertClose(1.5707963265948965, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0028
     * @tc.name      ComponentCollection_ElevationOf_0028
     * @tc.desc      elevationOf(x=50, y=5e-9, z=3) returns 1.5108681716736887
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ElevationOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElevationOf_0028 begin`);
      const actual: number = elevationOf(50, 5e-9, 3);
      logInfo(`elevationOf(x=50, y=5e-9, z=3): actual=${actual}`);
      expect(actual).assertClose(1.5108681716736887, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0029
     * @tc.name      ComponentCollection_ElevationOf_0029
     * @tc.desc      elevationOf(x=0, y=1e-8, z=2e-8) returns 0.46364760900080615
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0029 begin`);
      const actual: number = elevationOf(0, 1e-8, 2e-8);
      logInfo(`elevationOf(x=0, y=1e-8, z=2e-8): actual=${actual}`);
      expect(actual).assertClose(0.46364760900080615, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0030
     * @tc.name      ComponentCollection_ElevationOf_0030
     * @tc.desc      elevationOf(x=1e-8, y=3, z=5e-9) returns 1.57079632512823
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0030 begin`);
      const actual: number = elevationOf(1e-8, 3, 5e-9);
      logInfo(`elevationOf(x=1e-8, y=3, z=5e-9): actual=${actual}`);
      expect(actual).assertClose(1.57079632512823, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0031
     * @tc.name      ComponentCollection_ElevationOf_0031
     * @tc.desc      elevationOf(x=50, y=3, z=10) returns 1.3737460127944057
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ElevationOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElevationOf_0031 begin`);
      const actual: number = elevationOf(50, 3, 10);
      logInfo(`elevationOf(x=50, y=3, z=10): actual=${actual}`);
      expect(actual).assertClose(1.3737460127944057, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0032
     * @tc.name      ComponentCollection_ElevationOf_0032
     * @tc.desc      elevationOf(x=-2, y=2, z=5e-9) returns 1.5707963250271297
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0032 begin`);
      const actual: number = elevationOf(-2, 2, 5e-9);
      logInfo(`elevationOf(x=-2, y=2, z=5e-9): actual=${actual}`);
      expect(actual).assertClose(1.5707963250271297, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0033
     * @tc.name      ComponentCollection_ElevationOf_0033
     * @tc.desc      elevationOf(x=5e-9, y=5e-9, z=-1) returns 3.141592653589793
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0033 begin`);
      const actual: number = elevationOf(5e-9, 5e-9, -1);
      logInfo(`elevationOf(x=5e-9, y=5e-9, z=-1): actual=${actual}`);
      expect(actual).assertClose(3.141592653589793, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0034
     * @tc.name      ComponentCollection_ElevationOf_0034
     * @tc.desc      elevationOf(x=1e-8, y=1, z=100) returns 0.009999666686661376
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0034 begin`);
      const actual: number = elevationOf(1e-8, 1, 100);
      logInfo(`elevationOf(x=1e-8, y=1, z=100): actual=${actual}`);
      expect(actual).assertClose(0.009999666686661376, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0035
     * @tc.name      ComponentCollection_ElevationOf_0035
     * @tc.desc      elevationOf(x=2e-8, y=100, z=10) returns 1.4711276743037347
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ElevationOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElevationOf_0035 begin`);
      const actual: number = elevationOf(2e-8, 100, 10);
      logInfo(`elevationOf(x=2e-8, y=100, z=10): actual=${actual}`);
      expect(actual).assertClose(1.4711276743037347, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0036
     * @tc.name      ComponentCollection_ElevationOf_0036
     * @tc.desc      elevationOf(x=100, y=2e-8, z=3) returns 1.5408053219380187
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ElevationOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElevationOf_0036 begin`);
      const actual: number = elevationOf(100, 2e-8, 3);
      logInfo(`elevationOf(x=100, y=2e-8, z=3): actual=${actual}`);
      expect(actual).assertClose(1.5408053219380187, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0037
     * @tc.name      ComponentCollection_ElevationOf_0037
     * @tc.desc      elevationOf(x=-1, y=1e-8, z=5e-9) returns 1.5707963217948966
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0037 begin`);
      const actual: number = elevationOf(-1, 1e-8, 5e-9);
      logInfo(`elevationOf(x=-1, y=1e-8, z=5e-9): actual=${actual}`);
      expect(actual).assertClose(1.5707963217948966, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0038
     * @tc.name      ComponentCollection_ElevationOf_0038
     * @tc.desc      elevationOf(x=1e-8, y=2, z=-1) returns 2.0344439357957027
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0038 begin`);
      const actual: number = elevationOf(1e-8, 2, -1);
      logInfo(`elevationOf(x=1e-8, y=2, z=-1): actual=${actual}`);
      expect(actual).assertClose(2.0344439357957027, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0039
     * @tc.name      ComponentCollection_ElevationOf_0039
     * @tc.desc      elevationOf(x=100, y=-2, z=3) returns 1.5408113147461695
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0039 begin`);
      const actual: number = elevationOf(100, -2, 3);
      logInfo(`elevationOf(x=100, y=-2, z=3): actual=${actual}`);
      expect(actual).assertClose(1.5408113147461695, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0040
     * @tc.name      ComponentCollection_ElevationOf_0040
     * @tc.desc      elevationOf(x=2, y=1e-8, z=-2) returns 2.356194490192345
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0040 begin`);
      const actual: number = elevationOf(2, 1e-8, -2);
      logInfo(`elevationOf(x=2, y=1e-8, z=-2): actual=${actual}`);
      expect(actual).assertClose(2.356194490192345, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0041
     * @tc.name      ComponentCollection_ElevationOf_0041
     * @tc.desc      elevationOf(x=0, y=5e-9, z=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0041 begin`);
      const actual: number = elevationOf(0, 5e-9, 5);
      logInfo(`elevationOf(x=0, y=5e-9, z=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElevationOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0042
     * @tc.name      ComponentCollection_ElevationOf_0042
     * @tc.desc      elevationOf(x=2, y=5e-9, z=10) returns 0.19739555984988044
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0042 begin`);
      const actual: number = elevationOf(2, 5e-9, 10);
      logInfo(`elevationOf(x=2, y=5e-9, z=10): actual=${actual}`);
      expect(actual).assertClose(0.19739555984988044, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0043
     * @tc.name      ComponentCollection_ElevationOf_0043
     * @tc.desc      elevationOf(x=-1, y=-2, z=2e-8) returns 1.5707963178506248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0043 begin`);
      const actual: number = elevationOf(-1, -2, 2e-8);
      logInfo(`elevationOf(x=-1, y=-2, z=2e-8): actual=${actual}`);
      expect(actual).assertClose(1.5707963178506248, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0044
     * @tc.name      ComponentCollection_ElevationOf_0044
     * @tc.desc      elevationOf(x=-1, y=100, z=1e-8) returns 1.5707963266949017
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0044 begin`);
      const actual: number = elevationOf(-1, 100, 1e-8);
      logInfo(`elevationOf(x=-1, y=100, z=1e-8): actual=${actual}`);
      expect(actual).assertClose(1.5707963266949017, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0045
     * @tc.name      ComponentCollection_ElevationOf_0045
     * @tc.desc      elevationOf(x=1, y=1, z=1) returns 0.9553166181245092
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0045 begin`);
      const actual: number = elevationOf(1, 1, 1);
      logInfo(`elevationOf(x=1, y=1, z=1): actual=${actual}`);
      expect(actual).assertClose(0.9553166181245092, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0046
     * @tc.name      ComponentCollection_ElevationOf_0046
     * @tc.desc      elevationOf(x=2, y=1e-8, z=5e-9) returns 1.5707963242948966
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0046 begin`);
      const actual: number = elevationOf(2, 1e-8, 5e-9);
      logInfo(`elevationOf(x=2, y=1e-8, z=5e-9): actual=${actual}`);
      expect(actual).assertClose(1.5707963242948966, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0047
     * @tc.name      ComponentCollection_ElevationOf_0047
     * @tc.desc      elevationOf(x=3, y=1e-8, z=5) returns 0.5404195002705844
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_ElevationOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElevationOf_0047 begin`);
      const actual: number = elevationOf(3, 1e-8, 5);
      logInfo(`elevationOf(x=3, y=1e-8, z=5): actual=${actual}`);
      expect(actual).assertClose(0.5404195002705844, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0048
     * @tc.name      ComponentCollection_ElevationOf_0048
     * @tc.desc      elevationOf(x=-1, y=-2, z=10) returns 0.21998797739545933
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0048 begin`);
      const actual: number = elevationOf(-1, -2, 10);
      logInfo(`elevationOf(x=-1, y=-2, z=10): actual=${actual}`);
      expect(actual).assertClose(0.21998797739545933, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0049
     * @tc.name      ComponentCollection_ElevationOf_0049
     * @tc.desc      elevationOf(x=-2, y=-1, z=-2) returns 2.300523983021863
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0049 begin`);
      const actual: number = elevationOf(-2, -1, -2);
      logInfo(`elevationOf(x=-2, y=-1, z=-2): actual=${actual}`);
      expect(actual).assertClose(2.300523983021863, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0049 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_ELEVATION_OF_0050
     * @tc.name      ComponentCollection_ElevationOf_0050
     * @tc.desc      elevationOf(x=-1, y=100, z=100) returns 0.7854231621475212
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_ElevationOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElevationOf_0050 begin`);
      const actual: number = elevationOf(-1, 100, 100);
      logInfo(`elevationOf(x=-1, y=100, z=100): actual=${actual}`);
      expect(actual).assertClose(0.7854231621475212, PRECISION);
      logInfo(`${BUNDLE}ElevationOf_0050 end`);
    });
  });
}
