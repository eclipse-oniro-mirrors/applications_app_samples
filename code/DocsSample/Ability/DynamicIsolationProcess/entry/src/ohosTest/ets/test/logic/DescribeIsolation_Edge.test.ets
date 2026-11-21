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

import { describe, expect, it, beforeAll, afterAll, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IsolationModel } from '../Shared/IsolationFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_dynamicisolationprocess]';
const BUNDLE: string = 'DynamicIsolationProcess_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for describeIsolation (50 cases). */
export default function describeIsolationEdgeTest(): void {
  describe('DescribeIsolationEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}DescribeIsolationEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}DescribeIsolationEdgeTest end`);
    });
    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0001
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0001
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle0, k0) returns process=bundle0:k0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: PlainString+ShortString; expected: process=bundle0:k0
      const actual: string = IsolationModel.describeIsolation('bundle0', 'k0');
      expect(actual).assertEqual('process=bundle0:k0');
      expect(actual.length).assertEqual(18);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0002
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0002
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle1, k1) returns process=bundle1:k1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: process=bundle1:k1
      const actual: string = IsolationModel.describeIsolation('bundle1', 'k1');
      expect(actual).assertEqual('process=bundle1:k1');
      expect(actual.length).assertEqual(18);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0003
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0003
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle2, k2) returns process=bundle2:k2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: process=bundle2:k2
      const actual: string = IsolationModel.describeIsolation('bundle2', 'k2');
      expect(actual).assertEqual('process=bundle2:k2');
      expect(actual.length).assertEqual(18);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0004
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0004
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle3, k3) returns process=bundle3:k3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: process=bundle3:k3
      const actual: string = IsolationModel.describeIsolation('bundle3', 'k3');
      expect(actual).assertEqual('process=bundle3:k3');
      expect(actual.length).assertEqual(18);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0005
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0005
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle4, k4) returns process=bundle4:k4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: process=bundle4:k4
      const actual: string = IsolationModel.describeIsolation('bundle4', 'k4');
      expect(actual).assertEqual('process=bundle4:k4');
      expect(actual.length).assertEqual(18);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0006
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0006
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle5, k5) returns process=bundle5:k5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: process=bundle5:k5
      const actual: string = IsolationModel.describeIsolation('bundle5', 'k5');
      expect(actual).assertEqual('process=bundle5:k5');
      expect(actual.length).assertEqual(18);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0007
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0007
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle6, k6) returns process=bundle6:k6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: process=bundle6:k6
      const actual: string = IsolationModel.describeIsolation('bundle6', 'k6');
      expect(actual).assertEqual('process=bundle6:k6');
      expect(actual.length).assertEqual(18);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0008
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0008
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle7, k7) returns process=bundle7:k7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: process=bundle7:k7
      const actual: string = IsolationModel.describeIsolation('bundle7', 'k7');
      expect(actual).assertEqual('process=bundle7:k7');
      expect(actual.length).assertEqual(18);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0009
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0009
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle8, k8) returns process=bundle8:k8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: process=bundle8:k8
      const actual: string = IsolationModel.describeIsolation('bundle8', 'k8');
      expect(actual).assertEqual('process=bundle8:k8');
      expect(actual.length).assertEqual(18);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0010
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0010
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle9, k9) returns process=bundle9:k9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: process=bundle9:k9
      const actual: string = IsolationModel.describeIsolation('bundle9', 'k9');
      expect(actual).assertEqual('process=bundle9:k9');
      expect(actual.length).assertEqual(18);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0011
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0011
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle10, k10) returns process=bundle10:k10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle10:k10
      const actual: string = IsolationModel.describeIsolation('bundle10', 'k10');
      expect(actual).assertEqual('process=bundle10:k10');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0012
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0012
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle11, k11) returns process=bundle11:k11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle11:k11
      const actual: string = IsolationModel.describeIsolation('bundle11', 'k11');
      expect(actual).assertEqual('process=bundle11:k11');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0013
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0013
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle12, k12) returns process=bundle12:k12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle12:k12
      const actual: string = IsolationModel.describeIsolation('bundle12', 'k12');
      expect(actual).assertEqual('process=bundle12:k12');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0014
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0014
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle13, k13) returns process=bundle13:k13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle13:k13
      const actual: string = IsolationModel.describeIsolation('bundle13', 'k13');
      expect(actual).assertEqual('process=bundle13:k13');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0015
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0015
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle14, k14) returns process=bundle14:k14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle14:k14
      const actual: string = IsolationModel.describeIsolation('bundle14', 'k14');
      expect(actual).assertEqual('process=bundle14:k14');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0016
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0016
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle15, k15) returns process=bundle15:k15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle15:k15
      const actual: string = IsolationModel.describeIsolation('bundle15', 'k15');
      expect(actual).assertEqual('process=bundle15:k15');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0017
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0017
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle16, k16) returns process=bundle16:k16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle16:k16
      const actual: string = IsolationModel.describeIsolation('bundle16', 'k16');
      expect(actual).assertEqual('process=bundle16:k16');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0018
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0018
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle17, k17) returns process=bundle17:k17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle17:k17
      const actual: string = IsolationModel.describeIsolation('bundle17', 'k17');
      expect(actual).assertEqual('process=bundle17:k17');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0019
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0019
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle18, k18) returns process=bundle18:k18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle18:k18
      const actual: string = IsolationModel.describeIsolation('bundle18', 'k18');
      expect(actual).assertEqual('process=bundle18:k18');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0020
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0020
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle19, k19) returns process=bundle19:k19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle19:k19
      const actual: string = IsolationModel.describeIsolation('bundle19', 'k19');
      expect(actual).assertEqual('process=bundle19:k19');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0021
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0021
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle20, k20) returns process=bundle20:k20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle20:k20
      const actual: string = IsolationModel.describeIsolation('bundle20', 'k20');
      expect(actual).assertEqual('process=bundle20:k20');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0022
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0022
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle21, k21) returns process=bundle21:k21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle21:k21
      const actual: string = IsolationModel.describeIsolation('bundle21', 'k21');
      expect(actual).assertEqual('process=bundle21:k21');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0023
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0023
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle22, k22) returns process=bundle22:k22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle22:k22
      const actual: string = IsolationModel.describeIsolation('bundle22', 'k22');
      expect(actual).assertEqual('process=bundle22:k22');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0024
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0024
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle23, k23) returns process=bundle23:k23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle23:k23
      const actual: string = IsolationModel.describeIsolation('bundle23', 'k23');
      expect(actual).assertEqual('process=bundle23:k23');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0025
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0025
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle24, k24) returns process=bundle24:k24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle24:k24
      const actual: string = IsolationModel.describeIsolation('bundle24', 'k24');
      expect(actual).assertEqual('process=bundle24:k24');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0026
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0026
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle25, k25) returns process=bundle25:k25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle25:k25
      const actual: string = IsolationModel.describeIsolation('bundle25', 'k25');
      expect(actual).assertEqual('process=bundle25:k25');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0027
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0027
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle26, k26) returns process=bundle26:k26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle26:k26
      const actual: string = IsolationModel.describeIsolation('bundle26', 'k26');
      expect(actual).assertEqual('process=bundle26:k26');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0028
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0028
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle27, k27) returns process=bundle27:k27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle27:k27
      const actual: string = IsolationModel.describeIsolation('bundle27', 'k27');
      expect(actual).assertEqual('process=bundle27:k27');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0029
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0029
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle28, k28) returns process=bundle28:k28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle28:k28
      const actual: string = IsolationModel.describeIsolation('bundle28', 'k28');
      expect(actual).assertEqual('process=bundle28:k28');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0030
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0030
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle29, k29) returns process=bundle29:k29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: process=bundle29:k29
      const actual: string = IsolationModel.describeIsolation('bundle29', 'k29');
      expect(actual).assertEqual('process=bundle29:k29');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0031
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0031
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle30, k30) returns process=bundle30:k30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle30:k30
      const actual: string = IsolationModel.describeIsolation('bundle30', 'k30');
      expect(actual).assertEqual('process=bundle30:k30');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0032
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0032
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle31, k31) returns process=bundle31:k31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle31:k31
      const actual: string = IsolationModel.describeIsolation('bundle31', 'k31');
      expect(actual).assertEqual('process=bundle31:k31');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0033
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0033
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle32, k32) returns process=bundle32:k32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle32:k32
      const actual: string = IsolationModel.describeIsolation('bundle32', 'k32');
      expect(actual).assertEqual('process=bundle32:k32');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0034
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0034
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle33, k33) returns process=bundle33:k33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle33:k33
      const actual: string = IsolationModel.describeIsolation('bundle33', 'k33');
      expect(actual).assertEqual('process=bundle33:k33');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0035
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0035
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle34, k34) returns process=bundle34:k34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle34:k34
      const actual: string = IsolationModel.describeIsolation('bundle34', 'k34');
      expect(actual).assertEqual('process=bundle34:k34');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0036
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0036
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle35, k35) returns process=bundle35:k35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle35:k35
      const actual: string = IsolationModel.describeIsolation('bundle35', 'k35');
      expect(actual).assertEqual('process=bundle35:k35');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0037
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0037
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle36, k36) returns process=bundle36:k36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle36:k36
      const actual: string = IsolationModel.describeIsolation('bundle36', 'k36');
      expect(actual).assertEqual('process=bundle36:k36');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0038
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0038
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle37, k37) returns process=bundle37:k37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle37:k37
      const actual: string = IsolationModel.describeIsolation('bundle37', 'k37');
      expect(actual).assertEqual('process=bundle37:k37');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0039
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0039
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle38, k38) returns process=bundle38:k38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle38:k38
      const actual: string = IsolationModel.describeIsolation('bundle38', 'k38');
      expect(actual).assertEqual('process=bundle38:k38');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0040
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0040
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle39, k39) returns process=bundle39:k39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle39:k39
      const actual: string = IsolationModel.describeIsolation('bundle39', 'k39');
      expect(actual).assertEqual('process=bundle39:k39');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0041
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0041
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle40, k40) returns process=bundle40:k40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle40:k40
      const actual: string = IsolationModel.describeIsolation('bundle40', 'k40');
      expect(actual).assertEqual('process=bundle40:k40');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0042
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0042
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle41, k41) returns process=bundle41:k41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle41:k41
      const actual: string = IsolationModel.describeIsolation('bundle41', 'k41');
      expect(actual).assertEqual('process=bundle41:k41');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0043
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0043
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle42, k42) returns process=bundle42:k42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle42:k42
      const actual: string = IsolationModel.describeIsolation('bundle42', 'k42');
      expect(actual).assertEqual('process=bundle42:k42');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0044
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0044
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle43, k43) returns process=bundle43:k43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle43:k43
      const actual: string = IsolationModel.describeIsolation('bundle43', 'k43');
      expect(actual).assertEqual('process=bundle43:k43');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0045
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0045
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle44, k44) returns process=bundle44:k44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle44:k44
      const actual: string = IsolationModel.describeIsolation('bundle44', 'k44');
      expect(actual).assertEqual('process=bundle44:k44');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0046
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0046
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle45, k45) returns process=bundle45:k45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle45:k45
      const actual: string = IsolationModel.describeIsolation('bundle45', 'k45');
      expect(actual).assertEqual('process=bundle45:k45');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0047
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0047
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle46, k46) returns process=bundle46:k46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle46:k46
      const actual: string = IsolationModel.describeIsolation('bundle46', 'k46');
      expect(actual).assertEqual('process=bundle46:k46');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0048
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0048
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle47, k47) returns process=bundle47:k47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle47:k47
      const actual: string = IsolationModel.describeIsolation('bundle47', 'k47');
      expect(actual).assertEqual('process=bundle47:k47');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0049
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0049
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle48, k48) returns process=bundle48:k48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle48:k48
      const actual: string = IsolationModel.describeIsolation('bundle48', 'k48');
      expect(actual).assertEqual('process=bundle48:k48');
      expect(actual.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_DESCRIBE_ISOLATION_EDGE_0050
     * @tc.name      DynamicIsolationProcess_describeIsolation_Edge_0050
     * @tc.desc      [PlainString+ShortString] Verify describeIsolation(bundle49, k49) returns process=bundle49:k49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_describeIsolation_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: process=bundle49:k49
      const actual: string = IsolationModel.describeIsolation('bundle49', 'k49');
      expect(actual).assertEqual('process=bundle49:k49');
      expect(actual.length).assertEqual(20);
    });

  });
}
