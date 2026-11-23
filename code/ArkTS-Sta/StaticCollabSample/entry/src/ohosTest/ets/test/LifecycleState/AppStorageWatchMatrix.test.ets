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


export default function appStorageWatchMatrixTest(): void {
  describe('AppStorageWatchMatrix_Test', () => {
    it('storage_initial_contract', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.getSessionId()).assertEqual(INVALID_SESSION_ID);
      expect(storage.isConnected()).assertEqual(false);
      expect(storage.getReceiveMessage()).assertEqual('');
      expect(storage.getReceiveWatchMessage()).assertEqual('');
      expect(storage.has(STORAGE_KEY_SESSION_ID)).assertTrue();
      expect(storage.has(STORAGE_KEY_IS_CONNECTED)).assertTrue();
      expect(storage.has(STORAGE_KEY_RECEIVE_MESSAGE)).assertTrue();
      expect(storage.has(STORAGE_KEY_RECEIVE_WATCH_MESSAGE)).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(0);
      expect(storage.getLastWatchedKey()).assertEqual('');
    });

    it('storage_session_id_set_0', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, -1)).assertEqual(false);
      expect(storage.getSessionId()).assertEqual(-1);
      expect(storage.get(STORAGE_KEY_SESSION_ID) === undefined).assertFalse();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, -1)).assertFalse();
      expect(storage.getSessionId()).assertEqual(-1);
    });

    it('storage_session_id_set_1', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 0)).assertEqual(true);
      expect(storage.getSessionId()).assertEqual(0);
      expect(storage.get(STORAGE_KEY_SESSION_ID) === undefined).assertFalse();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 0)).assertFalse();
      expect(storage.getSessionId()).assertEqual(0);
    });

    it('storage_session_id_set_2', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 1)).assertEqual(true);
      expect(storage.getSessionId()).assertEqual(1);
      expect(storage.get(STORAGE_KEY_SESSION_ID) === undefined).assertFalse();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 1)).assertFalse();
      expect(storage.getSessionId()).assertEqual(1);
    });

    it('storage_session_id_set_3', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 7)).assertEqual(true);
      expect(storage.getSessionId()).assertEqual(7);
      expect(storage.get(STORAGE_KEY_SESSION_ID) === undefined).assertFalse();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 7)).assertFalse();
      expect(storage.getSessionId()).assertEqual(7);
    });

    it('storage_session_id_set_4', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 42)).assertEqual(true);
      expect(storage.getSessionId()).assertEqual(42);
      expect(storage.get(STORAGE_KEY_SESSION_ID) === undefined).assertFalse();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 42)).assertFalse();
      expect(storage.getSessionId()).assertEqual(42);
    });

    it('storage_session_id_set_5', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 100)).assertEqual(true);
      expect(storage.getSessionId()).assertEqual(100);
      expect(storage.get(STORAGE_KEY_SESSION_ID) === undefined).assertFalse();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 100)).assertFalse();
      expect(storage.getSessionId()).assertEqual(100);
    });

    it('storage_session_id_set_6', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 255)).assertEqual(true);
      expect(storage.getSessionId()).assertEqual(255);
      expect(storage.get(STORAGE_KEY_SESSION_ID) === undefined).assertFalse();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 255)).assertFalse();
      expect(storage.getSessionId()).assertEqual(255);
    });

    it('storage_session_id_set_7', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 1024)).assertEqual(true);
      expect(storage.getSessionId()).assertEqual(1024);
      expect(storage.get(STORAGE_KEY_SESSION_ID) === undefined).assertFalse();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 1024)).assertFalse();
      expect(storage.getSessionId()).assertEqual(1024);
    });

    it('storage_session_id_set_8', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, -2)).assertEqual(true);
      expect(storage.getSessionId()).assertEqual(-2);
      expect(storage.get(STORAGE_KEY_SESSION_ID) === undefined).assertFalse();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, -2)).assertFalse();
      expect(storage.getSessionId()).assertEqual(-2);
    });

    it('storage_session_id_set_9', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, -100)).assertEqual(true);
      expect(storage.getSessionId()).assertEqual(-100);
      expect(storage.get(STORAGE_KEY_SESSION_ID) === undefined).assertFalse();
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, -100)).assertFalse();
      expect(storage.getSessionId()).assertEqual(-100);
    });

    it('storage_connected_set_0', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_IS_CONNECTED, false)).assertEqual(false);
      expect(storage.isConnected()).assertEqual(false);
      expect(storage.setOrCreate(STORAGE_KEY_IS_CONNECTED, false)).assertFalse();
      expect(storage.isConnected()).assertEqual(false);
    });

    it('storage_connected_set_1', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_IS_CONNECTED, true)).assertEqual(true);
      expect(storage.isConnected()).assertEqual(true);
      expect(storage.setOrCreate(STORAGE_KEY_IS_CONNECTED, true)).assertFalse();
      expect(storage.isConnected()).assertEqual(true);
    });

    it('storage_receive_message_set_0', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, '')).assertEqual(false);
      expect(storage.getReceiveMessage()).assertEqual('');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, '')).assertFalse();
      expect(storage.getReceiveMessage()).assertEqual('');
    });

    it('storage_receive_message_set_1', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 'hello')).assertEqual(true);
      expect(storage.getReceiveMessage()).assertEqual('hello');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 'hello')).assertFalse();
      expect(storage.getReceiveMessage()).assertEqual('hello');
    });

    it('storage_receive_message_set_2', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, '中文消息')).assertEqual(true);
      expect(storage.getReceiveMessage()).assertEqual('中文消息');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, '中文消息')).assertFalse();
      expect(storage.getReceiveMessage()).assertEqual('中文消息');
    });

    it('storage_receive_message_set_3', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 'a')).assertEqual(true);
      expect(storage.getReceiveMessage()).assertEqual('a');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 'a')).assertFalse();
      expect(storage.getReceiveMessage()).assertEqual('a');
    });

    it('storage_receive_message_set_4', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 'distributed collaboration message')).assertEqual(true);
      expect(storage.getReceiveMessage()).assertEqual('distributed collaboration message');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 'distributed collaboration message')).assertFalse();
      expect(storage.getReceiveMessage()).assertEqual('distributed collaboration message');
    });

    it('storage_receive_message_set_5', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 'line1\nline2')).assertEqual(true);
      expect(storage.getReceiveMessage()).assertEqual('line1\nline2');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 'line1\nline2')).assertFalse();
      expect(storage.getReceiveMessage()).assertEqual('line1\nline2');
    });

    it('storage_receive_message_set_6', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, '多行\n中文')).assertEqual(true);
      expect(storage.getReceiveMessage()).assertEqual('多行\n中文');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, '多行\n中文')).assertFalse();
      expect(storage.getReceiveMessage()).assertEqual('多行\n中文');
    });

    it('storage_receive_message_set_7', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, '0')).assertEqual(true);
      expect(storage.getReceiveMessage()).assertEqual('0');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, '0')).assertFalse();
      expect(storage.getReceiveMessage()).assertEqual('0');
    });

    it('storage_receive_message_set_8', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, ' ')).assertEqual(true);
      expect(storage.getReceiveMessage()).assertEqual(' ');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, ' ')).assertFalse();
      expect(storage.getReceiveMessage()).assertEqual(' ');
    });

    it('storage_watch_message_set_0', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, '')).assertEqual(false);
      expect(storage.getReceiveWatchMessage()).assertEqual('');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, '')).assertFalse();
    });

    it('storage_watch_message_set_1', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, 'watch')).assertEqual(true);
      expect(storage.getReceiveWatchMessage()).assertEqual('watch');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, 'watch')).assertFalse();
    });

    it('storage_watch_message_set_2', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, '监听消息')).assertEqual(true);
      expect(storage.getReceiveWatchMessage()).assertEqual('监听消息');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, '监听消息')).assertFalse();
    });

    it('storage_watch_message_set_3', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, 'x')).assertEqual(true);
      expect(storage.getReceiveWatchMessage()).assertEqual('x');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, 'x')).assertFalse();
    });

    it('storage_watch_message_set_4', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, 'receive watch message')).assertEqual(true);
      expect(storage.getReceiveWatchMessage()).assertEqual('receive watch message');
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, 'receive watch message')).assertFalse();
    });

    it('storage_watcher_count_1', 0, async () => {
      const storage = new AppStorageModel();
      const key = STORAGE_KEY_RECEIVE_MESSAGE;
      storage.addWatcher(key, 'watcher_0');
      expect(storage.getWatchers(key).length).assertEqual(1);
      expect(storage.setOrCreate(key, 'changed')).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(1);
      expect(storage.getLastWatchedKey()).assertEqual(key);
      expect(storage.setOrCreate(key, 'changed')).assertFalse();
      expect(storage.getWatchInvokeCount()).assertEqual(1);
    });

    it('storage_watcher_count_2', 0, async () => {
      const storage = new AppStorageModel();
      const key = STORAGE_KEY_RECEIVE_MESSAGE;
      storage.addWatcher(key, 'watcher_0');
      storage.addWatcher(key, 'watcher_1');
      expect(storage.getWatchers(key).length).assertEqual(2);
      expect(storage.setOrCreate(key, 'changed')).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(2);
      expect(storage.getLastWatchedKey()).assertEqual(key);
      expect(storage.setOrCreate(key, 'changed')).assertFalse();
      expect(storage.getWatchInvokeCount()).assertEqual(2);
    });

    it('storage_watcher_count_3', 0, async () => {
      const storage = new AppStorageModel();
      const key = STORAGE_KEY_RECEIVE_MESSAGE;
      storage.addWatcher(key, 'watcher_0');
      storage.addWatcher(key, 'watcher_1');
      storage.addWatcher(key, 'watcher_2');
      expect(storage.getWatchers(key).length).assertEqual(3);
      expect(storage.setOrCreate(key, 'changed')).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(3);
      expect(storage.getLastWatchedKey()).assertEqual(key);
      expect(storage.setOrCreate(key, 'changed')).assertFalse();
      expect(storage.getWatchInvokeCount()).assertEqual(3);
    });

    it('storage_watcher_count_4', 0, async () => {
      const storage = new AppStorageModel();
      const key = STORAGE_KEY_RECEIVE_MESSAGE;
      storage.addWatcher(key, 'watcher_0');
      storage.addWatcher(key, 'watcher_1');
      storage.addWatcher(key, 'watcher_2');
      storage.addWatcher(key, 'watcher_3');
      expect(storage.getWatchers(key).length).assertEqual(4);
      expect(storage.setOrCreate(key, 'changed')).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(4);
      expect(storage.getLastWatchedKey()).assertEqual(key);
      expect(storage.setOrCreate(key, 'changed')).assertFalse();
      expect(storage.getWatchInvokeCount()).assertEqual(4);
    });

    it('storage_watcher_count_5', 0, async () => {
      const storage = new AppStorageModel();
      const key = STORAGE_KEY_RECEIVE_MESSAGE;
      storage.addWatcher(key, 'watcher_0');
      storage.addWatcher(key, 'watcher_1');
      storage.addWatcher(key, 'watcher_2');
      storage.addWatcher(key, 'watcher_3');
      storage.addWatcher(key, 'watcher_4');
      expect(storage.getWatchers(key).length).assertEqual(5);
      expect(storage.setOrCreate(key, 'changed')).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(5);
      expect(storage.getLastWatchedKey()).assertEqual(key);
      expect(storage.setOrCreate(key, 'changed')).assertFalse();
      expect(storage.getWatchInvokeCount()).assertEqual(5);
    });

    it('storage_watcher_count_6', 0, async () => {
      const storage = new AppStorageModel();
      const key = STORAGE_KEY_RECEIVE_MESSAGE;
      storage.addWatcher(key, 'watcher_0');
      storage.addWatcher(key, 'watcher_1');
      storage.addWatcher(key, 'watcher_2');
      storage.addWatcher(key, 'watcher_3');
      storage.addWatcher(key, 'watcher_4');
      storage.addWatcher(key, 'watcher_5');
      expect(storage.getWatchers(key).length).assertEqual(6);
      expect(storage.setOrCreate(key, 'changed')).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(6);
      expect(storage.getLastWatchedKey()).assertEqual(key);
      expect(storage.setOrCreate(key, 'changed')).assertFalse();
      expect(storage.getWatchInvokeCount()).assertEqual(6);
    });

    it('storage_watcher_count_7', 0, async () => {
      const storage = new AppStorageModel();
      const key = STORAGE_KEY_RECEIVE_MESSAGE;
      storage.addWatcher(key, 'watcher_0');
      storage.addWatcher(key, 'watcher_1');
      storage.addWatcher(key, 'watcher_2');
      storage.addWatcher(key, 'watcher_3');
      storage.addWatcher(key, 'watcher_4');
      storage.addWatcher(key, 'watcher_5');
      storage.addWatcher(key, 'watcher_6');
      expect(storage.getWatchers(key).length).assertEqual(7);
      expect(storage.setOrCreate(key, 'changed')).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(7);
      expect(storage.getLastWatchedKey()).assertEqual(key);
      expect(storage.setOrCreate(key, 'changed')).assertFalse();
      expect(storage.getWatchInvokeCount()).assertEqual(7);
    });

    it('storage_watcher_count_8', 0, async () => {
      const storage = new AppStorageModel();
      const key = STORAGE_KEY_RECEIVE_MESSAGE;
      storage.addWatcher(key, 'watcher_0');
      storage.addWatcher(key, 'watcher_1');
      storage.addWatcher(key, 'watcher_2');
      storage.addWatcher(key, 'watcher_3');
      storage.addWatcher(key, 'watcher_4');
      storage.addWatcher(key, 'watcher_5');
      storage.addWatcher(key, 'watcher_6');
      storage.addWatcher(key, 'watcher_7');
      expect(storage.getWatchers(key).length).assertEqual(8);
      expect(storage.setOrCreate(key, 'changed')).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(8);
      expect(storage.getLastWatchedKey()).assertEqual(key);
      expect(storage.setOrCreate(key, 'changed')).assertFalse();
      expect(storage.getWatchInvokeCount()).assertEqual(8);
    });

    it('storage_watcher_count_9', 0, async () => {
      const storage = new AppStorageModel();
      const key = STORAGE_KEY_RECEIVE_MESSAGE;
      storage.addWatcher(key, 'watcher_0');
      storage.addWatcher(key, 'watcher_1');
      storage.addWatcher(key, 'watcher_2');
      storage.addWatcher(key, 'watcher_3');
      storage.addWatcher(key, 'watcher_4');
      storage.addWatcher(key, 'watcher_5');
      storage.addWatcher(key, 'watcher_6');
      storage.addWatcher(key, 'watcher_7');
      storage.addWatcher(key, 'watcher_8');
      expect(storage.getWatchers(key).length).assertEqual(9);
      expect(storage.setOrCreate(key, 'changed')).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(9);
      expect(storage.getLastWatchedKey()).assertEqual(key);
      expect(storage.setOrCreate(key, 'changed')).assertFalse();
      expect(storage.getWatchInvokeCount()).assertEqual(9);
    });

    it('storage_watcher_count_10', 0, async () => {
      const storage = new AppStorageModel();
      const key = STORAGE_KEY_RECEIVE_MESSAGE;
      storage.addWatcher(key, 'watcher_0');
      storage.addWatcher(key, 'watcher_1');
      storage.addWatcher(key, 'watcher_2');
      storage.addWatcher(key, 'watcher_3');
      storage.addWatcher(key, 'watcher_4');
      storage.addWatcher(key, 'watcher_5');
      storage.addWatcher(key, 'watcher_6');
      storage.addWatcher(key, 'watcher_7');
      storage.addWatcher(key, 'watcher_8');
      storage.addWatcher(key, 'watcher_9');
      expect(storage.getWatchers(key).length).assertEqual(10);
      expect(storage.setOrCreate(key, 'changed')).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(10);
      expect(storage.getLastWatchedKey()).assertEqual(key);
      expect(storage.setOrCreate(key, 'changed')).assertFalse();
      expect(storage.getWatchInvokeCount()).assertEqual(10);
    });

    it('storage_multi_key_watchers_1', 0, async () => {
      const storage = new AppStorageModel();
      storage.addWatcher(STORAGE_KEY_SESSION_ID, 'w0_0');
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 5)).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(1);
      expect(storage.getLastWatchedKey()).assertEqual(STORAGE_KEY_SESSION_ID);
    });

    it('storage_multi_key_watchers_2', 0, async () => {
      const storage = new AppStorageModel();
      storage.addWatcher(STORAGE_KEY_SESSION_ID, 'w0_0');
      storage.addWatcher(STORAGE_KEY_IS_CONNECTED, 'w1_0');
      storage.addWatcher(STORAGE_KEY_IS_CONNECTED, 'w1_1');
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 5)).assertTrue();
      expect(storage.setOrCreate(STORAGE_KEY_IS_CONNECTED, true)).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(3);
      expect(storage.getLastWatchedKey()).assertEqual(STORAGE_KEY_IS_CONNECTED);
    });

    it('storage_multi_key_watchers_3', 0, async () => {
      const storage = new AppStorageModel();
      storage.addWatcher(STORAGE_KEY_SESSION_ID, 'w0_0');
      storage.addWatcher(STORAGE_KEY_IS_CONNECTED, 'w1_0');
      storage.addWatcher(STORAGE_KEY_IS_CONNECTED, 'w1_1');
      storage.addWatcher(STORAGE_KEY_RECEIVE_MESSAGE, 'w2_0');
      storage.addWatcher(STORAGE_KEY_RECEIVE_MESSAGE, 'w2_1');
      storage.addWatcher(STORAGE_KEY_RECEIVE_MESSAGE, 'w2_2');
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 5)).assertTrue();
      expect(storage.setOrCreate(STORAGE_KEY_IS_CONNECTED, true)).assertTrue();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 'm')).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(6);
      expect(storage.getLastWatchedKey()).assertEqual(STORAGE_KEY_RECEIVE_MESSAGE);
    });

    it('storage_multi_key_watchers_4', 0, async () => {
      const storage = new AppStorageModel();
      storage.addWatcher(STORAGE_KEY_SESSION_ID, 'w0_0');
      storage.addWatcher(STORAGE_KEY_IS_CONNECTED, 'w1_0');
      storage.addWatcher(STORAGE_KEY_IS_CONNECTED, 'w1_1');
      storage.addWatcher(STORAGE_KEY_RECEIVE_MESSAGE, 'w2_0');
      storage.addWatcher(STORAGE_KEY_RECEIVE_MESSAGE, 'w2_1');
      storage.addWatcher(STORAGE_KEY_RECEIVE_MESSAGE, 'w2_2');
      storage.addWatcher(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, 'w3_0');
      storage.addWatcher(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, 'w3_1');
      storage.addWatcher(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, 'w3_2');
      storage.addWatcher(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, 'w3_3');
      expect(storage.setOrCreate(STORAGE_KEY_SESSION_ID, 5)).assertTrue();
      expect(storage.setOrCreate(STORAGE_KEY_IS_CONNECTED, true)).assertTrue();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 'm')).assertTrue();
      expect(storage.setOrCreate(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, 'w')).assertTrue();
      expect(storage.getWatchInvokeCount()).assertEqual(10);
      expect(storage.getLastWatchedKey()).assertEqual(STORAGE_KEY_RECEIVE_WATCH_MESSAGE);
    });

    it('storage_type_guard_0', 0, async () => {
      const storage = new AppStorageModel();
      storage.setOrCreate(STORAGE_KEY_SESSION_ID, 'not-a-number');
      expect(storage.getSessionId()).assertEqual(INVALID_SESSION_ID);
      expect(storage.has(STORAGE_KEY_SESSION_ID)).assertTrue();
    });

    it('storage_type_guard_1', 0, async () => {
      const storage = new AppStorageModel();
      storage.setOrCreate(STORAGE_KEY_IS_CONNECTED, 1);
      expect(storage.isConnected()).assertEqual(false);
      expect(storage.has(STORAGE_KEY_IS_CONNECTED)).assertTrue();
    });

    it('storage_type_guard_2', 0, async () => {
      const storage = new AppStorageModel();
      storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 42);
      expect(storage.getReceiveMessage()).assertEqual('');
      expect(storage.has(STORAGE_KEY_RECEIVE_MESSAGE)).assertTrue();
    });

    it('storage_type_guard_3', 0, async () => {
      const storage = new AppStorageModel();
      storage.setOrCreate(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, true);
      expect(storage.getReceiveWatchMessage()).assertEqual('');
      expect(storage.has(STORAGE_KEY_RECEIVE_WATCH_MESSAGE)).assertTrue();
    });

    it('storage_remove_0', 0, async () => {
      const storage = new AppStorageModel();
      storage.setOrCreate(STORAGE_KEY_SESSION_ID, 3);
      expect(storage.has(STORAGE_KEY_SESSION_ID)).assertTrue();
      expect(storage.remove(STORAGE_KEY_SESSION_ID)).assertTrue();
      expect(storage.has(STORAGE_KEY_SESSION_ID)).assertFalse();
      expect(storage.remove(STORAGE_KEY_SESSION_ID)).assertFalse();
      expect(storage.get(STORAGE_KEY_SESSION_ID) === undefined).assertTrue();
    });

    it('storage_remove_1', 0, async () => {
      const storage = new AppStorageModel();
      storage.setOrCreate(STORAGE_KEY_IS_CONNECTED, true);
      expect(storage.has(STORAGE_KEY_IS_CONNECTED)).assertTrue();
      expect(storage.remove(STORAGE_KEY_IS_CONNECTED)).assertTrue();
      expect(storage.has(STORAGE_KEY_IS_CONNECTED)).assertFalse();
      expect(storage.remove(STORAGE_KEY_IS_CONNECTED)).assertFalse();
      expect(storage.get(STORAGE_KEY_IS_CONNECTED) === undefined).assertTrue();
    });

    it('storage_remove_2', 0, async () => {
      const storage = new AppStorageModel();
      storage.setOrCreate(STORAGE_KEY_RECEIVE_MESSAGE, 'm');
      expect(storage.has(STORAGE_KEY_RECEIVE_MESSAGE)).assertTrue();
      expect(storage.remove(STORAGE_KEY_RECEIVE_MESSAGE)).assertTrue();
      expect(storage.has(STORAGE_KEY_RECEIVE_MESSAGE)).assertFalse();
      expect(storage.remove(STORAGE_KEY_RECEIVE_MESSAGE)).assertFalse();
      expect(storage.get(STORAGE_KEY_RECEIVE_MESSAGE) === undefined).assertTrue();
    });

    it('storage_remove_3', 0, async () => {
      const storage = new AppStorageModel();
      storage.setOrCreate(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, 'w');
      expect(storage.has(STORAGE_KEY_RECEIVE_WATCH_MESSAGE)).assertTrue();
      expect(storage.remove(STORAGE_KEY_RECEIVE_WATCH_MESSAGE)).assertTrue();
      expect(storage.has(STORAGE_KEY_RECEIVE_WATCH_MESSAGE)).assertFalse();
      expect(storage.remove(STORAGE_KEY_RECEIVE_WATCH_MESSAGE)).assertFalse();
      expect(storage.get(STORAGE_KEY_RECEIVE_WATCH_MESSAGE) === undefined).assertTrue();
    });

    it('storage_clear_all_contract', 0, async () => {
      const storage = new AppStorageModel();
      storage.addWatcher(STORAGE_KEY_SESSION_ID, 'a');
      storage.addWatcher(STORAGE_KEY_IS_CONNECTED, 'b');
      storage.setOrCreate(STORAGE_KEY_SESSION_ID, 8);
      storage.setOrCreate(STORAGE_KEY_IS_CONNECTED, true);
      expect(storage.getWatchInvokeCount()).assertEqual(2);
      storage.clearAll();
      expect(storage.has(STORAGE_KEY_SESSION_ID)).assertFalse();
      expect(storage.has(STORAGE_KEY_IS_CONNECTED)).assertFalse();
      expect(storage.getWatchers(STORAGE_KEY_SESSION_ID).length).assertEqual(0);
      expect(storage.getWatchInvokeCount()).assertEqual(0);
      expect(storage.getLastWatchedKey()).assertEqual('');
      expect(storage.getSessionId()).assertEqual(INVALID_SESSION_ID);
      expect(storage.isConnected()).assertEqual(false);
    });

    it('storage_watchers_returns_copy', 0, async () => {
      const storage = new AppStorageModel();
      storage.addWatcher(STORAGE_KEY_RECEIVE_MESSAGE, 'one');
      const list = storage.getWatchers(STORAGE_KEY_RECEIVE_MESSAGE);
      expect(list.length).assertEqual(1);
      list.push('injected');
      expect(storage.getWatchers(STORAGE_KEY_RECEIVE_MESSAGE).length).assertEqual(1);
      expect(storage.getWatchers('unknownKey').length).assertEqual(0);
    });

    it('storage_custom_key_contract', 0, async () => {
      const storage = new AppStorageModel();
      expect(storage.has('customKey')).assertFalse();
      expect(storage.setOrCreate('customKey', 'v')).assertTrue();
      expect(storage.has('customKey')).assertTrue();
      expect(storage.setOrCreate('customKey', 'v')).assertFalse();
      expect(storage.setOrCreate('customKey', 'w')).assertTrue();
      expect(storage.remove('customKey')).assertTrue();
      expect(storage.has('customKey')).assertFalse();
    });

  });
}

