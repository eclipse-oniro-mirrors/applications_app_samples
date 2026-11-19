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
