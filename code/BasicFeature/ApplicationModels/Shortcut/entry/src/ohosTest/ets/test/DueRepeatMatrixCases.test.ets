import { describe, expect, it } from '@ohos/hypium';
import {
  DUE_RULES, DUE_SOON_MS, DueBuckets, DueRule, DueState, Priority, RepeatKind, TodoDue, bucketize,
  dateKeyOf, defer, dueLines, dueStateOf, dueSummary, nextOccurrence, overdueDays, priorityWeight,
  repeatText
} from '../../../main/ets/business/DuePolicy';

/** 一天毫秒数。 */
const DAY: number = 86400000;

/** 造一个带截止的待办。 */
function dueAtOf(dueAt: number, priority: Priority): TodoDue {
  return new TodoDue(dueAt, priority);
}

/** 2024-01-19 是周五。 */
const FRIDAY: number = new Date(2024, 0, 19, 9, 0, 0, 0).getTime();

export default function dueRepeatMatrixCasesTest(): void {
  describe('DueRuleCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0100
     * @tc.name      testDueRuleCases0001
     * @tc.desc      Verify rule table has ten entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testDueRuleCases0001', 0, (): void => {
      expect(DUE_RULES.length).assertEqual(10);
      const codes: string[] = DUE_RULES.map((rule: DueRule): string => rule.code);
      expect(codes[0]).assertEqual('DU-01');
      expect(codes[9]).assertEqual('DU-10');
      expect(codes.every((code: string, index: number): boolean =>
        code === `DU-${(index + 1).toString().padStart(2, '0')}`)).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0200
     * @tc.name      testDueRuleCases0002
     * @tc.desc      Verify rule describe joins facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDueRuleCases0002', 0, (): void => {
      const rule: DueRule = DUE_RULES[3];
      expect(rule.code).assertEqual('DU-04');
      expect(rule.describe()).assertEqual(
        'DU-04｜截止时间在 24 小时内 → 即将到期｜进入即将到期分组');
      expect(rule.describe().split('｜').length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0300
     * @tc.name      testDueRuleCases0003
     * @tc.desc      Verify due state enum is closed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDueRuleCases0003', 0, (): void => {
      expect(DueState.NO_DUE).assertEqual('无截止');
      expect(DueState.FUTURE).assertEqual('未到期');
      expect(DueState.DUE_SOON).assertEqual('即将到期');
      expect(DueState.OVERDUE).assertEqual('已逾期');
      expect(DueState.DONE).assertEqual('已完成');
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0400
     * @tc.name      testDueRuleCases0004
     * @tc.desc      Verify priority enum is ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDueRuleCases0004', 0, (): void => {
      expect(Priority.HIGH).assertEqual('高');
      expect(Priority.NORMAL).assertEqual('普通');
      expect(Priority.LOW).assertEqual('低');
      expect((Priority.HIGH as string) === (Priority.LOW as string)).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0500
     * @tc.name      testDueRuleCases0005
     * @tc.desc      Verify repeat enum covers five kinds
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDueRuleCases0005', 0, (): void => {
      expect(RepeatKind.NONE).assertEqual('不重复');
      expect(RepeatKind.DAILY).assertEqual('每天');
      expect(RepeatKind.WEEKDAY).assertEqual('工作日');
      expect(RepeatKind.WEEKLY).assertEqual('每周');
      expect(RepeatKind.MONTHLY).assertEqual('每月');
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0600
     * @tc.name      testDueRuleCases0006
     * @tc.desc      Verify due soon window is one day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDueRuleCases0006', 0, (): void => {
      expect(DUE_SOON_MS).assertEqual(DAY);
      expect(DUE_SOON_MS).assertEqual(24 * 60 * 60 * 1000);
      expect(DUE_SOON_MS).assertEqual(86400000);
      expect(DUE_SOON_MS > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0700
     * @tc.name      testDueRuleCases0007
     * @tc.desc      Verify due lines match table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testDueRuleCases0007', 0, (): void => {
      const lines: string[] = dueLines();
      expect(lines.length).assertEqual(DUE_RULES.length);
      expect(lines.every((line: string): boolean => line.indexOf('→') > 0)).assertTrue();
      expect(lines[0].indexOf('DU-01') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0800
     * @tc.name      testDueRuleCases0008
     * @tc.desc      Verify every rule carries note
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDueRuleCases0008', 0, (): void => {
      expect(DUE_RULES.every((rule: DueRule): boolean => rule.note.length > 0)).assertTrue();
      expect(DUE_RULES.every((rule: DueRule): boolean =>
        rule.condition.length > 0)).assertTrue();
      expect(DUE_RULES.filter((rule: DueRule): boolean =>
        rule.state === DueState.OVERDUE).length).assertEqual(2);
    });
  });

  describe('TodoDueCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0100
     * @tc.name      testTodoDueCases0001
     * @tc.desc      Verify todo defaults are undated
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testTodoDueCases0001', 0, (): void => {
      const due: TodoDue = new TodoDue();
      expect(due.dueAt).assertEqual(0);
      expect(due.priority).assertEqual(Priority.NORMAL);
      expect(due.done).assertFalse();
      expect(due.repeat).assertEqual(RepeatKind.NONE);
      expect(due.deferredAt).assertEqual(0);
      expect(due.exceptions.length).assertEqual(0);
      expect(due.undated()).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0200
     * @tc.name      testTodoDueCases0002
     * @tc.desc      Verify undated covers zero and negative
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoDueCases0002', 0, (): void => {
      expect(dueAtOf(0, Priority.HIGH).undated()).assertTrue();
      expect(dueAtOf(-1, Priority.HIGH).undated()).assertTrue();
      expect(dueAtOf(1, Priority.HIGH).undated()).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0300
     * @tc.name      testTodoDueCases0003
     * @tc.desc      Verify date key pads month and day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoDueCases0003', 0, (): void => {
      expect(dateKeyOf(new Date(2024, 0, 5, 10, 0, 0, 0).getTime())).assertEqual('2024-01-05');
      expect(dateKeyOf(new Date(2024, 11, 31, 23, 59, 0, 0).getTime())).assertEqual('2024-12-31');
      expect(dateKeyOf(new Date(2024, 4, 1, 0, 0, 0, 0).getTime())).assertEqual('2024-05-01');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0400
     * @tc.name      testTodoDueCases0004
     * @tc.desc      Verify date key ignores time of day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoDueCases0004', 0, (): void => {
      const morning: number = new Date(2024, 4, 1, 0, 0, 0, 0).getTime();
      const evening: number = new Date(2024, 4, 1, 23, 0, 0, 0).getTime();
      expect(dateKeyOf(morning)).assertEqual(dateKeyOf(evening));
      expect(dateKeyOf(morning).length).assertEqual(10);
      expect(dateKeyOf(morning)).assertEqual('2024-05-01');
      expect(dateKeyOf(evening)).assertEqual('2024-05-01');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0500
     * @tc.name      testTodoDueCases0005
     * @tc.desc      Verify date key splits days
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoDueCases0005', 0, (): void => {
      const first: string = dateKeyOf(new Date(2024, 4, 1, 10, 0, 0, 0).getTime());
      const second: string = dateKeyOf(new Date(2024, 4, 2, 10, 0, 0, 0).getTime());
      expect(first === second).assertFalse();
      expect(first < second).assertTrue();
      expect(first).assertEqual('2024-05-01');
      expect(second).assertEqual('2024-05-02');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0600
     * @tc.name      testTodoDueCases0006
     * @tc.desc      Verify done wins everything
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoDueCases0006', 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.HIGH);
      due.done = true;
      expect(dueStateOf(due, 1000000)).assertEqual(DueState.DONE);
      expect(dueStateOf(due, 1000)).assertEqual(DueState.DONE);
      expect(overdueDays(due, 1000000)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0700
     * @tc.name      testTodoDueCases0007
     * @tc.desc      Verify undated is not overdue
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoDueCases0007', 0, (): void => {
      const due: TodoDue = new TodoDue();
      expect(dueStateOf(due, 1000000)).assertEqual(DueState.NO_DUE);
      expect(overdueDays(due, 1000000)).assertEqual(0);
      expect(due.dueAt).assertEqual(0);
      expect(due.undated()).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0800
     * @tc.name      testTodoDueCases0008
     * @tc.desc      Verify exceptions default empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoDueCases0008', 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      due.exceptions.push('2024-05-01');
      expect(due.exceptions.length).assertEqual(1);
      expect(due.exceptions[0]).assertEqual('2024-05-01');
      expect(due.dueAt).assertEqual(1000);
      expect(due.repeat).assertEqual(RepeatKind.NONE);
    });
  });

  describe('DueStateCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_DUESTATECASES_0100
     * @tc.name      testDueStateCases0001
     * @tc.desc      Verify far future is future
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDueStateCases0001', 0, (): void => {
      const due: TodoDue = dueAtOf(1000 + 2 * DAY, Priority.NORMAL);
      expect(dueStateOf(due, 1000)).assertEqual(DueState.FUTURE);
      expect(overdueDays(due, 1000)).assertEqual(0);
      expect(dueStateOf(due, 1000 + 2 * DAY)).assertEqual(DueState.DUE_SOON);
      expect(due.dueAt).assertEqual(1000 + 2 * DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUESTATECASES_0200
     * @tc.name      testDueStateCases0002
     * @tc.desc      Verify window boundary counts as soon
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDueStateCases0002', 0, (): void => {
      const due: TodoDue = dueAtOf(1000 + DUE_SOON_MS, Priority.NORMAL);
      expect(dueStateOf(due, 1000)).assertEqual(DueState.DUE_SOON);
      const later: TodoDue = dueAtOf(1000 + DUE_SOON_MS + 1, Priority.NORMAL);
      expect(dueStateOf(later, 1000)).assertEqual(DueState.FUTURE);
      expect(overdueDays(later, 1000)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUESTATECASES_0300
     * @tc.name      testDueStateCases0003
     * @tc.desc      Verify zero remain is soon
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDueStateCases0003', 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      expect(dueStateOf(due, 1000)).assertEqual(DueState.DUE_SOON);
      expect(dueStateOf(dueAtOf(1001, Priority.NORMAL), 1000)).assertEqual(DueState.DUE_SOON);
      expect(dueStateOf(due, 1001)).assertEqual(DueState.OVERDUE);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUESTATECASES_0400
     * @tc.name      testDueStateCases0004
     * @tc.desc      Verify past by one millisecond is overdue
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDueStateCases0004', 0, (): void => {
      const due: TodoDue = dueAtOf(999, Priority.NORMAL);
      expect(dueStateOf(due, 1000)).assertEqual(DueState.OVERDUE);
      expect((DueState.OVERDUE as string) === (DueState.DUE_SOON as string)).assertFalse();
      expect(overdueDays(due, 1000)).assertEqual(0);
      expect(overdueDays(due, 1000 + DAY)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUESTATECASES_0500
     * @tc.name      testDueStateCases0005
     * @tc.desc      Verify overdue days floor
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDueStateCases0005', 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      expect(overdueDays(due, 1000 + DAY + 5)).assertEqual(1);
      expect(overdueDays(due, 1000 + 3 * DAY + DAY - 1)).assertEqual(3);
      expect(overdueDays(due, 1000 + DAY - 1)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUESTATECASES_0600
     * @tc.name      testDueStateCases0006
     * @tc.desc      Verify overdue days only for overdue
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDueStateCases0006', 0, (): void => {
      expect(overdueDays(dueAtOf(1000, Priority.NORMAL), 500)).assertEqual(0);
      expect(overdueDays(dueAtOf(1000, Priority.NORMAL), 1000)).assertEqual(0);
      const done: TodoDue = dueAtOf(1000, Priority.NORMAL);
      done.done = true;
      expect(overdueDays(done, 1000 + 5 * DAY)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUESTATECASES_0700
     * @tc.name      testDueStateCases0007
     * @tc.desc      Verify high priority does not change state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDueStateCases0007', 0, (): void => {
      const high: TodoDue = dueAtOf(500, Priority.HIGH);
      const low: TodoDue = dueAtOf(500, Priority.LOW);
      expect(dueStateOf(high, 1000)).assertEqual(dueStateOf(low, 1000));
      expect(dueStateOf(high, 1000)).assertEqual(DueState.OVERDUE);
      expect(overdueDays(high, 1000)).assertEqual(0);
      expect(priorityWeight(high.priority)).assertEqual(0);
    });
  });

  describe('DeferCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_DEFERCASES_0100
     * @tc.name      testDeferCases0001
     * @tc.desc      Verify defer moves due date
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDeferCases0001', 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      expect(defer(due, 2, 500)).assertTrue();
      expect(due.dueAt).assertEqual(1000 + 2 * DAY);
      expect(due.deferredAt).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DEFERCASES_0200
     * @tc.name      testDeferCases0002
     * @tc.desc      Verify defer rejects non positive days
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDeferCases0002', 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      expect(defer(due, 0, 500)).assertFalse();
      expect(defer(due, -3, 500)).assertFalse();
      expect(due.dueAt).assertEqual(1000);
      expect(due.deferredAt).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DEFERCASES_0300
     * @tc.name      testDeferCases0003
     * @tc.desc      Verify defer rejects undated
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDeferCases0003', 0, (): void => {
      const due: TodoDue = new TodoDue();
      expect(defer(due, 3, 500)).assertFalse();
      expect(due.dueAt).assertEqual(0);
      expect(due.undated()).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DEFERCASES_0400
     * @tc.name      testDeferCases0004
     * @tc.desc      Verify defer keeps priority
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDeferCases0004', 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.HIGH);
      defer(due, 1, 500);
      expect(due.priority).assertEqual(Priority.HIGH);
      expect(due.done).assertFalse();
      expect(due.dueAt).assertEqual(1000 + DAY);
      expect(due.deferredAt).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DEFERCASES_0500
     * @tc.name      testDeferCases0005
     * @tc.desc      Verify defer may leave task overdue
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDeferCases0005', 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      defer(due, 1, 1000 + 10 * DAY);
      expect(dueStateOf(due, 1000 + 10 * DAY)).assertEqual(DueState.OVERDUE);
      expect(overdueDays(due, 1000 + 10 * DAY)).assertEqual(9);
      expect(due.deferredAt).assertEqual(1000 + 10 * DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DEFERCASES_0600
     * @tc.name      testDeferCases0006
     * @tc.desc      Verify defer can make task future
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDeferCases0006', 0, (): void => {
      const now: number = 1000 + 3 * DAY;
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      defer(due, 10, now);
      expect(dueStateOf(due, now)).assertEqual(DueState.FUTURE);
      expect(due.deferredAt).assertEqual(now);
      expect(due.dueAt).assertEqual(1000 + 10 * DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DEFERCASES_0700
     * @tc.name      testDeferCases0007
     * @tc.desc      Verify repeated defer accumulates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDeferCases0007', 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      defer(due, 1, 500);
      defer(due, 1, 600);
      expect(due.dueAt).assertEqual(1000 + 2 * DAY);
      expect(due.deferredAt).assertEqual(600);
      expect(due.priority).assertEqual(Priority.NORMAL);
    });
  });

  describe('PriorityCases', (): void => {
;

    /**
     * @tc.number    SUB_SHORTCUT_PRIORITYCASES_0200
     * @tc.name      testPriorityCases0002
     * @tc.desc      Verify weights are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPriorityCases0002', 0, (): void => {
      const weights: number[] = [priorityWeight(Priority.HIGH), priorityWeight(Priority.NORMAL),
        priorityWeight(Priority.LOW)];
      expect(weights.filter((weight: number, index: number): boolean =>
        weights.indexOf(weight) === index).length).assertEqual(3);
      expect(Math.max(weights[0], weights[2])).assertEqual(2);
      expect(weights[0]).assertEqual(0);
      expect(weights[1]).assertEqual(1);
      expect(weights[2]).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_PRIORITYCASES_0300
     * @tc.name      testPriorityCases0003
     * @tc.desc      Verify weights stay in range
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPriorityCases0003', 0, (): void => {
      const items: TodoDue[] = [dueAtOf(1000, Priority.HIGH), dueAtOf(2000, Priority.LOW),
        dueAtOf(3000, Priority.NORMAL)];
      expect(items.every((item: TodoDue): boolean =>
        priorityWeight(item.priority) >= 0 && priorityWeight(item.priority) <= 2)).assertTrue();
      expect(items.length).assertEqual(3);
      expect(priorityWeight(Priority.HIGH)).assertEqual(0);
      expect(priorityWeight(Priority.LOW)).assertEqual(2);
      expect(priorityWeight(Priority.HIGH) < priorityWeight(Priority.LOW)).assertTrue();
    });
  });

  describe('NextOccurrenceCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0100
     * @tc.name      testNextOccurrenceCases0001
     * @tc.desc      Verify no repeat has no next
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0001', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      expect(nextOccurrence(due, FRIDAY)).assertEqual(0);
      expect(due.repeat).assertEqual(RepeatKind.NONE);
      expect(nextOccurrence(due, FRIDAY + DAY)).assertEqual(0);
      expect(due.dueAt).assertEqual(FRIDAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0200
     * @tc.name      testNextOccurrenceCases0002
     * @tc.desc      Verify daily advances one day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0002', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      const next: number = nextOccurrence(due, FRIDAY);
      expect(next).assertEqual(FRIDAY + DAY);
      expect(dateKeyOf(next)).assertEqual('2024-01-20');
      expect(nextOccurrence(due, next)).assertEqual(FRIDAY + 2 * DAY);
      expect(due.repeat).assertEqual(RepeatKind.DAILY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0300
     * @tc.name      testNextOccurrenceCases0003
     * @tc.desc      Verify weekly advances seven days
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0003', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKLY;
      expect(dateKeyOf(nextOccurrence(due, FRIDAY))).assertEqual('2024-01-26');
      expect(nextOccurrence(due, FRIDAY)).assertEqual(FRIDAY + 7 * DAY);
      expect(due.repeat).assertEqual(RepeatKind.WEEKLY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0400
     * @tc.name      testNextOccurrenceCases0004
     * @tc.desc      Verify monthly keeps day of month
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0004', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.MONTHLY;
      expect(dateKeyOf(nextOccurrence(due, FRIDAY))).assertEqual('2024-02-19');
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)).indexOf('2024-02') === 0).assertTrue();
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)).length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0500
     * @tc.name      testNextOccurrenceCases0005
     * @tc.desc      Verify monthly overflows short month
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0005', 0, (): void => {
      const endOfMonth: number = new Date(2024, 0, 31, 9, 0, 0, 0).getTime();
      const due: TodoDue = dueAtOf(endOfMonth, Priority.NORMAL);
      due.repeat = RepeatKind.MONTHLY;
      expect(dateKeyOf(nextOccurrence(due, endOfMonth))).assertEqual('2024-03-02');
      expect(dateKeyOf(nextOccurrence(due, endOfMonth)).indexOf('2024-03') === 0).assertTrue();
      expect(dateKeyOf(nextOccurrence(due, endOfMonth)).length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0600
     * @tc.name      testNextOccurrenceCases0006
     * @tc.desc      Verify weekday skips weekend
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0006', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKDAY;
      expect(new Date(FRIDAY).getDay()).assertEqual(5);
      expect(dateKeyOf(nextOccurrence(due, FRIDAY))).assertEqual('2024-01-22');
      expect(new Date(nextOccurrence(due, FRIDAY)).getDay()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0700
     * @tc.name      testNextOccurrenceCases0007
     * @tc.desc      Verify weekday from monday stays weekday
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0007', 0, (): void => {
      const monday: number = new Date(2024, 0, 22, 9, 0, 0, 0).getTime();
      const due: TodoDue = dueAtOf(monday, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKDAY;
      expect(dateKeyOf(nextOccurrence(due, monday))).assertEqual('2024-01-23');
      expect(new Date(nextOccurrence(due, monday)).getDay()).assertEqual(2);
      expect(dateKeyOf(nextOccurrence(due, monday)).indexOf('2024-01') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0800
     * @tc.name      testNextOccurrenceCases0008
     * @tc.desc      Verify weekday from saturday jumps to monday
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0008', 0, (): void => {
      const saturday: number = new Date(2024, 0, 20, 9, 0, 0, 0).getTime();
      const due: TodoDue = dueAtOf(saturday, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKDAY;
      expect(new Date(saturday).getDay()).assertEqual(6);
      expect(dateKeyOf(nextOccurrence(due, saturday))).assertEqual('2024-01-22');
      expect(new Date(nextOccurrence(due, saturday)).getDay()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0900
     * @tc.name      testNextOccurrenceCases0009
     * @tc.desc      Verify exception skips one day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0009', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      due.exceptions.push('2024-01-20');
      expect(dateKeyOf(nextOccurrence(due, FRIDAY))).assertEqual('2024-01-21');
      expect(due.exceptions.length).assertEqual(1);
      expect(due.exceptions[0]).assertEqual('2024-01-20');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1000
     * @tc.name      testNextOccurrenceCases0010
     * @tc.desc      Verify multiple exceptions chain
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0010', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      due.exceptions.push('2024-01-20');
      due.exceptions.push('2024-01-21');
      due.exceptions.push('2024-01-22');
      expect(dateKeyOf(nextOccurrence(due, FRIDAY))).assertEqual('2024-01-23');
      expect(new Date(nextOccurrence(due, FRIDAY)).getDay()).assertEqual(2);
      expect(due.exceptions.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1100
     * @tc.name      testNextOccurrenceCases0011
     * @tc.desc      Verify exception on other date is ignored
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0011', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      due.exceptions.push('2024-05-01');
      expect(dateKeyOf(nextOccurrence(due, FRIDAY))).assertEqual('2024-01-20');
      expect(nextOccurrence(due, FRIDAY)).assertEqual(FRIDAY + DAY);
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)) === '2024-05-01').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1200
     * @tc.name      testNextOccurrenceCases0012
     * @tc.desc      Verify weekday exception skips to next workday
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0012', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKDAY;
      due.exceptions.push('2024-01-22');
      expect(dateKeyOf(nextOccurrence(due, FRIDAY))).assertEqual('2024-01-23');
      expect(due.exceptions.length).assertEqual(1);
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)) === '2024-01-22').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1300
     * @tc.name      testNextOccurrenceCases0013
     * @tc.desc      Verify saturated exceptions return zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0013', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      for (let index = 1; index <= 400; index++) {
        due.exceptions.push(dateKeyOf(FRIDAY + index * DAY));
      }
      expect(due.exceptions.length).assertEqual(400);
      expect(nextOccurrence(due, FRIDAY)).assertEqual(0);
      expect(due.repeat).assertEqual(RepeatKind.DAILY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1400
     * @tc.name      testNextOccurrenceCases0014
     * @tc.desc      Verify next occurrence starts from given moment
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0014', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      const later: number = FRIDAY + 5 * DAY;
      expect(dateKeyOf(nextOccurrence(due, later))).assertEqual('2024-01-25');
      expect(dateKeyOf(nextOccurrence(due, FRIDAY))).assertEqual('2024-01-20');
      expect(nextOccurrence(due, later)).assertEqual(later + DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1500
     * @tc.name      testNextOccurrenceCases0015
     * @tc.desc      Verify next occurrence does not mutate
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNextOccurrenceCases0015', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKLY;
      nextOccurrence(due, FRIDAY);
      expect(due.dueAt).assertEqual(FRIDAY);
      expect(due.repeat).assertEqual(RepeatKind.WEEKLY);
      expect(nextOccurrence(due, FRIDAY)).assertEqual(FRIDAY + 7 * DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1600
     * @tc.name      testNextOccurrenceCases0016
     * @tc.desc      Verify repeat text for none
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testNextOccurrenceCases0016', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      expect(repeatText(RepeatKind.NONE, due, FRIDAY)).assertEqual('不重复');
      expect(repeatText(RepeatKind.NONE, due, FRIDAY)).assertEqual(repeatText(RepeatKind.NONE, due, FRIDAY));
      expect(repeatText(RepeatKind.NONE, due, FRIDAY).length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1700
     * @tc.name      testNextOccurrenceCases0017
     * @tc.desc      Verify repeat text shows next date
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testNextOccurrenceCases0017', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      expect(repeatText(RepeatKind.DAILY, due, FRIDAY)).assertEqual('每天（下次 2024-01-20）');
      expect(repeatText(RepeatKind.DAILY, due, FRIDAY).indexOf('下次') > 0).assertTrue();
      expect(repeatText(RepeatKind.DAILY, due, FRIDAY).indexOf('每天') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1800
     * @tc.name      testNextOccurrenceCases0018
     * @tc.desc      Verify repeat text handles undecided next
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testNextOccurrenceCases0018', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      expect(repeatText(RepeatKind.DAILY, due, FRIDAY)).assertEqual('每天（下次未定）');
      expect(repeatText(RepeatKind.DAILY, due, FRIDAY).indexOf('未定') > 0).assertTrue();
      expect(repeatText(RepeatKind.DAILY, due, FRIDAY).indexOf('每天') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1900
     * @tc.name      testNextOccurrenceCases0019
     * @tc.desc      Verify repeat text for weekly
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testNextOccurrenceCases0019', 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKLY;
      expect(repeatText(RepeatKind.WEEKLY, due, FRIDAY)).assertEqual('每周（下次 2024-01-26）');
      expect(repeatText(RepeatKind.WEEKLY, due, FRIDAY).indexOf('每周') === 0).assertTrue();
      expect(due.repeat).assertEqual(RepeatKind.WEEKLY);
    });
  });

  describe('BucketCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0100
     * @tc.name      testBucketCases0001
     * @tc.desc      Verify empty buckets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBucketCases0001', 0, (): void => {
      const buckets: DueBuckets = bucketize([], 1000);
      expect(buckets.size()).assertEqual(0);
      expect(buckets.overdue.length).assertEqual(0);
      expect(buckets.describe()).assertEqual('逾期 0｜即将到期 0｜未到期 0｜无截止 0｜已完成 0');
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0200
     * @tc.name      testBucketCases0002
     * @tc.desc      Verify buckets sort by state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBucketCases0002', 0, (): void => {
      const now: number = 10 * DAY;
      const items: TodoDue[] = [
        dueAtOf(now - DAY, Priority.NORMAL),
        dueAtOf(now + DAY, Priority.HIGH),
        dueAtOf(now + 5 * DAY, Priority.LOW),
        new TodoDue(),
        dueAtOf(now, Priority.NORMAL)
      ];
      items[4].done = true;
      const buckets: DueBuckets = bucketize(items, now);
      expect(buckets.overdue.length).assertEqual(1);
      expect(buckets.soon.length).assertEqual(1);
      expect(buckets.future.length).assertEqual(1);
      expect(buckets.undated.length).assertEqual(1);
      expect(buckets.done.length).assertEqual(1);
      expect(buckets.size()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0300
     * @tc.name      testBucketCases0003
     * @tc.desc      Verify bucket describe counts all
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBucketCases0003', 0, (): void => {
      const now: number = 10 * DAY;
      const items: TodoDue[] = [dueAtOf(now - DAY, Priority.NORMAL),
        dueAtOf(now - 2 * DAY, Priority.NORMAL), new TodoDue()];
      expect(bucketize(items, now).describe())
        .assertEqual('逾期 2｜即将到期 0｜未到期 0｜无截止 1｜已完成 0');
      expect(bucketize(items, now).overdue.length).assertEqual(2);
      expect(bucketize(items, now).undated.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0400
     * @tc.name      testBucketCases0004
     * @tc.desc      Verify done entry goes to done bucket
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBucketCases0004', 0, (): void => {
      const now: number = 10 * DAY;
      const done: TodoDue = dueAtOf(now - 5 * DAY, Priority.HIGH);
      done.done = true;
      const buckets: DueBuckets = bucketize([done], now);
      expect(buckets.done.length).assertEqual(1);
      expect(buckets.overdue.length).assertEqual(0);
      expect(buckets.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0500
     * @tc.name      testBucketCases0005
     * @tc.desc      Verify undated goes to undated bucket
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBucketCases0005', 0, (): void => {
      const buckets: DueBuckets = bucketize([new TodoDue(), new TodoDue()], 1000);
      expect(buckets.undated.length).assertEqual(2);
      expect(buckets.overdue.length).assertEqual(0);
      expect(buckets.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0600
     * @tc.name      testBucketCases0006
     * @tc.desc      Verify bucket keeps input order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBucketCases0006', 0, (): void => {
      const now: number = 10 * DAY;
      const first: TodoDue = dueAtOf(now - 3 * DAY, Priority.NORMAL);
      const second: TodoDue = dueAtOf(now - DAY, Priority.NORMAL);
      const buckets: DueBuckets = bucketize([first, second], now);
      expect(buckets.overdue.length).assertEqual(2);
      expect(buckets.overdue[0].dueAt).assertEqual(now - 3 * DAY);
      expect(buckets.overdue[1].dueAt).assertEqual(now - DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0700
     * @tc.name      testBucketCases0007
     * @tc.desc      Verify summary of empty list
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBucketCases0007', 0, (): void => {
      expect(dueSummary([], 1000)).assertEqual('暂无待办');
      expect(dueSummary([], 1000).indexOf('暂无') === 0).assertTrue();
      expect(dueSummary([], 1000).length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0800
     * @tc.name      testBucketCases0008
     * @tc.desc      Verify summary matches buckets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBucketCases0008', 0, (): void => {
      const now: number = 10 * DAY;
      const items: TodoDue[] = [dueAtOf(now - DAY, Priority.NORMAL), dueAtOf(now + 5 * DAY,
        Priority.NORMAL)];
      expect(dueSummary(items, now)).assertEqual(bucketize(items, now).describe());
      expect(dueSummary(items, now).indexOf('逾期 1') === 0).assertTrue();
      expect(bucketize(items, now).future.length).assertEqual(1);
      expect(bucketize(items, now).overdue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0900
     * @tc.name      testBucketCases0009
     * @tc.desc      Verify priority does not affect bucketing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBucketCases0009', 0, (): void => {
      const now: number = 10 * DAY;
      const high: TodoDue = dueAtOf(now - DAY, Priority.HIGH);
      const low: TodoDue = dueAtOf(now - DAY, Priority.LOW);
      const buckets: DueBuckets = bucketize([high, low], now);
      expect(buckets.overdue.length).assertEqual(2);
      expect(buckets.future.length).assertEqual(0);
      expect(buckets.describe().indexOf('逾期 2') === 0).assertTrue();
      expect(buckets.soon.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_1000
     * @tc.name      testBucketCases0010
     * @tc.desc      Verify deferred item rebuckets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testBucketCases0010', 0, (): void => {
      const now: number = 10 * DAY;
      const due: TodoDue = dueAtOf(now - DAY, Priority.NORMAL);
      expect(bucketize([due], now).overdue.length).assertEqual(1);
      defer(due, 5, now);
      const after: DueBuckets = bucketize([due], now);
      expect(after.overdue.length).assertEqual(0);
      expect(after.future.length).assertEqual(1);
      expect(after.size()).assertEqual(1);
    });
  });
}
