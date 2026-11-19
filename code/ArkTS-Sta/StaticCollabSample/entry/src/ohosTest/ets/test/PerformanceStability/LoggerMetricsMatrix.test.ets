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


export default function loggerMetricsMatrixTest(): void {
  describe('LoggerMetricsMatrix_Test', () => {
    it('logger_singleton_contract', 0, async () => {
      const a = CollabTestLogger.getInstance();
      const b = CollabTestLogger.getInstance();
      expect(a === b).assertTrue();
      a.clear();
      expect(a.size()).assertEqual(0);
      expect(a.last() === null).assertTrue();
      expect(a.contains('anything')).assertFalse();
    });

    it('logger_info_0', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('message');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('info');
      expect(last.message).assertEqual('message');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('message')).assertTrue();
    });

    it('logger_info_1', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('中文日志');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('info');
      expect(last.message).assertEqual('中文日志');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('中文日志')).assertTrue();
    });

    it('logger_info_2', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('with space');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('info');
      expect(last.message).assertEqual('with space');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('with space')).assertTrue();
    });

    it('logger_info_3', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('0');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('info');
      expect(last.message).assertEqual('0');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('0')).assertTrue();
    });

    it('logger_info_4', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('ERROR_LIKE');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('info');
      expect(last.message).assertEqual('ERROR_LIKE');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('ERROR_LIKE')).assertTrue();
    });

    it('logger_info_5', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('collab');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('info');
      expect(last.message).assertEqual('collab');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('collab')).assertTrue();
    });

    it('logger_info_6', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('negotiation');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('info');
      expect(last.message).assertEqual('negotiation');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('negotiation')).assertTrue();
    });

    it('logger_info_7', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('sync');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('info');
      expect(last.message).assertEqual('sync');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('sync')).assertTrue();
    });

    it('logger_info_8', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('payload');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('info');
      expect(last.message).assertEqual('payload');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('payload')).assertTrue();
    });

    it('logger_info_9', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('final');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('info');
      expect(last.message).assertEqual('final');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('final')).assertTrue();
    });

    it('logger_warn_0', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('message');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('warn');
      expect(last.message).assertEqual('message');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('message')).assertTrue();
    });

    it('logger_warn_1', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('中文日志');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('warn');
      expect(last.message).assertEqual('中文日志');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('中文日志')).assertTrue();
    });

    it('logger_warn_2', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('with space');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('warn');
      expect(last.message).assertEqual('with space');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('with space')).assertTrue();
    });

    it('logger_warn_3', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('0');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('warn');
      expect(last.message).assertEqual('0');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('0')).assertTrue();
    });

    it('logger_warn_4', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('ERROR_LIKE');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('warn');
      expect(last.message).assertEqual('ERROR_LIKE');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('ERROR_LIKE')).assertTrue();
    });

    it('logger_warn_5', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('collab');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('warn');
      expect(last.message).assertEqual('collab');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('collab')).assertTrue();
    });

    it('logger_warn_6', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('negotiation');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('warn');
      expect(last.message).assertEqual('negotiation');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('negotiation')).assertTrue();
    });

    it('logger_warn_7', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('sync');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('warn');
      expect(last.message).assertEqual('sync');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('sync')).assertTrue();
    });

    it('logger_warn_8', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('payload');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('warn');
      expect(last.message).assertEqual('payload');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('payload')).assertTrue();
    });

    it('logger_warn_9', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('final');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('warn');
      expect(last.message).assertEqual('final');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('final')).assertTrue();
    });

    it('logger_error_0', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.error('message');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('error');
      expect(last.message).assertEqual('message');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('message')).assertTrue();
    });

    it('logger_error_1', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.error('中文日志');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('error');
      expect(last.message).assertEqual('中文日志');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('中文日志')).assertTrue();
    });

    it('logger_error_2', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.error('with space');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('error');
      expect(last.message).assertEqual('with space');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('with space')).assertTrue();
    });

    it('logger_error_3', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.error('0');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('error');
      expect(last.message).assertEqual('0');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('0')).assertTrue();
    });

    it('logger_error_4', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.error('ERROR_LIKE');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('error');
      expect(last.message).assertEqual('ERROR_LIKE');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('ERROR_LIKE')).assertTrue();
    });

    it('logger_error_5', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.error('collab');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('error');
      expect(last.message).assertEqual('collab');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('collab')).assertTrue();
    });

    it('logger_error_6', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.error('negotiation');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('error');
      expect(last.message).assertEqual('negotiation');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('negotiation')).assertTrue();
    });

    it('logger_error_7', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.error('sync');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('error');
      expect(last.message).assertEqual('sync');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('sync')).assertTrue();
    });

    it('logger_error_8', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.error('payload');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('error');
      expect(last.message).assertEqual('payload');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('payload')).assertTrue();
    });

    it('logger_error_9', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.error('final');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('error');
      expect(last.message).assertEqual('final');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('final')).assertTrue();
    });

    it('logger_debug_0', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.debug('message');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('debug');
      expect(last.message).assertEqual('message');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('message')).assertTrue();
    });

    it('logger_debug_1', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.debug('中文日志');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('debug');
      expect(last.message).assertEqual('中文日志');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('中文日志')).assertTrue();
    });

    it('logger_debug_2', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.debug('with space');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('debug');
      expect(last.message).assertEqual('with space');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('with space')).assertTrue();
    });

    it('logger_debug_3', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.debug('0');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('debug');
      expect(last.message).assertEqual('0');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('0')).assertTrue();
    });

    it('logger_debug_4', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.debug('ERROR_LIKE');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('debug');
      expect(last.message).assertEqual('ERROR_LIKE');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('ERROR_LIKE')).assertTrue();
    });

    it('logger_debug_5', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.debug('collab');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('debug');
      expect(last.message).assertEqual('collab');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('collab')).assertTrue();
    });

    it('logger_debug_6', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.debug('negotiation');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('debug');
      expect(last.message).assertEqual('negotiation');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('negotiation')).assertTrue();
    });

    it('logger_debug_7', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.debug('sync');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('debug');
      expect(last.message).assertEqual('sync');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('sync')).assertTrue();
    });

    it('logger_debug_8', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.debug('payload');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('debug');
      expect(last.message).assertEqual('payload');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('payload')).assertTrue();
    });

    it('logger_debug_9', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.debug('final');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(0);
      const last = logger.last() as LogRecord;
      expect(last.level).assertEqual('debug');
      expect(last.message).assertEqual('final');
      expect(last.tag).assertEqual(TAG);
      expect(logger.contains('final')).assertTrue();
    });

    it('logger_level_combination_0', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      expect(logger.size()).assertEqual(0);
      expect(logger.countOf('info')).assertEqual(0);
      expect(logger.countOf('warn')).assertEqual(0);
      expect(logger.countOf('error')).assertEqual(0);
      expect(logger.countOf('debug')).assertEqual(0);
    });

    it('logger_level_combination_1', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('seq_0');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      expect(logger.countOf('error')).assertEqual(0);
      expect(logger.countOf('debug')).assertEqual(0);
    });

    it('logger_level_combination_2', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('seq_1');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(0);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      expect(logger.countOf('debug')).assertEqual(0);
    });

    it('logger_level_combination_3', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('seq_0');
      logger.warn('seq_1');
      expect(logger.size()).assertEqual(2);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      expect(logger.countOf('debug')).assertEqual(0);
    });

    it('logger_level_combination_4', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.error('seq_2');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(0);
      expect(logger.countOf('warn')).assertEqual(0);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
    });

    it('logger_level_combination_5', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('seq_0');
      logger.error('seq_2');
      expect(logger.size()).assertEqual(2);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
    });

    it('logger_level_combination_6', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('seq_1');
      logger.error('seq_2');
      expect(logger.size()).assertEqual(2);
      expect(logger.countOf('info')).assertEqual(0);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
    });

    it('logger_level_combination_7', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('seq_0');
      logger.warn('seq_1');
      logger.error('seq_2');
      expect(logger.size()).assertEqual(3);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(0);
    });

    it('logger_level_combination_8', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.debug('seq_3');
      expect(logger.size()).assertEqual(1);
      expect(logger.countOf('info')).assertEqual(0);
      expect(logger.countOf('warn')).assertEqual(0);
      expect(logger.countOf('error')).assertEqual(0);
      expect(logger.countOf('debug')).assertEqual(1);
    });

    it('logger_level_combination_9', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('seq_0');
      logger.debug('seq_3');
      expect(logger.size()).assertEqual(2);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      expect(logger.countOf('error')).assertEqual(0);
      expect(logger.countOf('debug')).assertEqual(1);
    });

    it('logger_level_combination_10', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('seq_1');
      logger.debug('seq_3');
      expect(logger.size()).assertEqual(2);
      expect(logger.countOf('info')).assertEqual(0);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      expect(logger.countOf('debug')).assertEqual(1);
    });

    it('logger_level_combination_11', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('seq_0');
      logger.warn('seq_1');
      logger.debug('seq_3');
      expect(logger.size()).assertEqual(3);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(0);
      expect(logger.countOf('debug')).assertEqual(1);
    });

    it('logger_level_combination_12', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.error('seq_2');
      logger.debug('seq_3');
      expect(logger.size()).assertEqual(2);
      expect(logger.countOf('info')).assertEqual(0);
      expect(logger.countOf('warn')).assertEqual(0);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
    });

    it('logger_level_combination_13', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('seq_0');
      logger.error('seq_2');
      logger.debug('seq_3');
      expect(logger.size()).assertEqual(3);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(0);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
    });

    it('logger_level_combination_14', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.warn('seq_1');
      logger.error('seq_2');
      logger.debug('seq_3');
      expect(logger.size()).assertEqual(3);
      expect(logger.countOf('info')).assertEqual(0);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
    });

    it('logger_level_combination_15', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('seq_0');
      logger.warn('seq_1');
      logger.error('seq_2');
      logger.debug('seq_3');
      expect(logger.size()).assertEqual(4);
      expect(logger.countOf('info')).assertEqual(1);
      expect(logger.countOf('warn')).assertEqual(1);
      expect(logger.countOf('error')).assertEqual(1);
      expect(logger.countOf('debug')).assertEqual(1);
    });

    it('logger_contains_0', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('hello world');
      logger.warn('中文日志');
      logger.error('collab error');
      expect(logger.contains('hello')).assertEqual(true);
    });

    it('logger_contains_1', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('hello world');
      logger.warn('中文日志');
      logger.error('collab error');
      expect(logger.contains('ell')).assertEqual(true);
    });

    it('logger_contains_2', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('hello world');
      logger.warn('中文日志');
      logger.error('collab error');
      expect(logger.contains('xyz')).assertEqual(false);
    });

    it('logger_contains_3', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('hello world');
      logger.warn('中文日志');
      logger.error('collab error');
      expect(logger.contains('中文')).assertEqual(true);
    });

    it('logger_contains_4', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('hello world');
      logger.warn('中文日志');
      logger.error('collab error');
      expect(logger.contains('COLLAB')).assertEqual(false);
    });

    it('logger_contains_5', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('hello world');
      logger.warn('中文日志');
      logger.error('collab error');
      expect(logger.contains('collab')).assertEqual(true);
    });

    it('logger_clear_contract', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('a');
      logger.warn('b');
      expect(logger.size()).assertEqual(2);
      logger.clear();
      expect(logger.size()).assertEqual(0);
      expect(logger.last() === null).assertTrue();
    });

    it('logger_capacity_guard', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      for (let i = 0; i < 4200; i++) {
        logger.debug('bulk_' + i);
      }
      expect(logger.size() <= 4096).assertTrue();
      expect(logger.size() > 0).assertTrue();
      expect(logger.contains('bulk_4199')).assertTrue();
    });

    it('logger_all_returns_copy', 0, async () => {
      const logger = CollabTestLogger.getInstance();
      logger.clear();
      logger.info('one');
      const snapshot = logger.all();
      expect(snapshot.length).assertEqual(1);
      snapshot.push({ level: 'info', tag: TAG, message: 'injected', timestamp: 0 });
      expect(logger.size()).assertEqual(1);
    });

    it('metrics_empty_contract', 0, async () => {
      const collector = new CollabMetricsCollector();
      const snap = collector.snapshot();
      expect(snap.operationCount).assertEqual(0);
      expect(snap.successCount).assertEqual(0);
      expect(snap.failureCount).assertEqual(0);
      expect(snap.totalCostMs).assertEqual(0);
      expect(snap.maxCostMs).assertEqual(0);
      expect(snap.minCostMs).assertEqual(-1);
      expect(collector.averageCostMs()).assertEqual(0);
      expect(collector.successRate()).assertEqual(0);
    });

    it('metrics_uniform_1', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_2', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_3', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_4', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(40);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_5', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(40);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().successCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_6', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(40);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().successCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().successCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(60);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_7', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(40);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().successCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().successCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(60);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().successCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(70);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_8', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(40);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().successCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().successCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(60);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().successCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(70);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().successCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(80);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_9', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(40);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().successCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().successCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(60);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().successCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(70);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().successCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(80);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(9);
      expect(collector.snapshot().successCount).assertEqual(9);
      expect(collector.snapshot().totalCostMs).assertEqual(90);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_10', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(40);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().successCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().successCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(60);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().successCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(70);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().successCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(80);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(9);
      expect(collector.snapshot().successCount).assertEqual(9);
      expect(collector.snapshot().totalCostMs).assertEqual(90);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(10);
      expect(collector.snapshot().successCount).assertEqual(10);
      expect(collector.snapshot().totalCostMs).assertEqual(100);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_11', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(40);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().successCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().successCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(60);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().successCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(70);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().successCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(80);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(9);
      expect(collector.snapshot().successCount).assertEqual(9);
      expect(collector.snapshot().totalCostMs).assertEqual(90);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(10);
      expect(collector.snapshot().successCount).assertEqual(10);
      expect(collector.snapshot().totalCostMs).assertEqual(100);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(11);
      expect(collector.snapshot().successCount).assertEqual(11);
      expect(collector.snapshot().totalCostMs).assertEqual(110);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_12', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(40);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().successCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().successCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(60);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().successCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(70);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().successCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(80);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(9);
      expect(collector.snapshot().successCount).assertEqual(9);
      expect(collector.snapshot().totalCostMs).assertEqual(90);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(10);
      expect(collector.snapshot().successCount).assertEqual(10);
      expect(collector.snapshot().totalCostMs).assertEqual(100);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(11);
      expect(collector.snapshot().successCount).assertEqual(11);
      expect(collector.snapshot().totalCostMs).assertEqual(110);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(12);
      expect(collector.snapshot().successCount).assertEqual(12);
      expect(collector.snapshot().totalCostMs).assertEqual(120);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_13', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(40);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().successCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().successCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(60);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().successCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(70);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().successCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(80);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(9);
      expect(collector.snapshot().successCount).assertEqual(9);
      expect(collector.snapshot().totalCostMs).assertEqual(90);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(10);
      expect(collector.snapshot().successCount).assertEqual(10);
      expect(collector.snapshot().totalCostMs).assertEqual(100);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(11);
      expect(collector.snapshot().successCount).assertEqual(11);
      expect(collector.snapshot().totalCostMs).assertEqual(110);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(12);
      expect(collector.snapshot().successCount).assertEqual(12);
      expect(collector.snapshot().totalCostMs).assertEqual(120);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(13);
      expect(collector.snapshot().successCount).assertEqual(13);
      expect(collector.snapshot().totalCostMs).assertEqual(130);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_14', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(40);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().successCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().successCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(60);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().successCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(70);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().successCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(80);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(9);
      expect(collector.snapshot().successCount).assertEqual(9);
      expect(collector.snapshot().totalCostMs).assertEqual(90);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(10);
      expect(collector.snapshot().successCount).assertEqual(10);
      expect(collector.snapshot().totalCostMs).assertEqual(100);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(11);
      expect(collector.snapshot().successCount).assertEqual(11);
      expect(collector.snapshot().totalCostMs).assertEqual(110);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(12);
      expect(collector.snapshot().successCount).assertEqual(12);
      expect(collector.snapshot().totalCostMs).assertEqual(120);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(13);
      expect(collector.snapshot().successCount).assertEqual(13);
      expect(collector.snapshot().totalCostMs).assertEqual(130);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(14);
      expect(collector.snapshot().successCount).assertEqual(14);
      expect(collector.snapshot().totalCostMs).assertEqual(140);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_uniform_15', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(10);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(20);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(40);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().successCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().successCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(60);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().successCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(70);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().successCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(80);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(9);
      expect(collector.snapshot().successCount).assertEqual(9);
      expect(collector.snapshot().totalCostMs).assertEqual(90);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(10);
      expect(collector.snapshot().successCount).assertEqual(10);
      expect(collector.snapshot().totalCostMs).assertEqual(100);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(11);
      expect(collector.snapshot().successCount).assertEqual(11);
      expect(collector.snapshot().totalCostMs).assertEqual(110);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(12);
      expect(collector.snapshot().successCount).assertEqual(12);
      expect(collector.snapshot().totalCostMs).assertEqual(120);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(13);
      expect(collector.snapshot().successCount).assertEqual(13);
      expect(collector.snapshot().totalCostMs).assertEqual(130);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(14);
      expect(collector.snapshot().successCount).assertEqual(14);
      expect(collector.snapshot().totalCostMs).assertEqual(140);
      collector.record(true, 10);
      expect(collector.snapshot().operationCount).assertEqual(15);
      expect(collector.snapshot().successCount).assertEqual(15);
      expect(collector.snapshot().totalCostMs).assertEqual(150);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(10);
      expect(collector.averageCostMs()).assertEqual(10);
      expect(collector.successRate()).assertEqual(1);
    });

    it('metrics_mixed_1', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 5);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(5);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().failureCount).assertEqual(0);
      expect(collector.snapshot().maxCostMs).assertEqual(5);
      expect(collector.snapshot().minCostMs).assertEqual(5);
      expect(Math.abs(collector.averageCostMs() - 5.0)).assertLessOrEqual(0.0001);
      expect(Math.abs(collector.successRate() - 1.0)).assertLessOrEqual(0.0001);
    });

    it('metrics_mixed_2', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 5);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(5);
      collector.record(false, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(15);
      expect(collector.snapshot().successCount).assertEqual(1);
      expect(collector.snapshot().failureCount).assertEqual(1);
      expect(collector.snapshot().maxCostMs).assertEqual(10);
      expect(collector.snapshot().minCostMs).assertEqual(5);
      expect(Math.abs(collector.averageCostMs() - 7.5)).assertLessOrEqual(0.0001);
      expect(Math.abs(collector.successRate() - 0.5)).assertLessOrEqual(0.0001);
    });

    it('metrics_mixed_3', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 5);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(5);
      collector.record(false, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(15);
      collector.record(true, 15);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().failureCount).assertEqual(1);
      expect(collector.snapshot().maxCostMs).assertEqual(15);
      expect(collector.snapshot().minCostMs).assertEqual(5);
      expect(Math.abs(collector.averageCostMs() - 10.0)).assertLessOrEqual(0.0001);
      expect(Math.abs(collector.successRate() - 0.6666666666666666)).assertLessOrEqual(0.0001);
    });

    it('metrics_mixed_4', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 5);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(5);
      collector.record(false, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(15);
      collector.record(true, 15);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(false, 20);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      expect(collector.snapshot().successCount).assertEqual(2);
      expect(collector.snapshot().failureCount).assertEqual(2);
      expect(collector.snapshot().maxCostMs).assertEqual(20);
      expect(collector.snapshot().minCostMs).assertEqual(5);
      expect(Math.abs(collector.averageCostMs() - 12.5)).assertLessOrEqual(0.0001);
      expect(Math.abs(collector.successRate() - 0.5)).assertLessOrEqual(0.0001);
    });

    it('metrics_mixed_5', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 5);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(5);
      collector.record(false, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(15);
      collector.record(true, 15);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(false, 20);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 25);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(75);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().failureCount).assertEqual(2);
      expect(collector.snapshot().maxCostMs).assertEqual(25);
      expect(collector.snapshot().minCostMs).assertEqual(5);
      expect(Math.abs(collector.averageCostMs() - 15.0)).assertLessOrEqual(0.0001);
      expect(Math.abs(collector.successRate() - 0.6)).assertLessOrEqual(0.0001);
    });

    it('metrics_mixed_6', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 5);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(5);
      collector.record(false, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(15);
      collector.record(true, 15);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(false, 20);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 25);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(75);
      collector.record(false, 30);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(105);
      expect(collector.snapshot().successCount).assertEqual(3);
      expect(collector.snapshot().failureCount).assertEqual(3);
      expect(collector.snapshot().maxCostMs).assertEqual(30);
      expect(collector.snapshot().minCostMs).assertEqual(5);
      expect(Math.abs(collector.averageCostMs() - 17.5)).assertLessOrEqual(0.0001);
      expect(Math.abs(collector.successRate() - 0.5)).assertLessOrEqual(0.0001);
    });

    it('metrics_mixed_7', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 5);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(5);
      collector.record(false, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(15);
      collector.record(true, 15);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(false, 20);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 25);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(75);
      collector.record(false, 30);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(105);
      collector.record(true, 35);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(140);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().failureCount).assertEqual(3);
      expect(collector.snapshot().maxCostMs).assertEqual(35);
      expect(collector.snapshot().minCostMs).assertEqual(5);
      expect(Math.abs(collector.averageCostMs() - 20.0)).assertLessOrEqual(0.0001);
      expect(Math.abs(collector.successRate() - 0.5714285714285714)).assertLessOrEqual(0.0001);
    });

    it('metrics_mixed_8', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 5);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(5);
      collector.record(false, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(15);
      collector.record(true, 15);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(false, 20);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 25);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(75);
      collector.record(false, 30);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(105);
      collector.record(true, 35);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(140);
      collector.record(false, 40);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(180);
      expect(collector.snapshot().successCount).assertEqual(4);
      expect(collector.snapshot().failureCount).assertEqual(4);
      expect(collector.snapshot().maxCostMs).assertEqual(40);
      expect(collector.snapshot().minCostMs).assertEqual(5);
      expect(Math.abs(collector.averageCostMs() - 22.5)).assertLessOrEqual(0.0001);
      expect(Math.abs(collector.successRate() - 0.5)).assertLessOrEqual(0.0001);
    });

    it('metrics_mixed_9', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 5);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(5);
      collector.record(false, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(15);
      collector.record(true, 15);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(false, 20);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 25);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(75);
      collector.record(false, 30);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(105);
      collector.record(true, 35);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(140);
      collector.record(false, 40);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(180);
      collector.record(true, 45);
      expect(collector.snapshot().operationCount).assertEqual(9);
      expect(collector.snapshot().totalCostMs).assertEqual(225);
      expect(collector.snapshot().successCount).assertEqual(5);
      expect(collector.snapshot().failureCount).assertEqual(4);
      expect(collector.snapshot().maxCostMs).assertEqual(45);
      expect(collector.snapshot().minCostMs).assertEqual(5);
      expect(Math.abs(collector.averageCostMs() - 25.0)).assertLessOrEqual(0.0001);
      expect(Math.abs(collector.successRate() - 0.5555555555555556)).assertLessOrEqual(0.0001);
    });

    it('metrics_mixed_10', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 5);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(5);
      collector.record(false, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(15);
      collector.record(true, 15);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(false, 20);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 25);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(75);
      collector.record(false, 30);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(105);
      collector.record(true, 35);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(140);
      collector.record(false, 40);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(180);
      collector.record(true, 45);
      expect(collector.snapshot().operationCount).assertEqual(9);
      expect(collector.snapshot().totalCostMs).assertEqual(225);
      collector.record(false, 50);
      expect(collector.snapshot().operationCount).assertEqual(10);
      expect(collector.snapshot().totalCostMs).assertEqual(275);
      expect(collector.snapshot().successCount).assertEqual(5);
      expect(collector.snapshot().failureCount).assertEqual(5);
      expect(collector.snapshot().maxCostMs).assertEqual(50);
      expect(collector.snapshot().minCostMs).assertEqual(5);
      expect(Math.abs(collector.averageCostMs() - 27.5)).assertLessOrEqual(0.0001);
      expect(Math.abs(collector.successRate() - 0.5)).assertLessOrEqual(0.0001);
    });

    it('metrics_mixed_11', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 5);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(5);
      collector.record(false, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(15);
      collector.record(true, 15);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(false, 20);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 25);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(75);
      collector.record(false, 30);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(105);
      collector.record(true, 35);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(140);
      collector.record(false, 40);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(180);
      collector.record(true, 45);
      expect(collector.snapshot().operationCount).assertEqual(9);
      expect(collector.snapshot().totalCostMs).assertEqual(225);
      collector.record(false, 50);
      expect(collector.snapshot().operationCount).assertEqual(10);
      expect(collector.snapshot().totalCostMs).assertEqual(275);
      collector.record(true, 55);
      expect(collector.snapshot().operationCount).assertEqual(11);
      expect(collector.snapshot().totalCostMs).assertEqual(330);
      expect(collector.snapshot().successCount).assertEqual(6);
      expect(collector.snapshot().failureCount).assertEqual(5);
      expect(collector.snapshot().maxCostMs).assertEqual(55);
      expect(collector.snapshot().minCostMs).assertEqual(5);
      expect(Math.abs(collector.averageCostMs() - 30.0)).assertLessOrEqual(0.0001);
      expect(Math.abs(collector.successRate() - 0.5454545454545454)).assertLessOrEqual(0.0001);
    });

    it('metrics_mixed_12', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 5);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(5);
      collector.record(false, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(15);
      collector.record(true, 15);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(false, 20);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 25);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(75);
      collector.record(false, 30);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(105);
      collector.record(true, 35);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(140);
      collector.record(false, 40);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(180);
      collector.record(true, 45);
      expect(collector.snapshot().operationCount).assertEqual(9);
      expect(collector.snapshot().totalCostMs).assertEqual(225);
      collector.record(false, 50);
      expect(collector.snapshot().operationCount).assertEqual(10);
      expect(collector.snapshot().totalCostMs).assertEqual(275);
      collector.record(true, 55);
      expect(collector.snapshot().operationCount).assertEqual(11);
      expect(collector.snapshot().totalCostMs).assertEqual(330);
      collector.record(false, 60);
      expect(collector.snapshot().operationCount).assertEqual(12);
      expect(collector.snapshot().totalCostMs).assertEqual(390);
      expect(collector.snapshot().successCount).assertEqual(6);
      expect(collector.snapshot().failureCount).assertEqual(6);
      expect(collector.snapshot().maxCostMs).assertEqual(60);
      expect(collector.snapshot().minCostMs).assertEqual(5);
      expect(Math.abs(collector.averageCostMs() - 32.5)).assertLessOrEqual(0.0001);
      expect(Math.abs(collector.successRate() - 0.5)).assertLessOrEqual(0.0001);
    });

    it('metrics_mixed_13', 0, async () => {
      const collector = new CollabMetricsCollector();
      collector.record(true, 5);
      expect(collector.snapshot().operationCount).assertEqual(1);
      expect(collector.snapshot().totalCostMs).assertEqual(5);
      collector.record(false, 10);
      expect(collector.snapshot().operationCount).assertEqual(2);
      expect(collector.snapshot().totalCostMs).assertEqual(15);
      collector.record(true, 15);
      expect(collector.snapshot().operationCount).assertEqual(3);
      expect(collector.snapshot().totalCostMs).assertEqual(30);
      collector.record(false, 20);
      expect(collector.snapshot().operationCount).assertEqual(4);
      expect(collector.snapshot().totalCostMs).assertEqual(50);
      collector.record(true, 25);
      expect(collector.snapshot().operationCount).assertEqual(5);
      expect(collector.snapshot().totalCostMs).assertEqual(75);
      collector.record(false, 30);
      expect(collector.snapshot().operationCount).assertEqual(6);
      expect(collector.snapshot().totalCostMs).assertEqual(105);
      collector.record(true, 35);
      expect(collector.snapshot().operationCount).assertEqual(7);
      expect(collector.snapshot().totalCostMs).assertEqual(140);
      collector.record(false, 40);
      expect(collector.snapshot().operationCount).assertEqual(8);
      expect(collector.snapshot().totalCostMs).assertEqual(180);
      collector.record(true, 45);
      expect(collector.snapshot().operationCount).assertEqual(9);
      expect(collector.snapshot().totalCostMs).assertEqual(225);
      collector.record(false, 50);
      expect(collector.snapshot().operationCount).assertEqual(10);
      expect(collector.snapshot().totalCostMs).assertEqual(275);
      collector.record(true, 55);
      expect(collector.snapshot().operationCount).assertEqual(11);
      expect(collector.snapshot().totalCostMs).assertEqual(330);
      collector.record(false, 60);
      expect(collector.snapshot().operationCount).assertEqual(12);
      expect(collector.snapshot().totalCostMs).assertEqual(390);
      collector.record(true, 65);
      expect(collector.snapshot().operationCount).assertEqual(13);
      expect(collector.snapshot().totalCostMs).assertEqual(455);
      expect(collector.snapshot().successCount).assertEqual(7);
      expect(collector.snapshot().failureCount).assertEqual(6);
