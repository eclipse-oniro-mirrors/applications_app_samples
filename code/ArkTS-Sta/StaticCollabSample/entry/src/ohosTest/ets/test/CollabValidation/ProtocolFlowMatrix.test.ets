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
  serializedDelay,
  triggerSerializedKey,
  getDriver,
  findComponentsByType,
  collabComponentCount,
  checkTextContent,
  checkComponentExists,
  dismissSystemDialog,
  simulateTouch,
  clickButtonByText,
  readInputText,
  getCurrentFocusIndex,
  checkFocusState,
  pressAndWait,
  launchSampleApp,
  waitForUiReady,
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
  TAG,
  PAGE_TITLE,
  BUTTON_CONNECT,
  BUTTON_SEND_MESSAGE,
  BUTTON_SEND_DATA,
  BUTTON_DISCONNECT,
  BUTTON_DESTROY_SESSION,
  MESSAGE_INPUT_ID,
  KEY_BACK,
  KEY_HOME,
  KEY_UP,
  KEY_DOWN,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  TIMEOUT_UI_RENDER,
  TIMEOUT_CONNECT,
  TIMEOUT_SESSION_CREATE,
  TIMEOUT_STATE_CHANGE,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_OPERATION,
  TOLERANCE_COMPONENT_COUNT,
  TOLERANCE_STATE_CHANGE
} from '../Shared/CollabTestDriver';


export default function protocolFlowMatrixTest(): void {
  describe('ProtocolFlowMatrix_Test', () => {
    it('protocol_create_0_1_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_1');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_1');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_1_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_1');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_1');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_2_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_2');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_2');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_2_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_2');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_2');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_3_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_3');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_3');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_3_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_3');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_3');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_4_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_4');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_4');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_4_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_4');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_4');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_5_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_5');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_5');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_5_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_5');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_5');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_6_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_6');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_6');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_6_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_6');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_6');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_7_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_7');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_7');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_7_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_7');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_7');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_8_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_8');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_8');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_8_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_8');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_8');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_9_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_9');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_9');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_9_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_9');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_9');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_10_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_10');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_10');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_10_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_10');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_10');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_11_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_11');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_11');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_11_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_11');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_11');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_12_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_12');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_12');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_0_12_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_12');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('collabTest', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('collabTest');
      expect(session.peerInfo.deviceId).assertEqual('device_12');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('collabTest');
    });

    it('protocol_create_1_1_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_1');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_1');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_1_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_1');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_1');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_2_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_2');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_2');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_2_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_2');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_2');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_3_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_3');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_3');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_3_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_3');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_3');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_4_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_4');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_4');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_4_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_4');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_4');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_5_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_5');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_5');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_5_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_5');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_5');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_6_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_6');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_6');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_6_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_6');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_6');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_7_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_7');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_7');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_7_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_7');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_7');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_8_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_8');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_8');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_8_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_8');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_8');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_9_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_9');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_9');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_9_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_9');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_9');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_10_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_10');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_10');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_10_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_10');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_10');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_11_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_11');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_11');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_11_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_11');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_11');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_12_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_12');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_12');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_1_12_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_12');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('a', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('a');
      expect(session.peerInfo.deviceId).assertEqual('device_12');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('a');
    });

    it('protocol_create_2_1_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_1');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_1');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_1_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_1');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_1');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_2_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_2');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_2');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_2_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_2');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_2');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_3_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_3');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_3');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_3_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_3');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_3');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_4_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_4');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_4');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_4_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_4');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_4');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_5_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_5');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_5');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_5_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_5');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_5');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_6_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_6');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_6');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_6_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_6');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_6');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_7_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_7');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_7');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_7_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_7');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_7');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_8_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_8');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_8');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_8_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_8');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_8');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_9_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_9');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_9');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_9_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_9');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_9');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_10_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_10');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_10');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_10_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_10');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_10');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_11_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_11');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_11');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_11_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_11');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_11');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_12_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_12');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_12');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_2_12_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_12');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_1', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_1');
      expect(session.peerInfo.deviceId).assertEqual('device_12');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_1');
    });

    it('protocol_create_3_1_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_1');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_1');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_1_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_1');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_1');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_2_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_2');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_2');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_2_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_2');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_2');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_3_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_3');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_3');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_3_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_3');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_3');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_4_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_4');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_4');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_4_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_4');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_4');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_5_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_5');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_5');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_5_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_5');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_5');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_6_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_6');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_6');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_6_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_6');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_6');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_7_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_7');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_7');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_7_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_7');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_7');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_8_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_8');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_8');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_8_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_8');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_8');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_9_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_9');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_9');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_9_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_9');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_9');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_10_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_10');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_10');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_10_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_10');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_10');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_11_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_11');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_11');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_11_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_11');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_11');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_12_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_12');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_12');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_3_12_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_12');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('session_2', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('session_2');
      expect(session.peerInfo.deviceId).assertEqual('device_12');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('session_2');
    });

    it('protocol_create_4_1_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_1');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_1');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_1_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_1');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_1');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_2_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_2');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_2');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_2_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_2');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_2');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_3_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_3');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_3');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_3_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_3');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_3');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_4_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_4');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_4');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_4_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_4');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_4');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_5_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_5');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_5');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_5_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_5');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_5');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_6_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_6');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_6');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_6_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_6');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_6');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_7_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_7');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_7');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_7_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_7');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_7');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_8_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_8');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_8');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_8_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_8');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_8');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_9_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_9');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_9');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_9_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_9');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_9');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_10_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_10');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_10');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_10_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_10');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_10');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_11_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_11');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_11');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_11_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_11');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_11');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_12_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_12');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_12');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_4_12_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_12');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('中文会话', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('中文会话');
      expect(session.peerInfo.deviceId).assertEqual('device_12');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('中文会话');
    });

    it('protocol_create_5_1_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_1');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_1');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_1_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_1');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_1');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_2_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_2');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_2');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_2_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_2');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_2');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_3_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_3');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_3');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_3_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_3');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_3');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_4_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_4');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_4');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_4_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_4');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_4');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_5_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_5');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_5');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_5_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_5');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_5');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_6_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_6');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_6');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_6_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_6');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_6');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_7_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_7');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_7');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_7_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_7');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_7');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_8_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_8');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_8');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_8_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_8');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_8');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_9_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_9');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_9');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_9_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_9');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_9');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_10_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_10');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_10');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_10_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_10');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_10');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_11_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_11');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_11');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_11_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_11');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_11');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_12_data', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_12');
      const options = buildConnectOptions(true);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_12');
      expect(session.options.needSendData).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_5_12_nodata', 0, async () => {
      const bridge = new MockCollabBridge();
      const peer = buildPeerInfo('device_12');
      const options = buildConnectOptions(false);
      const sid = bridge.createAbilityConnectionSession('x_y_z', peer, options);
      expect(sid).assertEqual(0);
      expect(bridge.getSessionCount()).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.sessionName).assertEqual('x_y_z');
      expect(session.peerInfo.deviceId).assertEqual('device_12');
      expect(session.options.needSendData).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(bridge.getEvents()[0].detail).assertEqual('x_y_z');
    });

    it('protocol_create_incomplete_device', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, new PeerInfoModel('', COLLAB_BUNDLE_NAME, COLLAB_MODULE_NAME, COLLAB_ABILITY_NAME, COLLAB_SERVICE_NAME), buildConnectOptions(true));
      expect(sid).assertEqual(INVALID_SESSION_ID);
      expect(bridge.getSessionCount()).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      expect(bridge.getEvents()[0].detail).assertEqual('invalid arguments');
    });

    it('protocol_create_incomplete_bundle', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, new PeerInfoModel('dev', '', COLLAB_MODULE_NAME, COLLAB_ABILITY_NAME, COLLAB_SERVICE_NAME), buildConnectOptions(true));
      expect(sid).assertEqual(INVALID_SESSION_ID);
      expect(bridge.getSessionCount()).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      expect(bridge.getEvents()[0].detail).assertEqual('invalid arguments');
    });

    it('protocol_create_incomplete_module', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, new PeerInfoModel('dev', COLLAB_BUNDLE_NAME, '', COLLAB_ABILITY_NAME, COLLAB_SERVICE_NAME), buildConnectOptions(true));
      expect(sid).assertEqual(INVALID_SESSION_ID);
      expect(bridge.getSessionCount()).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      expect(bridge.getEvents()[0].detail).assertEqual('invalid arguments');
    });

    it('protocol_create_incomplete_ability', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, new PeerInfoModel('dev', COLLAB_BUNDLE_NAME, COLLAB_MODULE_NAME, '', COLLAB_SERVICE_NAME), buildConnectOptions(true));
      expect(sid).assertEqual(INVALID_SESSION_ID);
      expect(bridge.getSessionCount()).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      expect(bridge.getEvents()[0].detail).assertEqual('invalid arguments');
    });

    it('protocol_create_incomplete_service', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, new PeerInfoModel('dev', COLLAB_BUNDLE_NAME, COLLAB_MODULE_NAME, COLLAB_ABILITY_NAME, ''), buildConnectOptions(true));
      expect(sid).assertEqual(INVALID_SESSION_ID);
      expect(bridge.getSessionCount()).assertEqual(0);
      expect(bridge.getEventCount(CollabEventType.CREATE)).assertEqual(1);
      expect(bridge.getEvents()[0].detail).assertEqual('invalid arguments');
    });

    it('protocol_create_empty_name', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession('', buildPeerInfo('dev'), buildConnectOptions(true));
      expect(sid).assertEqual(INVALID_SESSION_ID);
      expect(bridge.getEvents()[0].detail).assertEqual('invalid arguments');
    });

    it('protocol_create_fail_injection', 0, async () => {
      const bridge = new MockCollabBridge();
      bridge.failCreate = true;
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('dev'), buildConnectOptions(true));
      expect(sid).assertEqual(INVALID_SESSION_ID);
      expect(bridge.getEvents()[0].detail).assertEqual('create failed by injection');
    });

    it('protocol_event_connect_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[1].type).assertEqual(CollabEventType.CONNECT);
      expect(events[1].sessionId).assertEqual(sid);
      expect(events[1].detail).assertEqual('connect');
    });

    it('protocol_event_send_message_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendMessage(sid, 'message_1')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_MESSAGE);
      expect(events[events.length - 1].detail).assertEqual('message_1');
    });

    it('protocol_event_send_data_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendData(sid, encodeUtf8('abc'))).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_DATA);
      expect(events[events.length - 1].detail).assertEqual('bytes=3');
    });

    it('protocol_event_accept_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token_1')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.ACCEPT);
      expect(events[events.length - 1].detail).assertEqual('token_1');
    });

    it('protocol_event_destroy_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.DESTROY);
      expect(events[events.length - 1].detail).assertEqual('destroyed');
    });

    it('protocol_event_connect_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[1].type).assertEqual(CollabEventType.CONNECT);
      expect(events[1].sessionId).assertEqual(sid);
      expect(events[1].detail).assertEqual('connect');
    });

    it('protocol_event_send_message_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendMessage(sid, 'message_2')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_MESSAGE);
      expect(events[events.length - 1].detail).assertEqual('message_2');
    });

    it('protocol_event_send_data_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendData(sid, encodeUtf8('abc'))).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_DATA);
      expect(events[events.length - 1].detail).assertEqual('bytes=3');
    });

    it('protocol_event_accept_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token_2')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.ACCEPT);
      expect(events[events.length - 1].detail).assertEqual('token_2');
    });

    it('protocol_event_destroy_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.DESTROY);
      expect(events[events.length - 1].detail).assertEqual('destroyed');
    });

    it('protocol_event_connect_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[1].type).assertEqual(CollabEventType.CONNECT);
      expect(events[1].sessionId).assertEqual(sid);
      expect(events[1].detail).assertEqual('connect');
    });

    it('protocol_event_send_message_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendMessage(sid, 'message_3')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_MESSAGE);
      expect(events[events.length - 1].detail).assertEqual('message_3');
    });

    it('protocol_event_send_data_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendData(sid, encodeUtf8('abc'))).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_DATA);
      expect(events[events.length - 1].detail).assertEqual('bytes=3');
    });

    it('protocol_event_accept_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token_3')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.ACCEPT);
      expect(events[events.length - 1].detail).assertEqual('token_3');
    });

    it('protocol_event_destroy_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.DESTROY);
      expect(events[events.length - 1].detail).assertEqual('destroyed');
    });

    it('protocol_event_connect_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[1].type).assertEqual(CollabEventType.CONNECT);
      expect(events[1].sessionId).assertEqual(sid);
      expect(events[1].detail).assertEqual('connect');
    });

    it('protocol_event_send_message_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendMessage(sid, 'message_4')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_MESSAGE);
      expect(events[events.length - 1].detail).assertEqual('message_4');
    });

    it('protocol_event_send_data_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendData(sid, encodeUtf8('abc'))).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_DATA);
      expect(events[events.length - 1].detail).assertEqual('bytes=3');
    });

    it('protocol_event_accept_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token_4')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.ACCEPT);
      expect(events[events.length - 1].detail).assertEqual('token_4');
    });

    it('protocol_event_destroy_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.DESTROY);
      expect(events[events.length - 1].detail).assertEqual('destroyed');
    });

    it('protocol_event_connect_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[1].type).assertEqual(CollabEventType.CONNECT);
      expect(events[1].sessionId).assertEqual(sid);
      expect(events[1].detail).assertEqual('connect');
    });

    it('protocol_event_send_message_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendMessage(sid, 'message_5')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_MESSAGE);
      expect(events[events.length - 1].detail).assertEqual('message_5');
    });

    it('protocol_event_send_data_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendData(sid, encodeUtf8('abc'))).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_DATA);
      expect(events[events.length - 1].detail).assertEqual('bytes=3');
    });

    it('protocol_event_accept_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token_5')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.ACCEPT);
      expect(events[events.length - 1].detail).assertEqual('token_5');
    });

    it('protocol_event_destroy_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.DESTROY);
      expect(events[events.length - 1].detail).assertEqual('destroyed');
    });

    it('protocol_event_connect_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[1].type).assertEqual(CollabEventType.CONNECT);
      expect(events[1].sessionId).assertEqual(sid);
      expect(events[1].detail).assertEqual('connect');
    });

    it('protocol_event_send_message_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendMessage(sid, 'message_6')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_MESSAGE);
      expect(events[events.length - 1].detail).assertEqual('message_6');
    });

    it('protocol_event_send_data_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendData(sid, encodeUtf8('abc'))).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_DATA);
      expect(events[events.length - 1].detail).assertEqual('bytes=3');
    });

    it('protocol_event_accept_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token_6')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.ACCEPT);
      expect(events[events.length - 1].detail).assertEqual('token_6');
    });

    it('protocol_event_destroy_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.DESTROY);
      expect(events[events.length - 1].detail).assertEqual('destroyed');
    });

    it('protocol_event_connect_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[1].type).assertEqual(CollabEventType.CONNECT);
      expect(events[1].sessionId).assertEqual(sid);
      expect(events[1].detail).assertEqual('connect');
    });

    it('protocol_event_send_message_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendMessage(sid, 'message_7')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_MESSAGE);
      expect(events[events.length - 1].detail).assertEqual('message_7');
    });

    it('protocol_event_send_data_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendData(sid, encodeUtf8('abc'))).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_DATA);
      expect(events[events.length - 1].detail).assertEqual('bytes=3');
    });

    it('protocol_event_accept_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token_7')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.ACCEPT);
      expect(events[events.length - 1].detail).assertEqual('token_7');
    });

    it('protocol_event_destroy_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.DESTROY);
      expect(events[events.length - 1].detail).assertEqual('destroyed');
    });

    it('protocol_event_connect_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[1].type).assertEqual(CollabEventType.CONNECT);
      expect(events[1].sessionId).assertEqual(sid);
      expect(events[1].detail).assertEqual('connect');
    });

    it('protocol_event_send_message_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendMessage(sid, 'message_8')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_MESSAGE);
      expect(events[events.length - 1].detail).assertEqual('message_8');
    });

    it('protocol_event_send_data_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendData(sid, encodeUtf8('abc'))).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_DATA);
      expect(events[events.length - 1].detail).assertEqual('bytes=3');
    });

    it('protocol_event_accept_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token_8')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.ACCEPT);
      expect(events[events.length - 1].detail).assertEqual('token_8');
    });

    it('protocol_event_destroy_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.DESTROY);
      expect(events[events.length - 1].detail).assertEqual('destroyed');
    });

    it('protocol_event_connect_9', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_9'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[1].type).assertEqual(CollabEventType.CONNECT);
      expect(events[1].sessionId).assertEqual(sid);
      expect(events[1].detail).assertEqual('connect');
    });

    it('protocol_event_send_message_9', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_9'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendMessage(sid, 'message_9')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_MESSAGE);
      expect(events[events.length - 1].detail).assertEqual('message_9');
    });

    it('protocol_event_send_data_9', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_9'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendData(sid, encodeUtf8('abc'))).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_DATA);
      expect(events[events.length - 1].detail).assertEqual('bytes=3');
    });

    it('protocol_event_accept_9', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_9'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token_9')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.ACCEPT);
      expect(events[events.length - 1].detail).assertEqual('token_9');
    });

    it('protocol_event_destroy_9', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_9'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.DESTROY);
      expect(events[events.length - 1].detail).assertEqual('destroyed');
    });

    it('protocol_event_connect_10', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_10'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[1].type).assertEqual(CollabEventType.CONNECT);
      expect(events[1].sessionId).assertEqual(sid);
      expect(events[1].detail).assertEqual('connect');
    });

    it('protocol_event_send_message_10', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_10'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendMessage(sid, 'message_10')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_MESSAGE);
      expect(events[events.length - 1].detail).assertEqual('message_10');
    });

    it('protocol_event_send_data_10', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_10'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendData(sid, encodeUtf8('abc'))).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_DATA);
      expect(events[events.length - 1].detail).assertEqual('bytes=3');
    });

    it('protocol_event_accept_10', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_10'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token_10')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.ACCEPT);
      expect(events[events.length - 1].detail).assertEqual('token_10');
    });

    it('protocol_event_destroy_10', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_10'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.DESTROY);
      expect(events[events.length - 1].detail).assertEqual('destroyed');
    });

    it('protocol_event_connect_11', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_11'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[1].type).assertEqual(CollabEventType.CONNECT);
      expect(events[1].sessionId).assertEqual(sid);
      expect(events[1].detail).assertEqual('connect');
    });

    it('protocol_event_send_message_11', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_11'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendMessage(sid, 'message_11')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_MESSAGE);
      expect(events[events.length - 1].detail).assertEqual('message_11');
    });

    it('protocol_event_send_data_11', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_11'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendData(sid, encodeUtf8('abc'))).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_DATA);
      expect(events[events.length - 1].detail).assertEqual('bytes=3');
    });

    it('protocol_event_accept_11', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_11'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token_11')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.ACCEPT);
      expect(events[events.length - 1].detail).assertEqual('token_11');
    });

    it('protocol_event_destroy_11', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_11'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.DESTROY);
      expect(events[events.length - 1].detail).assertEqual('destroyed');
    });

    it('protocol_event_connect_12', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_12'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[1].type).assertEqual(CollabEventType.CONNECT);
      expect(events[1].sessionId).assertEqual(sid);
      expect(events[1].detail).assertEqual('connect');
    });

    it('protocol_event_send_message_12', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_12'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendMessage(sid, 'message_12')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_MESSAGE);
      expect(events[events.length - 1].detail).assertEqual('message_12');
    });

    it('protocol_event_send_data_12', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_12'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.sendData(sid, encodeUtf8('abc'))).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.SEND_DATA);
      expect(events[events.length - 1].detail).assertEqual('bytes=3');
    });

    it('protocol_event_accept_12', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_12'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token_12')).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.ACCEPT);
      expect(events[events.length - 1].detail).assertEqual('token_12');
    });

    it('protocol_event_destroy_12', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_12'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      const events = bridge.getEvents();
      expect(events[events.length - 1].type).assertEqual(CollabEventType.DESTROY);
      expect(events[events.length - 1].detail).assertEqual('destroyed');
    });

    it('protocol_connect_idempotent_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      expect(bridge.connect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.CONNECT)).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.ERROR)).assertEqual(1);
    });

    it('protocol_disconnect_idempotent_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.disconnect(sid)).assertTrue();
      expect(bridge.disconnect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DISCONNECT)).assertEqual(2);
    });

    it('protocol_destroy_idempotent_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      expect(bridge.destroyAbilityConnectionSession(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DESTROY)).assertEqual(1);
    });

    it('protocol_accept_idempotent_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(2);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertTrue();
    });

    it('protocol_connect_idempotent_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      expect(bridge.connect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.CONNECT)).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.ERROR)).assertEqual(1);
    });

    it('protocol_disconnect_idempotent_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.disconnect(sid)).assertTrue();
      expect(bridge.disconnect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DISCONNECT)).assertEqual(2);
    });

    it('protocol_destroy_idempotent_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      expect(bridge.destroyAbilityConnectionSession(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DESTROY)).assertEqual(1);
    });

    it('protocol_accept_idempotent_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(2);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertTrue();
    });

    it('protocol_connect_idempotent_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      expect(bridge.connect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.CONNECT)).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.ERROR)).assertEqual(1);
    });

    it('protocol_disconnect_idempotent_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.disconnect(sid)).assertTrue();
      expect(bridge.disconnect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DISCONNECT)).assertEqual(2);
    });

    it('protocol_destroy_idempotent_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      expect(bridge.destroyAbilityConnectionSession(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DESTROY)).assertEqual(1);
    });

    it('protocol_accept_idempotent_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(2);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertTrue();
    });

    it('protocol_connect_idempotent_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      expect(bridge.connect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.CONNECT)).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.ERROR)).assertEqual(1);
    });

    it('protocol_disconnect_idempotent_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.disconnect(sid)).assertTrue();
      expect(bridge.disconnect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DISCONNECT)).assertEqual(2);
    });

    it('protocol_destroy_idempotent_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      expect(bridge.destroyAbilityConnectionSession(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DESTROY)).assertEqual(1);
    });

    it('protocol_accept_idempotent_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(2);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertTrue();
    });

    it('protocol_connect_idempotent_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      expect(bridge.connect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.CONNECT)).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.ERROR)).assertEqual(1);
    });

    it('protocol_disconnect_idempotent_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.disconnect(sid)).assertTrue();
      expect(bridge.disconnect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DISCONNECT)).assertEqual(2);
    });

    it('protocol_destroy_idempotent_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      expect(bridge.destroyAbilityConnectionSession(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DESTROY)).assertEqual(1);
    });

    it('protocol_accept_idempotent_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(2);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertTrue();
    });

    it('protocol_connect_idempotent_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      expect(bridge.connect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.CONNECT)).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.ERROR)).assertEqual(1);
    });

    it('protocol_disconnect_idempotent_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.disconnect(sid)).assertTrue();
      expect(bridge.disconnect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DISCONNECT)).assertEqual(2);
    });

    it('protocol_destroy_idempotent_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      expect(bridge.destroyAbilityConnectionSession(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DESTROY)).assertEqual(1);
    });

    it('protocol_accept_idempotent_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(2);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertTrue();
    });

    it('protocol_connect_idempotent_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      expect(bridge.connect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.CONNECT)).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.ERROR)).assertEqual(1);
    });

    it('protocol_disconnect_idempotent_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.disconnect(sid)).assertTrue();
      expect(bridge.disconnect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DISCONNECT)).assertEqual(2);
    });

    it('protocol_destroy_idempotent_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      expect(bridge.destroyAbilityConnectionSession(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DESTROY)).assertEqual(1);
    });

    it('protocol_accept_idempotent_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(2);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertTrue();
    });

    it('protocol_connect_idempotent_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      expect(bridge.connect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.CONNECT)).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.ERROR)).assertEqual(1);
    });

    it('protocol_disconnect_idempotent_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.disconnect(sid)).assertTrue();
      expect(bridge.disconnect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DISCONNECT)).assertEqual(2);
    });

    it('protocol_destroy_idempotent_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      expect(bridge.destroyAbilityConnectionSession(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DESTROY)).assertEqual(1);
    });

    it('protocol_accept_idempotent_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(2);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertTrue();
    });

    it('protocol_connect_idempotent_9', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_9'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      expect(bridge.connect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.CONNECT)).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.ERROR)).assertEqual(1);
    });

    it('protocol_disconnect_idempotent_9', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_9'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.disconnect(sid)).assertTrue();
      expect(bridge.disconnect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DISCONNECT)).assertEqual(2);
    });

    it('protocol_destroy_idempotent_9', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_9'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      expect(bridge.destroyAbilityConnectionSession(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DESTROY)).assertEqual(1);
    });

    it('protocol_accept_idempotent_9', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_9'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(2);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertTrue();
    });

    it('protocol_connect_idempotent_10', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_10'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      expect(bridge.connect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.CONNECT)).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.ERROR)).assertEqual(1);
    });

    it('protocol_disconnect_idempotent_10', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_10'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.disconnect(sid)).assertTrue();
      expect(bridge.disconnect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DISCONNECT)).assertEqual(2);
    });

    it('protocol_destroy_idempotent_10', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_10'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      expect(bridge.destroyAbilityConnectionSession(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DESTROY)).assertEqual(1);
    });

    it('protocol_accept_idempotent_10', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_10'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(2);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertTrue();
    });

    it('protocol_connect_idempotent_11', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_11'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      expect(bridge.connect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.CONNECT)).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.ERROR)).assertEqual(1);
    });

    it('protocol_disconnect_idempotent_11', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_11'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.disconnect(sid)).assertTrue();
      expect(bridge.disconnect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DISCONNECT)).assertEqual(2);
    });

    it('protocol_destroy_idempotent_11', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_11'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      expect(bridge.destroyAbilityConnectionSession(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DESTROY)).assertEqual(1);
    });

    it('protocol_accept_idempotent_11', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_11'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(2);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertTrue();
    });

    it('protocol_connect_idempotent_12', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_12'), buildConnectOptions(true));
      expect(bridge.connect(sid)).assertTrue();
      expect(bridge.connect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.CONNECT)).assertEqual(1);
      expect(bridge.getEventCount(CollabEventType.ERROR)).assertEqual(1);
    });

    it('protocol_disconnect_idempotent_12', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_12'), buildConnectOptions(true));
      bridge.connect(sid);
      expect(bridge.disconnect(sid)).assertTrue();
      expect(bridge.disconnect(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DISCONNECT)).assertEqual(2);
    });

    it('protocol_destroy_idempotent_12', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_12'), buildConnectOptions(true));
      expect(bridge.destroyAbilityConnectionSession(sid)).assertTrue();
      expect(bridge.destroyAbilityConnectionSession(sid)).assertFalse();
      expect(bridge.getEventCount(CollabEventType.DESTROY)).assertEqual(1);
    });

    it('protocol_accept_idempotent_12', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_12'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.acceptConnect(sid, 'token')).assertTrue();
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(2);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertTrue();
    });

    it('protocol_accept_token_0_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, '')).assertEqual(false);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
    });

    it('protocol_accept_token_0_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, '')).assertEqual(false);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
    });

    it('protocol_accept_token_0_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, '')).assertEqual(false);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
    });

    it('protocol_accept_token_0_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, '')).assertEqual(false);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
    });

    it('protocol_accept_token_0_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, '')).assertEqual(false);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
    });

    it('protocol_accept_token_0_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, '')).assertEqual(false);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
    });

    it('protocol_accept_token_0_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, '')).assertEqual(false);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
    });

    it('protocol_accept_token_0_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, '')).assertEqual(false);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(false);
      expect(session.getState()).assertEqual(SessionState.CREATED);
    });

    it('protocol_accept_token_1_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, ' ')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_1_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, ' ')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_1_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, ' ')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_1_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, ' ')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_1_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, ' ')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_1_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, ' ')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_1_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, ' ')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_1_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, ' ')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_2_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 't')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_2_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 't')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_2_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 't')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_2_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 't')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_2_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 't')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_2_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 't')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_2_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 't')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_2_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 't')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_3_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_3_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_3_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_3_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_3_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_3_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_3_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_3_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'token')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_4_1', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_1'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'ohos.dms.collabToken')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_4_2', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_2'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'ohos.dms.collabToken')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_4_3', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_3'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'ohos.dms.collabToken')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_4_4', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_4'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'ohos.dms.collabToken')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_4_5', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_5'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'ohos.dms.collabToken')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_4_6', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_6'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'ohos.dms.collabToken')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_4_7', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_7'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'ohos.dms.collabToken')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

    it('protocol_accept_token_4_8', 0, async () => {
      const bridge = new MockCollabBridge();
      const sid = bridge.createAbilityConnectionSession(COLLAB_SESSION_NAME, buildPeerInfo('device_8'), buildConnectOptions(true));
      expect(bridge.acceptConnect(sid, 'ohos.dms.collabToken')).assertEqual(true);
      expect(bridge.getEventCount(CollabEventType.ACCEPT)).assertEqual(1);
      const session = bridge.getSession(sid) as MockCollabSession;
      expect(session.isAccepted()).assertEqual(true);
      expect(session.getState()).assertEqual(SessionState.CONNECTED);
    });

