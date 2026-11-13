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
 * list output BluetoothConstants in all part already specify meaning error code, used for classification and uniqueness
 * statistics.
 * @returns {number[]} already specify meaning error code set combine
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
 * statistics set combine in weight repeat output current element number amount.
 * @param {string[]} values - pending statistics string set combine
 * @returns {number} duplicate element against number
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
 * generate length degree for length device name.
 * @param {number} length - target name length
 * @returns {string} by lowercase letters group become name name
 */
function buildDeviceName(length: number): string {
  let name: string = '';
  for (let i = 0; i < length; i++) {
    name += 'a';
  }
  return name;
}

/**
 * read A2DP current volume, playback info missing time return -1.
 * @param {A2dpService} service - passive test A2DP service
 * @returns {number} current volume
 */
function a2dpVolume(service: A2dpService): number {
  const info = service.getPlaybackInfo();
  return info === null ? -1 : info.volume;
}

/**
 * read A2DP static sound mark, playback info missing time return false.
 * @param {A2dpService} service - passive test A2DP service
 * @returns {boolean} whether static sound
 */
function a2dpMuted(service: A2dpService): boolean {
  const info = service.getPlaybackInfo();
  return info === null ? false : info.isMuted;
}

/**
 * read HFP audio config in specified volume, config set missing time return -1.
 * @param {HfpService} service - passive test HFP service
 * @param {string} field - volume field name
 * @returns {number} volume value
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
    // ==================== mark identify and error code constant amount (2 cases) ====================

    /*
     * @tc.number: SUB_BT_CONST_0100
     * @tc.name: testBluetoothConstants0001
     * @tc.desc: Verify the application identity and log tag constants exposed to every Bluetooth module.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothConstants0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0001', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#1 ' + "BluetoothConstants.TAG" + ' = ' + JSON.stringify(BluetoothConstants.TAG));
      expect(BluetoothConstants.TAG).assertEqual('[Sample_BluetoothBaseProfile]');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#2 ' + "BluetoothConstants.TAG.length" + ' = ' + JSON.stringify(BluetoothConstants.TAG.length));
      expect(BluetoothConstants.TAG.length).assertEqual(29);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#3 assert ' + "expect(BluetoothConstants.TAG.indexOf('[Sample_')).assertEqual(0)");
      expect(BluetoothConstants.TAG.indexOf('[Sample_')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#4 assert ' + "expect(BluetoothConstants.TAG.substring(BluetoothConstants.TAG.length - 1)).assertEqual(']')");
      expect(BluetoothConstants.TAG.substring(BluetoothConstants.TAG.length - 1)).assertEqual(']');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#5 ' + "BluetoothConstants.DOMAIN" + ' = ' + JSON.stringify(BluetoothConstants.DOMAIN));
      expect(BluetoothConstants.DOMAIN).assertEqual(0xF811);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#6 ' + "BluetoothConstants.DOMAIN" + ' = ' + JSON.stringify(BluetoothConstants.DOMAIN));
      expect(BluetoothConstants.DOMAIN).assertEqual(63505);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#7 ' + "BluetoothConstants.TRACE_DOMAIN" + ' = ' + JSON.stringify(BluetoothConstants.TRACE_DOMAIN));
      expect(BluetoothConstants.TRACE_DOMAIN).assertEqual(BluetoothConstants.DOMAIN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#8 ' + "BluetoothConstants.EVENT_DOMAIN" + ' = ' + JSON.stringify(BluetoothConstants.EVENT_DOMAIN));
      expect(BluetoothConstants.EVENT_DOMAIN).assertEqual(BluetoothConstants.DOMAIN);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#9 ' + "BluetoothConstants.BUNDLE_NAME" + ' = ' + JSON.stringify(BluetoothConstants.BUNDLE_NAME));
      expect(BluetoothConstants.BUNDLE_NAME).assertEqual('com.samples.bluetoothbaseprofile');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#10 ' + "BluetoothConstants.BUNDLE_NAME.length" + ' = ' +
        JSON.stringify(BluetoothConstants.BUNDLE_NAME.length));
      expect(BluetoothConstants.BUNDLE_NAME.length).assertEqual(32);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#11 assert ' + "expect(BluetoothConstants.BUNDLE_NAME.split('.').length).assertEqual(3)");
      expect(BluetoothConstants.BUNDLE_NAME.split('.').length).assertEqual(3);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#12 ' + "BluetoothConstants.EVENT_GROUP" + ' = ' + JSON.stringify(BluetoothConstants.EVENT_GROUP));
      expect(BluetoothConstants.EVENT_GROUP).assertEqual('bluetoothBaseProfileEvent');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#13 ' + "BluetoothConstants.EVENT_GROUP.length" + ' = ' +
        JSON.stringify(BluetoothConstants.EVENT_GROUP.length));
      expect(BluetoothConstants.EVENT_GROUP.length).assertEqual(25);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#14 assert ' + "expect(BluetoothConstants.EVENT_GROUP.indexOf('bluetooth')).assertEqual(0)");
      expect(BluetoothConstants.EVENT_GROUP.indexOf('bluetooth')).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#15 ' + "BtConstants.TAG" + ' = ' + JSON.stringify(BtConstants.TAG));
      expect(BtConstants.TAG).assertEqual(BluetoothConstants.TAG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#16 ' + "BtConstants.DOMAIN" + ' = ' + JSON.stringify(BtConstants.DOMAIN));
      expect(BtConstants.DOMAIN).assertEqual(BluetoothConstants.DOMAIN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0001',
        '#17 ' + "BtConstants.BUNDLE_NAME" + ' = ' + JSON.stringify(BtConstants.BUNDLE_NAME));
      expect(BtConstants.BUNDLE_NAME).assertEqual(BluetoothConstants.BUNDLE_NAME);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0002', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#1 ' + "BluetoothConstants.ERROR_PERMISSION_DENIED" + ' = ' +
        JSON.stringify(BluetoothConstants.ERROR_PERMISSION_DENIED));
      expect(BluetoothConstants.ERROR_PERMISSION_DENIED).assertEqual(201);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#2 ' + "BluetoothConstants.ERROR_INTERNAL" + ' = ' + JSON.stringify(BluetoothConstants.ERROR_INTERNAL));
      expect(BluetoothConstants.ERROR_INTERNAL).assertEqual(35200001);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#3 ' + "BluetoothConstants.ERROR_BLUETOOTH_DISABLED" + ' = ' +
        JSON.stringify(BluetoothConstants.ERROR_BLUETOOTH_DISABLED));
      expect(BluetoothConstants.ERROR_BLUETOOTH_DISABLED).assertEqual(35200002);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#4 ' + "BluetoothConstants.ERROR_DEVICE_NOT_FOUND" + ' = ' +
        JSON.stringify(BluetoothConstants.ERROR_DEVICE_NOT_FOUND));
      expect(BluetoothConstants.ERROR_DEVICE_NOT_FOUND).assertEqual(35200003);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#5 ' + "BluetoothConstants.ERROR_CONNECTION_TIMEOUT" + ' = ' +
        JSON.stringify(BluetoothConstants.ERROR_CONNECTION_TIMEOUT));
      expect(BluetoothConstants.ERROR_CONNECTION_TIMEOUT).assertEqual(35200004);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#6 ' + "BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED" + ' = ' +
        JSON.stringify(BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED));
      expect(BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED).assertEqual(35200005);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#7 ' + "BluetoothConstants.ERROR_ALREADY_CONNECTED" + ' = ' +
        JSON.stringify(BluetoothConstants.ERROR_ALREADY_CONNECTED));
      expect(BluetoothConstants.ERROR_ALREADY_CONNECTED).assertEqual(35200006);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#8 ' + "BluetoothConstants.ERROR_NOT_PAIRED" + ' = ' + JSON.stringify(BluetoothConstants.ERROR_NOT_PAIRED));
      expect(BluetoothConstants.ERROR_NOT_PAIRED).assertEqual(35200007);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#9 ' + "BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED" + ' = ' +
        JSON.stringify(BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED));
      expect(BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED).assertEqual(35200008);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#10 ' + "BluetoothConstants.ERROR_AUTHENTICATION_FAILED" + ' = ' +
        JSON.stringify(BluetoothConstants.ERROR_AUTHENTICATION_FAILED));
      expect(BluetoothConstants.ERROR_AUTHENTICATION_FAILED).assertEqual(35200009);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#11 ' + "BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE" + ' = ' +
        JSON.stringify(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE));
      expect(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE).assertEqual(35200010);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#12 ' + "BluetoothConstants.ERROR_BLUETOOTH_DISABLED - BluetoothConstants.ERROR_INTERNAL" + ' = ' +
        JSON.stringify(BluetoothConstants.ERROR_BLUETOOTH_DISABLED - BluetoothConstants.ERROR_INTERNAL));
      expect(BluetoothConstants.ERROR_BLUETOOTH_DISABLED - BluetoothConstants.ERROR_INTERNAL).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#13 ' + "BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE - BluetoothConstants.ERROR_INTERNAL" + ' = ' +
        JSON.stringify(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE - BluetoothConstants.ERROR_INTERNAL));
      expect(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE - BluetoothConstants.ERROR_INTERNAL)
        .assertEqual(EXPECTED_ERROR_CODE_COUNT - 2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#14 ' + "BluetoothConstants.ERROR_PERMISSION_DENIED < 1000" + ' = ' +
        JSON.stringify(BluetoothConstants.ERROR_PERMISSION_DENIED < 1000));
      expect(BluetoothConstants.ERROR_PERMISSION_DENIED < 1000).assertTrue();

      const codes: number[] = definedErrorCodes();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#15 ' + "codes.length" + ' = ' + JSON.stringify(codes.length));
      expect(codes.length).assertEqual(EXPECTED_ERROR_CODE_COUNT);
      let duplicated: number = 0;
      for (let i = 0; i < codes.length; i++) {
        for (let j = i + 1; j < codes.length; j++) {
          if (codes[i] === codes[j]) {
            duplicated += 1;
          }
        }
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0002',
        '#16 ' + "duplicated" + ' = ' + JSON.stringify(duplicated));
      expect(duplicated).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0002', 'end');
    });

    // ==================== error code text and error classification (4 cases) ====================

    /*
     * @tc.number: SUB_BT_CONST_0300
     * @tc.name: testBluetoothConstants0003
     * @tc.desc: Query the message text of every defined error code and confirm all texts are distinct.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothConstants0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0003', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#1 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_PERMISSION_DENIED)) .assertEqual('Permis" +
        "sion denied. Please grant Bluetooth permissions.')");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_PERMISSION_DENIED))
        .assertEqual('Permission denied. Please grant Bluetooth permissions.');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#2 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL)) .assertEqual('Internal system" +
        " error. Please try again.')");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL))
        .assertEqual('Internal system error. Please try again.');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#3 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_BLUETOOTH_DISABLED)) .assertEqual('Bluet" +
        "ooth is disabled. Please enable Bluetooth.')");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_BLUETOOTH_DISABLED))
        .assertEqual('Bluetooth is disabled. Please enable Bluetooth.');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#4 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_DEVICE_NOT_FOUND)) .assertEqual('Device " +
        "not found. Please ensure the device is in range.')");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_DEVICE_NOT_FOUND))
        .assertEqual('Device not found. Please ensure the device is in range.');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#5 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_CONNECTION_TIMEOUT)) .assertEqual('Conne" +
        "ction timed out. Please try again.')");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_CONNECTION_TIMEOUT))
        .assertEqual('Connection timed out. Please try again.');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#6 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED)) .assertEqual('Pr" +
        "ofile not supported by this device.')");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED))
        .assertEqual('Profile not supported by this device.');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#7 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_ALREADY_CONNECTED)) .assertEqual('Device" +
        " is already connected.')");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_ALREADY_CONNECTED))
        .assertEqual('Device is already connected.');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#8 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_NOT_PAIRED)) .assertEqual('Device is not" +
        " paired. Please pair first.')");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_NOT_PAIRED))
        .assertEqual('Device is not paired. Please pair first.');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#9 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED)) .assertEqual(" +
        "'Service discovery failed.')");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED))
        .assertEqual('Service discovery failed.');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#10 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_AUTHENTICATION_FAILED)) .assertEqual('Au" +
        "thentication failed. Please try pairing again.')");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_AUTHENTICATION_FAILED))
        .assertEqual('Authentication failed. Please try pairing again.');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#11 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE)) .assertEqual('Blu" +
        "etooth resource unavailable.')");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE))
        .assertEqual('Bluetooth resource unavailable.');

      const messages: string[] = [];
      for (const code of definedErrorCodes()) {
        messages.push(BluetoothConstants.getErrorMessage(code));
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#12 ' + "messages.length" + ' = ' + JSON.stringify(messages.length));
      expect(messages.length).assertEqual(EXPECTED_ERROR_CODE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#13 assert ' + "expect(duplicateCount(messages)).assertEqual(0)");
      expect(duplicateCount(messages)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#14 assert ' + "expect(messages[0].indexOf(UNKNOWN_ERROR_PREFIX)).assertEqual(-1)");
      expect(messages[0].indexOf(UNKNOWN_ERROR_PREFIX)).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#15 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_PERMISSION_DENIED) .indexOf('Permission'" +
        ")).assertEqual(0)");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_PERMISSION_DENIED)
        .indexOf('Permission')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0003',
        '#16 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_ALREADY_CONNECTED).length) .assertEqual(" +
        "'Device is already connected.'.length)");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_ALREADY_CONNECTED).length)
        .assertEqual('Device is already connected.'.length);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0004', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0004',
        '#1 assert ' + "expect(BluetoothConstants.getErrorMessage(0)).assertEqual('Unknown error (code: 0)')");
      expect(BluetoothConstants.getErrorMessage(0)).assertEqual('Unknown error (code: 0)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0004',
        '#2 assert ' + "expect(BluetoothConstants.getErrorMessage(-1)).assertEqual('Unknown error (code: -1)')");
      expect(BluetoothConstants.getErrorMessage(-1)).assertEqual('Unknown error (code: -1)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0004',
        '#3 assert ' + "expect(BluetoothConstants.getErrorMessage(200)).assertEqual('Unknown error (code: 200)')");
      expect(BluetoothConstants.getErrorMessage(200)).assertEqual('Unknown error (code: 200)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0004',
        '#4 assert ' + "expect(BluetoothConstants.getErrorMessage(202)).assertEqual('Unknown error (code: 202)')");
      expect(BluetoothConstants.getErrorMessage(202)).assertEqual('Unknown error (code: 202)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0004',
        '#5 assert ' +
        "expect(BluetoothConstants.getErrorMessage(35200000)) .assertEqual('Unknown error (code: 35200000)')");
      expect(BluetoothConstants.getErrorMessage(35200000))
        .assertEqual('Unknown error (code: 35200000)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0004',
        '#6 assert ' +
        "expect(BluetoothConstants.getErrorMessage(35200011)) .assertEqual('Unknown error (code: 35200011)')");
      expect(BluetoothConstants.getErrorMessage(35200011))
        .assertEqual('Unknown error (code: 35200011)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0004',
        '#7 assert ' + "expect(BluetoothConstants.getErrorMessage(201.5)).assertEqual('Unknown error (code: 201.5)')");
      expect(BluetoothConstants.getErrorMessage(201.5)).assertEqual('Unknown error (code: 201.5)');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0004',
        '#8 assert ' +
        "expect(BluetoothConstants.getErrorMessage(Number.NaN)).assertEqual('Unknown error (code: NaN)')");
      expect(BluetoothConstants.getErrorMessage(Number.NaN)).assertEqual('Unknown error (code: NaN)');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0004',
        '#9 assert ' + "expect(BluetoothConstants.getErrorMessage(35200011).length).assertEqual(30)");
      expect(BluetoothConstants.getErrorMessage(35200011).length).assertEqual(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0004',
        '#10 assert ' +
        "expect(BluetoothConstants.getErrorMessage(35200011).indexOf(UNKNOWN_ERROR_PREFIX)).assertEqual(0)");
      expect(BluetoothConstants.getErrorMessage(35200011).indexOf(UNKNOWN_ERROR_PREFIX)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0004',
        '#11 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL) .indexOf(UNKNOWN_ERROR_PREFIX)" +
        ").assertEqual(-1)");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL)
        .indexOf(UNKNOWN_ERROR_PREFIX)).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0004',
        '#12 assert ' +
        "expect(BluetoothConstants.getErrorMessage(200)) .assertEqual('Unknown error (code: ' + 200 + ')')");
      expect(BluetoothConstants.getErrorMessage(200))
        .assertEqual('Unknown error (code: ' + 200 + ')');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0004',
        '#13 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL)) .assertEqual('Internal system" +
        " error. Please try again.')");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL))
        .assertEqual('Internal system error. Please try again.');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0005', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#1 assert ' +
        "expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_CONNECTION_TIMEOUT)).assertTrue()");
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_CONNECTION_TIMEOUT)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#2 assert ' +
        "expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED)) .assertTru" +
        "e()");
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED))
        .assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#3 assert ' +
        "expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE)) .assertTrue()");
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE))
        .assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#4 assert ' +
        "expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_PERMISSION_DENIED)).assertFalse()");
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_PERMISSION_DENIED)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#5 assert ' +
        "expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_INTERNAL)).assertFalse()");
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_INTERNAL)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#6 assert ' +
        "expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_BLUETOOTH_DISABLED)).assertFalse()");
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_BLUETOOTH_DISABLED)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#7 assert ' +
        "expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_DEVICE_NOT_FOUND)).assertFalse()");
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_DEVICE_NOT_FOUND)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#8 assert ' +
        "expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED)) .assertFalse()");
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED))
        .assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#9 assert ' +
        "expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_ALREADY_CONNECTED)).assertFalse()");
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_ALREADY_CONNECTED)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#10 assert ' +
        "expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_NOT_PAIRED)).assertFalse()");
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_NOT_PAIRED)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#11 assert ' +
        "expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_AUTHENTICATION_FAILED)) .assertFalse()");
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_AUTHENTICATION_FAILED))
        .assertFalse();

      let recoverable: number = 0;
      for (const code of definedErrorCodes()) {
        if (BluetoothConstants.isRecoverableError(code)) {
          recoverable += 1;
        }
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#12 ' + "recoverable" + ' = ' + JSON.stringify(recoverable));
      expect(recoverable).assertEqual(RECOVERABLE_CODE_COUNT);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#13 assert ' + "expect(BluetoothConstants.isRecoverableError(0)).assertFalse()");
      expect(BluetoothConstants.isRecoverableError(0)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#14 assert ' + "expect(BluetoothConstants.isRecoverableError(-1)).assertFalse()");
      expect(BluetoothConstants.isRecoverableError(-1)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0005',
        '#15 assert ' + "expect(BluetoothConstants.isRecoverableError(999999)).assertFalse()");
      expect(BluetoothConstants.isRecoverableError(999999)).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0006', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#1 assert ' +
        "expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_PERMISSION_DENIED)).assertTrue()");
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_PERMISSION_DENIED)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#2 assert ' +
        "expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_BLUETOOTH_DISABLED)).assertTrue()");
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_BLUETOOTH_DISABLED)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#3 assert ' +
        "expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED)).assertTrue()");
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_PROFILE_NOT_SUPPORTED)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#4 assert ' + "expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_INTERNAL)).assertFalse()");
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_INTERNAL)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#5 assert ' +
        "expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_DEVICE_NOT_FOUND)).assertFalse()");
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_DEVICE_NOT_FOUND)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#6 assert ' +
        "expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_CONNECTION_TIMEOUT)).assertFalse()");
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_CONNECTION_TIMEOUT)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#7 assert ' +
        "expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_ALREADY_CONNECTED)).assertFalse()");
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_ALREADY_CONNECTED)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#8 assert ' +
        "expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_NOT_PAIRED)).assertFalse()");
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_NOT_PAIRED)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#9 assert ' +
        "expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED)) .assertFalse" +
        "()");
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_SERVICE_DISCOVERY_FAILED))
        .assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#10 assert ' +
        "expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_AUTHENTICATION_FAILED)).assertFalse()");
      expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_AUTHENTICATION_FAILED)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#11 assert ' +
        "expect(BluetoothConstants.isPermanentError(BluetoothConstants.ERROR_RESOURCE_UNAVAILABLE)).assertFalse()");
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
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#12 ' + "permanent" + ' = ' + JSON.stringify(permanent));
      expect(permanent).assertEqual(PERMANENT_CODE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#13 ' + "conflict" + ' = ' + JSON.stringify(conflict));
      expect(conflict).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#14 ' + "neutral" + ' = ' + JSON.stringify(neutral));
      expect(neutral).assertEqual(NEUTRAL_CODE_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#15 ' + "permanent + RECOVERABLE_CODE_COUNT + neutral" + ' = ' +
        JSON.stringify(permanent + RECOVERABLE_CODE_COUNT + neutral));
      expect(permanent + RECOVERABLE_CODE_COUNT + neutral).assertEqual(EXPECTED_ERROR_CODE_COUNT);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#16 assert ' + "expect(BluetoothConstants.isPermanentError(0)).assertFalse()");
      expect(BluetoothConstants.isPermanentError(0)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0006',
        '#17 assert ' + "expect(BluetoothConstants.isPermanentError(35200099)).assertFalse()");
      expect(BluetoothConstants.isPermanentError(35200099)).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0006', 'end');
    });

    // ==================== run row limit and timer constant amount (2 cases) ====================

    /*
     * @tc.number: SUB_BT_CONST_0700
     * @tc.name: testBluetoothConstants0007
     * @tc.desc: Verify global limit and timing constants and confirm repeated initialization keeps them stable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothConstants0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0007', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#1 ' + "BluetoothConstants.MAX_LOG_ENTRIES" + ' = ' + JSON.stringify(BluetoothConstants.MAX_LOG_ENTRIES));
      expect(BluetoothConstants.MAX_LOG_ENTRIES).assertEqual(200);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#2 ' + "BluetoothConstants.MAX_RETRY_COUNT" + ' = ' + JSON.stringify(BluetoothConstants.MAX_RETRY_COUNT));
      expect(BluetoothConstants.MAX_RETRY_COUNT).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#3 ' + "BluetoothConstants.OPERATION_TIMEOUT_MS" + ' = ' +
        JSON.stringify(BluetoothConstants.OPERATION_TIMEOUT_MS));
      expect(BluetoothConstants.OPERATION_TIMEOUT_MS).assertEqual(10000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#4 ' + "BluetoothConstants.REFRESH_INTERVAL_MS" + ' = ' +
        JSON.stringify(BluetoothConstants.REFRESH_INTERVAL_MS));
      expect(BluetoothConstants.REFRESH_INTERVAL_MS).assertEqual(5000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#5 ' + "BluetoothConstants.SCAN_TIMEOUT_MS" + ' = ' + JSON.stringify(BluetoothConstants.SCAN_TIMEOUT_MS));
      expect(BluetoothConstants.SCAN_TIMEOUT_MS).assertEqual(30000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#6 ' + "BluetoothConstants.MAX_CONNECTED_DEVICES" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_CONNECTED_DEVICES));
      expect(BluetoothConstants.MAX_CONNECTED_DEVICES).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#7 ' + "BluetoothConstants.MAX_SCAN_DEVICES" + ' = ' + JSON.stringify(BluetoothConstants.MAX_SCAN_DEVICES));
      expect(BluetoothConstants.MAX_SCAN_DEVICES).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#8 ' + "BluetoothConstants.MAX_HISTORY_SIZE" + ' = ' + JSON.stringify(BluetoothConstants.MAX_HISTORY_SIZE));
      expect(BluetoothConstants.MAX_HISTORY_SIZE).assertEqual(500);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#9 ' + "BluetoothConstants.MAX_DEVICE_CACHE" + ' = ' + JSON.stringify(BluetoothConstants.MAX_DEVICE_CACHE));
      expect(BluetoothConstants.MAX_DEVICE_CACHE).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#10 ' + "BluetoothConstants.DEFAULT_SCAN_INTERVAL" + ' = ' +
        JSON.stringify(BluetoothConstants.DEFAULT_SCAN_INTERVAL));
      expect(BluetoothConstants.DEFAULT_SCAN_INTERVAL).assertEqual(5000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#11 ' + "BluetoothConstants.CONNECTION_CHECK_INTERVAL" + ' = ' +
        JSON.stringify(BluetoothConstants.CONNECTION_CHECK_INTERVAL));
      expect(BluetoothConstants.CONNECTION_CHECK_INTERVAL).assertEqual(10000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#12 ' + "BluetoothConstants.AUTO_RECONNECT_DELAY" + ' = ' +
        JSON.stringify(BluetoothConstants.AUTO_RECONNECT_DELAY));
      expect(BluetoothConstants.AUTO_RECONNECT_DELAY).assertEqual(3000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#13 ' + "BluetoothConstants.MAX_AUTO_RECONNECT" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_AUTO_RECONNECT));
      expect(BluetoothConstants.MAX_AUTO_RECONNECT).assertEqual(5);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#14 ' + "BluetoothConstants.SCAN_TIMEOUT_MS" + ' = ' + JSON.stringify(BluetoothConstants.SCAN_TIMEOUT_MS));
      expect(BluetoothConstants.SCAN_TIMEOUT_MS)
        .assertEqual(BluetoothConstants.OPERATION_TIMEOUT_MS * 3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#15 ' + "BluetoothConstants.CONNECTION_CHECK_INTERVAL" + ' = ' +
        JSON.stringify(BluetoothConstants.CONNECTION_CHECK_INTERVAL));
      expect(BluetoothConstants.CONNECTION_CHECK_INTERVAL)
        .assertEqual(BluetoothConstants.OPERATION_TIMEOUT_MS);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#16 ' + "BluetoothConstants.DEFAULT_SCAN_INTERVAL" + ' = ' +
        JSON.stringify(BluetoothConstants.DEFAULT_SCAN_INTERVAL));
      expect(BluetoothConstants.DEFAULT_SCAN_INTERVAL)
        .assertEqual(BluetoothConstants.REFRESH_INTERVAL_MS);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#17 ' + "BluetoothConstants.MAX_AUTO_RECONNECT > BluetoothConstants.MAX_RETRY_COUNT" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_AUTO_RECONNECT > BluetoothConstants.MAX_RETRY_COUNT));
      expect(BluetoothConstants.MAX_AUTO_RECONNECT > BluetoothConstants.MAX_RETRY_COUNT).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#18 ' + "BluetoothConstants.MAX_HISTORY_SIZE > BluetoothConstants.MAX_LOG_ENTRIES" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_HISTORY_SIZE > BluetoothConstants.MAX_LOG_ENTRIES));
      expect(BluetoothConstants.MAX_HISTORY_SIZE > BluetoothConstants.MAX_LOG_ENTRIES).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#19 ' + "BluetoothConstants.MAX_LOG_ENTRIES > BluetoothConstants.MAX_DEVICE_CACHE" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_LOG_ENTRIES > BluetoothConstants.MAX_DEVICE_CACHE));
      expect(BluetoothConstants.MAX_LOG_ENTRIES > BluetoothConstants.MAX_DEVICE_CACHE).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#20 ' + "BluetoothConstants.MAX_DEVICE_CACHE > BluetoothConstants.MAX_SCAN_DEVICES" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_DEVICE_CACHE > BluetoothConstants.MAX_SCAN_DEVICES));
      expect(BluetoothConstants.MAX_DEVICE_CACHE > BluetoothConstants.MAX_SCAN_DEVICES).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#21 ' + "BluetoothConstants.AUTO_RECONNECT_DELAY * BluetoothConstants.MAX_AUTO_RECONNECT" + ' = ' +
        JSON.stringify(BluetoothConstants.AUTO_RECONNECT_DELAY * BluetoothConstants.MAX_AUTO_RECONNECT));
      expect(BluetoothConstants.AUTO_RECONNECT_DELAY * BluetoothConstants.MAX_AUTO_RECONNECT)
        .assertEqual(15000);

      const tagBefore: string = BluetoothConstants.TAG;
      const domainBefore: number = BluetoothConstants.DOMAIN;
      const deviceLimitBefore: number = BluetoothConstants.MAX_CONNECTED_DEVICES;
      const internalMessageBefore: string =
        BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL);

      BluetoothConstants.initialize();
      BluetoothConstants.initialize();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#22 ' + "BluetoothConstants.TAG" + ' = ' + JSON.stringify(BluetoothConstants.TAG));
      expect(BluetoothConstants.TAG).assertEqual(tagBefore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#23 ' + "BluetoothConstants.DOMAIN" + ' = ' + JSON.stringify(BluetoothConstants.DOMAIN));
      expect(BluetoothConstants.DOMAIN).assertEqual(domainBefore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#24 ' + "BluetoothConstants.MAX_CONNECTED_DEVICES" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_CONNECTED_DEVICES));
      expect(BluetoothConstants.MAX_CONNECTED_DEVICES).assertEqual(deviceLimitBefore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#25 assert ' +
        "expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL)) .assertEqual(internalMessageB" +
        "efore)");
      expect(BluetoothConstants.getErrorMessage(BluetoothConstants.ERROR_INTERNAL))
        .assertEqual(internalMessageBefore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#26 assert ' +
        "expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_CONNECTION_TIMEOUT)).assertTrue()");
      expect(BluetoothConstants.isRecoverableError(BluetoothConstants.ERROR_CONNECTION_TIMEOUT)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0007',
        '#27 ' + "BluetoothConstants.MAX_SCAN_DEVICES" + ' = ' + JSON.stringify(BluetoothConstants.MAX_SCAN_DEVICES));
      expect(BluetoothConstants.MAX_SCAN_DEVICES).assertEqual(50);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0008', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#1 ' + "BluetoothConstants.MAX_MESSAGE_LENGTH" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_MESSAGE_LENGTH));
      expect(BluetoothConstants.MAX_MESSAGE_LENGTH).assertEqual(1600);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#2 ' + "BluetoothConstants.MAX_CONTACT_ENTRIES" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_CONTACT_ENTRIES));
      expect(BluetoothConstants.MAX_CONTACT_ENTRIES).assertEqual(1000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#3 ' + "BluetoothConstants.HEALTH_SAMPLE_INTERVAL" + ' = ' +
        JSON.stringify(BluetoothConstants.HEALTH_SAMPLE_INTERVAL));
      expect(BluetoothConstants.HEALTH_SAMPLE_INTERVAL).assertEqual(1000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#4 ' + "BluetoothConstants.AUDIO_BUFFER_SIZE" + ' = ' + JSON.stringify(BluetoothConstants.AUDIO_BUFFER_SIZE));
      expect(BluetoothConstants.AUDIO_BUFFER_SIZE).assertEqual(4096);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#5 ' + "BluetoothConstants.PAN_MTU_SIZE" + ' = ' + JSON.stringify(BluetoothConstants.PAN_MTU_SIZE));
      expect(BluetoothConstants.PAN_MTU_SIZE).assertEqual(1500);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#6 ' + "BluetoothConstants.SYNC_CHUNK_SIZE" + ' = ' + JSON.stringify(BluetoothConstants.SYNC_CHUNK_SIZE));
      expect(BluetoothConstants.SYNC_CHUNK_SIZE).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#7 ' + "BluetoothConstants.MAX_DEVICE_NAME_LENGTH" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_DEVICE_NAME_LENGTH));
      expect(BluetoothConstants.MAX_DEVICE_NAME_LENGTH).assertEqual(248);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#8 ' + "BluetoothConstants.MAC_ADDRESS_LENGTH" + ' = ' +
        JSON.stringify(BluetoothConstants.MAC_ADDRESS_LENGTH));
      expect(BluetoothConstants.MAC_ADDRESS_LENGTH).assertEqual(17);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#9 ' + "BluetoothConstants.UUID_LENGTH" + ' = ' + JSON.stringify(BluetoothConstants.UUID_LENGTH));
      expect(BluetoothConstants.UUID_LENGTH).assertEqual(36);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#10 ' + "BluetoothConstants.AUDIO_BUFFER_SIZE" + ' = ' + JSON.stringify(BluetoothConstants.AUDIO_BUFFER_SIZE));
      expect(BluetoothConstants.AUDIO_BUFFER_SIZE).assertEqual(1024 * 4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#11 ' + "BluetoothConstants.AUDIO_BUFFER_SIZE > BluetoothConstants.PAN_MTU_SIZE" + ' = ' +
        JSON.stringify(BluetoothConstants.AUDIO_BUFFER_SIZE > BluetoothConstants.PAN_MTU_SIZE));
      expect(BluetoothConstants.AUDIO_BUFFER_SIZE > BluetoothConstants.PAN_MTU_SIZE).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#12 ' + "BluetoothConstants.SYNC_CHUNK_SIZE" + ' = ' + JSON.stringify(BluetoothConstants.SYNC_CHUNK_SIZE));
      expect(BluetoothConstants.SYNC_CHUNK_SIZE).assertEqual(BluetoothConstants.MAX_SCAN_DEVICES);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#13 ' + "BluetoothConstants.MAX_CONTACT_ENTRIES > BluetoothConstants.MAX_DEVICE_CACHE" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_CONTACT_ENTRIES > BluetoothConstants.MAX_DEVICE_CACHE));
      expect(BluetoothConstants.MAX_CONTACT_ENTRIES > BluetoothConstants.MAX_DEVICE_CACHE).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#14 ' + "BluetoothConstants.MAX_MESSAGE_LENGTH > BluetoothConstants.MAX_DEVICE_NAME_LENGTH" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_MESSAGE_LENGTH > BluetoothConstants.MAX_DEVICE_NAME_LENGTH));
      expect(BluetoothConstants.MAX_MESSAGE_LENGTH > BluetoothConstants.MAX_DEVICE_NAME_LENGTH).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#15 ' + "BluetoothConstants.HEALTH_SAMPLE_INTERVAL * 3" + ' = ' +
        JSON.stringify(BluetoothConstants.HEALTH_SAMPLE_INTERVAL * 3));
      expect(BluetoothConstants.HEALTH_SAMPLE_INTERVAL * 3)
        .assertEqual(BluetoothConstants.AUTO_RECONNECT_DELAY);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#16 ' + "BluetoothConstants.MAC_ADDRESS_LENGTH" + ' = ' +
        JSON.stringify(BluetoothConstants.MAC_ADDRESS_LENGTH));
      expect(BluetoothConstants.MAC_ADDRESS_LENGTH).assertEqual(6 * 2 + 5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#17 ' + "BluetoothConstants.UUID_LENGTH" + ' = ' + JSON.stringify(BluetoothConstants.UUID_LENGTH));
      expect(BluetoothConstants.UUID_LENGTH).assertEqual(32 + 4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#18 ' + "BluetoothConstants.PAN_MTU_SIZE % 100" + ' = ' +
        JSON.stringify(BluetoothConstants.PAN_MTU_SIZE % 100));
      expect(BluetoothConstants.PAN_MTU_SIZE % 100).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0008',
        '#19 ' + "BluetoothConstants.MAX_MESSAGE_LENGTH % BluetoothConstants.SYNC_CHUNK_SIZE" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_MESSAGE_LENGTH % BluetoothConstants.SYNC_CHUNK_SIZE));
      expect(BluetoothConstants.MAX_MESSAGE_LENGTH % BluetoothConstants.SYNC_CHUNK_SIZE).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0008', 'end');
    });

    // ==================== constant amount and true actual validation logic consistency (3 cases) ====================

    /*
     * @tc.number: SUB_BT_CONST_0900
     * @tc.name: testBluetoothConstants0009
     * @tc.desc: Verify service UUID constants satisfy the declared UUID length and both shipped UUID validators.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothConstants0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0009', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#1 ' + "BluetoothConstants.UUID_A2DP_SOURCE" + ' = ' + JSON.stringify(BluetoothConstants.UUID_A2DP_SOURCE));
      expect(BluetoothConstants.UUID_A2DP_SOURCE).assertEqual('0000110a' + UUID_TAIL);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#2 ' + "BluetoothConstants.UUID_HFP" + ' = ' + JSON.stringify(BluetoothConstants.UUID_HFP));
      expect(BluetoothConstants.UUID_HFP).assertEqual('0000111e' + UUID_TAIL);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#3 ' + "BluetoothConstants.UUID_HDP" + ' = ' + JSON.stringify(BluetoothConstants.UUID_HDP));
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
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#4 ' + "uuids.length" + ' = ' + JSON.stringify(uuids.length));
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
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#5 ' + "lengthMatched" + ' = ' + JSON.stringify(lengthMatched));
      expect(lengthMatched).assertEqual(EXPECTED_UUID_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#6 ' + "tailMatched" + ' = ' + JSON.stringify(tailMatched));
      expect(tailMatched).assertEqual(EXPECTED_UUID_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#7 ' + "strictValid" + ' = ' + JSON.stringify(strictValid));
      expect(strictValid).assertEqual(EXPECTED_UUID_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#8 ' + "resultValid" + ' = ' + JSON.stringify(resultValid));
      expect(resultValid).assertEqual(EXPECTED_UUID_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#9 ' + "errorCodeZero" + ' = ' + JSON.stringify(errorCodeZero));
      expect(errorCodeZero).assertEqual(EXPECTED_UUID_COUNT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#10 assert ' + "expect(duplicateCount(prefixes)).assertEqual(0)");
      expect(duplicateCount(prefixes)).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#11 assert ' + "expect(Constants.isValidUuid(UPPER_UUID)).assertFalse()");
      expect(Constants.isValidUuid(UPPER_UUID)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#12 assert ' + "expect(ValidationUtils.validateUuid(UPPER_UUID).isValid).assertTrue()");
      expect(ValidationUtils.validateUuid(UPPER_UUID).isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#13 assert ' + "expect(ValidationUtils.validateUuid(UPPER_UUID).errorCode).assertEqual(0)");
      expect(ValidationUtils.validateUuid(UPPER_UUID).errorCode).assertEqual(0);

      const truncated: string =
        BluetoothConstants.UUID_A2DP_SOURCE.substring(0, BluetoothConstants.UUID_LENGTH - 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#14 ' + "truncated.length" + ' = ' + JSON.stringify(truncated.length));
      expect(truncated.length).assertEqual(35);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#15 assert ' + "expect(Constants.isValidUuid(truncated)).assertFalse()");
      expect(Constants.isValidUuid(truncated)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#16 assert ' + "expect(ValidationUtils.validateUuid(truncated).isValid).assertFalse()");
      expect(ValidationUtils.validateUuid(truncated).isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#17 assert ' + "expect(ValidationUtils.validateUuid(truncated).errorCode).assertEqual(2)");
      expect(ValidationUtils.validateUuid(truncated).errorCode).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#18 assert ' +
        "expect(ValidationUtils.validateUuid(truncated).errorMessage).assertEqual('Invalid UUID format')");
      expect(ValidationUtils.validateUuid(truncated).errorMessage).assertEqual('Invalid UUID format');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#19 assert ' + "expect(ValidationUtils.validateUuid('').errorCode).assertEqual(1)");
      expect(ValidationUtils.validateUuid('').errorCode).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0009',
        '#20 assert ' + "expect(ValidationUtils.validateUuid('').errorMessage).assertEqual('UUID is empty')");
      expect(ValidationUtils.validateUuid('').errorMessage).assertEqual('UUID is empty');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0010', 'begin');
      const maxName: string = buildDeviceName(BluetoothConstants.MAX_DEVICE_NAME_LENGTH);
      const overName: string = buildDeviceName(BluetoothConstants.MAX_DEVICE_NAME_LENGTH + 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#1 ' + "maxName.length" + ' = ' + JSON.stringify(maxName.length));
      expect(maxName.length).assertEqual(248);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#2 ' + "overName.length" + ' = ' + JSON.stringify(overName.length));
      expect(overName.length).assertEqual(249);

      const maxResult = ValidationUtils.validateDeviceName(maxName);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#3 ' + "maxResult.isValid" + ' = ' + JSON.stringify(maxResult.isValid));
      expect(maxResult.isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#4 ' + "maxResult.errorCode" + ' = ' + JSON.stringify(maxResult.errorCode));
      expect(maxResult.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#5 ' + "maxResult.errorMessage" + ' = ' + JSON.stringify(maxResult.errorMessage));
      expect(maxResult.errorMessage).assertEqual('');

      const overResult = ValidationUtils.validateDeviceName(overName);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#6 ' + "overResult.isValid" + ' = ' + JSON.stringify(overResult.isValid));
      expect(overResult.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#7 ' + "overResult.errorCode" + ' = ' + JSON.stringify(overResult.errorCode));
      expect(overResult.errorCode).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#8 ' + "overResult.errorMessage" + ' = ' + JSON.stringify(overResult.errorMessage));
      expect(overResult.errorMessage).assertEqual('Device name too long');

      const emptyResult = ValidationUtils.validateDeviceName('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#9 ' + "emptyResult.isValid" + ' = ' + JSON.stringify(emptyResult.isValid));
      expect(emptyResult.isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#10 ' + "emptyResult.errorCode" + ' = ' + JSON.stringify(emptyResult.errorCode));
      expect(emptyResult.errorCode).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#11 ' + "emptyResult.errorMessage" + ' = ' + JSON.stringify(emptyResult.errorMessage));
      expect(emptyResult.errorMessage).assertEqual('Device name is empty');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#12 assert ' + "expect(ValidationUtils.validateDeviceName('a').isValid).assertTrue()");
      expect(ValidationUtils.validateDeviceName('a').isValid).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#13 ' + "COLON_MAC_ADDRESS.length" + ' = ' + JSON.stringify(COLON_MAC_ADDRESS.length));
      expect(COLON_MAC_ADDRESS.length).assertEqual(BluetoothConstants.MAC_ADDRESS_LENGTH);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#14 ' + "DASH_MAC_ADDRESS.length" + ' = ' + JSON.stringify(DASH_MAC_ADDRESS.length));
      expect(DASH_MAC_ADDRESS.length).assertEqual(BluetoothConstants.MAC_ADDRESS_LENGTH);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#15 assert ' + "expect(Constants.isValidMacAddress(COLON_MAC_ADDRESS)).assertTrue()");
      expect(Constants.isValidMacAddress(COLON_MAC_ADDRESS)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#16 assert ' + "expect(Constants.isValidMacAddress(DASH_MAC_ADDRESS)).assertFalse()");
      expect(Constants.isValidMacAddress(DASH_MAC_ADDRESS)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#17 assert ' + "expect(Constants.isValidMacAddress(SHORT_MAC_ADDRESS)).assertFalse()");
      expect(Constants.isValidMacAddress(SHORT_MAC_ADDRESS)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#18 assert ' + "expect(ValidationUtils.validateMacAddress(COLON_MAC_ADDRESS).isValid).assertTrue()");
      expect(ValidationUtils.validateMacAddress(COLON_MAC_ADDRESS).isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#19 assert ' + "expect(ValidationUtils.validateMacAddress(DASH_MAC_ADDRESS).isValid).assertTrue()");
      expect(ValidationUtils.validateMacAddress(DASH_MAC_ADDRESS).isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#20 assert ' + "expect(ValidationUtils.validateMacAddress(SHORT_MAC_ADDRESS).errorCode).assertEqual(2)");
      expect(ValidationUtils.validateMacAddress(SHORT_MAC_ADDRESS).errorCode).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#21 assert ' +
        "expect(ValidationUtils.validateMacAddress(SHORT_MAC_ADDRESS).errorMessage) .assertEqual('Invalid MAC format" +
        "')");
      expect(ValidationUtils.validateMacAddress(SHORT_MAC_ADDRESS).errorMessage)
        .assertEqual('Invalid MAC format');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#22 assert ' + "expect(ValidationUtils.validateMacAddress('').errorCode).assertEqual(1)");
      expect(ValidationUtils.validateMacAddress('').errorCode).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#23 assert ' +
        "expect(ValidationUtils.validateMacAddress('').errorMessage).assertEqual('MAC address is empty')");
      expect(ValidationUtils.validateMacAddress('').errorMessage).assertEqual('MAC address is empty');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#24 assert ' + "expect(ValidationUtils.validateMacAddress('11:22:33:44:55:FF').isValid).assertTrue()");
      expect(ValidationUtils.validateMacAddress('11:22:33:44:55:FF').isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0010',
        '#25 assert ' + "expect(ValidationUtils.validateMacAddress('00:11:22:33:44:5G').isValid).assertFalse()");
      expect(ValidationUtils.validateMacAddress('00:11:22:33:44:5G').isValid).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0011', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#1 ' + "BluetoothConstants.CODEC_SBC" + ' = ' + JSON.stringify(BluetoothConstants.CODEC_SBC));
      expect(BluetoothConstants.CODEC_SBC).assertEqual('SBC');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#2 ' + "BluetoothConstants.CODEC_AAC" + ' = ' + JSON.stringify(BluetoothConstants.CODEC_AAC));
      expect(BluetoothConstants.CODEC_AAC).assertEqual('AAC');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#3 ' + "BluetoothConstants.CODEC_APTX" + ' = ' + JSON.stringify(BluetoothConstants.CODEC_APTX));
      expect(BluetoothConstants.CODEC_APTX).assertEqual('aptX');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#4 ' + "BluetoothConstants.CODEC_LDAC" + ' = ' + JSON.stringify(BluetoothConstants.CODEC_LDAC));
      expect(BluetoothConstants.CODEC_LDAC).assertEqual('LDAC');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#5 ' + "BluetoothConstants.DEFAULT_SAMPLE_RATE" + ' = ' +
        JSON.stringify(BluetoothConstants.DEFAULT_SAMPLE_RATE));
      expect(BluetoothConstants.DEFAULT_SAMPLE_RATE).assertEqual(44100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#6 ' + "BluetoothConstants.HIRES_SAMPLE_RATE" + ' = ' + JSON.stringify(BluetoothConstants.HIRES_SAMPLE_RATE));
      expect(BluetoothConstants.HIRES_SAMPLE_RATE).assertEqual(96000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#7 ' + "BluetoothConstants.DEFAULT_BIT_RATE" + ' = ' + JSON.stringify(BluetoothConstants.DEFAULT_BIT_RATE));
      expect(BluetoothConstants.DEFAULT_BIT_RATE).assertEqual(320);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#8 ' + "BluetoothConstants.MIN_VOLUME" + ' = ' + JSON.stringify(BluetoothConstants.MIN_VOLUME));
      expect(BluetoothConstants.MIN_VOLUME).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#9 ' + "BluetoothConstants.MAX_VOLUME" + ' = ' + JSON.stringify(BluetoothConstants.MAX_VOLUME));
      expect(BluetoothConstants.MAX_VOLUME).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#10 ' + "BluetoothConstants.MAX_HFP_SPEAKER_VOLUME" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_HFP_SPEAKER_VOLUME));
      expect(BluetoothConstants.MAX_HFP_SPEAKER_VOLUME).assertEqual(15);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#11 ' + "BluetoothConstants.MAX_HFP_MIC_VOLUME" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_HFP_MIC_VOLUME));
      expect(BluetoothConstants.MAX_HFP_MIC_VOLUME).assertEqual(15);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#12 ' + "BluetoothConstants.HIRES_SAMPLE_RATE > BluetoothConstants.DEFAULT_SAMPLE_RATE" + ' = ' +
        JSON.stringify(BluetoothConstants.HIRES_SAMPLE_RATE > BluetoothConstants.DEFAULT_SAMPLE_RATE));
      expect(BluetoothConstants.HIRES_SAMPLE_RATE > BluetoothConstants.DEFAULT_SAMPLE_RATE).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#13 ' + "BluetoothConstants.MAX_HFP_SPEAKER_VOLUME" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_HFP_SPEAKER_VOLUME));
      expect(BluetoothConstants.MAX_HFP_SPEAKER_VOLUME).assertEqual(BluetoothConstants.MAX_HFP_MIC_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#14 ' + "BluetoothConstants.MAX_VOLUME % BluetoothConstants.MAX_HFP_SPEAKER_VOLUME" + ' = ' +
        JSON.stringify(BluetoothConstants.MAX_VOLUME % BluetoothConstants.MAX_HFP_SPEAKER_VOLUME));
      expect(BluetoothConstants.MAX_VOLUME % BluetoothConstants.MAX_HFP_SPEAKER_VOLUME).assertEqual(10);

      const a2dpService: A2dpService = new A2dpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#15 assert ' + "expect(await a2dpService.initialize()).assertTrue()");
      expect(await a2dpService.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#16 assert ' + "expect(await a2dpService.setVolume(-20)).assertTrue()");
      expect(await a2dpService.setVolume(-20)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#17 assert ' + "expect(a2dpVolume(a2dpService)).assertEqual(BluetoothConstants.MIN_VOLUME)");
      expect(a2dpVolume(a2dpService)).assertEqual(BluetoothConstants.MIN_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#18 assert ' + "expect(a2dpMuted(a2dpService)).assertTrue()");
      expect(a2dpMuted(a2dpService)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#19 assert ' + "expect(await a2dpService.setVolume(150)).assertTrue()");
      expect(await a2dpService.setVolume(150)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#20 assert ' + "expect(a2dpVolume(a2dpService)).assertEqual(BluetoothConstants.MAX_VOLUME)");
      expect(a2dpVolume(a2dpService)).assertEqual(BluetoothConstants.MAX_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#21 assert ' + "expect(a2dpMuted(a2dpService)).assertFalse()");
      expect(a2dpMuted(a2dpService)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#22 assert ' + "expect(a2dpVolume(a2dpService)).assertEqual(a2dpService.getModel().volume)");
      expect(a2dpVolume(a2dpService)).assertEqual(a2dpService.getModel().volume);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#23 assert ' + "expect(await a2dpService.setVolume(80)).assertTrue()");
      expect(await a2dpService.setVolume(80)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#24 assert ' + "expect(a2dpVolume(a2dpService)).assertEqual(80)");
      expect(a2dpVolume(a2dpService)).assertEqual(80);
      await a2dpService.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#25 assert ' + "expect(a2dpService.getSupportedCodecs().length).assertEqual(0)");
      expect(a2dpService.getSupportedCodecs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#26 assert ' + "expect(a2dpService.isConnected()).assertFalse()");
      expect(a2dpService.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#27 assert ' + "expect(a2dpVolume(a2dpService)).assertEqual(DEFAULT_AUDIO_VOLUME)");
      expect(a2dpVolume(a2dpService)).assertEqual(DEFAULT_AUDIO_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#28 assert ' + "expect(await a2dpService.setVolume(30)).assertFalse()");
      expect(await a2dpService.setVolume(30)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#29 assert ' + "expect(a2dpVolume(a2dpService)).assertEqual(DEFAULT_AUDIO_VOLUME)");
      expect(a2dpVolume(a2dpService)).assertEqual(DEFAULT_AUDIO_VOLUME);

      const hfpService: HfpService = new HfpService();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#30 assert ' + "expect(await hfpService.initialize()).assertTrue()");
      expect(await hfpService.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#31 assert ' + "expect(hfpVolume(hfpService, 'speaker')).assertEqual(DEFAULT_AUDIO_VOLUME)");
      expect(hfpVolume(hfpService, 'speaker')).assertEqual(DEFAULT_AUDIO_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#32 assert ' + "expect(await hfpService.setSpeakerVolume(200)).assertTrue()");
      expect(await hfpService.setSpeakerVolume(200)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#33 assert ' + "expect(hfpVolume(hfpService, 'speaker')).assertEqual(BluetoothConstants.MAX_VOLUME)");
      expect(hfpVolume(hfpService, 'speaker')).assertEqual(BluetoothConstants.MAX_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#34 assert ' + "expect(await hfpService.setMicVolume(200)).assertTrue()");
      expect(await hfpService.setMicVolume(200)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#35 assert ' + "expect(hfpVolume(hfpService, 'mic')).assertEqual(BluetoothConstants.MAX_VOLUME)");
      expect(hfpVolume(hfpService, 'mic')).assertEqual(BluetoothConstants.MAX_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#36 assert ' + "expect(await hfpService.setSpeakerVolume(-5)).assertTrue()");
      expect(await hfpService.setSpeakerVolume(-5)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#37 assert ' + "expect(hfpVolume(hfpService, 'speaker')).assertEqual(BluetoothConstants.MIN_VOLUME)");
      expect(hfpVolume(hfpService, 'speaker')).assertEqual(BluetoothConstants.MIN_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#38 assert ' + "expect(hfpVolume(hfpService, 'mic')).assertEqual(BluetoothConstants.MAX_VOLUME)");
      expect(hfpVolume(hfpService, 'mic')).assertEqual(BluetoothConstants.MAX_VOLUME);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#39 assert ' + "expect(ValidationUtils.validateVolume(BluetoothConstants.MAX_VOLUME).isValid).assertTrue()");
      expect(ValidationUtils.validateVolume(BluetoothConstants.MAX_VOLUME).isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#40 assert ' +
        "expect(ValidationUtils.validateVolume(BluetoothConstants.MAX_VOLUME + 1).isValid).assertFalse()");
      expect(ValidationUtils.validateVolume(BluetoothConstants.MAX_VOLUME + 1).isValid).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#41 assert ' +
        "expect(ValidationUtils.validateVolume(BluetoothConstants.MAX_VOLUME + 1).errorMessage) .assertEqual('Volume" +
        " out of range')");
      expect(ValidationUtils.validateVolume(BluetoothConstants.MAX_VOLUME + 1).errorMessage)
        .assertEqual('Volume out of range');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#42 assert ' + "expect(ValidationUtils.validateVolume(BluetoothConstants.MIN_VOLUME).isValid).assertTrue()");
      expect(ValidationUtils.validateVolume(BluetoothConstants.MIN_VOLUME).isValid).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#43 assert ' +
        "expect(ValidationUtils.validateVolume(BluetoothConstants.MAX_HFP_SPEAKER_VOLUME, BluetoothConstants.MAX_HFP" +
        "_SPEAKER_VOLUME).isValid).assertTrue()");
      expect(ValidationUtils.validateVolume(BluetoothConstants.MAX_HFP_SPEAKER_VOLUME,
        BluetoothConstants.MAX_HFP_SPEAKER_VOLUME).isValid).assertTrue();

      await hfpService.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#44 assert ' + "expect(hfpVolume(hfpService, 'speaker')).assertEqual(DEFAULT_AUDIO_VOLUME)");
      expect(hfpVolume(hfpService, 'speaker')).assertEqual(DEFAULT_AUDIO_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#45 assert ' + "expect(hfpVolume(hfpService, 'mic')).assertEqual(DEFAULT_AUDIO_VOLUME)");
      expect(hfpVolume(hfpService, 'mic')).assertEqual(DEFAULT_AUDIO_VOLUME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#46 assert ' + "expect(await hfpService.setSpeakerVolume(20)).assertFalse()");
      expect(await hfpService.setSpeakerVolume(20)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0011',
        '#47 assert ' + "expect(hfpVolume(hfpService, 'speaker')).assertEqual(DEFAULT_AUDIO_VOLUME)");
      expect(hfpVolume(hfpService, 'speaker')).assertEqual(DEFAULT_AUDIO_VOLUME);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0011', 'end');
    });

    // ==================== config set and state state enum values (1 cases) ====================

    /*
     * @tc.number: SUB_BT_CONST_1200
     * @tc.name: testBluetoothConstants0012
     * @tc.desc: Verify profile, state and category enumeration values that are exchanged with the user interface layer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothConstants0012', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0012', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#1 ' + "BluetoothProfileType.A2DP" + ' = ' + JSON.stringify(BluetoothProfileType.A2DP));
      expect(BluetoothProfileType.A2DP).assertEqual('A2DP');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#2 ' + "BluetoothProfileType.HFP" + ' = ' + JSON.stringify(BluetoothProfileType.HFP));
      expect(BluetoothProfileType.HFP).assertEqual('HFP');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#3 ' + "BluetoothProfileType.HID" + ' = ' + JSON.stringify(BluetoothProfileType.HID));
      expect(BluetoothProfileType.HID).assertEqual('HID');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#4 ' + "BluetoothProfileType.PAN" + ' = ' + JSON.stringify(BluetoothProfileType.PAN));
      expect(BluetoothProfileType.PAN).assertEqual('PAN');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#5 ' + "BluetoothProfileType.PBAP" + ' = ' + JSON.stringify(BluetoothProfileType.PBAP));
      expect(BluetoothProfileType.PBAP).assertEqual('PBAP');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#6 ' + "BluetoothProfileType.MAP" + ' = ' + JSON.stringify(BluetoothProfileType.MAP));
      expect(BluetoothProfileType.MAP).assertEqual('MAP');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#7 ' + "BluetoothProfileType.AVRCP" + ' = ' + JSON.stringify(BluetoothProfileType.AVRCP));
      expect(BluetoothProfileType.AVRCP).assertEqual('AVRCP');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#8 ' + "BluetoothProfileType.HDP" + ' = ' + JSON.stringify(BluetoothProfileType.HDP));
      expect(BluetoothProfileType.HDP).assertEqual('HDP');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#9 ' + "BluetoothConnectionState.DISCONNECTED" + ' = ' +
        JSON.stringify(BluetoothConnectionState.DISCONNECTED));
      expect(BluetoothConnectionState.DISCONNECTED).assertEqual('disconnected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#10 ' + "BluetoothConnectionState.CONNECTING" + ' = ' + JSON.stringify(BluetoothConnectionState.CONNECTING));
      expect(BluetoothConnectionState.CONNECTING).assertEqual('connecting');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#11 ' + "BluetoothConnectionState.CONNECTED" + ' = ' + JSON.stringify(BluetoothConnectionState.CONNECTED));
      expect(BluetoothConnectionState.CONNECTED).assertEqual('connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#12 ' + "BluetoothConnectionState.DISCONNECTING" + ' = ' +
        JSON.stringify(BluetoothConnectionState.DISCONNECTING));
      expect(BluetoothConnectionState.DISCONNECTING).assertEqual('disconnecting');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#13 ' + "BluetoothConnectionState.CONNECTION_FAILED" + ' = ' +
        JSON.stringify(BluetoothConnectionState.CONNECTION_FAILED));
      expect(BluetoothConnectionState.CONNECTION_FAILED).assertEqual('connection_failed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#14 ' + "BluetoothConnectionState.CONNECTION_TIMEOUT" + ' = ' +
        JSON.stringify(BluetoothConnectionState.CONNECTION_TIMEOUT));
      expect(BluetoothConnectionState.CONNECTION_TIMEOUT).assertEqual('connection_timeout');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#15 ' + "BluetoothScanState.IDLE" + ' = ' + JSON.stringify(BluetoothScanState.IDLE));
      expect(BluetoothScanState.IDLE).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#16 ' + "BluetoothScanState.SCANNING" + ' = ' + JSON.stringify(BluetoothScanState.SCANNING));
      expect(BluetoothScanState.SCANNING).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#17 ' + "BluetoothScanState.SCAN_COMPLETE" + ' = ' + JSON.stringify(BluetoothScanState.SCAN_COMPLETE));
      expect(BluetoothScanState.SCAN_COMPLETE).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#18 ' + "BluetoothScanState.SCAN_FAILED" + ' = ' + JSON.stringify(BluetoothScanState.SCAN_FAILED));
      expect(BluetoothScanState.SCAN_FAILED).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#19 ' + "BluetoothScanState.SCANNING - BluetoothScanState.IDLE" + ' = ' +
        JSON.stringify(BluetoothScanState.SCANNING - BluetoothScanState.IDLE));
      expect(BluetoothScanState.SCANNING - BluetoothScanState.IDLE).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#20 ' + "BluetoothScanState.SCAN_FAILED - BluetoothScanState.SCAN_COMPLETE" + ' = ' +
        JSON.stringify(BluetoothScanState.SCAN_FAILED - BluetoothScanState.SCAN_COMPLETE));
      expect(BluetoothScanState.SCAN_FAILED - BluetoothScanState.SCAN_COMPLETE).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#21 ' + "A2dpConnectionState.DISCONNECTED" + ' = ' + JSON.stringify(A2dpConnectionState.DISCONNECTED));
      expect(A2dpConnectionState.DISCONNECTED).assertEqual('disconnected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#22 ' + "A2dpConnectionState.NOT_CONNECTED" + ' = ' + JSON.stringify(A2dpConnectionState.NOT_CONNECTED));
      expect(A2dpConnectionState.NOT_CONNECTED).assertEqual(A2dpConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#23 ' + "A2dpConnectionState.CONNECTING" + ' = ' + JSON.stringify(A2dpConnectionState.CONNECTING));
      expect(A2dpConnectionState.CONNECTING).assertEqual('connecting');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#24 ' + "A2dpConnectionState.CONNECTED" + ' = ' + JSON.stringify(A2dpConnectionState.CONNECTED));
      expect(A2dpConnectionState.CONNECTED).assertEqual('connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#25 ' + "A2dpConnectionState.DISCONNECTING" + ' = ' + JSON.stringify(A2dpConnectionState.DISCONNECTING));
      expect(A2dpConnectionState.DISCONNECTING).assertEqual('disconnecting');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#26 ' + "A2dpConnectionState.AUDIO_CONNECTED" + ' = ' + JSON.stringify(A2dpConnectionState.AUDIO_CONNECTED));
      expect(A2dpConnectionState.AUDIO_CONNECTED).assertEqual('audio_connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#27 ' + "A2dpConnectionState.AUDIO_DISCONNECTING" + ' = ' +
        JSON.stringify(A2dpConnectionState.AUDIO_DISCONNECTING));
      expect(A2dpConnectionState.AUDIO_DISCONNECTING).assertEqual('audio_disconnecting');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#28 ' + "HfpConnectionState.DISCONNECTED" + ' = ' + JSON.stringify(HfpConnectionState.DISCONNECTED));
      expect(HfpConnectionState.DISCONNECTED).assertEqual('disconnected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#29 ' + "HfpConnectionState.NOT_CONNECTED" + ' = ' + JSON.stringify(HfpConnectionState.NOT_CONNECTED));
      expect(HfpConnectionState.NOT_CONNECTED).assertEqual(HfpConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#30 ' + "HfpConnectionState.SLC_CONNECTED" + ' = ' + JSON.stringify(HfpConnectionState.SLC_CONNECTED));
      expect(HfpConnectionState.SLC_CONNECTED).assertEqual('slc_connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#31 ' + "HfpConnectionState.SLC_CONNECTING" + ' = ' + JSON.stringify(HfpConnectionState.SLC_CONNECTING));
      expect(HfpConnectionState.SLC_CONNECTING).assertEqual('slc_connecting');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#32 ' + "HfpConnectionState.CONNECTING" + ' = ' + JSON.stringify(HfpConnectionState.CONNECTING));
      expect(HfpConnectionState.CONNECTING).assertEqual('connecting');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#33 ' + "HfpConnectionState.DISCONNECTING" + ' = ' + JSON.stringify(HfpConnectionState.DISCONNECTING));
      expect(HfpConnectionState.DISCONNECTING).assertEqual('disconnecting');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#34 ' + "HfpConnectionState.IN_CALL" + ' = ' + JSON.stringify(HfpConnectionState.IN_CALL));
      expect(HfpConnectionState.IN_CALL).assertEqual('in_call');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#35 ' + "HfpConnectionState.VOICE_RECOGNITION" + ' = ' + JSON.stringify(HfpConnectionState.VOICE_RECOGNITION));
      expect(HfpConnectionState.VOICE_RECOGNITION).assertEqual('voice_recognition');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#36 ' + "A2dpConnectionState.DISCONNECTED" + ' = ' + JSON.stringify(A2dpConnectionState.DISCONNECTED));
      expect(A2dpConnectionState.DISCONNECTED).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#37 ' + "HfpConnectionState.DISCONNECTED" + ' = ' + JSON.stringify(HfpConnectionState.DISCONNECTED));
      expect(HfpConnectionState.DISCONNECTED).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#38 ' + "A2dpConnectionState.AUDIO_CONNECTED" + ' = ' + JSON.stringify(A2dpConnectionState.AUDIO_CONNECTED));
      expect(A2dpConnectionState.AUDIO_CONNECTED).assertEqual('audio_connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#39 ' + "HfpConnectionState.SLC_CONNECTED" + ' = ' + JSON.stringify(HfpConnectionState.SLC_CONNECTED));
      expect(HfpConnectionState.SLC_CONNECTED).assertEqual('slc_connected');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#40 ' + "HidDeviceType.KEYBOARD" + ' = ' + JSON.stringify(HidDeviceType.KEYBOARD));
      expect(HidDeviceType.KEYBOARD).assertEqual('keyboard');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#41 ' + "HidDeviceType.MOUSE" + ' = ' + JSON.stringify(HidDeviceType.MOUSE));
      expect(HidDeviceType.MOUSE).assertEqual('mouse');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#42 ' + "HidDeviceType.TOUCHPAD" + ' = ' + JSON.stringify(HidDeviceType.TOUCHPAD));
      expect(HidDeviceType.TOUCHPAD).assertEqual('touchpad');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#43 ' + "HidDeviceType.GAMEPAD" + ' = ' + JSON.stringify(HidDeviceType.GAMEPAD));
      expect(HidDeviceType.GAMEPAD).assertEqual('gamepad');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#44 ' + "HidDeviceType.REMOTE" + ' = ' + JSON.stringify(HidDeviceType.REMOTE));
      expect(HidDeviceType.REMOTE).assertEqual('remote');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#45 ' + "PanNetworkRole.NONE" + ' = ' + JSON.stringify(PanNetworkRole.NONE));
      expect(PanNetworkRole.NONE).assertEqual('none');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#46 ' + "PanNetworkRole.NAP" + ' = ' + JSON.stringify(PanNetworkRole.NAP));
      expect(PanNetworkRole.NAP).assertEqual('nap');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#47 ' + "PanNetworkRole.GN" + ' = ' + JSON.stringify(PanNetworkRole.GN));
      expect(PanNetworkRole.GN).assertEqual('gn');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#48 ' + "PanNetworkRole.PANU" + ' = ' + JSON.stringify(PanNetworkRole.PANU));
      expect(PanNetworkRole.PANU).assertEqual('panu');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#49 ' + "PbapSortOrder.ALPHABETICAL" + ' = ' + JSON.stringify(PbapSortOrder.ALPHABETICAL));
      expect(PbapSortOrder.ALPHABETICAL).assertEqual('alphabetical');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#50 ' + "PbapSortOrder.BY_NAME" + ' = ' + JSON.stringify(PbapSortOrder.BY_NAME));
      expect(PbapSortOrder.BY_NAME).assertEqual('by_name');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#51 ' + "PbapSortOrder.BY_NUMBER" + ' = ' + JSON.stringify(PbapSortOrder.BY_NUMBER));
      expect(PbapSortOrder.BY_NUMBER).assertEqual('by_number');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#52 ' + "MapMessageType.SMS" + ' = ' + JSON.stringify(MapMessageType.SMS));
      expect(MapMessageType.SMS).assertEqual('sms');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#53 ' + "MapMessageType.EMAIL" + ' = ' + JSON.stringify(MapMessageType.EMAIL));
      expect(MapMessageType.EMAIL).assertEqual('email');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#54 ' + "MapMessageType.MMS" + ' = ' + JSON.stringify(MapMessageType.MMS));
      expect(MapMessageType.MMS).assertEqual('mms');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#55 ' + "AvrcpPlaybackState.STOPPED" + ' = ' + JSON.stringify(AvrcpPlaybackState.STOPPED));
      expect(AvrcpPlaybackState.STOPPED).assertEqual('stopped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#56 ' + "AvrcpPlaybackState.PLAYING" + ' = ' + JSON.stringify(AvrcpPlaybackState.PLAYING));
      expect(AvrcpPlaybackState.PLAYING).assertEqual('playing');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#57 ' + "AvrcpPlaybackState.PAUSED" + ' = ' + JSON.stringify(AvrcpPlaybackState.PAUSED));
      expect(AvrcpPlaybackState.PAUSED).assertEqual('paused');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#58 ' + "AvrcpPlaybackState.FAST_FORWARD" + ' = ' + JSON.stringify(AvrcpPlaybackState.FAST_FORWARD));
      expect(AvrcpPlaybackState.FAST_FORWARD).assertEqual('fast_forward');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#59 ' + "AvrcpPlaybackState.REWIND" + ' = ' + JSON.stringify(AvrcpPlaybackState.REWIND));
      expect(AvrcpPlaybackState.REWIND).assertEqual('rewind');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#60 ' + "HdpDataType.HEART_RATE" + ' = ' + JSON.stringify(HdpDataType.HEART_RATE));
      expect(HdpDataType.HEART_RATE).assertEqual('heart_rate');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#61 ' + "HdpDataType.BLOOD_PRESSURE" + ' = ' + JSON.stringify(HdpDataType.BLOOD_PRESSURE));
      expect(HdpDataType.BLOOD_PRESSURE).assertEqual('blood_pressure');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#62 ' + "HdpDataType.TEMPERATURE" + ' = ' + JSON.stringify(HdpDataType.TEMPERATURE));
      expect(HdpDataType.TEMPERATURE).assertEqual('temperature');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#63 ' + "HdpDataType.BLOOD_OXYGEN" + ' = ' + JSON.stringify(HdpDataType.BLOOD_OXYGEN));
      expect(HdpDataType.BLOOD_OXYGEN).assertEqual('blood_oxygen');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#64 ' + "HdpDataType.WEIGHT" + ' = ' + JSON.stringify(HdpDataType.WEIGHT));
      expect(HdpDataType.WEIGHT).assertEqual('weight');

      const profileTypes: string[] = [
        BluetoothProfileType.A2DP, BluetoothProfileType.HFP, BluetoothProfileType.HID,
        BluetoothProfileType.PAN, BluetoothProfileType.PBAP, BluetoothProfileType.MAP,
        BluetoothProfileType.AVRCP, BluetoothProfileType.HDP
      ];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#65 ' + "profileTypes.length" + ' = ' + JSON.stringify(profileTypes.length));
      expect(profileTypes.length).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#66 assert ' + "expect(duplicateCount(profileTypes)).assertEqual(0)");
      expect(duplicateCount(profileTypes)).assertEqual(0);

      const connectionStates: string[] = [
        BluetoothConnectionState.DISCONNECTED, BluetoothConnectionState.CONNECTING,
        BluetoothConnectionState.CONNECTED, BluetoothConnectionState.DISCONNECTING,
        BluetoothConnectionState.CONNECTION_FAILED, BluetoothConnectionState.CONNECTION_TIMEOUT
      ];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#67 ' + "connectionStates.length" + ' = ' + JSON.stringify(connectionStates.length));
      expect(connectionStates.length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#68 assert ' + "expect(duplicateCount(connectionStates)).assertEqual(0)");
      expect(duplicateCount(connectionStates)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#69 ' + "BluetoothConstants.CALL_STATE_IDLE" + ' = ' + JSON.stringify(BluetoothConstants.CALL_STATE_IDLE));
      expect(BluetoothConstants.CALL_STATE_IDLE).assertEqual('idle');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#70 ' + "BluetoothConstants.CALL_STATE_INCOMING" + ' = ' +
        JSON.stringify(BluetoothConstants.CALL_STATE_INCOMING));
      expect(BluetoothConstants.CALL_STATE_INCOMING).assertEqual('incoming');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#71 ' + "BluetoothConstants.CALL_STATE_OUTGOING" + ' = ' +
        JSON.stringify(BluetoothConstants.CALL_STATE_OUTGOING));
      expect(BluetoothConstants.CALL_STATE_OUTGOING).assertEqual('outgoing');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#72 ' + "BluetoothConstants.CALL_STATE_ACTIVE" + ' = ' + JSON.stringify(BluetoothConstants.CALL_STATE_ACTIVE));
      expect(BluetoothConstants.CALL_STATE_ACTIVE).assertEqual('active');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#73 ' + "BluetoothConstants.CALL_STATE_HELD" + ' = ' + JSON.stringify(BluetoothConstants.CALL_STATE_HELD));
      expect(BluetoothConstants.CALL_STATE_HELD).assertEqual('held');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#74 ' + "BluetoothConstants.CALL_STATE_ENDED" + ' = ' + JSON.stringify(BluetoothConstants.CALL_STATE_ENDED));
      expect(BluetoothConstants.CALL_STATE_ENDED).assertEqual('ended');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#75 assert ' +
        "expect(BluetoothConstants.CALL_STATE_INCOMING.indexOf(BluetoothConstants.CALL_STATE_ACTIVE)) .assertEqual(-" +
        "1)");
      expect(BluetoothConstants.CALL_STATE_INCOMING.indexOf(BluetoothConstants.CALL_STATE_ACTIVE))
        .assertEqual(-1);
      const callStates: string[] = [
        BluetoothConstants.CALL_STATE_IDLE, BluetoothConstants.CALL_STATE_INCOMING,
        BluetoothConstants.CALL_STATE_OUTGOING, BluetoothConstants.CALL_STATE_ACTIVE,
        BluetoothConstants.CALL_STATE_HELD, BluetoothConstants.CALL_STATE_ENDED
      ];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#76 ' + "callStates.length" + ' = ' + JSON.stringify(callStates.length));
      expect(callStates.length).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothConstants0012',
        '#77 assert ' + "expect(duplicateCount(callStates)).assertEqual(0)");
      expect(duplicateCount(callStates)).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothConstants0012', 'end');
    });
  });
}
