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
import { ResourceReference } from '../harness/ResourceReference';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
export default function ResourceReferenceValidationTest(): void {
  describe('ResourceReferenceValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3900
     * @tc.name      testResourceValidString
     * @tc.desc      Checks that a string reference parses.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidString',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceValidString', 'case begin', 'validstring resource reference check');
      TestLog.step('testResourceValidString', 'validstring resource reference check');
      const actual: boolean = ResourceReference.isValid('$string:app_name');
      TestLog.text('testResourceValidString', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testResourceValidString', 'case end', 'validstring resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3901
     * @tc.name      testResourceValidMedia
     * @tc.desc      Checks that a media reference parses.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidMedia',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceValidMedia', 'case begin', 'validmedia resource reference check');
      TestLog.step('testResourceValidMedia', 'validmedia resource reference check');
      const actual: boolean = ResourceReference.isValid('$media:icon');
      TestLog.text('testResourceValidMedia', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testResourceValidMedia', 'case end', 'validmedia resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3902
     * @tc.name      testResourceValidColor
     * @tc.desc      Checks that a color reference parses.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidColor',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceValidColor', 'case begin', 'validcolor resource reference check');
      TestLog.step('testResourceValidColor', 'validcolor resource reference check');
      const actual: boolean = ResourceReference.isValid('$color:start');
      TestLog.text('testResourceValidColor', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testResourceValidColor', 'case end', 'validcolor resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3903
     * @tc.name      testResourceValidProfile
     * @tc.desc      Checks that a profile reference parses.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidProfile',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceValidProfile', 'case begin', 'validprofile resource reference check');
      TestLog.step('testResourceValidProfile', 'validprofile resource reference check');
      const actual: boolean = ResourceReference.isValid('$profile:main_pages');
      TestLog.text('testResourceValidProfile', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testResourceValidProfile', 'case end', 'validprofile resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3904
     * @tc.name      testResourceInvalidEmpty
     * @tc.desc      Checks that an empty value does not parse.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceInvalidEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceInvalidEmpty', 'case begin', 'invalidempty resource reference check');
      TestLog.step('testResourceInvalidEmpty', 'invalidempty resource reference check');
      const actual: boolean = ResourceReference.isValid('');
      TestLog.text('testResourceInvalidEmpty', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testResourceInvalidEmpty', 'case end', 'invalidempty resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3905
     * @tc.name      testResourceInvalidSpaces
     * @tc.desc      Checks that a whitespace value does not parse.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceInvalidSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceInvalidSpaces', 'case begin', 'invalidspaces resource reference check');
      TestLog.step('testResourceInvalidSpaces', 'invalidspaces resource reference check');
      const actual: boolean = ResourceReference.isValid('   ');
      TestLog.text('testResourceInvalidSpaces', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testResourceInvalidSpaces', 'case end', 'invalidspaces resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3906
     * @tc.name      testResourceInvalidNoDollar
     * @tc.desc      Checks that a value without a dollar sign does not parse.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceInvalidNoDollar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceInvalidNoDollar', 'case begin', 'invalidnodollar resource reference check');
      TestLog.step('testResourceInvalidNoDollar', 'invalidnodollar resource reference check');
      const actual: boolean = ResourceReference.isValid('string:app');
      TestLog.text('testResourceInvalidNoDollar', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testResourceInvalidNoDollar', 'case end', 'invalidnodollar resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3907
     * @tc.name      testResourceInvalidNoSeparator
     * @tc.desc      Checks that a value without a separator does not parse.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceInvalidNoSeparator',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceInvalidNoSeparator', 'case begin', 'invalidnoseparator resource reference check');
      TestLog.step('testResourceInvalidNoSeparator', 'invalidnoseparator resource reference check');
      const actual: boolean = ResourceReference.isValid('$string');
      TestLog.text('testResourceInvalidNoSeparator', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testResourceInvalidNoSeparator', 'case end', 'invalidnoseparator resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3908
     * @tc.name      testResourceInvalidEmptyKind
     * @tc.desc      Checks that a value with an empty kind does not parse.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceInvalidEmptyKind',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceInvalidEmptyKind', 'case begin', 'invalidemptykind resource reference check');
      TestLog.step('testResourceInvalidEmptyKind', 'invalidemptykind resource reference check');
      const actual: boolean = ResourceReference.isValid('$:app');
      TestLog.text('testResourceInvalidEmptyKind', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testResourceInvalidEmptyKind', 'case end', 'invalidemptykind resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3909
     * @tc.name      testResourceInvalidEmptyName
     * @tc.desc      Checks that a value with an empty name does not parse.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceInvalidEmptyName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceInvalidEmptyName', 'case begin', 'invalidemptyname resource reference check');
      TestLog.step('testResourceInvalidEmptyName', 'invalidemptyname resource reference check');
      const actual: boolean = ResourceReference.isValid('$string:');
      TestLog.text('testResourceInvalidEmptyName', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testResourceInvalidEmptyName', 'case end', 'invalidemptyname resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3910
     * @tc.name      testResourceInvalidUnknownKind
     * @tc.desc      Checks that a value with an unknown kind does not parse.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceInvalidUnknownKind',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceInvalidUnknownKind', 'case begin', 'invalidunknownkind resource reference check');
      TestLog.step('testResourceInvalidUnknownKind', 'invalidunknownkind resource reference check');
      const actual: boolean = ResourceReference.isValid('$text:app');
      TestLog.text('testResourceInvalidUnknownKind', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testResourceInvalidUnknownKind', 'case end', 'invalidunknownkind resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3911
     * @tc.name      testResourceInvalidWhitespaceName
     * @tc.desc      Checks that a value with whitespace in the name does not parse.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceInvalidWhitespaceName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceInvalidWhitespaceName', 'case begin', 'invalidwhitespacename resource reference check');
      TestLog.step('testResourceInvalidWhitespaceName', 'invalidwhitespacename resource reference check');
      const actual: boolean = ResourceReference.isValid('$string:app name');
      TestLog.text('testResourceInvalidWhitespaceName', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testResourceInvalidWhitespaceName', 'case end', 'invalidwhitespacename resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3912
     * @tc.name      testResourceKindOfString
     * @tc.desc      Checks that the string kind is read.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceKindOfString',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceKindOfString', 'case begin', 'kindofstring resource reference check');
      TestLog.step('testResourceKindOfString', 'kindofstring resource reference check');
      const actual: string = ResourceReference.kindOf('$string:app_name');
      TestLog.text('testResourceKindOfString', 'actual value', String(actual));
      expect(actual).assertEqual('string');
      TestLog.text('testResourceKindOfString', 'case end', 'kindofstring resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3913
     * @tc.name      testResourceKindOfMedia
     * @tc.desc      Checks that the media kind is read.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceKindOfMedia',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceKindOfMedia', 'case begin', 'kindofmedia resource reference check');
      TestLog.step('testResourceKindOfMedia', 'kindofmedia resource reference check');
      const actual: string = ResourceReference.kindOf('$media:icon');
      TestLog.text('testResourceKindOfMedia', 'actual value', String(actual));
      expect(actual).assertEqual('media');
      TestLog.text('testResourceKindOfMedia', 'case end', 'kindofmedia resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3914
     * @tc.name      testResourceKindOfInvalid
     * @tc.desc      Checks that an invalid reference has no kind.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceKindOfInvalid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceKindOfInvalid', 'case begin', 'kindofinvalid resource reference check');
      TestLog.step('testResourceKindOfInvalid', 'kindofinvalid resource reference check');
      const actual: string = ResourceReference.kindOf('app_name');
      TestLog.text('testResourceKindOfInvalid', 'actual value', String(actual));
      expect(actual).assertEqual('');
      TestLog.text('testResourceKindOfInvalid', 'case end', 'kindofinvalid resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3915
     * @tc.name      testResourceNameOfString
     * @tc.desc      Checks that the reference name is read.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceNameOfString',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceNameOfString', 'case begin', 'nameofstring resource reference check');
      TestLog.step('testResourceNameOfString', 'nameofstring resource reference check');
      const actual: string = ResourceReference.nameOf('$string:app_name');
      TestLog.text('testResourceNameOfString', 'actual value', String(actual));
      expect(actual).assertEqual('app_name');
      TestLog.text('testResourceNameOfString', 'case end', 'nameofstring resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3916
     * @tc.name      testResourceNameOfMedia
     * @tc.desc      Checks that the media reference name is read.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceNameOfMedia',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceNameOfMedia', 'case begin', 'nameofmedia resource reference check');
      TestLog.step('testResourceNameOfMedia', 'nameofmedia resource reference check');
      const actual: string = ResourceReference.nameOf('$media:layered_image');
      TestLog.text('testResourceNameOfMedia', 'actual value', String(actual));
      expect(actual).assertEqual('layered_image');
      TestLog.text('testResourceNameOfMedia', 'case end', 'nameofmedia resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3917
     * @tc.name      testResourceNameOfInvalid
     * @tc.desc      Checks that an invalid reference has no name.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceNameOfInvalid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceNameOfInvalid', 'case begin', 'nameofinvalid resource reference check');
      TestLog.step('testResourceNameOfInvalid', 'nameofinvalid resource reference check');
      const actual: string = ResourceReference.nameOf('app_name');
      TestLog.text('testResourceNameOfInvalid', 'actual value', String(actual));
      expect(actual).assertEqual('');
      TestLog.text('testResourceNameOfInvalid', 'case end', 'nameofinvalid resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3918
     * @tc.name      testResourceHasKindYes
     * @tc.desc      Checks that a matching kind is detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceHasKindYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceHasKindYes', 'case begin', 'haskindyes resource reference check');
      TestLog.step('testResourceHasKindYes', 'haskindyes resource reference check');
      const actual: boolean = ResourceReference.hasKind('$color:start', 'color');
      TestLog.text('testResourceHasKindYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testResourceHasKindYes', 'case end', 'haskindyes resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3919
     * @tc.name      testResourceHasKindNo
     * @tc.desc      Checks that a different kind is rejected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceHasKindNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testResourceHasKindNo', 'case begin', 'haskindno resource reference check');
      TestLog.step('testResourceHasKindNo', 'haskindno resource reference check');
      const actual: boolean = ResourceReference.hasKind('$color:start', 'media');
      TestLog.text('testResourceHasKindNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testResourceHasKindNo', 'case end', 'haskindno resource reference check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3950
     * @tc.name      testResourceValidateSampleString
     * @tc.desc      Checks that the a string reference of the expected kind is accepted by the resource
     * @tc.desc      reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateSampleString',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$string:app_name';
      TestLog.text('testResourceValidateSampleString', 'case begin', 'resource reference input samplestring');
      TestLog.step('testResourceValidateSampleString', 'resource reference input samplestring');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateSampleString', 'resource reference', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testResourceValidateSampleString', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateSampleString', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateSampleString', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateSampleString', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateSampleString', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateSampleString', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateSampleString', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateSampleString', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateSampleString', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateSampleString', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateSampleString', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateSampleString', 'case end', 'resource reference input samplestring');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3951
     * @tc.name      testResourceValidateMediaMismatch
     * @tc.desc      Checks that the a media reference where a string is expected is reported with
     * @tc.desc      RESOURCE_REF_KIND_MISMATCH by the resource reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateMediaMismatch',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$media:icon';
      TestLog.text('testResourceValidateMediaMismatch', 'case begin', 'resource reference input mediamismatch');
      TestLog.step('testResourceValidateMediaMismatch', 'resource reference input mediamismatch');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateMediaMismatch', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceValidateMediaMismatch', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateMediaMismatch', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateMediaMismatch', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateMediaMismatch', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateMediaMismatch', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateMediaMismatch', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateMediaMismatch', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateMediaMismatch', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateMediaMismatch', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateMediaMismatch', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateMediaMismatch', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateMediaMismatch', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateMediaMismatch', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateMediaMismatch', 'case end', 'resource reference input mediamismatch');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3952
     * @tc.name      testResourceValidateColorMismatch
     * @tc.desc      Checks that the a color reference where a string is expected is reported with
     * @tc.desc      RESOURCE_REF_KIND_MISMATCH by the resource reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateColorMismatch',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$color:start';
      TestLog.text('testResourceValidateColorMismatch', 'case begin', 'resource reference input colormismatch');
      TestLog.step('testResourceValidateColorMismatch', 'resource reference input colormismatch');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateColorMismatch', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceValidateColorMismatch', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateColorMismatch', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateColorMismatch', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateColorMismatch', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateColorMismatch', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateColorMismatch', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateColorMismatch', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateColorMismatch', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateColorMismatch', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateColorMismatch', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateColorMismatch', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateColorMismatch', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateColorMismatch', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateColorMismatch', 'case end', 'resource reference input colormismatch');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3953
     * @tc.name      testResourceValidateEmpty
     * @tc.desc      Checks that the an empty reference is reported with RESOURCE_REF_EMPTY by the resource
     * @tc.desc      reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '';
      TestLog.text('testResourceValidateEmpty', 'case begin', 'resource reference input empty');
      TestLog.step('testResourceValidateEmpty', 'resource reference input empty');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateEmpty', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY');
      TestLog.flag('testResourceValidateEmpty', 'has code RESOURCE_REF_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateEmpty', 'case end', 'resource reference input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3954
     * @tc.name      testResourceValidateSpaces
     * @tc.desc      Checks that the a whitespace reference is reported with RESOURCE_REF_EMPTY by the
     * @tc.desc      resource reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '   ';
      TestLog.text('testResourceValidateSpaces', 'case begin', 'resource reference input spaces');
      TestLog.step('testResourceValidateSpaces', 'resource reference input spaces');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateSpaces', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY');
      TestLog.flag('testResourceValidateSpaces', 'has code RESOURCE_REF_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateSpaces', 'case end', 'resource reference input spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3955
     * @tc.name      testResourceValidateNoDollar
     * @tc.desc      Checks that the a reference without a dollar sign is reported with
     * @tc.desc      RESOURCE_REF_NO_DOLLAR by the resource reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateNoDollar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = 'string:app_name';
      TestLog.text('testResourceValidateNoDollar', 'case begin', 'resource reference input nodollar');
      TestLog.step('testResourceValidateNoDollar', 'resource reference input nodollar');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateNoDollar', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_NO_DOLLAR');
      TestLog.flag('testResourceValidateNoDollar', 'has code RESOURCE_REF_NO_DOLLAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateNoDollar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateNoDollar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateNoDollar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateNoDollar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateNoDollar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateNoDollar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateNoDollar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateNoDollar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateNoDollar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateNoDollar', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateNoDollar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateNoDollar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateNoDollar', 'case end', 'resource reference input nodollar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3956
     * @tc.name      testResourceValidateNoSeparator
     * @tc.desc      Checks that the a reference without a kind separator is reported with
     * @tc.desc      RESOURCE_REF_NO_SEPARATOR by the resource reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateNoSeparator',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$string';
      TestLog.text('testResourceValidateNoSeparator', 'case begin', 'resource reference input noseparator');
      TestLog.step('testResourceValidateNoSeparator', 'resource reference input noseparator');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateNoSeparator', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_NO_SEPARATOR');
      TestLog.flag('testResourceValidateNoSeparator', 'has code RESOURCE_REF_NO_SEPARATOR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateNoSeparator', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateNoSeparator', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateNoSeparator', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateNoSeparator', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateNoSeparator', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateNoSeparator', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateNoSeparator', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateNoSeparator', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateNoSeparator', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateNoSeparator', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateNoSeparator', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateNoSeparator', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateNoSeparator', 'case end', 'resource reference input noseparator');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3957
     * @tc.name      testResourceValidateEmptyKind
     * @tc.desc      Checks that the a reference with an empty kind is reported with RESOURCE_REF_EMPTY_KIND
     * @tc.desc      by the resource reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateEmptyKind',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$:app_name';
      TestLog.text('testResourceValidateEmptyKind', 'case begin', 'resource reference input emptykind');
      TestLog.step('testResourceValidateEmptyKind', 'resource reference input emptykind');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateEmptyKind', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_KIND');
      TestLog.flag('testResourceValidateEmptyKind', 'has code RESOURCE_REF_EMPTY_KIND', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateEmptyKind', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateEmptyKind', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateEmptyKind', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateEmptyKind', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateEmptyKind', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateEmptyKind', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateEmptyKind', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateEmptyKind', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateEmptyKind', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateEmptyKind', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateEmptyKind', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateEmptyKind', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateEmptyKind', 'case end', 'resource reference input emptykind');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3958
     * @tc.name      testResourceValidateUnknownKind
     * @tc.desc      Checks that the a reference with an unknown kind is reported with
     * @tc.desc      RESOURCE_REF_UNKNOWN_KIND by the resource reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateUnknownKind',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$text:app_name';
      TestLog.text('testResourceValidateUnknownKind', 'case begin', 'resource reference input unknownkind');
      TestLog.step('testResourceValidateUnknownKind', 'resource reference input unknownkind');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateUnknownKind', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_UNKNOWN_KIND');
      TestLog.flag('testResourceValidateUnknownKind', 'has code RESOURCE_REF_UNKNOWN_KIND', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateUnknownKind', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateUnknownKind', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateUnknownKind', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateUnknownKind', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateUnknownKind', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateUnknownKind', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateUnknownKind', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateUnknownKind', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateUnknownKind', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateUnknownKind', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateUnknownKind', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateUnknownKind', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateUnknownKind', 'case end', 'resource reference input unknownkind');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3959
     * @tc.name      testResourceValidateEmptyName
     * @tc.desc      Checks that the a reference with an empty name is reported with RESOURCE_REF_EMPTY_NAME
     * @tc.desc      by the resource reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateEmptyName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$string:';
      TestLog.text('testResourceValidateEmptyName', 'case begin', 'resource reference input emptyname');
      TestLog.step('testResourceValidateEmptyName', 'resource reference input emptyname');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateEmptyName', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testResourceValidateEmptyName', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateEmptyName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateEmptyName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateEmptyName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateEmptyName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateEmptyName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateEmptyName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateEmptyName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateEmptyName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateEmptyName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateEmptyName', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateEmptyName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateEmptyName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateEmptyName', 'case end', 'resource reference input emptyname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3960
     * @tc.name      testResourceValidateLeadingDigit
     * @tc.desc      Checks that the a reference name starting with a digit is reported with
     * @tc.desc      RESOURCE_REF_LEADING_DIGIT by the resource reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateLeadingDigit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$string:1app';
      TestLog.text('testResourceValidateLeadingDigit', 'case begin', 'resource reference input leadingdigit');
      TestLog.step('testResourceValidateLeadingDigit', 'resource reference input leadingdigit');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateLeadingDigit', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_LEADING_DIGIT');
      TestLog.flag('testResourceValidateLeadingDigit', 'has code RESOURCE_REF_LEADING_DIGIT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateLeadingDigit', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateLeadingDigit', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateLeadingDigit', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateLeadingDigit', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateLeadingDigit', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateLeadingDigit', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateLeadingDigit', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateLeadingDigit', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateLeadingDigit', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateLeadingDigit', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateLeadingDigit', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateLeadingDigit', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateLeadingDigit', 'case end', 'resource reference input leadingdigit');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3961
     * @tc.name      testResourceValidateHyphenName
     * @tc.desc      Checks that the a reference name with a hyphen is reported with
     * @tc.desc      RESOURCE_REF_ILLEGAL_NAME by the resource reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateHyphenName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$string:app-name';
      TestLog.text('testResourceValidateHyphenName', 'case begin', 'resource reference input hyphenname');
      TestLog.step('testResourceValidateHyphenName', 'resource reference input hyphenname');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateHyphenName', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_ILLEGAL_NAME');
      TestLog.flag('testResourceValidateHyphenName', 'has code RESOURCE_REF_ILLEGAL_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateHyphenName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateHyphenName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateHyphenName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateHyphenName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateHyphenName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateHyphenName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateHyphenName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateHyphenName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateHyphenName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateHyphenName', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateHyphenName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateHyphenName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateHyphenName', 'case end', 'resource reference input hyphenname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3962
     * @tc.name      testResourceValidateSpaceName
     * @tc.desc      Checks that the a reference name with a space is reported with RESOURCE_REF_ILLEGAL_NAME
     * @tc.desc      by the resource reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateSpaceName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$string:app name';
      TestLog.text('testResourceValidateSpaceName', 'case begin', 'resource reference input spacename');
      TestLog.step('testResourceValidateSpaceName', 'resource reference input spacename');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateSpaceName', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_ILLEGAL_NAME');
      TestLog.flag('testResourceValidateSpaceName', 'has code RESOURCE_REF_ILLEGAL_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateSpaceName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateSpaceName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateSpaceName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateSpaceName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateSpaceName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateSpaceName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateSpaceName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateSpaceName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateSpaceName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateSpaceName', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateSpaceName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateSpaceName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateSpaceName', 'case end', 'resource reference input spacename');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3963
     * @tc.name      testResourceValidateLeadingSpace
     * @tc.desc      Checks that the a reference with leading whitespace is reported with
     * @tc.desc      RESOURCE_REF_WHITESPACE by the resource reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateLeadingSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = ' $string:app_name';
      TestLog.text('testResourceValidateLeadingSpace', 'case begin', 'resource reference input leadingspace');
      TestLog.step('testResourceValidateLeadingSpace', 'resource reference input leadingspace');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateLeadingSpace', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_WHITESPACE');
      TestLog.flag('testResourceValidateLeadingSpace', 'has code RESOURCE_REF_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateLeadingSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateLeadingSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateLeadingSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateLeadingSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateLeadingSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateLeadingSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateLeadingSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateLeadingSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateLeadingSpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateLeadingSpace', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateLeadingSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateLeadingSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateLeadingSpace', 'case end', 'resource reference input leadingspace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3964
     * @tc.name      testResourceValidateTrailingSpace
     * @tc.desc      Checks that the a reference with trailing whitespace is reported with
     * @tc.desc      RESOURCE_REF_WHITESPACE by the resource reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceValidateTrailingSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$string:app_name ';
      TestLog.text('testResourceValidateTrailingSpace', 'case begin', 'resource reference input trailingspace');
      TestLog.step('testResourceValidateTrailingSpace', 'resource reference input trailingspace');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceValidateTrailingSpace', 'resource reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_WHITESPACE');
      TestLog.flag('testResourceValidateTrailingSpace', 'has code RESOURCE_REF_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceValidateTrailingSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceValidateTrailingSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceValidateTrailingSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceValidateTrailingSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceValidateTrailingSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceValidateTrailingSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceValidateTrailingSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceValidateTrailingSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceValidateTrailingSpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceValidateTrailingSpace', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceValidateTrailingSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceValidateTrailingSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceValidateTrailingSpace', 'case end', 'resource reference input trailingspace');
    })

  })
}
