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


// 数据分片描述：描述一段二进制数据的分片信息
interface DataChunk {
  index: number;
  size: number;
  content: string;
}

// 数据分片器：将长文本按固定步长切分为分片
class DataChunker {
  private stride: number;

  constructor(stride: number) {
    this.stride = stride;
  }

  public chunk(text: string): DataChunk[] {
    const chunks: DataChunk[] = [];
    let offset: number = 0;
    let idx: number = 0;
    while (offset < text.length) {
      const end: number = Math.min(offset + this.stride, text.length);
      chunks.push({
        index: idx,
        size: end - offset,
        content: text.substring(offset, end)
      });
      idx++;
      offset = end;
    }
    return chunks;
  }
}

// 字节长度计算器：统一封装 UTF-8 字节长度计算
class ByteLengthCounter {
  public count(text: string): number {
    return utf8ByteLength(text);
  }
}
export default function collabInputInteractionTest() {
  describe('CollabInputInteraction_Test', () => {
    it('case_codec_0', 0, async () => {
      const src0 = mockPayload(16);
      const enc0 = encodeUtf8(src0);
      const dec0 = decodeUtf8(enc0);
      expect(dec0).assertEqual(src0);
      expect(utf8ByteLength(src0)).assertEqual(enc0.byteLength);
    });

    it('case_concat_1', 0, async () => {
      const a1 = encodeUtf8('hello');
      const b1 = encodeUtf8('world');
      const m1 = concatBuffers([a1, b1]);
      expect(decodeUtf8(m1)).assertEqual('helloworld');
    });

    it('case_send_data_2', 0, async () => {
      const b2 = new MockCollabBridge();
      const p2 = buildPeerInfo('device_2');
      const o2 = buildConnectOptions(true);
      const sid2 = b2.createAbilityConnectionSession(COLLAB_SESSION_NAME, p2, o2);
      b2.connect(sid2);
      expect(b2.sendData(sid2, encodeUtf8(DATA_PAYLOAD))).assertTrue();
      const s2 = b2.getSession(sid2);
      if (s2 !== null) {
        expect(s2.getDataCount()).assertEqual(1);
      }
    });

    it('case_codec_3', 0, async () => {
      const src3 = mockPayload(19);
      const enc3 = encodeUtf8(src3);
      const dec3 = decodeUtf8(enc3);
      expect(dec3).assertEqual(src3);
      expect(utf8ByteLength(src3)).assertEqual(enc3.byteLength);
    });

    it('case_concat_4', 0, async () => {
      const a4 = encodeUtf8('hello');
      const b4 = encodeUtf8('world');
      const m4 = concatBuffers([a4, b4]);
      expect(decodeUtf8(m4)).assertEqual('helloworld');
    });

    it('case_send_data_5', 0, async () => {
      const b5 = new MockCollabBridge();
      const p5 = buildPeerInfo('device_5');
      const o5 = buildConnectOptions(true);
      const sid5 = b5.createAbilityConnectionSession(COLLAB_SESSION_NAME, p5, o5);
      b5.connect(sid5);
      expect(b5.sendData(sid5, encodeUtf8(DATA_PAYLOAD))).assertTrue();
      const s5 = b5.getSession(sid5);
      if (s5 !== null) {
        expect(s5.getDataCount()).assertEqual(1);
      }
    });

    it('case_codec_6', 0, async () => {
      const src6 = mockPayload(22);
      const enc6 = encodeUtf8(src6);
      const dec6 = decodeUtf8(enc6);
      expect(dec6).assertEqual(src6);
      expect(utf8ByteLength(src6)).assertEqual(enc6.byteLength);
    });

    it('case_concat_7', 0, async () => {
      const a7 = encodeUtf8('hello');
      const b7 = encodeUtf8('world');
      const m7 = concatBuffers([a7, b7]);
      expect(decodeUtf8(m7)).assertEqual('helloworld');
    });

    it('case_extra_8', 0, async () => {
      const b8 = new MockCollabBridge();
      const p8 = buildPeerInfo('device_8');
      const o8 = buildConnectOptions(true);
      const a8 = b8.createAbilityConnectionSession(COLLAB_SESSION_NAME, p8, o8);
      const c8 = b8.createAbilityConnectionSession(COLLAB_SESSION_NAME, p8, o8);
      expect(a8).assertLargerOrEqual(0);
      expect(c8).assertEqual(a8 + 1);
    });

  });

}
