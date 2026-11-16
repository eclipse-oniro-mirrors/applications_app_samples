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

import { describe } from '@ohos/hypium';
import { caseName, expect, it } from '../support/TestCase';
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

    it(caseName('DueRuleCases', '0001'), 0, (): void => {
      expect(DUE_RULES.length, caseName('DueRuleCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0001').assertEqual(10);
      const codes: string[] = DUE_RULES.map((rule: DueRule): string => rule.code);
      expect(codes[0], caseName('DueRuleCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0002').assertEqual('DU-01');
      expect(codes[9], caseName('DueRuleCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0003').assertEqual('DU-10');
      expect(codes.every((code: string, index: number): boolean =>
        code === `DU-${(index + 1).toString().padStart(2, '0')}`), caseName('DueRuleCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0004').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0200
     * @tc.name      testDueRuleCases0002
     * @tc.desc      Verify rule describe joins facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DueRuleCases', '0002'), 0, (): void => {
      const rule: DueRule = DUE_RULES[3];
      expect(rule.code, caseName('DueRuleCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0005').assertEqual('DU-04');
      expect(rule.describe(), caseName('DueRuleCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0006').assertEqual(
        'DU-04｜截止时间在 24 小时内 → 即将到期｜进入即将到期分组');
      expect(rule.describe().split('｜').length, caseName('DueRuleCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0007').assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0300
     * @tc.name      testDueRuleCases0003
     * @tc.desc      Verify due state enum is closed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DueRuleCases', '0003'), 0, (): void => {
      expect(DueState.NO_DUE, caseName('DueRuleCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0008').assertEqual('无截止');
      expect(DueState.FUTURE, caseName('DueRuleCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0009').assertEqual('未到期');
      expect(DueState.DUE_SOON, caseName('DueRuleCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0010').assertEqual('即将到期');
      expect(DueState.OVERDUE, caseName('DueRuleCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0011').assertEqual('已逾期');
      expect(DueState.DONE, caseName('DueRuleCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0012').assertEqual('已完成');
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0400
     * @tc.name      testDueRuleCases0004
     * @tc.desc      Verify priority enum is ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DueRuleCases', '0004'), 0, (): void => {
      expect(Priority.HIGH, caseName('DueRuleCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0013').assertEqual('高');
      expect(Priority.NORMAL, caseName('DueRuleCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0014').assertEqual('普通');
      expect(Priority.LOW, caseName('DueRuleCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0015').assertEqual('低');
      expect((Priority.HIGH as string) === (Priority.LOW as string), caseName('DueRuleCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0016').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0500
     * @tc.name      testDueRuleCases0005
     * @tc.desc      Verify repeat enum covers five kinds
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DueRuleCases', '0005'), 0, (): void => {
      expect(RepeatKind.NONE, caseName('DueRuleCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0017')
        .assertEqual('none');
      expect(RepeatKind.DAILY, caseName('DueRuleCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0018')
        .assertEqual('daily');
      expect(RepeatKind.WEEKDAY, caseName('DueRuleCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0019')
        .assertEqual('weekday');
      expect(RepeatKind.WEEKLY, caseName('DueRuleCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0020')
        .assertEqual('weekly');
      expect(RepeatKind.MONTHLY, caseName('DueRuleCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0021')
        .assertEqual('monthly');
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0600
     * @tc.name      testDueRuleCases0006
     * @tc.desc      Verify due soon window is one day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DueRuleCases', '0006'), 0, (): void => {
      expect(DUE_SOON_MS, caseName('DueRuleCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0022').assertEqual(DAY);
      expect(DUE_SOON_MS, caseName('DueRuleCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0023').assertEqual(24 * 60 * 60 * 1000);
      expect(DUE_SOON_MS, caseName('DueRuleCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0024').assertEqual(86400000);
      expect(DUE_SOON_MS > 0, caseName('DueRuleCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0025').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0700
     * @tc.name      testDueRuleCases0007
     * @tc.desc      Verify due lines match table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('DueRuleCases', '0007'), 0, (): void => {
      const lines: string[] = dueLines();
      expect(lines.length, caseName('DueRuleCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0026').assertEqual(DUE_RULES.length);
      expect(lines.every((line: string): boolean => line.indexOf('→') > 0), caseName('DueRuleCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0027').assertTrue();
      expect(lines[0].indexOf('DU-01') === 0, caseName('DueRuleCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0028').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUERULECASES_0800
     * @tc.name      testDueRuleCases0008
     * @tc.desc      Verify every rule carries note
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DueRuleCases', '0008'), 0, (): void => {
      expect(DUE_RULES.every((rule: DueRule): boolean => rule.note.length > 0), caseName('DueRuleCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0029').assertTrue();
      expect(DUE_RULES.every((rule: DueRule): boolean =>
        rule.condition.length > 0), caseName('DueRuleCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0030').assertTrue();
      expect(DUE_RULES.filter((rule: DueRule): boolean =>
        rule.state === DueState.OVERDUE).length, caseName('DueRuleCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0031').assertEqual(2);
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

    it(caseName('TodoDueCases', '0001'), 0, (): void => {
      const due: TodoDue = new TodoDue();
      expect(due.dueAt, caseName('TodoDueCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0032').assertEqual(0);
      expect(due.priority, caseName('TodoDueCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0033').assertEqual(Priority.NORMAL);
      expect(due.done, caseName('TodoDueCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0034').assertFalse();
      expect(due.repeat, caseName('TodoDueCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0035').assertEqual(RepeatKind.NONE);
      expect(due.deferredAt, caseName('TodoDueCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0036').assertEqual(0);
      expect(due.exceptions.length, caseName('TodoDueCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0037').assertEqual(0);
      expect(due.undated(), caseName('TodoDueCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0038').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0200
     * @tc.name      testTodoDueCases0002
     * @tc.desc      Verify undated covers zero and negative
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoDueCases', '0002'), 0, (): void => {
      expect(dueAtOf(0, Priority.HIGH).undated(), caseName('TodoDueCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0039').assertTrue();
      expect(dueAtOf(-1, Priority.HIGH).undated(), caseName('TodoDueCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0040').assertTrue();
      expect(dueAtOf(1, Priority.HIGH).undated(), caseName('TodoDueCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0041').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0300
     * @tc.name      testTodoDueCases0003
     * @tc.desc      Verify date key pads month and day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoDueCases', '0003'), 0, (): void => {
      expect(dateKeyOf(new Date(2024, 0, 5, 10, 0, 0, 0).getTime()), caseName('TodoDueCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0042').assertEqual('2024-01-05');
      expect(dateKeyOf(new Date(2024, 11, 31, 23, 59, 0, 0).getTime()), caseName('TodoDueCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0043').assertEqual('2024-12-31');
      expect(dateKeyOf(new Date(2024, 4, 1, 0, 0, 0, 0).getTime()), caseName('TodoDueCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0044').assertEqual('2024-05-01');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0400
     * @tc.name      testTodoDueCases0004
     * @tc.desc      Verify date key ignores time of day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoDueCases', '0004'), 0, (): void => {
      const morning: number = new Date(2024, 4, 1, 0, 0, 0, 0).getTime();
      const evening: number = new Date(2024, 4, 1, 23, 0, 0, 0).getTime();
      expect(dateKeyOf(morning), caseName('TodoDueCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0045').assertEqual(dateKeyOf(evening));
      expect(dateKeyOf(morning).length, caseName('TodoDueCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0046').assertEqual(10);
      expect(dateKeyOf(morning), caseName('TodoDueCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0047').assertEqual('2024-05-01');
      expect(dateKeyOf(evening), caseName('TodoDueCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0048').assertEqual('2024-05-01');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0500
     * @tc.name      testTodoDueCases0005
     * @tc.desc      Verify date key splits days
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoDueCases', '0005'), 0, (): void => {
      const first: string = dateKeyOf(new Date(2024, 4, 1, 10, 0, 0, 0).getTime());
      const second: string = dateKeyOf(new Date(2024, 4, 2, 10, 0, 0, 0).getTime());
      expect(first === second, caseName('TodoDueCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0049').assertFalse();
      expect(first < second, caseName('TodoDueCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0050').assertTrue();
      expect(first, caseName('TodoDueCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0051').assertEqual('2024-05-01');
      expect(second, caseName('TodoDueCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0052').assertEqual('2024-05-02');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0600
     * @tc.name      testTodoDueCases0006
     * @tc.desc      Verify done wins everything
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoDueCases', '0006'), 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.HIGH);
      due.done = true;
      expect(dueStateOf(due, 1000000), caseName('TodoDueCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0053').assertEqual(DueState.DONE);
      expect(dueStateOf(due, 1000), caseName('TodoDueCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0054').assertEqual(DueState.DONE);
      expect(overdueDays(due, 1000000), caseName('TodoDueCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0055').assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0700
     * @tc.name      testTodoDueCases0007
     * @tc.desc      Verify undated is not overdue
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoDueCases', '0007'), 0, (): void => {
      const due: TodoDue = new TodoDue();
      expect(dueStateOf(due, 1000000), caseName('TodoDueCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0056').assertEqual(DueState.NO_DUE);
      expect(overdueDays(due, 1000000), caseName('TodoDueCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0057').assertEqual(0);
      expect(due.dueAt, caseName('TodoDueCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0058').assertEqual(0);
      expect(due.undated(), caseName('TodoDueCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0059').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODUECASES_0800
     * @tc.name      testTodoDueCases0008
     * @tc.desc      Verify exceptions default empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoDueCases', '0008'), 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      due.exceptions.push('2024-05-01');
      expect(due.exceptions.length, caseName('TodoDueCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0060').assertEqual(1);
      expect(due.exceptions[0], caseName('TodoDueCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0061').assertEqual('2024-05-01');
      expect(due.dueAt, caseName('TodoDueCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0062').assertEqual(1000);
      expect(due.repeat, caseName('TodoDueCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0063').assertEqual(RepeatKind.NONE);
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

    it(caseName('DueStateCases', '0001'), 0, (): void => {
      const due: TodoDue = dueAtOf(1000 + 2 * DAY, Priority.NORMAL);
      expect(dueStateOf(due, 1000), caseName('DueStateCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0064').assertEqual(DueState.FUTURE);
      expect(overdueDays(due, 1000), caseName('DueStateCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0065').assertEqual(0);
      expect(dueStateOf(due, 1000 + 2 * DAY), caseName('DueStateCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0066').assertEqual(DueState.DUE_SOON);
      expect(due.dueAt, caseName('DueStateCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0067').assertEqual(1000 + 2 * DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUESTATECASES_0200
     * @tc.name      testDueStateCases0002
     * @tc.desc      Verify window boundary counts as soon
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DueStateCases', '0002'), 0, (): void => {
      const due: TodoDue = dueAtOf(1000 + DUE_SOON_MS, Priority.NORMAL);
      expect(dueStateOf(due, 1000), caseName('DueStateCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0068').assertEqual(DueState.DUE_SOON);
      const later: TodoDue = dueAtOf(1000 + DUE_SOON_MS + 1, Priority.NORMAL);
      expect(dueStateOf(later, 1000), caseName('DueStateCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0069').assertEqual(DueState.FUTURE);
      expect(overdueDays(later, 1000), caseName('DueStateCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0070').assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUESTATECASES_0300
     * @tc.name      testDueStateCases0003
     * @tc.desc      Verify zero remain is soon
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DueStateCases', '0003'), 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      expect(dueStateOf(due, 1000), caseName('DueStateCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0071').assertEqual(DueState.DUE_SOON);
      expect(dueStateOf(dueAtOf(1001, Priority.NORMAL), 1000), caseName('DueStateCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0072').assertEqual(DueState.DUE_SOON);
      expect(dueStateOf(due, 1001), caseName('DueStateCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0073').assertEqual(DueState.OVERDUE);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUESTATECASES_0400
     * @tc.name      testDueStateCases0004
     * @tc.desc      Verify past by one millisecond is overdue
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DueStateCases', '0004'), 0, (): void => {
      const due: TodoDue = dueAtOf(999, Priority.NORMAL);
      expect(dueStateOf(due, 1000), caseName('DueStateCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0074').assertEqual(DueState.OVERDUE);
      expect((DueState.OVERDUE as string) === (DueState.DUE_SOON as string), caseName('DueStateCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0075').assertFalse();
      expect(overdueDays(due, 1000), caseName('DueStateCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0076').assertEqual(0);
      expect(overdueDays(due, 1000 + DAY), caseName('DueStateCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0077').assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUESTATECASES_0500
     * @tc.name      testDueStateCases0005
     * @tc.desc      Verify overdue days floor
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DueStateCases', '0005'), 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      expect(overdueDays(due, 1000 + DAY + 5), caseName('DueStateCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0078').assertEqual(1);
      expect(overdueDays(due, 1000 + 3 * DAY + DAY - 1), caseName('DueStateCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0079').assertEqual(3);
      expect(overdueDays(due, 1000 + DAY - 1), caseName('DueStateCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0080').assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUESTATECASES_0600
     * @tc.name      testDueStateCases0006
     * @tc.desc      Verify overdue days only for overdue
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DueStateCases', '0006'), 0, (): void => {
      expect(overdueDays(dueAtOf(1000, Priority.NORMAL), 500), caseName('DueStateCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0081').assertEqual(0);
      expect(overdueDays(dueAtOf(1000, Priority.NORMAL), 1000), caseName('DueStateCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0082').assertEqual(0);
      const done: TodoDue = dueAtOf(1000, Priority.NORMAL);
      done.done = true;
      expect(overdueDays(done, 1000 + 5 * DAY), caseName('DueStateCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0083').assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUESTATECASES_0700
     * @tc.name      testDueStateCases0007
     * @tc.desc      Verify high priority does not change state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DueStateCases', '0007'), 0, (): void => {
      const high: TodoDue = dueAtOf(500, Priority.HIGH);
      const low: TodoDue = dueAtOf(500, Priority.LOW);
      expect(dueStateOf(high, 1000), caseName('DueStateCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0084').assertEqual(dueStateOf(low, 1000));
      expect(dueStateOf(high, 1000), caseName('DueStateCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0085').assertEqual(DueState.OVERDUE);
      expect(overdueDays(high, 1000), caseName('DueStateCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0086').assertEqual(0);
      expect(priorityWeight(high.priority), caseName('DueStateCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0087').assertEqual(0);
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

    it(caseName('DeferCases', '0001'), 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      expect(defer(due, 2, 500), caseName('DeferCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0088').assertTrue();
      expect(due.dueAt, caseName('DeferCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0089').assertEqual(1000 + 2 * DAY);
      expect(due.deferredAt, caseName('DeferCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0090').assertEqual(500);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DEFERCASES_0200
     * @tc.name      testDeferCases0002
     * @tc.desc      Verify defer rejects non positive days
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DeferCases', '0002'), 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      expect(defer(due, 0, 500), caseName('DeferCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0091').assertFalse();
      expect(defer(due, -3, 500), caseName('DeferCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0092').assertFalse();
      expect(due.dueAt, caseName('DeferCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0093').assertEqual(1000);
      expect(due.deferredAt, caseName('DeferCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0094').assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DEFERCASES_0300
     * @tc.name      testDeferCases0003
     * @tc.desc      Verify defer rejects undated
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DeferCases', '0003'), 0, (): void => {
      const due: TodoDue = new TodoDue();
      expect(defer(due, 3, 500), caseName('DeferCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0095').assertFalse();
      expect(due.dueAt, caseName('DeferCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0096').assertEqual(0);
      expect(due.undated(), caseName('DeferCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0097').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DEFERCASES_0400
     * @tc.name      testDeferCases0004
     * @tc.desc      Verify defer keeps priority
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DeferCases', '0004'), 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.HIGH);
      defer(due, 1, 500);
      expect(due.priority, caseName('DeferCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0098').assertEqual(Priority.HIGH);
      expect(due.done, caseName('DeferCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0099').assertFalse();
      expect(due.dueAt, caseName('DeferCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0100').assertEqual(1000 + DAY);
      expect(due.deferredAt, caseName('DeferCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0101').assertEqual(500);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DEFERCASES_0500
     * @tc.name      testDeferCases0005
     * @tc.desc      Verify defer may leave task overdue
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DeferCases', '0005'), 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      defer(due, 1, 1000 + 10 * DAY);
      expect(dueStateOf(due, 1000 + 10 * DAY), caseName('DeferCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0102').assertEqual(DueState.OVERDUE);
      expect(overdueDays(due, 1000 + 10 * DAY), caseName('DeferCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0103').assertEqual(9);
      expect(due.deferredAt, caseName('DeferCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0104').assertEqual(1000 + 10 * DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DEFERCASES_0600
     * @tc.name      testDeferCases0006
     * @tc.desc      Verify defer can make task future
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DeferCases', '0006'), 0, (): void => {
      const now: number = 1000 + 3 * DAY;
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      defer(due, 10, now);
      expect(dueStateOf(due, now), caseName('DeferCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0105').assertEqual(DueState.FUTURE);
      expect(due.deferredAt, caseName('DeferCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0106').assertEqual(now);
      expect(due.dueAt, caseName('DeferCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0107').assertEqual(1000 + 10 * DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DEFERCASES_0700
     * @tc.name      testDeferCases0007
     * @tc.desc      Verify repeated defer accumulates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DeferCases', '0007'), 0, (): void => {
      const due: TodoDue = dueAtOf(1000, Priority.NORMAL);
      defer(due, 1, 500);
      defer(due, 1, 600);
      expect(due.dueAt, caseName('DeferCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0108').assertEqual(1000 + 2 * DAY);
      expect(due.deferredAt, caseName('DeferCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0109').assertEqual(600);
      expect(due.priority, caseName('DeferCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0110').assertEqual(Priority.NORMAL);
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

    it(caseName('PriorityCases', '0002'), 0, (): void => {
      const weights: number[] = [priorityWeight(Priority.HIGH), priorityWeight(Priority.NORMAL),
        priorityWeight(Priority.LOW)];
      expect(weights.filter((weight: number, index: number): boolean =>
        weights.indexOf(weight) === index).length, caseName('PriorityCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0111').assertEqual(3);
      expect(Math.max(weights[0], weights[2]), caseName('PriorityCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0112').assertEqual(2);
      expect(weights[0], caseName('PriorityCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0113').assertEqual(0);
      expect(weights[1], caseName('PriorityCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0114').assertEqual(1);
      expect(weights[2], caseName('PriorityCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0115').assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_PRIORITYCASES_0300
     * @tc.name      testPriorityCases0003
     * @tc.desc      Verify weights stay in range
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('PriorityCases', '0003'), 0, (): void => {
      const items: TodoDue[] = [dueAtOf(1000, Priority.HIGH), dueAtOf(2000, Priority.LOW),
        dueAtOf(3000, Priority.NORMAL)];
      expect(items.every((item: TodoDue): boolean =>
        priorityWeight(item.priority) >= 0 && priorityWeight(item.priority) <= 2), caseName('PriorityCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0116').assertTrue();
      expect(items.length, caseName('PriorityCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0117').assertEqual(3);
      expect(priorityWeight(Priority.HIGH), caseName('PriorityCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0118').assertEqual(0);
      expect(priorityWeight(Priority.LOW), caseName('PriorityCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0119').assertEqual(2);
      expect(priorityWeight(Priority.HIGH) < priorityWeight(Priority.LOW), caseName('PriorityCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0120').assertTrue();
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

    it(caseName('NextOccurrenceCases', '0001'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      expect(nextOccurrence(due, FRIDAY), caseName('NextOccurrenceCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0121').assertEqual(0);
      expect(due.repeat, caseName('NextOccurrenceCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0122').assertEqual(RepeatKind.NONE);
      expect(nextOccurrence(due, FRIDAY + DAY), caseName('NextOccurrenceCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0123').assertEqual(0);
      expect(due.dueAt, caseName('NextOccurrenceCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0124').assertEqual(FRIDAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0200
     * @tc.name      testNextOccurrenceCases0002
     * @tc.desc      Verify daily advances one day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0002'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      const next: number = nextOccurrence(due, FRIDAY);
      expect(next, caseName('NextOccurrenceCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0125').assertEqual(FRIDAY + DAY);
      expect(dateKeyOf(next), caseName('NextOccurrenceCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0126').assertEqual('2024-01-20');
      expect(nextOccurrence(due, next), caseName('NextOccurrenceCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0127').assertEqual(FRIDAY + 2 * DAY);
      expect(due.repeat, caseName('NextOccurrenceCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0128').assertEqual(RepeatKind.DAILY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0300
     * @tc.name      testNextOccurrenceCases0003
     * @tc.desc      Verify weekly advances seven days
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0003'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKLY;
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)), caseName('NextOccurrenceCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0129').assertEqual('2024-01-26');
      expect(nextOccurrence(due, FRIDAY), caseName('NextOccurrenceCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0130').assertEqual(FRIDAY + 7 * DAY);
      expect(due.repeat, caseName('NextOccurrenceCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0131').assertEqual(RepeatKind.WEEKLY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0400
     * @tc.name      testNextOccurrenceCases0004
     * @tc.desc      Verify monthly keeps day of month
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0004'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.MONTHLY;
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)), caseName('NextOccurrenceCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0132').assertEqual('2024-02-19');
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)).indexOf('2024-02') === 0, caseName('NextOccurrenceCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0133').assertTrue();
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)).length, caseName('NextOccurrenceCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0134').assertEqual(10);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0500
     * @tc.name      testNextOccurrenceCases0005
     * @tc.desc      Verify monthly overflows short month
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0005'), 0, (): void => {
      const endOfMonth: number = new Date(2024, 0, 31, 9, 0, 0, 0).getTime();
      const due: TodoDue = dueAtOf(endOfMonth, Priority.NORMAL);
      due.repeat = RepeatKind.MONTHLY;
      expect(dateKeyOf(nextOccurrence(due, endOfMonth)), caseName('NextOccurrenceCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0135').assertEqual('2024-03-02');
      expect(dateKeyOf(nextOccurrence(due, endOfMonth)).indexOf('2024-03') === 0, caseName('NextOccurrenceCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0136').assertTrue();
      expect(dateKeyOf(nextOccurrence(due, endOfMonth)).length, caseName('NextOccurrenceCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0137').assertEqual(10);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0600
     * @tc.name      testNextOccurrenceCases0006
     * @tc.desc      Verify weekday skips weekend
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0006'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKDAY;
      expect(new Date(FRIDAY).getDay(), caseName('NextOccurrenceCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0138').assertEqual(5);
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)), caseName('NextOccurrenceCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0139').assertEqual('2024-01-22');
      expect(new Date(nextOccurrence(due, FRIDAY)).getDay(), caseName('NextOccurrenceCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0140').assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0700
     * @tc.name      testNextOccurrenceCases0007
     * @tc.desc      Verify weekday from monday stays weekday
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0007'), 0, (): void => {
      const monday: number = new Date(2024, 0, 22, 9, 0, 0, 0).getTime();
      const due: TodoDue = dueAtOf(monday, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKDAY;
      expect(dateKeyOf(nextOccurrence(due, monday)), caseName('NextOccurrenceCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0141').assertEqual('2024-01-23');
      expect(new Date(nextOccurrence(due, monday)).getDay(), caseName('NextOccurrenceCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0142').assertEqual(2);
      expect(dateKeyOf(nextOccurrence(due, monday)).indexOf('2024-01') === 0, caseName('NextOccurrenceCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0143').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0800
     * @tc.name      testNextOccurrenceCases0008
     * @tc.desc      Verify weekday from saturday jumps to monday
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0008'), 0, (): void => {
      const saturday: number = new Date(2024, 0, 20, 9, 0, 0, 0).getTime();
      const due: TodoDue = dueAtOf(saturday, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKDAY;
      expect(new Date(saturday).getDay(), caseName('NextOccurrenceCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0144').assertEqual(6);
      expect(dateKeyOf(nextOccurrence(due, saturday)), caseName('NextOccurrenceCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0145').assertEqual('2024-01-22');
      expect(new Date(nextOccurrence(due, saturday)).getDay(), caseName('NextOccurrenceCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0146').assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_0900
     * @tc.name      testNextOccurrenceCases0009
     * @tc.desc      Verify exception skips one day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0009'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      due.exceptions.push('2024-01-20');
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)), caseName('NextOccurrenceCases', '0009'), 'DueRepeatMatrixCases.test.ets:A0147').assertEqual('2024-01-21');
      expect(due.exceptions.length, caseName('NextOccurrenceCases', '0009'), 'DueRepeatMatrixCases.test.ets:A0148').assertEqual(1);
      expect(due.exceptions[0], caseName('NextOccurrenceCases', '0009'), 'DueRepeatMatrixCases.test.ets:A0149').assertEqual('2024-01-20');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1000
     * @tc.name      testNextOccurrenceCases0010
     * @tc.desc      Verify multiple exceptions chain
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0010'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      due.exceptions.push('2024-01-20');
      due.exceptions.push('2024-01-21');
      due.exceptions.push('2024-01-22');
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)), caseName('NextOccurrenceCases', '0010'), 'DueRepeatMatrixCases.test.ets:A0150').assertEqual('2024-01-23');
      expect(new Date(nextOccurrence(due, FRIDAY)).getDay(), caseName('NextOccurrenceCases', '0010'), 'DueRepeatMatrixCases.test.ets:A0151').assertEqual(2);
      expect(due.exceptions.length, caseName('NextOccurrenceCases', '0010'), 'DueRepeatMatrixCases.test.ets:A0152').assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1100
     * @tc.name      testNextOccurrenceCases0011
     * @tc.desc      Verify exception on other date is ignored
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0011'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      due.exceptions.push('2024-05-01');
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)), caseName('NextOccurrenceCases', '0011'), 'DueRepeatMatrixCases.test.ets:A0153').assertEqual('2024-01-20');
      expect(nextOccurrence(due, FRIDAY), caseName('NextOccurrenceCases', '0011'), 'DueRepeatMatrixCases.test.ets:A0154').assertEqual(FRIDAY + DAY);
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)) === '2024-05-01', caseName('NextOccurrenceCases', '0011'), 'DueRepeatMatrixCases.test.ets:A0155').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1200
     * @tc.name      testNextOccurrenceCases0012
     * @tc.desc      Verify weekday exception skips to next workday
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0012'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKDAY;
      due.exceptions.push('2024-01-22');
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)), caseName('NextOccurrenceCases', '0012'), 'DueRepeatMatrixCases.test.ets:A0156').assertEqual('2024-01-23');
      expect(due.exceptions.length, caseName('NextOccurrenceCases', '0012'), 'DueRepeatMatrixCases.test.ets:A0157').assertEqual(1);
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)) === '2024-01-22', caseName('NextOccurrenceCases', '0012'), 'DueRepeatMatrixCases.test.ets:A0158').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1300
     * @tc.name      testNextOccurrenceCases0013
     * @tc.desc      Verify saturated exceptions return zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0013'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      for (let index = 1; index <= 400; index++) {
        due.exceptions.push(dateKeyOf(FRIDAY + index * DAY));
      }
      expect(due.exceptions.length, caseName('NextOccurrenceCases', '0013'), 'DueRepeatMatrixCases.test.ets:A0159').assertEqual(400);
      expect(nextOccurrence(due, FRIDAY), caseName('NextOccurrenceCases', '0013'), 'DueRepeatMatrixCases.test.ets:A0160').assertEqual(0);
      expect(due.repeat, caseName('NextOccurrenceCases', '0013'), 'DueRepeatMatrixCases.test.ets:A0161').assertEqual(RepeatKind.DAILY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1400
     * @tc.name      testNextOccurrenceCases0014
     * @tc.desc      Verify next occurrence starts from given moment
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0014'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      const later: number = FRIDAY + 5 * DAY;
      expect(dateKeyOf(nextOccurrence(due, later)), caseName('NextOccurrenceCases', '0014'), 'DueRepeatMatrixCases.test.ets:A0162').assertEqual('2024-01-25');
      expect(dateKeyOf(nextOccurrence(due, FRIDAY)), caseName('NextOccurrenceCases', '0014'), 'DueRepeatMatrixCases.test.ets:A0163').assertEqual('2024-01-20');
      expect(nextOccurrence(due, later), caseName('NextOccurrenceCases', '0014'), 'DueRepeatMatrixCases.test.ets:A0164').assertEqual(later + DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1500
     * @tc.name      testNextOccurrenceCases0015
     * @tc.desc      Verify next occurrence does not mutate
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NextOccurrenceCases', '0015'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKLY;
      nextOccurrence(due, FRIDAY);
      expect(due.dueAt, caseName('NextOccurrenceCases', '0015'), 'DueRepeatMatrixCases.test.ets:A0165').assertEqual(FRIDAY);
      expect(due.repeat, caseName('NextOccurrenceCases', '0015'), 'DueRepeatMatrixCases.test.ets:A0166').assertEqual(RepeatKind.WEEKLY);
      expect(nextOccurrence(due, FRIDAY), caseName('NextOccurrenceCases', '0015'), 'DueRepeatMatrixCases.test.ets:A0167').assertEqual(FRIDAY + 7 * DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1600
     * @tc.name      testNextOccurrenceCases0016
     * @tc.desc      Verify repeat text for none
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('NextOccurrenceCases', '0016'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      expect(repeatText(RepeatKind.NONE, due, FRIDAY), caseName('NextOccurrenceCases', '0016'), 'DueRepeatMatrixCases.test.ets:A0168').assertEqual('不重复');
      expect(repeatText(RepeatKind.NONE, due, FRIDAY), caseName('NextOccurrenceCases', '0016'), 'DueRepeatMatrixCases.test.ets:A0169').assertEqual(repeatText(RepeatKind.NONE, due, FRIDAY));
      expect(repeatText(RepeatKind.NONE, due, FRIDAY).length, caseName('NextOccurrenceCases', '0016'), 'DueRepeatMatrixCases.test.ets:A0170').assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1700
     * @tc.name      testNextOccurrenceCases0017
     * @tc.desc      Verify repeat text shows next date
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('NextOccurrenceCases', '0017'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.DAILY;
      expect(repeatText(RepeatKind.DAILY, due, FRIDAY), caseName('NextOccurrenceCases', '0017'), 'DueRepeatMatrixCases.test.ets:A0171').assertEqual('每天（下次 2024-01-20）');
      expect(repeatText(RepeatKind.DAILY, due, FRIDAY).indexOf('下次') > 0, caseName('NextOccurrenceCases', '0017'), 'DueRepeatMatrixCases.test.ets:A0172').assertTrue();
      expect(repeatText(RepeatKind.DAILY, due, FRIDAY).indexOf('每天') === 0, caseName('NextOccurrenceCases', '0017'), 'DueRepeatMatrixCases.test.ets:A0173').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1800
     * @tc.name      testNextOccurrenceCases0018
     * @tc.desc      Verify repeat text handles undecided next
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('NextOccurrenceCases', '0018'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      expect(repeatText(RepeatKind.DAILY, due, FRIDAY), caseName('NextOccurrenceCases', '0018'), 'DueRepeatMatrixCases.test.ets:A0174').assertEqual('每天（下次未定）');
      expect(repeatText(RepeatKind.DAILY, due, FRIDAY).indexOf('未定') > 0, caseName('NextOccurrenceCases', '0018'), 'DueRepeatMatrixCases.test.ets:A0175').assertTrue();
      expect(repeatText(RepeatKind.DAILY, due, FRIDAY).indexOf('每天') === 0, caseName('NextOccurrenceCases', '0018'), 'DueRepeatMatrixCases.test.ets:A0176').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NEXTOCCURRENCECASES_1900
     * @tc.name      testNextOccurrenceCases0019
     * @tc.desc      Verify repeat text for weekly
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('NextOccurrenceCases', '0019'), 0, (): void => {
      const due: TodoDue = dueAtOf(FRIDAY, Priority.NORMAL);
      due.repeat = RepeatKind.WEEKLY;
      expect(repeatText(RepeatKind.WEEKLY, due, FRIDAY), caseName('NextOccurrenceCases', '0019'), 'DueRepeatMatrixCases.test.ets:A0177').assertEqual('每周（下次 2024-01-26）');
      expect(repeatText(RepeatKind.WEEKLY, due, FRIDAY).indexOf('每周') === 0, caseName('NextOccurrenceCases', '0019'), 'DueRepeatMatrixCases.test.ets:A0178').assertTrue();
      expect(due.repeat, caseName('NextOccurrenceCases', '0019'), 'DueRepeatMatrixCases.test.ets:A0179').assertEqual(RepeatKind.WEEKLY);
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

    it(caseName('BucketCases', '0001'), 0, (): void => {
      const buckets: DueBuckets = bucketize([], 1000);
      expect(buckets.size(), caseName('BucketCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0180').assertEqual(0);
      expect(buckets.overdue.length, caseName('BucketCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0181').assertEqual(0);
      expect(buckets.describe(), caseName('BucketCases', '0001'), 'DueRepeatMatrixCases.test.ets:A0182').assertEqual('逾期 0｜即将到期 0｜未到期 0｜无截止 0｜已完成 0');
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0200
     * @tc.name      testBucketCases0002
     * @tc.desc      Verify buckets sort by state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BucketCases', '0002'), 0, (): void => {
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
      expect(buckets.overdue.length, caseName('BucketCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0183').assertEqual(1);
      expect(buckets.soon.length, caseName('BucketCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0184').assertEqual(1);
      expect(buckets.future.length, caseName('BucketCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0185').assertEqual(1);
      expect(buckets.undated.length, caseName('BucketCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0186').assertEqual(1);
      expect(buckets.done.length, caseName('BucketCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0187').assertEqual(1);
      expect(buckets.size(), caseName('BucketCases', '0002'), 'DueRepeatMatrixCases.test.ets:A0188').assertEqual(5);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0300
     * @tc.name      testBucketCases0003
     * @tc.desc      Verify bucket describe counts all
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BucketCases', '0003'), 0, (): void => {
      const now: number = 10 * DAY;
      const items: TodoDue[] = [dueAtOf(now - DAY, Priority.NORMAL),
        dueAtOf(now - 2 * DAY, Priority.NORMAL), new TodoDue()];
      expect(bucketize(items, now).describe(), caseName('BucketCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0189')
        .assertEqual('逾期 2｜即将到期 0｜未到期 0｜无截止 1｜已完成 0');
      expect(bucketize(items, now).overdue.length, caseName('BucketCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0190').assertEqual(2);
      expect(bucketize(items, now).undated.length, caseName('BucketCases', '0003'), 'DueRepeatMatrixCases.test.ets:A0191').assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0400
     * @tc.name      testBucketCases0004
     * @tc.desc      Verify done entry goes to done bucket
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BucketCases', '0004'), 0, (): void => {
      const now: number = 10 * DAY;
      const done: TodoDue = dueAtOf(now - 5 * DAY, Priority.HIGH);
      done.done = true;
      const buckets: DueBuckets = bucketize([done], now);
      expect(buckets.done.length, caseName('BucketCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0192').assertEqual(1);
      expect(buckets.overdue.length, caseName('BucketCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0193').assertEqual(0);
      expect(buckets.size(), caseName('BucketCases', '0004'), 'DueRepeatMatrixCases.test.ets:A0194').assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0500
     * @tc.name      testBucketCases0005
     * @tc.desc      Verify undated goes to undated bucket
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BucketCases', '0005'), 0, (): void => {
      const buckets: DueBuckets = bucketize([new TodoDue(), new TodoDue()], 1000);
      expect(buckets.undated.length, caseName('BucketCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0195').assertEqual(2);
      expect(buckets.overdue.length, caseName('BucketCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0196').assertEqual(0);
      expect(buckets.size(), caseName('BucketCases', '0005'), 'DueRepeatMatrixCases.test.ets:A0197').assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0600
     * @tc.name      testBucketCases0006
     * @tc.desc      Verify bucket keeps input order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BucketCases', '0006'), 0, (): void => {
      const now: number = 10 * DAY;
      const first: TodoDue = dueAtOf(now - 3 * DAY, Priority.NORMAL);
      const second: TodoDue = dueAtOf(now - DAY, Priority.NORMAL);
      const buckets: DueBuckets = bucketize([first, second], now);
      expect(buckets.overdue.length, caseName('BucketCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0198').assertEqual(2);
      expect(buckets.overdue[0].dueAt, caseName('BucketCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0199').assertEqual(now - 3 * DAY);
      expect(buckets.overdue[1].dueAt, caseName('BucketCases', '0006'), 'DueRepeatMatrixCases.test.ets:A0200').assertEqual(now - DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0700
     * @tc.name      testBucketCases0007
     * @tc.desc      Verify summary of empty list
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BucketCases', '0007'), 0, (): void => {
      expect(dueSummary([], 1000), caseName('BucketCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0201').assertEqual('暂无待办');
      expect(dueSummary([], 1000).indexOf('暂无') === 0, caseName('BucketCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0202').assertTrue();
      expect(dueSummary([], 1000).length, caseName('BucketCases', '0007'), 'DueRepeatMatrixCases.test.ets:A0203').assertEqual(4);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0800
     * @tc.name      testBucketCases0008
     * @tc.desc      Verify summary matches buckets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BucketCases', '0008'), 0, (): void => {
      const now: number = 10 * DAY;
      const items: TodoDue[] = [dueAtOf(now - DAY, Priority.NORMAL), dueAtOf(now + 5 * DAY,
        Priority.NORMAL)];
      expect(dueSummary(items, now), caseName('BucketCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0204').assertEqual(bucketize(items, now).describe());
      expect(dueSummary(items, now).indexOf('逾期 1') === 0, caseName('BucketCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0205').assertTrue();
      expect(bucketize(items, now).future.length, caseName('BucketCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0206').assertEqual(1);
      expect(bucketize(items, now).overdue.length, caseName('BucketCases', '0008'), 'DueRepeatMatrixCases.test.ets:A0207').assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_0900
     * @tc.name      testBucketCases0009
     * @tc.desc      Verify priority does not affect bucketing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BucketCases', '0009'), 0, (): void => {
      const now: number = 10 * DAY;
      const high: TodoDue = dueAtOf(now - DAY, Priority.HIGH);
      const low: TodoDue = dueAtOf(now - DAY, Priority.LOW);
      const buckets: DueBuckets = bucketize([high, low], now);
      expect(buckets.overdue.length, caseName('BucketCases', '0009'), 'DueRepeatMatrixCases.test.ets:A0208').assertEqual(2);
      expect(buckets.future.length, caseName('BucketCases', '0009'), 'DueRepeatMatrixCases.test.ets:A0209').assertEqual(0);
      expect(buckets.describe().indexOf('逾期 2') === 0, caseName('BucketCases', '0009'), 'DueRepeatMatrixCases.test.ets:A0210').assertTrue();
      expect(buckets.soon.length, caseName('BucketCases', '0009'), 'DueRepeatMatrixCases.test.ets:A0211').assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_BUCKETCASES_1000
     * @tc.name      testBucketCases0010
     * @tc.desc      Verify deferred item rebuckets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('BucketCases', '0010'), 0, (): void => {
      const now: number = 10 * DAY;
      const due: TodoDue = dueAtOf(now - DAY, Priority.NORMAL);
      expect(bucketize([due], now).overdue.length, caseName('BucketCases', '0010'), 'DueRepeatMatrixCases.test.ets:A0212').assertEqual(1);
      defer(due, 5, now);
      const after: DueBuckets = bucketize([due], now);
      expect(after.overdue.length, caseName('BucketCases', '0010'), 'DueRepeatMatrixCases.test.ets:A0213').assertEqual(0);
      expect(after.future.length, caseName('BucketCases', '0010'), 'DueRepeatMatrixCases.test.ets:A0214').assertEqual(1);
      expect(after.size(), caseName('BucketCases', '0010'), 'DueRepeatMatrixCases.test.ets:A0215').assertEqual(1);
    });
  });
}
