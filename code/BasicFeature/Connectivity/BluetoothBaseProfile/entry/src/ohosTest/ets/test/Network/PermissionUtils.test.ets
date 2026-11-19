/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { PermissionStatus, PermissionUtils } from 'library';

/**
 * Test suite for PermissionUtils.
 * @since 26.0.0
 */
const BLUETOOTH_PERMISSION: string = 'ohos.permission.USE_BLUETOOTH';
const LOCATION_PERMISSION: string = 'ohos.permission.APPROXIMATELY_LOCATION';
const ABSENT_PERMISSION: string = 'ohos.permission.ABSENT_SAMPLE';

class RecordingPermissionCallback {
  public permissions: string[] = [];
  public statuses: string[] = [];

  onResult(permission: string, status: PermissionStatus): void {
    this.permissions.push(permission);
    this.statuses.push(status);
  }
}

class ThrowingPermissionCallback {
  onResult(permission: string, status: PermissionStatus): void {
    throw new Error('permission callback failure ' + permission + status);
  }
}

class RecordingRequestCallback {
  public captured: Map<string, PermissionStatus> | null = null;
  public callCount: number = 0;

  onPermissionsResult(results: Map<string, PermissionStatus>): void {
    this.captured = results;
    this.callCount++;
  }
}

export default function permissionUtilsTest(): void {
  describe('PermissionUtilsTest', () => {
    // ==================== grant and revoke (5 cases) ====================

    /*
     * @tc.number: SUB_PERMISSION_UTILS_0100
     * @tc.name: testPermissionUtils0001
     * @tc.desc: Clear every recorded grant and read the empty permission baseline.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0001', 'begin');
      PermissionUtils.clearAll();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0001',
        '#1 assert ' + "expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertFalse()");
      expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0001',
        '#2 assert ' + "expect(PermissionUtils.hasPermission(LOCATION_PERMISSION)).assertFalse()");
      expect(PermissionUtils.hasPermission(LOCATION_PERMISSION)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0001',
        '#3 assert ' + "expect(PermissionUtils.hasBluetoothPermission()).assertFalse()");
      expect(PermissionUtils.hasBluetoothPermission()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0001',
        '#4 assert ' + "expect(PermissionUtils.hasLocationPermission()).assertFalse()");
      expect(PermissionUtils.hasLocationPermission()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0001',
        '#5 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
      const probe: RecordingRequestCallback = new RecordingRequestCallback();
      PermissionUtils.requestPermissions([BLUETOOTH_PERMISSION], probe);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0001',
        '#6 assert ' + "expect(probe.captured!.get(BLUETOOTH_PERMISSION)).assertEqual(PermissionStatus.DENIED)");
      expect(probe.captured!.get(BLUETOOTH_PERMISSION)).assertEqual(PermissionStatus.DENIED);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0001', 'end');
    });

    /*
     * @tc.number: SUB_PERMISSION_UTILS_0200
     * @tc.name: testPermissionUtils0002
     * @tc.desc: Grant a permission, confirm the check and revoke it again.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0002', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0002', 'begin');
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0002',
        '#1 assert ' + "expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertTrue()");
      expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0002',
        '#2 assert ' + "expect(PermissionUtils.hasBluetoothPermission()).assertTrue()");
      expect(PermissionUtils.hasBluetoothPermission()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0002',
        '#3 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0002',
        '#4 assert ' + "expect(PermissionUtils.getGrantedPermissions()[0]).assertEqual(BLUETOOTH_PERMISSION)");
      expect(PermissionUtils.getGrantedPermissions()[0]).assertEqual(BLUETOOTH_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0002',
        '#5 assert ' + "expect(PermissionUtils.hasPermission(LOCATION_PERMISSION)).assertFalse()");
      expect(PermissionUtils.hasPermission(LOCATION_PERMISSION)).assertFalse();

      PermissionUtils.revokePermission(BLUETOOTH_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0002',
        '#6 assert ' + "expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertFalse()");
      expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0002',
        '#7 assert ' + "expect(PermissionUtils.hasBluetoothPermission()).assertFalse()");
      expect(PermissionUtils.hasBluetoothPermission()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0002',
        '#8 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0002', 'end');
    });

    /*
     * @tc.number: SUB_PERMISSION_UTILS_0300
     * @tc.name: testPermissionUtils0003
     * @tc.desc: Grant the same permission twice and keep a single entry in the granted set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0003', 'begin');
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0003',
        '#1 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0003',
        '#2 assert ' + "expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertTrue()");
      expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertTrue();
      PermissionUtils.revokePermission(BLUETOOTH_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0003',
        '#3 assert ' + "expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertFalse()");
      expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0003',
        '#4 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
      PermissionUtils.revokePermission(BLUETOOTH_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0003',
        '#5 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0003', 'end');
    });

    /*
     * @tc.number: SUB_PERMISSION_UTILS_0400
     * @tc.name: testPermissionUtils0004
     * @tc.desc: List granted permissions in grant order and treat the returned array as a copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0004', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0004', 'begin');
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission('ohos.permission.first');
      PermissionUtils.grantPermission('ohos.permission.second');
      PermissionUtils.grantPermission('ohos.permission.third');

      const listed: string[] = PermissionUtils.getGrantedPermissions();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0004',
        '#1 ' + "listed.length" + ' = ' + JSON.stringify(listed.length));
      expect(listed.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0004',
        '#2 ' + "listed[0]" + ' = ' + JSON.stringify(listed[0]));
      expect(listed[0]).assertEqual('ohos.permission.first');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0004',
        '#3 ' + "listed[1]" + ' = ' + JSON.stringify(listed[1]));
      expect(listed[1]).assertEqual('ohos.permission.second');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0004',
        '#4 ' + "listed[2]" + ' = ' + JSON.stringify(listed[2]));
      expect(listed[2]).assertEqual('ohos.permission.third');

      listed.push('ohos.permission.injected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0004',
        '#5 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(3)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0004',
        '#6 assert ' + "expect(PermissionUtils.hasPermission('ohos.permission.injected')).assertFalse()");
      expect(PermissionUtils.hasPermission('ohos.permission.injected')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0004',
        '#7 assert ' +
        "expect(PermissionUtils.getGrantedPermissions().indexOf('ohos.permission.injected')).assertEqual(-1)");
      expect(PermissionUtils.getGrantedPermissions().indexOf('ohos.permission.injected')).assertEqual(-1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0004', 'end');
    });

    /*
     * @tc.number: SUB_PERMISSION_UTILS_0500
     * @tc.name: testPermissionUtils0005
     * @tc.desc: Revoke an unknown permission without damaging the existing grants.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0005', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0005', 'begin');
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission(LOCATION_PERMISSION);
      PermissionUtils.revokePermission(ABSENT_PERMISSION);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0005',
        '#1 assert ' + "expect(PermissionUtils.hasPermission(ABSENT_PERMISSION)).assertFalse()");
      expect(PermissionUtils.hasPermission(ABSENT_PERMISSION)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0005',
        '#2 assert ' + "expect(PermissionUtils.hasPermission(LOCATION_PERMISSION)).assertTrue()");
      expect(PermissionUtils.hasPermission(LOCATION_PERMISSION)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0005',
        '#3 assert ' + "expect(PermissionUtils.hasLocationPermission()).assertTrue()");
      expect(PermissionUtils.hasLocationPermission()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0005',
        '#4 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0005',
        '#5 assert ' + "expect(PermissionUtils.hasBluetoothPermission()).assertFalse()");
      expect(PermissionUtils.hasBluetoothPermission()).assertFalse();
      PermissionUtils.revokePermission('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0005',
        '#6 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0005', 'end');
    });

    // ==================== convenient Bluetooth and location check (1 cases) ====================

    /*
     * @tc.number: SUB_PERMISSION_UTILS_0600
     * @tc.name: testPermissionUtils0006
     * @tc.desc: Bind the convenience checks to their own permission names only.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0006', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0006', 'begin');
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0006',
        '#1 assert ' + "expect(PermissionUtils.hasBluetoothPermission()).assertTrue()");
      expect(PermissionUtils.hasBluetoothPermission()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0006',
        '#2 assert ' + "expect(PermissionUtils.hasLocationPermission()).assertFalse()");
      expect(PermissionUtils.hasLocationPermission()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0006',
        '#3 assert ' + "expect(PermissionUtils.hasPermission(LOCATION_PERMISSION)).assertFalse()");
      expect(PermissionUtils.hasPermission(LOCATION_PERMISSION)).assertFalse();

      PermissionUtils.grantPermission(LOCATION_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0006',
        '#4 assert ' + "expect(PermissionUtils.hasLocationPermission()).assertTrue()");
      expect(PermissionUtils.hasLocationPermission()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0006',
        '#5 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(2)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(2);

      PermissionUtils.revokePermission(BLUETOOTH_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0006',
        '#6 assert ' + "expect(PermissionUtils.hasBluetoothPermission()).assertFalse()");
      expect(PermissionUtils.hasBluetoothPermission()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0006',
        '#7 assert ' + "expect(PermissionUtils.hasLocationPermission()).assertTrue()");
      expect(PermissionUtils.hasLocationPermission()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0006',
        '#8 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0006', 'end');
    });

    // ==================== batch amount request request (3 cases) ====================

    /*
     * @tc.number: SUB_PERMISSION_UTILS_0700
     * @tc.name: testPermissionUtils0007
     * @tc.desc: Request a mixed batch and receive one result entry per requested permission.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0007', 'begin');
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      const recorder: RecordingRequestCallback = new RecordingRequestCallback();
      PermissionUtils.requestPermissions([BLUETOOTH_PERMISSION, LOCATION_PERMISSION, ABSENT_PERMISSION], recorder);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0007',
        '#1 ' + "recorder.callCount" + ' = ' + JSON.stringify(recorder.callCount));
      expect(recorder.callCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0007',
        '#2 ' + "recorder.captured !== null" + ' = ' + JSON.stringify(recorder.captured !== null));
      expect(recorder.captured !== null).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0007',
        '#3 ' + "recorder.captured!.size" + ' = ' + JSON.stringify(recorder.captured!.size));
      expect(recorder.captured!.size).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0007',
        '#4 assert ' + "expect(recorder.captured!.get(BLUETOOTH_PERMISSION)).assertEqual(PermissionStatus.GRANTED)");
      expect(recorder.captured!.get(BLUETOOTH_PERMISSION)).assertEqual(PermissionStatus.GRANTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0007',
        '#5 assert ' + "expect(recorder.captured!.get(LOCATION_PERMISSION)).assertEqual(PermissionStatus.DENIED)");
      expect(recorder.captured!.get(LOCATION_PERMISSION)).assertEqual(PermissionStatus.DENIED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0007',
        '#6 assert ' + "expect(recorder.captured!.get(ABSENT_PERMISSION)).assertEqual(PermissionStatus.DENIED)");
      expect(recorder.captured!.get(ABSENT_PERMISSION)).assertEqual(PermissionStatus.DENIED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0007',
        '#7 assert ' + "expect(recorder.captured!.has(BLUETOOTH_PERMISSION)).assertTrue()");
      expect(recorder.captured!.has(BLUETOOTH_PERMISSION)).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0007', 'end');
    });

    /*
     * @tc.number: SUB_PERMISSION_UTILS_0800
     * @tc.name: testPermissionUtils0008
     * @tc.desc: Request an empty batch and still deliver an empty result map to the caller.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0008', 'begin');
      PermissionUtils.clearAll();
      const recorder: RecordingRequestCallback = new RecordingRequestCallback();
      const empty: string[] = [];
      PermissionUtils.requestPermissions(empty, recorder);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0008',
        '#1 ' + "recorder.callCount" + ' = ' + JSON.stringify(recorder.callCount));
      expect(recorder.callCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0008',
        '#2 ' + "recorder.captured !== null" + ' = ' + JSON.stringify(recorder.captured !== null));
      expect(recorder.captured !== null).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0008',
        '#3 ' + "recorder.captured!.size" + ' = ' + JSON.stringify(recorder.captured!.size));
      expect(recorder.captured!.size).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0008',
        '#4 ' + "empty.length" + ' = ' + JSON.stringify(empty.length));
      expect(empty.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0008',
        '#5 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0008',
        '#6 assert ' + "expect(recorder.captured!.has(BLUETOOTH_PERMISSION)).assertFalse()");
      expect(recorder.captured!.has(BLUETOOTH_PERMISSION)).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0008', 'end');
    });

    /*
     * @tc.number: SUB_PERMISSION_UTILS_0900
     * @tc.name: testPermissionUtils0009
     * @tc.desc: Collapse duplicated names in one request into a single result entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0009', 'begin');
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission(LOCATION_PERMISSION);
      const recorder: RecordingRequestCallback = new RecordingRequestCallback();
      PermissionUtils.requestPermissions(
        [LOCATION_PERMISSION, LOCATION_PERMISSION, ABSENT_PERMISSION], recorder);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0009',
        '#1 ' + "recorder.captured!.size" + ' = ' + JSON.stringify(recorder.captured!.size));
      expect(recorder.captured!.size).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0009',
        '#2 assert ' + "expect(recorder.captured!.get(LOCATION_PERMISSION)).assertEqual(PermissionStatus.GRANTED)");
      expect(recorder.captured!.get(LOCATION_PERMISSION)).assertEqual(PermissionStatus.GRANTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0009',
        '#3 assert ' + "expect(recorder.captured!.get(ABSENT_PERMISSION)).assertEqual(PermissionStatus.DENIED)");
      expect(recorder.captured!.get(ABSENT_PERMISSION)).assertEqual(PermissionStatus.DENIED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0009',
        '#4 ' + "recorder.callCount" + ' = ' + JSON.stringify(recorder.callCount));
      expect(recorder.callCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0009',
        '#5 assert ' + "expect(PermissionUtils.hasLocationPermission()).assertTrue()");
      expect(PermissionUtils.hasLocationPermission()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0009',
        '#6 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);

      const second: RecordingRequestCallback = new RecordingRequestCallback();
      PermissionUtils.requestPermissions([LOCATION_PERMISSION], second);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0009',
        '#7 ' + "second.captured!.size" + ' = ' + JSON.stringify(second.captured!.size));
      expect(second.captured!.size).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0009',
        '#8 assert ' + "expect(second.captured!.get(LOCATION_PERMISSION)).assertEqual(PermissionStatus.GRANTED)");
      expect(second.captured!.get(LOCATION_PERMISSION)).assertEqual(PermissionStatus.GRANTED);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0009', 'end');
    });

    // ==================== result callback (4 cases) ====================

    /*
     * @tc.number: SUB_PERMISSION_UTILS_1000
     * @tc.name: testPermissionUtils0010
     * @tc.desc: Report the granted and denied outcome of every change to the registered observer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0010', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0010', 'begin');
      PermissionUtils.clearAll();
      const recorder: RecordingPermissionCallback = new RecordingPermissionCallback();
      PermissionUtils.addResultCallback(recorder);
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      PermissionUtils.revokePermission(BLUETOOTH_PERMISSION);
      PermissionUtils.grantPermission(LOCATION_PERMISSION);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0010',
        '#1 ' + "recorder.permissions.length" + ' = ' + JSON.stringify(recorder.permissions.length));
      expect(recorder.permissions.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0010',
        '#2 ' + "recorder.statuses[0]" + ' = ' + JSON.stringify(recorder.statuses[0]));
      expect(recorder.statuses[0]).assertEqual(PermissionStatus.GRANTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0010',
        '#3 ' + "recorder.permissions[1]" + ' = ' + JSON.stringify(recorder.permissions[1]));
      expect(recorder.permissions[1]).assertEqual(BLUETOOTH_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0010',
        '#4 ' + "recorder.statuses[1]" + ' = ' + JSON.stringify(recorder.statuses[1]));
      expect(recorder.statuses[1]).assertEqual(PermissionStatus.DENIED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0010',
        '#5 ' + "recorder.permissions[2]" + ' = ' + JSON.stringify(recorder.permissions[2]));
      expect(recorder.permissions[2]).assertEqual(LOCATION_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0010',
        '#6 ' + "recorder.statuses[2]" + ' = ' + JSON.stringify(recorder.statuses[2]));
      expect(recorder.statuses[2]).assertEqual(PermissionStatus.GRANTED);
      PermissionUtils.removeResultCallback(recorder);
      PermissionUtils.clearAll();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0010', 'end');
    });

    /*
     * @tc.number: SUB_PERMISSION_UTILS_1100
     * @tc.name: testPermissionUtils0011
     * @tc.desc: Stop the notifications after removal and accept the removal of unknown observers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0011', 'begin');
      PermissionUtils.clearAll();
      const recorder: RecordingPermissionCallback = new RecordingPermissionCallback();
      const stranger: RecordingPermissionCallback = new RecordingPermissionCallback();
      PermissionUtils.addResultCallback(recorder);
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      PermissionUtils.removeResultCallback(recorder);
      PermissionUtils.removeResultCallback(recorder);
      PermissionUtils.removeResultCallback(stranger);
      PermissionUtils.grantPermission(LOCATION_PERMISSION);
      PermissionUtils.revokePermission(LOCATION_PERMISSION);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0011',
        '#1 ' + "recorder.permissions.length" + ' = ' + JSON.stringify(recorder.permissions.length));
      expect(recorder.permissions.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0011',
        '#2 ' + "recorder.statuses.length" + ' = ' + JSON.stringify(recorder.statuses.length));
      expect(recorder.statuses.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0011',
        '#3 ' + "recorder.permissions[0]" + ' = ' + JSON.stringify(recorder.permissions[0]));
      expect(recorder.permissions[0]).assertEqual(BLUETOOTH_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0011',
        '#4 ' + "stranger.permissions.length" + ' = ' + JSON.stringify(stranger.permissions.length));
      expect(stranger.permissions.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0011',
        '#5 assert ' + "expect(PermissionUtils.hasLocationPermission()).assertFalse()");
      expect(PermissionUtils.hasLocationPermission()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0011',
        '#6 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);
      PermissionUtils.grantPermission(LOCATION_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0011',
        '#7 assert ' + "expect(PermissionUtils.hasLocationPermission()).assertTrue()");
      expect(PermissionUtils.hasLocationPermission()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0011',
        '#8 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(2)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(2);
      PermissionUtils.revokePermission(LOCATION_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0011',
        '#9 assert ' + "expect(PermissionUtils.hasLocationPermission()).assertFalse()");
      expect(PermissionUtils.hasLocationPermission()).assertFalse();
      PermissionUtils.clearAll();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0011', 'end');
    });

    /*
     * @tc.number: SUB_PERMISSION_UTILS_1200
     * @tc.name: testPermissionUtils0012
     * @tc.desc: Keep notifying the healthy observers when one observer raises an error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0012', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0012', 'begin');
      PermissionUtils.clearAll();
      const throwing: ThrowingPermissionCallback = new ThrowingPermissionCallback();
      const survivor: RecordingPermissionCallback = new RecordingPermissionCallback();
      PermissionUtils.addResultCallback(throwing);
      PermissionUtils.addResultCallback(survivor);
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      PermissionUtils.revokePermission(BLUETOOTH_PERMISSION);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0012',
        '#1 ' + "survivor.permissions.length" + ' = ' + JSON.stringify(survivor.permissions.length));
      expect(survivor.permissions.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0012',
        '#2 ' + "survivor.statuses[0]" + ' = ' + JSON.stringify(survivor.statuses[0]));
      expect(survivor.statuses[0]).assertEqual(PermissionStatus.GRANTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0012',
        '#3 ' + "survivor.statuses[1]" + ' = ' + JSON.stringify(survivor.statuses[1]));
      expect(survivor.statuses[1]).assertEqual(PermissionStatus.DENIED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0012',
        '#4 assert ' + "expect(PermissionUtils.hasBluetoothPermission()).assertFalse()");
      expect(PermissionUtils.hasBluetoothPermission()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0012',
        '#5 ' + "survivor.permissions[0]" + ' = ' + JSON.stringify(survivor.permissions[0]));
      expect(survivor.permissions[0]).assertEqual(BLUETOOTH_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0012',
        '#6 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
      PermissionUtils.removeResultCallback(throwing);
      PermissionUtils.removeResultCallback(survivor);
      PermissionUtils.clearAll();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0012', 'end');
    });

    /*
     * @tc.number: SUB_PERMISSION_UTILS_1300
     * @tc.name: testPermissionUtils0013
     * @tc.desc: Request permissions while an observer is registered and emit no result event.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0013', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0013', 'begin');
      PermissionUtils.clearAll();
      const recorder: RecordingPermissionCallback = new RecordingPermissionCallback();
      PermissionUtils.addResultCallback(recorder);
      const requestRecorder: RecordingRequestCallback = new RecordingRequestCallback();
      PermissionUtils.requestPermissions([BLUETOOTH_PERMISSION], requestRecorder);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0013',
        '#1 ' + "recorder.permissions.length" + ' = ' + JSON.stringify(recorder.permissions.length));
      expect(recorder.permissions.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0013',
        '#2 ' + "recorder.statuses.length" + ' = ' + JSON.stringify(recorder.statuses.length));
      expect(recorder.statuses.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0013',
        '#3 ' + "requestRecorder.callCount" + ' = ' + JSON.stringify(requestRecorder.callCount));
      expect(requestRecorder.callCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0013',
        '#4 ' + "requestRecorder.captured!.size" + ' = ' + JSON.stringify(requestRecorder.captured!.size));
      expect(requestRecorder.captured!.size).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0013',
        '#5 assert ' +
        "expect(requestRecorder.captured!.get(BLUETOOTH_PERMISSION)).assertEqual(PermissionStatus.DENIED)");
      expect(requestRecorder.captured!.get(BLUETOOTH_PERMISSION)).assertEqual(PermissionStatus.DENIED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0013',
        '#6 assert ' + "expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertFalse()");
      expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertFalse();
      PermissionUtils.removeResultCallback(recorder);
      PermissionUtils.clearAll();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0013', 'end');
    });

    // ==================== state state describe describe and all amount cleanup (2 cases) ====================

    /*
     * @tc.number: SUB_PERMISSION_UTILS_1400
     * @tc.name: testPermissionUtils0014
     * @tc.desc: Describe each permission status with its display label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPermissionUtils0014', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0014', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0014',
        '#1 assert ' + "expect(PermissionUtils.getStatusLabel(PermissionStatus.GRANTED)).assertEqual('Granted')");
      expect(PermissionUtils.getStatusLabel(PermissionStatus.GRANTED)).assertEqual('Granted');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0014',
        '#2 assert ' + "expect(PermissionUtils.getStatusLabel(PermissionStatus.DENIED)).assertEqual('Denied')");
      expect(PermissionUtils.getStatusLabel(PermissionStatus.DENIED)).assertEqual('Denied');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0014',
        '#3 assert ' + "expect(PermissionUtils.getStatusLabel(PermissionStatus.UNKNOWN)).assertEqual('Unknown')");
      expect(PermissionUtils.getStatusLabel(PermissionStatus.UNKNOWN)).assertEqual('Unknown');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0014',
        '#4 assert ' +
        "expect(PermissionUtils.getStatusLabel(PermissionStatus.GRANTED) === PermissionUtils.getStatusLabel(Permissi" +
        "onStatus.DENIED)).assertFalse()");
      expect(PermissionUtils.getStatusLabel(PermissionStatus.GRANTED)
        === PermissionUtils.getStatusLabel(PermissionStatus.DENIED)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0014',
        '#5 assert ' + "expect(PermissionUtils.getStatusLabel(PermissionStatus.UNKNOWN).length).assertEqual(7)");
      expect(PermissionUtils.getStatusLabel(PermissionStatus.UNKNOWN).length).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0014',
        '#6 assert ' + "expect(PermissionUtils.getStatusLabel(PermissionStatus.DENIED).indexOf('Den')).assertEqual(0)");
      expect(PermissionUtils.getStatusLabel(PermissionStatus.DENIED).indexOf('Den')).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0014', 'end');
    });

    /*
     * @tc.number: SUB_PERMISSION_UTILS_1500
     * @tc.name: testPermissionUtils0015
     * @tc.desc: Clear both the granted permissions and the registered observers in one call.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPermissionUtils0015', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0015', 'begin');
      PermissionUtils.clearAll();
      const recorder: RecordingPermissionCallback = new RecordingPermissionCallback();
      PermissionUtils.addResultCallback(recorder);
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      PermissionUtils.grantPermission(LOCATION_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0015',
        '#1 ' + "recorder.permissions.length" + ' = ' + JSON.stringify(recorder.permissions.length));
      expect(recorder.permissions.length).assertEqual(2);

      PermissionUtils.clearAll();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0015',
        '#2 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0015',
        '#3 assert ' + "expect(PermissionUtils.hasBluetoothPermission()).assertFalse()");
      expect(PermissionUtils.hasBluetoothPermission()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0015',
        '#4 assert ' + "expect(PermissionUtils.hasLocationPermission()).assertFalse()");
      expect(PermissionUtils.hasLocationPermission()).assertFalse();

      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0015',
        '#5 ' + "recorder.permissions.length" + ' = ' + JSON.stringify(recorder.permissions.length));
      expect(recorder.permissions.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0015',
        '#6 assert ' + "expect(PermissionUtils.hasBluetoothPermission()).assertTrue()");
      expect(PermissionUtils.hasBluetoothPermission()).assertTrue();
      PermissionUtils.clearAll();
      PermissionUtils.clearAll();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPermissionUtils0015',
        '#7 assert ' + "expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0)");
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPermissionUtils0015', 'end');
    });
  });
}
