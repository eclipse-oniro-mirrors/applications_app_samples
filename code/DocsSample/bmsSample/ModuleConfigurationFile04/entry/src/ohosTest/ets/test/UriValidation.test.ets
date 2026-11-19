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
import type { UriConfig } from '../harness/ConfigModels';
import { ModuleConfigValidator } from '../harness/ModuleConfigValidator';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
import { ConfigFactory } from '../harness/ConfigFactory';
export default function UriValidationTest(): void {
  describe('UriValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3200
     * @tc.name      testUriSchemeHttps
     * @tc.desc      Checks that the https value is accepted by the uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeHttps',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = 'https';
      TestLog.text('testUriSchemeHttps', 'case begin', 'uri.scheme input https');
      TestLog.step('testUriSchemeHttps', 'uri.scheme input https');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeHttps', 'uri.scheme', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriSchemeHttps', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeHttps', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeHttps', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeHttps', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeHttps', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeHttps', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeHttps', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeHttps', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeHttps', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeHttps', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeHttps', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeHttps', 'case end', 'uri.scheme input https');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3201
     * @tc.name      testUriSchemeHttp
     * @tc.desc      Checks that the http value is accepted by the uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST