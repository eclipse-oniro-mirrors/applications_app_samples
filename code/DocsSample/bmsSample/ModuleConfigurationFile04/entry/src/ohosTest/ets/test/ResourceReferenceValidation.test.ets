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
