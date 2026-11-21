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

/** Logic checks for composeProcessName (50 cases). */
export default function composeProcessNameEdgeTest(): void {
  describe('ComposeProcessNameEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}ComposeProcessNameEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}ComposeProcessNameEdgeTest end`);
    });
    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0001
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0001
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle0, k0) returns bundle0:k0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: PlainString+ShortString; expected: bundle0:k0
      const actual: string = IsolationModel.composeProcessName('bundle0', 'k0');
      expect(actual).assertEqual('bundle0:k0');
      expect(actual.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0002
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0002
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle1, k1) returns bundle1:k1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: bundle1:k1
      const actual: string = IsolationModel.composeProcessName('bundle1', 'k1');
      expect(actual).assertEqual('bundle1:k1');
      expect(actual.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0003
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0003
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle2, k2) returns bundle2:k2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: bundle2:k2
      const actual: string = IsolationModel.composeProcessName('bundle2', 'k2');
      expect(actual).assertEqual('bundle2:k2');
      expect(actual.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0004
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0004
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle3, k3) returns bundle3:k3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: bundle3:k3
      const actual: string = IsolationModel.composeProcessName('bundle3', 'k3');
      expect(actual).assertEqual('bundle3:k3');
      expect(actual.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0005
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0005
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle4, k4) returns bundle4:k4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: bundle4:k4
      const actual: string = IsolationModel.composeProcessName('bundle4', 'k4');
      expect(actual).assertEqual('bundle4:k4');
      expect(actual.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0006
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0006
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle5, k5) returns bundle5:k5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: bundle5:k5
      const actual: string = IsolationModel.composeProcessName('bundle5', 'k5');
      expect(actual).assertEqual('bundle5:k5');
      expect(actual.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0007
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0007
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle6, k6) returns bundle6:k6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: bundle6:k6
      const actual: string = IsolationModel.composeProcessName('bundle6', 'k6');
      expect(actual).assertEqual('bundle6:k6');
      expect(actual.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0008
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0008
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle7, k7) returns bundle7:k7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: bundle7:k7
      const actual: string = IsolationModel.composeProcessName('bundle7', 'k7');
      expect(actual).assertEqual('bundle7:k7');
      expect(actual.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0009
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0009
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle8, k8) returns bundle8:k8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: bundle8:k8
      const actual: string = IsolationModel.composeProcessName('bundle8', 'k8');
      expect(actual).assertEqual('bundle8:k8');
      expect(actual.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0010
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0010
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle9, k9) returns bundle9:k9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString+ShortString; expected: bundle9:k9
      const actual: string = IsolationModel.composeProcessName('bundle9', 'k9');
      expect(actual).assertEqual('bundle9:k9');
      expect(actual.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0011
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0011
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle10, k10) returns bundle10:k10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle10:k10
      const actual: string = IsolationModel.composeProcessName('bundle10', 'k10');
      expect(actual).assertEqual('bundle10:k10');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0012
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0012
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle11, k11) returns bundle11:k11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle11:k11
      const actual: string = IsolationModel.composeProcessName('bundle11', 'k11');
      expect(actual).assertEqual('bundle11:k11');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0013
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0013
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle12, k12) returns bundle12:k12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle12:k12
      const actual: string = IsolationModel.composeProcessName('bundle12', 'k12');
      expect(actual).assertEqual('bundle12:k12');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0014
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0014
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle13, k13) returns bundle13:k13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle13:k13
      const actual: string = IsolationModel.composeProcessName('bundle13', 'k13');
      expect(actual).assertEqual('bundle13:k13');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0015
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0015
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle14, k14) returns bundle14:k14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle14:k14
      const actual: string = IsolationModel.composeProcessName('bundle14', 'k14');
      expect(actual).assertEqual('bundle14:k14');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0016
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0016
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle15, k15) returns bundle15:k15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle15:k15
      const actual: string = IsolationModel.composeProcessName('bundle15', 'k15');
      expect(actual).assertEqual('bundle15:k15');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0017
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0017
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle16, k16) returns bundle16:k16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle16:k16
      const actual: string = IsolationModel.composeProcessName('bundle16', 'k16');
      expect(actual).assertEqual('bundle16:k16');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0018
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0018
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle17, k17) returns bundle17:k17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle17:k17
      const actual: string = IsolationModel.composeProcessName('bundle17', 'k17');
      expect(actual).assertEqual('bundle17:k17');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0019
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0019
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle18, k18) returns bundle18:k18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle18:k18
      const actual: string = IsolationModel.composeProcessName('bundle18', 'k18');
      expect(actual).assertEqual('bundle18:k18');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0020
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0020
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle19, k19) returns bundle19:k19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle19:k19
      const actual: string = IsolationModel.composeProcessName('bundle19', 'k19');
      expect(actual).assertEqual('bundle19:k19');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0021
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0021
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle20, k20) returns bundle20:k20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle20:k20
      const actual: string = IsolationModel.composeProcessName('bundle20', 'k20');
      expect(actual).assertEqual('bundle20:k20');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0022
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0022
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle21, k21) returns bundle21:k21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle21:k21
      const actual: string = IsolationModel.composeProcessName('bundle21', 'k21');
      expect(actual).assertEqual('bundle21:k21');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0023
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0023
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle22, k22) returns bundle22:k22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle22:k22
      const actual: string = IsolationModel.composeProcessName('bundle22', 'k22');
      expect(actual).assertEqual('bundle22:k22');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0024
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0024
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle23, k23) returns bundle23:k23.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle23:k23
      const actual: string = IsolationModel.composeProcessName('bundle23', 'k23');
      expect(actual).assertEqual('bundle23:k23');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0025
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0025
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle24, k24) returns bundle24:k24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle24:k24
      const actual: string = IsolationModel.composeProcessName('bundle24', 'k24');
      expect(actual).assertEqual('bundle24:k24');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0026
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0026
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle25, k25) returns bundle25:k25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle25:k25
      const actual: string = IsolationModel.composeProcessName('bundle25', 'k25');
      expect(actual).assertEqual('bundle25:k25');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0027
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0027
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle26, k26) returns bundle26:k26.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle26:k26
      const actual: string = IsolationModel.composeProcessName('bundle26', 'k26');
      expect(actual).assertEqual('bundle26:k26');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0028
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0028
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle27, k27) returns bundle27:k27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle27:k27
      const actual: string = IsolationModel.composeProcessName('bundle27', 'k27');
      expect(actual).assertEqual('bundle27:k27');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0029
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0029
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle28, k28) returns bundle28:k28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle28:k28
      const actual: string = IsolationModel.composeProcessName('bundle28', 'k28');
      expect(actual).assertEqual('bundle28:k28');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0030
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0030
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle29, k29) returns bundle29:k29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString+ShortString; expected: bundle29:k29
      const actual: string = IsolationModel.composeProcessName('bundle29', 'k29');
      expect(actual).assertEqual('bundle29:k29');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0031
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0031
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle30, k30) returns bundle30:k30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle30:k30
      const actual: string = IsolationModel.composeProcessName('bundle30', 'k30');
      expect(actual).assertEqual('bundle30:k30');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0032
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0032
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle31, k31) returns bundle31:k31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle31:k31
      const actual: string = IsolationModel.composeProcessName('bundle31', 'k31');
      expect(actual).assertEqual('bundle31:k31');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0033
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0033
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle32, k32) returns bundle32:k32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle32:k32
      const actual: string = IsolationModel.composeProcessName('bundle32', 'k32');
      expect(actual).assertEqual('bundle32:k32');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0034
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0034
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle33, k33) returns bundle33:k33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle33:k33
      const actual: string = IsolationModel.composeProcessName('bundle33', 'k33');
      expect(actual).assertEqual('bundle33:k33');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0035
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0035
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle34, k34) returns bundle34:k34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle34:k34
      const actual: string = IsolationModel.composeProcessName('bundle34', 'k34');
      expect(actual).assertEqual('bundle34:k34');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0036
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0036
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle35, k35) returns bundle35:k35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle35:k35
      const actual: string = IsolationModel.composeProcessName('bundle35', 'k35');
      expect(actual).assertEqual('bundle35:k35');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0037
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0037
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle36, k36) returns bundle36:k36.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle36:k36
      const actual: string = IsolationModel.composeProcessName('bundle36', 'k36');
      expect(actual).assertEqual('bundle36:k36');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0038
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0038
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle37, k37) returns bundle37:k37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle37:k37
      const actual: string = IsolationModel.composeProcessName('bundle37', 'k37');
      expect(actual).assertEqual('bundle37:k37');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0039
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0039
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle38, k38) returns bundle38:k38.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle38:k38
      const actual: string = IsolationModel.composeProcessName('bundle38', 'k38');
      expect(actual).assertEqual('bundle38:k38');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0040
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0040
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle39, k39) returns bundle39:k39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle39:k39
      const actual: string = IsolationModel.composeProcessName('bundle39', 'k39');
      expect(actual).assertEqual('bundle39:k39');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0041
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0041
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle40, k40) returns bundle40:k40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle40:k40
      const actual: string = IsolationModel.composeProcessName('bundle40', 'k40');
      expect(actual).assertEqual('bundle40:k40');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0042
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0042
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle41, k41) returns bundle41:k41.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle41:k41
      const actual: string = IsolationModel.composeProcessName('bundle41', 'k41');
      expect(actual).assertEqual('bundle41:k41');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0043
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0043
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle42, k42) returns bundle42:k42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle42:k42
      const actual: string = IsolationModel.composeProcessName('bundle42', 'k42');
      expect(actual).assertEqual('bundle42:k42');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0044
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0044
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle43, k43) returns bundle43:k43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle43:k43
      const actual: string = IsolationModel.composeProcessName('bundle43', 'k43');
      expect(actual).assertEqual('bundle43:k43');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0045
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0045
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle44, k44) returns bundle44:k44.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle44:k44
      const actual: string = IsolationModel.composeProcessName('bundle44', 'k44');
      expect(actual).assertEqual('bundle44:k44');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0046
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0046
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle45, k45) returns bundle45:k45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle45:k45
      const actual: string = IsolationModel.composeProcessName('bundle45', 'k45');
      expect(actual).assertEqual('bundle45:k45');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0047
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0047
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle46, k46) returns bundle46:k46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle46:k46
      const actual: string = IsolationModel.composeProcessName('bundle46', 'k46');
      expect(actual).assertEqual('bundle46:k46');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0048
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0048
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle47, k47) returns bundle47:k47.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle47:k47
      const actual: string = IsolationModel.composeProcessName('bundle47', 'k47');
      expect(actual).assertEqual('bundle47:k47');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0049
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0049
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle48, k48) returns bundle48:k48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle48:k48
      const actual: string = IsolationModel.composeProcessName('bundle48', 'k48');
      expect(actual).assertEqual('bundle48:k48');
      expect(actual.length).assertEqual(12);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_COMPOSE_PROCESS_NAME_EDGE_0050
     * @tc.name      DynamicIsolationProcess_composeProcessName_Edge_0050
     * @tc.desc      [PlainString+ShortString] Verify composeProcessName(bundle49, k49) returns bundle49:k49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_composeProcessName_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString+ShortString; expected: bundle49:k49
      const actual: string = IsolationModel.composeProcessName('bundle49', 'k49');
      expect(actual).assertEqual('bundle49:k49');
      expect(actual.length).assertEqual(12);
    });

  });
}
