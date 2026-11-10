/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { BluetoothConstants, Logger, LogLevel } from 'library';
import type { LogEntry, LogListener } from 'library';

/**
 * Collector that records every notified log entry for assertions.
 */
class RecordingListener implements LogListener {
  public entries: LogEntry[] = [];

  onLog(entry: LogEntry): void {
    this.entries.push(entry);
  }
}

/**
 * Collector whose callback throws to exercise the listener error guard.
 */
class ThrowingListener implements LogListener {
  public calls: number = 0;

  onLog(entry: LogEntry): void {
    this.calls = this.calls + 1;
    throw new Error('listener failure');
  }
}

/**
 * Test suite for Logger.
 * @since 26.0.0
 */
export default function loggerTest(): void {
  describe('LoggerTest', () => {
    // ==================== 级别阈值（4 条） ====================

    /*
     * @tc.number: SUB_LOGGER_0100
     * @tc.name: testLogger0001
     * @tc.desc: Store every level while the threshold stays at DEBUG.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0001', 0, () => {
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      expect(Logger.getLevel()).assertEqual(LogLevel.DEBUG);
      Logger.debug('d0');
      Logger.info('i0');
      Logger.warn('w0');
      Logger.error('e0');
      Logger.fatal('f0');
      expect(Logger.getBufferSize()).assertEqual(5);
      expect(Logger.getHistory().length).assertEqual(5);
      expect(Logger.getHistory()[0].level).assertEqual(LogLevel.DEBUG);
      expect(Logger.getHistory()[4].level).assertEqual(LogLevel.FATAL);
    });

    /*
     * @tc.number: SUB_LOGGER_0200
     * @tc.name: testLogger0002
     * @tc.desc: Drop entries below the WARN threshold.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0002', 0, () => {
      Logger.clear();
      Logger.setLevel(LogLevel.WARN);
      Logger.debug('filtered');
      Logger.info('filtered');
      expect(Logger.getBufferSize()).assertEqual(0);
      expect(Logger.getHistory().length).assertEqual(0);
      Logger.warn('kept');
      expect(Logger.getBufferSize()).assertEqual(1);
      expect(Logger.getHistory()[0].message).assertEqual('kept');
      expect(Logger.getLevel()).assertEqual(LogLevel.WARN);
    });

    /*
     * @tc.number: SUB_LOGGER_0300
     * @tc.name: testLogger0003
     * @tc.desc: Keep only fatal entries when the threshold is FATAL.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0003', 0, () => {
      Logger.clear();
      Logger.setLevel(LogLevel.FATAL);
      Logger.debug('a');
      Logger.info('b');
      Logger.warn('c');
      Logger.error('d');
      expect(Logger.getBufferSize()).assertEqual(0);
      Logger.fatal('only fatal');
      expect(Logger.getBufferSize()).assertEqual(1);
      expect(Logger.getHistoryByLevel(LogLevel.ERROR).length).assertEqual(0);
      expect(Logger.getHistoryByLevel(LogLevel.FATAL).length).assertEqual(1);
    });

    /*
     * @tc.number: SUB_LOGGER_0400
     * @tc.name: testLogger0004
     * @tc.desc: Recheck the level threshold while the history is preserved.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0004', 0, () => {
      Logger.clear();
      Logger.setLevel(LogLevel.ERROR);
      Logger.info('dropped');
      Logger.error('stored');
      expect(Logger.getBufferSize()).assertEqual(1);
      Logger.setLevel(LogLevel.DEBUG);
      Logger.debug('added');
      expect(Logger.getBufferSize()).assertEqual(2);
      expect(Logger.getHistory()[0].message).assertEqual('stored');
      expect(Logger.getHistory()[1].message).assertEqual('added');
      expect(Logger.getLevel()).assertEqual(LogLevel.DEBUG);
    });

    // ==================== 条目内容（3 条） ====================

    /*
     * @tc.number: SUB_LOGGER_0500
     * @tc.name: testLogger0005
     * @tc.desc: Fall back to the sample tag when no tag is supplied.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0005', 0, () => {
      Logger.clear();
      const before: number = Date.now();
      Logger.info('plain message');
      const entry: LogEntry = Logger.getHistory()[0];
      expect(entry.tag).assertEqual(BluetoothConstants.TAG);
      expect(entry.message).assertEqual('plain message');
      expect(entry.level).assertEqual(LogLevel.INFO);
      expect(entry.timestamp >= before).assertTrue();
    });

    /*
     * @tc.number: SUB_LOGGER_0600
     * @tc.name: testLogger0006
     * @tc.desc: Override the tag with the caller supplied value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0006', 0, () => {
      Logger.clear();
      Logger.debug('scan started', 'A2dpScan');
      Logger.warn('scan slow', 'A2dpScan');
      const history: LogEntry[] = Logger.getHistory();
      expect(history.length).assertEqual(2);
      expect(history[0].tag).assertEqual('A2dpScan');
      expect(history[1].tag).assertEqual('A2dpScan');
      expect(history[0].tag !== BluetoothConstants.TAG).assertTrue();
      expect(history[1].level).assertEqual(LogLevel.WARN);
    });

    /*
     * @tc.number: SUB_LOGGER_0700
     * @tc.name: testLogger0007
     * @tc.desc: Record empty and long messages without altering the text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0007', 0, () => {
      Logger.clear();
      const longText: string = 'x'.repeat(300);
      Logger.info('');
      Logger.info(longText);
      const history: LogEntry[] = Logger.getHistory();
      expect(history.length).assertEqual(2);
      expect(history[0].message.length).assertEqual(0);
      expect(history[1].message.length).assertEqual(300);
      expect(history[1].message.startsWith('xxx')).assertTrue();
    });

    // ==================== 级别筛选（2 条） ====================

    /*
     * @tc.number: SUB_LOGGER_0800
     * @tc.name: testLogger0008
     * @tc.desc: Filter the history by each individual level.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0008', 0, () => {
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      Logger.debug('d');
      Logger.debug('d2');
      Logger.info('i');
      Logger.error('e');
      expect(Logger.getHistoryByLevel(LogLevel.DEBUG).length).assertEqual(2);
      expect(Logger.getHistoryByLevel(LogLevel.INFO).length).assertEqual(1);
      expect(Logger.getHistoryByLevel(LogLevel.INFO)[0].message).assertEqual('i');
      expect(Logger.getHistoryByLevel(LogLevel.ERROR).length).assertEqual(1);
      expect(Logger.getHistoryByLevel(LogLevel.WARN).length).assertEqual(0);
    });

    /*
     * @tc.number: SUB_LOGGER_0900
     * @tc.name: testLogger0009
     * @tc.desc: Return an empty selection for a level never logged.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0009', 0, () => {
      Logger.clear();
      Logger.fatal('boom');
      const empty: LogEntry[] = Logger.getHistoryByLevel(LogLevel.DEBUG);
      expect(empty.length).assertEqual(0);
      expect(Array.isArray(empty)).assertTrue();
      expect(Logger.getHistoryByLevel(LogLevel.FATAL).length).assertEqual(1);
      expect(Logger.getBufferSize()).assertEqual(1);
    });

    // ==================== 缓冲区容量（3 条） ====================

    /*
     * @tc.number: SUB_LOGGER_1000
     * @tc.name: testLogger0010
     * @tc.desc: Grow the ring buffer one entry at a time below its capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0010', 0, () => {
      Logger.clear();
      expect(Logger.getBufferSize()).assertEqual(0);
      for (let i: number = 0; i < 50; i++) {
        Logger.info(`batch-${i}`);
      }
      expect(Logger.getBufferSize()).assertEqual(50);
      const history: LogEntry[] = Logger.getHistory();
      expect(history.length).assertEqual(50);
      expect(history[49].message).assertEqual('batch-49');
      expect(history[0].message).assertEqual('batch-0');
    });

    /*
     * @tc.number: SUB_LOGGER_1100
     * @tc.name: testLogger0011
     * @tc.desc: Cap the stored entries at the thousand entry limit.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0011', 0, () => {
      Logger.clear();
      for (let i: number = 0; i < 1005; i++) {
        Logger.info(`over-${i}`);
      }
      expect(Logger.getBufferSize()).assertEqual(1000);
      const history: LogEntry[] = Logger.getHistory();
      expect(history.length).assertEqual(1000);
      expect(history[0].message).assertEqual('over-5');
      expect(history[999].message).assertEqual('over-1004');
    });

    /*
     * @tc.number: SUB_LOGGER_1200
     * @tc.name: testLogger0012
     * @tc.desc: Hand back a copy so the history cannot be mutated in place.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0012', 0, () => {
      Logger.clear();
      Logger.info('immutable');
      const first: LogEntry[] = Logger.getHistory();
      first.push(first[0]);
      const second: LogEntry[] = Logger.getHistory();
      expect(second.length).assertEqual(1);
      expect(first.length).assertEqual(2);
      expect(second[0].message).assertEqual('immutable');
      expect(second !== first).assertTrue();
    });

    // ==================== 清空（2 条） ====================

    /*
     * @tc.number: SUB_LOGGER_1300
     * @tc.name: testLogger0013
     * @tc.desc: Drop all buffered entries when the buffer is cleared.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0013', 0, () => {
      Logger.clear();
      Logger.info('one');
      Logger.error('two');
      expect(Logger.getBufferSize()).assertEqual(2);
      Logger.clear();
      expect(Logger.getBufferSize()).assertEqual(0);
      expect(Logger.getHistory().length).assertEqual(0);
      expect(Logger.getHistoryByLevel(LogLevel.INFO).length).assertEqual(0);
    });

    /*
     * @tc.number: SUB_LOGGER_1400
     * @tc.name: testLogger0014
     * @tc.desc: Detach listeners and restart the buffer position on clear.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0014', 0, () => {
      Logger.clear();
      const listener: RecordingListener = new RecordingListener();
      Logger.addListener(listener);
      Logger.info('notified');
      expect(listener.entries.length).assertEqual(1);
      Logger.clear();
      Logger.info('after clear');
      expect(listener.entries.length).assertEqual(1);
      expect(Logger.getBufferSize()).assertEqual(1);
      expect(Logger.getHistory()[0].message).assertEqual('after clear');
    });

    /*
     * @tc.number: SUB_LOGGER_1500
     * @tc.name: testLogger0015
     * @tc.desc: Keep the level threshold after the buffer has been cleared.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0015', 0, () => {
      Logger.clear();
      Logger.setLevel(LogLevel.ERROR);
      Logger.error('kept');
      Logger.clear();
      expect(Logger.getLevel()).assertEqual(LogLevel.ERROR);
      Logger.info('dropped');
      expect(Logger.getBufferSize()).assertEqual(0);
      Logger.error('kept again');
      expect(Logger.getBufferSize()).assertEqual(1);
      expect(Logger.getHistory()[0].level).assertEqual(LogLevel.ERROR);
      Logger.setLevel(LogLevel.DEBUG);
    });

    // ==================== 监听器（4 条） ====================

    /*
     * @tc.number: SUB_LOGGER_1600
     * @tc.name: testLogger0016
     * @tc.desc: Notify a registered listener with the recorded entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0016', 0, () => {
      Logger.clear();
      const listener: RecordingListener = new RecordingListener();
      Logger.addListener(listener);
      Logger.warn('pairing failed', 'HfpPair');
      expect(listener.entries.length).assertEqual(1);
      expect(listener.entries[0].message).assertEqual('pairing failed');
      expect(listener.entries[0].tag).assertEqual('HfpPair');
      expect(listener.entries[0].level).assertEqual(LogLevel.WARN);
      Logger.removeListener(listener);
    });

    /*
     * @tc.number: SUB_LOGGER_1700
     * @tc.name: testLogger0017
     * @tc.desc: Ignore a duplicated listener registration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0017', 0, () => {
      Logger.clear();
      const listener: RecordingListener = new RecordingListener();
      Logger.addListener(listener);
      Logger.addListener(listener);
      Logger.info('once');
      expect(listener.entries.length).assertEqual(1);
      expect(Logger.getBufferSize()).assertEqual(1);
      Logger.removeListener(listener);
      Logger.info('still filtered out');
      expect(listener.entries.length).assertEqual(1);
    });

    /*
     * @tc.number: SUB_LOGGER_1800
     * @tc.name: testLogger0018
     * @tc.desc: Notify several listeners in registration order.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0018', 0, () => {
      Logger.clear();
      const order: string[] = [];
      const first: LogListener = {
        onLog: (entry: LogEntry): void => {
          order.push(`first-${entry.message}`);
        }
      };
      const second: LogListener = {
        onLog: (entry: LogEntry): void => {
          order.push(`second-${entry.message}`);
        }
      };
      Logger.addListener(first);
      Logger.addListener(second);
      Logger.info('evt');
      expect(order.length).assertEqual(2);
      expect(order[0]).assertEqual('first-evt');
      expect(order[1]).assertEqual('second-evt');
      expect(Logger.getBufferSize()).assertEqual(1);
      Logger.removeListener(first);
      Logger.removeListener(second);
    });

    /*
     * @tc.number: SUB_LOGGER_1900
     * @tc.name: testLogger0019
     * @tc.desc: Swallow a throwing listener and keep logging afterwards.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0019', 0, () => {
      Logger.clear();
      const failing: ThrowingListener = new ThrowingListener();
      const watcher: RecordingListener = new RecordingListener();
      Logger.addListener(failing);
      Logger.addListener(watcher);
      Logger.error('with failure');
      expect(failing.calls).assertEqual(1);
      expect(watcher.entries.length).assertEqual(1);
      expect(Logger.getBufferSize()).assertEqual(1);
      Logger.info('next entry');
      expect(failing.calls).assertEqual(2);
      expect(watcher.entries.length).assertEqual(2);
      expect(Logger.getBufferSize()).assertEqual(2);
      Logger.removeListener(failing);
      Logger.removeListener(watcher);
    });

    /*
     * @tc.number: SUB_LOGGER_2000
     * @tc.name: testLogger0020
     * @tc.desc: Skip entries filtered by the level without notifying listeners.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0020', 0, () => {
      Logger.clear();
      Logger.setLevel(LogLevel.ERROR);
      const listener: RecordingListener = new RecordingListener();
      Logger.addListener(listener);
      Logger.debug('silent');
      Logger.info('silent');
      expect(listener.entries.length).assertEqual(0);
      expect(Logger.getBufferSize()).assertEqual(0);
      Logger.fatal('loud');
      expect(listener.entries.length).assertEqual(1);
      expect(listener.entries[0].level).assertEqual(LogLevel.FATAL);
      Logger.removeListener(listener);
      Logger.setLevel(LogLevel.DEBUG);
    });

    // ==================== 级别标签与条目格式化（3 条） ====================

    /*
     * @tc.number: SUB_LOGGER_2100
     * @tc.name: testLogger0021
     * @tc.desc: Map every level to its uppercase label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0021', 0, () => {
      expect(Logger.getLevelLabel(LogLevel.DEBUG)).assertEqual('DEBUG');
      expect(Logger.getLevelLabel(LogLevel.INFO)).assertEqual('INFO');
      expect(Logger.getLevelLabel(LogLevel.WARN)).assertEqual('WARN');
      expect(Logger.getLevelLabel(LogLevel.ERROR)).assertEqual('ERROR');
      expect(Logger.getLevelLabel(LogLevel.FATAL)).assertEqual('FATAL');
      expect(Logger.getLevelLabel(99)).assertEqual('UNKNOWN');
    });

    /*
     * @tc.number: SUB_LOGGER_2200
     * @tc.name: testLogger0022
     * @tc.desc: Format an entry as timestamp, level, tag and message fields.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0022', 0, () => {
      Logger.clear();
      Logger.info('connected');
      const entry: LogEntry = Logger.getHistory()[0];
      const text: string = Logger.formatEntry(entry);
      expect(text.startsWith('[20')).assertTrue();
      expect(text.indexOf('[INFO] [') >= 0).assertTrue();
      expect(text.endsWith('] connected')).assertTrue();
      expect(text.length > entry.message.length + 20).assertTrue();
    });

    /*
     * @tc.number: SUB_LOGGER_2300
     * @tc.name: testLogger0023
     * @tc.desc: Build the padded timestamp of a hand crafted entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0023', 0, () => {
      const early: Date = new Date(2024, 1, 3, 4, 5, 6, 0);
      const entry: LogEntry = {
        level: LogLevel.WARN,
        tag: 'PanNet',
        message: 'route changed',
        timestamp: early.getTime()
      };
      const text: string = Logger.formatEntry(entry);
      expect(text).assertEqual('[2024-02-03 04:05:06] [WARN] [PanNet] route changed');
      expect(text.charAt(11)).assertEqual(' ');
      expect(text.charAt(0)).assertEqual('[');
      expect(text.split(']').length).assertEqual(4);
    });

    /*
     * @tc.number: SUB_LOGGER_2400
     * @tc.name: testLogger0024
     * @tc.desc: Format a fatal entry and keep its level label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0024', 0, () => {
      Logger.clear();
      Logger.fatal('link lost');
      const entry: LogEntry = Logger.getHistory()[0];
      const text: string = Logger.formatEntry(entry);
      expect(entry.level).assertEqual(LogLevel.FATAL);
      expect(text.indexOf('[FATAL]') >= 0).assertTrue();
      expect(text.indexOf('link lost') > 0).assertTrue();
      expect(Logger.getLevelLabel(entry.level)).assertEqual('FATAL');
    });

    // ==================== 性能追踪（2 条） ====================

    /*
     * @tc.number: SUB_LOGGER_2500
     * @tc.name: testLogger0025
     * @tc.desc: Start and finish a named trace without touching the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0025', 0, () => {
      Logger.clear();
      Logger.startTrace('a2dp-connect');
      Logger.finishTrace('a2dp-connect');
      expect(Logger.getBufferSize()).assertEqual(0);
      expect(Logger.getHistory().length).assertEqual(0);
      Logger.info('marker');
      expect(Logger.getBufferSize()).assertEqual(1);
      expect(Logger.getHistory()[0].message).assertEqual('marker');
    });

    /*
     * @tc.number: SUB_LOGGER_2600
     * @tc.name: testLogger0026
     * @tc.desc: Accept a trace with an explicit instance identifier.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLogger0026', 0, () => {
      Logger.clear();
      let traced: boolean = true;
      try {
        Logger.startTrace('hfp-sco', 3);
        Logger.debug('inside trace');
        Logger.finishTrace('hfp-sco', 3);
      } catch (error) {
        traced = false;
      }
      expect(traced).assertTrue();
      expect(Logger.getBufferSize()).assertEqual(1);
      expect(Logger.getHistory()[0].level).assertEqual(LogLevel.DEBUG);
      expect(Logger.getLevel()).assertEqual(LogLevel.DEBUG);
    });
  });
}
