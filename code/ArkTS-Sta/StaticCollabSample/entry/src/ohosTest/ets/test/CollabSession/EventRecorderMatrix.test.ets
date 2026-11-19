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


export default function eventRecorderMatrixTest(): void {
  describe('EventRecorderMatrix_Test', () => {
    it('recorder_empty_contract', 0, async () => {
      const recorder = new CollabEventRecorder();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.all().length).assertEqual(0);
      expect(recorder.countOf(CollabEventType.CREATE)).assertEqual(0);
      expect(recorder.firstOf(CollabEventType.CREATE) === null).assertTrue();
      expect(recorder.lastOf(CollabEventType.CREATE) === null).assertTrue();
      expect(recorder.sequenceOfTypes().length).assertEqual(0);
    });

    it('recorder_single_create', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.CREATE, 0, 'detail_CREATE');
      expect(recorder.size()).assertEqual(1);
      expect(recorder.countOf(CollabEventType.CREATE)).assertEqual(1);
      const first = recorder.firstOf(CollabEventType.CREATE);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(0);
      expect((first as CollabEventRecord).detail).assertEqual('detail_CREATE');
      expect((first as CollabEventRecord).type).assertEqual(CollabEventType.CREATE);
    });

    it('recorder_single_accept', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.ACCEPT, 1, 'detail_ACCEPT');
      expect(recorder.size()).assertEqual(1);
      expect(recorder.countOf(CollabEventType.ACCEPT)).assertEqual(1);
      const first = recorder.firstOf(CollabEventType.ACCEPT);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(1);
      expect((first as CollabEventRecord).detail).assertEqual('detail_ACCEPT');
      expect((first as CollabEventRecord).type).assertEqual(CollabEventType.ACCEPT);
    });

    it('recorder_single_connect', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.CONNECT, 2, 'detail_CONNECT');
      expect(recorder.size()).assertEqual(1);
      expect(recorder.countOf(CollabEventType.CONNECT)).assertEqual(1);
      const first = recorder.firstOf(CollabEventType.CONNECT);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(2);
      expect((first as CollabEventRecord).detail).assertEqual('detail_CONNECT');
      expect((first as CollabEventRecord).type).assertEqual(CollabEventType.CONNECT);
    });

    it('recorder_single_disconnect', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.DISCONNECT, 3, 'detail_DISCONNECT');
      expect(recorder.size()).assertEqual(1);
      expect(recorder.countOf(CollabEventType.DISCONNECT)).assertEqual(1);
      const first = recorder.firstOf(CollabEventType.DISCONNECT);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(3);
      expect((first as CollabEventRecord).detail).assertEqual('detail_DISCONNECT');
      expect((first as CollabEventRecord).type).assertEqual(CollabEventType.DISCONNECT);
    });

    it('recorder_single_destroy', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.DESTROY, 4, 'detail_DESTROY');
      expect(recorder.size()).assertEqual(1);
      expect(recorder.countOf(CollabEventType.DESTROY)).assertEqual(1);
      const first = recorder.firstOf(CollabEventType.DESTROY);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(4);
      expect((first as CollabEventRecord).detail).assertEqual('detail_DESTROY');
      expect((first as CollabEventRecord).type).assertEqual(CollabEventType.DESTROY);
    });

    it('recorder_single_send_message', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.SEND_MESSAGE, 5, 'detail_SEND_MESSAGE');
      expect(recorder.size()).assertEqual(1);
      expect(recorder.countOf(CollabEventType.SEND_MESSAGE)).assertEqual(1);
      const first = recorder.firstOf(CollabEventType.SEND_MESSAGE);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(5);
      expect((first as CollabEventRecord).detail).assertEqual('detail_SEND_MESSAGE');
      expect((first as CollabEventRecord).type).assertEqual(CollabEventType.SEND_MESSAGE);
    });

    it('recorder_single_send_data', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.SEND_DATA, 6, 'detail_SEND_DATA');
      expect(recorder.size()).assertEqual(1);
      expect(recorder.countOf(CollabEventType.SEND_DATA)).assertEqual(1);
      const first = recorder.firstOf(CollabEventType.SEND_DATA);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(6);
      expect((first as CollabEventRecord).detail).assertEqual('detail_SEND_DATA');
      expect((first as CollabEventRecord).type).assertEqual(CollabEventType.SEND_DATA);
    });

    it('recorder_single_receive_message', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.RECEIVE_MESSAGE, 7, 'detail_RECEIVE_MESSAGE');
      expect(recorder.size()).assertEqual(1);
      expect(recorder.countOf(CollabEventType.RECEIVE_MESSAGE)).assertEqual(1);
      const first = recorder.firstOf(CollabEventType.RECEIVE_MESSAGE);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(7);
      expect((first as CollabEventRecord).detail).assertEqual('detail_RECEIVE_MESSAGE');
      expect((first as CollabEventRecord).type).assertEqual(CollabEventType.RECEIVE_MESSAGE);
    });

    it('recorder_single_receive_data', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.RECEIVE_DATA, 8, 'detail_RECEIVE_DATA');
      expect(recorder.size()).assertEqual(1);
      expect(recorder.countOf(CollabEventType.RECEIVE_DATA)).assertEqual(1);
      const first = recorder.firstOf(CollabEventType.RECEIVE_DATA);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(8);
      expect((first as CollabEventRecord).detail).assertEqual('detail_RECEIVE_DATA');
      expect((first as CollabEventRecord).type).assertEqual(CollabEventType.RECEIVE_DATA);
    });

    it('recorder_single_error', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.ERROR, 9, 'detail_ERROR');
      expect(recorder.size()).assertEqual(1);
      expect(recorder.countOf(CollabEventType.ERROR)).assertEqual(1);
      const first = recorder.firstOf(CollabEventType.ERROR);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(9);
      expect((first as CollabEventRecord).detail).assertEqual('detail_ERROR');
      expect((first as CollabEventRecord).type).assertEqual(CollabEventType.ERROR);
    });

    it('recorder_all_types_once', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.CREATE, 0, 'createDetail');
      recorder.record(CollabEventType.ACCEPT, 1, 'acceptDetail');
      recorder.record(CollabEventType.CONNECT, 2, 'connectDetail');
      recorder.record(CollabEventType.DISCONNECT, 3, 'disconnectDetail');
      recorder.record(CollabEventType.DESTROY, 4, 'destroyDetail');
      recorder.record(CollabEventType.SEND_MESSAGE, 5, 'sendMessageDetail');
      recorder.record(CollabEventType.SEND_DATA, 6, 'sendDataDetail');
      recorder.record(CollabEventType.RECEIVE_MESSAGE, 7, 'receiveMessageDetail');
      recorder.record(CollabEventType.RECEIVE_DATA, 8, 'receiveDataDetail');
      recorder.record(CollabEventType.ERROR, 9, 'errorDetail');
      expect(recorder.size()).assertEqual(10);
      expect(recorder.countOf(CollabEventType.CREATE)).assertEqual(1);
      expect(recorder.countOf(CollabEventType.ACCEPT)).assertEqual(1);
      expect(recorder.countOf(CollabEventType.CONNECT)).assertEqual(1);
      expect(recorder.countOf(CollabEventType.DISCONNECT)).assertEqual(1);
      expect(recorder.countOf(CollabEventType.DESTROY)).assertEqual(1);
      expect(recorder.countOf(CollabEventType.SEND_MESSAGE)).assertEqual(1);
      expect(recorder.countOf(CollabEventType.SEND_DATA)).assertEqual(1);
      expect(recorder.countOf(CollabEventType.RECEIVE_MESSAGE)).assertEqual(1);
      expect(recorder.countOf(CollabEventType.RECEIVE_DATA)).assertEqual(1);
      expect(recorder.countOf(CollabEventType.ERROR)).assertEqual(1);
      const sequence = recorder.sequenceOfTypes();
      expect(sequence.length).assertEqual(10);
      expect(sequence[0]).assertEqual(CollabEventType.CREATE);
      expect(sequence[1]).assertEqual(CollabEventType.ACCEPT);
      expect(sequence[2]).assertEqual(CollabEventType.CONNECT);
      expect(sequence[3]).assertEqual(CollabEventType.DISCONNECT);
      expect(sequence[4]).assertEqual(CollabEventType.DESTROY);
      expect(sequence[5]).assertEqual(CollabEventType.SEND_MESSAGE);
      expect(sequence[6]).assertEqual(CollabEventType.SEND_DATA);
      expect(sequence[7]).assertEqual(CollabEventType.RECEIVE_MESSAGE);
      expect(sequence[8]).assertEqual(CollabEventType.RECEIVE_DATA);
      expect(sequence[9]).assertEqual(CollabEventType.ERROR);
    });

    it('recorder_repeat_2', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.CONNECT, 0, 'chunk0');
      recorder.record(CollabEventType.CONNECT, 1, 'chunk1');
      expect(recorder.size()).assertEqual(2);
      expect(recorder.countOf(CollabEventType.CONNECT)).assertEqual(2);
      expect(recorder.countOf(CollabEventType.DISCONNECT)).assertEqual(0);
      const first = recorder.firstOf(CollabEventType.CONNECT);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(0);
      const last = recorder.lastOf(CollabEventType.CONNECT);
      expect(last === null).assertFalse();
      expect((last as CollabEventRecord).sessionId).assertEqual(1);
    });

    it('recorder_repeat_3', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.CONNECT, 0, 'chunk0');
      recorder.record(CollabEventType.CONNECT, 1, 'chunk1');
      recorder.record(CollabEventType.CONNECT, 2, 'chunk2');
      expect(recorder.size()).assertEqual(3);
      expect(recorder.countOf(CollabEventType.CONNECT)).assertEqual(3);
      expect(recorder.countOf(CollabEventType.DISCONNECT)).assertEqual(0);
      const first = recorder.firstOf(CollabEventType.CONNECT);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(0);
      const last = recorder.lastOf(CollabEventType.CONNECT);
      expect(last === null).assertFalse();
      expect((last as CollabEventRecord).sessionId).assertEqual(2);
    });

    it('recorder_repeat_5', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.CONNECT, 0, 'chunk0');
      recorder.record(CollabEventType.CONNECT, 1, 'chunk1');
      recorder.record(CollabEventType.CONNECT, 2, 'chunk2');
      recorder.record(CollabEventType.CONNECT, 3, 'chunk3');
      recorder.record(CollabEventType.CONNECT, 4, 'chunk4');
      expect(recorder.size()).assertEqual(5);
      expect(recorder.countOf(CollabEventType.CONNECT)).assertEqual(5);
      expect(recorder.countOf(CollabEventType.DISCONNECT)).assertEqual(0);
      const first = recorder.firstOf(CollabEventType.CONNECT);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(0);
      const last = recorder.lastOf(CollabEventType.CONNECT);
      expect(last === null).assertFalse();
      expect((last as CollabEventRecord).sessionId).assertEqual(4);
    });

    it('recorder_repeat_8', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.CONNECT, 0, 'chunk0');
      recorder.record(CollabEventType.CONNECT, 1, 'chunk1');
      recorder.record(CollabEventType.CONNECT, 2, 'chunk2');
      recorder.record(CollabEventType.CONNECT, 3, 'chunk3');
      recorder.record(CollabEventType.CONNECT, 4, 'chunk4');
      recorder.record(CollabEventType.CONNECT, 5, 'chunk5');
      recorder.record(CollabEventType.CONNECT, 6, 'chunk6');
      recorder.record(CollabEventType.CONNECT, 7, 'chunk7');
      expect(recorder.size()).assertEqual(8);
      expect(recorder.countOf(CollabEventType.CONNECT)).assertEqual(8);
      expect(recorder.countOf(CollabEventType.DISCONNECT)).assertEqual(0);
      const first = recorder.firstOf(CollabEventType.CONNECT);
      expect(first === null).assertFalse();
      expect((first as CollabEventRecord).sessionId).assertEqual(0);
      const last = recorder.lastOf(CollabEventType.CONNECT);
      expect(last === null).assertFalse();
      expect((last as CollabEventRecord).sessionId).assertEqual(7);
    });

    it('recorder_clear_contract', 0, async () => {
      const recorder = new CollabEventRecorder();
      recorder.record(CollabEventType.CREATE, 0, 'a');
      recorder.record(CollabEventType.CONNECT, 0, 'b');
      expect(recorder.size()).assertEqual(2);
      recorder.clear();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.all().length).assertEqual(0);
      expect(recorder.sequenceOfTypes().length).assertEqual(0);
    });

  });
}

