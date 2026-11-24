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
  MockCollabBridge,
  MockCollabSession,
  PeerInfoModel,
  ConnectOptionsModel,
  AppStorageModel,
  CollabEventRecorder,
  SessionIdGenerator,
  MockDeviceManager,
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
  STATUS_CONNECT_SUCCESS,
  STATUS_CONNECT_FAILED,
  STATUS_NO_DEVICE,
  STATUS_CREATE_FAILED,
  STATUS_INVALID_SESSION,
  STATUS_NOT_CONNECTED,
  STATUS_SESSION_DESTROYED,
  TEXT_ENCODING,
} from '../Shared/CollabTestDriver';


// 协作操作状态：描述一次协作操作请求的处理阶段
enum OpStatus {
  STATUS_QUEUED = 'queued',
  STATUS_RUNNING = 'running',
  STATUS_COMPLETED = 'completed',
  STATUS_FAILED = 'failed',
  STATUS_CANCELLED = 'cancelled'
}

// 协作操作类别：分类会话操作
enum CollabOpKind {
  KIND_CREATE = 'create',
  KIND_CONNECT = 'connect',
  KIND_DISCONNECT = 'disconnect',
  KIND_DESTROY = 'destroy'
}

// 协作操作请求：描述一次会话操作请求的完整上下文
interface CollabOpRequest {
  requestId: string;
  kind: CollabOpKind;
  status: OpStatus;
  sessionId: number;
}

// 操作队列：以先进先出方式管理待执行的会话操作
class CollabOpQueue {
  private requests: CollabOpRequest[] = [];

  public enqueue(request: CollabOpRequest): void {
    this.requests.push(request);
  }

  public dequeue(): CollabOpRequest | null {
    if (this.requests.length === 0) {
      return null;
    }
    return this.requests.shift() as CollabOpRequest;
  }

  public peek(): CollabOpRequest | null {
    if (this.requests.length === 0) {
      return null;
    }
    return this.requests[0];
  }

  public size(): number {
    return this.requests.length;
  }

  public clear(): void {
    this.requests = [];
  }
}

// 协作操作统计：汇总各类操作的次数
class CollabOpStats {
  private createCount: number = 0;
  private connectCount: number = 0;
  private disconnectCount: number = 0;
  private destroyCount: number = 0;

  public record(kind: CollabOpKind): void {
    if (kind === CollabOpKind.KIND_CREATE) {
      this.createCount++;
    } else if (kind === CollabOpKind.KIND_CONNECT) {
      this.connectCount++;
    } else if (kind === CollabOpKind.KIND_DISCONNECT) {
      this.disconnectCount++;
    } else {
      this.destroyCount++;
    }
  }

  public total(): number {
    return this.createCount + this.connectCount + this.disconnectCount + this.destroyCount;
  }

  public getCreateCount(): number {
    return this.createCount;
  }

  public getConnectCount(): number {
    return this.connectCount;
  }

  public getDisconnectCount(): number {
    return this.disconnectCount;
  }

  public getDestroyCount(): number {
    return this.destroyCount;
  }

  public isBalanced(): boolean {
    return this.createCount >= this.destroyCount;
  }
}
export default function collabOperationFlowTest() {
  describe('CollabOperationFlow_Test', () => {
    it('case_create_id_0', 0, async () => {
      const b0 = new MockCollabBridge();
      const p0 = buildPeerInfo('device_0');
      const o0 = buildConnectOptions(true);
      const a0 = b0.createAbilityConnectionSession(COLLAB_SESSION_NAME, p0, o0);
      const c0 = b0.createAbilityConnectionSession(COLLAB_SESSION_NAME, p0, o0);
      expect(a0).assertLargerOrEqual(0);
      expect(c0).assertEqual(a0 + 1);
    });

    it('case_connect_1', 0, async () => {
      const b1 = new MockCollabBridge();
      const p1 = buildPeerInfo('device_1');
      const o1 = buildConnectOptions(true);
      const sid1 = b1.createAbilityConnectionSession(COLLAB_SESSION_NAME, p1, o1);
      expect(b1.connect(sid1)).assertTrue();
      const s1 = b1.getSession(sid1);
      expect(s1 !== null).assertTrue();
    });

    it('case_send_message_2', 0, async () => {
      const b2 = new MockCollabBridge();
      const p2 = buildPeerInfo('device_2');
      const o2 = buildConnectOptions(true);
      const sid2 = b2.createAbilityConnectionSession(COLLAB_SESSION_NAME, p2, o2);
      b2.connect(sid2);
      expect(b2.sendMessage(sid2, MESSAGE_HELLO)).assertTrue();
      const s2 = b2.getSession(sid2);
      if (s2 !== null) {
        expect(s2.getMessageCount()).assertEqual(1);
      }
    });

    it('case_disconnect_destroy_3', 0, async () => {
      const b3 = new MockCollabBridge();
      const p3 = buildPeerInfo('device_3');
      const o3 = buildConnectOptions(true);
      const sid3 = b3.createAbilityConnectionSession(COLLAB_SESSION_NAME, p3, o3);
      b3.connect(sid3);
      expect(b3.disconnect(sid3)).assertTrue();
      expect(b3.destroyAbilityConnectionSession(sid3)).assertTrue();
      const s3 = b3.getSession(sid3);
      if (s3 !== null) {
        expect(s3.isDestroyed()).assertTrue();
      }
    });

    it('case_connect_5', 0, async () => {
      const b5 = new MockCollabBridge();
      const p5 = buildPeerInfo('device_5');
      const o5 = buildConnectOptions(true);
      const sid5 = b5.createAbilityConnectionSession(COLLAB_SESSION_NAME, p5, o5);
      expect(b5.connect(sid5)).assertTrue();
      const s5 = b5.getSession(sid5);
      expect(s5 !== null).assertTrue();
    });

    it('case_send_message_6', 0, async () => {
      const b6 = new MockCollabBridge();
      const p6 = buildPeerInfo('device_6');
      const o6 = buildConnectOptions(true);
      const sid6 = b6.createAbilityConnectionSession(COLLAB_SESSION_NAME, p6, o6);
      b6.connect(sid6);
      expect(b6.sendMessage(sid6, MESSAGE_HELLO)).assertTrue();
      const s6 = b6.getSession(sid6);
      if (s6 !== null) {
        expect(s6.getMessageCount()).assertEqual(1);
      }
    });

    it('case_disconnect_destroy_7', 0, async () => {
      const b7 = new MockCollabBridge();
      const p7 = buildPeerInfo('device_7');
      const o7 = buildConnectOptions(true);
      const sid7 = b7.createAbilityConnectionSession(COLLAB_SESSION_NAME, p7, o7);
      b7.connect(sid7);
      expect(b7.disconnect(sid7)).assertTrue();
      expect(b7.destroyAbilityConnectionSession(sid7)).assertTrue();
      const s7 = b7.getSession(sid7);
      if (s7 !== null) {
        expect(s7.isDestroyed()).assertTrue();
      }
    });

  });

}
