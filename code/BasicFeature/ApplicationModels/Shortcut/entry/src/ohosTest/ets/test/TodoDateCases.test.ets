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

/**
 * 待办日期历史：查看过去日期、写入隔离、午夜行为与重开持久化。
 * 这些用例直接跑真实 BusinessStore + 存储夹具，不复制业务规则。
 */
import { describe } from '@ohos/hypium';
import { caseName, expect, it } from '../support/TestCase';
import { BusinessStore, TodoItem, validDateKey } from '../../../main/ets/business/BusinessStore';
import { CaseScope, runCase } from '../support/CaseScope';
import { FixedBusinessClock, MemoryBusinessStorage, startBusiness } from '../support/BusinessFixture';

function titleOf(store: BusinessStore, title: string): TodoItem | undefined {
  return store.snapshot().todos.find((item: TodoItem): boolean => item.title === title);
}

export default function todoDateCases(): void {
  describe('TodoDateHistory', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TODODATEHISTORY_0100
     * @tc.name      testTodoDateHistory0001
     * @tc.desc      Verify past date writes stay on selected day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('TodoDateHistory', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('TodoDateHistory', '0001'), async (scope: CaseScope): Promise<void> => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock(2026, 11, 2);
        const store: BusinessStore = await startBusiness(scope, storage, clock);
        expect(await store.addTodo('今日任务'), caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0001').assertTrue();
        const pastCount: number = store.snapshot().todos.length;
        clock.setDate(2026, 11, 3);
        expect(await store.refreshTodos(), caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0002').assertTrue();
        expect(store.snapshot().todoDate, caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0003').assertEqual('2026-11-03');
        const todayCount: number = store.snapshot().todos.length;
        expect(pastCount, caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0004').assertEqual(4);
        expect(todayCount, caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0005').assertEqual(3);
        expect(store.selectTodoDate('2026-11-02'), caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0006').assertTrue();
        expect(store.snapshot().todoFollowToday, caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0007').assertFalse();
        expect(store.snapshot().todos.length, caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0008').assertEqual(pastCount);
        expect(await store.addTodo('补记昨日'), caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0009').assertTrue();
        expect(store.snapshot().todoDate, caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0010').assertEqual('2026-11-02');
        expect(titleOf(store, '补记昨日') !== undefined, caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0011').assertTrue();
        expect(store.selectTodoDate('2026-11-03'), caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0012').assertTrue();
        expect(titleOf(store, '补记昨日') === undefined, caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0013').assertTrue();
        expect(store.snapshot().todos.length, caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0014').assertEqual(todayCount);
        expect(store.selectTodoDate('2026-11-02'), caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0015').assertTrue();
        expect(store.snapshot().todos.some((item: TodoItem): boolean =>
          item.title === '补记昨日'), caseName('TodoDateHistory', '0001'), 'TodoDateCases.test.ets:A0016').assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODATEHISTORY_0200
     * @tc.name      testTodoDateHistory0002
     * @tc.desc      Verify invalid and future dates are rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('TodoDateHistory', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('TodoDateHistory', '0002'), async (scope: CaseScope): Promise<void> => {
        const store: BusinessStore = await startBusiness(scope, new MemoryBusinessStorage(),
          new FixedBusinessClock(2026, 11, 2));
        const before: string = store.snapshot().todoDate;
        expect(validDateKey('2026-11-02'), caseName('TodoDateHistory', '0002'), 'TodoDateCases.test.ets:A0017').assertTrue();
        expect(validDateKey('2026-02-30'), caseName('TodoDateHistory', '0002'), 'TodoDateCases.test.ets:A0018').assertFalse();
        expect(validDateKey('2026-13-01'), caseName('TodoDateHistory', '0002'), 'TodoDateCases.test.ets:A0019').assertFalse();
        expect(validDateKey('2026-1-2'), caseName('TodoDateHistory', '0002'), 'TodoDateCases.test.ets:A0020').assertFalse();
        expect(store.selectTodoDate('2026-02-30'), caseName('TodoDateHistory', '0002'), 'TodoDateCases.test.ets:A0021').assertFalse();
        expect(store.selectTodoDate('2027-01-01'), caseName('TodoDateHistory', '0002'), 'TodoDateCases.test.ets:A0022').assertFalse();
        expect(store.selectTodoDate(''), caseName('TodoDateHistory', '0002'), 'TodoDateCases.test.ets:A0023').assertFalse();
        expect(store.snapshot().todoDate, caseName('TodoDateHistory', '0002'), 'TodoDateCases.test.ets:A0024').assertEqual(before);
        expect(store.snapshot().todoFollowToday, caseName('TodoDateHistory', '0002'), 'TodoDateCases.test.ets:A0025').assertTrue();
        expect(store.errorText(), caseName('TodoDateHistory', '0002'), 'TodoDateCases.test.ets:A0026').assertEqual('日期无效');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODATEHISTORY_0300
     * @tc.name      testTodoDateHistory0003
     * @tc.desc      Verify date shift stops at today
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('TodoDateHistory', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('TodoDateHistory', '0003'), async (scope: CaseScope): Promise<void> => {
        const store: BusinessStore = await startBusiness(scope, new MemoryBusinessStorage(),
          new FixedBusinessClock(2026, 11, 2));
        expect(store.shiftTodoDate(-1), caseName('TodoDateHistory', '0003'), 'TodoDateCases.test.ets:A0027').assertTrue();
        expect(store.snapshot().todoDate, caseName('TodoDateHistory', '0003'), 'TodoDateCases.test.ets:A0028').assertEqual('2026-11-01');
        expect(store.shiftTodoDate(0), caseName('TodoDateHistory', '0003'), 'TodoDateCases.test.ets:A0029').assertTrue();
        expect(store.snapshot().todoDate, caseName('TodoDateHistory', '0003'), 'TodoDateCases.test.ets:A0030').assertEqual('2026-11-02');
        expect(store.snapshot().todoFollowToday, caseName('TodoDateHistory', '0003'), 'TodoDateCases.test.ets:A0031').assertTrue();
        expect(store.shiftTodoDate(1), caseName('TodoDateHistory', '0003'), 'TodoDateCases.test.ets:A0032').assertFalse();
        expect(store.snapshot().todoDate, caseName('TodoDateHistory', '0003'), 'TodoDateCases.test.ets:A0033').assertEqual('2026-11-02');
        expect(store.shiftTodoDate(-1), caseName('TodoDateHistory', '0003'), 'TodoDateCases.test.ets:A0034').assertTrue();
        expect(store.shiftTodoDate(1), caseName('TodoDateHistory', '0003'), 'TodoDateCases.test.ets:A0035').assertTrue();
        expect(store.snapshot().todoDate, caseName('TodoDateHistory', '0003'), 'TodoDateCases.test.ets:A0036').assertEqual('2026-11-02');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODATEHISTORY_0400
     * @tc.name      testTodoDateHistory0004
     * @tc.desc      Verify historical selection survives midnight
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('TodoDateHistory', '0004'), 0, async (): Promise<void> => {
      await runCase(caseName('TodoDateHistory', '0004'), async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock(2026, 11, 2);
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store: BusinessStore = await startBusiness(scope, storage, clock);
        expect(store.selectTodoDate('2026-11-01'), caseName('TodoDateHistory', '0004'), 'TodoDateCases.test.ets:A0037').assertTrue();
        expect(await store.addTodo('昨天任务'), caseName('TodoDateHistory', '0004'), 'TodoDateCases.test.ets:A0038').assertTrue();
        const first: TodoItem = store.snapshot().todos.find((item: TodoItem): boolean =>
          item.title === '昨天任务') as TodoItem;
        clock.setDate(2026, 11, 5);
        expect(await store.setTodoDone(first.id, true), caseName('TodoDateHistory', '0004'), 'TodoDateCases.test.ets:A0039').assertTrue();
        expect(store.snapshot().todoDate, caseName('TodoDateHistory', '0004'), 'TodoDateCases.test.ets:A0040').assertEqual('2026-11-01');
        const done: TodoItem | undefined = store.snapshot().todos.find((item: TodoItem): boolean =>
          item.id === first.id);
        expect(done !== undefined && done.done, caseName('TodoDateHistory', '0004'), 'TodoDateCases.test.ets:A0041').assertTrue();
        expect(await store.addTodo('历史补录'), caseName('TodoDateHistory', '0004'), 'TodoDateCases.test.ets:A0042').assertTrue();
        expect(store.snapshot().todoDate, caseName('TodoDateHistory', '0004'), 'TodoDateCases.test.ets:A0043').assertEqual('2026-11-01');
        expect(store.snapshot().availableDates.indexOf('2026-11-05') >= 0, caseName('TodoDateHistory', '0004'), 'TodoDateCases.test.ets:A0044').assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODATEHISTORY_0500
     * @tc.name      testTodoDateHistory0005
     * @tc.desc      Verify summaries are descending and counted
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('TodoDateHistory', '0005'), 0, async (): Promise<void> => {
      await runCase(caseName('TodoDateHistory', '0005'), async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock(2026, 11, 2);
        const store: BusinessStore = await startBusiness(scope, new MemoryBusinessStorage(), clock);
        clock.setDate(2026, 11, 3);
        expect(await store.refreshTodos(), caseName('TodoDateHistory', '0005'), 'TodoDateCases.test.ets:A0045').assertTrue();
        clock.setDate(2026, 11, 4);
        expect(await store.refreshTodos(), caseName('TodoDateHistory', '0005'), 'TodoDateCases.test.ets:A0046').assertTrue();
        const dates: string[] = store.snapshot().availableDates;
        expect(dates.length >= 3, caseName('TodoDateHistory', '0005'), 'TodoDateCases.test.ets:A0047').assertTrue();
        expect(dates[0], caseName('TodoDateHistory', '0005'), 'TodoDateCases.test.ets:A0048').assertEqual('2026-11-04');
        expect(dates[1], caseName('TodoDateHistory', '0005'), 'TodoDateCases.test.ets:A0049').assertEqual('2026-11-03');
        expect(dates[dates.length - 1], caseName('TodoDateHistory', '0005'), 'TodoDateCases.test.ets:A0050').assertEqual('2026-11-02');
        const summary = store.snapshot().dateSummaries[0];
        expect(summary.date, caseName('TodoDateHistory', '0005'), 'TodoDateCases.test.ets:A0051').assertEqual('2026-11-04');
        expect(summary.total, caseName('TodoDateHistory', '0005'), 'TodoDateCases.test.ets:A0052').assertEqual(store.snapshot().todos.length);
        expect(summary.done, caseName('TodoDateHistory', '0005'), 'TodoDateCases.test.ets:A0053').assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODODATEHISTORY_0600
     * @tc.name      testTodoDateHistory0006
     * @tc.desc      Verify historical write persists across reopen
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('TodoDateHistory', '0006'), 0, async (): Promise<void> => {
      await runCase(caseName('TodoDateHistory', '0006'), async (scope: CaseScope): Promise<void> => {
        const clock: FixedBusinessClock = new FixedBusinessClock(2026, 11, 2);
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store: BusinessStore = await startBusiness(scope, storage, clock);
        expect(store.selectTodoDate('2026-10-31'), caseName('TodoDateHistory', '0006'), 'TodoDateCases.test.ets:A0054').assertTrue();
        expect(await store.addTodo('月末补记'), caseName('TodoDateHistory', '0006'), 'TodoDateCases.test.ets:A0055').assertTrue();
        const writes: number = storage.writeCount;
        store.dispose();
        const reopened: BusinessStore = await startBusiness(scope, storage, clock);
        expect(reopened.selectTodoDate('2026-10-31'), caseName('TodoDateHistory', '0006'), 'TodoDateCases.test.ets:A0056').assertTrue();
        expect(reopened.snapshot().todos.some((item: TodoItem): boolean =>
          item.title === '月末补记'), caseName('TodoDateHistory', '0006'), 'TodoDateCases.test.ets:A0057').assertTrue();
        expect(storage.writeCount >= writes, caseName('TodoDateHistory', '0006'), 'TodoDateCases.test.ets:A0058').assertTrue();
      });
    });
  });
}
