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
import { ChildProcessModel } from '../Shared/ChildProcessFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_arktschildprocess]';
const BUNDLE: string = 'ArkTsChildProcess_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isArkTsProcessPath (50 cases). */
export default function isArkTsProcessPathStressTest(): void {
  describe('IsArkTsProcessPathStressTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsArkTsProcessPathStressTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsArkTsProcessPathStressTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0001
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0001
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p0.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p0.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0002
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0002
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p1.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p1.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0003
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0003
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p2.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p2.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0004
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0004
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p3.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p3.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0005
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0005
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p4.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p4.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0006
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0006
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p5.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p5.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0007
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0007
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p6.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p6.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0008
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0008
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p7.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p7.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0009
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0009
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p8.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p8.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0010
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0010
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p9.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p9.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0011
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0011
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p10.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p10.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0012
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0012
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p11.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p11.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0013
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0013
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p12.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p12.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0014
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0014
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p13.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p13.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0015
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0015
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p14.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p14.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0016
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0016
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p15.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p15.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0017
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0017
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p16.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p16.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0018
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0018
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p17.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p17.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0019
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0019
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p18.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p18.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0020
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0020
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p19.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p19.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0021
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0021
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p20.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p20.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0022
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0022
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p21.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p21.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0023
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0023
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p22.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p22.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0024
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0024
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p23.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p23.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0025
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0025
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p24.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p24.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0026
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0026
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p25.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p25.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0027
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0027
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p26.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p26.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0028
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0028
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p27.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p27.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0029
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0029
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p28.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p28.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0030
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0030
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p29.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p29.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0031
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0031
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p30.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p30.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0032
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0032
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p31.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p31.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0033
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0033
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p32.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p32.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0034
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0034
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p33.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p33.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0035
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0035
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p34.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p34.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0036
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0036
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p35.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p35.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0037
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0037
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p36.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p36.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0038
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0038
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p37.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p37.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0039
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0039
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p38.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p38.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0040
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0040
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p39.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p39.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0041
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0041
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p40.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p40.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0042
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0042
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p41.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p41.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0043
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0043
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p42.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p42.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0044
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0044
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p43.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p43.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0045
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0045
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p44.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p44.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0046
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0046
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p45.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p45.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0047
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0047
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p46.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p46.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0048
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0048
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p47.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p47.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0049
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0049
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p48.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p48.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_ARK_TS_PROCESS_PATH_STRESS_0050
     * @tc.name      ArkTsChildProcess_isArkTsProcessPath_Stress_0050
     * @tc.desc      [DelimitedString|expected=false] Verify isArkTsProcessPath(./ets/processx/p49.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isArkTsProcessPath_Stress_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isArkTsProcessPath('./ets/processx/p49.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

  });
}
