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
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Logger, LogLevel } from 'library';
import type { LogEntry, LogListener } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * Logger 日志工具类测试套件。
 * 覆盖日志级别控制、各级别记录方法、缓冲区管理、
 * 监听器机制、getLevelLabel/formatEntry 等全部公开方法。
 */
export default function LoggerTest(): void {
  describe('LoggerTest', () => {

    // ========================================
    // 日志级别控制
    // ========================================

    /**
     * @tc.number SUB_UTILS_LOGGER_0100
     * @tc.name testUtilsLogger0001
     * @tc.desc 正向: setLevel 后 getLevel 返回正确值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsLogger0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0001 begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      expect(Logger.getLevel()).assertEqual(LogLevel.DEBUG);
      Logger.setLevel(LogLevel.ERROR);
      expect(Logger.getLevel()).assertEqual(LogLevel.ERROR);
      Logger.setLevel(LogLevel.WARN);
      expect(Logger.getLevel()).assertEqual(LogLevel.WARN);
      Logger.setLevel(LogLevel.DEBUG);
    });

    // ========================================
    // 各级别日志记录方法
    // ========================================

    /**
     * @tc.number SUB_UTILS_LOGGER_0200
     * @tc.name testUtilsLogger0002
     * @tc.desc 正向: debug() 记录日志到缓冲区
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsLogger0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0002 begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      Logger.debug('debug message', 'TestTag');
      const history: LogEntry[] = Logger.getHistory();
      expect(history.length).assertLarger(0);
      const last: LogEntry = history[history.length - 1];
      expect(last.level).assertEqual(LogLevel.DEBUG);
      expect(last.message).assertEqual('debug message');
      expect(last.tag).assertEqual('TestTag');
    });

    /**
     * @tc.number SUB_UTILS_LOGGER_0300
     * @tc.name testUtilsLogger0003
     * @tc.desc 正向: info() 记录日志到缓冲区
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsLogger0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0003 begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      Logger.info('info message');
      const history: LogEntry[] = Logger.getHistory();
      expect(history.length).assertLarger(0);
      const last: LogEntry = history[history.length - 1];
      expect(last.level).assertEqual(LogLevel.INFO);
      expect(last.message).assertEqual('info message');
      expect(last.timestamp).assertLarger(0);
    });

    /**
     * @tc.number SUB_UTILS_LOGGER_0400
     * @tc.name testUtilsLogger0004
     * @tc.desc 正向: warn() 记录日志到缓冲区
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsLogger0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0004 begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      Logger.warn('warn message');
      const history: LogEntry[] = Logger.getHistory();
      expect(history.length).assertLarger(0);
      const last: LogEntry = history[history.length - 1];
      expect(last.level).assertEqual(LogLevel.WARN);
      expect(last.message).assertEqual('warn message');
    });

    /**
     * @tc.number SUB_UTILS_LOGGER_0500
     * @tc.name testUtilsLogger0005
     * @tc.desc 正向: error() 记录日志到缓冲区
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsLogger0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0005 begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      Logger.error('error message');
      const history: LogEntry[] = Logger.getHistory();
      expect(history.length).assertLarger(0);
      const last: LogEntry = history[history.length - 1];
      expect(last.level).assertEqual(LogLevel.ERROR);
      expect(last.message).assertEqual('error message');
    });

    /**
     * @tc.number SUB_UTILS_LOGGER_0600
     * @tc.name testUtilsLogger0006
     * @tc.desc 正向: fatal() 记录日志到缓冲区
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsLogger0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0006 begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      Logger.fatal('fatal message');
      const history: LogEntry[] = Logger.getHistory();
      expect(history.length).assertLarger(0);
      const last: LogEntry = history[history.length - 1];
      expect(last.level).assertEqual(LogLevel.FATAL);
      expect(last.message).assertEqual('fatal message');
    });

    // ========================================
    // 日志级别过滤
    // ========================================

    /**
     * @tc.number SUB_UTILS_LOGGER_0700
     * @tc.name testUtilsLogger0007
     * @tc.desc 正向: 低于当前级别的日志不被记录
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsLogger0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0007 begin');
      Logger.clear();
      Logger.setLevel(LogLevel.ERROR);
      Logger.debug('should be filtered');
      Logger.info('should be filtered');
      Logger.warn('should be filtered');
      expect(Logger.getBufferSize()).assertEqual(0);
      Logger.error('should be recorded');
      expect(Logger.getBufferSize()).assertEqual(1);
      expect(Logger.getHistory()[0].level).assertEqual(LogLevel.ERROR);
      Logger.setLevel(LogLevel.DEBUG);
    });

    // ========================================
    // 缓冲区管理
    // ========================================

    /**
     * @tc.number SUB_UTILS_LOGGER_0800
     * @tc.name testUtilsLogger0008
     * @tc.desc 正向: getBufferSize 反映已记录的日志条数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsLogger0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0008 begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      expect(Logger.getBufferSize()).assertEqual(0);
      Logger.info('msg1');
      Logger.info('msg2');
      Logger.info('msg3');
      expect(Logger.getBufferSize()).assertEqual(3);
      expect(Logger.getHistory().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_UTILS_LOGGER_0900
     * @tc.name testUtilsLogger0009
     * @tc.desc 正向: clear 后缓冲区归零
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsLogger0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0009 begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      Logger.info('some message');
      expect(Logger.getBufferSize()).assertLarger(0);
      Logger.clear();
      expect(Logger.getBufferSize()).assertEqual(0);
      expect(Logger.getHistory().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_UTILS_LOGGER_1000
     * @tc.name testUtilsLogger0010
     * @tc.desc 正向: getHistoryByLevel 只返回指定级别的日志
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsLogger0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0010 begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      Logger.debug('debug msg');
      Logger.info('info msg');
      Logger.warn('warn msg');
      Logger.error('error msg');
      Logger.fatal('fatal msg');
      const debugEntries: LogEntry[] = Logger.getHistoryByLevel(LogLevel.DEBUG);
      expect(debugEntries.length).assertEqual(1);
      expect(debugEntries[0].level).assertEqual(LogLevel.DEBUG);
      const errorEntries: LogEntry[] = Logger.getHistoryByLevel(LogLevel.ERROR);
      expect(errorEntries.length).assertEqual(1);
      expect(errorEntries[0].level).assertEqual(LogLevel.ERROR);
    });

    // ========================================
    // 监听器管理
    // ========================================

    /**
     * @tc.number SUB_UTILS_LOGGER_1100
     * @tc.name testUtilsLogger0011
     * @tc.desc 正向: 添加/移除监听器功能正常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsLogger0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0011 begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      let received: LogEntry | null = null;
      const listener: LogListener = {
        onLog(entry: LogEntry): void {
          received = entry;
        }
      };
      Logger.addListener(listener);
      const beforeLog: number = Date.now();
      Logger.info('listener test');
      expect(received!.message).assertEqual('listener test');
      expect(received!.level).assertEqual(LogLevel.INFO);
      expect(received!.timestamp).assertLargerOrEqual(beforeLog);
      expect(Logger.getBufferSize()).assertEqual(1);
      Logger.removeListener(listener);
      received = null;
      Logger.info('after remove');
      expect(received).assertNull();
      expect(Logger.getBufferSize()).assertEqual(2);
    });

    /**
     * @tc.number SUB_UTILS_LOGGER_1200
     * @tc.name testUtilsLogger0012
     * @tc.desc 边界: 重复添加同一监听器只注册一次
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsLogger0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0012 begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      let callCount: number = 0;
      const listener: LogListener = {
        onLog(_entry: LogEntry): void {
          callCount++;
        }
      };
      Logger.addListener(listener);
      Logger.addListener(listener);
      Logger.info('test duplicate');
      expect(callCount).assertEqual(1);
      expect(Logger.getBufferSize()).assertEqual(1);
      expect(Logger.getHistory().length).assertLarger(0);
      Logger.removeListener(listener);
      Logger.clear();
    });

    // ========================================
    // 辅助方法
    // ========================================

    /**
     * @tc.number SUB_UTILS_LOGGER_1300
     * @tc.name testUtilsLogger0013
     * @tc.desc 正向: 各日志级别对应正确的中文标签
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsLogger0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0013 begin');
      expect(Logger.getLevelLabel(LogLevel.DEBUG)).assertEqual('调试');
      expect(Logger.getLevelLabel(LogLevel.INFO)).assertEqual('信息');
      expect(Logger.getLevelLabel(LogLevel.WARN)).assertEqual('警告');
      expect(Logger.getLevelLabel(LogLevel.ERROR)).assertEqual('错误');
      expect(Logger.getLevelLabel(LogLevel.FATAL)).assertEqual('致命');
    });

    /**
     * @tc.number SUB_UTILS_LOGGER_1400
     * @tc.name testUtilsLogger0014
     * @tc.desc 正向: formatEntry 返回包含时间/级别/标签/消息的字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testUtilsLogger0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0014 begin');
      const entry: LogEntry = {
        level: LogLevel.INFO,
        tag: 'TestTag',
        message: 'Test message',
        timestamp: 1700000000000
      };
      const formatted: string = Logger.formatEntry(entry);
      expect(formatted.indexOf('信息')).assertLarger(-1);
      expect(formatted.indexOf('TestTag')).assertLarger(-1);
      expect(formatted.indexOf('Test message')).assertLarger(-1);
      expect(formatted.indexOf('[')).assertEqual(0);
    });

    /**
     * @tc.number SUB_UTILS_LOGGER_1500
     * @tc.name testUtilsLogger0015
     * @tc.desc 正向: 不传 tag 时使用默认标签
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsLogger0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsLogger0015 begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      Logger.info('no tag message');
      const history: LogEntry[] = Logger.getHistory();
      expect(history.length).assertLarger(0);
      const last: LogEntry = history[history.length - 1];
      expect(last.tag.length).assertLarger(0);
      expect(last.message).assertEqual('no tag message');
    });
  });
}
