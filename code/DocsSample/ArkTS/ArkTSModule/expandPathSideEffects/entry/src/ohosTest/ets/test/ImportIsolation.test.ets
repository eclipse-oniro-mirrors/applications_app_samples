/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { serviceManager as pathManager } from 'servicemanagerhar/src/main/ets/ServiceManager';
import { serviceManager as pathManagerAgain } from 'servicemanagerhar/src/main/ets/ServiceManager';
import { serviceManager as opManager } from 'servicemanagerhar/src/main/ets/OpServiceManager';
import { serviceManager as opManagerAgain } from 'servicemanagerhar/src/main/ets/OpServiceManager';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPathSideEffects]';
const PATH_INITED_AT_LOAD: boolean = pathManager.inited;
const OP_INITED_AT_LOAD: boolean = opManager.inited;

export default function importIsolationTest(): void {
  describe('ImportIsolationTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_ISO_0100
     * @tc.name      testLoadSnapshotsDiffer0001
     * @tc.desc      Plain ServiceManager loads uninitialized while OpServiceManager loads initialized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoadSnapshotsDiffer0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoadSnapshotsDiffer0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s',
        'path=' + String(PATH_INITED_AT_LOAD) + ', op=' + String(OP_INITED_AT_LOAD));
      expect(PATH_INITED_AT_LOAD).assertFalse();
      expect(OP_INITED_AT_LOAD).assertTrue();
      expect(PATH_INITED_AT_LOAD).assertEqual(!OP_INITED_AT_LOAD);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoadSnapshotsDiffer0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_ISO_0200
     * @tc.name      testModulesExportDistinctInstances0002
     * @tc.desc      ServiceManager and OpServiceManager each own a separate singleton instance
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testModulesExportDistinctInstances0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModulesExportDistinctInstances0002 begin');
      expect(pathManager === opManager).assertFalse();
      expect(pathManager !== opManager).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModulesExportDistinctInstances0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_ISO_0300
     * @tc.name      testSamePathSpecifierIsCached0003
     * @tc.desc      Importing the same path specifier twice returns the same cached instance
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testSamePathSpecifierIsCached0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamePathSpecifierIsCached0003 begin');
      expect(pathManager === pathManagerAgain).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSamePathSpecifierIsCached0003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_ISO_0400
     * @tc.name      testSameOpSpecifierIsCached0004
     * @tc.desc      Importing the same OpServiceManager specifier twice returns the same cached instance
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testSameOpSpecifierIsCached0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSameOpSpecifierIsCached0004 begin');
      expect(opManager === opManagerAgain).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSameOpSpecifierIsCached0004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_ISO_0500
     * @tc.name      testBothModulesExposeSameApi0005
     * @tc.desc      Both singleton variants expose the same init/print/inited surface
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testBothModulesExposeSameApi0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBothModulesExposeSameApi0005 begin');
      expect(typeof pathManager.init).assertEqual('function');
      expect(typeof opManager.init).assertEqual('function');
      expect(typeof pathManager.print).assertEqual('function');
      expect(typeof opManager.print).assertEqual('function');
      expect(typeof pathManager.inited).assertEqual('boolean');
      expect(typeof opManager.inited).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBothModulesExposeSameApi0005 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_ISO_0600
     * @tc.name      testSnapshotTypesAreBoolean0006
     * @tc.desc      Captured load states are real booleans, not truthy placeholders
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testSnapshotTypesAreBoolean0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotTypesAreBoolean0006 begin');
      expect(typeof PATH_INITED_AT_LOAD).assertEqual('boolean');
      expect(typeof OP_INITED_AT_LOAD).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotTypesAreBoolean0006 end');
    })

  })
}
