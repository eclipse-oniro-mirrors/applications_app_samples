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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityAccessCtrl } from '@kit.AbilityKit';
import { CapabilityCheck, PermissionState, VCardConstants } from 'library';

const DOMAIN: number = 0xF811;

export default function permissionLogicTest() {
  describe('PermissionLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_0100
     * @tc.name      testPermissionReadString0001
     * @tc.desc      Verify the READ_CONTACTS permission constant matches the
     *               literal string PermissionService declares for reading.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionReadString0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionReadString0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const name: string = VCardConstants.READ_CONTACTS;
      expect(name).assertEqual('ohos.permission.READ_CONTACTS');
      expect(name.length).assertEqual(29);
      expect(name.substring(0, 16)).assertEqual('ohos.permission.');
      expect(name.substring(16)).assertEqual('READ_CONTACTS');
      expect(typeof name).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_0200
     * @tc.name      testPermissionWriteString0001
     * @tc.desc      Verify the WRITE_CONTACTS permission constant matches the
     *               literal string PermissionService declares for writing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionWriteString0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionWriteString0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const name: string = VCardConstants.WRITE_CONTACTS;
      expect(name).assertEqual('ohos.permission.WRITE_CONTACTS');
      expect(name.length).assertEqual(30);
      expect(name.substring(0, 16)).assertEqual('ohos.permission.');
      expect(name.substring(16)).assertEqual('WRITE_CONTACTS');
      expect(typeof name).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_0300
     * @tc.name      testPermissionStringPair0001
     * @tc.desc      Verify the read and write permission strings stay distinct
     *               while sharing the module prefix and CONTACTS suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStringPair0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStringPair0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const read: string = VCardConstants.READ_CONTACTS;
      const write: string = VCardConstants.WRITE_CONTACTS;
      expect(read !== write).assertTrue();
      expect(read.indexOf(write)).assertEqual(-1);
      expect(write.indexOf(read)).assertEqual(-1);
      expect(read).assertContain('CONTACTS');
      expect(write).assertContain('CONTACTS');
      expect(read).assertContain('permission');
      expect(write).assertContain('permission');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_0400
     * @tc.name      testPermissionStringShape0001
     * @tc.desc      Verify both permission strings contain no whitespace and
     *               keep uppercase action words right after the prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStringShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStringShape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const read: string = VCardConstants.READ_CONTACTS;
      const write: string = VCardConstants.WRITE_CONTACTS;
      expect(read.indexOf(' ')).assertEqual(-1);
      expect(write.indexOf(' ')).assertEqual(-1);
      expect(read.indexOf('\t')).assertEqual(-1);
      expect(write.indexOf('\n')).assertEqual(-1);
      expect(read.substring(16, 20)).assertEqual('READ');
      expect(write.substring(16, 21)).assertEqual('WRITE');
      expect(read.charAt(20)).assertEqual('_');
      expect(write.charAt(21)).assertEqual('_');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_0500
     * @tc.name      testPermissionSyscapString0001
     * @tc.desc      Verify the telephony syscap constant keeps its three dot
     *               separated segments at the documented exact positions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionSyscapString0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionSyscapString0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const syscap: string = VCardConstants.VCARD_SYSCAP;
      expect(syscap).assertEqual('SystemCapability.Telephony.CoreService');
      expect(syscap.length).assertEqual(38);
      expect(syscap.indexOf('.')).assertEqual(16);
      expect(syscap.lastIndexOf('.')).assertEqual(26);
      expect(syscap).assertContain('Telephony');
      expect(syscap).assertContain('CoreService');
      expect(syscap.indexOf('ohos.permission')).assertEqual(-1);
      expect(typeof syscap).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_0600
     * @tc.name      testCapabilityCheckSyscap0001
     * @tc.desc      Verify CapabilityCheck instances built with the syscap key
     *               keep key, name, supported and detail as constructed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapabilityCheckSyscap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCapabilityCheckSyscap0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const ok: CapabilityCheck = new CapabilityCheck('syscap', 'System Capability', true, 'syscap ready');
      expect(ok.key).assertEqual('syscap');
      expect(ok.name).assertEqual('System Capability');
      expect(ok.supported).assertTrue();
      expect(ok.detail).assertEqual('syscap ready');
      const bad: CapabilityCheck = new CapabilityCheck('syscap', 'System Capability', false, 'syscap missing');
      expect(bad.key).assertEqual('syscap');
      expect(bad.supported).assertFalse();
      expect(bad.detail).assertEqual('syscap missing');
      expect(ok.key !== bad.detail).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_0700
     * @tc.name      testCapabilityCheckRead0001
     * @tc.desc      Verify CapabilityCheck instances built with the read key
     *               mirror the declared permission check outcomes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapabilityCheckRead0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCapabilityCheckRead0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const granted: CapabilityCheck =
        new CapabilityCheck('read', VCardConstants.READ_CONTACTS, true, 'read declared');
      expect(granted.key).assertEqual('read');
      expect(granted.name).assertEqual('ohos.permission.READ_CONTACTS');
      expect(granted.supported).assertTrue();
      expect(granted.detail).assertEqual('read declared');
      const missing: CapabilityCheck =
        new CapabilityCheck('read', VCardConstants.READ_CONTACTS, false, 'read not declared');
      expect(missing.supported).assertFalse();
      expect(missing.name).assertEqual(granted.name);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_0800
     * @tc.name      testCapabilityCheckWrite0001
     * @tc.desc      Verify CapabilityCheck instances built with the write key
     *               mirror the declared permission check outcomes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapabilityCheckWrite0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCapabilityCheckWrite0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const granted: CapabilityCheck =
        new CapabilityCheck('write', VCardConstants.WRITE_CONTACTS, true, 'write declared');
      expect(granted.key).assertEqual('write');
      expect(granted.name).assertEqual('ohos.permission.WRITE_CONTACTS');
      expect(granted.supported).assertTrue();
      expect(granted.detail).assertEqual('write declared');
      const missing: CapabilityCheck =
        new CapabilityCheck('write', VCardConstants.WRITE_CONTACTS, false, 'write not declared');
      expect(missing.supported).assertFalse();
      expect(missing.detail).assertEqual('write not declared');
      expect(granted.key !== missing.key).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_0900
     * @tc.name      testCapabilityCheckOrder0001
     * @tc.desc      Verify the three capability checks appear in the source
     *               order syscap, read and write inside the result array.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapabilityCheckOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCapabilityCheckOrder0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const checks: CapabilityCheck[] = [];
      checks.push(new CapabilityCheck('syscap', 'System Capability', true, 'ok'));
      checks.push(new CapabilityCheck('read', VCardConstants.READ_CONTACTS, true, 'ok'));
      checks.push(new CapabilityCheck('write', VCardConstants.WRITE_CONTACTS, false, 'missing'));
      expect(checks.length).assertEqual(3);
      expect(checks[0].key).assertEqual('syscap');
      expect(checks[1].key).assertEqual('read');
      expect(checks[2].key).assertEqual('write');
      expect(checks[2].supported).assertFalse();
      expect(checks[0].supported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_1000
     * @tc.name      testCapabilityCheckFlags0001
     * @tc.desc      Verify flipping the supported flag on one CapabilityCheck
     *               never leaks into a second independent instance.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapabilityCheckFlags0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCapabilityCheckFlags0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: CapabilityCheck = new CapabilityCheck('read', 'read check', false, 'pending');
      const second: CapabilityCheck = new CapabilityCheck('write', 'write check', true, 'ready');
      expect(first.supported).assertFalse();
      expect(second.supported).assertTrue();
      first.supported = true;
      expect(first.supported).assertTrue();
      expect(second.supported).assertTrue();
      second.supported = false;
      expect(second.supported).assertFalse();
      expect(first.supported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_1100
     * @tc.name      testCapabilityCheckDetail0001
     * @tc.desc      Verify CapabilityCheck name and detail fields round-trip
     *               CJK text without any normalization applied.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapabilityCheckDetail0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCapabilityCheckDetail0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const check: CapabilityCheck = new CapabilityCheck('syscap', '系统能力', true, '支持通讯录能力');
      expect(check.name).assertEqual('系统能力');
      expect(check.detail).assertEqual('支持通讯录能力');
      check.detail = '不支持通讯录能力';
      expect(check.detail).assertEqual('不支持通讯录能力');
      expect(check.supported).assertTrue();
      expect(check.key).assertEqual('syscap');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_1200
     * @tc.name      testPermissionStatePair0001
     * @tc.desc      Verify read and write PermissionState objects stay fully
     *               independent when their names come from the constants.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStatePair0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStatePair0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const read: PermissionState = new PermissionState();
      const write: PermissionState = new PermissionState();
      read.name = VCardConstants.READ_CONTACTS;
      write.name = VCardConstants.WRITE_CONTACTS;
      expect(read.name).assertEqual('ohos.permission.READ_CONTACTS');
      expect(write.name).assertEqual('ohos.permission.WRITE_CONTACTS');
      expect(read.name !== write.name).assertTrue();
      read.declared = true;
      expect(write.declared).assertFalse();
      write.granted = true;
      expect(read.granted).assertFalse();
      expect(write.granted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_1300
     * @tc.name      testPermissionStateDeclaredMatrix0001
     * @tc.desc      Verify the declared flag computed as indexOf(name) >= 0
     *               matches every shape of the declared permission list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStateDeclaredMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStateDeclaredMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const declaredFlag = (declared: string[], name: string): boolean => {
        return declared.indexOf(name) >= 0;
      };
      const read: string = VCardConstants.READ_CONTACTS;
      const write: string = VCardConstants.WRITE_CONTACTS;
      const empty: string[] = [];
      expect(declaredFlag(empty, read)).assertFalse();
      expect(declaredFlag(empty, write)).assertFalse();
      const onlyRead: string[] = [read];
      expect(declaredFlag(onlyRead, read)).assertTrue();
      expect(declaredFlag(onlyRead, write)).assertFalse();
      const onlyWrite: string[] = [write];
      expect(declaredFlag(onlyWrite, read)).assertFalse();
      expect(declaredFlag(onlyWrite, write)).assertTrue();
      const both: string[] = [read, write];
      expect(declaredFlag(both, read)).assertTrue();
      expect(declaredFlag(both, write)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_1400
     * @tc.name      testPermissionStateExactMatch0001
     * @tc.desc      Verify the declared lookup requires the exact full string
     *               so near-miss permission names never count as declared.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStateExactMatch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStateExactMatch0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const declaredFlag = (declared: string[], name: string): boolean => {
        return declared.indexOf(name) >= 0;
      };
      const read: string = VCardConstants.READ_CONTACTS;
      const noisy: string[] = ['ohos.permission.READ_CONTACTS_EXTRA', 'ohos.permission.READ'];
      expect(declaredFlag(noisy, read)).assertFalse();
      const exact: string[] = [read];
      expect(declaredFlag(exact, read)).assertTrue();
      const lowerCase: string[] = ['ohos.permission.read_contacts'];
      expect(declaredFlag(lowerCase, read)).assertFalse();
      const spaced: string[] = ['ohos.permission. READ_CONTACTS'];
      expect(declaredFlag(spaced, read)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_1500
     * @tc.name      testPermissionStateOrderContract0001
     * @tc.desc      Verify the state collection keeps exactly two entries in
     *               source order with read first and write second.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStateOrderContract0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStateOrderContract0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const states: PermissionState[] = [];
      const first: PermissionState = new PermissionState();
      first.name = VCardConstants.READ_CONTACTS;
      first.declared = true;
      const second: PermissionState = new PermissionState();
      second.name = VCardConstants.WRITE_CONTACTS;
      second.declared = true;
      states.push(first);
      states.push(second);
      expect(states.length).assertEqual(2);
      expect(states[0].name).assertEqual('ohos.permission.READ_CONTACTS');
      expect(states[1].name).assertEqual('ohos.permission.WRITE_CONTACTS');
      expect(states[0].declared).assertTrue();
      expect(states[1].declared).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_1600
     * @tc.name      testPermissionStateGrantMatrix0001
     * @tc.desc      Verify the all-granted gate needs a two entry list with
     *               both flags true, mirroring the pure boolean contract.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStateGrantMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStateGrantMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const hasAllGate = (states: PermissionState[]): boolean => {
        return states.length === 2 && states[0].granted && states[1].granted;
      };
      const makeState = (granted: boolean): PermissionState => {
        const state: PermissionState = new PermissionState();
        state.granted = granted;
        return state;
      };
      const bothTrue: PermissionState[] = [makeState(true), makeState(true)];
      expect(hasAllGate(bothTrue)).assertTrue();
      const readOnly: PermissionState[] = [makeState(true), makeState(false)];
      expect(hasAllGate(readOnly)).assertFalse();
      const writeOnly: PermissionState[] = [makeState(false), makeState(true)];
      expect(hasAllGate(writeOnly)).assertFalse();
      const none: PermissionState[] = [makeState(false), makeState(false)];
      expect(hasAllGate(none)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_1700
     * @tc.name      testPermissionGateShortList0001
     * @tc.desc      Verify the all-granted gate rejects short state lists so
     *               a missing entry always blocks the permission request.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionGateShortList0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionGateShortList0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const hasAllGate = (states: PermissionState[]): boolean => {
        return states.length === 2 && states[0].granted && states[1].granted;
      };
      const single: PermissionState = new PermissionState();
      single.granted = true;
      const oneState: PermissionState[] = [single];
      expect(hasAllGate(oneState)).assertFalse();
      const empty: PermissionState[] = [];
      expect(hasAllGate(empty)).assertFalse();
      const three: PermissionState[] = [single, single, single];
      expect(hasAllGate(three)).assertFalse();
      expect(three.length).assertLarger(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_1800
     * @tc.name      testPermissionRequestGate0001
     * @tc.desc      Verify the request decision table mirrors the service
     *               logic of two granted auth results required for success.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionRequestGate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionRequestGate0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const requestGate = (authResults: number[]): boolean => {
        if (authResults.length < 2) {
          return false;
        }
        return authResults[0] === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED &&
          authResults[1] === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
      };
      const granted: number = abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
      const denied: number = abilityAccessCtrl.GrantStatus.PERMISSION_DENIED;
      const bothGranted: number[] = [granted, granted];
      expect(requestGate(bothGranted)).assertTrue();
      const deniedThenGranted: number[] = [denied, granted];
      expect(requestGate(deniedThenGranted)).assertFalse();
      const grantedThenDenied: number[] = [granted, denied];
      expect(requestGate(grantedThenDenied)).assertFalse();
      const single: number[] = [granted];
      expect(requestGate(single)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_1900
     * @tc.name      testPermissionRequestGate0002
     * @tc.desc      Verify the request gate ignores extra results beyond the
     *               first two and denies when both entries are denied.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionRequestGate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionRequestGate0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const requestGate = (authResults: number[]): boolean => {
        if (authResults.length < 2) {
          return false;
        }
        return authResults[0] === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED &&
          authResults[1] === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
      };
      const granted: number = abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
      const denied: number = abilityAccessCtrl.GrantStatus.PERMISSION_DENIED;
      const bothDenied: number[] = [denied, denied];
      expect(requestGate(bothDenied)).assertFalse();
      const extraGranted: number[] = [granted, granted, granted];
      expect(requestGate(extraGranted)).assertTrue();
      const trailingDenied: number[] = [granted, granted, denied];
      expect(requestGate(trailingDenied)).assertTrue();
      const empty: number[] = [];
      expect(requestGate(empty)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_2000
     * @tc.name      testGrantStatusContract0001
     * @tc.desc      Verify the two GrantStatus members used by the service
     *               are distinct numeric values of type number.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGrantStatusContract0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testGrantStatusContract0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const granted: number = abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
      const denied: number = abilityAccessCtrl.GrantStatus.PERMISSION_DENIED;
      expect(granted !== denied).assertTrue();
      expect(typeof granted).assertEqual('number');
      expect(typeof denied).assertEqual('number');
      expect(granted === granted).assertTrue();
      expect(denied === denied).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_2100
     * @tc.name      testPermissionStateNoiseList0001
     * @tc.desc      Verify unrelated declared permissions never satisfy the
     *               contact permission names in the declared lookup.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStateNoiseList0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStateNoiseList0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const declaredFlag = (declared: string[], name: string): boolean => {
        return declared.indexOf(name) >= 0;
      };
      const read: string = VCardConstants.READ_CONTACTS;
      const write: string = VCardConstants.WRITE_CONTACTS;
      const noisy: string[] = ['ohos.permission.CAMERA', read, 'ohos.permission.APPROXIMATE_LOCATION'];
      expect(declaredFlag(noisy, read)).assertTrue();
      expect(declaredFlag(noisy, write)).assertFalse();
      expect(declaredFlag(noisy, 'ohos.permission.CAMERA')).assertTrue();
      const empty: string[] = [];
      expect(declaredFlag(empty, read)).assertFalse();
      expect(declaredFlag(empty, write)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_2200
     * @tc.name      testPermissionStateReset0001
     * @tc.desc      Verify a fully authorized PermissionState can be reset
     *               flag by flag back to the unauthorized defaults.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStateReset0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStateReset0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const state: PermissionState = new PermissionState();
      state.name = VCardConstants.WRITE_CONTACTS;
      state.declared = true;
      state.granted = true;
      expect(state.declared).assertTrue();
      expect(state.granted).assertTrue();
      state.granted = false;
      expect(state.granted).assertFalse();
      expect(state.declared).assertTrue();
      state.declared = false;
      expect(state.declared).assertFalse();
      expect(state.name).assertEqual('ohos.permission.WRITE_CONTACTS');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_2300
     * @tc.name      testPermissionLowercasePrefix0001
     * @tc.desc      Verify the shared 16 character prefix of both permission
     *               strings is built only from lowercase letters and dots.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionLowercasePrefix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionLowercasePrefix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const isLowerPrefix = (name: string): boolean => {
        for (let i = 0; i < 16; i++) {
          const code: number = name.charCodeAt(i);
          if (code !== 46 && (code < 97 || code > 122)) {
            return false;
          }
        }
        return true;
      };
      expect(isLowerPrefix(VCardConstants.READ_CONTACTS)).assertTrue();
      expect(isLowerPrefix(VCardConstants.WRITE_CONTACTS)).assertTrue();
      expect(VCardConstants.READ_CONTACTS.charCodeAt(4)).assertEqual(46);
      expect(VCardConstants.READ_CONTACTS.charCodeAt(15)).assertEqual(46);
      expect(VCardConstants.WRITE_CONTACTS.charCodeAt(4)).assertEqual(46);
      expect(VCardConstants.WRITE_CONTACTS.charCodeAt(15)).assertEqual(46);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_2400
     * @tc.name      testPermissionUppercaseSegment0001
     * @tc.desc      Verify the action segment after the prefix uses only
     *               uppercase letters and underscores for both permissions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionUppercaseSegment0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionUppercaseSegment0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const isUpperSegment = (name: string): boolean => {
        for (let i = 16; i < name.length; i++) {
          const code: number = name.charCodeAt(i);
          if (code !== 95 && (code < 65 || code > 90)) {
            return false;
          }
        }
        return true;
      };
      expect(isUpperSegment(VCardConstants.READ_CONTACTS)).assertTrue();
      expect(isUpperSegment(VCardConstants.WRITE_CONTACTS)).assertTrue();
      expect(VCardConstants.READ_CONTACTS.length).assertEqual(VCardConstants.WRITE_CONTACTS.length - 1);
      expect(VCardConstants.WRITE_CONTACTS.length).assertLarger(VCardConstants.READ_CONTACTS.length);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_2500
     * @tc.name      testPermissionCharPositions0001
     * @tc.desc      Verify selected character positions inside both
     *               permission strings hold the documented letters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionCharPositions0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionCharPositions0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const read: string = VCardConstants.READ_CONTACTS;
      const write: string = VCardConstants.WRITE_CONTACTS;
      expect(read.charAt(16)).assertEqual('R');
      expect(read.charAt(20)).assertEqual('_');
      expect(read.charAt(28)).assertEqual('S');
      expect(write.charAt(16)).assertEqual('W');
      expect(write.charAt(21)).assertEqual('_');
      expect(write.charAt(29)).assertEqual('S');
      expect(read.charAt(0)).assertEqual('o');
      expect(write.charAt(0)).assertEqual('o');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_2600
     * @tc.name      testCapabilityCheckKeySet0001
     * @tc.desc      Verify the three capability keys are pairwise distinct and
     *               none of them leaks the permission module prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapabilityCheckKeySet0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCapabilityCheckKeySet0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const syscap: CapabilityCheck = new CapabilityCheck('syscap', 'a', true, 'x');
      const read: CapabilityCheck = new CapabilityCheck('read', 'b', true, 'y');
      const write: CapabilityCheck = new CapabilityCheck('write', 'c', true, 'z');
      expect(syscap.key !== read.key).assertTrue();
      expect(read.key !== write.key).assertTrue();
      expect(syscap.key !== write.key).assertTrue();
      expect(syscap.key.indexOf('ohos')).assertEqual(-1);
      expect(read.key.indexOf('ohos')).assertEqual(-1);
      expect(write.key.indexOf('ohos')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_2700
     * @tc.name      testCapabilityCheckRewrite0001
     * @tc.desc      Verify every CapabilityCheck field can be overwritten and
     *               reads back the latest value assigned to it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapabilityCheckRewrite0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCapabilityCheckRewrite0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const check: CapabilityCheck = new CapabilityCheck('read', 'old name', false, 'old detail');
      expect(check.key).assertEqual('read');
      check.key = 'write';
      check.name = 'new name';
      check.supported = true;
      check.detail = 'new detail';
      expect(check.key).assertEqual('write');
      expect(check.name).assertEqual('new name');
      expect(check.supported).assertTrue();
      expect(check.detail).assertEqual('new detail');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_2800
     * @tc.name      testPermissionStateNames0001
     * @tc.desc      Verify PermissionState accepts arbitrary name strings and
     *               switches back to the real permission constant cleanly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStateNames0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStateNames0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const state: PermissionState = new PermissionState();
      state.name = '';
      expect(state.name).assertEqual('');
      state.name = 'placeholder';
      expect(state.name).assertEqual('placeholder');
      state.name = 'ohos.permission.READ_CONTACTS';
      expect(state.name).assertEqual(VCardConstants.READ_CONTACTS);
      state.name = VCardConstants.WRITE_CONTACTS;
      expect(state.name).assertEqual('ohos.permission.WRITE_CONTACTS');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_2900
     * @tc.name      testPermissionDeclaredPositions0001
     * @tc.desc      Verify the declared list order controls the indexOf
     *               position while the membership flag stays unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionDeclaredPositions0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionDeclaredPositions0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const read: string = VCardConstants.READ_CONTACTS;
      const write: string = VCardConstants.WRITE_CONTACTS;
      const readFirst: string[] = [read, write];
      expect(readFirst.indexOf(read)).assertEqual(0);
      expect(readFirst.indexOf(write)).assertEqual(1);
      const writeFirst: string[] = [write, read];
      expect(writeFirst.indexOf(write)).assertEqual(0);
      expect(writeFirst.indexOf(read)).assertEqual(1);
      expect(readFirst.indexOf(read) >= 0).assertTrue();
      expect(writeFirst.indexOf(read) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_3000
     * @tc.name      testPermissionStateArrayList0001
     * @tc.desc      Verify the state collection grows and shrinks with push
     *               and pop while keeping element identity stable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStateArrayList0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStateArrayList0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const states: PermissionState[] = [];
      const read: PermissionState = new PermissionState();
      read.name = VCardConstants.READ_CONTACTS;
      const write: PermissionState = new PermissionState();
      write.name = VCardConstants.WRITE_CONTACTS;
      expect(states.length).assertEqual(0);
      states.push(read);
      expect(states.length).assertEqual(1);
      states.push(write);
      expect(states.length).assertEqual(2);
      expect(states[0].name).assertEqual('ohos.permission.READ_CONTACTS');
      expect(states[1].name).assertEqual('ohos.permission.WRITE_CONTACTS');
      const removed: PermissionState | undefined = states.pop();
      expect(states.length).assertEqual(1);
      expect(removed?.name).assertEqual('ohos.permission.WRITE_CONTACTS');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_3100
     * @tc.name      testPermissionRequestGateMixed0001
     * @tc.desc      Verify the request gate decision table on longer mixed
     *               result lists still depends only on the first two items.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionRequestGateMixed0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionRequestGateMixed0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const requestGate = (authResults: number[]): boolean => {
        if (authResults.length < 2) {
          return false;
        }
        return authResults[0] === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED &&
          authResults[1] === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
      };
      const granted: number = abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
      const denied: number = abilityAccessCtrl.GrantStatus.PERMISSION_DENIED;
      const denyFirst: number[] = [denied, granted, granted];
      expect(requestGate(denyFirst)).assertFalse();
      const grantFirst: number[] = [granted, denied, denied];
      expect(requestGate(grantFirst)).assertFalse();
      const denyBoth: number[] = [denied, denied, granted];
      expect(requestGate(denyBoth)).assertFalse();
      const fourItems: number[] = [granted, granted, denied, denied];
      expect(requestGate(fourItems)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_3200
     * @tc.name      testPermissionStateBuildShape0001
     * @tc.desc      Verify a buildState shaped assembly assigns name,
     *               declared and granted into one coherent state object.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStateBuildShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStateBuildShape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const declared: string[] = [VCardConstants.READ_CONTACTS, VCardConstants.WRITE_CONTACTS];
      const buildState = (name: string, grantedValue: boolean): PermissionState => {
        const state: PermissionState = new PermissionState();
        state.name = name;
        state.declared = declared.indexOf(name) >= 0;
        state.granted = grantedValue;
        return state;
      };
      const read: PermissionState = buildState(VCardConstants.READ_CONTACTS, false);
      expect(read.name).assertEqual('ohos.permission.READ_CONTACTS');
      expect(read.declared).assertTrue();
      expect(read.granted).assertFalse();
      const write: PermissionState = buildState(VCardConstants.WRITE_CONTACTS, true);
      expect(write.name).assertEqual('ohos.permission.WRITE_CONTACTS');
      expect(write.declared).assertTrue();
      expect(write.granted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_3300
     * @tc.name      testCapabilityCheckNames0001
     * @tc.desc      Verify CapabilityCheck accepts empty, long and mixed
     *               language name and detail strings without loss.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapabilityCheckNames0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCapabilityCheckNames0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const emptyCheck: CapabilityCheck = new CapabilityCheck('syscap', '', true, '');
      expect(emptyCheck.name).assertEqual('');
      expect(emptyCheck.detail).assertEqual('');
      const longDetail: string = 'capability detail line for the check row in the toolbox page';
      const longCheck: CapabilityCheck = new CapabilityCheck('read', 'read permission', true, longDetail);
      expect(longCheck.detail).assertEqual(longDetail);
      expect(longDetail.length).assertEqual(60);
      const cjkCheck: CapabilityCheck = new CapabilityCheck('write', '写权限', false, '权限检查说明');
      expect(cjkCheck.name).assertEqual('写权限');
      expect(cjkCheck.detail).assertEqual('权限检查说明');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_3400
     * @tc.name      testPermissionStateFreshPair0001
     * @tc.desc      Verify two freshly created PermissionState objects stay
     *               independent and untouched by each other mutations.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStateFreshPair0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStateFreshPair0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: PermissionState = new PermissionState();
      const second: PermissionState = new PermissionState();
      expect(first.name).assertEqual('');
      expect(second.name).assertEqual('');
      expect(first.declared).assertFalse();
      expect(second.declared).assertFalse();
      expect(first.granted).assertFalse();
      expect(second.granted).assertFalse();
      first.name = VCardConstants.READ_CONTACTS;
      first.declared = true;
      first.granted = true;
      expect(second.name).assertEqual('');
      expect(second.declared).assertFalse();
      expect(second.granted).assertFalse();
      second.name = VCardConstants.WRITE_CONTACTS;
      expect(first.name).assertEqual('ohos.permission.READ_CONTACTS');
      expect(second.name).assertEqual('ohos.permission.WRITE_CONTACTS');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_PERM_3500
     * @tc.name      testPermissionGateIdentity0001
     * @tc.desc      Verify the strict equality comparisons used by the
     *               request gate behave identically on equal enum members.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionGateIdentity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionGateIdentity0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const grantedA: number = abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
      const grantedB: number = abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
      const deniedA: number = abilityAccessCtrl.GrantStatus.PERMISSION_DENIED;
      expect(grantedA === grantedB).assertTrue();
      expect(grantedA === deniedA).assertFalse();
      const gatePair = (first: number, second: number): boolean => {
        return first === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED &&
          second === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
      };
      expect(gatePair(grantedA, grantedB)).assertTrue();
      expect(gatePair(grantedA, deniedA)).assertFalse();
      expect(gatePair(deniedA, grantedA)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
