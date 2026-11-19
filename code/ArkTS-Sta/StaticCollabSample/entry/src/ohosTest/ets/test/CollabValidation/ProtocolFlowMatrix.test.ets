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
