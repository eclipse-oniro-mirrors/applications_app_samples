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

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { PermissionUtils, PermissionStatus, ResourceHelper, SystemConfigConstants } from 'library';
import { TestRes } from '../Utils/TestRes';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

// ========================================
// PermissionUtils utility test suite
// ========================================

/**
 * PermissionUtils utility test suite.
 * Tests the correctness of permission status checks, permission label lookup,
 * required permission management and permission list formatting in the PermissionUtils class.
 */
export default function permissionUtilsTest(): void {
  describe('PermissionUtilsTest', () => {

    // ========================================
    // checkPermissionStatus - permission status check tests
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_0100
     * @tc.name testPermissionUtils0001
     * @tc.desc Verify unregistered permissions default to NOT_DETERMINED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0001: begin');
      const testPerm: string = 'ohos.permission.INTERNET';
      const status1: PermissionStatus = PermissionUtils.checkPermissionStatus(testPerm);
      expect(status1).assertEqual(PermissionStatus.NOT_DETERMINED);
      expect(PermissionUtils.isPermissionGranted(status1)).assertFalse();
      expect(PermissionUtils.isPermissionRestricted(status1)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0001: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_0200
     * @tc.name testPermissionUtils0002
     * @tc.desc Verify permission check - NOT_DETERMINED is the default state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0002: begin');
      const unknownPerm: string = 'ohos.permission.UNKNOWN_TEST_PERMISSION';
      const status: PermissionStatus = PermissionUtils.checkPermissionStatus(unknownPerm);
      expect(status).assertEqual(PermissionStatus.NOT_DETERMINED);
      expect(PermissionUtils.getPermissionStatusLabel(status)).assertEqual(TestRes.str('perm_status_not_determined'));
      expect(PermissionUtils.getPermissionLabel(unknownPerm)).assertEqual(unknownPerm);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0002: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_0300
     * @tc.name testPermissionUtils0003
     * @tc.desc Verify the mock permission tool's DND permission is unregistered by default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0003: begin');
      const dndPerm: string = SystemConfigConstants.PERMISSION_DND;
      const status: PermissionStatus = PermissionUtils.checkPermissionStatus(dndPerm);
      expect(status).assertEqual(PermissionStatus.NOT_DETERMINED);
      expect(PermissionUtils.isPermissionGranted(status)).assertFalse();
      expect(PermissionUtils.isPermissionRestricted(status)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0003: end');
    });

    // ========================================
    // isPermissionGranted - granted check tests
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_0400
     * @tc.name testPermissionUtils0004
     * @tc.desc Verify granted check - GRANTED returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0004: begin');
      const result: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.GRANTED);
      expect(result).assertTrue();
      expect(PermissionUtils.getPermissionStatusLabel(PermissionStatus.GRANTED))
        .assertEqual(TestRes.str('perm_status_granted'));
      expect(PermissionUtils.isPermissionRestricted(PermissionStatus.GRANTED)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0004: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_0500
     * @tc.name testPermissionUtils0005
     * @tc.desc Verify granted check - DENIED returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0005: begin');
      const result: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.DENIED);
      expect(result).assertFalse();
      expect(PermissionUtils.getPermissionStatusLabel(PermissionStatus.DENIED))
        .assertEqual(TestRes.str('perm_status_denied'));
      expect(PermissionUtils.isPermissionRestricted(PermissionStatus.DENIED)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0005: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_0600
     * @tc.name testPermissionUtils0006
     * @tc.desc Verify granted check - NOT_DETERMINED returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0006: begin');
      const result1: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.NOT_DETERMINED);
      const result2: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.RESTRICTED);
      expect(result1).assertFalse();
      expect(result2).assertFalse();
      expect(result1).assertEqual(result2);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0006: end');
    });

    // ========================================
    // isPermissionRestricted - restricted check tests
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_0700
     * @tc.name testPermissionUtils0007
     * @tc.desc Verify restricted check - RESTRICTED returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0007: begin');
      const result: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.RESTRICTED);
      expect(result).assertTrue();
      expect(PermissionUtils.isPermissionGranted(PermissionStatus.RESTRICTED)).assertFalse();
      expect(PermissionUtils.getPermissionStatusLabel(PermissionStatus.RESTRICTED))
        .assertEqual(TestRes.str('perm_status_restricted'));
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0007: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_0800
     * @tc.name testPermissionUtils0008
     * @tc.desc Verify restricted check - GRANTED returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0008: begin');
      const result: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.GRANTED);
      expect(result).assertFalse();
      expect(PermissionUtils.isPermissionGranted(PermissionStatus.GRANTED)).assertTrue();
      expect(PermissionUtils.getPermissionStatusLabel(PermissionStatus.GRANTED))
        .assertEqual(TestRes.str('perm_status_granted'));
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0008: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_0900
     * @tc.name testPermissionUtils0009
     * @tc.desc Verify restricted check - other states return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0009: begin');
      const result1: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.DENIED);
      const result2: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.NOT_DETERMINED);
      expect(result1).assertFalse();
      expect(result2).assertFalse();
      expect(result1).assertEqual(result2);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0009: end');
    });

    // ========================================
    // getPermissionLabel - permission label tests
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_1000
     * @tc.name testPermissionUtils0010
     * @tc.desc Verify label lookup - the DND permission returns a localized description
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0010: begin');
      const dndPerm: string = 'ohos.permission.GET_DONOTDISTURB_STATE';
      const result: string = PermissionUtils.getPermissionLabel(dndPerm);
      expect(result).assertEqual(TestRes.str('perm_dnd'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0010: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1100
     * @tc.name testPermissionUtils0011
     * @tc.desc Verify label lookup - the INTERNET permission returns a localized description
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0011: begin');
      const result: string = PermissionUtils.getPermissionLabel('ohos.permission.INTERNET');
      expect(result).assertEqual(TestRes.str('perm_internet'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0011: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1200
     * @tc.name testPermissionUtils0012
     * @tc.desc Verify label lookup - the location permission returns a localized description
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0012: begin');
      const result1: string = PermissionUtils.getPermissionLabel('ohos.permission.LOCATION');
      const result2: string = PermissionUtils.getPermissionLabel('ohos.permission.CAMERA');
      expect(result1).assertEqual(TestRes.str('perm_location'));
      expect(result2).assertEqual(TestRes.str('perm_camera'));
      expect(result1.length).assertLarger(0);
      expect(result2.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0012: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1300
     * @tc.name testPermissionUtils0013
     * @tc.desc Verify label lookup - an unknown permission returns its original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0013: begin');
      const unknownPerm: string = 'ohos.permission.UNKNOWN_PERM';
      const result: string = PermissionUtils.getPermissionLabel(unknownPerm);
      expect(result).assertEqual(unknownPerm);
      expect(result.length).assertEqual(unknownPerm.length);
      expect(result.indexOf('ohos.permission')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0013: end');
    });

    // ========================================
    // getPermissionStatusLabel - permission status label tests
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_1400
     * @tc.name testPermissionUtils0014
     * @tc.desc Verify status label - GRANTED returns the granted label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0014: begin');
      const result: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.GRANTED);
      expect(result).assertEqual(TestRes.str('perm_status_granted'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0014: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1500
     * @tc.name testPermissionUtils0015
     * @tc.desc Verify status label - DENIED returns the denied label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0015: begin');
      const result: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.DENIED);
      expect(result).assertEqual(TestRes.str('perm_status_denied'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0015: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1600
     * @tc.name testPermissionUtils0016
     * @tc.desc Verify status label - NOT_DETERMINED returns the undetermined label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0016', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0016: begin');
      const result: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.NOT_DETERMINED);
      expect(result).assertEqual(TestRes.str('perm_status_not_determined'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0016: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1700
     * @tc.name testPermissionUtils0017
     * @tc.desc Verify status label - RESTRICTED returns the restricted label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0017', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0017: begin');
      const result: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.RESTRICTED);
      expect(result).assertEqual(TestRes.str('perm_status_restricted'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0017: end');
    });

    // ========================================
    // getRequiredPermissions - required permissions tests
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_1800
     * @tc.name testPermissionUtils0018
     * @tc.desc Verify required permission list - contains the DND permission
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0018', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0018: begin');
      const permissions: string[] = PermissionUtils.getRequiredPermissions();
      expect(permissions.length).assertEqual(1);
      expect(permissions[0]).assertEqual(SystemConfigConstants.PERMISSION_DND);
      expect(PermissionUtils.getPermissionLabel(permissions[0])).assertEqual(TestRes.str('perm_dnd'));
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0018: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_1900
     * @tc.name testPermissionUtils0019
     * @tc.desc Verify required permission list - each call returns an independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0019', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0019: begin');
      const first: string[] = PermissionUtils.getRequiredPermissions();
      first.push('ohos.permission.CAMERA');
      expect(first.length).assertEqual(2);
      const second: string[] = PermissionUtils.getRequiredPermissions();
      expect(second.length).assertEqual(1);
      expect(second.includes('ohos.permission.CAMERA')).assertFalse();
      expect(PermissionUtils.formatPermissionList(second)).assertEqual(TestRes.str('perm_dnd'));
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0019: end');
    });

    // ========================================
    // getAllKnownPermissions - all known permissions tests
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_2000
     * @tc.name testPermissionUtils0020
     * @tc.desc Verify all known permissions - returns the full list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0020', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0020: begin');
      const permissions: string[] = PermissionUtils.getAllKnownPermissions();
      expect(permissions.length).assertEqual(25);
      expect(permissions[0]).assertEqual(SystemConfigConstants.PERMISSION_DND);
      expect(permissions.includes('ohos.permission.INTERNET')).assertTrue();
      expect(PermissionUtils.getPermissionLabel(permissions[0])).assertEqual(TestRes.str('perm_dnd'));
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0020: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2100
     * @tc.name testPermissionUtils0021
     * @tc.desc Verify all known permissions - contains common permissions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0021', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0021: begin');
      const permissions: string[] = PermissionUtils.getAllKnownPermissions();
      expect(permissions.includes('ohos.permission.CAMERA')).assertTrue();
      expect(permissions.includes('ohos.permission.LOCATION')).assertTrue();
      expect(permissions.includes('ohos.permission.MICROPHONE')).assertTrue();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0021: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2200
     * @tc.name testPermissionUtils0022
     * @tc.desc Verify all known permissions - unified prefixes and all have localized labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0022', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0022: begin');
      const permissions: string[] = PermissionUtils.getAllKnownPermissions();
      let allPrefixed: boolean = true;
      let allMapped: boolean = true;
      for (const perm of permissions) {
        if (perm.indexOf('ohos.permission.') !== 0) {
          allPrefixed = false;
        }
        if (PermissionUtils.getPermissionLabel(perm) === perm) {
          allMapped = false;
        }
      }
      expect(allPrefixed).assertTrue();
      expect(allMapped).assertTrue();
      const uniquePerms: Set<string> = new Set<string>(permissions);
      expect(uniquePerms.size).assertEqual(permissions.length);
      expect(permissions[0].indexOf('ohos.permission')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0022: end');
    });

    // ========================================
    // formatPermissionList - permission list formatting tests
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_2300
     * @tc.name testPermissionUtils0023
     * @tc.desc Verify formatting - an empty list returns the no-permission label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0023', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0023: begin');
      const result: string = PermissionUtils.formatPermissionList([]);
      expect(result).assertEqual(TestRes.str('perm_none'));
      expect(result.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0023: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2400
     * @tc.name testPermissionUtils0024
     * @tc.desc Verify formatting - a single permission returns its localized label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0024', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0024: begin');
      const separator: string = ResourceHelper.getStringByName('list_separator');
      const result: string = PermissionUtils.formatPermissionList(['ohos.permission.INTERNET']);
      expect(result).assertEqual(TestRes.str('perm_internet'));
      expect(result.length).assertLarger(0);
      expect(result.indexOf(separator)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0024: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2500
     * @tc.name testPermissionUtils0025
     * @tc.desc Verify formatting - multiple permissions are separated by the ideographic comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0025', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0025: begin');
      const separator: string = ResourceHelper.getStringByName('list_separator');
      const perms: string[] = ['ohos.permission.INTERNET', 'ohos.permission.LOCATION'];
      const result: string = PermissionUtils.formatPermissionList(perms);
      expect(result.indexOf(separator)).assertLarger(-1);
      expect(result.indexOf(TestRes.str('perm_internet'))).assertLarger(-1);
      expect(result.indexOf(TestRes.str('perm_location'))).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0025: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2600
     * @tc.name testPermissionUtils0026
     * @tc.desc Verify formatting - three permissions are separated correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0026', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0026: begin');
      const separator: string = ResourceHelper.getStringByName('list_separator');
      const perms: string[] = [
        'ohos.permission.INTERNET',
        'ohos.permission.CAMERA',
        'ohos.permission.LOCATION'
      ];
      const result: string = PermissionUtils.formatPermissionList(perms);
      expect(result.indexOf(TestRes.str('perm_internet'))).assertLarger(-1);
      expect(result.indexOf(TestRes.str('perm_camera'))).assertLarger(-1);
      expect(result.indexOf(TestRes.str('perm_location'))).assertLarger(-1);
      const separatorCount: number = result.split(separator).length - 1;
      expect(separatorCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0026: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2700
     * @tc.name testPermissionUtils0027
     * @tc.desc Verify formatting - an unknown permission returns its original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0027', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0027: begin');
      const perms: string[] = ['ohos.permission.UNKNOWN_PERM'];
      const result: string = PermissionUtils.formatPermissionList(perms);
      expect(result).assertEqual('ohos.permission.UNKNOWN_PERM');
      expect(result.length).assertLarger(0);
      expect(result.indexOf('UNKNOWN')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0027: end');
    });

    // ========================================
    // PermissionStatus enum tests
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_2800
     * @tc.name testPermissionUtils0028
     * @tc.desc Verify permission status enum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0028', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0028: begin');
      expect(PermissionStatus.GRANTED).assertEqual('granted');
      expect(PermissionStatus.DENIED).assertEqual('denied');
      expect(PermissionStatus.NOT_DETERMINED).assertEqual('not_determined');
      expect(PermissionStatus.RESTRICTED).assertEqual('restricted');
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0028: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_2900
     * @tc.name testPermissionUtils0029
     * @tc.desc Verify permission status enum uniqueness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0029', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0029: begin');
      const statuses: PermissionStatus[] = [
        PermissionStatus.GRANTED,
        PermissionStatus.DENIED,
        PermissionStatus.NOT_DETERMINED,
        PermissionStatus.RESTRICTED
      ];
      const uniqueSet: Set<string> = new Set(statuses);
      expect(uniqueSet.size).assertEqual(4);
      expect(statuses.length).assertEqual(4);
      expect(uniqueSet.size).assertEqual(statuses.length);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0029: end');
    });

    // ========================================
    // Combined scenario tests
    // ========================================

    /**
     * @tc.number SUB_PERMISSION_UTILS_3000
     * @tc.name testPermissionUtils0030
     * @tc.desc Verify permission state consistency - GRANTED matches isGranted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0030', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0030: begin');
      const isGranted: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.GRANTED);
      const isNotGranted1: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.DENIED);
      const isNotGranted2: boolean = PermissionUtils.isPermissionGranted(PermissionStatus.NOT_DETERMINED);
      expect(isGranted).assertTrue();
      expect(isNotGranted1).assertFalse();
      expect(isNotGranted2).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0030: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_3100
     * @tc.name testPermissionUtils0031
     * @tc.desc Verify permission state consistency - RESTRICTED matches isRestricted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0031', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0031: begin');
      const isRestricted: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.RESTRICTED);
      const isNotRestricted1: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.GRANTED);
      const isNotRestricted2: boolean = PermissionUtils.isPermissionRestricted(PermissionStatus.DENIED);
      expect(isRestricted).assertTrue();
      expect(isNotRestricted1).assertFalse();
      expect(isNotRestricted2).assertFalse();
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0031: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_3200
     * @tc.name testPermissionUtils0032
     * @tc.desc Verify permission label mapping - known permissions all have localized labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0032', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0032: begin');
      const allPerms: string[] = PermissionUtils.getAllKnownPermissions();
      let mappedCount: number = 0;
      for (const perm of allPerms) {
        const label: string = PermissionUtils.getPermissionLabel(perm);
        if (label !== perm) {
          mappedCount++;
        }
      }
      expect(mappedCount).assertLarger(10);
      expect(allPerms.length).assertLargerOrEqual(mappedCount);
      expect(mappedCount).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0032: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_3300
     * @tc.name testPermissionUtils0033
     * @tc.desc Verify completeness of each status label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0033', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0033: begin');
      const grantedLabel: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.GRANTED);
      const deniedLabel: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.DENIED);
      const notDeterminedLabel: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.NOT_DETERMINED);
      const restrictedLabel: string = PermissionUtils.getPermissionStatusLabel(PermissionStatus.RESTRICTED);
      expect(grantedLabel).assertEqual(TestRes.str('perm_status_granted'));
      expect(deniedLabel).assertEqual(TestRes.str('perm_status_denied'));
      expect(notDeterminedLabel).assertEqual(TestRes.str('perm_status_not_determined'));
      expect(restrictedLabel).assertEqual(TestRes.str('perm_status_restricted'));
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0033: end');
    });

    /**
     * @tc.number SUB_PERMISSION_UTILS_3400
     * @tc.name testPermissionUtils0034
     * @tc.desc Verify required permissions are in the known permission list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0034', 0, () => {
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0034: begin');
      const required: string[] = PermissionUtils.getRequiredPermissions();
      const allKnown: string[] = PermissionUtils.getAllKnownPermissions();
      let allIncluded: boolean = true;
      for (const req of required) {
        if (!allKnown.includes(req)) {
          allIncluded = false;
          break;
        }
      }
      expect(allIncluded).assertTrue();
      expect(required.length).assertLarger(0);
      expect(allKnown.length).assertLarger(required.length);
      hilog.info(DOMAIN, TAG, 'testPermissionUtils0034: end');
    });
  });
}
