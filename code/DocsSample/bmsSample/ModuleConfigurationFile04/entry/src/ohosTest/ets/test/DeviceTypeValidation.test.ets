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
import type { ModuleConfig } from '../harness/ConfigModels';
import { ModuleConfigValidator } from '../harness/ModuleConfigValidator';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
import { ConfigFactory } from '../harness/ConfigFactory';
export default function DeviceTypeValidationTest(): void {
  describe('DeviceTypeValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1600
     * @tc.name      testModuleDeviceTypesTablet
     * @tc.desc      Checks that the a tablet only device list is accepted by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesTablet',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tablet'];
      TestLog.text('testModuleDeviceTypesTablet', 'case begin', 'deviceTypes input tablet');
      TestLog.step('testModuleDeviceTypesTablet', 'deviceTypes input tablet');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesTablet', 'deviceTypes', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesTablet', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesTablet', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesTablet', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesTablet', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesTablet', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesTablet', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesTablet', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesTablet', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesTablet', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesTablet', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesTablet', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesTablet', 'case end', 'deviceTypes input tablet');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1601
     * @tc.name      testModuleDeviceTypesPhone
     * @tc.desc      Checks that the a phone only device list is accepted by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesPhone',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['phone'];
      TestLog.text('testModuleDeviceTypesPhone', 'case begin', 'deviceTypes input phone');
      TestLog.step('testModuleDeviceTypesPhone', 'deviceTypes input phone');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesPhone', 'deviceTypes', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesPhone', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesPhone', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesPhone', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesPhone', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesPhone', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesPhone', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesPhone', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesPhone', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesPhone', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesPhone', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesPhone', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesPhone', 'case end', 'deviceTypes input phone');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1602
     * @tc.name      testModuleDeviceTypesTabletPhone
     * @tc.desc      Checks that the the sample device list is accepted by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesTabletPhone',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tablet', 'phone'];
      TestLog.text('testModuleDeviceTypesTabletPhone', 'case begin', 'deviceTypes input tabletphone');
      TestLog.step('testModuleDeviceTypesTabletPhone', 'deviceTypes input tabletphone');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesTabletPhone', 'deviceTypes', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesTabletPhone', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesTabletPhone', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesTabletPhone', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesTabletPhone', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesTabletPhone', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesTabletPhone', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesTabletPhone', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesTabletPhone', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesTabletPhone', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesTabletPhone', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesTabletPhone', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesTabletPhone', 'case end', 'deviceTypes input tabletphone');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1603
     * @tc.name      testModuleDeviceTypesDefault
     * @tc.desc      Checks that the the default device type is accepted by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesDefault',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['default'];
      TestLog.text('testModuleDeviceTypesDefault', 'case begin', 'deviceTypes input default');
      TestLog.step('testModuleDeviceTypesDefault', 'deviceTypes input default');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesDefault', 'deviceTypes', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesDefault', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesDefault', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesDefault', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesDefault', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesDefault', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesDefault', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesDefault', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesDefault', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesDefault', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesDefault', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesDefault', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesDefault', 'case end', 'deviceTypes input default');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1604
     * @tc.name      testModuleDeviceTypesTwoInOne
     * @tc.desc      Checks that the the 2in1 device type is accepted by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesTwoInOne',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['2in1'];
      TestLog.text('testModuleDeviceTypesTwoInOne', 'case begin', 'deviceTypes input twoinone');
      TestLog.step('testModuleDeviceTypesTwoInOne', 'deviceTypes input twoinone');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesTwoInOne', 'deviceTypes', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesTwoInOne', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesTwoInOne', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesTwoInOne', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesTwoInOne', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesTwoInOne', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesTwoInOne', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesTwoInOne', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesTwoInOne', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesTwoInOne', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesTwoInOne', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesTwoInOne', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesTwoInOne', 'case end', 'deviceTypes input twoinone');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1605
     * @tc.name      testModuleDeviceTypesTv
     * @tc.desc      Checks that the the tv device type is accepted by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesTv',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tv'];
      TestLog.text('testModuleDeviceTypesTv', 'case begin', 'deviceTypes input tv');
      TestLog.step('testModuleDeviceTypesTv', 'deviceTypes input tv');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesTv', 'deviceTypes', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesTv', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesTv', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesTv', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesTv', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesTv', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesTv', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesTv', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesTv', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesTv', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesTv', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesTv', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesTv', 'case end', 'deviceTypes input tv');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1606
     * @tc.name      testModuleDeviceTypesWearable
     * @tc.desc      Checks that the the wearable device type is accepted by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesWearable',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['wearable'];
      TestLog.text('testModuleDeviceTypesWearable', 'case begin', 'deviceTypes input wearable');
      TestLog.step('testModuleDeviceTypesWearable', 'deviceTypes input wearable');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesWearable', 'deviceTypes', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesWearable', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesWearable', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesWearable', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesWearable', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesWearable', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesWearable', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesWearable', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesWearable', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesWearable', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesWearable', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesWearable', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesWearable', 'case end', 'deviceTypes input wearable');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1607
     * @tc.name      testModuleDeviceTypesCar
     * @tc.desc      Checks that the the car device type is accepted by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesCar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['car'];
      TestLog.text('testModuleDeviceTypesCar', 'case begin', 'deviceTypes input car');
      TestLog.step('testModuleDeviceTypesCar', 'deviceTypes input car');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesCar', 'deviceTypes', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesCar', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesCar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesCar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesCar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesCar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesCar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesCar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesCar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesCar', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesCar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesCar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesCar', 'case end', 'deviceTypes input car');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1608
     * @tc.name      testModuleDeviceTypesFourKnown
     * @tc.desc      Checks that the four known device types is accepted by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesFourKnown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['phone', 'tablet', '2in1', 'tv'];
      TestLog.text('testModuleDeviceTypesFourKnown', 'case begin', 'deviceTypes input fourknown');
      TestLog.step('testModuleDeviceTypesFourKnown', 'deviceTypes input fourknown');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesFourKnown', 'deviceTypes', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesFourKnown', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesFourKnown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesFourKnown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesFourKnown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesFourKnown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesFourKnown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesFourKnown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesFourKnown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesFourKnown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesFourKnown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesFourKnown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesFourKnown', 'case end', 'deviceTypes input fourknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1609
     * @tc.name      testModuleDeviceTypesAllKnown
     * @tc.desc      Checks that the all known device types is accepted by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesAllKnown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['default', 'phone', 'tablet', '2in1', 'tv', 'wearable', 'car'];
      TestLog.text('testModuleDeviceTypesAllKnown', 'case begin', 'deviceTypes input allknown');
      TestLog.step('testModuleDeviceTypesAllKnown', 'deviceTypes input allknown');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesAllKnown', 'deviceTypes', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesAllKnown', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesAllKnown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesAllKnown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesAllKnown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesAllKnown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesAllKnown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesAllKnown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesAllKnown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesAllKnown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesAllKnown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesAllKnown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesAllKnown', 'case end', 'deviceTypes input allknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1610
     * @tc.name      testModuleDeviceTypesTrimmedPhone
     * @tc.desc      Checks that the a device type with leading whitespace is accepted by the deviceTypes
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesTrimmedPhone',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = [' phone'];
      TestLog.text('testModuleDeviceTypesTrimmedPhone', 'case begin', 'deviceTypes input trimmedphone');
      TestLog.step('testModuleDeviceTypesTrimmedPhone', 'deviceTypes input trimmedphone');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesTrimmedPhone', 'deviceTypes', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesTrimmedPhone', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesTrimmedPhone', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesTrimmedPhone', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesTrimmedPhone', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesTrimmedPhone', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesTrimmedPhone', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesTrimmedPhone', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesTrimmedPhone', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesTrimmedPhone', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesTrimmedPhone', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesTrimmedPhone', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesTrimmedPhone', 'case end', 'deviceTypes input trimmedphone');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1611
     * @tc.name      testModuleDeviceTypesTrailingTab
     * @tc.desc      Checks that the a device type with a trailing tab is accepted by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesTrailingTab',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tablet\t'];
      TestLog.text('testModuleDeviceTypesTrailingTab', 'case begin', 'deviceTypes input trailingtab');
      TestLog.step('testModuleDeviceTypesTrailingTab', 'deviceTypes input trailingtab');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesTrailingTab', 'deviceTypes', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesTrailingTab', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesTrailingTab', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesTrailingTab', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesTrailingTab', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesTrailingTab', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesTrailingTab', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesTrailingTab', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesTrailingTab', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesTrailingTab', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesTrailingTab', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesTrailingTab', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesTrailingTab', 'case end', 'deviceTypes input trailingtab');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1612
     * @tc.name      testModuleDeviceTypesMixedWhitespace
     * @tc.desc      Checks that the device types with surrounding whitespace is accepted by the deviceTypes
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesMixedWhitespace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tablet ', ' phone'];
      TestLog.text('testModuleDeviceTypesMixedWhitespace', 'case begin', 'deviceTypes input mixedwhitespace');
      TestLog.step('testModuleDeviceTypesMixedWhitespace', 'deviceTypes input mixedwhitespace');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesMixedWhitespace', 'deviceTypes', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesMixedWhitespace', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesMixedWhitespace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesMixedWhitespace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesMixedWhitespace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesMixedWhitespace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesMixedWhitespace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesMixedWhitespace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesMixedWhitespace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesMixedWhitespace', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesMixedWhitespace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesMixedWhitespace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesMixedWhitespace', 'case end', 'deviceTypes input mixedwhitespace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1613
     * @tc.name      testModuleDeviceTypesEmpty
     * @tc.desc      Checks that the an empty device type list is reported with MODULE_DEVICE_TYPES_EMPTY by
     * @tc.desc      the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = [];
      TestLog.text('testModuleDeviceTypesEmpty', 'case begin', 'deviceTypes input empty');
      TestLog.step('testModuleDeviceTypesEmpty', 'deviceTypes input empty');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesEmpty', 'deviceTypes', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPES_EMPTY');
      TestLog.flag('testModuleDeviceTypesEmpty', 'has code MODULE_DEVICE_TYPES_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesEmpty', 'case end', 'deviceTypes input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1614
     * @tc.name      testModuleDeviceTypesUnknownPhone
     * @tc.desc      Checks that the an upper case device type is reported with MODULE_DEVICE_TYPE_UNKNOWN by
     * @tc.desc      the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesUnknownPhone',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['Phone'];
      TestLog.text('testModuleDeviceTypesUnknownPhone', 'case begin', 'deviceTypes input unknownphone');
      TestLog.step('testModuleDeviceTypesUnknownPhone', 'deviceTypes input unknownphone');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesUnknownPhone', 'deviceTypes', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_UNKNOWN');
      TestLog.flag('testModuleDeviceTypesUnknownPhone', 'has code MODULE_DEVICE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesUnknownPhone', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesUnknownPhone', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesUnknownPhone', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesUnknownPhone', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesUnknownPhone', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesUnknownPhone', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesUnknownPhone', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesUnknownPhone', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesUnknownPhone', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesUnknownPhone', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesUnknownPhone', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesUnknownPhone', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesUnknownPhone', 'case end', 'deviceTypes input unknownphone');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1615
     * @tc.name      testModuleDeviceTypesUnknownUpper
     * @tc.desc      Checks that the an all upper case device type is reported with
     * @tc.desc      MODULE_DEVICE_TYPE_UNKNOWN by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesUnknownUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['TABLET'];
      TestLog.text('testModuleDeviceTypesUnknownUpper', 'case begin', 'deviceTypes input unknownupper');
      TestLog.step('testModuleDeviceTypesUnknownUpper', 'deviceTypes input unknownupper');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesUnknownUpper', 'deviceTypes', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_UNKNOWN');
      TestLog.flag('testModuleDeviceTypesUnknownUpper', 'has code MODULE_DEVICE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesUnknownUpper', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesUnknownUpper', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesUnknownUpper', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesUnknownUpper', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesUnknownUpper', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesUnknownUpper', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesUnknownUpper', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesUnknownUpper', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesUnknownUpper', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesUnknownUpper', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesUnknownUpper', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesUnknownUpper', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesUnknownUpper', 'case end', 'deviceTypes input unknownupper');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1616
     * @tc.name      testModuleDeviceTypesUnknownSuffix
     * @tc.desc      Checks that the an unknown device type is reported with MODULE_DEVICE_TYPE_UNKNOWN by
     * @tc.desc      the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesUnknownSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tablet2'];
      TestLog.text('testModuleDeviceTypesUnknownSuffix', 'case begin', 'deviceTypes input unknownsuffix');
      TestLog.step('testModuleDeviceTypesUnknownSuffix', 'deviceTypes input unknownsuffix');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesUnknownSuffix', 'deviceTypes', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_UNKNOWN');
      TestLog.flag('testModuleDeviceTypesUnknownSuffix', 'has code MODULE_DEVICE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesUnknownSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesUnknownSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesUnknownSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesUnknownSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesUnknownSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesUnknownSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesUnknownSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesUnknownSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesUnknownSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesUnknownSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesUnknownSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesUnknownSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesUnknownSuffix', 'case end', 'deviceTypes input unknownsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1617
     * @tc.name      testModuleDeviceTypesUnknownTvCase
     * @tc.desc      Checks that the an upper case tv device type is reported with MODULE_DEVICE_TYPE_UNKNOWN
     * @tc.desc      by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesUnknownTvCase',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['TV'];
      TestLog.text('testModuleDeviceTypesUnknownTvCase', 'case begin', 'deviceTypes input unknowntvcase');
      TestLog.step('testModuleDeviceTypesUnknownTvCase', 'deviceTypes input unknowntvcase');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesUnknownTvCase', 'deviceTypes', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_UNKNOWN');
      TestLog.flag('testModuleDeviceTypesUnknownTvCase', 'has code MODULE_DEVICE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesUnknownTvCase', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesUnknownTvCase', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesUnknownTvCase', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);