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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPathSideEffects]';

export default function apiContractTest(): void {
  describe('ApiContractTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_API_0100
     * @tc.name      testServiceInitIsFunction0001
     * @tc.desc      The plain ServiceManager exposes init as a function member
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testServiceInitIsFunction0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testServiceInitIsFunction0001 begin');
      expect(typeof pathManager.init).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testServiceInitIsFunction0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_API_0200
     * @tc.name      testServicePrintIsFunction0002
     * @tc.desc      The plain ServiceManager exposes print as a function member
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testServicePrintIsFunction0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testServicePrintIsFunction0002 begin');
      expect(typeof pathManager.print).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testServicePrintIsFunction0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_API_0300
     * @tc.name      testOpInitIsFunction0003
     * @tc.desc      The OpServiceManager exposes init as a function member
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testOpInitIsFunction0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpInitIsFunction0003 begin');
      expect(typeof opManager.init).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpInitIsFunction0003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_API_0400
     * @tc.name      testOpPrintIsFunction0004
     * @tc.desc      The OpServiceManager exposes print as a function member
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testOpPrintIsFunction0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpPrintIsFunction0004 begin');
      expect(typeof opManager.print).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpPrintIsFunction0004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_API_0500
     * @tc.name      testInitTakesNoArguments0005
     * @tc.desc      init() is declared without parameters for both module variants
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testInitTakesNoArguments0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitTakesNoArguments0005 begin');
      expect(pathManager.init.length).assertEqual(0);
      expect(opManager.init.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitTakesNoArguments0005 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_API_0600
     * @tc.name      testPrintTakesNoArguments0006
     * @tc.desc      print() is declared without parameters for both module variants
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrintTakesNoArguments0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrintTakesNoArguments0006 begin');
      expect(pathManager.print.length).assertEqual(0);
      expect(opManager.print.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrintTakesNoArguments0006 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_API_0700
     * @tc.name      testSameModuleSharesMethodIdentity0007
     * @tc.desc      Two imports of the same module share the exact same method references
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testSameModuleSharesMethodIdentity0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSameModuleSharesMethodIdentity0007 begin');
      expect(pathManager.init === pathManagerAgain.init).assertTrue();
      expect(pathManager.print === pathManagerAgain.print).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSameModuleSharesMethodIdentity0007 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_API_0800
     * @tc.name      testDifferentModulesHaveDistinctMethods0008
     * @tc.desc      ServiceManager and OpServiceManager declare different classes, so their methods differ
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDifferentModulesHaveDistinctMethods0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDifferentModulesHaveDistinctMethods0008 begin');
      expect(pathManager.init === opManager.init).assertFalse();
      expect(pathManager.print === opManager.print).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDifferentModulesHaveDistinctMethods0008 end');
    })

  })
}
