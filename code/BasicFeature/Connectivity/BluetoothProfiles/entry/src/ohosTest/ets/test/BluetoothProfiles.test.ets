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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { tick } from '../util/TestTick';
import {
  BLUETOOTH_PERMISSION,
  HILOG_DOMAIN,
  HILOG_TAG,
  HOME_LOG_LIMIT,
  LOG_STORE_CAPACITY,
  PAGE_LOG_LIMIT,
  PROFILE_COUNT,
  RouteKey,
  StorageKeys,
  appSubtitle,
  defaultNavTitle,
  isRouteKey
} from '../../../main/ets/common/AppConstants';
import { bindResourceManager } from '../../../main/ets/common/StringResource';
import {
  PROFILE_METAS,
  ProfileKind,
  ProfileMeta,
  createFunctionOf,
  filterProfiles,
  hfpRoleName,
  isProfileKind,
  metaOf
} from '../../../main/ets/model/ProfileCatalog';
import {
  BT_STATE_BLE_ON,
  BT_STATE_BLE_TURNING_OFF,
  BT_STATE_BLE_TURNING_ON,
  BT_STATE_OFF,
  BT_STATE_ON,
  BT_STATE_TURNING_OFF,
  BT_STATE_TURNING_ON,
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
  ERROR_CODE_BLUETOOTH_DISABLED,
  ERROR_CODE_CAPABILITY_UNSUPPORTED,
  ERROR_CODE_INVALID_PARAM,
  ERROR_CODE_OPERATION_FAILED,
  ERROR_CODE_PERMISSION_DENIED,
  ERROR_CODE_PROFILE_UNSUPPORTED,
  ERROR_CODE_SERVICE_STOPPED,
  ProbeStatus,
  bluetoothStateName,
  classifyErrorCode,
  connectionStateName,
  disconnectCauseName,
  isBluetoothUsable,
  isConnected,
  isReadyStatus,
  isTransitionState,
  nextSubscriptionAction,
  probeStatusHint,
  probeStatusName,
  shouldRefreshDevices,
  summarizeDeviceList
} from '../../../main/ets/model/ProfileState';
import {
  createFunctionNameOf,
  isProfileLike,
  profileFactoryOf
} from '../../../main/ets/utils/ProfileFactory';

export default function bluetoothProfilesTest() {
  // 模型层只产出资源名称，用例断言的是真实文案：这里是 testsuite() 第一个注册的套件，
  // 先把测试进程的资源管理器交给 StringResource，后续所有套件的 text() 才能取到本地化文本。
  // 放在本文件而不是 List.test.ets：入口文件只允许 import *.test 模块，否则 DevEco 静态扫描会认作“未注册”。
  bindResourceManager(abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager);
  describe('BluetoothProfilesCatalogTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_CATALOG_0100
     * @tc.name profileCatalogMetas
     * @tc.desc Verify the catalog keeps only HFP with complete display fields after PAN and MAP removal.
     */
    it('profileCatalogMetas', 0, () => {
      expect(PROFILE_METAS.length).assertEqual(PROFILE_COUNT);
      expect(PROFILE_METAS.length).assertEqual(1);
      expect(PROFILE_METAS[0].kind).assertEqual(ProfileKind.HFP);
      for (const meta of PROFILE_METAS) {
        expect(meta.code.length > 0).assertTrue();
        expect(meta.title.length > 0).assertTrue();
        expect(meta.role.length > 0).assertTrue();
        expect(meta.apiName.startsWith('@ohos.bluetooth.')).assertTrue();
        expect(meta.createFunction.includes('.create')).assertTrue();
        expect(meta.docPage.endsWith('.md')).assertTrue();
        expect(meta.summary.length > 20).assertTrue();
        expect(meta.note.length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_CATALOG_0200
     * @tc.name profileCatalogLookup
     * @tc.desc Verify metaOf and createFunctionOf return the HFP entry and the AG create function.
     */
    it('profileCatalogLookup', 0, () => {
      expect(metaOf(ProfileKind.HFP).code).assertEqual('HFP');
      expect(metaOf(ProfileKind.HFP).profileId).assertEqual(4);
      expect(metaOf(ProfileKind.HFP).interfaceName).assertEqual('HandsFreeAudioGatewayProfile');
      expect(createFunctionOf(ProfileKind.HFP)).assertEqual('hfp.createHfpAgProfile()');
      expect(createFunctionOf(ProfileKind.HFP)).assertEqual(metaOf(ProfileKind.HFP).createFunction);
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_CATALOG_0300
     * @tc.name profileCatalogKindGuard
     * @tc.desc Verify isProfileKind accepts only the remaining hfp key and rejects the removed pan and map.
     */
    it('profileCatalogKindGuard', 0, () => {
      expect(isProfileKind('hfp')).assertTrue();
      expect(isProfileKind('pan')).assertFalse();
      expect(isProfileKind('map')).assertFalse();
      expect(isProfileKind('HFP')).assertFalse();
      expect(isProfileKind('hid')).assertFalse();
      expect(isProfileKind('a2dp')).assertFalse();
      expect(isProfileKind('')).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_CATALOG_0400
     * @tc.name profileCatalogFilter
     * @tc.desc Verify the home page keyword filter matches code, interface, summary and empty keyword.
     */
    it('profileCatalogFilter', 0, () => {
      expect(filterProfiles('').length).assertEqual(PROFILE_COUNT);
      expect(filterProfiles('   ').length).assertEqual(PROFILE_COUNT);
      expect(filterProfiles('hfp').length).assertEqual(1);
      expect(filterProfiles('HFP').length).assertEqual(1);
      expect(filterProfiles('HandsFreeAudioGatewayProfile').length).assertEqual(1);
      expect(filterProfiles('通话').length).assertEqual(1);
      expect(filterProfiles('pan').length).assertEqual(0);
      expect(filterProfiles('map').length).assertEqual(0);
      expect(filterProfiles('不存在的 Profile').length).assertEqual(0);
      expect(filterProfiles('hfp')[0].kind).assertEqual(ProfileKind.HFP);
    });
  });

  describe('BluetoothProfilesStateTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_STATE_0100
     * @tc.name profileStateErrorMapping
     * @tc.desc Verify every documented bluetooth error code maps to the expected probe status.
     */
    it('profileStateErrorMapping', 0, () => {
      expect(classifyErrorCode(ERROR_CODE_PERMISSION_DENIED)).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(classifyErrorCode(ERROR_CODE_CAPABILITY_UNSUPPORTED))
        .assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(classifyErrorCode(ERROR_CODE_SERVICE_STOPPED)).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(classifyErrorCode(ERROR_CODE_BLUETOOTH_DISABLED)).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(classifyErrorCode(ERROR_CODE_PROFILE_UNSUPPORTED)).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(classifyErrorCode(ERROR_CODE_INVALID_PARAM)).assertEqual(ProbeStatus.FAILED);
      expect(classifyErrorCode(ERROR_CODE_OPERATION_FAILED)).assertEqual(ProbeStatus.FAILED);
      expect(classifyErrorCode(0)).assertEqual(ProbeStatus.IDLE);
      expect(classifyErrorCode(-1)).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_STATE_0200
     * @tc.name profileStateStatusText
     * @tc.desc Verify status name, hint, ready judgement and refresh judgement stay consistent.
     */
    it('profileStateStatusText', 0, () => {
      expect(probeStatusName(ProbeStatus.IDLE)).assertEqual('未探测');
      expect(probeStatusName(ProbeStatus.READY)).assertEqual('可用');
      expect(probeStatusName(ProbeStatus.NO_DEVICE)).assertEqual('无已连接设备');
      expect(probeStatusName(ProbeStatus.PERMISSION_DENIED)).assertEqual('缺少权限');
      expect(probeStatusName(ProbeStatus.CAPABILITY_UNSUPPORTED)).assertEqual('设备不支持');
      expect(probeStatusName(ProbeStatus.BLUETOOTH_DISABLED)).assertEqual('蓝牙未开启');
      expect(probeStatusName(ProbeStatus.SERVICE_STOPPED)).assertEqual('蓝牙服务已停止');
      expect(probeStatusName(ProbeStatus.PROFILE_UNSUPPORTED)).assertEqual('Profile 不支持');
      expect(probeStatusName(ProbeStatus.FAILED)).assertEqual('操作失败');
      expect(probeStatusHint(ProbeStatus.PERMISSION_DENIED).includes('ACCESS_BLUETOOTH')).assertTrue();
      expect(probeStatusHint(ProbeStatus.READY).includes('Profile 实例')).assertTrue();
      expect(probeStatusHint(ProbeStatus.FAILED).length > 0).assertTrue();
      expect(isReadyStatus(ProbeStatus.READY)).assertTrue();
      expect(isReadyStatus(ProbeStatus.NO_DEVICE)).assertTrue();
      expect(isReadyStatus(ProbeStatus.FAILED)).assertFalse();
      expect(shouldRefreshDevices(ProbeStatus.NO_DEVICE)).assertTrue();
      expect(shouldRefreshDevices(ProbeStatus.PERMISSION_DENIED)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_STATE_0300
     * @tc.name profileStateConnectionText
     * @tc.desc Verify the four profile connection states and the connected judgement.
     */
    it('profileStateConnectionText', 0, () => {
      expect(connectionStateName(CONNECTION_STATE_DISCONNECTED)).assertEqual('已断开');
      expect(connectionStateName(CONNECTION_STATE_CONNECTING)).assertEqual('正在连接');
      expect(connectionStateName(CONNECTION_STATE_CONNECTED)).assertEqual('已连接');
      expect(connectionStateName(CONNECTION_STATE_DISCONNECTING)).assertEqual('正在断开');
      expect(connectionStateName(9)).assertEqual('未知状态');
      expect(isConnected(CONNECTION_STATE_CONNECTED)).assertTrue();
      expect(isConnected(CONNECTION_STATE_CONNECTING)).assertFalse();
      expect(isTransitionState(CONNECTION_STATE_CONNECTING)).assertTrue();
      expect(isTransitionState(CONNECTION_STATE_DISCONNECTING)).assertTrue();
      expect(isTransitionState(CONNECTION_STATE_CONNECTED)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_STATE_0400
     * @tc.name profileStateBluetoothText
     * @tc.desc Verify the seven bluetooth switch states and that only STATE_ON is usable for BR/EDR.
     */
    it('profileStateBluetoothText', 0, () => {
      expect(bluetoothStateName(BT_STATE_OFF)).assertEqual('蓝牙已关闭');
      expect(bluetoothStateName(BT_STATE_TURNING_ON)).assertEqual('蓝牙正在开启');
      expect(bluetoothStateName(BT_STATE_ON)).assertEqual('蓝牙已开启');
      expect(bluetoothStateName(BT_STATE_TURNING_OFF)).assertEqual('蓝牙正在关闭');
      expect(bluetoothStateName(BT_STATE_BLE_TURNING_ON)).assertEqual('BLE 正在开启');
      expect(bluetoothStateName(BT_STATE_BLE_ON)).assertEqual('仅 BLE 模式');
      expect(bluetoothStateName(BT_STATE_BLE_TURNING_OFF)).assertEqual('BLE 正在关闭');
      expect(bluetoothStateName(9)).assertEqual('未知状态');
      expect(isBluetoothUsable(BT_STATE_ON)).assertTrue();
      expect(isBluetoothUsable(BT_STATE_BLE_ON)).assertFalse();
      expect(isBluetoothUsable(BT_STATE_OFF)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_STATE_0500
     * @tc.name profileStateDisconnectCause
     * @tc.desc Verify the six disconnect causes reported by connectionStateChange callbacks.
     */
    it('profileStateDisconnectCause', 0, () => {
      expect(disconnectCauseName(DISCONNECT_CAUSE_USER)).assertEqual('用户主动断开');
      expect(disconnectCauseName(DISCONNECT_CAUSE_KEYBOARD)).assertEqual('需要从键盘侧发起');
      expect(disconnectCauseName(DISCONNECT_CAUSE_MOUSE)).assertEqual('需要从鼠标侧发起');
      expect(disconnectCauseName(DISCONNECT_CAUSE_CAR)).assertEqual('需要从车机侧发起');
      expect(disconnectCauseName(DISCONNECT_CAUSE_TOO_MANY_DEVICES)).assertEqual('已连接设备数量超限');
      expect(disconnectCauseName(DISCONNECT_CAUSE_INTERNAL_FAILURE)).assertEqual('内部错误导致连接失败');
      expect(disconnectCauseName(9)).assertEqual('未知原因');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_STATE_0600
     * @tc.name profileStateSubscriptionAndSummary
     * @tc.desc Verify the subscription button text and the connected device summary text.
     */
    it('profileStateSubscriptionAndSummary', 0, () => {
      expect(nextSubscriptionAction(false)).assertEqual('订阅状态变化');
      expect(nextSubscriptionAction(true)).assertEqual('取消订阅');
      expect(summarizeDeviceList([])).assertEqual('暂无已连接设备');
      expect(summarizeDeviceList(['AA:BB:CC:DD:EE:FF'])).assertEqual('1 台已连接设备');
      expect(summarizeDeviceList(['AA:BB:CC:DD:EE:FF', '11:22:33:44:55:66'])).assertEqual('2 台已连接设备');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_STATE_0700
     * @tc.name profileStateNumericContract
     * @tc.desc Verify the numeric literals used by the sample match the documented bluetooth values.
     */
    it('profileStateNumericContract', 0, () => {
      expect(ERROR_CODE_PERMISSION_DENIED).assertEqual(201);
      expect(ERROR_CODE_INVALID_PARAM).assertEqual(401);
      expect(ERROR_CODE_CAPABILITY_UNSUPPORTED).assertEqual(801);
      expect(ERROR_CODE_SERVICE_STOPPED).assertEqual(2900001);
      expect(ERROR_CODE_BLUETOOTH_DISABLED).assertEqual(2900003);
      expect(ERROR_CODE_PROFILE_UNSUPPORTED).assertEqual(2900004);
      expect(ERROR_CODE_OPERATION_FAILED).assertEqual(2900099);
      expect(ProbeStatus.IDLE).assertEqual(0);
      expect(ProbeStatus.READY).assertEqual(1);
      expect(ProbeStatus.FAILED).assertEqual(8);
      expect(CONNECTION_STATE_DISCONNECTED).assertEqual(0);
      expect(CONNECTION_STATE_CONNECTED).assertEqual(2);
      expect(BT_STATE_OFF).assertEqual(0);
      expect(BT_STATE_ON).assertEqual(2);
      expect(BT_STATE_BLE_TURNING_OFF).assertEqual(6);
      expect(DISCONNECT_CAUSE_USER).assertEqual(0);
      expect(DISCONNECT_CAUSE_INTERNAL_FAILURE).assertEqual(5);
    });
  });

  describe('BluetoothProfilesConstantsTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_CONST_0100
     * @tc.name profileConstantsRouting
     * @tc.desc Verify the single route key, the remaining profile count and the storage keys used by pages.
     */
    it('profileConstantsRouting', 0, () => {
      expect(PROFILE_COUNT).assertEqual(1);
      expect(RouteKey.HFP).assertEqual(ProfileKind.HFP);
      expect(isRouteKey('hfp')).assertTrue();
      expect(isRouteKey('pan')).assertFalse();
      expect(isRouteKey('map')).assertFalse();
      expect(isRouteKey('hid')).assertFalse();
      expect(StorageKeys.APP_LOGS).assertEqual('appLogs');
      expect(StorageKeys.LAYOUT_PROFILE).assertEqual('layoutProfile');
      expect(StorageKeys.BLUETOOTH_STATE).assertEqual('bluetoothState');
      expect(defaultNavTitle().length > 0).assertTrue();
      expect(appSubtitle().includes('HFP')).assertTrue();
      expect(appSubtitle().includes('AG')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_CONST_0200
     * @tc.name profileConstantsLogging
     * @tc.desc Verify log capacity, page log limits, hilog domain and the required bluetooth permission.
     */
    it('profileConstantsLogging', 0, () => {
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      expect(PAGE_LOG_LIMIT).assertEqual(20);
      expect(HOME_LOG_LIMIT).assertEqual(30);
      expect(PAGE_LOG_LIMIT < HOME_LOG_LIMIT).assertTrue();
      expect(LOG_STORE_CAPACITY > HOME_LOG_LIMIT).assertTrue();
      expect(HILOG_DOMAIN).assertEqual(0xF811);
      expect(HILOG_TAG).assertEqual('BluetoothProfiles');
      expect(BLUETOOTH_PERMISSION).assertEqual('ohos.permission.ACCESS_BLUETOOTH');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_CONST_0300
     * @tc.name profileFactoryEntryNames
     * @tc.desc Verify the AG create function name and that the factory hands out a ProfileLike shaped object.
     */
    it('profileFactoryEntryNames', 0, () => {
      expect(createFunctionNameOf()).assertEqual('hfp.createHfpAgProfile');
      expect(createFunctionNameOf()).assertEqual(createFunctionOf(ProfileKind.HFP).replace('()', ''));
      expect(typeof profileFactoryOf()).assertEqual('function');
      expect(profileFactoryOf() !== null).assertTrue();
      expect(isProfileLike(null)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_CONST_0400
     * @tc.name profileHfpRoleNaming
     * @tc.desc Verify the AG role name is reported consistently by the catalog and the role helper.
     */
    it('profileHfpRoleNaming', 0, () => {
      expect(hfpRoleName()).assertEqual('AG（音频网关）');
      expect(metaOf(ProfileKind.HFP).role).assertEqual('Audio Gateway（AG）');
      expect(hfpRoleName().includes('AG')).assertTrue();
      expect(metaOf(ProfileKind.HFP).title.includes('HFP')).assertTrue();
      expect(metaOf(ProfileKind.HFP).note.includes('createHfpAgProfile')).assertTrue();
    });
  });
}
