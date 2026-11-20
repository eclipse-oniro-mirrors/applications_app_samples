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
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHarnessSnapshotValid0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testHarnessSnapshotValid0004', 'case begin', 'cross module validation');
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      const findings: Finding[] = CrossModuleValidator.validate(snapshot);
      TestLog.findings('testHarnessSnapshotValid0004', 'cross findings', findings);
      expect(findings.length).assertEqual(0);
      TestLog.text('testHarnessSnapshotValid0004', 'case end', 'cross module validation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_9004
     * @tc.name      testHarnessBundleNameUppercase0005
     * @tc.desc      An upper case bundle name is reported by the app validator.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHarnessBundleNameUppercase0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testHarnessBundleNameUppercase0005', 'case begin', 'bundle name case check');
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'com.example.MyApplication';
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testHarnessBundleNameUppercase0005', 'bundle name findings', findings);
      const hasCode: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_UPPERCASE');
      TestLog.flag('testHarnessBundleNameUppercase0005', 'has uppercase code', hasCode);
      expect(hasCode).assertTrue();
      TestLog.text('testHarnessBundleNameUppercase0005', 'case end', 'bundle name case check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_9005
     * @tc.name      testHarnessResourceReference0006
     * @tc.desc      Resource reference parsing extracts the kind and the name.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHarnessResourceReference0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testHarnessResourceReference0006', 'case begin', 'resource reference parsing');
      const kind: string = ResourceReference.kindOf('$string:app_name');
      const name: string = ResourceReference.nameOf('$string:app_name');
      TestLog.compare('testHarnessResourceReference0006', 'kind', 'string', kind);
      expect(kind).assertEqual('string');
      TestLog.text('testHarnessResourceReference0006', 'name', name);
      expect(name).assertEqual('app_name');
      const valid: boolean = ResourceReference.isValid('$string:app_name');
      TestLog.flag('testHarnessResourceReference0006', 'reference valid', valid);
      expect(valid).assertTrue();
      TestLog.text('testHarnessResourceReference0006', 'case end', 'resource reference parsing');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_9006
     * @tc.name      testHarnessSemverCompare0007
     * @tc.desc      Semantic version comparison orders major, minor and patch segments.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHarnessSemverCompare0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testHarnessSemverCompare0007', 'case begin', 'semver comparison');
      const result: number = SemverUtils.compare('1.2.3', '1.2.4');
      TestLog.number('testHarnessSemverCompare0007', 'compare result', result);
      expect(result).assertLess(0);
      const valid: boolean = SemverUtils.isValid('1.2.3');
      TestLog.flag('testHarnessSemverCompare0007', 'version valid', valid);
      expect(valid).assertTrue();
      const increased: string = SemverUtils.increasePatch('1.2.3');
      TestLog.text('testHarnessSemverCompare0007', 'increased', increased);
      expect(increased).assertEqual('1.2.4');
      TestLog.text('testHarnessSemverCompare0007', 'case end', 'semver comparison');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_9007
     * @tc.name      testHarnessNameUtils0008
     * @tc.desc      Name helpers classify PascalCase and lower snake identifiers.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHarnessNameUtils0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testHarnessNameUtils0008', 'case begin', 'name helper classification');
      TestLog.flag('testHarnessNameUtils0008', 'EntryAbility is PascalCase', NameUtils.isPascalCase('EntryAbility'));
      expect(NameUtils.isPascalCase('EntryAbility')).assertTrue();
      const lowerPascal: boolean = NameUtils.isPascalCase('entryAbility');
      TestLog.flag('testHarnessNameUtils0008', 'entryAbility is PascalCase', lowerPascal);
      expect(lowerPascal).assertFalse();
      const lowerSnake: boolean = NameUtils.isLowerSnake('main_pages');
      TestLog.flag('testHarnessNameUtils0008', 'main_pages is lower snake', lowerSnake);
      expect(lowerSnake).assertTrue();
      TestLog.text('testHarnessNameUtils0008', 'case end', 'name helper classification');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_9008
     * @tc.name      testHarnessConfigIndex0009
     * @tc.desc      Config index resolves modules and abilities of the sample bundle.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHarnessConfigIndex0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testHarnessConfigIndex0009', 'case begin', 'config index lookup');
      const index: ConfigIndex = new ConfigIndex(ConfigFactory.bundleSnapshot());
      const count: number = index.totalAbilityCount();
      TestLog.number('testHarnessConfigIndex0009', 'ability count', count);
      expect(count).assertEqual(2);
      TestLog.flag('testHarnessConfigIndex0009', 'has entry module', index.hasModule('entry'));
      expect(index.hasModule('entry')).assertTrue();
      TestLog.flag('testHarnessConfigIndex0009', 'has feature ability',
        index.hasAbility('feature', 'FeatureAbility'));
      expect(index.hasAbility('feature', 'FeatureAbility')).assertTrue();
      const missing: number = index.missingPreloadTargets().length;
      TestLog.number('testHarnessConfigIndex0009', 'missing preload targets', missing);
      expect(missing).assertEqual(0);
      TestLog.text('testHarnessConfigIndex0009', 'case end', 'config index lookup');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_9009
     * @tc.name      testHarnessFindingReport0010
     * @tc.desc      Finding reports aggregate severities and codes.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHarnessFindingReport0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testHarnessFindingReport0010', 'case begin', 'finding report aggregation');
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = '';
      appConfig.versionName = 'invalid';
      const report: FindingReport = new FindingReport(AppConfigValidator.validate(appConfig));
      const summary: string = report.summary();
      TestLog.text('testHarnessFindingReport0010', 'summary', summary);
      TestLog.flag('testHarnessFindingReport0010', 'has errors', report.hasErrors());
      expect(report.hasErrors()).assertTrue();
      TestLog.flag('testHarnessFindingReport0010', 'severity ordered', report.isSeverityOrdered());
      expect(report.isSeverityOrdered()).assertTrue();
      const hasSemverCode: boolean = report.codes().indexOf('APP_VERSION_NAME_NOT_SEMVER') >= 0;
      TestLog.flag('testHarnessFindingReport0010', 'has semver code', hasSemverCode);
      expect(hasSemverCode).assertTrue();
      TestLog.text('testHarnessFindingReport0010', 'case end', 'finding report aggregation');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_9010
     * @tc.name      testHarnessSerialization0011
     * @tc.desc      The sample bundle snapshot survives a JSON round trip.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHarnessSerialization0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testHarnessSerialization0011', 'case begin', 'json round trip');
      const snapshot: BundleSnapshot = ConfigFactory.bundleSnapshot();
      const length: number = ConfigSerializer.serializedLength(snapshot);
      TestLog.number('testHarnessSerialization0011', 'serialized length', length);
      expect(length > 0).assertTrue();
      const roundTrip: boolean = ConfigSerializer.roundTripEquals(snapshot);
      TestLog.flag('testHarnessSerialization0011', 'round trip equals', roundTrip);
      expect(roundTrip).assertTrue();
      const broken: BundleSnapshot | null = ConfigSerializer.deserialize('{invalid');
      TestLog.flag('testHarnessSerialization0011', 'broken text is null', broken === null);
      expect(broken).assertNull();
      TestLog.text('testHarnessSerialization0011', 'case end', 'json round trip');
    })
  })
}
