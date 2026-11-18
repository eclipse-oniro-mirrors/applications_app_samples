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
import {
  DEVICE_ID_SEGMENT_COUNT,
  EMPTY_DEVICE_ID_TEXT,
  isSameDevice,
  isValidDeviceId,
  maskDeviceId,
  normalizeDeviceId,
  splitAddress
} from '../../../main/ets/model/DeviceAddress';
import {
  LogItem,
  LogLevel,
  appendLog,
  clearLogs,
  countByTag,
  logLevelName,
  queryLogs
} from '../../../main/ets/model/LogStore';
import { LOG_STORE_CAPACITY } from '../../../main/ets/common/AppConstants';
import { ProfileKind } from '../../../main/ets/model/ProfileCatalog';
import {
  ProfileSnapshot,
  ProfileViewState,
  pickSelectedDevice
} from '../../../main/ets/model/ProfileSnapshot';
import {
  CONNECTION_STATE_CONNECTED,
  CONNECTION_STATE_DISCONNECTED,
  ProbeStatus
} from '../../../main/ets/model/ProfileState';
import {
  bluetoothErrorHint,
  describeThrown,
  errorInfo,
  formatError,
  isKnownBluetoothCode
} from '../../../main/ets/utils/ErrorUtil';
import {
  formatDateTime,
  formatDuration,
  formatTime,
  pad2,
  truncateMiddle
} from '../../../main/ets/utils/FormatUtil';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../../../main/ets/common/Theme';

export default function bluetoothProfileDataTest() {
  describe('BluetoothProfileAddressTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_ADDRESS_0100
     * @tc.name addressNormalize
     * @tc.desc Verify deviceId normalization trims blanks and converts hex letters to uppercase.
     */
    it('addressNormalize', 0, () => {
      expect(normalizeDeviceId(' aa:bb:cc:dd:ee:ff ')).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(normalizeDeviceId('AA:BB:CC:DD:EE:FF')).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(normalizeDeviceId('')).assertEqual('');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_ADDRESS_0200
     * @tc.name addressValidate
     * @tc.desc Verify the local deviceId check rejects blank, wrong segment count and non hex input.
     */
    it('addressValidate', 0, () => {
      expect(isValidDeviceId('AA:BB:CC:DD:EE:FF')).assertTrue();
      expect(isValidDeviceId(' aa:bb:cc:dd:ee:ff ')).assertTrue();
      expect(isValidDeviceId('AA:BB:CC:DD:EE')).assertFalse();
      expect(isValidDeviceId('AA:BB:CC:DD:EE:FF:00')).assertFalse();
      expect(isValidDeviceId('GG:BB:CC:DD:EE:FF')).assertFalse();
      expect(isValidDeviceId('AABBCCDDEEFF')).assertFalse();
      expect(isValidDeviceId('')).assertFalse();
      expect(isValidDeviceId('   ')).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_ADDRESS_0300
     * @tc.name addressSplit
     * @tc.desc Verify deviceId splitting returns six segments for a valid address and empty for blanks.
     */
    it('addressSplit', 0, () => {
      expect(splitAddress('AA:BB:CC:DD:EE:FF').length).assertEqual(DEVICE_ID_SEGMENT_COUNT);
      expect(splitAddress('AA:BB:CC:DD:EE:FF')[0]).assertEqual('AA');
      expect(splitAddress('AA:BB:CC:DD:EE:FF')[5]).assertEqual('FF');
      expect(splitAddress('').length).assertEqual(0);
      expect(splitAddress('   ').length).assertEqual(0);
      expect(splitAddress('AABBCCDDEEFF').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_ADDRESS_0400
     * @tc.name addressMask
     * @tc.desc Verify masking keeps the first two and the last segment and falls back for invalid input.
     */
    it('addressMask', 0, () => {
      expect(maskDeviceId('aa:bb:cc:dd:ee:ff')).assertEqual('AA:BB:**:**:**:FF');
      expect(maskDeviceId(' AA:BB:CC:DD:EE:FF ')).assertEqual('AA:BB:**:**:**:FF');
      expect(maskDeviceId('')).assertEqual(EMPTY_DEVICE_ID_TEXT);
      expect(maskDeviceId('   ')).assertEqual(EMPTY_DEVICE_ID_TEXT);
      expect(maskDeviceId('not-a-mac')).assertEqual('NOT-A-MAC');
      expect(maskDeviceId('AA:BB:CC:DD:EE').includes('*')).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_ADDRESS_0500
     * @tc.name addressSameDevice
     * @tc.desc Verify device comparison ignores case and surrounding blanks.
     */
    it('addressSameDevice', 0, () => {
      expect(isSameDevice('aa:bb:cc:dd:ee:ff', ' AA:BB:CC:DD:EE:FF ')).assertTrue();
      expect(isSameDevice('AA:BB:CC:DD:EE:FF', 'AA:BB:CC:DD:EE:00')).assertFalse();
      expect(isSameDevice('', '')).assertTrue();
    });
  });

  describe('BluetoothProfileLogTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_LOG_0100
     * @tc.name logItemFields
     * @tc.desc Verify log item time format, default level and strictly increasing identifiers.
     */
    it('logItemFields', 0, () => {
      const head = new LogItem('设备', '测试', '设备侧日志', LogLevel.WARN, new Date(2026, 9, 27, 1, 2, 3));
      expect(head.time).assertEqual('01:02:03');
      expect(head.source).assertEqual('设备');
      expect(head.tag).assertEqual('测试');
      expect(head.detail).assertEqual('设备侧日志');
      expect(head.level).assertEqual(LogLevel.WARN);
      const next = new LogItem('设备', '测试', '第二条');
      expect(next.level).assertEqual(LogLevel.INFO);
      expect(next.id).assertEqual(head.id + 1);
      expect(next.time.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_LOG_0200
     * @tc.name logLevelNameText
     * @tc.desc Verify the four log levels are rendered with the expected uppercase names.
     */
    it('logLevelNameText', 0, () => {
      expect(logLevelName(LogLevel.DEBUG)).assertEqual('DEBUG');
      expect(logLevelName(LogLevel.INFO)).assertEqual('INFO');
      expect(logLevelName(LogLevel.WARN)).assertEqual('WARN');
      expect(logLevelName(LogLevel.ERROR)).assertEqual('ERROR');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_LOG_0300
     * @tc.name logAppendCapacity
     * @tc.desc Verify appendLog prepends new items, truncates to capacity and keeps the input array.
     */
    it('logAppendCapacity', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 4; i++) {
        logs = appendLog(logs, new LogItem('设备', '测试', `第${i}条`, LogLevel.INFO), 2);
      }
      expect(logs.length).assertEqual(2);
      expect(logs[0].detail).assertEqual('第3条');
      expect(logs[1].detail).assertEqual('第2条');
      const source: LogItem[] = [new LogItem('设备', '测试', '原始')];
      const appended = appendLog(source, new LogItem('设备', '测试', '新增'), LOG_STORE_CAPACITY);
      expect(source.length).assertEqual(1);
      expect(appended.length).assertEqual(2);
      expect(appended[0].detail).assertEqual('新增');
      const zeroCapacity = appendLog([], new LogItem('设备', '测试', '零容量'), 0);
      expect(zeroCapacity.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_LOG_0400
     * @tc.name logQueryFilter
     * @tc.desc Verify queryLogs filters by source, minimum level, keyword and result limit.
     */
    it('logQueryFilter', 0, () => {
      const logs: LogItem[] = [
        new LogItem('HFP', '创建', 'createHfpAgProfile 成功', LogLevel.INFO),
        new LogItem('PAN', '查询', 'getConnectedDevices 返回 1 个设备', LogLevel.WARN),
        new LogItem('MAP', '错误', 'createMapMseProfile 失败 801', LogLevel.ERROR)
      ];
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 20).length).assertEqual(3);
      expect(queryLogs(logs, 'PAN', LogLevel.DEBUG, '', 20).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.WARN, '', 20).length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.ERROR, '', 20).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'CONNECTEDDEVICES', 20).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '不存在', 20).length).assertEqual(0);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 2).length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length).assertEqual(3);
      expect(queryLogs(logs, '', LogLevel.WARN, 'zzz', 20).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_LOG_0500
     * @tc.name logCountAndClear
     * @tc.desc Verify tag counting and log clearing used by the page log panel.
     */
    it('logCountAndClear', 0, () => {
      const logs: LogItem[] = [
        new LogItem('HFP', '创建', 'a'),
        new LogItem('HFP', '查询', 'b'),
        new LogItem('PAN', '创建', 'c')
      ];
      expect(countByTag(logs, '创建')).assertEqual(2);
      expect(countByTag(logs, '查询')).assertEqual(1);
      expect(countByTag(logs, '不存在')).assertEqual(0);
      const cleared: LogItem[] = clearLogs();
      expect(cleared.length).assertEqual(0);
    });
  });

  describe('BluetoothProfileFormatTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_FORMAT_0100
     * @tc.name formatPadding
     * @tc.desc Verify two digit padding keeps single digit values prefixed with a zero.
     */
    it('formatPadding', 0, () => {
      expect(pad2(0)).assertEqual('00');
      expect(pad2(9)).assertEqual('09');
      expect(pad2(10)).assertEqual('10');
      expect(pad2(59)).assertEqual('59');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_FORMAT_0200
     * @tc.name formatTimeText
     * @tc.desc Verify the time and date time text keeps the documented zero padding.
     */
    it('formatTimeText', 0, () => {
      const date = new Date(2026, 9, 27, 1, 2, 3);
      expect(formatTime(date)).assertEqual('01:02:03');
      expect(formatDateTime(date)).assertEqual('2026-10-27 01:02:03');
      expect(formatTime(new Date(2026, 11, 31, 23, 59, 59))).assertEqual('23:59:59');
      expect(formatDateTime(new Date(2026, 0, 5, 8, 9, 10))).assertEqual('2026-01-05 08:09:10');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_FORMAT_0300
     * @tc.name formatDurationText
     * @tc.desc Verify the four duration branches: negative, milliseconds, seconds and minutes.
     */
    it('formatDurationText', 0, () => {
      expect(formatDuration(-1)).assertEqual('0 ms');
      expect(formatDuration(0)).assertEqual('0 ms');
      expect(formatDuration(999)).assertEqual('999 ms');
      expect(formatDuration(1000)).assertEqual('1.0 s');
      expect(formatDuration(1500)).assertEqual('1.5 s');
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
      expect(formatDuration(125000)).assertEqual('2 min 5 s');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_FORMAT_0400
     * @tc.name formatTruncateMiddle
     * @tc.desc Verify middle truncation keeps short text untouched and shortens long text.
     */
    it('formatTruncateMiddle', 0, () => {
      expect(truncateMiddle('abcdef', 3)).assertEqual('abcdef');
      expect(truncateMiddle('abcdef', 6)).assertEqual('abcdef');
      expect(truncateMiddle('abcdefgh', 5)).assertEqual('ab…gh');
      expect(truncateMiddle('abcdefgh', 7)).assertEqual('abc…fgh');
      const longText = 'createHfpAgProfile 失败 2900004，系统未编译该 Profile';
      expect(truncateMiddle(longText, 12).length).assertEqual(12);
    });
  });

  describe('BluetoothProfileErrorTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_ERROR_0100
     * @tc.name errorInfoFallback
     * @tc.desc Verify empty error message falls back to the unknown text and code classification.
     */
    it('errorInfoFallback', 0, () => {
      const denied = errorInfo(201, '');
      expect(denied.message).assertEqual('未知错误');
      expect(denied.describe()).assertEqual('[201] 未知错误');
      expect(denied.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      const passed = errorInfo(0, '已完成');
      expect(passed.describe()).assertEqual('已完成');
      expect(passed.status).assertEqual(ProbeStatus.IDLE);
      expect(denied.hint.includes('ACCESS_BLUETOOTH')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_ERROR_0200
     * @tc.name errorFormatText
     * @tc.desc Verify formatError renders both the coded and the uncoded failure text.
     */
    it('errorFormatText', 0, () => {
      expect(formatError('创建', 201, '')).assertEqual('创建失败（201）：未知错误');
      expect(formatError('查询', 2900003, 'Bluetooth disabled')).assertEqual('查询失败（2900003）：Bluetooth disabled');
      expect(formatError('查询', 0, 'OK')).assertEqual('查询失败：OK');
      expect(formatError('查询', 0, '')).assertEqual('查询失败：未知错误');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_ERROR_0300
     * @tc.name errorHintText
     * @tc.desc Verify each documented error code returns its own handling hint.
     */
    it('errorHintText', 0, () => {
      expect(bluetoothErrorHint(201).includes('ACCESS_BLUETOOTH')).assertTrue();
      expect(bluetoothErrorHint(401).includes('deviceId')).assertTrue();
      expect(bluetoothErrorHint(801).includes('未支持该 Profile 能力')).assertTrue();
      expect(bluetoothErrorHint(2900001).includes('蓝牙服务已停止')).assertTrue();
      expect(bluetoothErrorHint(2900003).includes('蓝牙未开启')).assertTrue();
      expect(bluetoothErrorHint(2900004).includes('Profile')).assertTrue();
      expect(bluetoothErrorHint(2900099).includes('hilog')).assertTrue();
      expect(bluetoothErrorHint(0)).assertEqual('操作已正常完成');
      expect(bluetoothErrorHint(888)).assertEqual('查看日志面板中的错误码与详细信息');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_ERROR_0400
     * @tc.name errorKnownCodeGuard
     * @tc.desc Verify the known bluetooth error code guard covers the seven documented codes only.
     */
    it('errorKnownCodeGuard', 0, () => {
      expect(isKnownBluetoothCode(201)).assertTrue();
      expect(isKnownBluetoothCode(401)).assertTrue();
      expect(isKnownBluetoothCode(801)).assertTrue();
      expect(isKnownBluetoothCode(2900001)).assertTrue();
      expect(isKnownBluetoothCode(2900003)).assertTrue();
      expect(isKnownBluetoothCode(2900004)).assertTrue();
      expect(isKnownBluetoothCode(2900099)).assertTrue();
      expect(isKnownBluetoothCode(0)).assertFalse();
      expect(isKnownBluetoothCode(888)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_ERROR_0500
     * @tc.name errorDescribeThrown
     * @tc.desc Verify the thrown error description joins the failure text with the handling hint.
     */
    it('errorDescribeThrown', 0, () => {
      const text = describeThrown('创建', 2900003, 'Bluetooth disabled');
      expect(text.includes('创建失败（2900003）：Bluetooth disabled')).assertTrue();
      expect(text.includes('蓝牙未开启')).assertTrue();
      expect(text.includes('；')).assertTrue();
    });
  });

  describe('BluetoothProfileSnapshotTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_SNAPSHOT_0100
     * @tc.name snapshotDefaultValues
     * @tc.desc Verify the default snapshot keeps the idle status, empty device list and zero state.
     */
    it('snapshotDefaultValues', 0, () => {
      const snapshot = new ProfileSnapshot(ProfileKind.HFP, {});
      expect(snapshot.kind).assertEqual(ProfileKind.HFP);
      expect(snapshot.status).assertEqual(ProbeStatus.IDLE);
      expect(snapshot.code).assertEqual(0);
      expect(snapshot.message).assertEqual('尚未创建 Profile 实例');
      expect(snapshot.devices.length).assertEqual(0);
      expect(snapshot.currentDeviceId).assertEqual('');
      expect(snapshot.currentState).assertEqual(CONNECTION_STATE_DISCONNECTED);
      expect(snapshot.subscribed).assertFalse();
      expect(snapshot.updatedAt.length).assertEqual(8);
      const fixed = new ProfileSnapshot(ProfileKind.HFP, { date: new Date(2026, 9, 27, 10, 11, 12) });
      expect(fixed.updatedAt).assertEqual('10:11:12');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_SNAPSHOT_0200
     * @tc.name snapshotDeriveKeepsFields
     * @tc.desc Verify derive and the with helpers only change the fields they are asked to change.
     */
    it('snapshotDeriveKeepsFields', 0, () => {
      const base = new ProfileSnapshot(ProfileKind.HFP, {
        devices: ['AA:BB:CC:DD:EE:FF'],
        date: new Date(2026, 9, 27, 9, 0, 0)
      });
      const ready = base.withStatus(ProbeStatus.READY, 0, 'hfp.createHfpAgProfile() 调用成功');
      expect(ready.status).assertEqual(ProbeStatus.READY);
      expect(ready.message.includes('createHfpAgProfile')).assertTrue();
      expect(ready.devices.length).assertEqual(1);
      expect(ready.kind).assertEqual(ProfileKind.HFP);
      const connected = ready.withConnection('AA:BB:CC:DD:EE:FF', CONNECTION_STATE_CONNECTED);
      expect(connected.currentDeviceId).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(connected.currentState).assertEqual(CONNECTION_STATE_CONNECTED);
      expect(connected.status).assertEqual(ProbeStatus.READY);
      const subscribed = connected.withSubscription(true);
      expect(subscribed.subscribed).assertTrue();
      expect(subscribed.currentState).assertEqual(CONNECTION_STATE_CONNECTED);
      const replaced = subscribed.withDevices([]);
      expect(replaced.devices.length).assertEqual(0);
      expect(replaced.subscribed).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_SNAPSHOT_0300
     * @tc.name snapshotDeviceQuery
     * @tc.desc Verify device count, device lookup and the status description text.
     */
    it('snapshotDeviceQuery', 0, () => {
      const devices: string[] = ['AA:BB:CC:DD:EE:FF'];
      const snapshot = new ProfileSnapshot(ProfileKind.HFP, { devices: devices });
      expect(snapshot.deviceCount()).assertEqual(1);
      expect(snapshot.hasDevice('AA:BB:CC:DD:EE:FF')).assertTrue();
      expect(snapshot.hasDevice('AA:BB:CC:DD:EE:00')).assertFalse();
      devices.push('11:22:33:44:55:66');
      expect(snapshot.deviceCount()).assertEqual(1);
      const described = snapshot.withStatus(ProbeStatus.READY, 0, 'ok').describe();
      expect(described).assertEqual('可用（0）ok');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_SNAPSHOT_0400
     * @tc.name snapshotPickDevice
     * @tc.desc Verify the selected device priority: current device, previous choice and first device.
     */
    it('snapshotPickDevice', 0, () => {
      const devices: string[] = ['AA:BB:CC:DD:EE:01', 'AA:BB:CC:DD:EE:02'];
      const snapshot = new ProfileSnapshot(ProfileKind.HFP, {
        devices: devices,
        currentDeviceId: 'AA:BB:CC:DD:EE:02'
      });
      expect(pickSelectedDevice(snapshot, null)).assertEqual('AA:BB:CC:DD:EE:02');
      const previous = ProfileViewState.fromSnapshot(snapshot, null);
      previous.selectedDevice = 'AA:BB:CC:DD:EE:01';
      const withoutCurrent = new ProfileSnapshot(ProfileKind.HFP, { devices: devices });
      expect(pickSelectedDevice(withoutCurrent, previous)).assertEqual('AA:BB:CC:DD:EE:01');
      const missing = new ProfileSnapshot(ProfileKind.HFP, { devices: devices });
      previous.selectedDevice = 'AA:BB:CC:DD:EE:09';
      expect(pickSelectedDevice(missing, previous)).assertEqual('AA:BB:CC:DD:EE:01');
      expect(pickSelectedDevice(new ProfileSnapshot(ProfileKind.HFP, {}), null)).assertEqual('');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_SNAPSHOT_0500
     * @tc.name snapshotViewRender
     * @tc.desc Verify the view state built from a snapshot fills every text bound by the demo page.
     */
    it('snapshotViewRender', 0, () => {
      const snapshot = new ProfileSnapshot(ProfileKind.HFP, {
        status: ProbeStatus.READY,
        devices: ['AA:BB:CC:DD:EE:FF'],
        currentDeviceId: 'AA:BB:CC:DD:EE:FF',
        currentState: CONNECTION_STATE_CONNECTED,
        subscribed: true,
        date: new Date(2026, 9, 27, 7, 8, 9)
      });
      const view = ProfileViewState.fromSnapshot(snapshot, null);
      expect(view.status).assertEqual(ProbeStatus.READY);
      expect(view.statusText).assertEqual('可用');
      expect(view.hintText.includes('Profile 实例')).assertTrue();
      expect(view.deviceSummary).assertEqual('1 台已连接设备');
      expect(view.maskedDevices[0]).assertEqual('AA:BB:**:**:**:FF');
      expect(view.connectionText).assertEqual('AA:BB:**:**:**:FF · 已连接');
      expect(view.subscribed).assertTrue();
      expect(view.updatedAt).assertEqual('07:08:09');
      expect(view.selectedDevice).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(view.hasDevices()).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_SNAPSHOT_0600
     * @tc.name snapshotViewEmpty
     * @tc.desc Verify the empty snapshot view shows the idle placeholders instead of connection text.
     */
    it('snapshotViewEmpty', 0, () => {
      const view = ProfileViewState.fromSnapshot(new ProfileSnapshot(ProfileKind.HFP, {}), null);
      expect(view.hasDevices()).assertFalse();
      expect(view.deviceSummary).assertEqual('暂无已连接设备');
      expect(view.connectionText).assertEqual('尚未查询连接状态');
      expect(view.maskedDevices.length).assertEqual(0);
      expect(view.selectedDevice).assertEqual('');
      expect(view.statusText).assertEqual('未探测');
      expect(view.message).assertEqual('尚未创建 Profile 实例');
      expect(view.updatedAt.length).assertEqual(8);
    });
  });

  describe('BluetoothProfileThemeTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_THEME_0100
     * @tc.name themeColorPairs
     * @tc.desc Verify the semantic colors keep the strong text and the soft background distinct.
     */
    it('themeColorPairs', 0, () => {
      expect(AppColors.PRIMARY).assertEqual('#0A59F7');
      expect(AppColors.PRIMARY === AppColors.PRIMARY_SOFT).assertFalse();
      expect(AppColors.TEXT_PRIMARY === AppColors.TEXT_SECONDARY).assertFalse();
      expect(AppColors.DANGER === AppColors.DANGER_SOFT).assertFalse();
      expect(AppColors.WARNING === AppColors.WARNING_SOFT).assertFalse();
      expect(AppColors.SUCCESS === AppColors.SUCCESS_SOFT).assertFalse();
      expect(AppColors.CARD_BG).assertEqual('#FFFFFF');
    });

    /**
     * @tc.number SUB_BLUETOOTH_PROFILE_THEME_0200
     * @tc.name themeScaleOrder
     * @tc.desc Verify spacing, radius, text and size scales increase in the documented order.
     */
    it('themeScaleOrder', 0, () => {
      expect(AppSpacing.XS < AppSpacing.SM).assertTrue();
      expect(AppSpacing.SM < AppSpacing.MD).assertTrue();
      expect(AppSpacing.MD < AppSpacing.LG).assertTrue();
      expect(AppSpacing.LG < AppSpacing.XL).assertTrue();
      expect(AppSpacing.XL < AppSpacing.CARD).assertTrue();
      expect(AppSpacing.CARD < AppSpacing.PAGE).assertTrue();
      expect(AppSpacing.PAGE < AppSpacing.LARGE).assertTrue();
      expect(AppSpacing.LARGE < AppSpacing.XLARGE).assertTrue();
      expect(AppRadius.TAG < AppRadius.SMALL).assertTrue();
      expect(AppRadius.SMALL < AppRadius.CARD).assertTrue();
      expect(AppRadius.CARD < AppRadius.LARGE).assertTrue();
      expect(AppRadius.LARGE < AppRadius.PILL).assertTrue();
      expect(AppText.CAPTION < AppText.SMALL).assertTrue();
      expect(AppText.SMALL < AppText.BODY).assertTrue();
      expect(AppText.BODY < AppText.LABEL).assertTrue();
      expect(AppText.LABEL < AppText.TITLE).assertTrue();
      expect(AppText.TITLE < AppText.SECTION).assertTrue();
      expect(AppText.SECTION < AppText.HEADING).assertTrue();
      expect(AppText.HEADING < AppText.DISPLAY).assertTrue();
      expect(AppSize.BUTTON_SM < AppSize.BUTTON).assertTrue();
      expect(AppSize.BUTTON < AppSize.BUTTON_MD).assertTrue();
      expect(AppSize.MONO_CHIP_HEIGHT > 0).assertTrue();
    });
  });
}
