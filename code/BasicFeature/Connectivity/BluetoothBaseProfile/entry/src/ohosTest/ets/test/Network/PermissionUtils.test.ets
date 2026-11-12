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
      PermissionUtils.clearAll();

      expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertFalse();
      expect(PermissionUtils.hasPermission(LOCATION_PERMISSION)).assertFalse();
      expect(PermissionUtils.hasBluetoothPermission()).assertFalse();
      expect(PermissionUtils.hasLocationPermission()).assertFalse();
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
      const probe: RecordingRequestCallback = new RecordingRequestCallback();
      PermissionUtils.requestPermissions([BLUETOOTH_PERMISSION], probe);
      expect(probe.captured!.get(BLUETOOTH_PERMISSION)).assertEqual(PermissionStatus.DENIED);
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
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);

      expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertTrue();
      expect(PermissionUtils.hasBluetoothPermission()).assertTrue();
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);
      expect(PermissionUtils.getGrantedPermissions()[0]).assertEqual(BLUETOOTH_PERMISSION);
      expect(PermissionUtils.hasPermission(LOCATION_PERMISSION)).assertFalse();

      PermissionUtils.revokePermission(BLUETOOTH_PERMISSION);
      expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertFalse();
      expect(PermissionUtils.hasBluetoothPermission()).assertFalse();
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
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
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);

      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);
      expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertTrue();
      PermissionUtils.revokePermission(BLUETOOTH_PERMISSION);
      expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertFalse();
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
      PermissionUtils.revokePermission(BLUETOOTH_PERMISSION);
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
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
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission('ohos.permission.first');
      PermissionUtils.grantPermission('ohos.permission.second');
      PermissionUtils.grantPermission('ohos.permission.third');

      const listed: string[] = PermissionUtils.getGrantedPermissions();
      expect(listed.length).assertEqual(3);
      expect(listed[0]).assertEqual('ohos.permission.first');
      expect(listed[1]).assertEqual('ohos.permission.second');
      expect(listed[2]).assertEqual('ohos.permission.third');

      listed.push('ohos.permission.injected');
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(3);
      expect(PermissionUtils.hasPermission('ohos.permission.injected')).assertFalse();
      expect(PermissionUtils.getGrantedPermissions().indexOf('ohos.permission.injected')).assertEqual(-1);
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
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission(LOCATION_PERMISSION);
      PermissionUtils.revokePermission(ABSENT_PERMISSION);

      expect(PermissionUtils.hasPermission(ABSENT_PERMISSION)).assertFalse();
      expect(PermissionUtils.hasPermission(LOCATION_PERMISSION)).assertTrue();
      expect(PermissionUtils.hasLocationPermission()).assertTrue();
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);
      expect(PermissionUtils.hasBluetoothPermission()).assertFalse();
      PermissionUtils.revokePermission('');
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);
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
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);

      expect(PermissionUtils.hasBluetoothPermission()).assertTrue();
      expect(PermissionUtils.hasLocationPermission()).assertFalse();
      expect(PermissionUtils.hasPermission(LOCATION_PERMISSION)).assertFalse();

      PermissionUtils.grantPermission(LOCATION_PERMISSION);
      expect(PermissionUtils.hasLocationPermission()).assertTrue();
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(2);

      PermissionUtils.revokePermission(BLUETOOTH_PERMISSION);
      expect(PermissionUtils.hasBluetoothPermission()).assertFalse();
      expect(PermissionUtils.hasLocationPermission()).assertTrue();
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);
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
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      const recorder: RecordingRequestCallback = new RecordingRequestCallback();
      PermissionUtils.requestPermissions([BLUETOOTH_PERMISSION, LOCATION_PERMISSION, ABSENT_PERMISSION], recorder);

      expect(recorder.callCount).assertEqual(1);
      expect(recorder.captured !== null).assertTrue();
      expect(recorder.captured!.size).assertEqual(3);
      expect(recorder.captured!.get(BLUETOOTH_PERMISSION)).assertEqual(PermissionStatus.GRANTED);
      expect(recorder.captured!.get(LOCATION_PERMISSION)).assertEqual(PermissionStatus.DENIED);
      expect(recorder.captured!.get(ABSENT_PERMISSION)).assertEqual(PermissionStatus.DENIED);
      expect(recorder.captured!.has(BLUETOOTH_PERMISSION)).assertTrue();
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
      PermissionUtils.clearAll();
      const recorder: RecordingRequestCallback = new RecordingRequestCallback();
      const empty: string[] = [];
      PermissionUtils.requestPermissions(empty, recorder);

      expect(recorder.callCount).assertEqual(1);
      expect(recorder.captured !== null).assertTrue();
      expect(recorder.captured!.size).assertEqual(0);
      expect(empty.length).assertEqual(0);
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
      expect(recorder.captured!.has(BLUETOOTH_PERMISSION)).assertFalse();
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
      PermissionUtils.clearAll();
      PermissionUtils.grantPermission(LOCATION_PERMISSION);
      const recorder: RecordingRequestCallback = new RecordingRequestCallback();
      PermissionUtils.requestPermissions(
        [LOCATION_PERMISSION, LOCATION_PERMISSION, ABSENT_PERMISSION], recorder);

      expect(recorder.captured!.size).assertEqual(2);
      expect(recorder.captured!.get(LOCATION_PERMISSION)).assertEqual(PermissionStatus.GRANTED);
      expect(recorder.captured!.get(ABSENT_PERMISSION)).assertEqual(PermissionStatus.DENIED);
      expect(recorder.callCount).assertEqual(1);
      expect(PermissionUtils.hasLocationPermission()).assertTrue();
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);

      const second: RecordingRequestCallback = new RecordingRequestCallback();
      PermissionUtils.requestPermissions([LOCATION_PERMISSION], second);
      expect(second.captured!.size).assertEqual(1);
      expect(second.captured!.get(LOCATION_PERMISSION)).assertEqual(PermissionStatus.GRANTED);
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
      PermissionUtils.clearAll();
      const recorder: RecordingPermissionCallback = new RecordingPermissionCallback();
      PermissionUtils.addResultCallback(recorder);
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      PermissionUtils.revokePermission(BLUETOOTH_PERMISSION);
      PermissionUtils.grantPermission(LOCATION_PERMISSION);

      expect(recorder.permissions.length).assertEqual(3);
      expect(recorder.statuses[0]).assertEqual(PermissionStatus.GRANTED);
      expect(recorder.permissions[1]).assertEqual(BLUETOOTH_PERMISSION);
      expect(recorder.statuses[1]).assertEqual(PermissionStatus.DENIED);
      expect(recorder.permissions[2]).assertEqual(LOCATION_PERMISSION);
      expect(recorder.statuses[2]).assertEqual(PermissionStatus.GRANTED);
      PermissionUtils.removeResultCallback(recorder);
      PermissionUtils.clearAll();
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

      expect(recorder.permissions.length).assertEqual(1);
      expect(recorder.statuses.length).assertEqual(1);
      expect(recorder.permissions[0]).assertEqual(BLUETOOTH_PERMISSION);
      expect(stranger.permissions.length).assertEqual(0);
      expect(PermissionUtils.hasLocationPermission()).assertFalse();
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(1);
      PermissionUtils.grantPermission(LOCATION_PERMISSION);
      expect(PermissionUtils.hasLocationPermission()).assertTrue();
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(2);
      PermissionUtils.revokePermission(LOCATION_PERMISSION);
      expect(PermissionUtils.hasLocationPermission()).assertFalse();
      PermissionUtils.clearAll();
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
      PermissionUtils.clearAll();
      const throwing: ThrowingPermissionCallback = new ThrowingPermissionCallback();
      const survivor: RecordingPermissionCallback = new RecordingPermissionCallback();
      PermissionUtils.addResultCallback(throwing);
      PermissionUtils.addResultCallback(survivor);
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      PermissionUtils.revokePermission(BLUETOOTH_PERMISSION);

      expect(survivor.permissions.length).assertEqual(2);
      expect(survivor.statuses[0]).assertEqual(PermissionStatus.GRANTED);
      expect(survivor.statuses[1]).assertEqual(PermissionStatus.DENIED);
      expect(PermissionUtils.hasBluetoothPermission()).assertFalse();
      expect(survivor.permissions[0]).assertEqual(BLUETOOTH_PERMISSION);
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
      PermissionUtils.removeResultCallback(throwing);
      PermissionUtils.removeResultCallback(survivor);
      PermissionUtils.clearAll();
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
      PermissionUtils.clearAll();
      const recorder: RecordingPermissionCallback = new RecordingPermissionCallback();
      PermissionUtils.addResultCallback(recorder);
      const requestRecorder: RecordingRequestCallback = new RecordingRequestCallback();
      PermissionUtils.requestPermissions([BLUETOOTH_PERMISSION], requestRecorder);

      expect(recorder.permissions.length).assertEqual(0);
      expect(recorder.statuses.length).assertEqual(0);
      expect(requestRecorder.callCount).assertEqual(1);
      expect(requestRecorder.captured!.size).assertEqual(1);
      expect(requestRecorder.captured!.get(BLUETOOTH_PERMISSION)).assertEqual(PermissionStatus.DENIED);
      expect(PermissionUtils.hasPermission(BLUETOOTH_PERMISSION)).assertFalse();
      PermissionUtils.removeResultCallback(recorder);
      PermissionUtils.clearAll();
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
      expect(PermissionUtils.getStatusLabel(PermissionStatus.GRANTED)).assertEqual('Granted');
      expect(PermissionUtils.getStatusLabel(PermissionStatus.DENIED)).assertEqual('Denied');
      expect(PermissionUtils.getStatusLabel(PermissionStatus.UNKNOWN)).assertEqual('Unknown');
      expect(PermissionUtils.getStatusLabel(PermissionStatus.GRANTED)
        === PermissionUtils.getStatusLabel(PermissionStatus.DENIED)).assertFalse();
      expect(PermissionUtils.getStatusLabel(PermissionStatus.UNKNOWN).length).assertEqual(7);
      expect(PermissionUtils.getStatusLabel(PermissionStatus.DENIED).indexOf('Den')).assertEqual(0);
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
      PermissionUtils.clearAll();
      const recorder: RecordingPermissionCallback = new RecordingPermissionCallback();
      PermissionUtils.addResultCallback(recorder);
      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      PermissionUtils.grantPermission(LOCATION_PERMISSION);
      expect(recorder.permissions.length).assertEqual(2);

      PermissionUtils.clearAll();
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
      expect(PermissionUtils.hasBluetoothPermission()).assertFalse();
      expect(PermissionUtils.hasLocationPermission()).assertFalse();

      PermissionUtils.grantPermission(BLUETOOTH_PERMISSION);
      expect(recorder.permissions.length).assertEqual(2);
      expect(PermissionUtils.hasBluetoothPermission()).assertTrue();
      PermissionUtils.clearAll();
      PermissionUtils.clearAll();
      expect(PermissionUtils.getGrantedPermissions().length).assertEqual(0);
    });
  });
}
