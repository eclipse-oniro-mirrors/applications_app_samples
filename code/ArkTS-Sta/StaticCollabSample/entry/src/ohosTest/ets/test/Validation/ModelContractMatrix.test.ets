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


import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  PeerInfoModel,
  ConnectOptionsModel,
  AppStorageModel,
  MockDeviceManager,
  MockCollabBridge,
  MockCollabSession,
  CollabEventRecorder,
  SessionIdGenerator,
  CollabTestLogger,
  CollabMetricsCollector,
  SessionState,
  CollabEventType,
  OperationStatus,
  ConnectStartOption,
  buildPeerInfo,
  buildConnectOptions,
  mockNetworkIds,
  mockPayload,
  encodeUtf8,
  decodeUtf8,
  utf8ByteLength,
  concatBuffers,
  isValidSessionId,
  isValidCollabToken,
  safeInvoke,
  safeInvokeAsync,
  buildPermissionItems,
  normalizeCallbackMessage,
  delay,
  waitUntil,
  runSerializedUiOperation,
  resetDriver,
  COLLAB_BUNDLE_NAME,
  COLLAB_MODULE_NAME,
  COLLAB_ABILITY_NAME,
  COLLAB_SERVICE_NAME,
  COLLAB_SESSION_NAME,
  MESSAGE_HELLO,
  DATA_PAYLOAD,
  INVALID_SESSION_ID,
  REQUESTED_PERMISSIONS,
  STORAGE_KEY_SESSION_ID,
  STORAGE_KEY_IS_CONNECTED,
  STORAGE_KEY_RECEIVE_MESSAGE,
  STORAGE_KEY_RECEIVE_WATCH_MESSAGE,
  PARAM_KEY_PEER_INFO,
  PARAM_KEY_CONNECT_OPTION,
  PARAM_KEY_COLLAB_TOKEN,
  TEXT_ENCODING
} from '../Shared/CollabTestDriver';


export default function modelContractMatrixTest(): void {
  describe('ModelContractMatrix_Test', () => {
    it('peer_default_contract', 0, async () => {
      const peer = buildPeerInfo('device_default');
      expect(peer.deviceId).assertEqual('device_default');
      expect(peer.bundleName).assertEqual(COLLAB_BUNDLE_NAME);
      expect(peer.moduleName).assertEqual(COLLAB_MODULE_NAME);
      expect(peer.abilityName).assertEqual(COLLAB_ABILITY_NAME);
      expect(peer.serviceName).assertEqual(COLLAB_SERVICE_NAME);
      expect(peer.isComplete()).assertTrue();
      expect(peer.missingFields().length).assertEqual(0);
    });

    it('peer_custom_fields_0', 0, async () => {
      const peer = new PeerInfoModel('dev_0', 'bundle_0', 'module_0', 'ability_0', 'service_0');
      expect(peer.deviceId).assertEqual('dev_0');
      expect(peer.bundleName).assertEqual('bundle_0');
      expect(peer.moduleName).assertEqual('module_0');
      expect(peer.abilityName).assertEqual('ability_0');
      expect(peer.serviceName).assertEqual('service_0');
      expect(peer.isComplete()).assertTrue();
      expect(peer.missingFields().length).assertEqual(0);
    });

    it('peer_custom_fields_1', 0, async () => {
      const peer = new PeerInfoModel('dev_1', 'bundle_1', 'module_1', 'ability_1', 'service_1');
      expect(peer.deviceId).assertEqual('dev_1');
      expect(peer.bundleName).assertEqual('bundle_1');
      expect(peer.moduleName).assertEqual('module_1');
      expect(peer.abilityName).assertEqual('ability_1');
      expect(peer.serviceName).assertEqual('service_1');
      expect(peer.isComplete()).assertTrue();
      expect(peer.missingFields().length).assertEqual(0);
    });

    it('peer_custom_fields_2', 0, async () => {
      const peer = new PeerInfoModel('dev_2', 'bundle_2', 'module_2', 'ability_2', 'service_2');
      expect(peer.deviceId).assertEqual('dev_2');
      expect(peer.bundleName).assertEqual('bundle_2');
      expect(peer.moduleName).assertEqual('module_2');
      expect(peer.abilityName).assertEqual('ability_2');
      expect(peer.serviceName).assertEqual('service_2');
      expect(peer.isComplete()).assertTrue();
      expect(peer.missingFields().length).assertEqual(0);
    });

    it('peer_custom_fields_3', 0, async () => {
      const peer = new PeerInfoModel('dev_3', 'bundle_3', 'module_3', 'ability_3', 'service_3');
      expect(peer.deviceId).assertEqual('dev_3');
      expect(peer.bundleName).assertEqual('bundle_3');
      expect(peer.moduleName).assertEqual('module_3');
      expect(peer.abilityName).assertEqual('ability_3');
      expect(peer.serviceName).assertEqual('service_3');
      expect(peer.isComplete()).assertTrue();
      expect(peer.missingFields().length).assertEqual(0);
    });

    it('peer_custom_fields_4', 0, async () => {
      const peer = new PeerInfoModel('dev_4', 'bundle_4', 'module_4', 'ability_4', 'service_4');
      expect(peer.deviceId).assertEqual('dev_4');
      expect(peer.bundleName).assertEqual('bundle_4');
      expect(peer.moduleName).assertEqual('module_4');
      expect(peer.abilityName).assertEqual('ability_4');
      expect(peer.serviceName).assertEqual('service_4');
      expect(peer.isComplete()).assertTrue();
      expect(peer.missingFields().length).assertEqual(0);
    });

    it('peer_custom_fields_5', 0, async () => {
      const peer = new PeerInfoModel('dev_5', 'bundle_5', 'module_5', 'ability_5', 'service_5');
      expect(peer.deviceId).assertEqual('dev_5');
      expect(peer.bundleName).assertEqual('bundle_5');
      expect(peer.moduleName).assertEqual('module_5');
      expect(peer.abilityName).assertEqual('ability_5');
      expect(peer.serviceName).assertEqual('service_5');
      expect(peer.isComplete()).assertTrue();
      expect(peer.missingFields().length).assertEqual(0);
    });

    it('peer_custom_fields_6', 0, async () => {
      const peer = new PeerInfoModel('dev_6', 'bundle_6', 'module_6', 'ability_6', 'service_6');
      expect(peer.deviceId).assertEqual('dev_6');
      expect(peer.bundleName).assertEqual('bundle_6');
      expect(peer.moduleName).assertEqual('module_6');
      expect(peer.abilityName).assertEqual('ability_6');
      expect(peer.serviceName).assertEqual('service_6');
      expect(peer.isComplete()).assertTrue();
      expect(peer.missingFields().length).assertEqual(0);
    });

    it('peer_custom_fields_7', 0, async () => {
      const peer = new PeerInfoModel('dev_7', 'bundle_7', 'module_7', 'ability_7', 'service_7');
      expect(peer.deviceId).assertEqual('dev_7');
      expect(peer.bundleName).assertEqual('bundle_7');
      expect(peer.moduleName).assertEqual('module_7');
      expect(peer.abilityName).assertEqual('ability_7');
      expect(peer.serviceName).assertEqual('service_7');
      expect(peer.isComplete()).assertTrue();
      expect(peer.missingFields().length).assertEqual(0);
    });

    it('peer_custom_fields_8', 0, async () => {
      const peer = new PeerInfoModel('dev_8', 'bundle_8', 'module_8', 'ability_8', 'service_8');
      expect(peer.deviceId).assertEqual('dev_8');
      expect(peer.bundleName).assertEqual('bundle_8');
      expect(peer.moduleName).assertEqual('module_8');
      expect(peer.abilityName).assertEqual('ability_8');
      expect(peer.serviceName).assertEqual('service_8');
      expect(peer.isComplete()).assertTrue();
      expect(peer.missingFields().length).assertEqual(0);
    });

    it('peer_custom_fields_9', 0, async () => {
      const peer = new PeerInfoModel('dev_9', 'bundle_9', 'module_9', 'ability_9', 'service_9');
      expect(peer.deviceId).assertEqual('dev_9');
      expect(peer.bundleName).assertEqual('bundle_9');
      expect(peer.moduleName).assertEqual('module_9');
      expect(peer.abilityName).assertEqual('ability_9');
      expect(peer.serviceName).assertEqual('service_9');
      expect(peer.isComplete()).assertTrue();
      expect(peer.missingFields().length).assertEqual(0);
    });

    it('peer_custom_fields_10', 0, async () => {
      const peer = new PeerInfoModel('dev_10', 'bundle_10', 'module_10', 'ability_10', 'service_10');
      expect(peer.deviceId).assertEqual('dev_10');
      expect(peer.bundleName).assertEqual('bundle_10');
      expect(peer.moduleName).assertEqual('module_10');
      expect(peer.abilityName).assertEqual('ability_10');
      expect(peer.serviceName).assertEqual('service_10');
      expect(peer.isComplete()).assertTrue();
      expect(peer.missingFields().length).assertEqual(0);
    });

    it('peer_custom_fields_11', 0, async () => {
      const peer = new PeerInfoModel('dev_11', 'bundle_11', 'module_11', 'ability_11', 'service_11');
      expect(peer.deviceId).assertEqual('dev_11');
      expect(peer.bundleName).assertEqual('bundle_11');
      expect(peer.moduleName).assertEqual('module_11');
      expect(peer.abilityName).assertEqual('ability_11');
      expect(peer.serviceName).assertEqual('service_11');
      expect(peer.isComplete()).assertTrue();
      expect(peer.missingFields().length).assertEqual(0);
    });

    it('peer_missing_device', 0, async () => {
      const peer = new PeerInfoModel('', COLLAB_BUNDLE_NAME, COLLAB_MODULE_NAME, COLLAB_ABILITY_NAME, COLLAB_SERVICE_NAME);
      expect(peer.isComplete()).assertFalse();
      const missing = peer.missingFields();
      expect(missing.length).assertEqual(1);
      expect(missing[0]).assertEqual('deviceId');
    });

    it('peer_missing_bundle', 0, async () => {
      const peer = new PeerInfoModel('dev', '', COLLAB_MODULE_NAME, COLLAB_ABILITY_NAME, COLLAB_SERVICE_NAME);
      expect(peer.isComplete()).assertFalse();
      const missing = peer.missingFields();
      expect(missing.length).assertEqual(1);
      expect(missing[0]).assertEqual('bundleName');
    });

    it('peer_missing_module', 0, async () => {
      const peer = new PeerInfoModel('dev', COLLAB_BUNDLE_NAME, '', COLLAB_ABILITY_NAME, COLLAB_SERVICE_NAME);
      expect(peer.isComplete()).assertFalse();
      const missing = peer.missingFields();
      expect(missing.length).assertEqual(1);
      expect(missing[0]).assertEqual('moduleName');
    });

    it('peer_missing_ability', 0, async () => {
      const peer = new PeerInfoModel('dev', COLLAB_BUNDLE_NAME, COLLAB_MODULE_NAME, '', COLLAB_SERVICE_NAME);
      expect(peer.isComplete()).assertFalse();
      const missing = peer.missingFields();
      expect(missing.length).assertEqual(1);
      expect(missing[0]).assertEqual('abilityName');
    });

    it('peer_missing_service', 0, async () => {
      const peer = new PeerInfoModel('dev', COLLAB_BUNDLE_NAME, COLLAB_MODULE_NAME, COLLAB_ABILITY_NAME, '');
      expect(peer.isComplete()).assertFalse();
      const missing = peer.missingFields();
      expect(missing.length).assertEqual(1);
      expect(missing[0]).assertEqual('serviceName');
    });

    it('peer_missing_pair_deviceId_bundleName', 0, async () => {
      const missing = new PeerInfoModel('', '', COLLAB_MODULE_NAME, COLLAB_ABILITY_NAME, COLLAB_SERVICE_NAME).missingFields();
      expect(missing.length).assertEqual(2);
      expect(missing[0]).assertEqual('deviceId');
      expect(missing[1]).assertEqual('bundleName');
    });

    it('peer_missing_pair_deviceId_moduleName', 0, async () => {
      const missing = new PeerInfoModel('', COLLAB_BUNDLE_NAME, '', COLLAB_ABILITY_NAME, COLLAB_SERVICE_NAME).missingFields();
      expect(missing.length).assertEqual(2);
      expect(missing[0]).assertEqual('deviceId');
      expect(missing[1]).assertEqual('moduleName');
    });

    it('peer_missing_pair_deviceId_abilityName', 0, async () => {
      const missing = new PeerInfoModel('', COLLAB_BUNDLE_NAME, COLLAB_MODULE_NAME, '', COLLAB_SERVICE_NAME).missingFields();
      expect(missing.length).assertEqual(2);
      expect(missing[0]).assertEqual('deviceId');
      expect(missing[1]).assertEqual('abilityName');
    });

    it('peer_missing_pair_deviceId_serviceName', 0, async () => {
      const missing = new PeerInfoModel('', COLLAB_BUNDLE_NAME, COLLAB_MODULE_NAME, COLLAB_ABILITY_NAME, '').missingFields();
      expect(missing.length).assertEqual(2);
      expect(missing[0]).assertEqual('deviceId');
      expect(missing[1]).assertEqual('serviceName');
    });

    it('peer_missing_pair_bundleName_moduleName', 0, async () => {
      const missing = new PeerInfoModel('dev', '', '', COLLAB_ABILITY_NAME, COLLAB_SERVICE_NAME).missingFields();
      expect(missing.length).assertEqual(2);
      expect(missing[0]).assertEqual('bundleName');
      expect(missing[1]).assertEqual('moduleName');
    });

    it('peer_missing_pair_bundleName_abilityName', 0, async () => {
      const missing = new PeerInfoModel('dev', '', COLLAB_MODULE_NAME, '', COLLAB_SERVICE_NAME).missingFields();
      expect(missing.length).assertEqual(2);
      expect(missing[0]).assertEqual('bundleName');
      expect(missing[1]).assertEqual('abilityName');
    });

    it('peer_missing_pair_bundleName_serviceName', 0, async () => {
      const missing = new PeerInfoModel('dev', '', COLLAB_MODULE_NAME, COLLAB_ABILITY_NAME, '').missingFields();
      expect(missing.length).assertEqual(2);
      expect(missing[0]).assertEqual('bundleName');
      expect(missing[1]).assertEqual('serviceName');
    });

    it('peer_missing_pair_moduleName_abilityName', 0, async () => {
      const missing = new PeerInfoModel('dev', COLLAB_BUNDLE_NAME, '', '', COLLAB_SERVICE_NAME).missingFields();
      expect(missing.length).assertEqual(2);
      expect(missing[0]).assertEqual('moduleName');
      expect(missing[1]).assertEqual('abilityName');
    });

    it('peer_missing_pair_moduleName_serviceName', 0, async () => {
      const missing = new PeerInfoModel('dev', COLLAB_BUNDLE_NAME, '', COLLAB_ABILITY_NAME, '').missingFields();
      expect(missing.length).assertEqual(2);
      expect(missing[0]).assertEqual('moduleName');
      expect(missing[1]).assertEqual('serviceName');
    });

    it('peer_missing_pair_abilityName_serviceName', 0, async () => {
      const missing = new PeerInfoModel('dev', COLLAB_BUNDLE_NAME, COLLAB_MODULE_NAME, '', '').missingFields();
      expect(missing.length).assertEqual(2);
      expect(missing[0]).assertEqual('abilityName');
      expect(missing[1]).assertEqual('serviceName');
    });

    it('peer_to_like_contract', 0, async () => {
      const peer = buildPeerInfo('dev_like');
      const like = peer.toLike();
      expect(like.deviceId).assertEqual('dev_like');
      expect(like.bundleName).assertEqual(COLLAB_BUNDLE_NAME);
      expect(like.moduleName).assertEqual(COLLAB_MODULE_NAME);
      expect(like.abilityName).assertEqual(COLLAB_ABILITY_NAME);
      expect(like.serviceName).assertEqual(COLLAB_SERVICE_NAME);
    });

    it('peer_to_record_contract', 0, async () => {
      const peer = buildPeerInfo('dev_record');
      const record: Record<string, string> = peer.toRecord();
      expect(record['deviceId']).assertEqual('dev_record');
      expect(record['bundleName']).assertEqual(COLLAB_BUNDLE_NAME);
      expect(record['moduleName']).assertEqual(COLLAB_MODULE_NAME);
      expect(record['abilityName']).assertEqual(COLLAB_ABILITY_NAME);
      expect(record['serviceName']).assertEqual(COLLAB_SERVICE_NAME);
    });

    it('peer_from_record_roundtrip', 0, async () => {
      const peer = buildPeerInfo('dev_roundtrip');
      const restored = PeerInfoModel.fromRecord(peer.toRecord());
      expect(restored.equals(peer)).assertTrue();
      expect(restored.deviceId).assertEqual('dev_roundtrip');
      expect(restored.bundleName).assertEqual(COLLAB_BUNDLE_NAME);
    });

    it('peer_from_record_missing_deviceId', 0, async () => {
      const record: Record<string, string> = {};
      record['deviceId'] = 'dev_partial';
      record['bundleName'] = COLLAB_BUNDLE_NAME;
      record['moduleName'] = COLLAB_MODULE_NAME;
      record['abilityName'] = COLLAB_ABILITY_NAME;
      record['serviceName'] = COLLAB_SERVICE_NAME;
      record['deviceId'] = '';
      const restored = PeerInfoModel.fromRecord(record);
      expect(restored.deviceId).assertEqual('');
      expect(restored.isComplete()).assertFalse();
    });

    it('peer_from_record_missing_bundleName', 0, async () => {
      const record: Record<string, string> = {};
      record['deviceId'] = 'dev_partial';
      record['bundleName'] = COLLAB_BUNDLE_NAME;
      record['moduleName'] = COLLAB_MODULE_NAME;
      record['abilityName'] = COLLAB_ABILITY_NAME;
      record['serviceName'] = COLLAB_SERVICE_NAME;
      record['bundleName'] = '';
      const restored = PeerInfoModel.fromRecord(record);
      expect(restored.bundleName).assertEqual('');
      expect(restored.isComplete()).assertFalse();
    });

    it('peer_from_record_missing_moduleName', 0, async () => {
      const record: Record<string, string> = {};
      record['deviceId'] = 'dev_partial';
      record['bundleName'] = COLLAB_BUNDLE_NAME;
      record['moduleName'] = COLLAB_MODULE_NAME;
      record['abilityName'] = COLLAB_ABILITY_NAME;
      record['serviceName'] = COLLAB_SERVICE_NAME;
      record['moduleName'] = '';
      const restored = PeerInfoModel.fromRecord(record);
      expect(restored.moduleName).assertEqual('');
      expect(restored.isComplete()).assertFalse();
    });

    it('peer_from_record_missing_abilityName', 0, async () => {
      const record: Record<string, string> = {};
      record['deviceId'] = 'dev_partial';
      record['bundleName'] = COLLAB_BUNDLE_NAME;
      record['moduleName'] = COLLAB_MODULE_NAME;
      record['abilityName'] = COLLAB_ABILITY_NAME;
      record['serviceName'] = COLLAB_SERVICE_NAME;
      record['abilityName'] = '';
      const restored = PeerInfoModel.fromRecord(record);
      expect(restored.abilityName).assertEqual('');
      expect(restored.isComplete()).assertFalse();
    });

    it('peer_from_record_missing_serviceName', 0, async () => {
      const record: Record<string, string> = {};
      record['deviceId'] = 'dev_partial';
      record['bundleName'] = COLLAB_BUNDLE_NAME;
      record['moduleName'] = COLLAB_MODULE_NAME;
      record['abilityName'] = COLLAB_ABILITY_NAME;
      record['serviceName'] = COLLAB_SERVICE_NAME;
      record['serviceName'] = '';
      const restored = PeerInfoModel.fromRecord(record);
      expect(restored.serviceName).assertEqual('');
      expect(restored.isComplete()).assertFalse();
    });

    it('peer_from_record_extra_keys_ignored', 0, async () => {
      const record: Record<string, string> = {};
      record['deviceId'] = 'dev_extra';
      record['bundleName'] = COLLAB_BUNDLE_NAME;
      record['moduleName'] = COLLAB_MODULE_NAME;
      record['abilityName'] = COLLAB_ABILITY_NAME;
      record['serviceName'] = COLLAB_SERVICE_NAME;
      record['unexpected'] = 'ignored';
      const restored = PeerInfoModel.fromRecord(record);
      expect(restored.deviceId).assertEqual('dev_extra');
      expect(restored.isComplete()).assertTrue();
    });

    it('peer_clone_independent_deviceId', 0, async () => {
      const source = buildPeerInfo('dev_source');
      const cloned = source.clone();
      cloned.deviceId = 'mutated';
      expect(source.deviceId).assertEqual(source.clone().deviceId);
      expect(cloned.deviceId).assertEqual('mutated');
    });

    it('peer_clone_independent_bundleName', 0, async () => {
      const source = buildPeerInfo('dev_source');
      const cloned = source.clone();
      cloned.bundleName = 'mutated';
      expect(source.bundleName).assertEqual(source.clone().bundleName);
      expect(cloned.bundleName).assertEqual('mutated');
    });

    it('peer_clone_independent_moduleName', 0, async () => {
      const source = buildPeerInfo('dev_source');
      const cloned = source.clone();
      cloned.moduleName = 'mutated';
      expect(source.moduleName).assertEqual(source.clone().moduleName);
      expect(cloned.moduleName).assertEqual('mutated');
    });

    it('peer_clone_independent_abilityName', 0, async () => {
      const source = buildPeerInfo('dev_source');
      const cloned = source.clone();
      cloned.abilityName = 'mutated';
      expect(source.abilityName).assertEqual(source.clone().abilityName);
      expect(cloned.abilityName).assertEqual('mutated');
    });

    it('peer_clone_independent_serviceName', 0, async () => {
      const source = buildPeerInfo('dev_source');
      const cloned = source.clone();
      cloned.serviceName = 'mutated';
      expect(source.serviceName).assertEqual(source.clone().serviceName);
      expect(cloned.serviceName).assertEqual('mutated');
    });

    it('peer_equals_same_values', 0, async () => {
      const a = buildPeerInfo('dev_eq');
      const b = buildPeerInfo('dev_eq');
      expect(a.equals(b)).assertTrue();
      expect(a.equals(a)).assertTrue();
      expect(a.equals(a.clone())).assertTrue();
    });

    it('peer_equals_diff_deviceId', 0, async () => {
      const a = buildPeerInfo('dev_eq');
      const b = buildPeerInfo('dev_eq');
      b.deviceId = 'dev_other';
      expect(a.equals(b)).assertFalse();
    });

    it('peer_equals_diff_bundleName', 0, async () => {
      const a = buildPeerInfo('dev_eq');
      const b = buildPeerInfo('dev_eq');
      b.bundleName = 'other.bundle';
      expect(a.equals(b)).assertFalse();
    });

    it('peer_equals_diff_moduleName', 0, async () => {
      const a = buildPeerInfo('dev_eq');
      const b = buildPeerInfo('dev_eq');
      b.moduleName = 'otherModule';
      expect(a.equals(b)).assertFalse();
    });

    it('peer_equals_diff_abilityName', 0, async () => {
      const a = buildPeerInfo('dev_eq');
      const b = buildPeerInfo('dev_eq');
      b.abilityName = 'OtherAbility';
      expect(a.equals(b)).assertFalse();
    });

    it('peer_equals_diff_serviceName', 0, async () => {
      const a = buildPeerInfo('dev_eq');
      const b = buildPeerInfo('dev_eq');
      b.serviceName = 'otherService';
      expect(a.equals(b)).assertFalse();
    });

    it('peer_describe_deviceId', 0, async () => {
      const text = buildPeerInfo('dev_desc').describe();
      expect(text.indexOf('deviceId=') >= 0).assertTrue();
      expect(text.length > 0).assertTrue();
    });

    it('peer_describe_bundleName', 0, async () => {
      const text = buildPeerInfo('dev_desc').describe();
      expect(text.indexOf('bundle=') >= 0).assertTrue();
      expect(text.length > 0).assertTrue();
    });

    it('peer_describe_moduleName', 0, async () => {
      const text = buildPeerInfo('dev_desc').describe();
      expect(text.indexOf('module=') >= 0).assertTrue();
      expect(text.length > 0).assertTrue();
    });

    it('peer_describe_abilityName', 0, async () => {
      const text = buildPeerInfo('dev_desc').describe();
      expect(text.indexOf('ability=') >= 0).assertTrue();
      expect(text.length > 0).assertTrue();
    });

    it('peer_describe_serviceName', 0, async () => {
      const text = buildPeerInfo('dev_desc').describe();
      expect(text.indexOf('service=') >= 0).assertTrue();
      expect(text.length > 0).assertTrue();
    });

    it('options_default_contract', 0, async () => {
      const options = new ConnectOptionsModel();
      expect(options.needSendData).assertEqual(true);
      expect(options.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      expect(options.toLike().needSendData).assertEqual(true);
      expect(options.toLike().startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
    });

    it('options_explicit_true_start_in_foreground', 0, async () => {
      const options = new ConnectOptionsModel(true, ConnectStartOption.START_IN_FOREGROUND);
      expect(options.needSendData).assertEqual(true);
      expect(options.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const like = options.toLike();
      expect(like.needSendData).assertEqual(true);
      expect(like.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
    });

    it('options_explicit_true_start_in_background', 0, async () => {
      const options = new ConnectOptionsModel(true, ConnectStartOption.START_IN_BACKGROUND);
      expect(options.needSendData).assertEqual(true);
      expect(options.startOption).assertEqual(ConnectStartOption.START_IN_BACKGROUND);
      const like = options.toLike();
      expect(like.needSendData).assertEqual(true);
      expect(like.startOption).assertEqual(ConnectStartOption.START_IN_BACKGROUND);
    });

    it('options_explicit_false_start_in_foreground', 0, async () => {
      const options = new ConnectOptionsModel(false, ConnectStartOption.START_IN_FOREGROUND);
      expect(options.needSendData).assertEqual(false);
      expect(options.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      const like = options.toLike();
      expect(like.needSendData).assertEqual(false);
      expect(like.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
    });

    it('options_explicit_false_start_in_background', 0, async () => {
      const options = new ConnectOptionsModel(false, ConnectStartOption.START_IN_BACKGROUND);
      expect(options.needSendData).assertEqual(false);
      expect(options.startOption).assertEqual(ConnectStartOption.START_IN_BACKGROUND);
      const like = options.toLike();
      expect(like.needSendData).assertEqual(false);
      expect(like.startOption).assertEqual(ConnectStartOption.START_IN_BACKGROUND);
    });

    it('options_equals_0', 0, async () => {
      const a = new ConnectOptionsModel(true, ConnectStartOption.START_IN_FOREGROUND);
      const b = new ConnectOptionsModel(true, ConnectStartOption.START_IN_FOREGROUND);
      expect(a.equals(b)).assertEqual(true);
    });

    it('options_equals_1', 0, async () => {
      const a = new ConnectOptionsModel(true, ConnectStartOption.START_IN_FOREGROUND);
      const b = new ConnectOptionsModel(true, ConnectStartOption.START_IN_BACKGROUND);
      expect(a.equals(b)).assertEqual(false);
    });

    it('options_equals_2', 0, async () => {
      const a = new ConnectOptionsModel(true, ConnectStartOption.START_IN_FOREGROUND);
      const b = new ConnectOptionsModel(false, ConnectStartOption.START_IN_FOREGROUND);
      expect(a.equals(b)).assertEqual(false);
    });

    it('options_equals_3', 0, async () => {
      const a = new ConnectOptionsModel(true, ConnectStartOption.START_IN_FOREGROUND);
      const b = new ConnectOptionsModel(false, ConnectStartOption.START_IN_BACKGROUND);
      expect(a.equals(b)).assertEqual(false);
    });

    it('options_equals_4', 0, async () => {
      const a = new ConnectOptionsModel(true, ConnectStartOption.START_IN_BACKGROUND);
      const b = new ConnectOptionsModel(true, ConnectStartOption.START_IN_FOREGROUND);
      expect(a.equals(b)).assertEqual(false);
    });

    it('options_equals_5', 0, async () => {
      const a = new ConnectOptionsModel(true, ConnectStartOption.START_IN_BACKGROUND);
      const b = new ConnectOptionsModel(true, ConnectStartOption.START_IN_BACKGROUND);
      expect(a.equals(b)).assertEqual(true);
    });

    it('options_equals_6', 0, async () => {
      const a = new ConnectOptionsModel(true, ConnectStartOption.START_IN_BACKGROUND);
      const b = new ConnectOptionsModel(false, ConnectStartOption.START_IN_FOREGROUND);
      expect(a.equals(b)).assertEqual(false);
    });

    it('options_equals_7', 0, async () => {
      const a = new ConnectOptionsModel(true, ConnectStartOption.START_IN_BACKGROUND);
      const b = new ConnectOptionsModel(false, ConnectStartOption.START_IN_BACKGROUND);
      expect(a.equals(b)).assertEqual(false);
    });

    it('options_equals_8', 0, async () => {
      const a = new ConnectOptionsModel(false, ConnectStartOption.START_IN_FOREGROUND);
      const b = new ConnectOptionsModel(true, ConnectStartOption.START_IN_FOREGROUND);
      expect(a.equals(b)).assertEqual(false);
    });

    it('options_equals_9', 0, async () => {
      const a = new ConnectOptionsModel(false, ConnectStartOption.START_IN_FOREGROUND);
      const b = new ConnectOptionsModel(true, ConnectStartOption.START_IN_BACKGROUND);
      expect(a.equals(b)).assertEqual(false);
    });

    it('options_equals_10', 0, async () => {
      const a = new ConnectOptionsModel(false, ConnectStartOption.START_IN_FOREGROUND);
      const b = new ConnectOptionsModel(false, ConnectStartOption.START_IN_FOREGROUND);
      expect(a.equals(b)).assertEqual(true);
    });

    it('options_equals_11', 0, async () => {
      const a = new ConnectOptionsModel(false, ConnectStartOption.START_IN_FOREGROUND);
      const b = new ConnectOptionsModel(false, ConnectStartOption.START_IN_BACKGROUND);
      expect(a.equals(b)).assertEqual(false);
    });

    it('options_equals_12', 0, async () => {
      const a = new ConnectOptionsModel(false, ConnectStartOption.START_IN_BACKGROUND);
      const b = new ConnectOptionsModel(true, ConnectStartOption.START_IN_FOREGROUND);
      expect(a.equals(b)).assertEqual(false);
    });

    it('options_equals_13', 0, async () => {
      const a = new ConnectOptionsModel(false, ConnectStartOption.START_IN_BACKGROUND);
      const b = new ConnectOptionsModel(true, ConnectStartOption.START_IN_BACKGROUND);
      expect(a.equals(b)).assertEqual(false);
    });

    it('options_equals_14', 0, async () => {
      const a = new ConnectOptionsModel(false, ConnectStartOption.START_IN_BACKGROUND);
      const b = new ConnectOptionsModel(false, ConnectStartOption.START_IN_FOREGROUND);
      expect(a.equals(b)).assertEqual(false);
    });

    it('options_equals_15', 0, async () => {
      const a = new ConnectOptionsModel(false, ConnectStartOption.START_IN_BACKGROUND);
      const b = new ConnectOptionsModel(false, ConnectStartOption.START_IN_BACKGROUND);
      expect(a.equals(b)).assertEqual(true);
    });

    it('options_clone_independent', 0, async () => {
      const source = new ConnectOptionsModel(true, ConnectStartOption.START_IN_FOREGROUND);
      const cloned = source.clone();
      expect(cloned.equals(source)).assertTrue();
      cloned.needSendData = false;
      cloned.startOption = ConnectStartOption.START_IN_BACKGROUND;
      expect(source.needSendData).assertEqual(true);
      expect(source.startOption).assertEqual(ConnectStartOption.START_IN_FOREGROUND);
      expect(cloned.needSendData).assertEqual(false);
    });

    it('options_describe_contract', 0, async () => {
      const text = new ConnectOptionsModel(false, ConnectStartOption.START_IN_BACKGROUND).describe();
      expect(text.indexOf('needSendData=false') >= 0).assertTrue();
      expect(text.indexOf('startInBackground') >= 0).assertTrue();
    });

  });
}

