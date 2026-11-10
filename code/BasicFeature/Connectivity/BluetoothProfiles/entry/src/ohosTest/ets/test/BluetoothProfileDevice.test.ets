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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { access, baseProfile, constant } from '@kit.ConnectivityKit';
import {
  CONNECTION_STATE_CONNECTED,
  CONNECTION_STATE_CONNECTING,
  CONNECTION_STATE_DISCONNECTED,
  CONNECTION_STATE_DISCONNECTING,
  DISCONNECT_CAUSE_CAR,
  DISCONNECT_CAUSE_INTERNAL_FAILURE,
  DISCONNECT_CAUSE_KEYBOARD,
  DISCONNECT_CAUSE_MOUSE,
  DISCONNECT_CAUSE_TOO_MANY_DEVICES,
  DISCONNECT_CAUSE_USER,
  ERROR_CODE_CAPABILITY_UNSUPPORTED,
  ERROR_CODE_INVALID_PARAM,
  ERROR_CODE_PERMISSION_DENIED,
  ProbeStatus,
  classifyErrorCode,
  isBluetoothUsable,
  isConnected,
  isTransitionState
} from '../../../main/ets/model/ProfileState';
import { ProfileKind, metaOf } from '../../../main/ets/model/ProfileCatalog';
import { LogItem, LogLevel } from '../../../main/ets/model/LogStore';
import { StorageKeys } from '../../../main/ets/common/AppConstants';
import { Logger } from '../../../main/ets/utils/Logger';
import { isValidDeviceId } from '../../../main/ets/model/DeviceAddress';
import { isKnownBluetoothCode } from '../../../main/ets/utils/ErrorUtil';
import {
  BluetoothStateResult,
  PairedDeviceResult,
  listPairedDevices,
  readBluetoothState
} from '../../../main/ets/utils/BluetoothAccess';
import { checkBluetoothPermission } from '../../../main/ets/utils/PermissionUtil';
import { ProfileSession } from '../../../main/ets/utils/ProfileSession';
import { createFunctionNameOf, isProfileLike, profileFactoryOf } from '../../../main/ets/utils/ProfileFactory';
import { DEVICE_COUNT_UNKNOWN, HfpAgResult, probeHfpAg, probeHfpAgWith } from '../../../main/ets/utils/ProfileFeature';
import {
  ProfileStub,
  countingFactoryOf,
  stateParam,
  stubFactoryOf,
  throwingFactoryOf
} from './support/ProfileStub';

export default function bluetoothProfileDeviceTest() {
  describe('BluetoothProfileEnumAlignmentTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_ENUM_0100
     * @tc.name deviceConnectionStateAligned
     * @tc.desc Verify the local connection state literals match the system profile connection state enum.
     */
    it('deviceConnectionStateAligned', 0, () => {
      expect(constant.ProfileConnectionState.STATE_DISCONNECTED).assertEqual(CONNECTION_STATE_DISCONNECTED);
      expect(constant.ProfileConnectionState.STATE_CONNECTING).assertEqual(CONNECTION_STATE_CONNECTING);
      expect(constant.ProfileConnectionState.STATE_CONNECTED).assertEqual(CONNECTION_STATE_CONNECTED);
      expect(constant.ProfileConnectionState.STATE_DISCONNECTING).assertEqual(CONNECTION_STATE_DISCONNECTING);
      expect(isConnected(constant.ProfileConnectionState.STATE_CONNECTED)).assertTrue();
      expect(isTransitionState(constant.ProfileConnectionState.STATE_CONNECTING)).assertTrue();
      expect(isTransitionState(constant.ProfileConnectionState.STATE_DISCONNECTING)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_ENUM_0200
     * @tc.name deviceBluetoothStateAligned
     * @tc.desc Verify the local bluetooth switch literals match the system bluetooth state enum.
     */
    it('deviceBluetoothStateAligned', 0, () => {
      expect(access.BluetoothState.STATE_OFF).assertEqual(0);
      expect(access.BluetoothState.STATE_TURNING_ON).assertEqual(1);
      expect(access.BluetoothState.STATE_ON).assertEqual(2);
      expect(access.BluetoothState.STATE_TURNING_OFF).assertEqual(3);
      expect(access.BluetoothState.STATE_BLE_TURNING_ON).assertEqual(4);
      expect(access.BluetoothState.STATE_BLE_ON).assertEqual(5);
      expect(access.BluetoothState.STATE_BLE_TURNING_OFF).assertEqual(6);
      expect(isBluetoothUsable(access.BluetoothState.STATE_ON)).assertTrue();
      expect(isBluetoothUsable(access.BluetoothState.STATE_BLE_ON)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_ENUM_0300
     * @tc.name deviceDisconnectCauseAligned
     * @tc.desc Verify the local disconnect cause literals match the system disconnect cause enum.
     */
    it('deviceDisconnectCauseAligned', 0, () => {
      expect(baseProfile.DisconnectCause.USER_DISCONNECT).assertEqual(DISCONNECT_CAUSE_USER);
      expect(baseProfile.DisconnectCause.CONNECT_FROM_KEYBOARD).assertEqual(DISCONNECT_CAUSE_KEYBOARD);
      expect(baseProfile.DisconnectCause.CONNECT_FROM_MOUSE).assertEqual(DISCONNECT_CAUSE_MOUSE);
      expect(baseProfile.DisconnectCause.CONNECT_FROM_CAR).assertEqual(DISCONNECT_CAUSE_CAR);
      expect(baseProfile.DisconnectCause.TOO_MANY_CONNECTED_DEVICES).assertEqual(DISCONNECT_CAUSE_TOO_MANY_DEVICES);
      expect(baseProfile.DisconnectCause.CONNECT_FAIL_INTERNAL).assertEqual(DISCONNECT_CAUSE_INTERNAL_FAILURE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_ENUM_0400
     * @tc.name deviceProfileIdAligned
     * @tc.desc Verify the catalog profileId of the remaining HFP entry matches the system ProfileId enum.
     */
    it('deviceProfileIdAligned', 0, () => {
      expect(metaOf(ProfileKind.HFP).profileId)
        .assertEqual(constant.ProfileId.PROFILE_HANDSFREE_AUDIO_GATEWAY);
      expect(metaOf(ProfileKind.HFP).code).assertEqual('HFP');
      expect(metaOf(ProfileKind.HFP).profileId > 0).assertTrue();
    });
  });

  describe('BluetoothProfileAccessTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_ACCESS_0100
     * @tc.name deviceReadBluetoothState
     * @tc.desc Verify access.getState reports a documented value or the coded failure of the sample.
     */
    it('deviceReadBluetoothState', 0, () => {
      const result = readBluetoothState();
      expect(result.message.includes('access.getState()')).assertTrue();
      if (result.code === 0) {
        expect(result.status).assertEqual(ProbeStatus.READY);
        expect(result.state >= access.BluetoothState.STATE_OFF).assertTrue();
        expect(result.state <= access.BluetoothState.STATE_BLE_TURNING_OFF).assertTrue();
        expect(result.describe().includes('原始值')).assertTrue();
      } else {
        expect(result.state).assertEqual(-1);
        expect(result.status).assertEqual(classifyErrorCode(result.code));
        expect(isKnownBluetoothCode(result.code)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_ACCESS_0200
     * @tc.name devicePairedDeviceList
     * @tc.desc Verify the paired device query returns valid addresses or an empty coded failure list.
     */
    it('devicePairedDeviceList', 0, () => {
      const result: PairedDeviceResult = listPairedDevices();
      expect(result.message.includes('getPairedDevices()')).assertTrue();
      if (result.code === 0) {
        expect(result.message.includes('个已配对设备')).assertTrue();
      } else {
        expect(result.devices.length).assertEqual(0);
        expect(isKnownBluetoothCode(result.code)).assertTrue();
      }
      for (const device of result.devices) {
        expect(isValidDeviceId(device)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_ACCESS_0300
     * @tc.name deviceAccessResultText
     * @tc.desc Verify the bluetooth state result describes the raw state value for the log panel.
     */
    it('deviceAccessResultText', 0, () => {
      const ready = new BluetoothStateResult(access.BluetoothState.STATE_ON, ProbeStatus.READY, 0, 'ok');
      expect(ready.describe()).assertEqual('蓝牙已开启（原始值 2）');
      const off = new BluetoothStateResult(access.BluetoothState.STATE_OFF, ProbeStatus.READY, 0, 'ok');
      expect(off.describe()).assertEqual('蓝牙已关闭（原始值 0）');
      const empty = new PairedDeviceResult([], 0, 'connection.getPairedDevices() 返回 0 个已配对设备');
      expect(empty.devices.length).assertEqual(0);
      expect(empty.message.includes('0 个已配对设备')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_ACCESS_0400
     * @tc.name devicePermissionCheck
     * @tc.desc Verify the runtime permission check keeps the granted flag and the probe status in sync.
     */
    it('devicePermissionCheck', 0, () => {
      const outcome = checkBluetoothPermission();
      expect(outcome.granted).assertEqual(outcome.status === ProbeStatus.READY);
      expect(outcome.message.includes('ACCESS_BLUETOOTH')).assertTrue();
      expect(outcome.describe().length > 0).assertTrue();
      if (outcome.granted) {
        expect(outcome.describe()).assertEqual('权限已授予');
      } else {
        expect(outcome.describe().includes('权限未授予')).assertTrue();
      }
    });
  });

  describe('BluetoothProfileSessionDeviceTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_SESSION_0200
     * @tc.name deviceSessionRealFactoryShape
     * @tc.desc Verify the real factory hands out an object that satisfies the ProfileLike shape.
     */
    it('deviceSessionRealFactoryShape', 0, () => {
      let created = false;
      try {
        const profile = profileFactoryOf()();
        created = isProfileLike(profile);
      } catch (err) {
        created = false;
      }
      expect(created).assertTrue();
      expect(createFunctionNameOf()).assertEqual('hfp.createHfpAgProfile');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_SESSION_0300
     * @tc.name deviceSessionStubDevices
     * @tc.desc Verify the session copies the device list from the injected profile and counts it correctly.
     *
     * 未创建实例时 refreshDevices 先创建实例、不查设备，因此第一次返回 READY 而不是 NO_DEVICE。
     */
    it('deviceSessionStubDevices', 0, () => {
      const stub = new ProfileStub(['AA:BB:CC:DD:EE:01', 'AA:BB:CC:DD:EE:02']);
      const session = new ProfileSession(stubFactoryOf(stub), '用例');
      session.ensureProfile();
      const snapshot = session.refreshDevices();
      expect(snapshot.deviceCount()).assertEqual(2);
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(snapshot.hasDevice('AA:BB:CC:DD:EE:01')).assertTrue();
      expect(stub.deviceCalls).assertEqual(1);
      const empty = new ProfileStub([]);
      const emptySession = new ProfileSession(stubFactoryOf(empty), '用例');
      const lazy = emptySession.refreshDevices();
      expect(lazy.status).assertEqual(ProbeStatus.READY);
      expect(empty.deviceCalls).assertEqual(0);
      const afterCreate = emptySession.refreshDevices();
      expect(afterCreate.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(afterCreate.devices.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_SESSION_0400
     * @tc.name deviceSessionStubInvalidDeviceId
     * @tc.desc Verify an invalid deviceId is rejected locally before the profile method is called.
     */
    it('deviceSessionStubInvalidDeviceId', 0, () => {
      const stub = new ProfileStub(['AA:BB:CC:DD:EE:FF']);
      const session = new ProfileSession(stubFactoryOf(stub), '用例');
      session.ensureProfile();
      const invalid = session.refreshState('AA:BB:CC:DD:EE');
      expect(invalid.status).assertEqual(ProbeStatus.FAILED);
      expect(invalid.code).assertEqual(ERROR_CODE_INVALID_PARAM);
      expect(invalid.message.includes('deviceId 不合法')).assertTrue();
      expect(stub.stateCalls).assertEqual(0);
      const blank = session.refreshState('');
      expect(blank.code).assertEqual(ERROR_CODE_INVALID_PARAM);
      expect(blank.message.includes('空字符串')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_SESSION_0500
     * @tc.name deviceSessionStubSubscription
     * @tc.desc Verify subscribe and unsubscribe drive the stub handler and the snapshot flag together.
     */
    it('deviceSessionStubSubscription', 0, () => {
      const stub = new ProfileStub([]);
      const session = new ProfileSession(stubFactoryOf(stub), '用例');
      session.ensureProfile();
      const subscribed = session.subscribe();
      expect(subscribed.subscribed).assertTrue();
      expect(session.isSubscribed()).assertTrue();
      expect(stub.onCalls).assertEqual(1);
      expect(stub.hasListener()).assertTrue();
      const removed = session.unsubscribe();
      expect(removed.subscribed).assertFalse();
      expect(session.isSubscribed()).assertFalse();
      expect(stub.offCalls).assertEqual(1);
      expect(stub.hasListener()).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_SESSION_0600
     * @tc.name deviceSessionStubStateChange
     * @tc.desc Verify a stub callback updates the current device, state and cause text of the session.
     */
    it('deviceSessionStubStateChange', 0, () => {
      const stub = new ProfileStub([]);
      const session = new ProfileSession(stubFactoryOf(stub), '用例');
      session.ensureProfile();
      session.subscribe();
      const delivered = stub.emit(stateParam('AA:BB:CC:DD:EE:FF', CONNECTION_STATE_CONNECTED, DISCONNECT_CAUSE_USER));
      expect(delivered).assertTrue();
      const snapshot = session.getSnapshot();
      expect(snapshot.currentDeviceId).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(snapshot.currentState).assertEqual(CONNECTION_STATE_CONNECTED);
      expect(snapshot.subscribed).assertTrue();
      expect(stub.emit(stateParam('AA:BB:CC:DD:EE:FF', CONNECTION_STATE_DISCONNECTED, DISCONNECT_CAUSE_USER)))
        .assertTrue();
      expect(session.getSnapshot().currentState).assertEqual(CONNECTION_STATE_DISCONNECTED);
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_SESSION_0700
     * @tc.name deviceSessionStubCreateError
     * @tc.desc Verify a failing factory converts the thrown code into the matching probe status.
     */
    it('deviceSessionStubCreateError', 0, () => {
      const session = new ProfileSession(throwingFactoryOf(ERROR_CODE_PERMISSION_DENIED), '用例');
      const snapshot = session.ensureProfile();
      expect(session.isCreated()).assertFalse();
      expect(snapshot.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(snapshot.code).assertEqual(ERROR_CODE_PERMISSION_DENIED);
      expect(snapshot.message.includes('hfp.createHfpAgProfile')).assertTrue();
      expect(snapshot.message.includes('ACCESS_BLUETOOTH')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_SESSION_0800
     * @tc.name deviceSessionStubCreateOnce
     * @tc.desc Verify repeated ensureProfile calls create the instance only once and keep the first snapshot.
     */
    it('deviceSessionStubCreateOnce', 0, () => {
      const created: ProfileStub[] = [];
      const session = new ProfileSession(countingFactoryOf(created), '用例');
      const first = session.ensureProfile();
      const second = session.ensureProfile();
      expect(created.length).assertEqual(1);
      expect(first.status).assertEqual(ProbeStatus.READY);
      expect(second.code).assertEqual(first.code);
      expect(second.message).assertEqual(first.message);
    });
  });

  describe('BluetoothProfileFeatureDeviceTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_FEATURE_0100
     * @tc.name deviceAgProbeReal
     * @tc.desc Verify the AG probe reports a created instance or a documented error code on this device.
     */
    it('deviceAgProbeReal', 0, () => {
      const result: HfpAgResult = probeHfpAg();
      expect(result.createFunction).assertEqual('hfp.createHfpAgProfile');
      expect(result.message.includes(result.createFunction)).assertTrue();
      expect(result.describe().startsWith('AG：')).assertTrue();
      if (result.created) {
        expect(result.code === 0 || result.deviceCount === DEVICE_COUNT_UNKNOWN).assertTrue();
        expect(result.usableDeviceCount() >= 0 || result.deviceCount === DEVICE_COUNT_UNKNOWN).assertTrue();
      } else {
        expect(result.deviceCount).assertEqual(DEVICE_COUNT_UNKNOWN);
        expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
        expect(result.status).assertEqual(classifyErrorCode(result.code));
        if (result.code > 0) {
          expect(isKnownBluetoothCode(result.code)).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_FEATURE_0200
     * @tc.name deviceAgProbeWithStub
     * @tc.desc Verify the AG probe counts devices from an injected profile and keeps -1 on query failure.
     */
    it('deviceAgProbeWithStub', 0, () => {
      const ready = probeHfpAgWith(new ProfileStub(['AA:BB:CC:DD:EE:01', 'AA:BB:CC:DD:EE:02', 'AA:BB:CC:DD:EE:03']));
      expect(ready.created).assertTrue();
      expect(ready.deviceCount).assertEqual(3);
      expect(ready.status).assertEqual(ProbeStatus.READY);
      expect(ready.describe()).assertEqual('AG：实例已创建，已连接 3 台');
      const broken = new ProfileStub([]);
      broken.devicesError = ERROR_CODE_CAPABILITY_UNSUPPORTED;
      const failed = probeHfpAgWith(broken);
      expect(failed.created).assertTrue();
      expect(failed.deviceCount).assertEqual(DEVICE_COUNT_UNKNOWN);
      expect(failed.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(failed.reason()).assertEqual('');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_FEATURE_0300
     * @tc.name deviceFeatureResultText
     * @tc.desc Verify the AG result object renders the text shown on the demo page for three shapes.
     */
    it('deviceFeatureResultText', 0, () => {
      const created = new HfpAgResult('hfp.createHfpAgProfile', true, 0, ProbeStatus.READY, 0, 'ok');
      expect(created.describe()).assertEqual('AG：实例已创建，已连接 0 台');
      expect(created.reason()).assertEqual('');
      expect(created.usableDeviceCount()).assertEqual(0);
      const blocked = new HfpAgResult('hfp.createHfpAgProfile', false, DEVICE_COUNT_UNKNOWN,
        ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'unsupported');
      expect(blocked.describe()).assertEqual('AG：hfp.createHfpAgProfile() 失败（801）');
      expect(blocked.reason().includes('蓝牙服务')).assertTrue();
      expect(blocked.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
      const disabled = new HfpAgResult('hfp.createHfpAgProfile', false, DEVICE_COUNT_UNKNOWN,
        ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'disabled');
      expect(disabled.describe()).assertEqual('AG：hfp.createHfpAgProfile() 失败（2900003）');
      expect(disabled.reason()).assertEqual('');
    });
  });

  describe('BluetoothProfileLoggerTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_DEVICE_LOGGER_0100
     * @tc.name deviceLoggerStorage
     * @tc.desc Verify Logger writes the record into AppStorage, counts it by tag and clears all records.
     */
    it('deviceLoggerStorage', 0, () => {
      Logger.clear();
      const marker = 'logger round trip on device';
      Logger.warn('DeviceTest', 'loggerCase', marker);
      const logs: LogItem[] = AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
      expect(logs.length > 0).assertTrue();
      expect(logs[0].detail).assertEqual(marker);
      expect(logs[0].source).assertEqual('DeviceTest');
      expect(logs[0].level).assertEqual(LogLevel.WARN);
      expect(Logger.count('DeviceTest', 'loggerCase')).assertEqual(1);
      expect(Logger.count('OtherSource', 'loggerCase')).assertEqual(0);
      Logger.clear();
      const cleared: LogItem[] = AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
      expect(cleared.length).assertEqual(0);
    });
  });
}
