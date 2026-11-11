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
import { loggedIt as it } from '../support/TestLog';
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
      expect(valueText(null)).assertEqual('未获取');
      expect(valueText(null) === valueText(false)).assertFalse();
      expect(valueText(null).length > 0).assertTrue();
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
      expect(valueText(true)).assertEqual('已开启');
      expect(valueText(false)).assertEqual('未开启');
      expect(valueText(true) === valueText(false)).assertFalse();
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
      const texts: string[] = [valueText(null), valueText(true), valueText(false)];
      const unique: string[] = texts.filter((text: string, index: number): boolean =>
        texts.indexOf(text) === index);
      expect(unique.length).assertEqual(3);
      expect(texts.every((text: string): boolean => text.length > 0)).assertTrue();
      expect(valueText(true) === valueText(false)).assertFalse();
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
      expect(isComparableRecord(undefined)).assertFalse();
      expect(isComparableRecord(settingRecord(1, BASE, true))).assertTrue();
      expect(isComparableRecord(settingRecord(1, BASE, false))).assertTrue();
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
      const failed: QueryRecord = recordOf(1, BASE, RefreshSource.SETTINGS, '已开启',
        QueryOutcome.FAILURE);
      const timeout: QueryRecord = recordOf(2, BASE, RefreshSource.SETTINGS, '已开启',
        QueryOutcome.TIMEOUT);
      expect(isComparableRecord(failed)).assertFalse();
      expect(isComparableRecord(timeout)).assertFalse();
      expect(isComparableRecord(recordOf(3, BASE, RefreshSource.SETTINGS, '已开启',
        QueryOutcome.UNSUPPORTED))).assertFalse();
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
      const blank: QueryRecord = recordOf(1, BASE, RefreshSource.SETTINGS, '',
        QueryOutcome.SUCCESS);
      const other: QueryRecord = recordOf(2, BASE, RefreshSource.SETTINGS, '待调用',
        QueryOutcome.SUCCESS);
      expect(isComparableRecord(blank)).assertFalse();
      expect(isComparableRecord(other)).assertFalse();
      expect(isComparableRecord(settingRecord(3, BASE, true))).assertTrue();
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
      const manual: QueryRecord = recordOf(1, BASE, RefreshSource.MANUAL, '已开启',
        QueryOutcome.SUCCESS);
      expect(isComparableRecord(manual)).assertTrue();
      expect(manual.source).assertEqual(RefreshSource.MANUAL);
      expect(manual.result).assertEqual('已开启');
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
      expect(REVISIT_TIMEOUT_MS).assertEqual(600000);
      expect(REVISIT_ARCHIVE_LIMIT).assertEqual(10);
      expect(REVISIT_ATTEMPT_LIMIT).assertEqual(5);
      expect(REVISIT_ARCHIVE_AGE_MS > REVISIT_TIMEOUT_MS).assertTrue();
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
      const comparison: RevisitComparison = compareSamples(undefined,
        settingRecord(2, BASE + 1000, true));
      expect(comparison.comparable).assertFalse();
      expect(comparison.reason).assertEqual('缺少离开前样本');
      expect(comparison.summary().indexOf('无法比较') >= 0).assertTrue();
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
      const comparison: RevisitComparison = compareSamples(
        settingRecord(1, BASE, true), undefined);
      expect(comparison.comparable).assertFalse();
      expect(comparison.reason).assertEqual('缺少返回后样本');
      expect(comparison.elapsed).assertEqual(0);
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
      const failed: QueryRecord = recordOf(1, BASE, RefreshSource.SETTINGS, '已开启',
        QueryOutcome.FAILURE);
      const comparison: RevisitComparison = compareSamples(failed,
        settingRecord(2, BASE + 1000, true));
      expect(comparison.comparable).assertFalse();
      expect(comparison.reason.indexOf('离开前') >= 0).assertTrue();
      expect(comparison.reason.indexOf(QueryOutcome.FAILURE as string) >= 0).assertTrue();
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
      const timeout: QueryRecord = recordOf(2, BASE + 1000, RefreshSource.SETTINGS, '未开启',
        QueryOutcome.TIMEOUT);
      const comparison: RevisitComparison = compareSamples(
        settingRecord(1, BASE, true), timeout);
      expect(comparison.comparable).assertFalse();
      expect(comparison.reason.indexOf('返回后') >= 0).assertTrue();
      expect(comparison.reason.indexOf(QueryOutcome.TIMEOUT as string) >= 0).assertTrue();
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
      const comparison: RevisitComparison = compareSamples(
        settingRecord(1, BASE, false), settingRecord(2, BASE + 5000, false));
      expect(comparison.comparable).assertTrue();
      expect(comparison.changed).assertFalse();
      expect(comparison.beforeValue).assertEqual('未开启');
      expect(comparison.afterValue).assertEqual('未开启');
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
      const comparison: RevisitComparison = compareSamples(
        settingRecord(1, BASE, false), settingRecord(2, BASE + 5000, true));
      expect(comparison.comparable).assertTrue();
      expect(comparison.changed).assertTrue();
      expect(comparison.beforeValue).assertEqual('未开启');
      expect(comparison.afterValue).assertEqual('已开启');
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
      const comparison: RevisitComparison = compareSamples(
        settingRecord(1, BASE, true), settingRecord(2, BASE + 30000, true));
      expect(comparison.elapsed).assertEqual(30000);
      expect(comparison.elapsed > 0).assertTrue();
      expect(comparison.comparable).assertTrue();
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
      const comparison: RevisitComparison = compareSamples(
        settingRecord(1, BASE + 5000, true), settingRecord(2, BASE, true));
      expect(comparison.elapsed).assertEqual(0);
      expect(comparison.comparable).assertTrue();
      expect(comparison.elapsed === 5000).assertFalse();
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
      const changed: RevisitComparison = compareSamples(
        settingRecord(1, BASE, false), settingRecord(2, BASE + 1, true));
      expect(changed.summary().indexOf('状态已变化') >= 0).assertTrue();
      expect(changed.summary().indexOf('未开启') >= 0).assertTrue();
      expect(changed.summary().indexOf('已开启') >= 0).assertTrue();
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
      const stable: RevisitComparison = compareSamples(
        settingRecord(1, BASE, true), settingRecord(2, BASE + 1, true));
      expect(stable.summary().indexOf('状态未变化') >= 0).assertTrue();
      expect(stable.summary().indexOf('已开启') >= 0).assertTrue();
      expect(stable.summary().indexOf('无法比较')).assertEqual(-1);
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
      const tracker: RevisitTracker = new RevisitTracker();
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.IDLE);
      expect(tracker.canGuide()).assertTrue();
      expect(tracker.isWaiting()).assertFalse();
      expect(tracker.archived().length).assertEqual(0);
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
      const tracker: RevisitTracker = new RevisitTracker();
      const session: RevisitSession = tracker.begin(settingRecord(1, BASE, true), 2, BASE);
      expect(session.stage).assertEqual(RevisitStage.GUIDED);
      expect(session.createdAt).assertEqual(BASE);
      expect(session.guidanceRevision).assertEqual(2);
      expect(session.conclusion).assertEqual('尚未判断');
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
      const tracker: RevisitTracker = new RevisitTracker();
      const first: RevisitSession = tracker.begin(undefined, 1, BASE);
      const second: RevisitSession = tracker.begin(undefined, 1, BASE + 1);
      expect(first.sessionId).assertEqual(`revisit-${BASE}-1`);
      expect(second.sessionId).assertEqual(`revisit-${BASE + 1}-2`);
      expect(first.sessionId === second.sessionId).assertFalse();
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
      const tracker: RevisitTracker = new RevisitTracker();
      const rejected: RevisitSession = tracker.markLeft(BASE);
      expect(rejected.stage).assertEqual(RevisitStage.IDLE);
      expect(tracker.notice().indexOf('不接受离开事件') >= 0).assertTrue();
      expect(tracker.snapshot().leftAt).assertEqual(0);
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      const left: RevisitSession = tracker.markLeft(BASE + 2000);
      expect(left.stage).assertEqual(RevisitStage.LEFT);
      expect(left.leftAt).assertEqual(BASE + 2000);
      expect(tracker.isWaiting()).assertTrue();
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      const rejected: RevisitSession = tracker.markReturned(BASE + 10);
      expect(rejected.stage).assertEqual(RevisitStage.GUIDED);
      expect(tracker.notice().indexOf('不接受返回事件') >= 0).assertTrue();
      expect(rejected.returnedAt).assertEqual(0);
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.markLeft(BASE + 1000);
      const returned: RevisitSession = tracker.markReturned(BASE + 60000);
      expect(returned.stage).assertEqual(RevisitStage.RETURNED);
      expect(returned.returnedAt).assertEqual(BASE + 60000);
      expect(tracker.notice().indexOf('请重新查询') >= 0).assertTrue();
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, false), 1, BASE);
      tracker.markLeft(BASE + 1000);
      const rejected: RevisitSession = tracker.markRechecked(settingRecord(2, BASE + 2000, true),
        BASE + 2000);
      expect(rejected.stage).assertEqual(RevisitStage.LEFT);
      expect(tracker.notice().indexOf('不接受回查事件') >= 0).assertTrue();
      expect(rejected.after === undefined).assertTrue();
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, false),
        BASE + 1000, BASE + 60000);
      const done: RevisitSession = tracker.markRechecked(settingRecord(2, BASE + 90000, true),
        BASE + 91000);
      expect(done.stage).assertEqual(RevisitStage.RECHECKED);
      expect(done.conclusion.indexOf('状态已变化') >= 0).assertTrue();
      expect(done.attempts.length).assertEqual(1);
      expect(tracker.isCompleted()).assertTrue();
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      const done: RevisitSession = tracker.markRechecked(undefined, BASE + 61000);
      expect(done.stage).assertEqual(RevisitStage.RECHECKED);
      expect(done.conclusion.indexOf('缺少返回后样本') >= 0).assertTrue();
      expect(done.attempts.length).assertEqual(0);
      expect(tracker.isCompleted()).assertFalse();
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
      expect(snapshot.attempts.length).assertEqual(REVISIT_ATTEMPT_LIMIT);
      expect(snapshot.attempts.length <= REVISIT_ATTEMPT_LIMIT).assertTrue();
      expect(snapshot.stage).assertEqual(RevisitStage.RECHECKED);
      expect(tracker.isCompleted()).assertFalse();
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
      const tracker: RevisitTracker = new RevisitTracker();
      expect(tracker.canGuide()).assertTrue();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      expect(tracker.canGuide()).assertFalse();
      tracker.markLeft(BASE + 1000);
      expect(tracker.canGuide()).assertFalse();
      tracker.markReturned(BASE + 2000);
      expect(tracker.canGuide()).assertFalse();
      tracker.markRechecked(settingRecord(2, BASE + 3000, true), BASE + 4000);
      expect(tracker.canGuide()).assertTrue();
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
      const tracker: RevisitTracker = new RevisitTracker();
      expect(tracker.remainingMillis(BASE)).assertEqual(-1);
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      expect(tracker.remainingMillis(BASE)).assertEqual(-1);
      tracker.markLeft(BASE);
      expect(tracker.remainingMillis(BASE)).assertEqual(REVISIT_TIMEOUT_MS);
      expect(tracker.remainingMillis(BASE + 1000)).assertEqual(REVISIT_TIMEOUT_MS - 1000);
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.markLeft(BASE);
      expect(tracker.remainingMillis(BASE + REVISIT_TIMEOUT_MS * 3)).assertEqual(0);
      expect(tracker.remainingMillis(BASE + REVISIT_TIMEOUT_MS) >= 0).assertTrue();
      expect(tracker.remainingMillis(BASE) >= 0).assertTrue();
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.markLeft(BASE);
      const early: RevisitSession = tracker.checkExpiry(BASE + REVISIT_TIMEOUT_MS - 1);
      expect(early.stage).assertEqual(RevisitStage.LEFT);
      const late: RevisitSession = tracker.checkExpiry(BASE + REVISIT_TIMEOUT_MS);
      expect(late.stage).assertEqual(RevisitStage.EXPIRED);
      expect(late.conclusion.indexOf('未返回') >= 0).assertTrue();
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.markLeft(BASE);
      const late: RevisitSession = tracker.markReturned(BASE + REVISIT_TIMEOUT_MS + 1);
      expect(late.stage).assertEqual(RevisitStage.EXPIRED);
      expect(tracker.notice().indexOf('过期') >= 0).assertTrue();
      expect(late.returnedAt).assertEqual(0);
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      const cancelled: RevisitSession = tracker.cancel(BASE + 500);
      expect(cancelled.stage).assertEqual(RevisitStage.CANCELLED);
      expect(cancelled.cancelled).assertTrue();
      expect(cancelled.conclusion).assertEqual('用户取消，未做判断');
      expect(tracker.notice()).assertEqual('已取消回访');
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
      const tracker: RevisitTracker = new RevisitTracker();
      const unchanged: RevisitSession = tracker.cancel(BASE);
      expect(unchanged.stage).assertEqual(RevisitStage.IDLE);
      expect(unchanged.cancelled).assertFalse();
      expect(tracker.notice()).assertEqual('');
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, false),
        BASE + 1000, BASE + 60000);
      tracker.markRechecked(settingRecord(2, BASE + 61000, true), BASE + 62000);
      const after: RevisitSession = tracker.cancel(BASE + 63000);
      expect(after.stage).assertEqual(RevisitStage.RECHECKED);
      expect(after.cancelled).assertFalse();
      expect(tracker.isCompleted()).assertTrue();
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
      const tracker: RevisitTracker = new RevisitTracker();
      expect(tracker.sourceForRecord()).assertEqual(RefreshSource.SETTINGS);
      expect(tracker.sourceForRecord() === RefreshSource.MANUAL).assertFalse();
      expect(tracker.conclusionText()).assertEqual('尚未判断');
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      const snapshot: RevisitSession = tracker.snapshot();
      snapshot.stage = RevisitStage.CANCELLED;
      snapshot.conclusion = '被外部改写';
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.GUIDED);
      expect(tracker.conclusionText()).assertEqual('尚未判断');
      expect(snapshot.stage).assertEqual(RevisitStage.CANCELLED);
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
      const before: QueryRecord = settingRecord(1, BASE, true);
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(before, 1, BASE);
      before.result = '外部改写';
      expect(tracker.snapshot().before?.result).assertEqual('已开启');
      expect(tracker.snapshot().before?.id).assertEqual(1);
      expect(tracker.snapshot().before === undefined).assertFalse();
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(41);
      expect(tracker.snapshot().expectedQueryId).assertEqual(41);
      expect(tracker.snapshot().lastQueryId).assertEqual(41);
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.RETURNED);
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.bindQuery(42);
      expect(tracker.snapshot().expectedQueryId).assertEqual(0);
      tracker.markLeft(BASE + 1000);
      tracker.bindQuery(42);
      expect(tracker.snapshot().expectedQueryId).assertEqual(0);
      expect(tracker.snapshot().lastQueryId).assertEqual(0);
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(0);
      expect(tracker.snapshot().expectedQueryId).assertEqual(0);
      tracker.bindQuery(-7);
      expect(tracker.snapshot().expectedQueryId).assertEqual(0);
      tracker.bindQuery(1.5);
      expect(tracker.snapshot().expectedQueryId).assertEqual(0);
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(11);
      tracker.bindQuery(22);
      expect(tracker.snapshot().expectedQueryId).assertEqual(11);
      expect(tracker.snapshot().lastQueryId).assertEqual(11);
      expect(tracker.snapshot().expectedQueryId === 22).assertFalse();
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, false),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(55);
      const accepted: boolean = tracker.acceptQuery(tracker.snapshot().sessionId,
        settingRecord(55, BASE + 70000, true), BASE + 71000);
      expect(accepted).assertTrue();
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.RECHECKED);
      expect(tracker.snapshot().after?.result).assertEqual('已开启');
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(56);
      expect(tracker.acceptQuery('revisit-other', settingRecord(56, BASE + 70000, false),
        BASE + 71000)).assertFalse();
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.RETURNED);
      expect(tracker.snapshot().after === undefined).assertTrue();
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(57);
      expect(tracker.acceptQuery(tracker.snapshot().sessionId,
        settingRecord(58, BASE + 70000, false), BASE + 71000)).assertFalse();
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.RETURNED);
      expect(tracker.snapshot().expectedQueryId).assertEqual(57);
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(59);
      const manual: QueryRecord = recordOf(59, BASE + 70000, RefreshSource.MANUAL, '未开启',
        QueryOutcome.SUCCESS);
      expect(tracker.acceptQuery(tracker.snapshot().sessionId, manual, BASE + 71000)).assertFalse();
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.RETURNED);
      expect(tracker.snapshot().expectedQueryId).assertEqual(59);
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(60);
      const stale: QueryRecord = settingRecord(60, BASE + 30000, false);
      expect(tracker.acceptQuery(tracker.snapshot().sessionId, stale, BASE + 71000)).assertFalse();
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.RETURNED);
      expect(tracker.snapshot().expectedQueryId).assertEqual(60);
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(61);
      tracker.acceptQuery(tracker.snapshot().sessionId, settingRecord(61, BASE + 70000, false),
        BASE + 71000);
      const snapshot: RevisitSession = tracker.snapshot();
      expect(snapshot.attempts.length).assertEqual(1);
      expect(snapshot.attempts[0].id).assertEqual(61);
      expect(snapshot.conclusion.indexOf('状态已变化') >= 0).assertTrue();
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(62);
      tracker.clearNativeBinding();
      expect(tracker.snapshot().expectedQueryId).assertEqual(0);
      expect(tracker.snapshot().lastQueryId).assertEqual(62);
      tracker.bindQuery(63);
      expect(tracker.snapshot().expectedQueryId).assertEqual(63);
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(64);
      tracker.clearNativeBinding();
      tracker.bindQuery(65);
      expect(tracker.snapshot().expectedQueryId).assertEqual(65);
      expect(tracker.acceptQuery(tracker.snapshot().sessionId,
        settingRecord(65, BASE + 70000, false), BASE + 71000)).assertTrue();
      expect(tracker.snapshot().expectedQueryId === 64).assertFalse();
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.markRechecked(settingRecord(2, BASE + 61000, false), BASE + 62000);
      const archived: RevisitSession[] = tracker.archived();
      expect(archived.length).assertEqual(1);
      expect(archived[0].stage).assertEqual(RevisitStage.RECHECKED);
      expect(archived[0].sessionId).assertEqual(tracker.snapshot().sessionId);
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.cancel(BASE + 500);
      const archived: RevisitSession[] = tracker.archived();
      expect(archived.length).assertEqual(1);
      expect(archived[0].stage).assertEqual(RevisitStage.CANCELLED);
      expect(archived[0].cancelled).assertTrue();
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.markLeft(BASE);
      tracker.markReturned(BASE + REVISIT_TIMEOUT_MS + 5);
      const archived: RevisitSession[] = tracker.archived();
      expect(archived.length).assertEqual(1);
      expect(archived[0].stage).assertEqual(RevisitStage.EXPIRED);
      expect(archived[0].conclusion.indexOf('未返回') >= 0).assertTrue();
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.cancel(BASE + 500);
      const copy: RevisitSession[] = tracker.archived();
      copy[0].conclusion = '外部改写';
      copy.push(new RevisitSession());
      expect(tracker.archived().length).assertEqual(1);
      expect(tracker.archived()[0].conclusion).assertEqual('用户取消，未做判断');
      expect(copy.length).assertEqual(2);
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.cancel(BASE + 500);
      expect(tracker.archived().length).assertEqual(1);
      tracker.begin(settingRecord(2, BASE + 600, false), 1, BASE + 600);
      expect(tracker.archived().length).assertEqual(1);
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.GUIDED);
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.cancel(BASE + 1000);
      expect(tracker.archived().length).assertEqual(1);
      tracker.begin(settingRecord(2, BASE + REVISIT_ARCHIVE_AGE_MS + 2000, true), 1,
        BASE + REVISIT_ARCHIVE_AGE_MS + 2000);
      expect(tracker.archived().length).assertEqual(0);
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.GUIDED);
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.cancel(BASE);
      expect(tracker.archived().length).assertEqual(0);
      expect(tracker.snapshot().sessionId).assertEqual('');
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.IDLE);
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      expect(tracker.retry()).assertTrue();
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.RETURNED);
      expect(tracker.snapshot().returnedAt).assertEqual(BASE + 60000);
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(71);
      tracker.markRechecked(undefined, BASE + 61000);
      expect(tracker.isCompleted()).assertFalse();
      expect(tracker.retry()).assertTrue();
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.RETURNED);
      expect(tracker.snapshot().expectedQueryId).assertEqual(0);
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, false),
        BASE + 1000, BASE + 60000);
      tracker.markRechecked(settingRecord(2, BASE + 61000, true), BASE + 62000);
      expect(tracker.isCompleted()).assertTrue();
      expect(tracker.retry()).assertFalse();
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.RECHECKED);
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
      const tracker: RevisitTracker = new RevisitTracker();
      expect(tracker.retry()).assertFalse();
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.IDLE);
      expect(tracker.snapshot().expectedQueryId).assertEqual(0);
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.markRechecked(undefined, BASE + 61000);
      tracker.retry();
      tracker.bindQuery(72);
      const accepted: boolean = tracker.acceptQuery(tracker.snapshot().sessionId,
        settingRecord(72, BASE + 62000, false), BASE + 63000);
      expect(accepted).assertTrue();
      expect(tracker.snapshot().attempts.length).assertEqual(1);
      expect(tracker.isCompleted()).assertTrue();
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      const raw: string = tracker.serialize();
      expect(raw.indexOf('"schema":1') >= 0).assertTrue();
      expect(raw.indexOf('revisit-') >= 0).assertTrue();
      expect(raw.length > 0).assertTrue();
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, false),
        BASE + 1000, BASE + 60000);
      tracker.markRechecked(settingRecord(2, BASE + 61000, true), BASE + 62000);
      const raw: string = tracker.serialize();
      const fresh: RevisitTracker = new RevisitTracker();
      fresh.restore(raw, BASE + 200000);
      expect(fresh.snapshot().stage).assertEqual(RevisitStage.RECHECKED);
      expect(fresh.snapshot().before?.result).assertEqual('未开启');
      expect(fresh.snapshot().after?.result).assertEqual('已开启');
      expect(fresh.conclusionText().indexOf('状态已变化') >= 0).assertTrue();
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      tracker.bindQuery(81);
      const raw: string = tracker.serialize();
      const fresh: RevisitTracker = new RevisitTracker();
      fresh.restore(raw, BASE + 200000);
      expect(fresh.snapshot().expectedQueryId).assertEqual(0);
      expect(fresh.snapshot().stage).assertEqual(RevisitStage.RETURNED);
      expect(fresh.snapshot().lastQueryId).assertEqual(81);
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.cancel(BASE + 500);
      tracker.restore('', BASE + 1000);
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.IDLE);
      expect(tracker.archived().length).assertEqual(0);
      expect(tracker.notice()).assertEqual('');
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
      const tracker: RevisitTracker = new RevisitTracker();
      let failed: boolean = false;
      try {
        tracker.restore('{not-json', BASE);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertTrue();
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.IDLE);
      expect(tracker.snapshot().stage === RevisitStage.RETURNED).assertFalse();
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
      const tracker: RevisitTracker = new RevisitTracker();
      let failed: boolean = false;
      try {
        tracker.restore('{"schema":9}', BASE);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertTrue();
      expect(tracker.snapshot().stage).assertEqual(RevisitStage.IDLE);
      expect(tracker.snapshot().stage === RevisitStage.GUIDED).assertFalse();
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
      const tracker: RevisitTracker = new RevisitTracker();
      const huge: string = 'x'.repeat(256001);
      let failed: boolean = false;
      try {
        tracker.restore(huge, BASE);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertTrue();
      expect(huge.length).assertEqual(256001);
      expect(huge.length > 256000).assertTrue();
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      const raw: string = tracker.serialize();
      const fresh: RevisitTracker = new RevisitTracker();
      fresh.restore(raw, BASE + 1000);
      const next: RevisitSession = fresh.begin(settingRecord(2, BASE + 2000, false), 1,
        BASE + 2000);
      expect(next.sessionId.endsWith('-2')).assertTrue();
      expect(next.sessionId === tracker.snapshot().sessionId).assertFalse();
      expect(next.stage).assertEqual(RevisitStage.GUIDED);
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
      const tracker: RevisitTracker = new RevisitTracker();
      tracker.begin(settingRecord(1, BASE, true), 1, BASE);
      tracker.cancel(BASE + 500);
      const raw: string = tracker.serialize();
      const fresh: RevisitTracker = new RevisitTracker();
      fresh.restore(raw, BASE + 1000);
      expect(fresh.snapshot().stage).assertEqual(RevisitStage.CANCELLED);
      expect(fresh.snapshot().cancelled).assertTrue();
      expect(fresh.conclusionText()).assertEqual('用户取消，未做判断');
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, true),
        BASE + 1000, BASE + 60000);
      const raw: string = tracker.serialize();
      const fresh: RevisitTracker = new RevisitTracker();
      fresh.restore(raw, BASE + 200000);
      expect(fresh.notice().indexOf('不证明实际进入设置') >= 0).assertTrue();
      expect(fresh.notice().indexOf('仅确认应用前后台') >= 0).assertTrue();
      expect(fresh.serialize().length > 0).assertTrue();
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
      const tracker: RevisitTracker = trackerAtReturned(settingRecord(1, BASE, false),
        BASE + 1000, BASE + 60000);
      tracker.markRechecked(settingRecord(2, BASE + 61000, true), BASE + 62000);
      const raw: string = tracker.serialize();
      const fresh: RevisitTracker = new RevisitTracker();
      fresh.restore(raw, BASE + 200000);
      const archived: RevisitSession[] = fresh.archived();
      expect(archived.length).assertEqual(1);
      expect(archived[0].stage).assertEqual(RevisitStage.RECHECKED);
      expect(archived[0].sessionId).assertEqual(tracker.snapshot().sessionId);
    });
  });
}
