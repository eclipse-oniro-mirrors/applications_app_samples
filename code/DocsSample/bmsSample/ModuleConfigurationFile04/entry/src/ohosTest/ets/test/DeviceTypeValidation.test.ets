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
      TestLog.text('testModuleDeviceTypesUnknownTvCase', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesUnknownTvCase', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesUnknownTvCase', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesUnknownTvCase', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesUnknownTvCase', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesUnknownTvCase', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesUnknownTvCase', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesUnknownTvCase', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesUnknownTvCase', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesUnknownTvCase', 'case end', 'deviceTypes input unknowntvcase');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1618
     * @tc.name      testModuleDeviceTypesDuplicate
     * @tc.desc      Checks that the a duplicated device type is reported with MODULE_DEVICE_TYPE_DUPLICATE
     * @tc.desc      by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesDuplicate',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tablet', 'tablet'];
      TestLog.text('testModuleDeviceTypesDuplicate', 'case begin', 'deviceTypes input duplicate');
      TestLog.step('testModuleDeviceTypesDuplicate', 'deviceTypes input duplicate');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesDuplicate', 'deviceTypes', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_DUPLICATE');
      TestLog.flag('testModuleDeviceTypesDuplicate', 'has code MODULE_DEVICE_TYPE_DUPLICATE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesDuplicate', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesDuplicate', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesDuplicate', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesDuplicate', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesDuplicate', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesDuplicate', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesDuplicate', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesDuplicate', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesDuplicate', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesDuplicate', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesDuplicate', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesDuplicate', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesDuplicate', 'case end', 'deviceTypes input duplicate');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1619
     * @tc.name      testModuleDeviceTypesDuplicateDefault
     * @tc.desc      Checks that the a duplicated default device type is reported with
     * @tc.desc      MODULE_DEVICE_TYPE_DUPLICATE by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesDuplicateDefault',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['default', 'default'];
      TestLog.text('testModuleDeviceTypesDuplicateDefault', 'case begin', 'deviceTypes input duplicatedefault');
      TestLog.step('testModuleDeviceTypesDuplicateDefault', 'deviceTypes input duplicatedefault');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesDuplicateDefault', 'deviceTypes', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_DUPLICATE');
      TestLog.flag('testModuleDeviceTypesDuplicateDefault', 'has code MODULE_DEVICE_TYPE_DUPLICATE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesDuplicateDefault', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesDuplicateDefault', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesDuplicateDefault', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesDuplicateDefault', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesDuplicateDefault', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesDuplicateDefault', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesDuplicateDefault', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesDuplicateDefault', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesDuplicateDefault', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesDuplicateDefault', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesDuplicateDefault', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesDuplicateDefault', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesDuplicateDefault', 'case end', 'deviceTypes input duplicatedefault');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1620
     * @tc.name      testModuleDeviceTypesTripleDuplicate
     * @tc.desc      Checks that the a device type declared twice inside a longer list is reported with
     * @tc.desc      MODULE_DEVICE_TYPE_DUPLICATE by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesTripleDuplicate',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['phone', 'tablet', 'phone'];
      TestLog.text('testModuleDeviceTypesTripleDuplicate', 'case begin', 'deviceTypes input tripleduplicate');
      TestLog.step('testModuleDeviceTypesTripleDuplicate', 'deviceTypes input tripleduplicate');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesTripleDuplicate', 'deviceTypes', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_DUPLICATE');
      TestLog.flag('testModuleDeviceTypesTripleDuplicate', 'has code MODULE_DEVICE_TYPE_DUPLICATE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesTripleDuplicate', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesTripleDuplicate', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesTripleDuplicate', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesTripleDuplicate', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesTripleDuplicate', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesTripleDuplicate', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesTripleDuplicate', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesTripleDuplicate', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesTripleDuplicate', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesTripleDuplicate', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesTripleDuplicate', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesTripleDuplicate', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesTripleDuplicate', 'case end', 'deviceTypes input tripleduplicate');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1621
     * @tc.name      testModuleDeviceTypesBlankEntry
     * @tc.desc      Checks that the a blank device type entry is reported with MODULE_DEVICE_TYPE_BLANK by
     * @tc.desc      the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesBlankEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['tablet', ''];
      TestLog.text('testModuleDeviceTypesBlankEntry', 'case begin', 'deviceTypes input blankentry');
      TestLog.step('testModuleDeviceTypesBlankEntry', 'deviceTypes input blankentry');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesBlankEntry', 'deviceTypes', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_BLANK');
      TestLog.flag('testModuleDeviceTypesBlankEntry', 'has code MODULE_DEVICE_TYPE_BLANK', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesBlankEntry', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesBlankEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesBlankEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesBlankEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesBlankEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesBlankEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesBlankEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesBlankEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesBlankEntry', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesBlankEntry', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesBlankEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesBlankEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesBlankEntry', 'case end', 'deviceTypes input blankentry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1622
     * @tc.name      testModuleDeviceTypesBlankEntries
     * @tc.desc      Checks that the a device list with blank entries only is reported with
     * @tc.desc      MODULE_DEVICE_TYPE_BLANK by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesBlankEntries',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['', '  '];
      TestLog.text('testModuleDeviceTypesBlankEntries', 'case begin', 'deviceTypes input blankentries');
      TestLog.step('testModuleDeviceTypesBlankEntries', 'deviceTypes input blankentries');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesBlankEntries', 'deviceTypes', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_BLANK');
      TestLog.flag('testModuleDeviceTypesBlankEntries', 'has code MODULE_DEVICE_TYPE_BLANK', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesBlankEntries', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesBlankEntries', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesBlankEntries', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesBlankEntries', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesBlankEntries', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesBlankEntries', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesBlankEntries', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesBlankEntries', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesBlankEntries', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesBlankEntries', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesBlankEntries', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesBlankEntries', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesBlankEntries', 'case end', 'deviceTypes input blankentries');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1623
     * @tc.name      testModuleDeviceTypesTooMany
     * @tc.desc      Checks that the more device types than the supported maximum is reported with
     * @tc.desc      MODULE_DEVICE_TYPES_TOO_MANY by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesTooMany',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['phone', 'tablet', '2in1', 'tv', 'wearable', 'car', 'default', 'phone', 'tablet'];
      TestLog.text('testModuleDeviceTypesTooMany', 'case begin', 'deviceTypes input toomany');
      TestLog.step('testModuleDeviceTypesTooMany', 'deviceTypes input toomany');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesTooMany', 'deviceTypes', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPES_TOO_MANY');
      TestLog.flag('testModuleDeviceTypesTooMany', 'has code MODULE_DEVICE_TYPES_TOO_MANY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesTooMany', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesTooMany', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesTooMany', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesTooMany', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesTooMany', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesTooMany', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesTooMany', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesTooMany', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesTooMany', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesTooMany', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesTooMany', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesTooMany', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesTooMany', 'case end', 'deviceTypes input toomany');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1624
     * @tc.name      testModuleDeviceTypesEightWithDuplicate
     * @tc.desc      Checks that the eight device types including a duplicate is reported with
     * @tc.desc      MODULE_DEVICE_TYPE_DUPLICATE by the deviceTypes rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesEightWithDuplicate',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['phone', 'tablet', '2in1', 'tv', 'wearable', 'car', 'default', 'car'];
      TestLog.text('testModuleDeviceTypesEightWithDuplicate', 'case begin', 'deviceTypes input eightwithduplicate');
      TestLog.step('testModuleDeviceTypesEightWithDuplicate', 'deviceTypes input eightwithduplicate');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesEightWithDuplicate', 'deviceTypes', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_DUPLICATE');
      TestLog.flag('testModuleDeviceTypesEightWithDuplicate', 'has code MODULE_DEVICE_TYPE_DUPLICATE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesEightWithDuplicate', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesEightWithDuplicate', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesEightWithDuplicate', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesEightWithDuplicate', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesEightWithDuplicate', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesEightWithDuplicate', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesEightWithDuplicate', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesEightWithDuplicate', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesEightWithDuplicate', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesEightWithDuplicate', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesEightWithDuplicate', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesEightWithDuplicate', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesEightWithDuplicate', 'case end', 'deviceTypes input eightwithduplicate');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1700
     * @tc.name      testModuleDeviceTypesPreserveDeclarationOrder
     * @tc.desc      Checks that the device type list keeps its declaration order.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesPreserveDeclarationOrder',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['phone', 'tablet', '2in1'];
      TestLog.text('testModuleDeviceTypesPreserveDeclarationOrder', 'case begin', 'device type order check');
      TestLog.step('testModuleDeviceTypesPreserveDeclarationOrder', 'device type order check');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesPreserveDeclarationOrder', 'device findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesPreserveDeclarationOrder', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesPreserveDeclarationOrder', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesPreserveDeclarationOrder', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesPreserveDeclarationOrder', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesPreserveDeclarationOrder', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesPreserveDeclarationOrder', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesPreserveDeclarationOrder', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesPreserveDeclarationOrder', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesPreserveDeclarationOrder', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesPreserveDeclarationOrder', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesPreserveDeclarationOrder', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesPreserveDeclarationOrder', 'case end', 'device type order check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1701
     * @tc.name      testModuleDeviceTypesDuplicateAndUnknown
     * @tc.desc      Checks that duplicate and unknown device types are reported together.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesDuplicateAndUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['phone', 'Phone', 'phone'];
      TestLog.text('testModuleDeviceTypesDuplicateAndUnknown', 'case begin', 'device type duplicate and unknown check');
      TestLog.step('testModuleDeviceTypesDuplicateAndUnknown', 'device type duplicate and unknown check');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesDuplicateAndUnknown', 'device findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_UNKNOWN');
      TestLog.flag('testModuleDeviceTypesDuplicateAndUnknown', 'has code MODULE_DEVICE_TYPE_UNKNOWN', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_DUPLICATE');
      TestLog.flag('testModuleDeviceTypesDuplicateAndUnknown', 'has code MODULE_DEVICE_TYPE_DUPLICATE', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesDuplicateAndUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesDuplicateAndUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesDuplicateAndUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesDuplicateAndUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesDuplicateAndUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesDuplicateAndUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesDuplicateAndUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesDuplicateAndUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesDuplicateAndUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesDuplicateAndUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesDuplicateAndUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesDuplicateAndUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesDuplicateAndUnknown', 'case end', 'device type duplicate and unknown check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1702
     * @tc.name      testModuleDeviceTypesBlankAndDuplicate
     * @tc.desc      Checks that blank and duplicated device types are reported together.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesBlankAndDuplicate',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['phone', '', 'phone'];
      TestLog.text('testModuleDeviceTypesBlankAndDuplicate', 'case begin', 'device type blank and duplicate check');
      TestLog.step('testModuleDeviceTypesBlankAndDuplicate', 'device type blank and duplicate check');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesBlankAndDuplicate', 'device findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_BLANK');
      TestLog.flag('testModuleDeviceTypesBlankAndDuplicate', 'has code MODULE_DEVICE_TYPE_BLANK', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_DUPLICATE');
      TestLog.flag('testModuleDeviceTypesBlankAndDuplicate', 'has code MODULE_DEVICE_TYPE_DUPLICATE', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesBlankAndDuplicate', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesBlankAndDuplicate', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesBlankAndDuplicate', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesBlankAndDuplicate', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesBlankAndDuplicate', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesBlankAndDuplicate', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesBlankAndDuplicate', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesBlankAndDuplicate', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesBlankAndDuplicate', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesBlankAndDuplicate', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesBlankAndDuplicate', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesBlankAndDuplicate', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesBlankAndDuplicate', 'case end', 'device type blank and duplicate check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1703
     * @tc.name      testModuleDeviceTypesHasDeviceTypeHelper
     * @tc.desc      Checks that the declared device type lookup finds declared and missing types.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesHasDeviceTypeHelper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      TestLog.text('testModuleDeviceTypesHasDeviceTypeHelper', 'case begin', 'device type helper check');
      TestLog.step('testModuleDeviceTypesHasDeviceTypeHelper', 'device type helper check');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesHasDeviceTypeHelper', 'device findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesHasDeviceTypeHelper', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesHasDeviceTypeHelper', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesHasDeviceTypeHelper', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesHasDeviceTypeHelper', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesHasDeviceTypeHelper', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesHasDeviceTypeHelper', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesHasDeviceTypeHelper', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesHasDeviceTypeHelper', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesHasDeviceTypeHelper', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesHasDeviceTypeHelper', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesHasDeviceTypeHelper', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesHasDeviceTypeHelper', 'case end', 'device type helper check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1704
     * @tc.name      testModuleDeviceTypesFeatureModule
     * @tc.desc      Checks that the feature module declares the sample device types without findings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesFeatureModule',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.featureModule();
      TestLog.text('testModuleDeviceTypesFeatureModule', 'case begin', 'feature device type check');
      TestLog.step('testModuleDeviceTypesFeatureModule', 'feature device type check');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesFeatureModule', 'device findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDeviceTypesFeatureModule', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesFeatureModule', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesFeatureModule', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesFeatureModule', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesFeatureModule', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesFeatureModule', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesFeatureModule', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesFeatureModule', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesFeatureModule', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesFeatureModule', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesFeatureModule', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesFeatureModule', 'case end', 'feature device type check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1705
     * @tc.name      testModuleDeviceTypesSingleUnknown
     * @tc.desc      Checks that a single unknown device type is reported with its index path.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDeviceTypesSingleUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['watch'];
      TestLog.text('testModuleDeviceTypesSingleUnknown', 'case begin', 'single unknown device type check');
      TestLog.step('testModuleDeviceTypesSingleUnknown', 'single unknown device type check');
      const findings: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.findings('testModuleDeviceTypesSingleUnknown', 'device findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_UNKNOWN');
      TestLog.flag('testModuleDeviceTypesSingleUnknown', 'has code MODULE_DEVICE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDeviceTypesSingleUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDeviceTypesSingleUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDeviceTypesSingleUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDeviceTypesSingleUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDeviceTypesSingleUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDeviceTypesSingleUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDeviceTypesSingleUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDeviceTypesSingleUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDeviceTypesSingleUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDeviceTypesSingleUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDeviceTypes(moduleConfig);
      TestLog.number('testModuleDeviceTypesSingleUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDeviceTypesSingleUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDeviceTypesSingleUnknown', 'case end', 'single unknown device type check');
    })

  })
}
