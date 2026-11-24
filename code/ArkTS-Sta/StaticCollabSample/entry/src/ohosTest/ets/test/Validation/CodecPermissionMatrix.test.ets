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


export default function codecPermissionMatrixTest(): void {
  describe('CodecPermissionMatrix_Test', () => {
    it('codec_chinese_matrix', 0, async () => {
      expect(decodeUtf8(encodeUtf8('中'))).assertEqual('中');
      expect(decodeUtf8(encodeUtf8('中文'))).assertEqual('中文');
      expect(decodeUtf8(encodeUtf8('分布式协作'))).assertEqual('分布式协作');
      expect(decodeUtf8(encodeUtf8('你好世界'))).assertEqual('你好世界');
      expect(decodeUtf8(encodeUtf8('华为'))).assertEqual('华为');
      expect(decodeUtf8(encodeUtf8('鸿蒙系统'))).assertEqual('鸿蒙系统');
      expect(decodeUtf8(encodeUtf8('会话连接'))).assertEqual('会话连接');
      expect(decodeUtf8(encodeUtf8('设备发现'))).assertEqual('设备发现');
      expect(decodeUtf8(encodeUtf8('权限申请'))).assertEqual('权限申请');
      expect(decodeUtf8(encodeUtf8('数据同步'))).assertEqual('数据同步');
      expect(decodeUtf8(encodeUtf8('中文123'))).assertEqual('中文123');
      expect(decodeUtf8(encodeUtf8('a中b文c'))).assertEqual('a中b文c');
    });

    it('codec_emoji_matrix', 0, async () => {
      expect(decodeUtf8(encodeUtf8('😀'))).assertEqual('😀');
      expect(decodeUtf8(encodeUtf8('😀😀'))).assertEqual('😀😀');
      expect(decodeUtf8(encodeUtf8('🚀'))).assertEqual('🚀');
      expect(decodeUtf8(encodeUtf8('🎉🎊'))).assertEqual('🎉🎊');
      expect(decodeUtf8(encodeUtf8('a😀b'))).assertEqual('a😀b');
      expect(decodeUtf8(encodeUtf8('中文😀'))).assertEqual('中文😀');
      expect(decodeUtf8(encodeUtf8('👍'))).assertEqual('👍');
      expect(decodeUtf8(encodeUtf8('🔥'))).assertEqual('🔥');
    });

    it('codec_concat_1', 0, async () => {
      const chunks: ArrayBuffer[] = [];
      chunks.push(encodeUtf8('a'));
      const merged = concatBuffers(chunks);
      expect(decodeUtf8(merged)).assertEqual('a');
      expect(merged.byteLength).assertEqual(utf8ByteLength('a'));
    });

    it('codec_concat_2', 0, async () => {
      const chunks: ArrayBuffer[] = [];
      chunks.push(encodeUtf8('a'));
      chunks.push(encodeUtf8('b'));
      const merged = concatBuffers(chunks);
      expect(decodeUtf8(merged)).assertEqual('ab');
      expect(merged.byteLength).assertEqual(utf8ByteLength('ab'));
    });

    it('codec_concat_3', 0, async () => {
      const chunks: ArrayBuffer[] = [];
      chunks.push(encodeUtf8('ab'));
      chunks.push(encodeUtf8('cd'));
      chunks.push(encodeUtf8('ef'));
      const merged = concatBuffers(chunks);
      expect(decodeUtf8(merged)).assertEqual('abcdef');
      expect(merged.byteLength).assertEqual(utf8ByteLength('abcdef'));
    });

    it('codec_concat_5', 0, async () => {
      const chunks: ArrayBuffer[] = [];
      chunks.push(encodeUtf8('中'));
      chunks.push(encodeUtf8('文'));
      const merged = concatBuffers(chunks);
      expect(decodeUtf8(merged)).assertEqual('中文');
      expect(merged.byteLength).assertEqual(utf8ByteLength('中文'));
    });

    it('codec_concat_6', 0, async () => {
      const chunks: ArrayBuffer[] = [];
      chunks.push(encodeUtf8('a'));
      chunks.push(encodeUtf8('b'));
      chunks.push(encodeUtf8('c'));
      chunks.push(encodeUtf8('d'));
      chunks.push(encodeUtf8('e'));
      const merged = concatBuffers(chunks);
      expect(decodeUtf8(merged)).assertEqual('abcde');
      expect(merged.byteLength).assertEqual(utf8ByteLength('abcde'));
    });

    it('codec_concat_7', 0, async () => {
      const chunks: ArrayBuffer[] = [];
      chunks.push(encodeUtf8('123'));
      chunks.push(encodeUtf8('456'));
      chunks.push(encodeUtf8('789'));
      const merged = concatBuffers(chunks);
      expect(decodeUtf8(merged)).assertEqual('123456789');
      expect(merged.byteLength).assertEqual(utf8ByteLength('123456789'));
    });

    it('codec_concat_empty_only', 0, async () => {
      const merged = concatBuffers([]);
      expect(merged.byteLength).assertEqual(0);
      expect(decodeUtf8(merged)).assertEqual('');
    });

    it('permission_granted_0', 0, async () => {
      const items = buildPermissionItems(0);
      expect(items.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items[0].name).assertEqual('ohos.permission.CAMERA');
      expect(items[0].granted).assertEqual(false);
      expect(items[1].name).assertEqual('ohos.permission.MICROPHONE');
      expect(items[1].granted).assertEqual(false);
      expect(items[2].name).assertEqual('ohos.permission.READ_MEDIA');
      expect(items[2].granted).assertEqual(false);
      expect(items[3].name).assertEqual('ohos.permission.WRITE_MEDIA');
      expect(items[3].granted).assertEqual(false);
      expect(items[4].name).assertEqual('ohos.permission.DISTRIBUTED_DATASYNC');
      expect(items[4].granted).assertEqual(false);
    });

    it('permission_granted_1', 0, async () => {
      const items = buildPermissionItems(1);
      expect(items.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items[0].name).assertEqual('ohos.permission.CAMERA');
      expect(items[0].granted).assertEqual(true);
      expect(items[1].name).assertEqual('ohos.permission.MICROPHONE');
      expect(items[1].granted).assertEqual(false);
      expect(items[2].name).assertEqual('ohos.permission.READ_MEDIA');
      expect(items[2].granted).assertEqual(false);
      expect(items[3].name).assertEqual('ohos.permission.WRITE_MEDIA');
      expect(items[3].granted).assertEqual(false);
      expect(items[4].name).assertEqual('ohos.permission.DISTRIBUTED_DATASYNC');
      expect(items[4].granted).assertEqual(false);
    });

    it('permission_granted_2', 0, async () => {
      const items = buildPermissionItems(2);
      expect(items.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items[0].name).assertEqual('ohos.permission.CAMERA');
      expect(items[0].granted).assertEqual(true);
      expect(items[1].name).assertEqual('ohos.permission.MICROPHONE');
      expect(items[1].granted).assertEqual(true);
      expect(items[2].name).assertEqual('ohos.permission.READ_MEDIA');
      expect(items[2].granted).assertEqual(false);
      expect(items[3].name).assertEqual('ohos.permission.WRITE_MEDIA');
      expect(items[3].granted).assertEqual(false);
      expect(items[4].name).assertEqual('ohos.permission.DISTRIBUTED_DATASYNC');
      expect(items[4].granted).assertEqual(false);
    });

    it('permission_granted_3', 0, async () => {
      const items = buildPermissionItems(3);
      expect(items.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items[0].name).assertEqual('ohos.permission.CAMERA');
      expect(items[0].granted).assertEqual(true);
      expect(items[1].name).assertEqual('ohos.permission.MICROPHONE');
      expect(items[1].granted).assertEqual(true);
      expect(items[2].name).assertEqual('ohos.permission.READ_MEDIA');
      expect(items[2].granted).assertEqual(true);
      expect(items[3].name).assertEqual('ohos.permission.WRITE_MEDIA');
      expect(items[3].granted).assertEqual(false);
      expect(items[4].name).assertEqual('ohos.permission.DISTRIBUTED_DATASYNC');
      expect(items[4].granted).assertEqual(false);
    });

    it('permission_granted_4', 0, async () => {
      const items = buildPermissionItems(4);
      expect(items.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items[0].name).assertEqual('ohos.permission.CAMERA');
      expect(items[0].granted).assertEqual(true);
      expect(items[1].name).assertEqual('ohos.permission.MICROPHONE');
      expect(items[1].granted).assertEqual(true);
      expect(items[2].name).assertEqual('ohos.permission.READ_MEDIA');
      expect(items[2].granted).assertEqual(true);
      expect(items[3].name).assertEqual('ohos.permission.WRITE_MEDIA');
      expect(items[3].granted).assertEqual(true);
      expect(items[4].name).assertEqual('ohos.permission.DISTRIBUTED_DATASYNC');
      expect(items[4].granted).assertEqual(false);
    });

    it('permission_granted_5', 0, async () => {
      const items = buildPermissionItems(5);
      expect(items.length).assertEqual(REQUESTED_PERMISSIONS.length);
      expect(items[0].name).assertEqual('ohos.permission.CAMERA');
      expect(items[0].granted).assertEqual(true);
      expect(items[1].name).assertEqual('ohos.permission.MICROPHONE');
      expect(items[1].granted).assertEqual(true);
      expect(items[2].name).assertEqual('ohos.permission.READ_MEDIA');
      expect(items[2].granted).assertEqual(true);
      expect(items[3].name).assertEqual('ohos.permission.WRITE_MEDIA');
      expect(items[3].granted).assertEqual(true);
      expect(items[4].name).assertEqual('ohos.permission.DISTRIBUTED_DATASYNC');
      expect(items[4].granted).assertEqual(true);
    });

    it('permission_sensitive_0', 0, async () => {
      const items = buildPermissionItems(5);
      expect(items[0].name).assertEqual('ohos.permission.CAMERA');
      expect(items[0].sensitive).assertEqual(true);
      expect(items[0].granted).assertEqual(true);
    });

    it('permission_sensitive_1', 0, async () => {
      const items = buildPermissionItems(5);
      expect(items[1].name).assertEqual('ohos.permission.MICROPHONE');
      expect(items[1].sensitive).assertEqual(true);
      expect(items[1].granted).assertEqual(true);
    });

    it('permission_sensitive_2', 0, async () => {
      const items = buildPermissionItems(5);
      expect(items[2].name).assertEqual('ohos.permission.READ_MEDIA');
      expect(items[2].sensitive).assertEqual(true);
      expect(items[2].granted).assertEqual(true);
    });

    it('permission_sensitive_3', 0, async () => {
      const items = buildPermissionItems(5);
      expect(items[3].name).assertEqual('ohos.permission.WRITE_MEDIA');
      expect(items[3].sensitive).assertEqual(true);
      expect(items[3].granted).assertEqual(true);
    });

    it('permission_sensitive_4', 0, async () => {
      const items = buildPermissionItems(5);
      expect(items[4].name).assertEqual('ohos.permission.DISTRIBUTED_DATASYNC');
      expect(items[4].sensitive).assertEqual(false);
      expect(items[4].granted).assertEqual(true);
    });

    it('validator_session_id_matrix', 0, async () => {
      expect(isValidSessionId(-100)).assertEqual(false);
      expect(isValidSessionId(-5)).assertEqual(false);
      expect(isValidSessionId(-1)).assertEqual(false);
      expect(isValidSessionId(0)).assertEqual(true);
      expect(isValidSessionId(1)).assertEqual(true);
      expect(isValidSessionId(2)).assertEqual(true);
      expect(isValidSessionId(10)).assertEqual(true);
      expect(isValidSessionId(99)).assertEqual(true);
      expect(isValidSessionId(1000)).assertEqual(true);
    });

    it('validator_token_matrix', 0, async () => {
      expect(isValidCollabToken('')).assertEqual(false);
      expect(isValidCollabToken('a')).assertEqual(true);
      expect(isValidCollabToken('token')).assertEqual(true);
      expect(isValidCollabToken('ohos.dms.collabToken')).assertEqual(true);
      expect(isValidCollabToken(' ')).assertEqual(true);
      expect(isValidCollabToken('0')).assertEqual(true);
    });

    it('validator_normalize_undefined', 0, async () => {
      expect(normalizeCallbackMessage(undefined)).assertEqual('');
      expect(normalizeCallbackMessage('')).assertEqual('');
      expect(normalizeCallbackMessage('hello')).assertEqual('hello');
      expect(normalizeCallbackMessage('[object Object]')).assertEqual('[object Object]');
    });

    it('safe_invoke_success', 0, async () => {
      let invoked = false;
      const ok = safeInvoke(() => { invoked = true; });
      expect(ok).assertTrue();
      expect(invoked).assertTrue();
    });

    it('safe_invoke_failure', 0, async () => {
      const ok = safeInvoke(() => { throw new Error('boom'); });
      expect(ok).assertFalse();
    });

    it('safe_invoke_async_success', 0, async () => {
      const ok = await safeInvokeAsync(async () => { await delay(1); });
      expect(ok).assertTrue();
    });

    it('safe_invoke_async_failure', 0, async () => {
      const ok = await safeInvokeAsync(async () => { throw new Error('async boom'); });
      expect(ok).assertFalse();
    });

  });
}

