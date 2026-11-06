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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import {
  TestLogAnalyzer,
  LogLevel,
  LogEntry,
  LogAnalysisResult
} from '../../../main/ets/util/TestLogAnalyzer';

export default function testLogAnalyzerTest(): void {
  describe('TestLogAnalyzerTest', (): void => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    // ==================== 构造器 (2 用例) ====================

    /*
     * @tc.number: SUB_TLA_0100
     * @tc.name: testConstructorDefault0001
     * @tc.desc: Verify default constructor creates analyzer with entries.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testConstructorDefault0001', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      expect(analyzer.getEntryCount()).assertEqual(0);
      expect(analyzer.getErrorCount()).assertEqual(0);
      expect(analyzer.getWarningCount()).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_TLA_0200
     * @tc.name: testConstructorCustomMax0002
     * @tc.desc: Verify custom maxEntries constructor limits capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testConstructorCustomMax0002', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer(3);
      analyzer.logInfo('t', 'msg1');
      analyzer.logInfo('t', 'msg2');
      analyzer.logInfo('t', 'msg3');
      analyzer.logInfo('t', 'msg4');
      expect(analyzer.getEntryCount()).assertEqual(3);
      const entries = analyzer.getEntries();
      expect(entries[0].message).assertEqual('msg2');
      expect(entries[2].message).assertEqual('msg4');
      done();
    });

    // ==================== addEntry + getEntries (2 用例) ====================

    /*
     * @tc.number: SUB_TLA_0300
     * @tc.name: testTlaAddEntry0003
     * @tc.desc: Verify addEntry stores entry with correct fields.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTlaAddEntry0003', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      const before = Date.now();
      analyzer.addEntry(LogLevel.INFO, 'myTag', 'hello', 0x1234);
      const after = Date.now();
      const entries = analyzer.getEntries();
      expect(entries.length).assertEqual(1);
      expect(entries[0].level).assertEqual(LogLevel.INFO);
      expect(entries[0].tag).assertEqual('myTag');
      done();
    });

    /*
     * @tc.number: SUB_TLA_0400
     * @tc.name: testTlaAddEntry0004
     * @tc.desc: Verify addEntry timestamp is within expected range.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTlaAddEntry0004', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      const before = Date.now();
      analyzer.addEntry(LogLevel.ERROR, 'tag', 'msg');
      const after = Date.now();
      const entries = analyzer.getEntries();
      expect(entries[0].timestamp >= before).assertTrue();
      expect(entries[0].timestamp <= after).assertTrue();
      expect(entries[0].domain).assertEqual(0xF811);
      done();
    });

    // ==================== logDebug/logInfo/logWarn/logError (4 用例) ====================

    /*
     * @tc.number: SUB_TLA_0500
     * @tc.name: testLogDebug0005
     * @tc.desc: Verify logDebug adds entry with DEBUG level.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testLogDebug0005', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logDebug('dTag', 'debug msg');
      const entries = analyzer.getEntries();
      expect(entries.length).assertEqual(1);
      expect(entries[0].level).assertEqual(LogLevel.DEBUG);
      expect(entries[0].tag).assertEqual('dTag');
      done();
    });

    /*
     * @tc.number: SUB_TLA_0600
     * @tc.name: testLogInfo0006
     * @tc.desc: Verify logInfo adds entry with INFO level.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testLogInfo0006', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logInfo('iTag', 'info msg');
      expect(analyzer.getEntryCount()).assertEqual(1);
      expect(analyzer.getEntries()[0].level).assertEqual(LogLevel.INFO);
      expect(analyzer.getEntries()[0].message).assertEqual('info msg');
      done();
    });

    /*
     * @tc.number: SUB_TLA_0700
     * @tc.name: testLogWarn0007
     * @tc.desc: Verify logWarn adds entry with WARN level and increments warning count.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testLogWarn0007', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logWarn('wTag', 'warn msg');
      expect(analyzer.getWarningCount()).assertEqual(1);
      expect(analyzer.getEntries()[0].level).assertEqual(LogLevel.WARN);
      expect(analyzer.getErrorCount()).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_TLA_0800
     * @tc.name: testLogError0008
     * @tc.desc: Verify logError adds entry with ERROR level and increments error count.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testLogError0008', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logError('eTag', 'error msg');
      expect(analyzer.getErrorCount()).assertEqual(1);
      expect(analyzer.getEntries()[0].level).assertEqual(LogLevel.ERROR);
      expect(analyzer.getWarningCount()).assertEqual(0);
      done();
    });

    // ==================== getEntriesByLevel (2 用例) ====================

    /*
     * @tc.number: SUB_TLA_0900
     * @tc.name: testGetEntriesByLevel0009
     * @tc.desc: Verify getEntriesByLevel filters by ERROR level.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetEntriesByLevel0009', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logInfo('t', 'info1');
      analyzer.logError('t', 'err1');
      analyzer.logInfo('t', 'info2');
      analyzer.logError('t', 'err2');
      const errors = analyzer.getEntriesByLevel(LogLevel.ERROR);
      expect(errors.length).assertEqual(2);
      expect(errors[0].message).assertEqual('err1');
      expect(errors[1].message).assertEqual('err2');
      done();
    });

    /*
     * @tc.number: SUB_TLA_1000
     * @tc.name: testGetEntriesByLevel0010
     * @tc.desc: Verify getEntriesByLevel returns empty for level with no entries.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetEntriesByLevel0010', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logInfo('t', 'msg');
      const debugs = analyzer.getEntriesByLevel(LogLevel.DEBUG);
      expect(debugs.length).assertEqual(0);
      expect(analyzer.getEntryCount()).assertEqual(1);
      expect(debugs.length === 0).assertTrue();
      done();
    });

    // ==================== getEntriesByTag (1 用例) ====================

    /*
     * @tc.number: SUB_TLA_1100
     * @tc.name: testGetEntriesByTag0011
     * @tc.desc: Verify getEntriesByTag filters entries by tag.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetEntriesByTag0011', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logInfo('alpha', 'a1');
      analyzer.logInfo('beta', 'b1');
      analyzer.logError('alpha', 'a2');
      const alphaEntries = analyzer.getEntriesByTag('alpha');
      expect(alphaEntries.length).assertEqual(2);
      expect(alphaEntries[0].message).assertEqual('a1');
      expect(alphaEntries[1].message).assertEqual('a2');
      done();
    });

    // ==================== searchEntries (2 用例) ====================

    /*
     * @tc.number: SUB_TLA_1200
     * @tc.name: testSearchEntries0012
     * @tc.desc: Verify searchEntries finds entries by keyword in message.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSearchEntries0012', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logInfo('t', 'connection timeout');
      analyzer.logError('t', 'Connection refused');
      analyzer.logInfo('t', 'success');
      const results = analyzer.searchEntries('connection');
      expect(results.length).assertEqual(2);
      expect(results[0].message).assertEqual('connection timeout');
      expect(results[1].message).assertEqual('Connection refused');
      done();
    });

    /*
     * @tc.number: SUB_TLA_1300
     * @tc.name: testSearchEntries0013
     * @tc.desc: Verify searchEntries also matches tag name.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSearchEntries0013', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logInfo('NetworkModule', 'msg1');
      analyzer.logInfo('OtherTag', 'msg2');
      const results = analyzer.searchEntries('Network');
      expect(results.length).assertEqual(1);
      expect(results[0].tag).assertEqual('NetworkModule');
      expect(results[0].message).assertEqual('msg1');
      done();
    });

    // ==================== analyze (3 用例) ====================

    /*
     * @tc.number: SUB_TLA_1400
     * @tc.name: testAnalyze0014
     * @tc.desc: Verify analyze counts levels correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAnalyze0014', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logDebug('t', 'd1');
      analyzer.logInfo('t', 'i1');
      analyzer.logInfo('t', 'i2');
      analyzer.logWarn('t', 'w1');
      analyzer.logError('t', 'e1');
      const result = analyzer.analyze();
      expect(result.totalEntries).assertEqual(5);
      expect(result.debugCount).assertEqual(1);
      expect(result.infoCount).assertEqual(2);
      done();
    });

    /*
     * @tc.number: SUB_TLA_1500
     * @tc.name: testAnalyze0015
     * @tc.desc: Verify analyze counts uniqueTags and errorsByTag correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAnalyze0015', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logError('tagA', 'err1');
      analyzer.logError('tagA', 'err2');
      analyzer.logError('tagB', 'err3');
      analyzer.logInfo('tagC', 'info1');
      const result = analyzer.analyze();
      expect(result.uniqueTags).assertEqual(3);
      expect(result.errorCount).assertEqual(3);
      expect(result.warningCount).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_TLA_1600
     * @tc.name: testAnalyze0016
     * @tc.desc: Verify analyze errorsByTag map has correct per-tag counts.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAnalyze0016', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logError('net', 'timeout');
      analyzer.logError('net', 'refused');
      analyzer.logError('db', 'conn lost');
      const result = analyzer.analyze();
      expect(result.errorsByTag.get('net')).assertEqual(2);
      expect(result.errorsByTag.get('db')).assertEqual(1);
      expect(result.errorsByTag.size).assertEqual(2);
      done();
    });

    // ==================== analyze testCaseResults (2 用例) ====================

    /*
     * @tc.number: SUB_TLA_1700
     * @tc.name: testAnalyzeTestCaseResults0017
     * @tc.desc: Verify analyze detects begin/failed patterns in messages.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAnalyzeTestCaseResults0017', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logInfo('t', 'testA begin');
      analyzer.logInfo('t', 'testB begin');
      analyzer.logError('t', 'testB failed');
      const result = analyzer.analyze();
      expect(result.testCaseResults.get('testA')).assertTrue();
      expect(result.testCaseResults.get('testB')).assertFalse();
      expect(result.testCaseResults.size).assertEqual(2);
      done();
    });

    /*
     * @tc.number: SUB_TLA_1800
     * @tc.name: testAnalyzeTestCaseResults0018
     * @tc.desc: Verify analyze begin pattern only records first occurrence.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAnalyzeTestCaseResults0018', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logInfo('t', 'caseX begin');
      analyzer.logInfo('t', 'caseX begin');
      const result = analyzer.analyze();
      expect(result.testCaseResults.size).assertEqual(1);
      expect(result.testCaseResults.get('caseX')).assertTrue();
      expect(result.totalEntries).assertEqual(2);
      done();
    });

    // ==================== getTestPassRate (2 用例) ====================

    /*
     * @tc.number: SUB_TLA_1900
     * @tc.name: testGetTestPassRate0019
     * @tc.desc: Verify getTestPassRate with mixed results.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetTestPassRate0019', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logInfo('t', 'pass1 begin');
      analyzer.logInfo('t', 'pass2 begin');
      analyzer.logInfo('t', 'fail1 begin');
      analyzer.logError('t', 'fail1 failed');
      const rate = analyzer.getTestPassRate();
      expect(rate).assertEqual(67);
      expect(rate).assertLarger(0);
      expect(rate < 100).assertTrue();
      done();
    });

    /*
     * @tc.number: SUB_TLA_2000
     * @tc.name: testGetTestPassRate0020
     * @tc.desc: Verify getTestPassRate returns 0 when no test cases exist.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetTestPassRate0020', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logInfo('t', 'random message');
      expect(analyzer.getTestPassRate()).assertEqual(0);
      expect(analyzer.getEntryCount()).assertEqual(1);
      expect(analyzer.getTestPassRate() === 0).assertTrue();
      done();
    });

    // ==================== clear / getEntryCount / getErrorCount / getWarningCount (2 用例) ====================

    /*
     * @tc.number: SUB_TLA_2100
     * @tc.name: testTlaClear0021
     * @tc.desc: Verify clear resets all entries and counts.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTlaClear0021', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logError('t', 'err');
      analyzer.logWarn('t', 'warn');
      analyzer.logInfo('t', 'info');
      expect(analyzer.getEntryCount() > 0).assertTrue();
      analyzer.clear();
      expect(analyzer.getEntryCount()).assertEqual(0);
      expect(analyzer.getErrorCount()).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_TLA_2200
     * @tc.name: testCounts0022
     * @tc.desc: Verify getErrorCount and getWarningCount track correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCounts0022', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logError('t', 'e1');
      analyzer.logError('t', 'e2');
      analyzer.logWarn('t', 'w1');
      expect(analyzer.getErrorCount()).assertEqual(2);
      expect(analyzer.getWarningCount()).assertEqual(1);
      expect(analyzer.getEntryCount()).assertEqual(3);
      done();
    });

    // ==================== getEntriesByTimeRange (1 用例) ====================

    /*
     * @tc.number: SUB_TLA_2300
     * @tc.name: testGetEntriesByTimeRange0023
     * @tc.desc: Verify getEntriesByTimeRange filters by timestamp window.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetEntriesByTimeRange0023', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logInfo('t', 'msg1');
      const midTime = Date.now();
      analyzer.logInfo('t', 'msg2');
      const allEntries = analyzer.getEntries();
      const firstTime = allEntries[0].timestamp;
      const rangeEntries = analyzer.getEntriesByTimeRange(firstTime, midTime);
      expect(rangeEntries.length >= 1).assertTrue();
      expect(rangeEntries[0].message).assertEqual('msg1');
      expect(allEntries.length).assertEqual(2);
      done();
    });

    // ==================== generateReport (2 用例) ====================

    /*
     * @tc.number: SUB_TLA_2400
     * @tc.name: testGenerateReport0024
     * @tc.desc: Verify generateReport contains key sections.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateReport0024', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logInfo('t', 'testA begin');
      analyzer.logError('net', 'timeout');
      const report = analyzer.generateReport();
      expect(report.length).assertLarger(0);
      expect(report).assertContain('Test Log Analysis Report');
      expect(report).assertContain('End of Report');
      done();
    });

    /*
     * @tc.number: SUB_TLA_2500
     * @tc.name: testGenerateReport0025
     * @tc.desc: Verify report includes error tag section when errors exist.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateReport0025', 0, async (done: Function) => {
      const analyzer = new TestLogAnalyzer();
      analyzer.logError('dbTag', 'conn lost');
      analyzer.logError('dbTag', 'query fail');
      const report = analyzer.generateReport();
      expect(report).assertContain('Errors by Tag');
      expect(report).assertContain('dbTag');
      expect(report).assertContain('2 errors');
      done();
    });
  });
}
