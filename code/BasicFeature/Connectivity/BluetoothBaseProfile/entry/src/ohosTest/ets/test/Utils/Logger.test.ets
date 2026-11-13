/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
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
    // ==================== level threshold (4 cases) ====================

    /*
     * @tc.number: SUB_LOGGER_0100
     * @tc.name: testLogger0001
     * @tc.desc: Store every level while the threshold stays at DEBUG.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0001', 'begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0001',
        '#1 assert ' + "expect(Logger.getLevel()).assertEqual(LogLevel.DEBUG)");
      expect(Logger.getLevel()).assertEqual(LogLevel.DEBUG);
      Logger.debug('d0');
      Logger.info('i0');
      Logger.warn('w0');
      Logger.error('e0');
      Logger.fatal('f0');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0001',
        '#2 assert ' + "expect(Logger.getBufferSize()).assertEqual(5)");
      expect(Logger.getBufferSize()).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0001',
        '#3 assert ' + "expect(Logger.getHistory().length).assertEqual(5)");
      expect(Logger.getHistory().length).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0001',
        '#4 assert ' + "expect(Logger.getHistory()[0].level).assertEqual(LogLevel.DEBUG)");
      expect(Logger.getHistory()[0].level).assertEqual(LogLevel.DEBUG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0001',
        '#5 assert ' + "expect(Logger.getHistory()[4].level).assertEqual(LogLevel.FATAL)");
      expect(Logger.getHistory()[4].level).assertEqual(LogLevel.FATAL);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0002', 'begin');
      Logger.clear();
      Logger.setLevel(LogLevel.WARN);
      Logger.debug('filtered');
      Logger.info('filtered');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0002',
        '#1 assert ' + "expect(Logger.getBufferSize()).assertEqual(0)");
      expect(Logger.getBufferSize()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0002',
        '#2 assert ' + "expect(Logger.getHistory().length).assertEqual(0)");
      expect(Logger.getHistory().length).assertEqual(0);
      Logger.warn('kept');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0002',
        '#3 assert ' + "expect(Logger.getBufferSize()).assertEqual(1)");
      expect(Logger.getBufferSize()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0002',
        '#4 assert ' + "expect(Logger.getHistory()[0].message).assertEqual('kept')");
      expect(Logger.getHistory()[0].message).assertEqual('kept');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0002',
        '#5 assert ' + "expect(Logger.getLevel()).assertEqual(LogLevel.WARN)");
      expect(Logger.getLevel()).assertEqual(LogLevel.WARN);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0003', 'begin');
      Logger.clear();
      Logger.setLevel(LogLevel.FATAL);
      Logger.debug('a');
      Logger.info('b');
      Logger.warn('c');
      Logger.error('d');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0003',
        '#1 assert ' + "expect(Logger.getBufferSize()).assertEqual(0)");
      expect(Logger.getBufferSize()).assertEqual(0);
      Logger.fatal('only fatal');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0003',
        '#2 assert ' + "expect(Logger.getBufferSize()).assertEqual(1)");
      expect(Logger.getBufferSize()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0003',
        '#3 assert ' + "expect(Logger.getHistoryByLevel(LogLevel.ERROR).length).assertEqual(0)");
      expect(Logger.getHistoryByLevel(LogLevel.ERROR).length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0003',
        '#4 assert ' + "expect(Logger.getHistoryByLevel(LogLevel.FATAL).length).assertEqual(1)");
      expect(Logger.getHistoryByLevel(LogLevel.FATAL).length).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0004', 'begin');
      Logger.clear();
      Logger.setLevel(LogLevel.ERROR);
      Logger.info('dropped');
      Logger.error('stored');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0004',
        '#1 assert ' + "expect(Logger.getBufferSize()).assertEqual(1)");
      expect(Logger.getBufferSize()).assertEqual(1);
      Logger.setLevel(LogLevel.DEBUG);
      Logger.debug('added');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0004',
        '#2 assert ' + "expect(Logger.getBufferSize()).assertEqual(2)");
      expect(Logger.getBufferSize()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0004',
        '#3 assert ' + "expect(Logger.getHistory()[0].message).assertEqual('stored')");
      expect(Logger.getHistory()[0].message).assertEqual('stored');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0004',
        '#4 assert ' + "expect(Logger.getHistory()[1].message).assertEqual('added')");
      expect(Logger.getHistory()[1].message).assertEqual('added');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0004',
        '#5 assert ' + "expect(Logger.getLevel()).assertEqual(LogLevel.DEBUG)");
      expect(Logger.getLevel()).assertEqual(LogLevel.DEBUG);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0004', 'end');
    });

    // ==================== entry content (3 cases) ====================

    /*
     * @tc.number: SUB_LOGGER_0500
     * @tc.name: testLogger0005
     * @tc.desc: Fall back to the sample tag when no tag is supplied.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0005', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0005', 'begin');
      Logger.clear();
      const before: number = Date.now();
      Logger.info('plain message');
      const entry: LogEntry = Logger.getHistory()[0];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0005',
        '#1 ' + "entry.tag" + ' = ' + JSON.stringify(entry.tag));
      expect(entry.tag).assertEqual(BluetoothConstants.TAG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0005',
        '#2 ' + "entry.message" + ' = ' + JSON.stringify(entry.message));
      expect(entry.message).assertEqual('plain message');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0005',
        '#3 ' + "entry.level" + ' = ' + JSON.stringify(entry.level));
      expect(entry.level).assertEqual(LogLevel.INFO);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0005',
        '#4 ' + "entry.timestamp >= before" + ' = ' + JSON.stringify(entry.timestamp >= before));
      expect(entry.timestamp >= before).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0006', 'begin');
      Logger.clear();
      Logger.debug('scan started', 'A2dpScan');
      Logger.warn('scan slow', 'A2dpScan');
      const history: LogEntry[] = Logger.getHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0006',
        '#1 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0006',
        '#2 ' + "history[0].tag" + ' = ' + JSON.stringify(history[0].tag));
      expect(history[0].tag).assertEqual('A2dpScan');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0006',
        '#3 ' + "history[1].tag" + ' = ' + JSON.stringify(history[1].tag));
      expect(history[1].tag).assertEqual('A2dpScan');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0006',
        '#4 ' + "history[0].tag !== BluetoothConstants.TAG" + ' = ' +
        JSON.stringify(history[0].tag !== BluetoothConstants.TAG));
      expect(history[0].tag !== BluetoothConstants.TAG).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0006',
        '#5 ' + "history[1].level" + ' = ' + JSON.stringify(history[1].level));
      expect(history[1].level).assertEqual(LogLevel.WARN);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0007', 'begin');
      Logger.clear();
      const longText: string = 'x'.repeat(300);
      Logger.info('');
      Logger.info(longText);
      const history: LogEntry[] = Logger.getHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0007',
        '#1 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0007',
        '#2 ' + "history[0].message.length" + ' = ' + JSON.stringify(history[0].message.length));
      expect(history[0].message.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0007',
        '#3 ' + "history[1].message.length" + ' = ' + JSON.stringify(history[1].message.length));
      expect(history[1].message.length).assertEqual(300);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0007',
        '#4 assert ' + "expect(history[1].message.startsWith('xxx')).assertTrue()");
      expect(history[1].message.startsWith('xxx')).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0007', 'end');
    });

    // ==================== level filter (2 cases) ====================

    /*
     * @tc.number: SUB_LOGGER_0800
     * @tc.name: testLogger0008
     * @tc.desc: Filter the history by each individual level.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0008', 'begin');
      Logger.clear();
      Logger.setLevel(LogLevel.DEBUG);
      Logger.debug('d');
      Logger.debug('d2');
      Logger.info('i');
      Logger.error('e');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0008',
        '#1 assert ' + "expect(Logger.getHistoryByLevel(LogLevel.DEBUG).length).assertEqual(2)");
      expect(Logger.getHistoryByLevel(LogLevel.DEBUG).length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0008',
        '#2 assert ' + "expect(Logger.getHistoryByLevel(LogLevel.INFO).length).assertEqual(1)");
      expect(Logger.getHistoryByLevel(LogLevel.INFO).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0008',
        '#3 assert ' + "expect(Logger.getHistoryByLevel(LogLevel.INFO)[0].message).assertEqual('i')");
      expect(Logger.getHistoryByLevel(LogLevel.INFO)[0].message).assertEqual('i');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0008',
        '#4 assert ' + "expect(Logger.getHistoryByLevel(LogLevel.ERROR).length).assertEqual(1)");
      expect(Logger.getHistoryByLevel(LogLevel.ERROR).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0008',
        '#5 assert ' + "expect(Logger.getHistoryByLevel(LogLevel.WARN).length).assertEqual(0)");
      expect(Logger.getHistoryByLevel(LogLevel.WARN).length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0009', 'begin');
      Logger.clear();
      Logger.fatal('boom');
      const empty: LogEntry[] = Logger.getHistoryByLevel(LogLevel.DEBUG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0009',
        '#1 ' + "empty.length" + ' = ' + JSON.stringify(empty.length));
      expect(empty.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0009',
        '#2 assert ' + "expect(Array.isArray(empty)).assertTrue()");
      expect(Array.isArray(empty)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0009',
        '#3 assert ' + "expect(Logger.getHistoryByLevel(LogLevel.FATAL).length).assertEqual(1)");
      expect(Logger.getHistoryByLevel(LogLevel.FATAL).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0009',
        '#4 assert ' + "expect(Logger.getBufferSize()).assertEqual(1)");
      expect(Logger.getBufferSize()).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0009', 'end');
    });

    // ==================== buffer capacity (3 cases) ====================

    /*
     * @tc.number: SUB_LOGGER_1000
     * @tc.name: testLogger0010
     * @tc.desc: Grow the ring buffer one entry at a time below its capacity.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0010', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0010', 'begin');
      Logger.clear();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0010',
        '#1 assert ' + "expect(Logger.getBufferSize()).assertEqual(0)");
      expect(Logger.getBufferSize()).assertEqual(0);
      for (let i: number = 0; i < 50; i++) {
        Logger.info(`batch-${i}`);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0010',
        '#2 assert ' + "expect(Logger.getBufferSize()).assertEqual(50)");
      expect(Logger.getBufferSize()).assertEqual(50);
      const history: LogEntry[] = Logger.getHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0010',
        '#3 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0010',
        '#4 ' + "history[49].message" + ' = ' + JSON.stringify(history[49].message));
      expect(history[49].message).assertEqual('batch-49');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0010',
        '#5 ' + "history[0].message" + ' = ' + JSON.stringify(history[0].message));
      expect(history[0].message).assertEqual('batch-0');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0011', 'begin');
      Logger.clear();
      for (let i: number = 0; i < 1005; i++) {
        Logger.info(`over-${i}`);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0011',
        '#1 assert ' + "expect(Logger.getBufferSize()).assertEqual(1000)");
      expect(Logger.getBufferSize()).assertEqual(1000);
      const history: LogEntry[] = Logger.getHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0011',
        '#2 ' + "history.length" + ' = ' + JSON.stringify(history.length));
      expect(history.length).assertEqual(1000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0011',
        '#3 ' + "history[0].message" + ' = ' + JSON.stringify(history[0].message));
      expect(history[0].message).assertEqual('over-5');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0011',
        '#4 ' + "history[999].message" + ' = ' + JSON.stringify(history[999].message));
      expect(history[999].message).assertEqual('over-1004');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0012', 'begin');
      Logger.clear();
      Logger.info('immutable');
      const first: LogEntry[] = Logger.getHistory();
      first.push(first[0]);
      const second: LogEntry[] = Logger.getHistory();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0012',
        '#1 ' + "second.length" + ' = ' + JSON.stringify(second.length));
      expect(second.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0012',
        '#2 ' + "first.length" + ' = ' + JSON.stringify(first.length));
      expect(first.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0012',
        '#3 ' + "second[0].message" + ' = ' + JSON.stringify(second[0].message));
      expect(second[0].message).assertEqual('immutable');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0012',
        '#4 ' + "second !== first" + ' = ' + JSON.stringify(second !== first));
      expect(second !== first).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0012', 'end');
    });

    // ==================== clear (2 cases) ====================

    /*
     * @tc.number: SUB_LOGGER_1300
     * @tc.name: testLogger0013
     * @tc.desc: Drop all buffered entries when the buffer is cleared.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0013', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0013', 'begin');
      Logger.clear();
      Logger.info('one');
      Logger.error('two');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0013',
        '#1 assert ' + "expect(Logger.getBufferSize()).assertEqual(2)");
      expect(Logger.getBufferSize()).assertEqual(2);
      Logger.clear();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0013',
        '#2 assert ' + "expect(Logger.getBufferSize()).assertEqual(0)");
      expect(Logger.getBufferSize()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0013',
        '#3 assert ' + "expect(Logger.getHistory().length).assertEqual(0)");
      expect(Logger.getHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0013',
        '#4 assert ' + "expect(Logger.getHistoryByLevel(LogLevel.INFO).length).assertEqual(0)");
      expect(Logger.getHistoryByLevel(LogLevel.INFO).length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0013', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0014', 'begin');
      Logger.clear();
      const listener: RecordingListener = new RecordingListener();
      Logger.addListener(listener);
      Logger.info('notified');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0014',
        '#1 ' + "listener.entries.length" + ' = ' + JSON.stringify(listener.entries.length));
      expect(listener.entries.length).assertEqual(1);
      Logger.clear();
      Logger.info('after clear');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0014',
        '#2 ' + "listener.entries.length" + ' = ' + JSON.stringify(listener.entries.length));
      expect(listener.entries.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0014',
        '#3 assert ' + "expect(Logger.getBufferSize()).assertEqual(1)");
      expect(Logger.getBufferSize()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0014',
        '#4 assert ' + "expect(Logger.getHistory()[0].message).assertEqual('after clear')");
      expect(Logger.getHistory()[0].message).assertEqual('after clear');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0014', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0015', 'begin');
      Logger.clear();
      Logger.setLevel(LogLevel.ERROR);
      Logger.error('kept');
      Logger.clear();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0015',
        '#1 assert ' + "expect(Logger.getLevel()).assertEqual(LogLevel.ERROR)");
      expect(Logger.getLevel()).assertEqual(LogLevel.ERROR);
      Logger.info('dropped');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0015',
        '#2 assert ' + "expect(Logger.getBufferSize()).assertEqual(0)");
      expect(Logger.getBufferSize()).assertEqual(0);
      Logger.error('kept again');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0015',
        '#3 assert ' + "expect(Logger.getBufferSize()).assertEqual(1)");
      expect(Logger.getBufferSize()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0015',
        '#4 assert ' + "expect(Logger.getHistory()[0].level).assertEqual(LogLevel.ERROR)");
      expect(Logger.getHistory()[0].level).assertEqual(LogLevel.ERROR);
      Logger.setLevel(LogLevel.DEBUG);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0015', 'end');
    });

    // ==================== listener (4 cases) ====================

    /*
     * @tc.number: SUB_LOGGER_1600
     * @tc.name: testLogger0016
     * @tc.desc: Notify a registered listener with the recorded entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0016', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0016', 'begin');
      Logger.clear();
      const listener: RecordingListener = new RecordingListener();
      Logger.addListener(listener);
      Logger.warn('pairing failed', 'HfpPair');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0016',
        '#1 ' + "listener.entries.length" + ' = ' + JSON.stringify(listener.entries.length));
      expect(listener.entries.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0016',
        '#2 ' + "listener.entries[0].message" + ' = ' + JSON.stringify(listener.entries[0].message));
      expect(listener.entries[0].message).assertEqual('pairing failed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0016',
        '#3 ' + "listener.entries[0].tag" + ' = ' + JSON.stringify(listener.entries[0].tag));
      expect(listener.entries[0].tag).assertEqual('HfpPair');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0016',
        '#4 ' + "listener.entries[0].level" + ' = ' + JSON.stringify(listener.entries[0].level));
      expect(listener.entries[0].level).assertEqual(LogLevel.WARN);
      Logger.removeListener(listener);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0016', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0017', 'begin');
      Logger.clear();
      const listener: RecordingListener = new RecordingListener();
      Logger.addListener(listener);
      Logger.addListener(listener);
      Logger.info('once');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0017',
        '#1 ' + "listener.entries.length" + ' = ' + JSON.stringify(listener.entries.length));
      expect(listener.entries.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0017',
        '#2 assert ' + "expect(Logger.getBufferSize()).assertEqual(1)");
      expect(Logger.getBufferSize()).assertEqual(1);
      Logger.removeListener(listener);
      Logger.info('still filtered out');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0017',
        '#3 ' + "listener.entries.length" + ' = ' + JSON.stringify(listener.entries.length));
      expect(listener.entries.length).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0017', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0018', 'begin');
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
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0018',
        '#1 ' + "order.length" + ' = ' + JSON.stringify(order.length));
      expect(order.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0018',
        '#2 ' + "order[0]" + ' = ' + JSON.stringify(order[0]));
      expect(order[0]).assertEqual('first-evt');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0018',
        '#3 ' + "order[1]" + ' = ' + JSON.stringify(order[1]));
      expect(order[1]).assertEqual('second-evt');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0018',
        '#4 assert ' + "expect(Logger.getBufferSize()).assertEqual(1)");
      expect(Logger.getBufferSize()).assertEqual(1);
      Logger.removeListener(first);
      Logger.removeListener(second);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0018', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0019', 'begin');
      Logger.clear();
      const failing: ThrowingListener = new ThrowingListener();
      const watcher: RecordingListener = new RecordingListener();
      Logger.addListener(failing);
      Logger.addListener(watcher);
      Logger.error('with failure');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0019',
        '#1 ' + "failing.calls" + ' = ' + JSON.stringify(failing.calls));
      expect(failing.calls).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0019',
        '#2 ' + "watcher.entries.length" + ' = ' + JSON.stringify(watcher.entries.length));
      expect(watcher.entries.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0019',
        '#3 assert ' + "expect(Logger.getBufferSize()).assertEqual(1)");
      expect(Logger.getBufferSize()).assertEqual(1);
      Logger.info('next entry');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0019',
        '#4 ' + "failing.calls" + ' = ' + JSON.stringify(failing.calls));
      expect(failing.calls).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0019',
        '#5 ' + "watcher.entries.length" + ' = ' + JSON.stringify(watcher.entries.length));
      expect(watcher.entries.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0019',
        '#6 assert ' + "expect(Logger.getBufferSize()).assertEqual(2)");
      expect(Logger.getBufferSize()).assertEqual(2);
      Logger.removeListener(failing);
      Logger.removeListener(watcher);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0019', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0020', 'begin');
      Logger.clear();
      Logger.setLevel(LogLevel.ERROR);
      const listener: RecordingListener = new RecordingListener();
      Logger.addListener(listener);
      Logger.debug('silent');
      Logger.info('silent');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0020',
        '#1 ' + "listener.entries.length" + ' = ' + JSON.stringify(listener.entries.length));
      expect(listener.entries.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0020',
        '#2 assert ' + "expect(Logger.getBufferSize()).assertEqual(0)");
      expect(Logger.getBufferSize()).assertEqual(0);
      Logger.fatal('loud');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0020',
        '#3 ' + "listener.entries.length" + ' = ' + JSON.stringify(listener.entries.length));
      expect(listener.entries.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0020',
        '#4 ' + "listener.entries[0].level" + ' = ' + JSON.stringify(listener.entries[0].level));
      expect(listener.entries[0].level).assertEqual(LogLevel.FATAL);
      Logger.removeListener(listener);
      Logger.setLevel(LogLevel.DEBUG);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0020', 'end');
    });

    // ==================== level label and entry format (3 cases) ====================

    /*
     * @tc.number: SUB_LOGGER_2100
     * @tc.name: testLogger0021
     * @tc.desc: Map every level to its uppercase label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0021', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0021', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0021',
        '#1 assert ' + "expect(Logger.getLevelLabel(LogLevel.DEBUG)).assertEqual('DEBUG')");
      expect(Logger.getLevelLabel(LogLevel.DEBUG)).assertEqual('DEBUG');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0021',
        '#2 assert ' + "expect(Logger.getLevelLabel(LogLevel.INFO)).assertEqual('INFO')");
      expect(Logger.getLevelLabel(LogLevel.INFO)).assertEqual('INFO');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0021',
        '#3 assert ' + "expect(Logger.getLevelLabel(LogLevel.WARN)).assertEqual('WARN')");
      expect(Logger.getLevelLabel(LogLevel.WARN)).assertEqual('WARN');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0021',
        '#4 assert ' + "expect(Logger.getLevelLabel(LogLevel.ERROR)).assertEqual('ERROR')");
      expect(Logger.getLevelLabel(LogLevel.ERROR)).assertEqual('ERROR');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0021',
        '#5 assert ' + "expect(Logger.getLevelLabel(LogLevel.FATAL)).assertEqual('FATAL')");
      expect(Logger.getLevelLabel(LogLevel.FATAL)).assertEqual('FATAL');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0021',
        '#6 assert ' + "expect(Logger.getLevelLabel(99)).assertEqual('UNKNOWN')");
      expect(Logger.getLevelLabel(99)).assertEqual('UNKNOWN');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0021', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0022', 'begin');
      Logger.clear();
      Logger.info('connected');
      const entry: LogEntry = Logger.getHistory()[0];
      const text: string = Logger.formatEntry(entry);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0022',
        '#1 assert ' + "expect(text.startsWith('[20')).assertTrue()");
      expect(text.startsWith('[20')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0022',
        '#2 assert ' + "expect(text.indexOf('[INFO] [') >= 0).assertTrue()");
      expect(text.indexOf('[INFO] [') >= 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0022',
        '#3 assert ' + "expect(text.endsWith('] connected')).assertTrue()");
      expect(text.endsWith('] connected')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0022',
        '#4 ' + "text.length > entry.message.length + 20" + ' = ' +
        JSON.stringify(text.length > entry.message.length + 20));
      expect(text.length > entry.message.length + 20).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0022', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0023', 'begin');
      const early: Date = new Date(2024, 1, 3, 4, 5, 6, 0);
      const entry: LogEntry = {
        level: LogLevel.WARN,
        tag: 'PanNet',
        message: 'route changed',
        timestamp: early.getTime()
      };
      const text: string = Logger.formatEntry(entry);
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0023', '#1 ' + "text" + ' = ' + JSON.stringify(text));
      expect(text).assertEqual('[2024-02-03 04:05:06] [WARN] [PanNet] route changed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0023',
        '#2 assert ' + "expect(text.charAt(11)).assertEqual(' ')");
      expect(text.charAt(11)).assertEqual(' ');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0023',
        '#3 assert ' + "expect(text.charAt(0)).assertEqual('[')");
      expect(text.charAt(0)).assertEqual('[');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0023',
        '#4 assert ' + "expect(text.split(']').length).assertEqual(4)");
      expect(text.split(']').length).assertEqual(4);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0023', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0024', 'begin');
      Logger.clear();
      Logger.fatal('link lost');
      const entry: LogEntry = Logger.getHistory()[0];
      const text: string = Logger.formatEntry(entry);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0024',
        '#1 ' + "entry.level" + ' = ' + JSON.stringify(entry.level));
      expect(entry.level).assertEqual(LogLevel.FATAL);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0024',
        '#2 assert ' + "expect(text.indexOf('[FATAL]') >= 0).assertTrue()");
      expect(text.indexOf('[FATAL]') >= 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0024',
        '#3 assert ' + "expect(text.indexOf('link lost') > 0).assertTrue()");
      expect(text.indexOf('link lost') > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0024',
        '#4 assert ' + "expect(Logger.getLevelLabel(entry.level)).assertEqual('FATAL')");
      expect(Logger.getLevelLabel(entry.level)).assertEqual('FATAL');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0024', 'end');
    });

    // ==================== performance tracing (2 cases) ====================

    /*
     * @tc.number: SUB_LOGGER_2500
     * @tc.name: testLogger0025
     * @tc.desc: Start and finish a named trace without touching the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLogger0025', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0025', 'begin');
      Logger.clear();
      Logger.startTrace('a2dp-connect');
      Logger.finishTrace('a2dp-connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0025',
        '#1 assert ' + "expect(Logger.getBufferSize()).assertEqual(0)");
      expect(Logger.getBufferSize()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0025',
        '#2 assert ' + "expect(Logger.getHistory().length).assertEqual(0)");
      expect(Logger.getHistory().length).assertEqual(0);
      Logger.info('marker');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0025',
        '#3 assert ' + "expect(Logger.getBufferSize()).assertEqual(1)");
      expect(Logger.getBufferSize()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0025',
        '#4 assert ' + "expect(Logger.getHistory()[0].message).assertEqual('marker')");
      expect(Logger.getHistory()[0].message).assertEqual('marker');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0025', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0026', 'begin');
      Logger.clear();
      let traced: boolean = true;
      try {
        Logger.startTrace('hfp-sco', 3);
        Logger.debug('inside trace');
        Logger.finishTrace('hfp-sco', 3);
      } catch (error) {
        traced = false;
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0026',
        '#1 ' + "traced" + ' = ' + JSON.stringify(traced));
      expect(traced).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0026',
        '#2 assert ' + "expect(Logger.getBufferSize()).assertEqual(1)");
      expect(Logger.getBufferSize()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0026',
        '#3 assert ' + "expect(Logger.getHistory()[0].level).assertEqual(LogLevel.DEBUG)");
      expect(Logger.getHistory()[0].level).assertEqual(LogLevel.DEBUG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testLogger0026',
        '#4 assert ' + "expect(Logger.getLevel()).assertEqual(LogLevel.DEBUG)");
      expect(Logger.getLevel()).assertEqual(LogLevel.DEBUG);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testLogger0026', 'end');
    });
  });
}
