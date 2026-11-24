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
  CollabEventRecord,
  LogRecord,
  CollabMetrics,
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
  TEXT_ENCODING,
  TAG
} from '../Shared/CollabTestDriver';


export default function securityMatrixTest(): void {
  describe('SecurityMatrix_Test', () => {
    it('security_access_created_sendmessage', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const result = session.sendMessage('hi');
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
    });

    it('security_access_created_senddata', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const result = session.sendData(encodeUtf8('x'));
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
    });

    it('security_access_created_acceptconnect', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const result = session.acceptConnect('tok');
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('security_access_connected_sendmessage', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.connect();
      const result = session.sendMessage('hi');
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('security_access_connected_senddata', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.connect();
      const result = session.sendData(encodeUtf8('x'));
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('security_access_connected_acceptconnect', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.connect();
      const result = session.acceptConnect('tok');
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('security_access_disconnected_sendmessage', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.connect();
      session.disconnect();
      const result = session.sendMessage('hi');
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
    });

    it('security_access_disconnected_senddata', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.connect();
      session.disconnect();
      const result = session.sendData(encodeUtf8('x'));
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
    });

    it('security_access_disconnected_acceptconnect', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.connect();
      session.disconnect();
      const result = session.acceptConnect('tok');
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('security_access_destroyed_sendmessage', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.destroy();
      const result = session.sendMessage('hi');
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
    });

    it('security_access_destroyed_senddata', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.destroy();
      const result = session.sendData(encodeUtf8('x'));
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
    });

    it('security_access_destroyed_acceptconnect', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.destroy();
      const result = session.acceptConnect('tok');
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
    });

    it('security_access_failed_sendmessage', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, new PeerInfoModel(''), buildConnectOptions(true));
      session.connect();
      const result = session.sendMessage('hi');
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.FAILED);
    });

    it('security_access_failed_senddata', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, new PeerInfoModel(''), buildConnectOptions(true));
      session.connect();
      const result = session.sendData(encodeUtf8('x'));
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.FAILED);
    });

    it('security_access_failed_acceptconnect', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, new PeerInfoModel(''), buildConnectOptions(true));
      session.connect();
      const result = session.acceptConnect('tok');
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('security_empty_token_rejected', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.acceptConnect('')).assertFalse();
      expect(session.isAccepted()).assertFalse();
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getLastError()).assertEqual('empty token');
    });

    it('security_accept_after_destroy_rejected', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.destroy();
      expect(session.acceptConnect('tok')).assertFalse();
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getLastError()).assertEqual('accept after destroy');
    });

    it('security_token_validation_0', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(isValidCollabToken('')).assertEqual(false);
      expect(session.acceptConnect('')).assertEqual(false);
    });

    it('security_token_validation_1', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(isValidCollabToken(' ')).assertEqual(true);
      expect(session.acceptConnect(' ')).assertEqual(true);
    });

    it('security_token_validation_2', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(isValidCollabToken('t')).assertEqual(true);
      expect(session.acceptConnect('t')).assertEqual(true);
    });

    it('security_token_validation_3', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(isValidCollabToken('token')).assertEqual(true);
      expect(session.acceptConnect('token')).assertEqual(true);
    });

    it('security_token_validation_4', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(isValidCollabToken('ohos.dms.collabToken')).assertEqual(true);
      expect(session.acceptConnect('ohos.dms.collabToken')).assertEqual(true);
    });

    it('security_session_id_validation_0', 0, async () => {
      expect(isValidSessionId(-100)).assertEqual(false);
    });

    it('security_session_id_validation_1', 0, async () => {
      expect(isValidSessionId(-1)).assertEqual(false);
    });

    it('security_session_id_validation_2', 0, async () => {
      expect(isValidSessionId(0)).assertEqual(true);
    });

    it('security_session_id_validation_3', 0, async () => {
      expect(isValidSessionId(1)).assertEqual(true);
    });

    it('security_session_id_validation_4', 0, async () => {
      expect(isValidSessionId(999)).assertEqual(true);
    });

    it('security_permission_grants_0', 0, async () => {
      const items = buildPermissionItems(0);
      expect(items.length).assertEqual(5);
      expect(items[0].granted).assertEqual(false);
      expect(items[1].granted).assertEqual(false);
      expect(items[2].granted).assertEqual(false);
      expect(items[3].granted).assertEqual(false);
      expect(items[4].granted).assertEqual(false);
    });

    it('security_permission_grants_1', 0, async () => {
      const items = buildPermissionItems(1);
      expect(items.length).assertEqual(5);
      expect(items[0].granted).assertEqual(true);
      expect(items[1].granted).assertEqual(false);
      expect(items[2].granted).assertEqual(false);
      expect(items[3].granted).assertEqual(false);
      expect(items[4].granted).assertEqual(false);
    });

    it('security_permission_grants_2', 0, async () => {
      const items = buildPermissionItems(2);
      expect(items.length).assertEqual(5);
      expect(items[0].granted).assertEqual(true);
      expect(items[1].granted).assertEqual(true);
      expect(items[2].granted).assertEqual(false);
      expect(items[3].granted).assertEqual(false);
      expect(items[4].granted).assertEqual(false);
    });

    it('security_permission_grants_3', 0, async () => {
      const items = buildPermissionItems(3);
      expect(items.length).assertEqual(5);
      expect(items[0].granted).assertEqual(true);
      expect(items[1].granted).assertEqual(true);
      expect(items[2].granted).assertEqual(true);
      expect(items[3].granted).assertEqual(false);
      expect(items[4].granted).assertEqual(false);
    });

    it('security_permission_grants_4', 0, async () => {
      const items = buildPermissionItems(4);
      expect(items.length).assertEqual(5);
      expect(items[0].granted).assertEqual(true);
      expect(items[1].granted).assertEqual(true);
      expect(items[2].granted).assertEqual(true);
      expect(items[3].granted).assertEqual(true);
      expect(items[4].granted).assertEqual(false);
    });

    it('security_permission_grants_5', 0, async () => {
      const items = buildPermissionItems(5);
      expect(items.length).assertEqual(5);
      expect(items[0].granted).assertEqual(true);
      expect(items[1].granted).assertEqual(true);
      expect(items[2].granted).assertEqual(true);
      expect(items[3].granted).assertEqual(true);
      expect(items[4].granted).assertEqual(true);
    });

    it('security_no_message_before_connect_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_1'), buildConnectOptions(true));
      expect(bridge.sendMessage(sid, 'msg_1')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_1'))).assertFalse();
      expect(bridge.getEventCount(CollabEventType.SEND_MESSAGE)).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.SEND_DATA)).assertEqual(0);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_message_before_connect_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_2'), buildConnectOptions(true));
      expect(bridge.sendMessage(sid, 'msg_2')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_2'))).assertFalse();
      expect(bridge.getEventCount(CollabEventType.SEND_MESSAGE)).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.SEND_DATA)).assertEqual(0);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_message_before_connect_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_3'), buildConnectOptions(true));
      expect(bridge.sendMessage(sid, 'msg_3')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_3'))).assertFalse();
      expect(bridge.getEventCount(CollabEventType.SEND_MESSAGE)).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.SEND_DATA)).assertEqual(0);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_message_before_connect_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_4'), buildConnectOptions(true));
      expect(bridge.sendMessage(sid, 'msg_4')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_4'))).assertFalse();
      expect(bridge.getEventCount(CollabEventType.SEND_MESSAGE)).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.SEND_DATA)).assertEqual(0);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_message_before_connect_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_5'), buildConnectOptions(true));
      expect(bridge.sendMessage(sid, 'msg_5')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_5'))).assertFalse();
      expect(bridge.getEventCount(CollabEventType.SEND_MESSAGE)).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.SEND_DATA)).assertEqual(0);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_message_before_connect_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_6'), buildConnectOptions(true));
      expect(bridge.sendMessage(sid, 'msg_6')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_6'))).assertFalse();
      expect(bridge.getEventCount(CollabEventType.SEND_MESSAGE)).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.SEND_DATA)).assertEqual(0);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_message_before_connect_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_7'), buildConnectOptions(true));
      expect(bridge.sendMessage(sid, 'msg_7')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_7'))).assertFalse();
      expect(bridge.getEventCount(CollabEventType.SEND_MESSAGE)).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.SEND_DATA)).assertEqual(0);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_message_before_connect_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_8'), buildConnectOptions(true));
      expect(bridge.sendMessage(sid, 'msg_8')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_8'))).assertFalse();
      expect(bridge.getEventCount(CollabEventType.SEND_MESSAGE)).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.SEND_DATA)).assertEqual(0);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_message_before_connect_9', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_9'), buildConnectOptions(true));
      expect(bridge.sendMessage(sid, 'msg_9')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_9'))).assertFalse();
      expect(bridge.getEventCount(CollabEventType.SEND_MESSAGE)).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.SEND_DATA)).assertEqual(0);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_message_before_connect_10', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_10'), buildConnectOptions(true));
      expect(bridge.sendMessage(sid, 'msg_10')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_10'))).assertFalse();
      expect(bridge.getEventCount(CollabEventType.SEND_MESSAGE)).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.SEND_DATA)).assertEqual(0);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_send_after_destroy_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_1'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.destroyAbilityConnectionSession(sid);
      expect(bridge.sendMessage(sid, 'msg_1')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_1'))).assertFalse();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isDestroyed()).assertTrue();
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_send_after_destroy_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_2'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.destroyAbilityConnectionSession(sid);
      expect(bridge.sendMessage(sid, 'msg_2')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_2'))).assertFalse();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isDestroyed()).assertTrue();
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_send_after_destroy_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_3'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.destroyAbilityConnectionSession(sid);
      expect(bridge.sendMessage(sid, 'msg_3')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_3'))).assertFalse();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isDestroyed()).assertTrue();
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_send_after_destroy_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_4'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.destroyAbilityConnectionSession(sid);
      expect(bridge.sendMessage(sid, 'msg_4')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_4'))).assertFalse();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isDestroyed()).assertTrue();
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_send_after_destroy_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_5'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.destroyAbilityConnectionSession(sid);
      expect(bridge.sendMessage(sid, 'msg_5')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_5'))).assertFalse();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isDestroyed()).assertTrue();
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_send_after_destroy_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_6'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.destroyAbilityConnectionSession(sid);
      expect(bridge.sendMessage(sid, 'msg_6')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_6'))).assertFalse();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isDestroyed()).assertTrue();
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_send_after_destroy_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_7'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.destroyAbilityConnectionSession(sid);
      expect(bridge.sendMessage(sid, 'msg_7')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_7'))).assertFalse();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isDestroyed()).assertTrue();
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_send_after_destroy_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_8'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.destroyAbilityConnectionSession(sid);
      expect(bridge.sendMessage(sid, 'msg_8')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_8'))).assertFalse();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isDestroyed()).assertTrue();
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_send_after_destroy_9', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_9'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.destroyAbilityConnectionSession(sid);
      expect(bridge.sendMessage(sid, 'msg_9')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_9'))).assertFalse();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isDestroyed()).assertTrue();
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_no_send_after_destroy_10', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_10'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.destroyAbilityConnectionSession(sid);
      expect(bridge.sendMessage(sid, 'msg_10')).assertFalse();
      expect(bridge.sendData(sid, encodeUtf8('data_10'))).assertFalse();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isDestroyed()).assertTrue();
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('security_fail_injection_isolated_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_1'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.failSendMessage = true;
      expect(bridge.sendMessage(sid, 'blocked_1')).assertFalse();
      bridge.failSendMessage = false;
      expect(bridge.sendMessage(sid, 'allowed_1')).assertTrue();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getMessages()[0]).assertEqual('allowed_1');
    });

    it('security_fail_injection_isolated_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_2'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.failSendMessage = true;
      expect(bridge.sendMessage(sid, 'blocked_2')).assertFalse();
      bridge.failSendMessage = false;
      expect(bridge.sendMessage(sid, 'allowed_2')).assertTrue();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getMessages()[0]).assertEqual('allowed_2');
    });

    it('security_fail_injection_isolated_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_3'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.failSendMessage = true;
      expect(bridge.sendMessage(sid, 'blocked_3')).assertFalse();
      bridge.failSendMessage = false;
      expect(bridge.sendMessage(sid, 'allowed_3')).assertTrue();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getMessages()[0]).assertEqual('allowed_3');
    });

    it('security_fail_injection_isolated_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_4'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.failSendMessage = true;
      expect(bridge.sendMessage(sid, 'blocked_4')).assertFalse();
      bridge.failSendMessage = false;
      expect(bridge.sendMessage(sid, 'allowed_4')).assertTrue();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getMessages()[0]).assertEqual('allowed_4');
    });

    it('security_fail_injection_isolated_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_5'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.failSendMessage = true;
      expect(bridge.sendMessage(sid, 'blocked_5')).assertFalse();
      bridge.failSendMessage = false;
      expect(bridge.sendMessage(sid, 'allowed_5')).assertTrue();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getMessages()[0]).assertEqual('allowed_5');
    });

    it('security_fail_injection_isolated_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_6'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.failSendMessage = true;
      expect(bridge.sendMessage(sid, 'blocked_6')).assertFalse();
      bridge.failSendMessage = false;
      expect(bridge.sendMessage(sid, 'allowed_6')).assertTrue();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getMessages()[0]).assertEqual('allowed_6');
    });

    it('security_fail_injection_isolated_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_7'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.failSendMessage = true;
      expect(bridge.sendMessage(sid, 'blocked_7')).assertFalse();
      bridge.failSendMessage = false;
      expect(bridge.sendMessage(sid, 'allowed_7')).assertTrue();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getMessages()[0]).assertEqual('allowed_7');
    });

    it('security_fail_injection_isolated_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_8'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.failSendMessage = true;
      expect(bridge.sendMessage(sid, 'blocked_8')).assertFalse();
      bridge.failSendMessage = false;
      expect(bridge.sendMessage(sid, 'allowed_8')).assertTrue();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getMessages()[0]).assertEqual('allowed_8');
    });

    it('security_fail_injection_isolated_9', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_9'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.failSendMessage = true;
      expect(bridge.sendMessage(sid, 'blocked_9')).assertFalse();
      bridge.failSendMessage = false;
      expect(bridge.sendMessage(sid, 'allowed_9')).assertTrue();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getMessages()[0]).assertEqual('allowed_9');
    });

    it('security_fail_injection_isolated_10', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev_10'), buildConnectOptions(true));
      bridge.connect(sid);
      bridge.failSendMessage = true;
      expect(bridge.sendMessage(sid, 'blocked_10')).assertFalse();
      bridge.failSendMessage = false;
      expect(bridge.sendMessage(sid, 'allowed_10')).assertTrue();
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getMessages()[0]).assertEqual('allowed_10');
    });

    it('security_storage_type_isolation', 0, async () => {
      const storage = new AppStorageModel();
      storage.setOrCreate(STORAGE_KEY_SESSION_ID, 'not-a-number');
      expect(storage.getSessionId()).assertEqual(INVALID_SESSION_ID);
      storage.setOrCreate(STORAGE_KEY_IS_CONNECTED, 'true');
      expect(storage.isConnected()).assertEqual(false);
      storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 42);
      expect(storage.getReceiveMessage()).assertEqual('');
    });

    it('security_logger_does_not_leak_token', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('connection attempt');
      logger.warn('validation skipped');
      expect(logger.contains('ohos.dms.collabToken')).assertFalse();
      expect(logger.contains('secret')).assertFalse();
      expect(logger.size()).assertEqual(2);
    });

  });
}

