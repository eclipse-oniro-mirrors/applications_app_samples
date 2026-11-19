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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { AppConfig, BundleSnapshot, ModuleConfig } from '../harness/ConfigModels';
import { ConfigFactory } from '../harness/ConfigFactory';
import { AppConfigValidator } from '../harness/AppConfigValidator';
import { ModuleConfigValidator } from '../harness/ModuleConfigValidator';
import { CrossModuleValidator } from '../harness/CrossModuleValidator';
import { Finding, FindingUtils } from '../harness/FindingTypes';
import { ResourceReference } from '../harness/ResourceReference';
import { SemverUtils } from '../harness/SemverUtils';
import { NameUtils } from '../harness/NameUtils';
import { ConfigIndex } from '../harness/ConfigIndex';
import { FindingReport } from '../harness/FindingReport';
import { ConfigSerializer } from '../harness/ConfigSerializer';
import { TestLog } from '../harness/TestLog';

export default function HarnessSmokeTest(): void {
  describe('HarnessSmokeTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_9000
     * @tc.name      testHarnessAppConfigValid0001
     * @tc.desc      The sample app configuration passes app level validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHarnessAppConfigValid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testHarnessAppConfigValid0001', 'case begin', 'app config validation');
      const appConfig: AppConfig = ConfigFactory.appConfig();
      const findings: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.findings('testHarnessAppConfigValid0001', 'app findings', findings);
      expect(findings.length).assertEqual(0);
      const hasError: boolean = FindingUtils.hasError(findings);
      TestLog.flag('testHarnessAppConfigValid0001', 'has error', hasError);
      expect(hasError).assertFalse();
      TestLog.text('testHarnessAppConfigValid0001', 'case end', 'app config validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_9001
     * @tc.name      testHarnessEntryModuleValid0002
     * @tc.desc      The sample entry module passes module level validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHarnessEntryModuleValid0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testHarnessEntryModuleValid0002', 'case begin', 'entry module validation');
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testHarnessEntryModuleValid0002', 'entry findings', findings);
      expect(findings.length).assertEqual(0);
      TestLog.text('testHarnessEntryModuleValid0002', 'case end', 'entry module validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_9002
     * @tc.name      testHarnessFeatureModuleValid0003
     * @tc.desc      The sample feature module passes module level validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHarnessFeatureModuleValid0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testHarnessFeatureModuleValid0003', 'case begin', 'feature module validation');
      const moduleConfig: ModuleConfig = ConfigFactory.featureModule();
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testHarnessFeatureModuleValid0003', 'feature findings', findings);
      expect(findings.length).assertEqual(0);
      TestLog.text('testHarnessFeatureModuleValid0003', 'case end', 'feature module validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_9003
     * @tc.name      testHarnessSnapshotValid0004
     * @tc.desc      The sample bundle snapshot passes cross module validation.
     * @tc.type      FUNCTION