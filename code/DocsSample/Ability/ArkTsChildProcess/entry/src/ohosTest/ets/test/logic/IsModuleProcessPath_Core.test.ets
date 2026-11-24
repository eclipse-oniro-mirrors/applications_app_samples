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
export default function isModuleProcessPathCoreTest(): void {
  describe('IsModuleProcessPathCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsModuleProcessPathCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsModuleProcessPathCoreTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0001
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0001
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p0.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p0.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0002
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0002
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p1.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p1.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0003
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0003
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p2.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p2.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0004
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0004
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p3.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p3.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0005
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0005
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p4.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p4.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0006
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0006
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p5.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p5.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0007
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0007
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p6.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p6.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0008
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0008
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p7.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p7.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0009
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0009
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p8.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p8.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0010
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0010
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p9.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p9.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0011
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0011
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p10.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p10.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0012
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0012
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p11.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p11.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0013
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0013
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p12.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p12.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0014
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0014
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p13.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p13.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0015
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0015
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p14.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p14.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0016
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0016
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p15.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p15.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0017
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0017
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p16.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p16.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0018
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0018
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p17.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p17.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0019
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0019
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p18.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p18.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0020
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0020
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p19.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p19.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0021
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0021
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p20.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p20.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0022
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0022
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p21.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p21.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0023
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0023
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p22.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p22.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0024
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0024
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p23.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p23.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0025
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0025
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p24.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p24.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0026
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0026
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p25.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p25.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0027
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0027
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p26.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p26.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0028
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0028
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p27.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p27.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0029
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0029
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p28.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p28.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0030
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0030
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p29.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p29.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0031
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0031
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p30.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p30.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0032
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0032
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p31.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p31.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0033
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0033
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p32.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p32.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0034
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0034
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p33.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p33.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0035
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0035
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p34.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p34.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0036
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0036
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p35.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p35.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0037
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0037
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p36.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p36.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0038
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0038
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p37.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p37.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0039
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0039
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p38.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p38.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0040
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0040
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p39.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p39.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0041
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0041
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p40.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p40.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0042
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0042
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p41.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p41.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0043
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0043
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p42.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p42.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0044
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0044
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p43.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p43.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0045
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0045
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p44.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p44.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0046
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0046
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p45.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p45.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0047
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0047
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p46.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p46.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0048
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0048
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p47.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p47.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0049
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0049
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p48.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p48.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_MODULE_PROCESS_PATH_CORE_0050
     * @tc.name      ArkTsChildProcess_isModuleProcessPath_Core_0050
     * @tc.desc      [DelimitedString|expected=true] Verify isModuleProcessPath(module1/ets/process/p49.ets) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isModuleProcessPath_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isModuleProcessPath('module1/ets/process/p49.ets');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
