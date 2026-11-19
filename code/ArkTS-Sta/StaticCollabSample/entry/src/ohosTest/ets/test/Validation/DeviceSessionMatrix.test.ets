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


export default function deviceSessionMatrixTest(): void {
  describe('DeviceSessionMatrix_Test', () => {
    it('device_count_0', 0, async () => {
      const manager = new MockDeviceManager(0);
      expect(manager.size()).assertEqual(0);
      expect(manager.getFirstNetworkId()).assertEqual('');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_1', 0, async () => {
      const manager = new MockDeviceManager(1);
      expect(manager.size()).assertEqual(1);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_2', 0, async () => {
      const manager = new MockDeviceManager(2);
      expect(manager.size()).assertEqual(2);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_3', 0, async () => {
      const manager = new MockDeviceManager(3);
      expect(manager.size()).assertEqual(3);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_4', 0, async () => {
      const manager = new MockDeviceManager(4);
      expect(manager.size()).assertEqual(4);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_5', 0, async () => {
      const manager = new MockDeviceManager(5);
      expect(manager.size()).assertEqual(5);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_6', 0, async () => {
      const manager = new MockDeviceManager(6);
      expect(manager.size()).assertEqual(6);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_7', 0, async () => {
      const manager = new MockDeviceManager(7);
      expect(manager.size()).assertEqual(7);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_8', 0, async () => {
      const manager = new MockDeviceManager(8);
      expect(manager.size()).assertEqual(8);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_9', 0, async () => {
      const manager = new MockDeviceManager(9);
      expect(manager.size()).assertEqual(9);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_10', 0, async () => {
      const manager = new MockDeviceManager(10);
      expect(manager.size()).assertEqual(10);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_11', 0, async () => {
      const manager = new MockDeviceManager(11);
      expect(manager.size()).assertEqual(11);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_12', 0, async () => {
      const manager = new MockDeviceManager(12);
      expect(manager.size()).assertEqual(12);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_13', 0, async () => {
      const manager = new MockDeviceManager(13);
      expect(manager.size()).assertEqual(13);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_14', 0, async () => {
      const manager = new MockDeviceManager(14);
      expect(manager.size()).assertEqual(14);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_15', 0, async () => {
      const manager = new MockDeviceManager(15);
      expect(manager.size()).assertEqual(15);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_16', 0, async () => {
      const manager = new MockDeviceManager(16);
      expect(manager.size()).assertEqual(16);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_17', 0, async () => {
      const manager = new MockDeviceManager(17);
      expect(manager.size()).assertEqual(17);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_18', 0, async () => {
      const manager = new MockDeviceManager(18);
      expect(manager.size()).assertEqual(18);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_19', 0, async () => {
      const manager = new MockDeviceManager(19);
      expect(manager.size()).assertEqual(19);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_20', 0, async () => {
      const manager = new MockDeviceManager(20);
      expect(manager.size()).assertEqual(20);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_21', 0, async () => {
      const manager = new MockDeviceManager(21);
      expect(manager.size()).assertEqual(21);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_22', 0, async () => {
      const manager = new MockDeviceManager(22);
      expect(manager.size()).assertEqual(22);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_23', 0, async () => {
      const manager = new MockDeviceManager(23);
      expect(manager.size()).assertEqual(23);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_24', 0, async () => {
      const manager = new MockDeviceManager(24);
      expect(manager.size()).assertEqual(24);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_25', 0, async () => {
      const manager = new MockDeviceManager(25);
      expect(manager.size()).assertEqual(25);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_26', 0, async () => {
      const manager = new MockDeviceManager(26);
      expect(manager.size()).assertEqual(26);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_27', 0, async () => {
      const manager = new MockDeviceManager(27);
      expect(manager.size()).assertEqual(27);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_28', 0, async () => {
      const manager = new MockDeviceManager(28);
      expect(manager.size()).assertEqual(28);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_29', 0, async () => {
      const manager = new MockDeviceManager(29);
      expect(manager.size()).assertEqual(29);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_count_30', 0, async () => {
      const manager = new MockDeviceManager(30);
      expect(manager.size()).assertEqual(30);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
      expect(manager.isCreated()).assertEqual(false);
      expect(manager.getQueryCount()).assertEqual(1);
    });

    it('device_types_1', 0, async () => {
      const manager = new MockDeviceManager(1);
      const devices = manager.getAvailableDeviceListSync();
      expect(devices.length).assertEqual(1);
      expect(devices[0].deviceType).assertEqual('phone');
    });

    it('device_types_2', 0, async () => {
      const manager = new MockDeviceManager(2);
      const devices = manager.getAvailableDeviceListSync();
      expect(devices.length).assertEqual(2);
      expect(devices[0].deviceType).assertEqual('phone');
      expect(devices[1].deviceType).assertEqual('tablet');
      expect(devices[1].deviceId).assertEqual('device_1');
    });

    it('device_types_3', 0, async () => {
      const manager = new MockDeviceManager(3);
      const devices = manager.getAvailableDeviceListSync();
      expect(devices.length).assertEqual(3);
      expect(devices[0].deviceType).assertEqual('phone');
      expect(devices[1].deviceType).assertEqual('tablet');
      expect(devices[1].deviceId).assertEqual('device_1');
      expect(devices[2].deviceType).assertEqual('tablet');
      expect(devices[2].deviceId).assertEqual('device_2');
    });

    it('device_types_5', 0, async () => {
      const manager = new MockDeviceManager(5);
      const devices = manager.getAvailableDeviceListSync();
      expect(devices.length).assertEqual(5);
      expect(devices[0].deviceType).assertEqual('phone');
      expect(devices[1].deviceType).assertEqual('tablet');
      expect(devices[1].deviceId).assertEqual('device_1');
      expect(devices[2].deviceType).assertEqual('tablet');
      expect(devices[2].deviceId).assertEqual('device_2');
      expect(devices[3].deviceType).assertEqual('tablet');
      expect(devices[3].deviceId).assertEqual('device_3');
      expect(devices[4].deviceType).assertEqual('tablet');
      expect(devices[4].deviceId).assertEqual('device_4');
    });

    it('device_types_8', 0, async () => {
      const manager = new MockDeviceManager(8);
      const devices = manager.getAvailableDeviceListSync();
      expect(devices.length).assertEqual(8);
      expect(devices[0].deviceType).assertEqual('phone');
      expect(devices[1].deviceType).assertEqual('tablet');
      expect(devices[1].deviceId).assertEqual('device_1');
      expect(devices[2].deviceType).assertEqual('tablet');
      expect(devices[2].deviceId).assertEqual('device_2');
      expect(devices[3].deviceType).assertEqual('tablet');
      expect(devices[3].deviceId).assertEqual('device_3');
      expect(devices[4].deviceType).assertEqual('tablet');
      expect(devices[4].deviceId).assertEqual('device_4');
      expect(devices[5].deviceType).assertEqual('tablet');
      expect(devices[5].deviceId).assertEqual('device_5');
      expect(devices[6].deviceType).assertEqual('tablet');
      expect(devices[6].deviceId).assertEqual('device_6');
      expect(devices[7].deviceType).assertEqual('tablet');
      expect(devices[7].deviceId).assertEqual('device_7');
    });

    it('device_create_manager_0', 0, async () => {
      const manager = new MockDeviceManager(1);
      expect(manager.createDeviceManager('com.example.staticCollabSample')).assertEqual(true);
      expect(manager.isCreated()).assertEqual(true);
    });

    it('device_create_manager_1', 0, async () => {
      const manager = new MockDeviceManager(1);
      expect(manager.createDeviceManager('wrong.bundle')).assertEqual(false);
      expect(manager.isCreated()).assertEqual(false);
    });

    it('device_create_manager_2', 0, async () => {
      const manager = new MockDeviceManager(1);
      expect(manager.createDeviceManager('')).assertEqual(false);
      expect(manager.isCreated()).assertEqual(false);
    });

    it('device_create_manager_3', 0, async () => {
      const manager = new MockDeviceManager(1);
      expect(manager.createDeviceManager('entry')).assertEqual(false);
      expect(manager.isCreated()).assertEqual(false);
    });

    it('device_list_copy_semantics', 0, async () => {
      const manager = new MockDeviceManager(2);
      const first = manager.getAvailableDeviceListSync();
      first.push({ deviceId: 'injected', networkId: 'injected', deviceName: 'injected', deviceType: 'phone' });
      expect(first.length).assertEqual(3);
      expect(manager.size()).assertEqual(2);
      const second = manager.getAvailableDeviceListSync();
      expect(second.length).assertEqual(2);
    });

    it('device_query_count_1', 0, async () => {
      const manager = new MockDeviceManager(3);
      manager.getAvailableDeviceListSync();
      expect(manager.getQueryCount()).assertEqual(1);
      expect(manager.size()).assertEqual(3);
    });

    it('device_query_count_2', 0, async () => {
      const manager = new MockDeviceManager(3);
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      expect(manager.getQueryCount()).assertEqual(2);
      expect(manager.size()).assertEqual(3);
    });

    it('device_query_count_3', 0, async () => {
      const manager = new MockDeviceManager(3);
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      expect(manager.getQueryCount()).assertEqual(3);
      expect(manager.size()).assertEqual(3);
    });

    it('device_query_count_4', 0, async () => {
      const manager = new MockDeviceManager(3);
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      expect(manager.getQueryCount()).assertEqual(4);
      expect(manager.size()).assertEqual(3);
    });

    it('device_query_count_5', 0, async () => {
      const manager = new MockDeviceManager(3);
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      expect(manager.getQueryCount()).assertEqual(5);
      expect(manager.size()).assertEqual(3);
    });

    it('device_query_count_6', 0, async () => {
      const manager = new MockDeviceManager(3);
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      expect(manager.getQueryCount()).assertEqual(6);
      expect(manager.size()).assertEqual(3);
    });

    it('device_query_count_7', 0, async () => {
      const manager = new MockDeviceManager(3);
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      expect(manager.getQueryCount()).assertEqual(7);
      expect(manager.size()).assertEqual(3);
    });

    it('device_query_count_8', 0, async () => {
      const manager = new MockDeviceManager(3);
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      expect(manager.getQueryCount()).assertEqual(8);
      expect(manager.size()).assertEqual(3);
    });

    it('device_query_count_9', 0, async () => {
      const manager = new MockDeviceManager(3);
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      expect(manager.getQueryCount()).assertEqual(9);
      expect(manager.size()).assertEqual(3);
    });

    it('device_query_count_10', 0, async () => {
      const manager = new MockDeviceManager(3);
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      manager.getAvailableDeviceListSync();
      expect(manager.getQueryCount()).assertEqual(10);
      expect(manager.size()).assertEqual(3);
    });

    it('device_add_then_query', 0, async () => {
      const manager = new MockDeviceManager(1);
      manager.addDevice({ deviceId: 'extra', networkId: 'network_extra', deviceName: 'Extra', deviceType: 'watch' });
      expect(manager.size()).assertEqual(2);
      const devices = manager.getAvailableDeviceListSync();
      expect(devices[1].deviceId).assertEqual('extra');
      expect(devices[1].networkId).assertEqual('network_extra');
      expect(devices[1].deviceType).assertEqual('watch');
    });

    it('device_remove_all', 0, async () => {
      const manager = new MockDeviceManager(5);
      expect(manager.size()).assertEqual(5);
      manager.removeAllDevices();
      expect(manager.size()).assertEqual(0);
      expect(manager.getFirstNetworkId()).assertEqual('');
    });

    it('session_id_generate_0', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(0);
      expect(ids.length).assertEqual(0);
      expect(gen.getNextSequence()).assertEqual(0);
    });

    it('session_id_generate_1', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(1);
      expect(ids.length).assertEqual(1);
      expect(gen.getNextSequence()).assertEqual(1);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[0]).assertEqual('session_0');
    });

    it('session_id_generate_2', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(2);
      expect(ids.length).assertEqual(2);
      expect(gen.getNextSequence()).assertEqual(2);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[1]).assertEqual('session_1');
    });

    it('session_id_generate_3', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(3);
      expect(ids.length).assertEqual(3);
      expect(gen.getNextSequence()).assertEqual(3);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[2]).assertEqual('session_2');
    });

    it('session_id_generate_4', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(4);
      expect(ids.length).assertEqual(4);
      expect(gen.getNextSequence()).assertEqual(4);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[3]).assertEqual('session_3');
    });

    it('session_id_generate_5', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(5);
      expect(ids.length).assertEqual(5);
      expect(gen.getNextSequence()).assertEqual(5);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[4]).assertEqual('session_4');
    });

    it('session_id_generate_6', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(6);
      expect(ids.length).assertEqual(6);
      expect(gen.getNextSequence()).assertEqual(6);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[5]).assertEqual('session_5');
    });

    it('session_id_generate_7', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(7);
      expect(ids.length).assertEqual(7);
      expect(gen.getNextSequence()).assertEqual(7);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[6]).assertEqual('session_6');
    });

    it('session_id_generate_8', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(8);
      expect(ids.length).assertEqual(8);
      expect(gen.getNextSequence()).assertEqual(8);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[7]).assertEqual('session_7');
    });

    it('session_id_generate_9', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(9);
      expect(ids.length).assertEqual(9);
      expect(gen.getNextSequence()).assertEqual(9);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[8]).assertEqual('session_8');
    });

    it('session_id_generate_10', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(10);
      expect(ids.length).assertEqual(10);
      expect(gen.getNextSequence()).assertEqual(10);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[9]).assertEqual('session_9');
    });

    it('session_id_generate_11', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(11);
      expect(ids.length).assertEqual(11);
      expect(gen.getNextSequence()).assertEqual(11);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[10]).assertEqual('session_10');
    });

    it('session_id_generate_12', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(12);
      expect(ids.length).assertEqual(12);
      expect(gen.getNextSequence()).assertEqual(12);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[11]).assertEqual('session_11');
    });

    it('session_id_generate_13', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(13);
      expect(ids.length).assertEqual(13);
      expect(gen.getNextSequence()).assertEqual(13);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[12]).assertEqual('session_12');
    });

    it('session_id_generate_14', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(14);
      expect(ids.length).assertEqual(14);
      expect(gen.getNextSequence()).assertEqual(14);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[13]).assertEqual('session_13');
    });

    it('session_id_generate_15', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(15);
      expect(ids.length).assertEqual(15);
      expect(gen.getNextSequence()).assertEqual(15);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[14]).assertEqual('session_14');
    });

    it('session_id_generate_16', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(16);
      expect(ids.length).assertEqual(16);
      expect(gen.getNextSequence()).assertEqual(16);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[15]).assertEqual('session_15');
    });

    it('session_id_generate_17', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(17);
      expect(ids.length).assertEqual(17);
      expect(gen.getNextSequence()).assertEqual(17);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[16]).assertEqual('session_16');
    });

    it('session_id_generate_18', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(18);
      expect(ids.length).assertEqual(18);
      expect(gen.getNextSequence()).assertEqual(18);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[17]).assertEqual('session_17');
    });

    it('session_id_generate_19', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(19);
      expect(ids.length).assertEqual(19);
      expect(gen.getNextSequence()).assertEqual(19);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[18]).assertEqual('session_18');
    });

    it('session_id_generate_20', 0, async () => {
      const gen = new SessionIdGenerator();
      const ids = gen.generateBatch(20);
      expect(ids.length).assertEqual(20);
      expect(gen.getNextSequence()).assertEqual(20);
      expect(ids[0]).assertEqual('session_0');
      expect(ids[19]).assertEqual('session_19');
    });

    it('session_id_single_0', 0, async () => {
      const gen = new SessionIdGenerator('peer0');
      const id = gen.generate();
      expect(id).assertEqual('peer0_0');
      expect(gen.getNextSequence()).assertEqual(1);
      const second = gen.generate();
      expect(second).assertEqual('peer0_1');
      expect(gen.getNextSequence()).assertEqual(2);
    });

    it('session_id_single_1', 0, async () => {
      const gen = new SessionIdGenerator('peer1');
      const id = gen.generate();
      expect(id).assertEqual('peer1_0');
      expect(gen.getNextSequence()).assertEqual(1);
      const second = gen.generate();
      expect(second).assertEqual('peer1_1');
      expect(gen.getNextSequence()).assertEqual(2);
    });

    it('session_id_single_2', 0, async () => {
      const gen = new SessionIdGenerator('peer2');
      const id = gen.generate();
      expect(id).assertEqual('peer2_0');
      expect(gen.getNextSequence()).assertEqual(1);
      const second = gen.generate();
      expect(second).assertEqual('peer2_1');
      expect(gen.getNextSequence()).assertEqual(2);
    });

    it('session_id_single_3', 0, async () => {
      const gen = new SessionIdGenerator('peer3');
      const id = gen.generate();
      expect(id).assertEqual('peer3_0');
      expect(gen.getNextSequence()).assertEqual(1);
      const second = gen.generate();
      expect(second).assertEqual('peer3_1');
      expect(gen.getNextSequence()).assertEqual(2);
    });

    it('session_id_single_4', 0, async () => {
      const gen = new SessionIdGenerator('peer4');
      const id = gen.generate();
      expect(id).assertEqual('peer4_0');
      expect(gen.getNextSequence()).assertEqual(1);
      const second = gen.generate();
      expect(second).assertEqual('peer4_1');
      expect(gen.getNextSequence()).assertEqual(2);
    });

    it('session_id_single_5', 0, async () => {
      const gen = new SessionIdGenerator('peer5');
      const id = gen.generate();
      expect(id).assertEqual('peer5_0');
      expect(gen.getNextSequence()).assertEqual(1);
      const second = gen.generate();
      expect(second).assertEqual('peer5_1');
      expect(gen.getNextSequence()).assertEqual(2);
    });

    it('session_id_single_6', 0, async () => {
      const gen = new SessionIdGenerator('peer6');
      const id = gen.generate();
      expect(id).assertEqual('peer6_0');
      expect(gen.getNextSequence()).assertEqual(1);
      const second = gen.generate();
      expect(second).assertEqual('peer6_1');
      expect(gen.getNextSequence()).assertEqual(2);
    });

    it('session_id_single_7', 0, async () => {
      const gen = new SessionIdGenerator('peer7');
      const id = gen.generate();
      expect(id).assertEqual('peer7_0');
      expect(gen.getNextSequence()).assertEqual(1);
      const second = gen.generate();
      expect(second).assertEqual('peer7_1');
      expect(gen.getNextSequence()).assertEqual(2);
    });

    it('session_id_single_8', 0, async () => {
      const gen = new SessionIdGenerator('peer8');
      const id = gen.generate();
      expect(id).assertEqual('peer8_0');
      expect(gen.getNextSequence()).assertEqual(1);
      const second = gen.generate();
      expect(second).assertEqual('peer8_1');
      expect(gen.getNextSequence()).assertEqual(2);
    });

    it('session_id_single_9', 0, async () => {
      const gen = new SessionIdGenerator('peer9');
      const id = gen.generate();
      expect(id).assertEqual('peer9_0');
      expect(gen.getNextSequence()).assertEqual(1);
      const second = gen.generate();
      expect(second).assertEqual('peer9_1');
      expect(gen.getNextSequence()).assertEqual(2);
    });

    it('session_id_single_10', 0, async () => {
      const gen = new SessionIdGenerator('peer10');
      const id = gen.generate();
      expect(id).assertEqual('peer10_0');
      expect(gen.getNextSequence()).assertEqual(1);
      const second = gen.generate();
      expect(second).assertEqual('peer10_1');
      expect(gen.getNextSequence()).assertEqual(2);
    });

    it('session_id_reset_1', 0, async () => {
      const gen = new SessionIdGenerator();
      gen.generateBatch(1);
      expect(gen.getNextSequence()).assertEqual(1);
      gen.reset();
      expect(gen.getNextSequence()).assertEqual(0);
      const ids = gen.generateBatch(1);
      expect(ids.length).assertEqual(1);
      expect(ids[0]).assertEqual('session_0');
    });

    it('session_id_reset_3', 0, async () => {
      const gen = new SessionIdGenerator();
      gen.generateBatch(3);
      expect(gen.getNextSequence()).assertEqual(3);
      gen.reset();
      expect(gen.getNextSequence()).assertEqual(0);
      const ids = gen.generateBatch(3);
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual('session_0');
    });

    it('session_id_reset_5', 0, async () => {
      const gen = new SessionIdGenerator();
      gen.generateBatch(5);
      expect(gen.getNextSequence()).assertEqual(5);
      gen.reset();
      expect(gen.getNextSequence()).assertEqual(0);
      const ids = gen.generateBatch(5);
      expect(ids.length).assertEqual(5);
      expect(ids[0]).assertEqual('session_0');
    });

    it('session_id_reset_8', 0, async () => {
      const gen = new SessionIdGenerator();
      gen.generateBatch(8);
      expect(gen.getNextSequence()).assertEqual(8);
      gen.reset();
      expect(gen.getNextSequence()).assertEqual(0);
      const ids = gen.generateBatch(8);
      expect(ids.length).assertEqual(8);
      expect(ids[0]).assertEqual('session_0');
    });

    it('network_ids_0', 0, async () => {
      const ids = mockNetworkIds(0);
      expect(ids.length).assertEqual(0);
    });

    it('network_ids_1', 0, async () => {
      const ids = mockNetworkIds(1);
      expect(ids.length).assertEqual(1);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[0]).assertEqual('network_0');
    });

    it('network_ids_2', 0, async () => {
      const ids = mockNetworkIds(2);
      expect(ids.length).assertEqual(2);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[1]).assertEqual('network_1');
    });

    it('network_ids_3', 0, async () => {
      const ids = mockNetworkIds(3);
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[2]).assertEqual('network_2');
    });

    it('network_ids_4', 0, async () => {
      const ids = mockNetworkIds(4);
      expect(ids.length).assertEqual(4);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[3]).assertEqual('network_3');
    });

    it('network_ids_5', 0, async () => {
      const ids = mockNetworkIds(5);
      expect(ids.length).assertEqual(5);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[4]).assertEqual('network_4');
    });

    it('network_ids_6', 0, async () => {
      const ids = mockNetworkIds(6);
      expect(ids.length).assertEqual(6);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[5]).assertEqual('network_5');
    });

    it('network_ids_7', 0, async () => {
      const ids = mockNetworkIds(7);
      expect(ids.length).assertEqual(7);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[6]).assertEqual('network_6');
    });

    it('network_ids_8', 0, async () => {
      const ids = mockNetworkIds(8);
      expect(ids.length).assertEqual(8);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[7]).assertEqual('network_7');
    });

    it('network_ids_9', 0, async () => {
      const ids = mockNetworkIds(9);
      expect(ids.length).assertEqual(9);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[8]).assertEqual('network_8');
    });

    it('network_ids_10', 0, async () => {
      const ids = mockNetworkIds(10);
      expect(ids.length).assertEqual(10);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[9]).assertEqual('network_9');
    });

    it('network_ids_11', 0, async () => {
      const ids = mockNetworkIds(11);
      expect(ids.length).assertEqual(11);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[10]).assertEqual('network_10');
    });

    it('network_ids_12', 0, async () => {
      const ids = mockNetworkIds(12);
      expect(ids.length).assertEqual(12);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[11]).assertEqual('network_11');
    });

    it('network_ids_13', 0, async () => {
      const ids = mockNetworkIds(13);
      expect(ids.length).assertEqual(13);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[12]).assertEqual('network_12');
    });

    it('network_ids_14', 0, async () => {
      const ids = mockNetworkIds(14);
      expect(ids.length).assertEqual(14);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[13]).assertEqual('network_13');
    });

    it('network_ids_15', 0, async () => {
      const ids = mockNetworkIds(15);
      expect(ids.length).assertEqual(15);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[14]).assertEqual('network_14');
    });

    it('network_ids_16', 0, async () => {
      const ids = mockNetworkIds(16);
      expect(ids.length).assertEqual(16);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[15]).assertEqual('network_15');
    });

    it('network_ids_17', 0, async () => {
      const ids = mockNetworkIds(17);
      expect(ids.length).assertEqual(17);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[16]).assertEqual('network_16');
    });

    it('network_ids_18', 0, async () => {
      const ids = mockNetworkIds(18);
      expect(ids.length).assertEqual(18);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[17]).assertEqual('network_17');
    });

    it('network_ids_19', 0, async () => {
      const ids = mockNetworkIds(19);
      expect(ids.length).assertEqual(19);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[18]).assertEqual('network_18');
    });

    it('network_ids_20', 0, async () => {
      const ids = mockNetworkIds(20);
      expect(ids.length).assertEqual(20);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[19]).assertEqual('network_19');
    });

    it('network_ids_21', 0, async () => {
      const ids = mockNetworkIds(21);
      expect(ids.length).assertEqual(21);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[20]).assertEqual('network_20');
    });

    it('network_ids_22', 0, async () => {
      const ids = mockNetworkIds(22);
      expect(ids.length).assertEqual(22);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[21]).assertEqual('network_21');
    });

    it('network_ids_23', 0, async () => {
      const ids = mockNetworkIds(23);
      expect(ids.length).assertEqual(23);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[22]).assertEqual('network_22');
    });

    it('network_ids_24', 0, async () => {
      const ids = mockNetworkIds(24);
      expect(ids.length).assertEqual(24);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[23]).assertEqual('network_23');
    });

    it('network_ids_25', 0, async () => {
      const ids = mockNetworkIds(25);
      expect(ids.length).assertEqual(25);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[24]).assertEqual('network_24');
    });

    it('network_ids_26', 0, async () => {
      const ids = mockNetworkIds(26);
      expect(ids.length).assertEqual(26);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[25]).assertEqual('network_25');
    });

    it('network_ids_27', 0, async () => {
      const ids = mockNetworkIds(27);
      expect(ids.length).assertEqual(27);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[26]).assertEqual('network_26');
    });

    it('network_ids_28', 0, async () => {
      const ids = mockNetworkIds(28);
      expect(ids.length).assertEqual(28);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[27]).assertEqual('network_27');
    });

    it('network_ids_29', 0, async () => {
      const ids = mockNetworkIds(29);
      expect(ids.length).assertEqual(29);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[28]).assertEqual('network_28');
    });

    it('network_ids_30', 0, async () => {
      const ids = mockNetworkIds(30);
      expect(ids.length).assertEqual(30);
      expect(ids[0]).assertEqual('network_0');
      expect(ids[29]).assertEqual('network_29');
    });

    it('payload_length_0', 0, async () => {
      const text = mockPayload(0);
      expect(text.length).assertEqual(0);
      expect(text.indexOf('collab') === 0 || text.length === 0).assertTrue();
    });

    it('payload_length_6', 0, async () => {
      const text = mockPayload(6);
      expect(text.length).assertEqual(6);
      expect(text.indexOf('collab') === 0 || text.length === 0).assertTrue();
    });

    it('payload_length_7', 0, async () => {
      const text = mockPayload(7);
      expect(text.length).assertEqual(7);
      expect(text.indexOf('collab') === 0 || text.length === 0).assertTrue();
    });

    it('payload_length_12', 0, async () => {
      const text = mockPayload(12);
      expect(text.length).assertEqual(12);
      expect(text.indexOf('collab') === 0 || text.length === 0).assertTrue();
    });

    it('payload_length_18', 0, async () => {
      const text = mockPayload(18);
      expect(text.length).assertEqual(18);
      expect(text.indexOf('collab') === 0 || text.length === 0).assertTrue();
    });

    it('payload_length_24', 0, async () => {
      const text = mockPayload(24);
      expect(text.length).assertEqual(24);
      expect(text.indexOf('collab') === 0 || text.length === 0).assertTrue();
    });

    it('payload_length_30', 0, async () => {
      const text = mockPayload(30);
      expect(text.length).assertEqual(30);
      expect(text.indexOf('collab') === 0 || text.length === 0).assertTrue();
    });

    it('payload_length_36', 0, async () => {
      const text = mockPayload(36);
      expect(text.length).assertEqual(36);
      expect(text.indexOf('collab') === 0 || text.length === 0).assertTrue();
    });

    it('payload_length_42', 0, async () => {
      const text = mockPayload(42);
      expect(text.length).assertEqual(42);
      expect(text.indexOf('collab') === 0 || text.length === 0).assertTrue();
    });

  });
}

