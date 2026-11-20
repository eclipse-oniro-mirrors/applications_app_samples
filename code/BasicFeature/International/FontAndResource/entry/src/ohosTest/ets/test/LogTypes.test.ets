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

// Import hilog so the pure logic cases leave traceable progress lines on device.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
// Import the on-screen log model and its helpers under test from the library HAR.
import { appendLog, LogEntry, nowTimeText } from 'library';

// The suite-level hilog tag, shared by every case of this logic suite.
const SUITE_TAG: string = '[Sample_FontResource_Logic]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_Logic_';
// The fixed wall clock text reused as the time field of every synthetic entry.
const FIXED_TIME: string = '09:30:15';
// The fixed level bucket reused as the level field of every synthetic entry.
const FIXED_LEVEL: string = 'info';
// The fresh entry id that must land on top of every produced log list.
const FRESH_ID: number = 999;
// The fresh entry tag that must land on top of every produced log list.
const FRESH_TAG: string = 'FreshTag';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Builds one synthetic log entry with deterministic fields for assertions.
function buildEntry(entryId: number, tag: string, text: string): LogEntry {
  // Construct the entry with the fixed time and level fields.
  return new LogEntry(entryId, FIXED_TIME, tag, text, FIXED_LEVEL);
}

// Builds the fresh entry that appendLog should place on top of the result.
function buildFreshEntry(): LogEntry {
  // Construct the deterministic fresh entry.
  return buildEntry(FRESH_ID, FRESH_TAG, 'fresh message');
}

// Builds a synthetic existing log list with one distinct entry per requested slot.
function buildList(count: number, baseId: number): LogEntry[] {
  // Start the fresh list for the caller.
  const list: LogEntry[] = [];
  // Fill the list with one deterministic entry per requested slot.
  for (let index: number = 0; index < count; index++) {
    // Encode the slot into the tag and text so positional assertions stay readable.
    list.push(buildEntry(baseId + index, 'OldTag' + index, 'old message ' + index));
  }
  // Return the populated list.
  return list;
}

// Registers every on-device logic test case of the log model helpers.
export default function logTypesTest() {
  // Group the cases under the "LogTypesSuite" describe block.
  describe('LogTypesSuite', () => {
    // Log the suite start line once before all cases run.
    beforeAll(() => {
      // Print the suite begin marker into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'LogTypesSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOG_0100
     * @tc.name      testNowTime0001
     * @tc.desc      Verify nowTimeText returns an "HH:mm:ss" stamp of eight characters with colons at position 2 and 5 and valid hour, minute and second fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNowTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNowTime0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the case start line.
      // Read the current wall clock stamp from the helper under test.
      const stamp: string = nowTimeText();
      // Log the captured stamp.
      logCase(TAG, 'stamp: ' + stamp);
      // Expect three two-digit fields plus two colons to compose eight characters.
      expect(stamp.length).assertEqual(8);
      // Expect the first colon to separate the hour field from the minute field.
      expect(stamp.charAt(2)).assertEqual(':');
      // Expect the second colon to separate the minute field from the second field.
      expect(stamp.charAt(5)).assertEqual(':');
      // Parse the zero padded hour field out of the stamp.
      const hourValue: number = Number(stamp.substring(0, 2));
      // Expect the hour field to stay inside the valid day range.
      expect(hourValue >= 0 && hourValue < 24).assertTrue();
      // Parse the zero padded minute field out of the stamp.
      const minuteValue: number = Number(stamp.substring(3, 5));
      // Expect the minute field to stay inside the valid hour range.
      expect(minuteValue >= 0 && minuteValue < 60).assertTrue();
      // Parse the zero padded second field out of the stamp.
      const secondValue: number = Number(stamp.substring(6, 8));
      // Expect the second field to stay inside the valid minute range.
      expect(secondValue >= 0 && secondValue < 60).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOG_0200
     * @tc.name      testAppendLog0001
     * @tc.desc      Verify appendLog inserts the fresh entry on top of the result and keeps the older entries in their original order below it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testAppendLog0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testAppendLog0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the case start line.
      // Build three existing entries with ids 100, 101 and 102.
      const existing: LogEntry[] = buildList(3, 100);
      // Build the fresh entry that must land on top.
      const fresh: LogEntry = buildFreshEntry();
      // Append the fresh entry with a limit that never truncates the list.
      const result: LogEntry[] = appendLog(existing, fresh, 10);
      // Log the produced list length.
      logCase(TAG, 'result length: ' + result.length);
      // Expect every existing entry plus the fresh one to survive.
      expect(result.length).assertEqual(4);
      // Expect the fresh entry to sit on top of the result.
      expect(result[0].id).assertEqual(FRESH_ID);
      // Expect the freshest existing entry to follow the fresh one.
      expect(result[1].id).assertEqual(100);
      // Expect the middle existing entry to keep its slot.
      expect(result[2].id).assertEqual(101);
      // Expect the oldest existing entry to stay at the bottom.
      expect(result[3].id).assertEqual(102);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOG_0300
     * @tc.name      testAppendLog0002
     * @tc.desc      Verify appendLog returns a fresh array and leaves the source list completely untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAppendLog0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testAppendLog0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the case start line.
      // Build three existing entries with ids 100, 101 and 102.
      const existing: LogEntry[] = buildList(3, 100);
      // Build the fresh entry that must not leak into the source list.
      const fresh: LogEntry = buildFreshEntry();
      // Append the fresh entry to the source list.
      const result: LogEntry[] = appendLog(existing, fresh, 5);
      // Log the source list length after the call.
      logCase(TAG, 'source length: ' + existing.length);
      // Expect the helper to hand back a new array instead of the source one.
      expect(result !== existing).assertTrue();
      // Expect the source list to keep its original entry count.
      expect(existing.length).assertEqual(3);
      // Expect the source top entry to stay the original one instead of the fresh one.
      expect(existing[0].id).assertEqual(100);
      // Expect the source bottom entry to stay in place.
      expect(existing[2].id).assertEqual(102);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOG_0400
     * @tc.name      testAppendLog0003
     * @tc.desc      Verify appendLog caps the result at the limit and drops the oldest entries first when the source list exceeds the limit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testAppendLog0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testAppendLog0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the case start line.
      // Build five existing entries with ids 200 to 204.
      const existing: LogEntry[] = buildList(5, 200);
      // Build the fresh entry that must survive the truncation on top.
      const fresh: LogEntry = buildFreshEntry();
      // Append the fresh entry under a limit smaller than the source list size.
      const result: LogEntry[] = appendLog(existing, fresh, 3);
      // Log the produced list length.
      logCase(TAG, 'result length: ' + result.length);
      // Expect the result to be capped at the requested limit.
      expect(result.length).assertEqual(3);
      // Expect the fresh entry to survive the truncation on top.
      expect(result[0].id).assertEqual(FRESH_ID);
      // Expect the newest existing entry to survive right below the fresh one.
      expect(result[1].id).assertEqual(200);
      // Expect the second newest existing entry to survive at the bottom.
      expect(result[2].id).assertEqual(201);
      // Append again at the exact boundary where the limit equals the list size.
      const boundary: LogEntry[] = appendLog(existing, fresh, 5);
      // Expect the boundary result to stay capped at the limit.
      expect(boundary.length).assertEqual(5);
      // Expect the oldest entry of the source list to be the one dropped at the boundary.
      expect(boundary[4].id).assertEqual(203);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOG_0500
     * @tc.name      testAppendLog0004
     * @tc.desc      Verify appendLog turns an empty source list into a single entry list holding only the fresh entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAppendLog0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testAppendLog0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the case start line.
      // Start from a completely empty log list.
      const emptyList: LogEntry[] = [];
      // Build the fresh entry that must become the only list content.
      const fresh: LogEntry = buildFreshEntry();
      // Append the fresh entry to the empty list.
      const result: LogEntry[] = appendLog(emptyList, fresh, 5);
      // Log the produced list length.
      logCase(TAG, 'result length: ' + result.length);
      // Expect the empty source list to grow into a single entry list.
      expect(result.length).assertEqual(1);
      // Expect the single result slot to hold the fresh entry.
      expect(result[0].id).assertEqual(FRESH_ID);
      // Expect the fresh tag to be preserved on the produced entry.
      expect(result[0].tag).assertEqual(FRESH_TAG);
      // Expect the source list to stay empty after the call.
      expect(emptyList.length).assertEqual(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOG_0600
     * @tc.name      testAppendLog0005
     * @tc.desc      Verify appendLog with limit 1 keeps only the fresh entry and drops every existing entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAppendLog0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testAppendLog0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the case start line.
      // Build three existing entries with ids 300 to 302.
      const existing: LogEntry[] = buildList(3, 300);
      // Build the fresh entry that must be the only survivor.
      const fresh: LogEntry = buildFreshEntry();
      // Append the fresh entry under the tightest possible limit.
      const result: LogEntry[] = appendLog(existing, fresh, 1);
      // Log the produced list length.
      logCase(TAG, 'result length: ' + result.length);
      // Expect the tight limit to cap the result at exactly one entry.
      expect(result.length).assertEqual(1);
      // Expect the only surviving entry to be the fresh one.
      expect(result[0].id).assertEqual(FRESH_ID);
      // Expect the only surviving entry to carry the fresh tag.
      expect(result[0].tag).assertEqual(FRESH_TAG);
      // Expect the source list to stay untouched by the tight limit call.
      expect(existing[0].id).assertEqual(300);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOG_0700
     * @tc.name      testLogEntry0001
     * @tc.desc      Verify the LogEntry constructor stores every supplied field verbatim.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLogEntry0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testLogEntry0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the case start line.
      // Construct one entry with fully populated fields.
      const entry: LogEntry = new LogEntry(42, '12:34:56', 'Install', 'font installed', 'info');
      // Log the stored tag field.
      logCase(TAG, 'tag: ' + entry.tag);
      // Expect the sequence number to be stored verbatim.
      expect(entry.id).assertEqual(42);
      // Expect the time field to be stored verbatim.
      expect(entry.time).assertEqual('12:34:56');
      // Expect the module tag to be stored verbatim.
      expect(entry.tag).assertEqual('Install');
      // Expect the message body to be stored verbatim.
      expect(entry.text).assertEqual('font installed');
      // Expect the level bucket to be stored verbatim.
      expect(entry.level).assertEqual('info');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
