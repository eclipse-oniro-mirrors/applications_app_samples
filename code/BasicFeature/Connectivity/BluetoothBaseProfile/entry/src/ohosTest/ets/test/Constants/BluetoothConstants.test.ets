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
import {
  A2dpConnectionState,
  A2dpService,
  AvrcpPlaybackState,
  BluetoothConnectionState,
  BluetoothConstants,
  BluetoothConstants as BtConstants,
  BluetoothProfileType,
  BluetoothScanState,
  Constants,
  HdpDataType,
  HfpConnectionState,
  HfpService,
  HidDeviceType,
  MapMessageType,
  PanNetworkRole,
  PbapSortOrder,
  ValidationUtils
} from 'library';

const EXPECTED_ERROR_CODE_COUNT: number = 11;
const EXPECTED_UUID_COUNT: number = 10;
const RECOVERABLE_CODE_COUNT: number = 3;
const PERMANENT_CODE_COUNT: number = 3;
const NEUTRAL_CODE_COUNT: number = 5;
const UUID_TAIL: string = '-0000-1000-8000-00805f9b34fb';
const UUID_PREFIX_LENGTH: number = 8;
const UNKNOWN_ERROR_PREFIX: string = 'Unknown error (code: ';
const COLON_MAC_ADDRESS: string = '00:11:22:33:44:55';
const DASH_MAC_ADDRESS: string = '00-11-22-33-44-55';
const SHORT_MAC_ADDRESS: string = '00:11:22:33:44:5';
const UPPER_UUID: string = '0000110A-0000-1000-8000-00805F9B34FB';
const DEFAULT_AUDIO_VOLUME: number = 50;

/**
 * 列出 BluetoothConstants 中全部已定义错误码，用于分类与唯一性统计。
 * @returns {number[]} 已定义错误码集合
 */
function definedErrorCodes(): number[] {
  return [
    BluetoothConstants.ERROR_PERMISSION_DENIED,
    BluetoothConstants.ERROR_INTERNAL,
    BluetoothConstants.ERROR_BLUETOOTH_DISABLED,
    BluetoothConstants.ERROR_DEVICE_NOT_FOUND,
    BluetoothConstants.ERROR_CONNECTION_TIMEOUT,
    BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED,
    BluetoothConstants.ERROR_ALREADY_CONNECTED,
    BluetoothConstants.ERROR_NOT_PAIRED,
    BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED,
    BluetoothConstants.ERROR_AUTHENTICATION_FAILED,
    BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE
  ];
}

/**
 * 统计集合中重复出现的元素数量。
 * @param {string[]} values - 待统计的字符串集合
 * @returns {number} 重复元素对数
 */
function duplicateCount(values: string[]): number {
  let duplicated: number = 0;
  for (let i = 0; i < values.length; i++) {
    for (let j = i + 1; j < values.length; j++) {
      if (values[i] === values[j]) {
        duplicated += 1;
      }
    }
  }
  return duplicated;
}

/**
 * 生成长度为 length 的设备名称。
 * @param {number} length - 目标名称长度
 * @returns {string} 由小写字母组成的名称
 */
function buildDeviceName(length: number): string {
  let name: string = '';
  for (let i = 0; i < length; i++) {
    name += 'a';
  }
  return name;
}

/**
 * 读取 A2DP 当前音量，播放信息缺失时返回 -1。
 * @param {A2dpService} service - 被测 A2DP 服务
 * @returns {number} 当前音量
 */
function a2dpVolume(service: A2dpService): number {
  const info = service.getPlaybackInfo();
  return info === null ? -1 : info.volume;
}

/**
 * 读取 A2DP 静音标记，播放信息缺失时返回 false。
 * @param {A2dpService} service - 被测 A2DP 服务
 * @returns {boolean} 是否静音
 */
function a2dpMuted(service: A2dpService): boolean {
  const info = service.getPlaybackInfo();
  return info === null ? false : info.isMuted;
}

/**
 * 读取 HFP 音频配置中的指定音量，配置缺失时返回 -1。
 * @param {HfpService} service - 被测 HFP 服务
 * @param {string} field - 音量字段名
 * @returns {number} 音量值
 */
function hfpVolume(service: HfpService, field: string): number {
  const config = service.getAudioConfig();
  if (config === null) {
    return -1;
  }
  return field === 'mic' ? config.micVolume : config.speakerVolume;
}

/**
 * @description Test suite for BluetoothConstants
 * @since 26.0.0
 */
export default function bluetoothConstantsTest(): void {
  describe('BluetoothConstantsTest', () => {
    // ==================== 标识与错误码常量（2 条） ====================

    /*
     * @tc.number: SUB_BT_CONST_0100
     * @tc.name: testBluetoothConstants0001
     * @tc.desc: Verify the application identity and log tag constants exposed to every Bluetooth module.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothConstants0001', 0, () => {
      expect(BluetoothConstants.TAG).assertEqual('[Sample_BluetoothBaseProfile]');
      expect(BluetoothConstants.TAG.length).assertEqual(29);
      expect(BluetoothConstants.TAG.indexOf('[Sample_')).assertEqual(0);
      expect(BluetoothConstants.TAG.substring(BluetoothConstants.TAG.length - 1)).assertEqual(']');

      expect(BluetoothConstants.DOMAIN).assertEqual(0xF830);
      expect(BluetoothConstants.DOMAIN).assertEqual(63536);
      expect(BluetoothConstants.TRACE_DOMAIN).assertEqual(BluetoothConstants.DOMAIN);
      expect(BluetoothConstants.EVENT_DOMAIN).assertEqual(BluetoothConstants.DOMAIN);

      expect(BluetoothConstants.BUNDLE_NAME).assertEqual('com.samples.bluetoothbaseprofile');
      expect(BluetoothConstants.BUNDLE_NAME.length).assertEqual(32);
      expect(BluetoothConstants.BUNDLE_NAME.split('.').length).assertEqual(3);

      expect(BluetoothConstants.EVENT_GROUP).assertEqual('bluetoothBaseProfileEvent');
      expect(BluetoothConstants.EVENT_GROUP.length).assertEqual(25);
      expect(BluetoothConstants.EVENT_GROUP.indexOf('bluetooth')).assertEqual(0);

      expect(BtConstants.TAG).assertEqual(BluetoothConstants.TAG);
      expect(BtConstants.DOMAIN).assertEqual(BluetoothConstants.DOMAIN);
      expect(BtConstants.BUNDLE_NAME).assertEqual(BluetoothConstants.BUNDLE_NAME);
    });

    /*
     * @tc.number: SUB_BT_CONST_0200
     * @tc.name: testBluetoothConstants0002
     * @tc.desc: Verify every declared Bluetooth error code and the spacing between adjacent codes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothConstants0002', 0, () => {
      expect(BluetoothConstants.ERROR_PERMISSION_DENIED).assertEqual(201);
      expect(BluetoothConstants.ERROR_INTERNAL).assertEqual(35200001);
      expect(BluetoothConstants.ERROR_BLUETOOTH_DISABLED).assertEqual(35200002);
      expect(BluetoothConstants.ERROR_DEVICE_NOT_FOUND).assertEqual(35200003);
      expect(BluetoothConstants.ERROR_CONNECTION_TIMEOUT).assertEqual(35200004);
      expect(BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED).assertEqual(35200005);
      expect(BluetoothConstants.ERROR_ALREADY_CONNECTED).assertEqual(35200006);
      expect(BluetoothConstants.ERROR_NOT_PAIRED).assertEqual(35200007);
      expect(BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED).assertEqual(35200008);
      expect(BluetoothConstants.ERROR_AUTHENTICATION_FAILED).assertEqual(35200009);
      expect(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE).assertEqual(35200010);

      expect(BluetoothConstants.ERROR_BLUETOOTH_DISABLED - BluetoothConstants.ERROR_INTERNAL).assertEqual(1);
      expect(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE - BluetoothConstants.ERROR_INTERNAL)
        .assertEqual(EXPECTED_ERROR_CODE_COUNT - 2);
      expect(BluetoothConstants.ERROR_PERMISSION_DENIED < 1000).assertTrue();

      const codes: number[] = definedErrorCodes();
      expect(codes.length).assertEqual(EXPECTED_ERROR_CODE_COUNT);
      let duplicated: number = 0;
      for (let i = 0; i < codes.length; i++) {
        for (let j = i + 1; j < codes.length; j++) {
          if (codes[i] === codes[j]) {
            duplicated += 1;
          }
        }
      }
      expect(duplicated).assertEqual(0);
    });

    // ==================== 错误码文案与错误分类（4 条） ====================

    /*
     * @tc.number: SUB_BT_CONST_0300
     * @tc.name: testBluetoothConstants0003
     * @tc.desc: Query the message text of every defined error code and confirm all texts are distinct.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothConstants0003', 0, () => {
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_PERMISSION_DENIED))
        .assertEqual('Permission denied. Please grant Bluetooth permissions.');
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL))
        .assertEqual('Internal system error. Please try again.');
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_BLUETOOTH_DISABLED))
        .assertEqual('Bluetooth is disabled. Please enable Bluetooth.');
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_DEVICE_NOT_FOUND))
        .assertEqual('Device not found. Please ensure the device is in range.');
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_CONNECTION_TIMEOUT))
        .assertEqual('Connection timed out. Please try again.');
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED))
        .assertEqual('Profile not supported by this device.');
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_ALREADY_CONNECTED))
        .assertEqual('Device is already connected.');
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_NOT_PAIRED))
        .assertEqual('Device is not paired. Please pair first.');
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED))
        .assertEqual('Service discovery failed.');
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_AUTHENTICATION_FAILED))
        .assertEqual('Authentication failed. Please try pairing again.');
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE))
        .assertEqual('Bluetooth resource unavailable.');

      const messages: string[] = [];
      for (const code of definedErrorCodes()) {
        messages.push(BluetoothConstants.getErrorMessage(code));
      }
      expect(messages.length).assertEqual(EXPECTED_ERROR_CODE_COUNT);
      expect(duplicateCount(messages)).assertEqual(0);
      expect(messages[0].indexOf(UNKNOWN_ERROR_PREFIX)).assertEqual(-1);
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_PERMISSION_DENIED)
        .indexOf('Permission')).assertEqual(0);
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_ALREADY_CONNECTED).length)
        .assertEqual('Device is already connected.'.length);
    });

    /*
     * @tc.number: SUB_BT_CONST_0400
     * @tc.name: testBluetoothConstants0004
     * @tc.desc: Verify undefined error codes fall back to the generated unknown error text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothConstants0004', 0, () => {
      expect(BluetoothConstants.getErrorMessage(0)).assertEqual('Unknown error (code: 0)');
      expect(BluetoothConstants.getErrorMessage(-1)).assertEqual('Unknown error (code: -1)');
      expect(BluetoothConstants.getErrorMessage(200)).assertEqual('Unknown error (code: 200)');
      expect(BluetoothConstants.getErrorMessage(202)).assertEqual('Unknown error (code: 202)');
      expect(BluetoothConstants.getErrorMessage(35200000))
        .assertEqual('Unknown error (code: 35200000)');
      expect(BluetoothConstants.getErrorMessage(35200011))
        .assertEqual('Unknown error (code: 35200011)');
      expect(BluetoothConstants.getErrorMessage(201.5)).assertEqual('Unknown error (code: 201.5)');
      expect(BluetoothConstants.getErrorMessage(Number.NaN)).assertEqual('Unknown error (code: NaN)');

      expect(BluetoothConstants.getErrorMessage(35200011).length).assertEqual(30);
      expect(BluetoothConstants.getErrorMessage(35200011).indexOf(UNKNOWN_ERROR_PREFIX)).assertEqual(0);
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL)
        .indexOf(UNKNOWN_ERROR_PREFIX)).assertEqual(-1);
      expect(BluetoothConstants.getErrorMessage(200))
        .assertEqual('Unknown error (code: ' + 200 + ')');
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL))
        .assertEqual('Internal system error. Please try again.');
    });

    /*
     * @tc.number: SUB_BT_CONST_0500
     * @tc.name: testBluetoothConstants0005
     * @tc.desc: Classify every defined error code as recoverable and confirm only retryable failures qualify.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothConstants0005', 0, () => {
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_CONNECTION_TIMEOUT)).assertTrue();
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED))
        .assertTrue();
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE))
        .assertTrue();

      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_PERMISSION_DENIED)).assertFalse();
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_INTERNAL)).assertFalse();
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_BLUETOOTH_DISABLED)).assertFalse();
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_DEVICE_NOT_FOUND)).assertFalse();
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED))
        .assertFalse();
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_ALREADY_CONNECTED)).assertFalse();
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_NOT_PAIRED)).assertFalse();
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_AUTHENTICATION_FAILED))
        .assertFalse();

      let recoverable: number = 0;
      for (const code of definedErrorCodes()) {
        if (BluetoothConstants.isRecoverableError(code)) {
          recoverable += 1;
        }
      }
      expect(recoverable).assertEqual(RECOVERABLE_CODE_COUNT);

      expect(BluetoothConstants.isRecoverableError(0)).assertFalse();
      expect(BluetoothConstants.isRecoverableError(-1)).assertFalse();
      expect(BluetoothConstants.isRecoverableError(999999)).assertFalse();
    });

    /*
     * @tc.number: SUB_BT_CONST_0600
     * @tc.name: testBluetoothConstants0006
     * @tc.desc: Classify permanent failures and confirm the permanent and recoverable sets never overlap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothConstants0006', 0, () => {
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_PERMISSION_DENIED)).assertTrue();
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_BLUETOOTH_DISABLED)).assertTrue();
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED)).assertTrue();

      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_INTERNAL)).assertFalse();
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_DEVICE_NOT_FOUND)).assertFalse();
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_CONNECTION_TIMEOUT)).assertFalse();
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_ALREADY_CONNECTED)).assertFalse();
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_NOT_PAIRED)).assertFalse();
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED))
        .assertFalse();
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_AUTHENTICATION_FAILED)).assertFalse();
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE)).assertFalse();

      let permanent: number = 0;
      let conflict: number = 0;
      let neutral: number = 0;
      for (const code of definedErrorCodes()) {
        const recoverable: boolean = BluetoothConstants.isRecoverableError(code);
        const isPermanent: boolean = BluetoothConstants.isPermanentError(code);
        if (isPermanent) {
          permanent += 1;
        }
        if (recoverable && isPermanent) {
          conflict += 1;
        }
        if (!recoverable && !isPermanent) {
          neutral += 1;
        }
      }
      expect(permanent).assertEqual(PERMANENT_CODE_COUNT);
      expect(conflict).assertEqual(0);
      expect(neutral).assertEqual(NEUTRAL_CODE_COUNT);
      expect(permanent + RECOVERABLE_CODE_COUNT + neutral).assertEqual(EXPECTED_ERROR_CODE_COUNT);

      expect(BluetoothConstants.isPermanentError(0)).assertFalse();
      expect(BluetoothConstants.isPermanentError(35200099)).assertFalse();
    });

    // ==================== 运行限额与定时常量（2 条） ====================

    /*
     * @tc.number: SUB_BT_CONST_0700
     * @tc.name: testBluetoothConstants0007
     * @tc.desc: Verify global limit and timing constants and confirm repeated initialization keeps them stable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothConstants0007', 0, () => {
      expect(BluetoothConstants.MAX_LOG_ENTRIES).assertEqual(200);
      expect(BluetoothConstants.MAX_RETRY_COUNT).assertEqual(3);
      expect(BluetoothConstants.OPERATION_TIMEOUT_MS).assertEqual(10000);
      expect(BluetoothConstants.REFRESH_INTERVAL_MS).assertEqual(5000);
      expect(BluetoothConstants.SCAN_TIMEOUT_MS).assertEqual(30000);
      expect(BluetoothConstants.MAX_CONNECTED_DEVICES).assertEqual(7);
      expect(BluetoothConstants.MAX_SCAN_DEVICES).assertEqual(50);
      expect(BluetoothConstants.MAX_HISTORY_SIZE).assertEqual(500);
      expect(BluetoothConstants.MAX_DEVICE_CACHE).assertEqual(100);
      expect(BluetoothConstants.DEFAULT_SCAN_INTERVAL).assertEqual(5000);
      expect(BluetoothConstants.CONNECTION_CHECK_INTERVAL).assertEqual(10000);
      expect(BluetoothConstants.AUTO_RECONNECT_DELAY).assertEqual(3000);
      expect(BluetoothConstants.MAX_AUTO_RECONNECT).assertEqual(5);

      expect(BluetoothConstants.SCAN_TIMEOUT_MS)
        .assertEqual(BluetoothConstants.OPERATION_TIMEOUT_MS * 3);
      expect(BluetoothConstants.CONNECTION_CHECK_INTERVAL)
        .assertEqual(BluetoothConstants.OPERATION_TIMEOUT_MS);
      expect(BluetoothConstants.DEFAULT_SCAN_INTERVAL)
        .assertEqual(BluetoothConstants.REFRESH_INTERVAL_MS);
      expect(BluetoothConstants.MAX_AUTO_RECONNECT > BluetoothConstants.MAX_RETRY_COUNT).assertTrue();
      expect(BluetoothConstants.MAX_HISTORY_SIZE > BluetoothConstants.MAX_LOG_ENTRIES).assertTrue();
      expect(BluetoothConstants.MAX_LOG_ENTRIES > BluetoothConstants.MAX_DEVICE_CACHE).assertTrue();
      expect(BluetoothConstants.MAX_DEVICE_CACHE > BluetoothConstants.MAX_SCAN_DEVICES).assertTrue();
      expect(BluetoothConstants.AUTO_RECONNECT_DELAY * BluetoothConstants.MAX_AUTO_RECONNECT)
        .assertEqual(15000);

      const tagBefore: string = BluetoothConstants.TAG;
      const domainBefore: number = BluetoothConstants.DOMAIN;
      const deviceLimitBefore: number = BluetoothConstants.MAX_CONNECTED_DEVICES;
      const internalMessageBefore: string =
        BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL);

      BluetoothConstants.initialize();
      BluetoothConstants.initialize();

      expect(BluetoothConstants.TAG).assertEqual(tagBefore);
      expect(BluetoothConstants.DOMAIN).assertEqual(domainBefore);
      expect(BluetoothConstants.MAX_CONNECTED_DEVICES).assertEqual(deviceLimitBefore);
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL))
        .assertEqual(internalMessageBefore);
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_CONNECTION_TIMEOUT)).assertTrue();
      expect(BluetoothConstants.MAX_SCAN_DEVICES).assertEqual(50);
    });

    /*
     * @tc.number: SUB_BT_CONST_0800
     * @tc.name: testBluetoothConstants0008
     * @tc.desc: Verify profile specific capacity, payload and sampling constants and their size relationships.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothConstants0008', 0, () => {
      expect(BluetoothConstants.MAX_MESSAGE_LENGTH).assertEqual(1600);
      expect(BluetoothConstants.MAX_CONTACT_ENTRIES).assertEqual(1000);
      expect(BluetoothConstants.HEALTH_SAMPLE_INTERVAL).assertEqual(1000);
      expect(BluetoothConstants.AUDIO_BUFFER_SIZE).assertEqual(4096);
      expect(BluetoothConstants.PAN_MTU_SIZE).assertEqual(1500);
      expect(BluetoothConstants.SYNC_CHUNK_SIZE).assertEqual(50);
      expect(BluetoothConstants.MAX_DEVICE_NAME_LENGTH).assertEqual(248);
      expect(BluetoothConstants.MAC_ADDRESS_LENGTH).assertEqual(17);
      expect(BluetoothConstants.UUID_LENGTH).assertEqual(36);

      expect(BluetoothConstants.AUDIO_BUFFER_SIZE).assertEqual(1024 * 4);
      expect(BluetoothConstants.AUDIO_BUFFER_SIZE > BluetoothConstants.PAN_MTU_SIZE).assertTrue();
      expect(BluetoothConstants.SYNC_CHUNK_SIZE).assertEqual(BluetoothConstants.MAX_SCAN_DEVICES);
      expect(BluetoothConstants.MAX_CONTACT_ENTRIES > BluetoothConstants.MAX_DEVICE_CACHE).assertTrue();
      expect(BluetoothConstants.MAX_MESSAGE_LENGTH > BluetoothConstants.MAX_DEVICE_NAME_LENGTH).assertTrue();
      expect(BluetoothConstants.HEALTH_SAMPLE_INTERVAL * 3)
        .assertEqual(BluetoothConstants.AUTO_RECONNECT_DELAY);
      expect(BluetoothConstants.MAC_ADDRESS_LENGTH).assertEqual(6 * 2 + 5);
      expect(BluetoothConstants.UUID_LENGTH).assertEqual(32 + 4);
      expect(BluetoothConstants.PAN_MTU_SIZE % 100).assertEqual(0);
      expect(BluetoothConstants.MAX_MESSAGE_LENGTH % BluetoothConstants.SYNC_CHUNK_SIZE).assertEqual(0);
    });

    // ==================== 常量与真实校验逻辑的一致性（3 条） ====================

    /*
     * @tc.number: SUB_BT_CONST_0900
     * @tc.name: testBluetoothConstants0009
     * @tc.desc: Verify service UUID constants satisfy the declared UUID length and both shipped UUID validators.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothConstants0009', 0, () => {
      expect(BluetoothConstants.UUID_A2DP_SOURCE).assertEqual('0000110a' + UUID_TAIL);
      expect(BluetoothConstants.UUID_HFP).assertEqual('0000111e' + UUID_TAIL);
      expect(BluetoothConstants.UUID_HDP).assertEqual('00001400' + UUID_TAIL);

      const uuids: string[] = [
        BluetoothConstants.UUID_A2DP_SOURCE,
        BluetoothConstants.UUID_A2DP_SINK,
        BluetoothConstants.UUID_HFP,
        BluetoothConstants.UUID_HID,
        BluetoothConstants.UUID_PAN,
        BluetoothConstants.UUID_PBAP,
        BluetoothConstants.UUID_MAP,
        BluetoothConstants.UUID_AVRCP_CONTROLLER,
        BluetoothConstants.UUID_AVRCP_TARGET,
        BluetoothConstants.UUID_HDP
      ];
      expect(uuids.length).assertEqual(EXPECTED_UUID_COUNT);

      let lengthMatched: number = 0;
      let tailMatched: number = 0;
      let strictValid: number = 0;
      let resultValid: number = 0;
      let errorCodeZero: number = 0;
      const prefixes: string[] = [];
      for (const uuid of uuids) {
        if (uuid.length === BluetoothConstants.UUID_LENGTH) {
          lengthMatched += 1;
        }
        if (uuid.substring(UUID_PREFIX_LENGTH) === UUID_TAIL) {
          tailMatched += 1;
        }
        if (Constants.isValidUuid(uuid)) {
          strictValid += 1;
        }
        const validation = ValidationUtils.validateUuid(uuid);
        if (validation.isValid) {
          resultValid += 1;
        }
        if (validation.errorCode === 0) {
          errorCodeZero += 1;
        }
        prefixes.push(uuid.substring(0, UUID_PREFIX_LENGTH));
      }
      expect(lengthMatched).assertEqual(EXPECTED_UUID_COUNT);
      expect(tailMatched).assertEqual(EXPECTED_UUID_COUNT);
      expect(strictValid).assertEqual(EXPECTED_UUID_COUNT);
      expect(resultValid).assertEqual(EXPECTED_UUID_COUNT);
      expect(errorCodeZero).assertEqual(EXPECTED_UUID_COUNT);
      expect(duplicateCount(prefixes)).assertEqual(0);

      expect(Constants.isValidUuid(UPPER_UUID)).assertFalse();
      expect(ValidationUtils.validateUuid(UPPER_UUID).isValid).assertTrue();
      expect(ValidationUtils.validateUuid(UPPER_UUID).errorCode).assertEqual(0);

      const truncated: string =
        BluetoothConstants.UUID_A2DP_SOURCE.substring(0, BluetoothConstants.UUID_LENGTH - 1);
      expect(truncated.length).assertEqual(35);
      expect(Constants.isValidUuid(truncated)).assertFalse();
      expect(ValidationUtils.validateUuid(truncated).isValid).assertFalse();
      expect(ValidationUtils.validateUuid(truncated).errorCode).assertEqual(2);
      expect(ValidationUtils.validateUuid(truncated).errorMessage).assertEqual('Invalid UUID format');
      expect(ValidationUtils.validateUuid('').errorCode).assertEqual(1);
      expect(ValidationUtils.validateUuid('').errorMessage).assertEqual('UUID is empty');
    });

    /*
     * @tc.number: SUB_BT_CONST_1000
     * @tc.name: testBluetoothConstants0010
     * @tc.desc: Verify device name and MAC address length limits against the validators that consume them.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothConstants0010', 0, () => {
      const maxName: string = buildDeviceName(BluetoothConstants.MAX_DEVICE_NAME_LENGTH);
      const overName: string = buildDeviceName(BluetoothConstants.MAX_DEVICE_NAME_LENGTH + 1);
      expect(maxName.length).assertEqual(248);
      expect(overName.length).assertEqual(249);

      const maxResult = ValidationUtils.validateDeviceName(maxName);
      expect(maxResult.isValid).assertTrue();
      expect(maxResult.errorCode).assertEqual(0);
      expect(maxResult.errorMessage).assertEqual('');

      const overResult = ValidationUtils.validateDeviceName(overName);
      expect(overResult.isValid).assertFalse();
      expect(overResult.errorCode).assertEqual(2);
      expect(overResult.errorMessage).assertEqual('Device name too long');

      const emptyResult = ValidationUtils.validateDeviceName('');
      expect(emptyResult.isValid).assertFalse();
      expect(emptyResult.errorCode).assertEqual(1);
      expect(emptyResult.errorMessage).assertEqual('Device name is empty');
      expect(ValidationUtils.validateDeviceName('a').isValid).assertTrue();

      expect(COLON_MAC_ADDRESS.length).assertEqual(BluetoothConstants.MAC_ADDRESS_LENGTH);
      expect(DASH_MAC_ADDRESS.length).assertEqual(BluetoothConstants.MAC_ADDRESS_LENGTH);
      expect(Constants.isValidMacAddress(COLON_MAC_ADDRESS)).assertTrue();
      expect(Constants.isValidMacAddress(DASH_MAC_ADDRESS)).assertFalse();
      expect(Constants.isValidMacAddress(SHORT_MAC_ADDRESS)).assertFalse();
      expect(ValidationUtils.validateMacAddress(COLON_MAC_ADDRESS).isValid).assertTrue();
      expect(ValidationUtils.validateMacAddress(DASH_MAC_ADDRESS).isValid).assertTrue();
      expect(ValidationUtils.validateMacAddress(SHORT_MAC_ADDRESS).errorCode).assertEqual(2);
      expect(ValidationUtils.validateMacAddress(SHORT_MAC_ADDRESS).errorMessage)
        .assertEqual('Invalid MAC format');
      expect(ValidationUtils.validateMacAddress('').errorCode).assertEqual(1);
      expect(ValidationUtils.validateMacAddress('').errorMessage).assertEqual('MAC address is empty');
      expect(ValidationUtils.validateMacAddress('AA:BB:CC:DD:EE:FF').isValid).assertTrue();
      expect(ValidationUtils.validateMacAddress('00:11:22:33:44:5G').isValid).assertFalse();
    });

    /*
     * @tc.number: SUB_BT_CONST_1100
     * @tc.name: testBluetoothConstants0011
     * @tc.desc: Verify audio codec and volume constants against the limits actually applied by the profile services.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothConstants0011', 0, async () => {
      expect(BluetoothConstants.CODEC_SBC).assertEqual('SBC');
      expect(BluetoothConstants.CODEC_AAC).assertEqual('AAC');
      expect(BluetoothConstants.CODEC_APTX).assertEqual('aptX');
      expect(BluetoothConstants.CODEC_LDAC).assertEqual('LDAC');
      expect(BluetoothConstants.DEFAULT_SAMPLE_RATE).assertEqual(44100);
      expect(BluetoothConstants.HIRES_SAMPLE_RATE).assertEqual(96000);
      expect(BluetoothConstants.DEFAULT_BIT_RATE).assertEqual(320);
      expect(BluetoothConstants.MIN_VOLUME).assertEqual(0);
      expect(BluetoothConstants.MAX_VOLUME).assertEqual(100);
      expect(BluetoothConstants.MAX_HFP_SPEAKER_VOLUME).assertEqual(15);
      expect(BluetoothConstants.MAX_HFP_MIC_VOLUME).assertEqual(15);

      expect(BluetoothConstants.HIRES_SAMPLE_RATE > BluetoothConstants.DEFAULT_SAMPLE_RATE).assertTrue();
      expect(BluetoothConstants.MAX_HFP_SPEAKER_VOLUME).assertEqual(BluetoothConstants.MAX_HFP_MIC_VOLUME);
      expect(BluetoothConstants.MAX_VOLUME % BluetoothConstants.MAX_HFP_SPEAKER_VOLUME).assertEqual(10);

      const a2dpService = new A2dpService();
      expect(await a2dpService.initialize()).assertTrue();
      expect(await a2dpService.setVolume(-20)).assertTrue();
      expect(a2dpVolume(a2dpService)).assertEqual(BluetoothConstants.MIN_VOLUME);
      expect(a2dpMuted(a2dpService)).assertTrue();
      expect(await a2dpService.setVolume(150)).assertTrue();
      expect(a2dpVolume(a2dpService)).assertEqual(BluetoothConstants.MAX_VOLUME);
      expect(a2dpMuted(a2dpService)).assertFalse();
      expect(a2dpVolume(a2dpService)).assertEqual(a2dpService.getModel().volume);
      expect(await a2dpService.setVolume(80)).assertTrue();
      expect(a2dpVolume(a2dpService)).assertEqual(80);
      await a2dpService.destroy();
      expect(a2dpService.getSupportedCodecs().length).assertEqual(0);
      expect(a2dpService.isConnected()).assertFalse();
      expect(a2dpVolume(a2dpService)).assertEqual(DEFAULT_AUDIO_VOLUME);
      expect(await a2dpService.setVolume(30)).assertFalse();
      expect(a2dpVolume(a2dpService)).assertEqual(DEFAULT_AUDIO_VOLUME);

      const hfpService = new HfpService();
      expect(await hfpService.initialize()).assertTrue();
      expect(hfpVolume(hfpService, 'speaker')).assertEqual(DEFAULT_AUDIO_VOLUME);
      expect(await hfpService.setSpeakerVolume(200)).assertTrue();
      expect(hfpVolume(hfpService, 'speaker')).assertEqual(BluetoothConstants.MAX_VOLUME);
      expect(await hfpService.setMicVolume(200)).assertTrue();
      expect(hfpVolume(hfpService, 'mic')).assertEqual(BluetoothConstants.MAX_VOLUME);
      expect(await hfpService.setSpeakerVolume(-5)).assertTrue();
      expect(hfpVolume(hfpService, 'speaker')).assertEqual(BluetoothConstants.MIN_VOLUME);
      expect(hfpVolume(hfpService, 'mic')).assertEqual(BluetoothConstants.MAX_VOLUME);

      expect(ValidationUtils.validateVolume(BluetoothConstants.MAX_VOLUME).isValid).assertTrue();
      expect(ValidationUtils.validateVolume(BluetoothConstants.MAX_VOLUME + 1).isValid).assertFalse();
      expect(ValidationUtils.validateVolume(BluetoothConstants.MAX_VOLUME + 1).errorMessage)
        .assertEqual('Volume out of range');
      expect(ValidationUtils.validateVolume(BluetoothConstants.MIN_VOLUME).isValid).assertTrue();
      expect(ValidationUtils.validateVolume(BluetoothConstants.MAX_HFP_SPEAKER_VOLUME,
        BluetoothConstants.MAX_HFP_SPEAKER_VOLUME).isValid).assertTrue();

      await hfpService.destroy();
      expect(hfpVolume(hfpService, 'speaker')).assertEqual(DEFAULT_AUDIO_VOLUME);
      expect(hfpVolume(hfpService, 'mic')).assertEqual(DEFAULT_AUDIO_VOLUME);
      expect(await hfpService.setSpeakerVolume(20)).assertFalse();
      expect(hfpVolume(hfpService, 'speaker')).assertEqual(DEFAULT_AUDIO_VOLUME);
    });

    // ==================== 配置与状态枚举取值（1 条） ====================

    /*
     * @tc.number: SUB_BT_CONST_1200
     * @tc.name: testBluetoothConstants0012
     * @tc.desc: Verify profile, state and category enumeration values that are exchanged with the user interface layer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothConstants0012', 0, () => {
      expect(BluetoothProfileType.A2DP).assertEqual('A2DP');
      expect(BluetoothProfileType.HFP).assertEqual('HFP');
      expect(BluetoothProfileType.HID).assertEqual('HID');
      expect(BluetoothProfileType.PAN).assertEqual('PAN');
      expect(BluetoothProfileType.PBAP).assertEqual('PBAP');
      expect(BluetoothProfileType.MAP).assertEqual('MAP');
      expect(BluetoothProfileType.AVRCP).assertEqual('AVRCP');
      expect(BluetoothProfileType.HDP).assertEqual('HDP');

      expect(BluetoothConnectionState.DISCONNECTED).assertEqual('disconnected');
      expect(BluetoothConnectionState.CONNECTING).assertEqual('connecting');
      expect(BluetoothConnectionState.CONNECTED).assertEqual('connected');
      expect(BluetoothConnectionState.DISCONNECTING).assertEqual('disconnecting');
      expect(BluetoothConnectionState.CONNECTION_FAILED).assertEqual('connection_failed');
      expect(BluetoothConnectionState.CONNECTION_TIMEOUT).assertEqual('connection_timeout');

      expect(BluetoothScanState.IDLE).assertEqual(0);
      expect(BluetoothScanState.SCANNING).assertEqual(1);
      expect(BluetoothScanState.SCAN_COMPLETE).assertEqual(2);
      expect(BluetoothScanState.SCAN_FAILED).assertEqual(3);
      expect(BluetoothScanState.SCANNING - BluetoothScanState.IDLE).assertEqual(1);
      expect(BluetoothScanState.SCAN_FAILED - BluetoothScanState.SCAN_COMPLETE).assertEqual(1);

      expect(A2dpConnectionState.DISCONNECTED).assertEqual('disconnected');
      expect(A2dpConnectionState.NOT_CONNECTED).assertEqual(A2dpConnectionState.DISCONNECTED);
      expect(A2dpConnectionState.CONNECTING).assertEqual('connecting');
      expect(A2dpConnectionState.CONNECTED).assertEqual('connected');
      expect(A2dpConnectionState.DISCONNECTING).assertEqual('disconnecting');
      expect(A2dpConnectionState.AUDIO_CONNECTED).assertEqual('audio_connected');
      expect(A2dpConnectionState.AUDIO_DISCONNECTING).assertEqual('audio_disconnecting');

      expect(HfpConnectionState.DISCONNECTED).assertEqual('disconnected');
      expect(HfpConnectionState.NOT_CONNECTED).assertEqual(HfpConnectionState.DISCONNECTED);
      expect(HfpConnectionState.SLC_CONNECTED).assertEqual('slc_connected');
      expect(HfpConnectionState.SLC_CONNECTING).assertEqual('slc_connecting');
      expect(HfpConnectionState.CONNECTING).assertEqual('connecting');
      expect(HfpConnectionState.DISCONNECTING).assertEqual('disconnecting');
      expect(HfpConnectionState.IN_CALL).assertEqual('in_call');
      expect(HfpConnectionState.VOICE_RECOGNITION).assertEqual('voice_recognition');

      expect(A2dpConnectionState.DISCONNECTED).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(HfpConnectionState.DISCONNECTED).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(A2dpConnectionState.AUDIO_CONNECTED).assertEqual('audio_connected');
      expect(HfpConnectionState.SLC_CONNECTED).assertEqual('slc_connected');

      expect(HidDeviceType.KEYBOARD).assertEqual('keyboard');
      expect(HidDeviceType.MOUSE).assertEqual('mouse');
      expect(HidDeviceType.TOUCHPAD).assertEqual('touchpad');
      expect(HidDeviceType.GAMEPAD).assertEqual('gamepad');
      expect(HidDeviceType.REMOTE).assertEqual('remote');

      expect(PanNetworkRole.NONE).assertEqual('none');
      expect(PanNetworkRole.NAP).assertEqual('nap');
      expect(PanNetworkRole.GN).assertEqual('gn');
      expect(PanNetworkRole.PANU).assertEqual('panu');

      expect(PbapSortOrder.ALPHABETICAL).assertEqual('alphabetical');
      expect(PbapSortOrder.BY_NAME).assertEqual('by_name');
      expect(PbapSortOrder.BY_NUMBER).assertEqual('by_number');

      expect(MapMessageType.SMS).assertEqual('sms');
      expect(MapMessageType.EMAIL).assertEqual('email');
      expect(MapMessageType.MMS).assertEqual('mms');

      expect(AvrcpPlaybackState.STOPPED).assertEqual('stopped');
      expect(AvrcpPlaybackState.PLAYING).assertEqual('playing');
      expect(AvrcpPlaybackState.PAUSED).assertEqual('paused');
      expect(AvrcpPlaybackState.FAST_FORWARD).assertEqual('fast_forward');
      expect(AvrcpPlaybackState.REWIND).assertEqual('rewind');

      expect(HdpDataType.HEART_RATE).assertEqual('heart_rate');
      expect(HdpDataType.BLOOD_PRESSURE).assertEqual('blood_pressure');
      expect(HdpDataType.TEMPERATURE).assertEqual('temperature');
      expect(HdpDataType.BLOOD_OXYGEN).assertEqual('blood_oxygen');
      expect(HdpDataType.WEIGHT).assertEqual('weight');

      const profileTypes: string[] = [
        BluetoothProfileType.A2DP, BluetoothProfileType.HFP, BluetoothProfileType.HID,
        BluetoothProfileType.PAN, BluetoothProfileType.PBAP, BluetoothProfileType.MAP,
        BluetoothProfileType.AVRCP, BluetoothProfileType.HDP
      ];
      expect(profileTypes.length).assertEqual(8);
      expect(duplicateCount(profileTypes)).assertEqual(0);

      const connectionStates: string[] = [
        BluetoothConnectionState.DISCONNECTED, BluetoothConnectionState.CONNECTING,
        BluetoothConnectionState.CONNECTED, BluetoothConnectionState.DISCONNECTING,
        BluetoothConnectionState.CONNECTION_FAILED, BluetoothConnectionState.CONNECTION_TIMEOUT
      ];
      expect(connectionStates.length).assertEqual(6);
      expect(duplicateCount(connectionStates)).assertEqual(0);
      expect(BluetoothConstants.CALL_STATE_IDLE).assertEqual('idle');
      expect(BluetoothConstants.CALL_STATE_INCOMING).assertEqual('incoming');
      expect(BluetoothConstants.CALL_STATE_OUTGOING).assertEqual('outgoing');
      expect(BluetoothConstants.CALL_STATE_ACTIVE).assertEqual('active');
      expect(BluetoothConstants.CALL_STATE_HELD).assertEqual('held');
      expect(BluetoothConstants.CALL_STATE_ENDED).assertEqual('ended');
      expect(BluetoothConstants.CALL_STATE_INCOMING.indexOf(BluetoothConstants.CALL_STATE_ACTIVE))
        .assertEqual(-1);
      const callStates: string[] = [
        BluetoothConstants.CALL_STATE_IDLE, BluetoothConstants.CALL_STATE_INCOMING,
        BluetoothConstants.CALL_STATE_OUTGOING, BluetoothConstants.CALL_STATE_ACTIVE,
        BluetoothConstants.CALL_STATE_HELD, BluetoothConstants.CALL_STATE_ENDED
      ];
      expect(callStates.length).assertEqual(6);
      expect(duplicateCount(callStates)).assertEqual(0);
    });
  });
}
