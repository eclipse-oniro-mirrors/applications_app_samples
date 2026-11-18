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

import { describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
import { QueryOutcome, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import {
  REVISIT_ARCHIVE_AGE_MS, REVISIT_ARCHIVE_LIMIT, REVISIT_ATTEMPT_LIMIT, REVISIT_TIMEOUT_MS,
  RevisitComparison, RevisitSession, RevisitStage, RevisitTracker, compareSamples,
  isComparableRecord, valueText
} from '../../../main/ets/autostart/revisit/RevisitTracker';

/** 固定基准时间，避免用例之间互相依赖真实时钟。 */
const BASE: number = 1700000000000;

/** 造一条查询记录。 */
function recordOf(id: number, timestamp: number, source: RefreshSource, result: string,
  outcome: QueryOutcome): QueryRecord {
  const record: QueryRecord = new QueryRecord();
  record.id = id;
  record.timestamp = timestamp;
  record.source = source;
  record.result = result;
  record.outcome = outcome;
  return record;
}

/** 一组合法的"设置后查询"样本：result 必须是开关文案。 */
function settingRecord(id: number, timestamp: number, on: boolean): QueryRecord {
  return recordOf(id, timestamp, RefreshSource.SETTINGS, on ? '已开启' : '未开启',
    QueryOutcome.SUCCESS);
}

/** 把会话推进到 RETURNED，返回跟踪器。 */
function trackerAtReturned(before: QueryRecord | undefined, leftAt: number,
  returnedAt: number): RevisitTracker {
  const tracker: RevisitTracker = new RevisitTracker();
  tracker.begin(before, 1, BASE);
  tracker.markLeft(leftAt);
  tracker.markReturned(returnedAt);
  return tracker;
}

export default function revisitFlowMatrixCasesTest(): void {
  configureTestText();
  describe('RevisitValueCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_REVISITVALUECASES_0100
     * @tc.name      testRevisitValueCases0001
     * @tc.desc      Verify missing value is not false
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitValueCases0001', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0001|RevisitFlowMatrixCases.test.ets|assert0001|assertEqual|actual', valueText(null))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitValueCases_0001|RevisitFlowMatrixCases.test.ets|assert0001|assertEqual|expected', '未获取'));
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0001|RevisitFlowMatrixCases.test.ets|assert0002|assertFalse|actual|expected=false', valueText(null) === valueText(false))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0001|RevisitFlowMatrixCases.test.ets|assert0003|assertTrue|actual|expected=true', valueText(null).length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITVALUECASES_0200
     * @tc.name      testRevisitValueCases0002
     * @tc.desc      Verify known values use switch wording
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitValueCases0002', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0002|RevisitFlowMatrixCases.test.ets|assert0004|assertEqual|actual', valueText(true))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitValueCases_0002|RevisitFlowMatrixCases.test.ets|assert0004|assertEqual|expected', '已开启'));
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0002|RevisitFlowMatrixCases.test.ets|assert0005|assertEqual|actual', valueText(false))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitValueCases_0002|RevisitFlowMatrixCases.test.ets|assert0005|assertEqual|expected', '未开启'));
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0002|RevisitFlowMatrixCases.test.ets|assert0006|assertFalse|actual|expected=false', valueText(true) === valueText(false))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITVALUECASES_0300
     * @tc.name      testRevisitValueCases0003
     * @tc.desc      Verify three value texts are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testRevisitValueCases0003', 0, (): void => {
      configureTestText();
      const texts: string[] = [valueText(null), valueText(true), valueText(false)];
      const unique: string[] = texts.filter((text: string, index: number): boolean =>
        texts.indexOf(text) === index);
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0003|RevisitFlowMatrixCases.test.ets|assert0007|assertEqual|actual', unique.length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitValueCases_0003|RevisitFlowMatrixCases.test.ets|assert0007|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0003|RevisitFlowMatrixCases.test.ets|assert0008|assertTrue|actual|expected=true', texts.every((text: string): boolean => text.length > 0))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0003|RevisitFlowMatrixCases.test.ets|assert0009|assertFalse|actual|expected=false', valueText(true) === valueText(false))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITVALUECASES_0400
     * @tc.name      testRevisitValueCases0004
     * @tc.desc      Verify missing record is not comparable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitValueCases0004', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0004|RevisitFlowMatrixCases.test.ets|assert0010|assertFalse|actual|expected=false', isComparableRecord(undefined))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0004|RevisitFlowMatrixCases.test.ets|assert0011|assertTrue|actual|expected=true', isComparableRecord(settingRecord(1, BASE, true)))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0004|RevisitFlowMatrixCases.test.ets|assert0012|assertTrue|actual|expected=true', isComparableRecord(settingRecord(1, BASE, false)))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITVALUECASES_0500
     * @tc.name      testRevisitValueCases0005
     * @tc.desc      Verify failed outcome is not comparable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitValueCases0005', 0, (): void => {
      configureTestText();
      const failed: QueryRecord = recordOf(1, BASE, RefreshSource.SETTINGS, '已开启',
        QueryOutcome.FAILURE);
      const timeout: QueryRecord = recordOf(2, BASE, RefreshSource.SETTINGS, '已开启',
        QueryOutcome.TIMEOUT);
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0005|RevisitFlowMatrixCases.test.ets|assert0013|assertFalse|actual|expected=false', isComparableRecord(failed))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0005|RevisitFlowMatrixCases.test.ets|assert0014|assertFalse|actual|expected=false', isComparableRecord(timeout))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0005|RevisitFlowMatrixCases.test.ets|assert0015|assertFalse|actual|expected=false', isComparableRecord(recordOf(3, BASE, RefreshSource.SETTINGS, '已开启',
        QueryOutcome.UNSUPPORTED)))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITVALUECASES_0600
     * @tc.name      testRevisitValueCases0006
     * @tc.desc      Verify unknown result text is not comparable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testRevisitValueCases0006', 0, (): void => {
      configureTestText();
      const blank: QueryRecord = recordOf(1, BASE, RefreshSource.SETTINGS, '',
        QueryOutcome.SUCCESS);
      const other: QueryRecord = recordOf(2, BASE, RefreshSource.SETTINGS, '待调用',
        QueryOutcome.SUCCESS);
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0006|RevisitFlowMatrixCases.test.ets|assert0016|assertFalse|actual|expected=false', isComparableRecord(blank))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0006|RevisitFlowMatrixCases.test.ets|assert0017|assertFalse|actual|expected=false', isComparableRecord(other))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0006|RevisitFlowMatrixCases.test.ets|assert0018|assertTrue|actual|expected=true', isComparableRecord(settingRecord(3, BASE, true)))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITVALUECASES_0700
     * @tc.name      testRevisitValueCases0007
     * @tc.desc      Verify source does not decide comparability
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitValueCases0007', 0, (): void => {
      configureTestText();
      const manual: QueryRecord = recordOf(1, BASE, RefreshSource.MANUAL, '已开启',
        QueryOutcome.SUCCESS);
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0007|RevisitFlowMatrixCases.test.ets|assert0019|assertTrue|actual|expected=true', isComparableRecord(manual))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0007|RevisitFlowMatrixCases.test.ets|assert0020|assertEqual|actual', manual.source)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitValueCases_0007|RevisitFlowMatrixCases.test.ets|assert0020|assertEqual|expected', RefreshSource.MANUAL));
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0007|RevisitFlowMatrixCases.test.ets|assert0021|assertEqual|actual', manual.result)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitValueCases_0007|RevisitFlowMatrixCases.test.ets|assert0021|assertEqual|expected', '已开启'));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITVALUECASES_0800
     * @tc.name      testRevisitValueCases0008
     * @tc.desc      Verify revisit constants are bounded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testRevisitValueCases0008', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0008|RevisitFlowMatrixCases.test.ets|assert0022|assertEqual|actual', REVISIT_TIMEOUT_MS)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitValueCases_0008|RevisitFlowMatrixCases.test.ets|assert0022|assertEqual|expected', 600000));
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0008|RevisitFlowMatrixCases.test.ets|assert0023|assertEqual|actual', REVISIT_ARCHIVE_LIMIT)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitValueCases_0008|RevisitFlowMatrixCases.test.ets|assert0023|assertEqual|expected', 10));
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0008|RevisitFlowMatrixCases.test.ets|assert0024|assertEqual|actual', REVISIT_ATTEMPT_LIMIT)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitValueCases_0008|RevisitFlowMatrixCases.test.ets|assert0024|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_RevisitValueCases_0008|RevisitFlowMatrixCases.test.ets|assert0025|assertTrue|actual|expected=true', REVISIT_ARCHIVE_AGE_MS > REVISIT_TIMEOUT_MS)).assertTrue();
    });
  });

  describe('RevisitCompareCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_REVISITCOMPARECASES_0100
     * @tc.name      testRevisitCompareCases0001
     * @tc.desc      Verify missing before explains reason
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitCompareCases0001', 0, (): void => {
      configureTestText();
      const comparison: RevisitComparison = compareSamples(undefined,
        settingRecord(2, BASE + 1000, true));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0001|RevisitFlowMatrixCases.test.ets|assert0026|assertFalse|actual|expected=false', comparison.comparable)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0001|RevisitFlowMatrixCases.test.ets|assert0027|assertEqual|actual', comparison.reason)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0001|RevisitFlowMatrixCases.test.ets|assert0027|assertEqual|expected', '缺少离开前样本'));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0001|RevisitFlowMatrixCases.test.ets|assert0028|assertTrue|actual|expected=true', comparison.summary().indexOf('无法比较') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITCOMPARECASES_0200
     * @tc.name      testRevisitCompareCases0002
     * @tc.desc      Verify missing after explains reason
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitCompareCases0002', 0, (): void => {
      configureTestText();
      const comparison: RevisitComparison = compareSamples(
        settingRecord(1, BASE, true), undefined);
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0002|RevisitFlowMatrixCases.test.ets|assert0029|assertFalse|actual|expected=false', comparison.comparable)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0002|RevisitFlowMatrixCases.test.ets|assert0030|assertEqual|actual', comparison.reason)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0002|RevisitFlowMatrixCases.test.ets|assert0030|assertEqual|expected', '缺少返回后样本'));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0002|RevisitFlowMatrixCases.test.ets|assert0031|assertEqual|actual', comparison.elapsed)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0002|RevisitFlowMatrixCases.test.ets|assert0031|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITCOMPARECASES_0300
     * @tc.name      testRevisitCompareCases0003
     * @tc.desc      Verify uncomparable before carries outcome
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitCompareCases0003', 0, (): void => {
      configureTestText();
      const failed: QueryRecord = recordOf(1, BASE, RefreshSource.SETTINGS, '已开启',
        QueryOutcome.FAILURE);
      const comparison: RevisitComparison = compareSamples(failed,
        settingRecord(2, BASE + 1000, true));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0003|RevisitFlowMatrixCases.test.ets|assert0032|assertFalse|actual|expected=false', comparison.comparable)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0003|RevisitFlowMatrixCases.test.ets|assert0033|assertTrue|actual|expected=true', comparison.reason.indexOf('离开前') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0003|RevisitFlowMatrixCases.test.ets|assert0034|assertTrue|actual|expected=true', comparison.reason.indexOf(QueryOutcome.FAILURE as string) >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITCOMPARECASES_0400
     * @tc.name      testRevisitCompareCases0004
     * @tc.desc      Verify uncomparable after carries outcome
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitCompareCases0004', 0, (): void => {
      configureTestText();
      const timeout: QueryRecord = recordOf(2, BASE + 1000, RefreshSource.SETTINGS, '未开启',
        QueryOutcome.TIMEOUT);
      const comparison: RevisitComparison = compareSamples(
        settingRecord(1, BASE, true), timeout);
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0004|RevisitFlowMatrixCases.test.ets|assert0035|assertFalse|actual|expected=false', comparison.comparable)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0004|RevisitFlowMatrixCases.test.ets|assert0036|assertTrue|actual|expected=true', comparison.reason.indexOf('返回后') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0004|RevisitFlowMatrixCases.test.ets|assert0037|assertTrue|actual|expected=true', comparison.reason.indexOf(QueryOutcome.TIMEOUT as string) >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITCOMPARECASES_0500
     * @tc.name      testRevisitCompareCases0005
     * @tc.desc      Verify unchanged state is detected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitCompareCases0005', 0, (): void => {
      configureTestText();
      const comparison: RevisitComparison = compareSamples(
        settingRecord(1, BASE, false), settingRecord(2, BASE + 5000, false));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0005|RevisitFlowMatrixCases.test.ets|assert0038|assertTrue|actual|expected=true', comparison.comparable)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0005|RevisitFlowMatrixCases.test.ets|assert0039|assertFalse|actual|expected=false', comparison.changed)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0005|RevisitFlowMatrixCases.test.ets|assert0040|assertEqual|actual', comparison.beforeValue)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0005|RevisitFlowMatrixCases.test.ets|assert0040|assertEqual|expected', '未开启'));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0005|RevisitFlowMatrixCases.test.ets|assert0041|assertEqual|actual', comparison.afterValue)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0005|RevisitFlowMatrixCases.test.ets|assert0041|assertEqual|expected', '未开启'));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITCOMPARECASES_0600
     * @tc.name      testRevisitCompareCases0006
     * @tc.desc      Verify changed state is detected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitCompareCases0006', 0, (): void => {
      configureTestText();
      const comparison: RevisitComparison = compareSamples(
        settingRecord(1, BASE, false), settingRecord(2, BASE + 5000, true));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0006|RevisitFlowMatrixCases.test.ets|assert0042|assertTrue|actual|expected=true', comparison.comparable)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0006|RevisitFlowMatrixCases.test.ets|assert0043|assertTrue|actual|expected=true', comparison.changed)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0006|RevisitFlowMatrixCases.test.ets|assert0044|assertEqual|actual', comparison.beforeValue)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0006|RevisitFlowMatrixCases.test.ets|assert0044|assertEqual|expected', '未开启'));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0006|RevisitFlowMatrixCases.test.ets|assert0045|assertEqual|actual', comparison.afterValue)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0006|RevisitFlowMatrixCases.test.ets|assert0045|assertEqual|expected', '已开启'));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITCOMPARECASES_0700
     * @tc.name      testRevisitCompareCases0007
     * @tc.desc      Verify elapsed uses timestamps
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitCompareCases0007', 0, (): void => {
      configureTestText();
      const comparison: RevisitComparison = compareSamples(
        settingRecord(1, BASE, true), settingRecord(2, BASE + 30000, true));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0007|RevisitFlowMatrixCases.test.ets|assert0046|assertEqual|actual', comparison.elapsed)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0007|RevisitFlowMatrixCases.test.ets|assert0046|assertEqual|expected', 30000));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0007|RevisitFlowMatrixCases.test.ets|assert0047|assertTrue|actual|expected=true', comparison.elapsed > 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0007|RevisitFlowMatrixCases.test.ets|assert0048|assertTrue|actual|expected=true', comparison.comparable)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITCOMPARECASES_0800
     * @tc.name      testRevisitCompareCases0008
     * @tc.desc      Verify elapsed is never negative
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitCompareCases0008', 0, (): void => {
      configureTestText();
      const comparison: RevisitComparison = compareSamples(
        settingRecord(1, BASE + 5000, true), settingRecord(2, BASE, true));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0008|RevisitFlowMatrixCases.test.ets|assert0049|assertEqual|actual', comparison.elapsed)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0008|RevisitFlowMatrixCases.test.ets|assert0049|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0008|RevisitFlowMatrixCases.test.ets|assert0050|assertTrue|actual|expected=true', comparison.comparable)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0008|RevisitFlowMatrixCases.test.ets|assert0051|assertFalse|actual|expected=false', comparison.elapsed === 5000)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITCOMPARECASES_0900
     * @tc.name      testRevisitCompareCases0009
     * @tc.desc      Verify summary describes change
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitCompareCases0009', 0, (): void => {
      configureTestText();
      const changed: RevisitComparison = compareSamples(
        settingRecord(1, BASE, false), settingRecord(2, BASE + 1, true));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0009|RevisitFlowMatrixCases.test.ets|assert0052|assertTrue|actual|expected=true', changed.summary().indexOf('状态已变化') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0009|RevisitFlowMatrixCases.test.ets|assert0053|assertTrue|actual|expected=true', changed.summary().indexOf('未开启') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0009|RevisitFlowMatrixCases.test.ets|assert0054|assertTrue|actual|expected=true', changed.summary().indexOf('已开启') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITCOMPARECASES_1000
     * @tc.name      testRevisitCompareCases0010
     * @tc.desc      Verify summary describes stability
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitCompareCases0010', 0, (): void => {
      configureTestText();
      const stable: RevisitComparison = compareSamples(
        settingRecord(1, BASE, true), settingRecord(2, BASE + 1, true));
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0010|RevisitFlowMatrixCases.test.ets|assert0055|assertTrue|actual|expected=true', stable.summary().indexOf('状态未变化') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0010|RevisitFlowMatrixCases.test.ets|assert0056|assertTrue|actual|expected=true', stable.summary().indexOf('已开启') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0010|RevisitFlowMatrixCases.test.ets|assert0057|assertEqual|actual', stable.summary().indexOf('无法比较'))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitCompareCases_0010|RevisitFlowMatrixCases.test.ets|assert0057|assertEqual|expected', -1));
    });
  });

  describe('RevisitStageMachineCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_0100
     * @tc.name      testRevisitStageMachineCases0001
     * @tc.desc      Verify fresh tracker is idle and guidable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0001', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0001|RevisitFlowMatrixCases.test.ets|assert0058|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0001|RevisitFlowMatrixCases.test.ets|assert0058|assertEqual|expected', RevisitStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0001|RevisitFlowMatrixCases.test.ets|assert0059|assertTrue|actual|expected=true', tracker.canGuide())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0001|RevisitFlowMatrixCases.test.ets|assert0060|assertFalse|actual|expected=false', tracker.isWaiting())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0001|RevisitFlowMatrixCases.test.ets|assert0061|assertEqual|actual', tracker.archived().length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0001|RevisitFlowMatrixCases.test.ets|assert0061|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_0200
     * @tc.name      testRevisitStageMachineCases0002
     * @tc.desc      Verify begin enters guided stage
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0002', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      const session: RevisitSession = tracker.begin(settingRecord(1, BASE, true), 2, BASE);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0002|RevisitFlowMatrixCases.test.ets|assert0062|assertEqual|actual', session.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0002|RevisitFlowMatrixCases.test.ets|assert0062|assertEqual|expected', RevisitStage.GUIDED));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0002|RevisitFlowMatrixCases.test.ets|assert0063|assertEqual|actual', session.createdAt)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0002|RevisitFlowMatrixCases.test.ets|assert0063|assertEqual|expected', BASE));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0002|RevisitFlowMatrixCases.test.ets|assert0064|assertEqual|actual', session.guidanceRevision)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0002|RevisitFlowMatrixCases.test.ets|assert0064|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0002|RevisitFlowMatrixCases.test.ets|assert0065|assertEqual|actual', session.conclusion)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0002|RevisitFlowMatrixCases.test.ets|assert0065|assertEqual|expected', '尚未判断'));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_0300
     * @tc.name      testRevisitStageMachineCases0003
     * @tc.desc      Verify begin assigns increasing serial
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0003', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      const first: RevisitSession = tracker.begin(undefined, 1, BASE);
      const second: RevisitSession = tracker.begin(undefined, 1, BASE + 1);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0003|RevisitFlowMatrixCases.test.ets|assert0066|assertEqual|actual', first.sessionId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0003|RevisitFlowMatrixCases.test.ets|assert0066|assertEqual|expected', `revisit-${BASE}-1`));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0003|RevisitFlowMatrixCases.test.ets|assert0067|assertEqual|actual', second.sessionId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0003|RevisitFlowMatrixCases.test.ets|assert0067|assertEqual|expected', `revisit-${BASE + 1}-2`));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0003|RevisitFlowMatrixCases.test.ets|assert0068|assertFalse|actual|expected=false', first.sessionId === second.sessionId)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_0400
     * @tc.name      testRevisitStageMachineCases0004
     * @tc.desc      Verify mark left requires guided stage
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0004', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      const rejected: RevisitSession = tracker.markLeft(BASE);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0004|RevisitFlowMatrixCases.test.ets|assert0069|assertEqual|actual', rejected.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0004|RevisitFlowMatrixCases.test.ets|assert0069|assertEqual|expected', RevisitStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0004|RevisitFlowMatrixCases.test.ets|assert0070|assertTrue|actual|expected=true', tracker.notice().indexOf('不接受离开事件') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0004|RevisitFlowMatrixCases.test.ets|assert0071|assertEqual|actual', tracker.snapshot().leftAt)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0004|RevisitFlowMatrixCases.test.ets|assert0071|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_0500
     * @tc.name      testRevisitStageMachineCases0005
     * @tc.desc      Verify mark left records departure time
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0005', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      const left: RevisitSession = tracker.markLeft(BASE + 2000);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0005|RevisitFlowMatrixCases.test.ets|assert0072|assertEqual|actual', left.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0005|RevisitFlowMatrixCases.test.ets|assert0072|assertEqual|expected', RevisitStage.LEFT));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0005|RevisitFlowMatrixCases.test.ets|assert0073|assertEqual|actual', left.leftAt)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0005|RevisitFlowMatrixCases.test.ets|assert0073|assertEqual|expected', BASE + 2000));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0005|RevisitFlowMatrixCases.test.ets|assert0074|assertTrue|actual|expected=true', tracker.isWaiting())).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_0600
     * @tc.name      testRevisitStageMachineCases0006
     * @tc.desc      Verify mark returned requires left stage
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0006', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      const rejected: RevisitSession = tracker.markReturned(BASE + 10);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0006|RevisitFlowMatrixCases.test.ets|assert0075|assertEqual|actual', rejected.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0006|RevisitFlowMatrixCases.test.ets|assert0075|assertEqual|expected', RevisitStage.GUIDED));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0006|RevisitFlowMatrixCases.test.ets|assert0076|assertTrue|actual|expected=true', tracker.notice().indexOf('不接受返回事件') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0006|RevisitFlowMatrixCases.test.ets|assert0077|assertEqual|actual', rejected.returnedAt)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0006|RevisitFlowMatrixCases.test.ets|assert0077|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_0700
     * @tc.name      testRevisitStageMachineCases0007
     * @tc.desc      Verify mark returned completes round
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0007', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.markLeft(BASE + 1000);
      const returned: RevisitSession = tracker.markReturned(BASE + 60000);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0007|RevisitFlowMatrixCases.test.ets|assert0078|assertEqual|actual', returned.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0007|RevisitFlowMatrixCases.test.ets|assert0078|assertEqual|expected', RevisitStage.RETURNED));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0007|RevisitFlowMatrixCases.test.ets|assert0079|assertEqual|actual', returned.returnedAt)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0007|RevisitFlowMatrixCases.test.ets|assert0079|assertEqual|expected', BASE + 60000));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0007|RevisitFlowMatrixCases.test.ets|assert0080|assertTrue|actual|expected=true', tracker.notice().indexOf('请重新查询') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_0800
     * @tc.name      testRevisitStageMachineCases0008
     * @tc.desc      Verify mark rechecked requires returned stage
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0008', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, false), 1, BASE);
      tracker.markLeft(BASE + 1000);
      const rejected: RevisitSession = tracker.markRechecked(settingRecord(2, BASE + 2000, true),
        BASE + 2000);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0008|RevisitFlowMatrixCases.test.ets|assert0081|assertEqual|actual', rejected.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0008|RevisitFlowMatrixCases.test.ets|assert0081|assertEqual|expected', RevisitStage.LEFT));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0008|RevisitFlowMatrixCases.test.ets|assert0082|assertTrue|actual|expected=true', tracker.notice().indexOf('不接受回查事件') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0008|RevisitFlowMatrixCases.test.ets|assert0083|assertTrue|actual|expected=true', rejected.after === undefined)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_0900
     * @tc.name      testRevisitStageMachineCases0009
     * @tc.desc      Verify mark rechecked stores comparison
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0009', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, false),
        BASE + 1000, BASE + 60000);
      const done: RevisitSession = tracker.markRechecked(settingRecord(2, BASE + 90000, true),
        BASE + 91000);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0009|RevisitFlowMatrixCases.test.ets|assert0084|assertEqual|actual', done.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0009|RevisitFlowMatrixCases.test.ets|assert0084|assertEqual|expected', RevisitStage.RECHECKED));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0009|RevisitFlowMatrixCases.test.ets|assert0085|assertTrue|actual|expected=true', done.conclusion.indexOf('状态已变化') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0009|RevisitFlowMatrixCases.test.ets|assert0086|assertEqual|actual', done.attempts.length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0009|RevisitFlowMatrixCases.test.ets|assert0086|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0009|RevisitFlowMatrixCases.test.ets|assert0087|assertTrue|actual|expected=true', tracker.isCompleted())).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_1000
     * @tc.name      testRevisitStageMachineCases0010
     * @tc.desc      Verify mark rechecked without sample stays incomplete
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0010', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      const done: RevisitSession = tracker.markRechecked(undefined, BASE + 61000);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0010|RevisitFlowMatrixCases.test.ets|assert0088|assertEqual|actual', done.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0010|RevisitFlowMatrixCases.test.ets|assert0088|assertEqual|expected', RevisitStage.RECHECKED));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0010|RevisitFlowMatrixCases.test.ets|assert0089|assertTrue|actual|expected=true', done.conclusion.indexOf('缺少返回后样本') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0010|RevisitFlowMatrixCases.test.ets|assert0090|assertEqual|actual', done.attempts.length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0010|RevisitFlowMatrixCases.test.ets|assert0090|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0010|RevisitFlowMatrixCases.test.ets|assert0091|assertFalse|actual|expected=false', tracker.isCompleted())).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_1100
     * @tc.name      testRevisitStageMachineCases0011
     * @tc.desc      Verify attempts are bounded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0011', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.markRechecked(undefined, BASE + 61000);
      for (let round = 0; round < REVISIT_ATTEMPT_LIMIT + 2; round++) {
        const unusable: QueryRecord = recordOf(10 + round, BASE + 63000 + round,
          RefreshSource.SETTINGS, '待调用', QueryOutcome.SUCCESS);
        tracker.retry();
        tracker.markRechecked(unusable, BASE + 64000 + round);
      }
      const snapshot: RevisitSession = tracker.snapshot();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0011|RevisitFlowMatrixCases.test.ets|assert0092|assertEqual|actual', snapshot.attempts.length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0011|RevisitFlowMatrixCases.test.ets|assert0092|assertEqual|expected', REVISIT_ATTEMPT_LIMIT));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0011|RevisitFlowMatrixCases.test.ets|assert0093|assertTrue|actual|expected=true', snapshot.attempts.length <= REVISIT_ATTEMPT_LIMIT)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0011|RevisitFlowMatrixCases.test.ets|assert0094|assertEqual|actual', snapshot.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0011|RevisitFlowMatrixCases.test.ets|assert0094|assertEqual|expected', RevisitStage.RECHECKED));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0011|RevisitFlowMatrixCases.test.ets|assert0095|assertFalse|actual|expected=false', tracker.isCompleted())).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_1200
     * @tc.name      testRevisitStageMachineCases0012
     * @tc.desc      Verify can guide covers terminal stages
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0012', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0012|RevisitFlowMatrixCases.test.ets|assert0096|assertTrue|actual|expected=true', tracker.canGuide())).assertTrue();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0012|RevisitFlowMatrixCases.test.ets|assert0097|assertFalse|actual|expected=false', tracker.canGuide())).assertFalse();
      tracker.markLeft(BASE + 1000);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0012|RevisitFlowMatrixCases.test.ets|assert0098|assertFalse|actual|expected=false', tracker.canGuide())).assertFalse();
      tracker.markReturned(BASE + 2000);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0012|RevisitFlowMatrixCases.test.ets|assert0099|assertFalse|actual|expected=false', tracker.canGuide())).assertFalse();
      tracker.markRechecked(settingRecord(2, BASE + 3000, true), BASE + 4000);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0012|RevisitFlowMatrixCases.test.ets|assert0100|assertTrue|actual|expected=true', tracker.canGuide())).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_1300
     * @tc.name      testRevisitStageMachineCases0013
     * @tc.desc      Verify remaining millis only while waiting
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0013', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0013|RevisitFlowMatrixCases.test.ets|assert0101|assertEqual|actual', tracker.remainingMillis(BASE))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0013|RevisitFlowMatrixCases.test.ets|assert0101|assertEqual|expected', -1));
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0013|RevisitFlowMatrixCases.test.ets|assert0102|assertEqual|actual', tracker.remainingMillis(BASE))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0013|RevisitFlowMatrixCases.test.ets|assert0102|assertEqual|expected', -1));
      tracker.markLeft(BASE);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0013|RevisitFlowMatrixCases.test.ets|assert0103|assertEqual|actual', tracker.remainingMillis(BASE))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0013|RevisitFlowMatrixCases.test.ets|assert0103|assertEqual|expected', REVISIT_TIMEOUT_MS));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0013|RevisitFlowMatrixCases.test.ets|assert0104|assertEqual|actual', tracker.remainingMillis(BASE + 1000))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0013|RevisitFlowMatrixCases.test.ets|assert0104|assertEqual|expected', REVISIT_TIMEOUT_MS - 1000));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_1400
     * @tc.name      testRevisitStageMachineCases0014
     * @tc.desc      Verify remaining millis floors at zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0014', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.markLeft(BASE);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0014|RevisitFlowMatrixCases.test.ets|assert0105|assertEqual|actual', tracker.remainingMillis(BASE + REVISIT_TIMEOUT_MS * 3))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0014|RevisitFlowMatrixCases.test.ets|assert0105|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0014|RevisitFlowMatrixCases.test.ets|assert0106|assertTrue|actual|expected=true', tracker.remainingMillis(BASE + REVISIT_TIMEOUT_MS) >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0014|RevisitFlowMatrixCases.test.ets|assert0107|assertTrue|actual|expected=true', tracker.remainingMillis(BASE) >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_1500
     * @tc.name      testRevisitStageMachineCases0015
     * @tc.desc      Verify expiry only fires at boundary
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0015', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.markLeft(BASE);
      const early: RevisitSession = tracker.checkExpiry(BASE + REVISIT_TIMEOUT_MS - 1);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0015|RevisitFlowMatrixCases.test.ets|assert0108|assertEqual|actual', early.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0015|RevisitFlowMatrixCases.test.ets|assert0108|assertEqual|expected', RevisitStage.LEFT));
      const late: RevisitSession = tracker.checkExpiry(BASE + REVISIT_TIMEOUT_MS);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0015|RevisitFlowMatrixCases.test.ets|assert0109|assertEqual|actual', late.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0015|RevisitFlowMatrixCases.test.ets|assert0109|assertEqual|expected', RevisitStage.EXPIRED));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0015|RevisitFlowMatrixCases.test.ets|assert0110|assertTrue|actual|expected=true', late.conclusion.indexOf('未返回') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_1600
     * @tc.name      testRevisitStageMachineCases0016
     * @tc.desc      Verify return after timeout expires
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0016', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.markLeft(BASE);
      const late: RevisitSession = tracker.markReturned(BASE + REVISIT_TIMEOUT_MS + 1);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0016|RevisitFlowMatrixCases.test.ets|assert0111|assertEqual|actual', late.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0016|RevisitFlowMatrixCases.test.ets|assert0111|assertEqual|expected', RevisitStage.EXPIRED));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0016|RevisitFlowMatrixCases.test.ets|assert0112|assertTrue|actual|expected=true', tracker.notice().indexOf('过期') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0016|RevisitFlowMatrixCases.test.ets|assert0113|assertEqual|actual', late.returnedAt)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0016|RevisitFlowMatrixCases.test.ets|assert0113|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_1700
     * @tc.name      testRevisitStageMachineCases0017
     * @tc.desc      Verify cancel from guided stops round
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0017', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      const cancelled: RevisitSession = tracker.cancel(BASE + 500);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0017|RevisitFlowMatrixCases.test.ets|assert0114|assertEqual|actual', cancelled.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0017|RevisitFlowMatrixCases.test.ets|assert0114|assertEqual|expected', RevisitStage.CANCELLED));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0017|RevisitFlowMatrixCases.test.ets|assert0115|assertTrue|actual|expected=true', cancelled.cancelled)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0017|RevisitFlowMatrixCases.test.ets|assert0116|assertEqual|actual', cancelled.conclusion)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0017|RevisitFlowMatrixCases.test.ets|assert0116|assertEqual|expected', '用户取消，未做判断'));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0017|RevisitFlowMatrixCases.test.ets|assert0117|assertEqual|actual', tracker.notice())).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0017|RevisitFlowMatrixCases.test.ets|assert0117|assertEqual|expected', '已取消回访'));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_1800
     * @tc.name      testRevisitStageMachineCases0018
     * @tc.desc      Verify cancel from idle is ignored
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0018', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      const unchanged: RevisitSession = tracker.cancel(BASE);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0018|RevisitFlowMatrixCases.test.ets|assert0118|assertEqual|actual', unchanged.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0018|RevisitFlowMatrixCases.test.ets|assert0118|assertEqual|expected', RevisitStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0018|RevisitFlowMatrixCases.test.ets|assert0119|assertFalse|actual|expected=false', unchanged.cancelled)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0018|RevisitFlowMatrixCases.test.ets|assert0120|assertEqual|actual', tracker.notice())).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0018|RevisitFlowMatrixCases.test.ets|assert0120|assertEqual|expected', ''));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_1900
     * @tc.name      testRevisitStageMachineCases0019
     * @tc.desc      Verify cancel keeps completed round
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0019', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, false),
        BASE + 1000, BASE + 60000);
      tracker.markRechecked(settingRecord(2, BASE + 61000, true), BASE + 62000);
      const after: RevisitSession = tracker.cancel(BASE + 63000);
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0019|RevisitFlowMatrixCases.test.ets|assert0121|assertEqual|actual', after.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0019|RevisitFlowMatrixCases.test.ets|assert0121|assertEqual|expected', RevisitStage.RECHECKED));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0019|RevisitFlowMatrixCases.test.ets|assert0122|assertFalse|actual|expected=false', after.cancelled)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0019|RevisitFlowMatrixCases.test.ets|assert0123|assertTrue|actual|expected=true', tracker.isCompleted())).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_2000
     * @tc.name      testRevisitStageMachineCases0020
     * @tc.desc      Verify source for record is settings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0020', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0020|RevisitFlowMatrixCases.test.ets|assert0124|assertEqual|actual', tracker.sourceForRecord())).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0020|RevisitFlowMatrixCases.test.ets|assert0124|assertEqual|expected', RefreshSource.SETTINGS));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0020|RevisitFlowMatrixCases.test.ets|assert0125|assertFalse|actual|expected=false', tracker.sourceForRecord() === RefreshSource.MANUAL)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0020|RevisitFlowMatrixCases.test.ets|assert0126|assertEqual|actual', tracker.conclusionText())).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0020|RevisitFlowMatrixCases.test.ets|assert0126|assertEqual|expected', '尚未判断'));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_2100
     * @tc.name      testRevisitStageMachineCases0021
     * @tc.desc      Verify snapshot is independent copy
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0021', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      const snapshot: RevisitSession = tracker.snapshot();
      snapshot.stage = RevisitStage.CANCELLED;
      snapshot.conclusion = '被外部改写';
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0021|RevisitFlowMatrixCases.test.ets|assert0127|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0021|RevisitFlowMatrixCases.test.ets|assert0127|assertEqual|expected', RevisitStage.GUIDED));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0021|RevisitFlowMatrixCases.test.ets|assert0128|assertEqual|actual', tracker.conclusionText())).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0021|RevisitFlowMatrixCases.test.ets|assert0128|assertEqual|expected', '尚未判断'));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0021|RevisitFlowMatrixCases.test.ets|assert0129|assertEqual|actual', snapshot.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0021|RevisitFlowMatrixCases.test.ets|assert0129|assertEqual|expected', RevisitStage.CANCELLED));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITSTAGEMACHINECASES_2200
     * @tc.name      testRevisitStageMachineCases0022
     * @tc.desc      Verify before sample is cloned
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitStageMachineCases0022', 0, (): void => {
      configureTestText();
      const before: QueryRecord = settingRecord(1, BASE, true);
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(before, 1, BASE);
      before.result = '外部改写';
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0022|RevisitFlowMatrixCases.test.ets|assert0130|assertEqual|actual', tracker.snapshot().before?.result)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0022|RevisitFlowMatrixCases.test.ets|assert0130|assertEqual|expected', '已开启'));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0022|RevisitFlowMatrixCases.test.ets|assert0131|assertEqual|actual', tracker.snapshot().before?.id)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0022|RevisitFlowMatrixCases.test.ets|assert0131|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RevisitStageMachineCases_0022|RevisitFlowMatrixCases.test.ets|assert0132|assertFalse|actual|expected=false', tracker.snapshot().before === undefined)).assertFalse();
    });
  });

  describe('RevisitBindingCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_REVISITBINDINGCASES_0100
     * @tc.name      testRevisitBindingCases0001
     * @tc.desc      Verify bind query applies while returned
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitBindingCases0001', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(41);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0001|RevisitFlowMatrixCases.test.ets|assert0133|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0001|RevisitFlowMatrixCases.test.ets|assert0133|assertEqual|expected', 41));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0001|RevisitFlowMatrixCases.test.ets|assert0134|assertEqual|actual', tracker.snapshot().lastQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0001|RevisitFlowMatrixCases.test.ets|assert0134|assertEqual|expected', 41));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0001|RevisitFlowMatrixCases.test.ets|assert0135|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0001|RevisitFlowMatrixCases.test.ets|assert0135|assertEqual|expected', RevisitStage.RETURNED));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITBINDINGCASES_0200
     * @tc.name      testRevisitBindingCases0002
     * @tc.desc      Verify bind query ignored before return
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitBindingCases0002', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.bindQuery(42);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0002|RevisitFlowMatrixCases.test.ets|assert0136|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0002|RevisitFlowMatrixCases.test.ets|assert0136|assertEqual|expected', 0));
      tracker.markLeft(BASE + 1000);
      tracker.bindQuery(42);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0002|RevisitFlowMatrixCases.test.ets|assert0137|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0002|RevisitFlowMatrixCases.test.ets|assert0137|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0002|RevisitFlowMatrixCases.test.ets|assert0138|assertEqual|actual', tracker.snapshot().lastQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0002|RevisitFlowMatrixCases.test.ets|assert0138|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITBINDINGCASES_0300
     * @tc.name      testRevisitBindingCases0003
     * @tc.desc      Verify bind query rejects non positive ids
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitBindingCases0003', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(0);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0003|RevisitFlowMatrixCases.test.ets|assert0139|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0003|RevisitFlowMatrixCases.test.ets|assert0139|assertEqual|expected', 0));
      tracker.bindQuery(-7);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0003|RevisitFlowMatrixCases.test.ets|assert0140|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0003|RevisitFlowMatrixCases.test.ets|assert0140|assertEqual|expected', 0));
      tracker.bindQuery(1.5);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0003|RevisitFlowMatrixCases.test.ets|assert0141|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0003|RevisitFlowMatrixCases.test.ets|assert0141|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITBINDINGCASES_0400
     * @tc.name      testRevisitBindingCases0004
     * @tc.desc      Verify bind query keeps first allocation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitBindingCases0004', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(11);
      tracker.bindQuery(22);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0004|RevisitFlowMatrixCases.test.ets|assert0142|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0004|RevisitFlowMatrixCases.test.ets|assert0142|assertEqual|expected', 11));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0004|RevisitFlowMatrixCases.test.ets|assert0143|assertEqual|actual', tracker.snapshot().lastQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0004|RevisitFlowMatrixCases.test.ets|assert0143|assertEqual|expected', 11));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0004|RevisitFlowMatrixCases.test.ets|assert0144|assertFalse|actual|expected=false', tracker.snapshot().expectedQueryId === 22)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITBINDINGCASES_0500
     * @tc.name      testRevisitBindingCases0005
     * @tc.desc      Verify accept query completes round
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitBindingCases0005', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, false),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(55);
      const accepted: boolean = tracker.acceptQuery(tracker.snapshot().sessionId,
        settingRecord(55, BASE + 70000, true), BASE + 71000);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0005|RevisitFlowMatrixCases.test.ets|assert0145|assertTrue|actual|expected=true', accepted)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0005|RevisitFlowMatrixCases.test.ets|assert0146|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0005|RevisitFlowMatrixCases.test.ets|assert0146|assertEqual|expected', RevisitStage.RECHECKED));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0005|RevisitFlowMatrixCases.test.ets|assert0147|assertEqual|actual', tracker.snapshot().after?.result)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0005|RevisitFlowMatrixCases.test.ets|assert0147|assertEqual|expected', '已开启'));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITBINDINGCASES_0600
     * @tc.name      testRevisitBindingCases0006
     * @tc.desc      Verify accept query rejects foreign session
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitBindingCases0006', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(56);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0006|RevisitFlowMatrixCases.test.ets|assert0148|assertFalse|actual|expected=false', tracker.acceptQuery('revisit-other', settingRecord(56, BASE + 70000, false),
        BASE + 71000))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0006|RevisitFlowMatrixCases.test.ets|assert0149|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0006|RevisitFlowMatrixCases.test.ets|assert0149|assertEqual|expected', RevisitStage.RETURNED));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0006|RevisitFlowMatrixCases.test.ets|assert0150|assertTrue|actual|expected=true', tracker.snapshot().after === undefined)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITBINDINGCASES_0700
     * @tc.name      testRevisitBindingCases0007
     * @tc.desc      Verify accept query rejects unbound id
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitBindingCases0007', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(57);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0007|RevisitFlowMatrixCases.test.ets|assert0151|assertFalse|actual|expected=false', tracker.acceptQuery(tracker.snapshot().sessionId,
        settingRecord(58, BASE + 70000, false), BASE + 71000))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0007|RevisitFlowMatrixCases.test.ets|assert0152|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0007|RevisitFlowMatrixCases.test.ets|assert0152|assertEqual|expected', RevisitStage.RETURNED));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0007|RevisitFlowMatrixCases.test.ets|assert0153|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0007|RevisitFlowMatrixCases.test.ets|assert0153|assertEqual|expected', 57));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITBINDINGCASES_0800
     * @tc.name      testRevisitBindingCases0008
     * @tc.desc      Verify accept query requires settings source
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitBindingCases0008', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(59);
      const manual: QueryRecord = recordOf(59, BASE + 70000, RefreshSource.MANUAL, '未开启',
        QueryOutcome.SUCCESS);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0008|RevisitFlowMatrixCases.test.ets|assert0154|assertFalse|actual|expected=false', tracker.acceptQuery(tracker.snapshot().sessionId, manual, BASE + 71000))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0008|RevisitFlowMatrixCases.test.ets|assert0155|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0008|RevisitFlowMatrixCases.test.ets|assert0155|assertEqual|expected', RevisitStage.RETURNED));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0008|RevisitFlowMatrixCases.test.ets|assert0156|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0008|RevisitFlowMatrixCases.test.ets|assert0156|assertEqual|expected', 59));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITBINDINGCASES_0900
     * @tc.name      testRevisitBindingCases0009
     * @tc.desc      Verify accept query rejects stale timestamp
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitBindingCases0009', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(60);
      const stale: QueryRecord = settingRecord(60, BASE + 30000, false);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0009|RevisitFlowMatrixCases.test.ets|assert0157|assertFalse|actual|expected=false', tracker.acceptQuery(tracker.snapshot().sessionId, stale, BASE + 71000))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0009|RevisitFlowMatrixCases.test.ets|assert0158|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0009|RevisitFlowMatrixCases.test.ets|assert0158|assertEqual|expected', RevisitStage.RETURNED));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0009|RevisitFlowMatrixCases.test.ets|assert0159|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0009|RevisitFlowMatrixCases.test.ets|assert0159|assertEqual|expected', 60));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITBINDINGCASES_1000
     * @tc.name      testRevisitBindingCases0010
     * @tc.desc      Verify accept query records attempt
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitBindingCases0010', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(61);
      tracker.acceptQuery(tracker.snapshot().sessionId, settingRecord(61, BASE + 70000, false),
        BASE + 71000);
      const snapshot: RevisitSession = tracker.snapshot();
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0010|RevisitFlowMatrixCases.test.ets|assert0160|assertEqual|actual', snapshot.attempts.length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0010|RevisitFlowMatrixCases.test.ets|assert0160|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0010|RevisitFlowMatrixCases.test.ets|assert0161|assertEqual|actual', snapshot.attempts[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0010|RevisitFlowMatrixCases.test.ets|assert0161|assertEqual|expected', 61));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0010|RevisitFlowMatrixCases.test.ets|assert0162|assertTrue|actual|expected=true', snapshot.conclusion.indexOf('状态已变化') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITBINDINGCASES_1100
     * @tc.name      testRevisitBindingCases0011
     * @tc.desc      Verify clear binding only while returned
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitBindingCases0011', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(62);
      tracker.clearNativeBinding();
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0011|RevisitFlowMatrixCases.test.ets|assert0163|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0011|RevisitFlowMatrixCases.test.ets|assert0163|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0011|RevisitFlowMatrixCases.test.ets|assert0164|assertEqual|actual', tracker.snapshot().lastQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0011|RevisitFlowMatrixCases.test.ets|assert0164|assertEqual|expected', 62));
      tracker.bindQuery(63);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0011|RevisitFlowMatrixCases.test.ets|assert0165|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0011|RevisitFlowMatrixCases.test.ets|assert0165|assertEqual|expected', 63));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITBINDINGCASES_1200
     * @tc.name      testRevisitBindingCases0012
     * @tc.desc      Verify rebinding after loss allows retry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitBindingCases0012', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(64);
      tracker.clearNativeBinding();
      tracker.bindQuery(65);
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0012|RevisitFlowMatrixCases.test.ets|assert0166|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0012|RevisitFlowMatrixCases.test.ets|assert0166|assertEqual|expected', 65));
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0012|RevisitFlowMatrixCases.test.ets|assert0167|assertTrue|actual|expected=true', tracker.acceptQuery(tracker.snapshot().sessionId,
        settingRecord(65, BASE + 70000, false), BASE + 71000))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitBindingCases_0012|RevisitFlowMatrixCases.test.ets|assert0168|assertFalse|actual|expected=false', tracker.snapshot().expectedQueryId === 64)).assertFalse();
    });
  });

  describe('RevisitArchiveCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_REVISITARCHIVECASES_0100
     * @tc.name      testRevisitArchiveCases0001
     * @tc.desc      Verify completed round is archived
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitArchiveCases0001', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.markRechecked(settingRecord(2, BASE + 61000, false), BASE + 62000);
      const archived: RevisitSession[] = tracker.archived();
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0001|RevisitFlowMatrixCases.test.ets|assert0169|assertEqual|actual', archived.length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0001|RevisitFlowMatrixCases.test.ets|assert0169|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0001|RevisitFlowMatrixCases.test.ets|assert0170|assertEqual|actual', archived[0].stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0001|RevisitFlowMatrixCases.test.ets|assert0170|assertEqual|expected', RevisitStage.RECHECKED));
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0001|RevisitFlowMatrixCases.test.ets|assert0171|assertEqual|actual', archived[0].sessionId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0001|RevisitFlowMatrixCases.test.ets|assert0171|assertEqual|expected', tracker.snapshot().sessionId));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITARCHIVECASES_0200
     * @tc.name      testRevisitArchiveCases0002
     * @tc.desc      Verify cancelled round is archived
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitArchiveCases0002', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.cancel(BASE + 500);
      const archived: RevisitSession[] = tracker.archived();
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0002|RevisitFlowMatrixCases.test.ets|assert0172|assertEqual|actual', archived.length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0002|RevisitFlowMatrixCases.test.ets|assert0172|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0002|RevisitFlowMatrixCases.test.ets|assert0173|assertEqual|actual', archived[0].stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0002|RevisitFlowMatrixCases.test.ets|assert0173|assertEqual|expected', RevisitStage.CANCELLED));
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0002|RevisitFlowMatrixCases.test.ets|assert0174|assertTrue|actual|expected=true', archived[0].cancelled)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITARCHIVECASES_0300
     * @tc.name      testRevisitArchiveCases0003
     * @tc.desc      Verify expired round is archived
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitArchiveCases0003', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.markLeft(BASE);
      tracker.markReturned(BASE + REVISIT_TIMEOUT_MS + 5);
      const archived: RevisitSession[] = tracker.archived();
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0003|RevisitFlowMatrixCases.test.ets|assert0175|assertEqual|actual', archived.length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0003|RevisitFlowMatrixCases.test.ets|assert0175|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0003|RevisitFlowMatrixCases.test.ets|assert0176|assertEqual|actual', archived[0].stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0003|RevisitFlowMatrixCases.test.ets|assert0176|assertEqual|expected', RevisitStage.EXPIRED));
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0003|RevisitFlowMatrixCases.test.ets|assert0177|assertTrue|actual|expected=true', archived[0].conclusion.indexOf('未返回') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITARCHIVECASES_0400
     * @tc.name      testRevisitArchiveCases0004
     * @tc.desc      Verify archived list is detached
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitArchiveCases0004', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.cancel(BASE + 500);
      const copy: RevisitSession[] = tracker.archived();
      copy[0].conclusion = '外部改写';
      copy.push(new RevisitSession());
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0004|RevisitFlowMatrixCases.test.ets|assert0178|assertEqual|actual', tracker.archived().length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0004|RevisitFlowMatrixCases.test.ets|assert0178|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0004|RevisitFlowMatrixCases.test.ets|assert0179|assertEqual|actual', tracker.archived()[0].conclusion)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0004|RevisitFlowMatrixCases.test.ets|assert0179|assertEqual|expected', '用户取消，未做判断'));
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0004|RevisitFlowMatrixCases.test.ets|assert0180|assertEqual|actual', copy.length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0004|RevisitFlowMatrixCases.test.ets|assert0180|assertEqual|expected', 2));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITARCHIVECASES_0500
     * @tc.name      testRevisitArchiveCases0005
     * @tc.desc      Verify begin archives previous terminal round
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitArchiveCases0005', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.cancel(BASE + 500);
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0005|RevisitFlowMatrixCases.test.ets|assert0181|assertEqual|actual', tracker.archived().length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0005|RevisitFlowMatrixCases.test.ets|assert0181|assertEqual|expected', 1));
      tracker.begin(settingRecord(2, BASE + 600, false), 1, BASE + 600);
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0005|RevisitFlowMatrixCases.test.ets|assert0182|assertEqual|actual', tracker.archived().length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0005|RevisitFlowMatrixCases.test.ets|assert0182|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0005|RevisitFlowMatrixCases.test.ets|assert0183|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0005|RevisitFlowMatrixCases.test.ets|assert0183|assertEqual|expected', RevisitStage.GUIDED));
    });

;

    /**
     * @tc.number    SUB_STARTUP_REVISITARCHIVECASES_0700
     * @tc.name      testRevisitArchiveCases0007
     * @tc.desc      Verify archive drops stale rounds
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitArchiveCases0007', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.cancel(BASE + 1000);
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0007|RevisitFlowMatrixCases.test.ets|assert0184|assertEqual|actual', tracker.archived().length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0007|RevisitFlowMatrixCases.test.ets|assert0184|assertEqual|expected', 1));
      tracker.begin(settingRecord(2, BASE + REVISIT_ARCHIVE_AGE_MS + 2000, true), 1,
        BASE + REVISIT_ARCHIVE_AGE_MS + 2000);
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0007|RevisitFlowMatrixCases.test.ets|assert0185|assertEqual|actual', tracker.archived().length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0007|RevisitFlowMatrixCases.test.ets|assert0185|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0007|RevisitFlowMatrixCases.test.ets|assert0186|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0007|RevisitFlowMatrixCases.test.ets|assert0186|assertEqual|expected', RevisitStage.GUIDED));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITARCHIVECASES_0800
     * @tc.name      testRevisitArchiveCases0008
     * @tc.desc      Verify archive skips unnamed session
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitArchiveCases0008', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.cancel(BASE);
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0008|RevisitFlowMatrixCases.test.ets|assert0187|assertEqual|actual', tracker.archived().length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0008|RevisitFlowMatrixCases.test.ets|assert0187|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0008|RevisitFlowMatrixCases.test.ets|assert0188|assertEqual|actual', tracker.snapshot().sessionId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0008|RevisitFlowMatrixCases.test.ets|assert0188|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0008|RevisitFlowMatrixCases.test.ets|assert0189|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitArchiveCases_0008|RevisitFlowMatrixCases.test.ets|assert0189|assertEqual|expected', RevisitStage.IDLE));
    });
  });

  describe('RevisitRetryCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_REVISITRETRYCASES_0100
     * @tc.name      testRevisitRetryCases0001
     * @tc.desc      Verify retry from returned is noop true
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRetryCases0001', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0001|RevisitFlowMatrixCases.test.ets|assert0190|assertTrue|actual|expected=true', tracker.retry())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0001|RevisitFlowMatrixCases.test.ets|assert0191|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0001|RevisitFlowMatrixCases.test.ets|assert0191|assertEqual|expected', RevisitStage.RETURNED));
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0001|RevisitFlowMatrixCases.test.ets|assert0192|assertEqual|actual', tracker.snapshot().returnedAt)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0001|RevisitFlowMatrixCases.test.ets|assert0192|assertEqual|expected', BASE + 60000));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRETRYCASES_0200
     * @tc.name      testRevisitRetryCases0002
     * @tc.desc      Verify retry reopens incomplete round
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRetryCases0002', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(71);
      tracker.markRechecked(undefined, BASE + 61000);
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0002|RevisitFlowMatrixCases.test.ets|assert0193|assertFalse|actual|expected=false', tracker.isCompleted())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0002|RevisitFlowMatrixCases.test.ets|assert0194|assertTrue|actual|expected=true', tracker.retry())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0002|RevisitFlowMatrixCases.test.ets|assert0195|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0002|RevisitFlowMatrixCases.test.ets|assert0195|assertEqual|expected', RevisitStage.RETURNED));
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0002|RevisitFlowMatrixCases.test.ets|assert0196|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0002|RevisitFlowMatrixCases.test.ets|assert0196|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRETRYCASES_0300
     * @tc.name      testRevisitRetryCases0003
     * @tc.desc      Verify retry rejects completed round
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRetryCases0003', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, false),
        BASE + 1000, BASE + 60000);
      tracker.markRechecked(settingRecord(2, BASE + 61000, true), BASE + 62000);
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0003|RevisitFlowMatrixCases.test.ets|assert0197|assertTrue|actual|expected=true', tracker.isCompleted())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0003|RevisitFlowMatrixCases.test.ets|assert0198|assertFalse|actual|expected=false', tracker.retry())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0003|RevisitFlowMatrixCases.test.ets|assert0199|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0003|RevisitFlowMatrixCases.test.ets|assert0199|assertEqual|expected', RevisitStage.RECHECKED));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRETRYCASES_0400
     * @tc.name      testRevisitRetryCases0004
     * @tc.desc      Verify retry from idle is false
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRetryCases0004', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0004|RevisitFlowMatrixCases.test.ets|assert0200|assertFalse|actual|expected=false', tracker.retry())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0004|RevisitFlowMatrixCases.test.ets|assert0201|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0004|RevisitFlowMatrixCases.test.ets|assert0201|assertEqual|expected', RevisitStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0004|RevisitFlowMatrixCases.test.ets|assert0202|assertEqual|actual', tracker.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0004|RevisitFlowMatrixCases.test.ets|assert0202|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRETRYCASES_0500
     * @tc.name      testRevisitRetryCases0005
     * @tc.desc      Verify retry allows second query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRetryCases0005', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.markRechecked(undefined, BASE + 61000);
      tracker.retry();
      tracker.bindQuery(72);
      const accepted: boolean = tracker.acceptQuery(tracker.snapshot().sessionId,
        settingRecord(72, BASE + 62000, false), BASE + 63000);
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0005|RevisitFlowMatrixCases.test.ets|assert0203|assertTrue|actual|expected=true', accepted)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0005|RevisitFlowMatrixCases.test.ets|assert0204|assertEqual|actual', tracker.snapshot().attempts.length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0005|RevisitFlowMatrixCases.test.ets|assert0204|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RevisitRetryCases_0005|RevisitFlowMatrixCases.test.ets|assert0205|assertTrue|actual|expected=true', tracker.isCompleted())).assertTrue();
    });
  });

  describe('RevisitPersistenceCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_REVISITPERSISTENCECASES_0100
     * @tc.name      testRevisitPersistenceCases0001
     * @tc.desc      Verify serialize carries schema marker
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitPersistenceCases0001', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      const raw: string = tracker.serialize();
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0001|RevisitFlowMatrixCases.test.ets|assert0206|assertTrue|actual|expected=true', raw.indexOf('"schema":1') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0001|RevisitFlowMatrixCases.test.ets|assert0207|assertTrue|actual|expected=true', raw.indexOf('revisit-') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0001|RevisitFlowMatrixCases.test.ets|assert0208|assertTrue|actual|expected=true', raw.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITPERSISTENCECASES_0200
     * @tc.name      testRevisitPersistenceCases0002
     * @tc.desc      Verify round trip keeps stage and samples
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitPersistenceCases0002', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, false),
        BASE + 1000, BASE + 60000);
      tracker.markRechecked(settingRecord(2, BASE + 61000, true), BASE + 62000);
      const raw: string = tracker.serialize();
      const fresh: RevisitTracker = new RevisitTracker();
      fresh.restore(raw, BASE + 200000);
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0002|RevisitFlowMatrixCases.test.ets|assert0209|assertEqual|actual', fresh.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0002|RevisitFlowMatrixCases.test.ets|assert0209|assertEqual|expected', RevisitStage.RECHECKED));
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0002|RevisitFlowMatrixCases.test.ets|assert0210|assertEqual|actual', fresh.snapshot().before?.result)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0002|RevisitFlowMatrixCases.test.ets|assert0210|assertEqual|expected', '未开启'));
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0002|RevisitFlowMatrixCases.test.ets|assert0211|assertEqual|actual', fresh.snapshot().after?.result)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0002|RevisitFlowMatrixCases.test.ets|assert0211|assertEqual|expected', '已开启'));
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0002|RevisitFlowMatrixCases.test.ets|assert0212|assertTrue|actual|expected=true', fresh.conclusionText().indexOf('状态已变化') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITPERSISTENCECASES_0300
     * @tc.name      testRevisitPersistenceCases0003
     * @tc.desc      Verify restore drops native binding
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitPersistenceCases0003', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(81);
      const raw: string = tracker.serialize();
      const fresh: RevisitTracker = new RevisitTracker();
      fresh.restore(raw, BASE + 200000);
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0003|RevisitFlowMatrixCases.test.ets|assert0213|assertEqual|actual', fresh.snapshot().expectedQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0003|RevisitFlowMatrixCases.test.ets|assert0213|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0003|RevisitFlowMatrixCases.test.ets|assert0214|assertEqual|actual', fresh.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0003|RevisitFlowMatrixCases.test.ets|assert0214|assertEqual|expected', RevisitStage.RETURNED));
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0003|RevisitFlowMatrixCases.test.ets|assert0215|assertEqual|actual', fresh.snapshot().lastQueryId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0003|RevisitFlowMatrixCases.test.ets|assert0215|assertEqual|expected', 81));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITPERSISTENCECASES_0400
     * @tc.name      testRevisitPersistenceCases0004
     * @tc.desc      Verify restore empty clears archive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitPersistenceCases0004', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.cancel(BASE + 500);
      tracker.restore('', BASE + 1000);
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0004|RevisitFlowMatrixCases.test.ets|assert0216|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0004|RevisitFlowMatrixCases.test.ets|assert0216|assertEqual|expected', RevisitStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0004|RevisitFlowMatrixCases.test.ets|assert0217|assertEqual|actual', tracker.archived().length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0004|RevisitFlowMatrixCases.test.ets|assert0217|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0004|RevisitFlowMatrixCases.test.ets|assert0218|assertEqual|actual', tracker.notice())).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0004|RevisitFlowMatrixCases.test.ets|assert0218|assertEqual|expected', ''));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITPERSISTENCECASES_0500
     * @tc.name      testRevisitPersistenceCases0005
     * @tc.desc      Verify restore rejects malformed json
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitPersistenceCases0005', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      let failed: boolean = false;
      try {
        tracker.restore('{not-json', BASE);
      } catch (error) {
        failed = true;
      }
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0005|RevisitFlowMatrixCases.test.ets|assert0219|assertTrue|actual|expected=true', failed)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0005|RevisitFlowMatrixCases.test.ets|assert0220|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0005|RevisitFlowMatrixCases.test.ets|assert0220|assertEqual|expected', RevisitStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0005|RevisitFlowMatrixCases.test.ets|assert0221|assertFalse|actual|expected=false', tracker.snapshot().stage === RevisitStage.RETURNED)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITPERSISTENCECASES_0600
     * @tc.name      testRevisitPersistenceCases0006
     * @tc.desc      Verify restore rejects wrong schema
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitPersistenceCases0006', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      let failed: boolean = false;
      try {
        tracker.restore('{"schema":9}', BASE);
      } catch (error) {
        failed = true;
      }
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0006|RevisitFlowMatrixCases.test.ets|assert0222|assertTrue|actual|expected=true', failed)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0006|RevisitFlowMatrixCases.test.ets|assert0223|assertEqual|actual', tracker.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0006|RevisitFlowMatrixCases.test.ets|assert0223|assertEqual|expected', RevisitStage.IDLE));
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0006|RevisitFlowMatrixCases.test.ets|assert0224|assertFalse|actual|expected=false', tracker.snapshot().stage === RevisitStage.GUIDED)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITPERSISTENCECASES_0700
     * @tc.name      testRevisitPersistenceCases0007
     * @tc.desc      Verify restore rejects oversized payload
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitPersistenceCases0007', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      const huge: string = 'x'.repeat(256001);
      let failed: boolean = false;
      try {
        tracker.restore(huge, BASE);
      } catch (error) {
        failed = true;
      }
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0007|RevisitFlowMatrixCases.test.ets|assert0225|assertTrue|actual|expected=true', failed)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0007|RevisitFlowMatrixCases.test.ets|assert0226|assertEqual|actual', huge.length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0007|RevisitFlowMatrixCases.test.ets|assert0226|assertEqual|expected', 256001));
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0007|RevisitFlowMatrixCases.test.ets|assert0227|assertTrue|actual|expected=true', huge.length > 256000)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITPERSISTENCECASES_0800
     * @tc.name      testRevisitPersistenceCases0008
     * @tc.desc      Verify restore keeps serial monotonic
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitPersistenceCases0008', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      const raw: string = tracker.serialize();
      const fresh: RevisitTracker = new RevisitTracker();
      fresh.restore(raw, BASE + 1000);
      const next: RevisitSession = fresh.begin(settingRecord(2, BASE + 2000, false), 1,
        BASE + 2000);
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0008|RevisitFlowMatrixCases.test.ets|assert0228|assertTrue|actual|expected=true', next.sessionId.endsWith('-2'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0008|RevisitFlowMatrixCases.test.ets|assert0229|assertFalse|actual|expected=false', next.sessionId === tracker.snapshot().sessionId)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0008|RevisitFlowMatrixCases.test.ets|assert0230|assertEqual|actual', next.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0008|RevisitFlowMatrixCases.test.ets|assert0230|assertEqual|expected', RevisitStage.GUIDED));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITPERSISTENCECASES_0900
     * @tc.name      testRevisitPersistenceCases0009
     * @tc.desc      Verify restore recomputes cancelled conclusion
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitPersistenceCases0009', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.cancel(BASE + 500);
      const raw: string = tracker.serialize();
      const fresh: RevisitTracker = new RevisitTracker();
      fresh.restore(raw, BASE + 1000);
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0009|RevisitFlowMatrixCases.test.ets|assert0231|assertEqual|actual', fresh.snapshot().stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0009|RevisitFlowMatrixCases.test.ets|assert0231|assertEqual|expected', RevisitStage.CANCELLED));
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0009|RevisitFlowMatrixCases.test.ets|assert0232|assertTrue|actual|expected=true', fresh.snapshot().cancelled)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0009|RevisitFlowMatrixCases.test.ets|assert0233|assertEqual|actual', fresh.conclusionText())).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0009|RevisitFlowMatrixCases.test.ets|assert0233|assertEqual|expected', '用户取消，未做判断'));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITPERSISTENCECASES_1000
     * @tc.name      testRevisitPersistenceCases0010
     * @tc.desc      Verify restore reports honest notice
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitPersistenceCases0010', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      const raw: string = tracker.serialize();
      const fresh: RevisitTracker = new RevisitTracker();
      fresh.restore(raw, BASE + 200000);
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0010|RevisitFlowMatrixCases.test.ets|assert0234|assertTrue|actual|expected=true', fresh.notice().indexOf('不证明实际进入设置') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0010|RevisitFlowMatrixCases.test.ets|assert0235|assertTrue|actual|expected=true', fresh.notice().indexOf('仅确认应用前后台') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0010|RevisitFlowMatrixCases.test.ets|assert0236|assertTrue|actual|expected=true', fresh.serialize().length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITPERSISTENCECASES_1100
     * @tc.name      testRevisitPersistenceCases0011
     * @tc.desc      Verify restore archives recovered terminal round
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitPersistenceCases0011', 0, (): void => {
      configureTestText();
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, false),
        BASE + 1000, BASE + 60000);
      tracker.markRechecked(settingRecord(2, BASE + 61000, true), BASE + 62000);
      const raw: string = tracker.serialize();
      const fresh: RevisitTracker = new RevisitTracker();
      fresh.restore(raw, BASE + 200000);
      const archived: RevisitSession[] = fresh.archived();
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0011|RevisitFlowMatrixCases.test.ets|assert0237|assertEqual|actual', archived.length)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0011|RevisitFlowMatrixCases.test.ets|assert0237|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0011|RevisitFlowMatrixCases.test.ets|assert0238|assertEqual|actual', archived[0].stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0011|RevisitFlowMatrixCases.test.ets|assert0238|assertEqual|expected', RevisitStage.RECHECKED));
      expect(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0011|RevisitFlowMatrixCases.test.ets|assert0239|assertEqual|actual', archived[0].sessionId)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitPersistenceCases_0011|RevisitFlowMatrixCases.test.ets|assert0239|assertEqual|expected', tracker.snapshot().sessionId));
    });
  });
}
