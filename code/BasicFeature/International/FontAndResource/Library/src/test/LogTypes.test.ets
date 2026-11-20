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

// Import the hypium test framework primitives used by this suite.
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
// Import hilog directly for unit test progress logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the log entry model and helpers under test.
import { LogEntry, appendLog, nowTimeText } from '../main/ets/fontresource/model/LogTypes';

// The hilog domain shared by all case logs in this suite.
const DOMAIN: number = 0xF811;

// The module tag used by every fixture log entry.
const SAMPLE_TAG: string = 'Test';
// The level bucket used by every fixture log entry.
const SAMPLE_LEVEL: string = 'info';
// The expected character length of the "HH:mm:ss" time text.
const TIME_TEXT_LENGTH: number = 8;
// The small list limit used by the trimming tests.
const SMALL_LIMIT: number = 3;

// Builds one fixture log entry with the given id.
function createEntry(id: number): LogEntry {
  // Construct the entry with fixed time, tag, level and a message carrying the id.
  return new LogEntry(id, '00:00:00', SAMPLE_TAG, 'entry ' + id, SAMPLE_LEVEL);
}

// The test suite covering the LogTypes helpers.
export default function logTypesTest() {
  // Group the cases under the "LogTypes" describe block.
  describe('LogTypes', () => {
    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_APPENDLOG_0100
     * @tc.name      testAppendLog0001
     * @tc.desc      Verify a newly appended entry lands first and the older entry is preserved.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAppendLog0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testAppendLog0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Create the first fixture entry.
      const first: LogEntry = createEntry(1);
      // Create the second fixture entry.
      const second: LogEntry = createEntry(2);
      // Append the second entry on top of the first with a small limit.
      const next: LogEntry[] = appendLog([first], second, SMALL_LIMIT);
      // Expect the resulting list to hold both entries.
      expect(next.length).assertEqual(2);
      // Expect the newest entry to sit at the head of the list.
      expect(next[0].id).assertEqual(2);
      // Expect the older entry to be retained after the newest.
      expect(next[1].id).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_APPENDLOG_0200
     * @tc.name      testAppendLog0002
     * @tc.desc      Verify the log list is trimmed to the limit while keeping the newest entries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAppendLog0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testAppendLog0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a full list of three fixture entries.
      const list: LogEntry[] = [createEntry(1), createEntry(2), createEntry(3)];
      // Append a fourth entry which should push the oldest out.
      const next: LogEntry[] = appendLog(list, createEntry(4), SMALL_LIMIT);
      // Expect the list length to be capped at the limit.
      expect(next.length).assertEqual(SMALL_LIMIT);
      // Expect the newest entry to sit at the head of the list.
      expect(next[0].id).assertEqual(4);
      // Expect the oldest surviving entry to be id 2.
      expect(next[2].id).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_NOWTIMETEXT_0100
     * @tc.name      testNowTimeText0001
     * @tc.desc      Verify the wall clock text keeps the "HH:mm:ss" shape.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNowTimeText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNowTimeText0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Expect the generated time text to be exactly eight characters long.
      expect(nowTimeText().length).assertEqual(TIME_TEXT_LENGTH);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
