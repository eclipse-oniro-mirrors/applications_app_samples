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

// Import the runtime permission helper under test from the library HAR package.
import { PermissionUtils } from 'library';
// Import the permission string type so every probe uses a documented literal.
import { Permissions } from '@kit.AbilityKit';
// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// The network permission, which the sample manifest does not declare, so it is never granted.
const PERMISSION_INTERNET: Permissions = 'ohos.permission.INTERNET';
// The get network info permission, which the sample manifest does not declare either.
const PERMISSION_GET_NETWORK_INFO: Permissions = 'ohos.permission.GET_NETWORK_INFO';
// The distributed data sync permission from a different permission group, used as a cross group probe.
const PERMISSION_DISTRIBUTED_DATASYNC: Permissions = 'ohos.permission.DISTRIBUTED_DATASYNC';
// The keep background running permission from the background group, used as a third group probe.
const PERMISSION_KEEP_BACKGROUND_RUNNING: Permissions = 'ohos.permission.KEEP_BACKGROUND_RUNNING';
// The only permission declared by the sample manifest; it is system_grant, so the install grants it without a dialog.
const PERMISSION_UPDATE_FONT: Permissions = 'ohos.permission.UPDATE_FONT';
// The repeat count used by the idempotent grant state sweep.
const SWEEP_ROUNDS: number = 5;
// The repeat count of the stability table rows.
const STABILITY_ROWS: number = 4;
// The boolean literal names used when a probe outcome is rendered into a log line.
const TRUE_TEXT: string = 'true';
// The boolean literal name emitted for a denied probe.
const FALSE_TEXT: string = 'false';
// The documented prefix carried by every platform permission literal.
const PERMISSION_PREFIX: string = 'ohos.permission.';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Renders a boolean probe outcome into a stable lower case literal for the log lines.
function boolText(value: boolean): string {
  // Map the true case onto the true literal name.
  if (value) {
    // Return the true literal name.
    return TRUE_TEXT;
  }
  // Map the false case onto the false literal name.
  return FALSE_TEXT;
}

// The permission table walked by the matrix and stability cases; only the last entry is declared by the manifest.
const PERMISSION_TABLE: Permissions[] = [PERMISSION_INTERNET, PERMISSION_GET_NETWORK_INFO,
  PERMISSION_DISTRIBUTED_DATASYNC, PERMISSION_KEEP_BACKGROUND_RUNNING, PERMISSION_UPDATE_FONT];
// The human readable names aligned with the permission table so log lines stay auditable.
const PERMISSION_TABLE_NAMES: string[] = ['INTERNET', 'GET_NETWORK_INFO', 'DISTRIBUTED_DATASYNC',
  'KEEP_BACKGROUND_RUNNING', 'UPDATE_FONT'];

// Registers every on-device test case of the runtime permission helpers.
export default function permissionUtilsTest() {
  // Group the cases under the "PermissionUtilsSuite" describe block.
  describe('PermissionUtilsSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'PermissionUtilsSuite, begin');
      // Announce the permission table used by this suite so the log is self describing.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'PermissionUtilsSuite, table=' +
        PERMISSION_TABLE_NAMES.join('|'));
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_0100
     * @tc.name      testPermissionIsGranted0001
     * @tc.desc      Verify isGranted reports the declared font permission as granted so callers can branch on it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPermissionIsGranted0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionIsGranted0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Ask for the grant state of the font permission declared by the manifest.
      const granted: boolean = PermissionUtils.isGranted(PERMISSION_UPDATE_FONT);
      // Log the resolved grant state.
      logCase(TAG, 'isGranted(UPDATE_FONT)=' + boolText(granted));
      // The helper never returns undefined or a truthy substitute.
      expect(typeof granted).assertEqual('boolean');
      // The helper resolves to one of the two boolean literals.
      expect(granted === true || granted === false).assertTrue();
      // The declared permission is granted at install time and needs no dialog, so it must be granted.
      expect(granted).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_0200
     * @tc.name      testPermissionIsGranted0003
     * @tc.desc      Verify the two undeclared network permissions share one denied grant state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPermissionIsGranted0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionIsGranted0003';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Query both network permissions through the same helper entry point.
      const internet: boolean = PermissionUtils.isGranted(PERMISSION_INTERNET);
      // Query the second network permission for the pair comparison.
      const networkInfo: boolean = PermissionUtils.isGranted(PERMISSION_GET_NETWORK_INFO);
      // Log the pair so a mismatch is visible in hilog.
      logCase(TAG, 'internet=' + boolText(internet) + ', networkInfo=' + boolText(networkInfo));
      // Both rows are booleans before the pair comparison happens.
      expect(typeof internet).assertEqual('boolean');
      // The second row is a boolean as well.
      expect(typeof networkInfo).assertEqual('boolean');
      // Neither network permission is declared by the manifest, so the pair agrees.
      expect(internet).assertEqual(networkInfo);
      // The pair is reported as not granted on both rows.
      expect(internet || networkInfo).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_0300
     * @tc.name      testPermissionIsGranted0002
     * @tc.desc      Verify isGranted reports the get network info permission as not granted because the manifest omits it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPermissionIsGranted0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionIsGranted0002';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Ask for the grant state of the network info permission.
      const granted: boolean = PermissionUtils.isGranted(PERMISSION_GET_NETWORK_INFO);
      // Log the resolved grant state.
      logCase(TAG, 'isGranted(GET_NETWORK_INFO)=' + boolText(granted));
      // The helper returns a boolean for a second normal permission as well.
      expect(typeof granted).assertEqual('boolean');
      // The manifest does not declare the network info permission, so it must not be granted.
      expect(granted).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_0400
     * @tc.name      testPermissionIdempotence0001
     * @tc.desc      Verify repeated isGranted probes of the same permission keep returning the identical verdict.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionIdempotence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionIdempotence0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Take the first verdict as the reference value of the sweep.
      const reference: boolean = PermissionUtils.isGranted(PERMISSION_INTERNET);
      // Track how many rounds agreed with the reference verdict.
      let agreeing: number = 0;
      // Sweep the configured number of rounds.
      for (let i: number = 0; i < SWEEP_ROUNDS; i++) {
        // Probe the same permission again inside this round.
        const current: boolean = PermissionUtils.isGranted(PERMISSION_INTERNET);
        // Count the round that agreed with the reference verdict.
        if (current === reference) {
          // Increment the agreeing counter.
          agreeing = agreeing + 1;
        }
      }
      // Log the reference verdict and the agreeing round count.
      logCase(TAG, 'reference=' + boolText(reference) + ', agreeing=' + agreeing.toString());
      // Every round must agree with the reference verdict during one run.
      expect(agreeing).assertEqual(SWEEP_ROUNDS);
      // The reference verdict itself is a boolean.
      expect(typeof reference).assertEqual('boolean');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_0500
     * @tc.name      testPermissionTableSweep0001
     * @tc.desc      Verify the helper accepts every documented permission literal of the sample table without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionTableSweep0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionTableSweep0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The verdict table collects one entry per permission of the sample table.
      const verdicts: boolean[] = [];
      // Walk the permission table in declaration order.
      for (let i: number = 0; i < PERMISSION_TABLE.length; i++) {
        // Query the grant state of the current permission.
        const verdict: boolean = PermissionUtils.isGranted(PERMISSION_TABLE[i]);
        // Log the table row so a failing permission is identifiable.
        logCase(TAG, 'row ' + PERMISSION_TABLE_NAMES[i] + '=' + boolText(verdict));
        // Append the verdict so the count assertion below can inspect the table size.
        verdicts.push(verdict);
      }
      // Every permission of the table produced exactly one verdict.
      expect(verdicts.length).assertEqual(PERMISSION_TABLE.length);
      // The table names stay aligned with the permission table.
      expect(PERMISSION_TABLE_NAMES.length).assertEqual(PERMISSION_TABLE.length);
      // Track how many verdicts were plain booleans.
      let booleanCount: number = 0;
      // Walk the verdict table and validate the boolean contract row by row.
      for (let i: number = 0; i < verdicts.length; i++) {
        // Every verdict is a boolean literal.
        expect(typeof verdicts[i]).assertEqual('boolean');
        // Count the verdict that satisfied the contract.
        booleanCount = booleanCount + 1;
      }
      // Every row of the verdict table must satisfy the boolean contract.
      expect(booleanCount).assertEqual(PERMISSION_TABLE.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_0600
     * @tc.name      testPermissionUnknownLiteral0001
     * @tc.desc      Verify an unknown permission literal is reported as not granted instead of throwing to the caller.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPermissionUnknownLiteral0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionUnknownLiteral0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The unknown literal follows the documented permission naming shape but is not declared by any bundle.
      const unknownLiteral: string = 'ohos.permission.FONT_RESOURCE_NOT_DECLARED';
      // The helper must absorb the platform failure instead of propagating it.
      const verdict: boolean = PermissionUtils.isGranted(unknownLiteral as Permissions);
      // Log the verdict of the unknown literal.
      logCase(TAG, 'isGranted(unknown)=' + boolText(verdict));
      // The unknown literal is never reported as granted.
      expect(verdict).assertFalse();
      // The helper still returns a boolean for an unknown literal.
      expect(typeof verdict).assertEqual('boolean');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_0700
     * @tc.name      testPermissionPrefixContract0001
     * @tc.desc      Verify every probe literal of the table keeps the documented ohos.permission prefix shape.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPermissionPrefixContract0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionPrefixContract0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The documented prefix of every platform permission literal.
      const prefix: string = 'ohos.permission.';
      // Track how many literals keep the documented prefix.
      let prefixed: number = 0;
      // Walk the permission table and validate the literal shape row by row.
      for (let i: number = 0; i < PERMISSION_TABLE.length; i++) {
        // The literal must start with the documented permission prefix.
        expect(PERMISSION_TABLE[i].indexOf(prefix)).assertEqual(0);
        // The literal must be longer than the prefix so a real permission name remains.
        expect(PERMISSION_TABLE[i].length).assertLarger(prefix.length);
        // The literal never contains the whitespace that a typo would introduce.
        expect(PERMISSION_TABLE[i].indexOf(' ')).assertEqual(-1);
        // Count the literal that satisfied the shape contract.
        prefixed = prefixed + 1;
      }
      // Every literal of the table must satisfy the shape contract.
      expect(prefixed).assertEqual(PERMISSION_TABLE.length);
      // Log the checked literal count.
      logCase(TAG, 'prefixed=' + prefixed.toString());
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_0800
     * @tc.name      testPermissionRepeatSweep0001
     * @tc.desc      Verify the whole permission table sweeps stably across repeated rounds so the info screen is consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPermissionRepeatSweep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionRepeatSweep0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The reference round records the verdict of every table entry.
      const reference: boolean[] = [];
      // Fill the reference round once.
      for (let i: number = 0; i < PERMISSION_TABLE.length; i++) {
        // Record the verdict of the current table entry.
        reference.push(PermissionUtils.isGranted(PERMISSION_TABLE[i]));
      }
      // Track how many table entries stayed identical across every repeated round.
      let stableEntries: number = 0;
      // Walk the table again for each repeated round.
      for (let round: number = 0; round < STABILITY_ROWS; round++) {
        // Probe every table entry inside this repeated round.
        for (let i: number = 0; i < PERMISSION_TABLE.length; i++) {
          // Compare the repeated verdict against the reference verdict.
          const current: boolean = PermissionUtils.isGranted(PERMISSION_TABLE[i]);
          // Count the entry that stayed identical in this round.
          if (current === reference[i]) {
            // Increment the stable counter.
            stableEntries = stableEntries + 1;
          }
        }
      }
      // Log the reference table and the stable entry count.
      logCase(TAG, 'reference=' + reference.length.toString() + ', stable=' + stableEntries.toString());
      // The reference round must cover every table entry.
      expect(reference.length).assertEqual(PERMISSION_TABLE.length);
      // Every entry must stay identical across all repeated rounds.
      expect(stableEntries).assertEqual(PERMISSION_TABLE.length * STABILITY_ROWS);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_0900
     * @tc.name      testPermissionGroupMatrix0001
     * @tc.desc      Verify the declared manifest permissions are all granted so the capability rows can render as available.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPermissionGroupMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionGroupMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The manifest table lists the permissions the sample declares in its module configuration.
      const manifestTable: Permissions[] = [PERMISSION_UPDATE_FONT];
      // Track how many manifest permissions are currently granted.
      let grantedCount: number = 0;
      // Walk the manifest table and assert the install time grant.
      for (let i: number = 0; i < manifestTable.length; i++) {
        // Query the grant state of the current manifest permission.
        const granted: boolean = PermissionUtils.isGranted(manifestTable[i]);
        // Log the manifest row outcome.
        logCase(TAG, 'manifest index ' + i.toString() + '=' + boolText(granted));
        // Every declared manifest permission must be granted at install time.
        expect(granted).assertTrue();
        // Count the granted manifest permission.
        grantedCount = grantedCount + 1;
      }
      // Every manifest permission must have been counted as granted.
      expect(grantedCount).assertEqual(manifestTable.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_1000
     * @tc.name      testPermissionVerdictSummary0001
     * @tc.desc      Verify the grant summary composed from the live verdicts is a non empty printable string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPermissionVerdictSummary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionVerdictSummary0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Compose the summary the same way the capability row does, using concatenation only.
      let summary: string = '';
      // Walk the permission table appending one segment per permission.
      for (let i: number = 0; i < PERMISSION_TABLE.length; i++) {
        // Append the permission short name and its verdict.
        summary = summary + PERMISSION_TABLE_NAMES[i] + '=' + boolText(PermissionUtils.isGranted(PERMISSION_TABLE[i]));
        // Append the segment separator unless this is the last segment.
        if (i < PERMISSION_TABLE.length - 1) {
          // Append the documented segment separator.
          summary = summary + '; ';
        }
      }
      // Log the composed summary.
      logCase(TAG, summary);
      // The summary carries every permission so it is never empty.
      expect(summary.length).assertLarger(0);
      // The summary starts with the first permission of the table.
      expect(summary.indexOf(PERMISSION_TABLE_NAMES[0] + '=')).assertEqual(0);
      // The summary carries the last permission of the table.
      expect(summary.indexOf(PERMISSION_TABLE_NAMES[PERMISSION_TABLE.length - 1] + '=')).assertLarger(0);
      // The summary never embeds an undefined marker.
      expect(summary.indexOf('undefined')).assertEqual(-1);
      // The summary carries exactly one separator per boundary between segments.
      expect(summary.length).assertLarger(PERMISSION_TABLE.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_1100
     * @tc.name      testPermissionCrossGroup0001
     * @tc.desc      Verify permissions outside the manifest table are reported consistently by the same helper call.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPermissionCrossGroup0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionCrossGroup0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Query the distributed data sync permission, which is not declared by this sample.
      const dataSync: boolean = PermissionUtils.isGranted(PERMISSION_DISTRIBUTED_DATASYNC);
      // Query the keep background running permission, which is not declared by this sample either.
      const background: boolean = PermissionUtils.isGranted(PERMISSION_KEEP_BACKGROUND_RUNNING);
      // Log both cross group verdicts.
      logCase(TAG, 'datasync=' + boolText(dataSync) + ', background=' + boolText(background));
      // Both probes must still resolve to boolean literals.
      expect(typeof dataSync).assertEqual('boolean');
      // The background probe resolves to a boolean literal as well.
      expect(typeof background).assertEqual('boolean');
      // An undeclared permission is never reported as granted by the token manager.
      expect(dataSync).assertFalse();
      // The second undeclared permission is reported as not granted as well.
      expect(background).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_1200
     * @tc.name      testPermissionComparisonTable0001
     * @tc.desc      Verify the granted verdict of a manifest permission differs from that of an undeclared permission.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPermissionComparisonTable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionComparisonTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The comparison table pairs a declared permission with an undeclared one.
      const declaredVerdict: boolean = PermissionUtils.isGranted(PERMISSION_UPDATE_FONT);
      // Query the undeclared permission that shares the same helper entry point.
      const undeclaredVerdict: boolean = PermissionUtils.isGranted(PERMISSION_DISTRIBUTED_DATASYNC);
      // The comparison table also records the expected verdicts for audit.
      const expected: boolean[] = [true, false];
      // Log both verdicts against the expected table.
      logCase(TAG, 'declared=' + boolText(declaredVerdict) + ' (expected ' + boolText(expected[0]) +
        '), undeclared=' + boolText(undeclaredVerdict) + ' (expected ' + boolText(expected[1]) + ')');
      // The declared permission verdict matches the first row of the expected table.
      expect(declaredVerdict).assertEqual(expected[0]);
      // The undeclared permission verdict matches the second row of the expected table.
      expect(undeclaredVerdict).assertEqual(expected[1]);
      // The two verdicts differ, proving the helper actually inspects the permission argument.
      expect(declaredVerdict === undeclaredVerdict).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_1300
     * @tc.name      testPermissionSweepCounter0001
     * @tc.desc      Verify the grant count of the table stays limited to the declared manifest permissions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPermissionSweepCounter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionSweepCounter0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The sweep walks the whole table and counts the granted permissions.
      let grantedCount: number = 0;
      // Track the number of table entries that were inspected.
      let inspectedCount: number = 0;
      // Walk the permission table once.
      for (let i: number = 0; i < PERMISSION_TABLE.length; i++) {
        // Inspect the current table entry.
        const granted: boolean = PermissionUtils.isGranted(PERMISSION_TABLE[i]);
        // Count the inspected entry.
        inspectedCount = inspectedCount + 1;
        // Count the granted entry.
        if (granted) {
          // Increment the granted counter.
          grantedCount = grantedCount + 1;
        }
      }
      // Log the granted and inspected counts together.
      logCase(TAG, 'granted=' + grantedCount.toString() + ', inspected=' + inspectedCount.toString());
      // Every table entry must have been inspected.
      expect(inspectedCount).assertEqual(PERMISSION_TABLE.length);
      // The granted count never exceeds the table size.
      expect(grantedCount).assertLessOrEqual(PERMISSION_TABLE.length);
      // UPDATE_FONT is the only table entry declared by the manifest, so exactly one is granted.
      expect(grantedCount).assertEqual(1);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_1400
     * @tc.name      testPermissionVerdictPair0001
     * @tc.desc      Verify the granted verdict and its negation always form a complementary pair for each permission.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPermissionVerdictPair0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionVerdictPair0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Track the rows whose verdict and negation stayed complementary.
      let complementaryRows: number = 0;
      // Walk the permission table and check the complementary pair for each row.
      for (let i: number = 0; i < PERMISSION_TABLE.length; i++) {
        // Read the granted verdict of the current row.
        const granted: boolean = PermissionUtils.isGranted(PERMISSION_TABLE[i]);
        // Read the verdict a second time to build the pair.
        const again: boolean = PermissionUtils.isGranted(PERMISSION_TABLE[i]);
        // Log the pair for the current row.
        logCase(TAG, PERMISSION_TABLE[i] + ': ' + boolText(granted) + '/' + boolText(again));
        // The verdict and its negation can never be equal.
        expect(granted !== !granted).assertTrue();
        // Both reads of the same permission must agree.
        expect(granted).assertEqual(again);
        // Count the row that satisfied the complementary contract.
        complementaryRows = complementaryRows + 1;
      }
      // Every table row must have satisfied the complementary contract.
      expect(complementaryRows).assertEqual(PERMISSION_TABLE.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_1500
     * @tc.name      testPermissionKernelGuard0001
     * @tc.desc      Verify the helper never throws for any table entry so the capability screen cannot crash at bind time.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPermissionKernelGuard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionKernelGuard0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Track the rows that resolved without raising an exception.
      let safeRows: number = 0;
      // Walk the table and call the helper for every entry.
      for (let i: number = 0; i < PERMISSION_TABLE.length; i++) {
        // Read the verdict; the try block only proves the call is exception free.
        try {
          // Call the helper for the current table entry.
          const granted: boolean = PermissionUtils.isGranted(PERMISSION_TABLE[i]);
          // A resolved verdict is always a boolean literal.
          expect(typeof granted).assertEqual('boolean');
          // Count the row that resolved safely.
          safeRows = safeRows + 1;
        } catch (error) {
          // A raised exception means the helper broke its never throw contract.
          expect(false).assertTrue();
        }
      }
      // Log the safe row count.
      logCase(TAG, 'safe rows=' + safeRows.toString());
      // Every table row must resolve without raising.
      expect(safeRows).assertEqual(PERMISSION_TABLE.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PERM_1600
     * @tc.name      testPermissionTableSize0001
     * @tc.desc      Verify the probe table keeps its declared size so the sweep cases stay meaningful over time.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPermissionTableSize0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPermissionTableSize0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the table contents and its size for audit.
      logCase(TAG, 'table size=' + PERMISSION_TABLE.length.toString() + ', entries=' + PERMISSION_TABLE.join('|'));
      // The table keeps exactly the five documented permission literals.
      expect(PERMISSION_TABLE.length).assertEqual(5);
      // The first table entry is the network permission used by the download gate.
      expect(PERMISSION_TABLE[0]).assertEqual(PERMISSION_INTERNET);
      // The second table entry is the network info permission.
      expect(PERMISSION_TABLE[1]).assertEqual(PERMISSION_GET_NETWORK_INFO);
      // Every entry starts with the documented ohos permission prefix.
      let prefixed: number = 0;
      // Walk the table and confirm the prefix contract for each entry.
      for (let i: number = 0; i < PERMISSION_TABLE.length; i++) {
        // Count the entry that carries the documented prefix.
        if (PERMISSION_TABLE[i].indexOf(PERMISSION_PREFIX) === 0) {
          // Increment the prefixed counter.
          prefixed = prefixed + 1;
        }
      }
      // Every table entry must carry the documented prefix.
      expect(prefixed).assertEqual(PERMISSION_TABLE.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
