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

/** Logic checks for isModuleProcessPath (50 cases). */
export default function isModuleProcessPathEdgeTest(): void {
  describe('IsModuleProcessPathEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsModuleProcessPathEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsModuleProcessPathEdgeTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0001
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0001
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p0.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p0.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0002
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0002
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p1.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p1.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0003
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0003
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p2.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p2.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0004
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0004
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p3.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p3.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0005
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0005
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p4.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p4.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0006
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0006
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p5.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p5.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0007
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0007
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p6.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p6.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0008
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0008
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p7.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p7.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0009
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0009
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p8.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p8.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0010
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0010
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p9.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p9.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0011
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0011
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p10.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p10.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0012
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0012
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p11.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p11.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0013
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0013
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p12.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p12.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0014
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0014
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p13.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p13.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0015
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0015
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p14.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p14.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0016
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0016
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p15.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p15.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0017
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0017
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p16.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p16.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0018
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0018
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p17.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p17.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0019
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0019
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p18.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p18.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0020
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0020
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p19.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p19.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0021
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0021
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p20.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p20.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0022
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0022
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p21.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p21.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0023
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0023
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p22.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p22.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0024
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0024
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p23.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p23.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0025
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0025
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p24.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p24.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0026
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0026
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p25.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p25.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0027
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0027
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p26.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p26.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0028
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0028
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p27.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p27.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0029
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0029
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p28.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p28.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0030
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0030
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p29.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p29.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0031
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0031
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p30.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p30.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0032
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0032
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p31.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p31.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0033
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0033
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p32.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p32.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0034
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0034
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p33.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p33.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0035
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0035
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p34.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p34.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0036
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0036
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p35.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p35.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0037
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0037
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p36.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p36.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0038
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0038
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p37.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p37.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0039
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0039
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p38.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p38.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0040
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0040
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p39.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p39.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0041
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0041
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p40.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p40.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0042
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0042
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p41.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p41.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0043
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0043
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p42.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p42.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0044
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0044
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p43.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p43.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0045
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0045
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p44.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p44.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0046
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0046
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p45.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p45.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0047
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0047
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p46.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p46.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0048
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0048
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p47.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p47.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0049
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0049
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p48.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p48.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_EDGE_0050
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Edge_0050
     * @tc.desc      [DelimitedString|expected=false] Verify isModuleProcessPath(./ets/process/p49.ets) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isModuleProcessPath('./ets/process/p49.ets');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

  });
}
