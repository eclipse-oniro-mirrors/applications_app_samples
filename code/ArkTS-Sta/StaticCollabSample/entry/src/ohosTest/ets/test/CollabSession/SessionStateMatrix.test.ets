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


export default function sessionStateMatrixTest(): void {
  describe('SessionStateMatrix_Test', () => {
    it('session_created_connect', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.getState()).assertEqual(SessionState.CREATED);
      const result = session.connect();
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.isConnected()).assertEqual(true);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_created_destroy', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.getState()).assertEqual(SessionState.CREATED);
      const result = session.destroy();
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(true);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_created_accept_valid', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.getState()).assertEqual(SessionState.CREATED);
      const result = session.acceptConnect('tok');
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.isConnected()).assertEqual(true);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_created_accept_empty', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.getState()).assertEqual(SessionState.CREATED);
      const result = session.acceptConnect('');
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getLastError().indexOf('empty token') >= 0).assertTrue();
    });

    it('session_created_receive_message', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.getState()).assertEqual(SessionState.CREATED);
      session.receiveMessage('incoming');
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_created_receive_data', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.getState()).assertEqual(SessionState.CREATED);
      session.receiveData(encodeUtf8('incoming'));
      expect(session.getDataCount()).assertEqual(1);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_connected_disconnect', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      const result = session.disconnect();
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_connected_destroy', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      const result = session.destroy();
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(true);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_connected_send_message_valid', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      const result = session.sendMessage('hi');
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.isConnected()).assertEqual(true);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_connected_send_message_empty', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      const result = session.sendMessage('');
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.isConnected()).assertEqual(true);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getLastError().indexOf('empty message') >= 0).assertTrue();
    });

    it('session_connected_send_data_valid', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      const result = session.sendData(encodeUtf8('x'));
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.isConnected()).assertEqual(true);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_connected_send_data_empty', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      const result = session.sendData(new ArrayBuffer(0));
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.isConnected()).assertEqual(true);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getLastError().indexOf('empty data') >= 0).assertTrue();
    });

    it('session_connected_accept_valid', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      const result = session.acceptConnect('tok');
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.isConnected()).assertEqual(true);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_connected_accept_empty', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      const result = session.acceptConnect('');
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.isConnected()).assertEqual(true);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getLastError().indexOf('empty token') >= 0).assertTrue();
    });

    it('session_connected_receive_message', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      session.receiveMessage('incoming');
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.isConnected()).assertEqual(true);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_connected_receive_data', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      session.receiveData(encodeUtf8('incoming'));
      expect(session.getDataCount()).assertEqual(1);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.isConnected()).assertEqual(true);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_disconnected_connect', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.disconnect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      const result = session.connect();
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.isConnected()).assertEqual(true);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_disconnected_destroy', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.disconnect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      const result = session.destroy();
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(true);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_disconnected_accept_valid', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.disconnect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      const result = session.acceptConnect('tok');
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.isConnected()).assertEqual(true);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_disconnected_accept_empty', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.disconnect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      const result = session.acceptConnect('');
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getLastError().indexOf('empty token') >= 0).assertTrue();
    });

    it('session_disconnected_receive_message', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.disconnect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      session.receiveMessage('incoming');
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_disconnected_receive_data', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.disconnect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      session.receiveData(encodeUtf8('incoming'));
      expect(session.getDataCount()).assertEqual(1);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_destroyed_destroy', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.destroy()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      const result = session.destroy();
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(true);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getLastError().indexOf('destroy twice') >= 0).assertTrue();
    });

    it('session_destroyed_accept_valid', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.destroy()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      const result = session.acceptConnect('tok');
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(true);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getLastError().indexOf('accept after destroy') >= 0).assertTrue();
    });

    it('session_destroyed_accept_empty', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.destroy()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      const result = session.acceptConnect('');
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(true);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getLastError().indexOf('accept after destroy') >= 0).assertTrue();
    });

    it('session_destroyed_receive_message', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.destroy()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      session.receiveMessage('incoming');
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(true);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_destroyed_receive_data', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.destroy()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      session.receiveData(encodeUtf8('incoming'));
      expect(session.getDataCount()).assertEqual(1);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(true);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_failed_destroy', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, new PeerInfoModel(''), buildConnectOptions(true));
      expect(session.connect()).assertFalse();
      expect(session.getState()).assertEqual(SessionState.FAILED);
      const result = session.destroy();
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(true);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(1);
    });

    it('session_failed_accept_valid', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, new PeerInfoModel(''), buildConnectOptions(true));
      expect(session.connect()).assertFalse();
      expect(session.getState()).assertEqual(SessionState.FAILED);
      const result = session.acceptConnect('tok');
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.isConnected()).assertEqual(true);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(1);
    });

    it('session_failed_accept_empty', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, new PeerInfoModel(''), buildConnectOptions(true));
      expect(session.connect()).assertFalse();
      expect(session.getState()).assertEqual(SessionState.FAILED);
      const result = session.acceptConnect('');
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.FAILED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getLastError().indexOf('empty token') >= 0).assertTrue();
    });

    it('session_failed_receive_message', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, new PeerInfoModel(''), buildConnectOptions(true));
      expect(session.connect()).assertFalse();
      expect(session.getState()).assertEqual(SessionState.FAILED);
      session.receiveMessage('incoming');
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getState()).assertEqual(SessionState.FAILED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.getErrorCount()).assertEqual(1);
    });

    it('session_failed_receive_data', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, new PeerInfoModel(''), buildConnectOptions(true));
      expect(session.connect()).assertFalse();
      expect(session.getState()).assertEqual(SessionState.FAILED);
      session.receiveData(encodeUtf8('incoming'));
      expect(session.getDataCount()).assertEqual(1);
      expect(session.getState()).assertEqual(SessionState.FAILED);
      expect(session.isConnected()).assertEqual(false);
      expect(session.isDestroyed()).assertEqual(false);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
      expect(session.getErrorCount()).assertEqual(1);
    });

    it('session_created_accept_after_destroy', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.getState()).assertEqual(SessionState.CREATED);
      const result = session.acceptConnect('tok');
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_connected_accept_after_destroy', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.connect()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      const result = session.acceptConnect('tok');
      expect(result).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_destroyed_accept_after_destroy', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.destroy()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      const result = session.acceptConnect('tok');
      expect(result).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getLastError().indexOf('accept after destroy') >= 0).assertTrue();
    });

    it('session_receive_does_not_require_connected', 0, async () => {
      const session = new MockCollabSession(7, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.receiveMessage('m1');
      session.receiveMessage('m2');
      session.receiveData(encodeUtf8('d1'));
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getMessageCount()).assertEqual(2);
      expect(session.getDataCount()).assertEqual(1);
      expect(session.getErrorCount()).assertEqual(0);
    });

    it('session_received_text_roundtrip', 0, async () => {
      const session = new MockCollabSession(8, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.receiveData(encodeUtf8('alpha'));
      session.receiveData(encodeUtf8('beta'));
      expect(session.receivedText(0)).assertEqual('alpha');
      expect(session.receivedText(1)).assertEqual('beta');
      expect(session.receivedText(2)).assertEqual('');
      expect(session.receivedText(-1)).assertEqual('');
    });

    it('session_snapshot_contract', 0, async () => {
      const session = new MockCollabSession(9, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.connect();
      session.sendMessage('m');
      session.sendData(encodeUtf8('d'));
      const snap = session.snapshot();
      expect(snap.sessionId).assertEqual(9);
      expect(snap.sessionName).assertEqual(COLLAB_SESSION_NAME);
      expect(snap.state).assertEqual(SessionState.CONNECTED);
      expect(snap.messageCount).assertEqual(1);
      expect(snap.dataCount).assertEqual(1);
      expect(snap.accepted).assertEqual(false);
      expect(snap.errorCount).assertEqual(0);
      expect(snap.peerInfo.deviceId).assertEqual('dev');
      expect(snap.options.needSendData).assertEqual(true);
    });

    it('session_destroy_clears_payload', 0, async () => {
      const session = new MockCollabSession(10, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      session.connect();
      session.sendMessage('m1');
      session.sendData(encodeUtf8('d1'));
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(1);
      expect(session.destroy()).assertTrue();
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
      expect(session.destroy()).assertFalse();
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getLastError()).assertEqual('destroy twice');
    });

    it('session_accept_sets_connected_and_accepted', 0, async () => {
      const session = new MockCollabSession(11, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(session.isAccepted()).assertFalse();
      expect(session.acceptConnect('token')).assertTrue();
      expect(session.isAccepted()).assertTrue();
      expect(session.isConnected()).assertTrue();
      const snap = session.snapshot();
      expect(snap.accepted).assertEqual(true);
      expect(snap.state).assertEqual(SessionState.CONNECTED);
    });

    it('session_seq2_000', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_001', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_002', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_003', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_004', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq2_005', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_006', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_007', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_008', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_009', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_010', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_011', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_012', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_013', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_014', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_015', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_016', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_017', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_018', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_019', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_020', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_021', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_022', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_023', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_024', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_025', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_026', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_027', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_028', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_029', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_030', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.acceptConnect('tok');
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_031', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.acceptConnect('tok');
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_032', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.acceptConnect('tok');
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_033', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.acceptConnect('tok');
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq2_034', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.acceptConnect('tok');
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq2_035', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.acceptConnect('tok');
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_000', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_001', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_002', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_003', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_004', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq3_005', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_006', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.connect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_007', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_008', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_009', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_010', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_011', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_012', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_013', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_014', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.destroy();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_015', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_016', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_017', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_018', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_019', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.disconnect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_020', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_021', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(2);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_022', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq3_023', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_024', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq3_025', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.disconnect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq3_026', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_027', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq3_028', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(2);
    });

    it('session_seq3_029', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq3_030', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_031', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.disconnect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_032', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_033', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_034', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq3_035', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.connect();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(0);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_036', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_037', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_038', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_039', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_040', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq3_041', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_042', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.connect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_043', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_044', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_045', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_046', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_047', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_048', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_049', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_050', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_051', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_052', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_053', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_054', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.connect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_055', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_056', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_057', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_058', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_059', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_060', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.connect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_061', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_062', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_063', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_064', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_065', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_066', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_067', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_068', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_069', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_070', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq3_071', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.disconnect();
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_072', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_073', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_074', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_075', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_076', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_077', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.connect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_078', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_079', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_080', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_081', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_082', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_083', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_084', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_085', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_086', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_087', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_088', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_089', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.destroy();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_090', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_091', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_092', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_093', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_094', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_095', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_096', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_097', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_098', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_099', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_100', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_101', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_102', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_103', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_104', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_105', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_106', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_107', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.destroy();
      expect(r0).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(0);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_108', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_109', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_110', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_111', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_112', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq3_113', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_114', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.connect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_115', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_116', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_117', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_118', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_119', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_120', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_121', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_122', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_123', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_124', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_125', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.destroy();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_126', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.connect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_127', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_128', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_129', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_130', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_131', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendMessage('hi');
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_132', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.connect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_133', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_134', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_135', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_136', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_137', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.sendData(encodeUtf8('x'));
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_138', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_139', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_140', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_141', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_142', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq3_143', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendMessage('hi');
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.acceptConnect('tok');
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_144', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.connect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_145', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.disconnect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DISCONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_146', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_147', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(1);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_148', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.sendData(encodeUtf8('x'));
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(1);
    });

    it('session_seq3_149', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.connect();
      expect(r1).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      const r2 = session.acceptConnect('tok');
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(1);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_150', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.connect();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_151', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.disconnect();
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_152', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.destroy();
      expect(r2).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.DESTROYED);
      expect(session.getErrorCount()).assertEqual(2);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });

    it('session_seq3_153', 0, async () => {
      const session = new MockCollabSession(1, COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      const r0 = session.sendData(encodeUtf8('x'));
      expect(r0).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(1);
      const r1 = session.disconnect();
      expect(r1).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(2);
      const r2 = session.sendMessage('hi');
      expect(r2).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getErrorCount()).assertEqual(3);
      expect(session.getMessageCount()).assertEqual(0);
      expect(session.getDataCount()).assertEqual(0);
    });
