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
import { describe, expect, it } from '@ohos/hypium';
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


    it('testTodoDateHistory0001', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock(2026, 11, 2);
        const store: BusinessStore = await startBusiness(scope, storage, clock);
        expect(await store.addTodo('今日任务')).assertTrue();
        const pastCount: number = store.snapshot().todos.length;
        clock.setDate(2026, 11, 3);
        expect(await store.refreshTodos()).assertTrue();
        expect(store.snapshot().todoDate).assertEqual('2026-11-03');
        const todayCount: number = store.snapshot().todos.length;
        expect(pastCount).assertEqual(4);
        expect(todayCount).assertEqual(3);
        expect(store.selectTodoDate('2026-11-02')).assertTrue();
        expect(store.snapshot().todoFollowToday).assertFalse();
        expect(store.snapshot().todos.length).assertEqual(pastCount);
        expect(await store.addTodo('补记昨日')).assertTrue();
        expect(store.snapshot().todoDate).assertEqual('2026-11-02');
        expect(titleOf(store, '补记昨日') !== undefined).assertTrue();
        expect(store.selectTodoDate('2026-11-03')).assertTrue();
        expect(titleOf(store, '补记昨日') === undefined).assertTrue();
        expect(store.snapshot().todos.length).assertEqual(todayCount);
        expect(store.selectTodoDate('2026-11-02')).assertTrue();
        expect(store.snapshot().todos.some((item: TodoItem): boolean =>
          item.title === '补记昨日')).assertTrue();
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


    it('testTodoDateHistory0002', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const store: BusinessStore = await startBusiness(scope, new MemoryBusinessStorage(),
          new FixedBusinessClock(2026, 11, 2));
        const before: string = store.snapshot().todoDate;
        expect(validDateKey('2026-11-02')).assertTrue();
        expect(validDateKey('2026-02-30')).assertFalse();
        expect(validDateKey('2026-13-01')).assertFalse();
        expect(validDateKey('2026-1-2')).assertFalse();
        expect(store.selectTodoDate('2026-02-30')).assertFalse();
        expect(store.selectTodoDate('2027-01-01')).assertFalse();
        expect(store.selectTodoDate('')).assertFalse();
        expect(store.snapshot().todoDate).assertEqual(before);
        expect(store.snapshot().todoFollowToday).assertTrue();
        expect(store.errorText()).assertEqual('日期无效');
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


    it('testTodoDateHistory0003', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const store: BusinessStore = await startBusiness(scope, new MemoryBusinessStorage(),
          new FixedBusinessClock(2026, 11, 2));
        expect(store.shiftTodoDate(-1)).assertTrue();
        expect(store.snapshot().todoDate).assertEqual('2026-11-01');
        expect(store.shiftTodoDate(0)).assertTrue();
        expect(store.snapshot().todoDate).assertEqual('2026-11-02');
        expect(store.snapshot().todoFollowToday).assertTrue();
        expect(store.shiftTodoDate(1)).assertFalse();
        expect(store.snapshot().todoDate).assertEqual('2026-11-02');
        expect(store.shiftTodoDate(-1)).assertTrue();
        expect(store.shiftTodoDate(1)).assertTrue();
        expect(store.snapshot().todoDate).assertEqual('2026-11-02');
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


    it('testTodoDateHistory0004', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const clock: FixedBusinessClock = new FixedBusinessClock(2026, 11, 2);
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store: BusinessStore = await startBusiness(scope, storage, clock);
        expect(store.selectTodoDate('2026-11-01')).assertTrue();
        expect(await store.addTodo('昨天任务')).assertTrue();
        const first: TodoItem = store.snapshot().todos.find((item: TodoItem): boolean =>
          item.title === '昨天任务') as TodoItem;
        clock.setDate(2026, 11, 5);
        expect(await store.setTodoDone(first.id, true)).assertTrue();
        expect(store.snapshot().todoDate).assertEqual('2026-11-01');
        const done: TodoItem | undefined = store.snapshot().todos.find((item: TodoItem): boolean =>
          item.id === first.id);
        expect(done !== undefined && done.done).assertTrue();
        expect(await store.addTodo('历史补录')).assertTrue();
        expect(store.snapshot().todoDate).assertEqual('2026-11-01');
        expect(store.snapshot().availableDates.indexOf('2026-11-05') >= 0).assertTrue();
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


    it('testTodoDateHistory0005', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const clock: FixedBusinessClock = new FixedBusinessClock(2026, 11, 2);
        const store: BusinessStore = await startBusiness(scope, new MemoryBusinessStorage(), clock);
        clock.setDate(2026, 11, 3);
        expect(await store.refreshTodos()).assertTrue();
        clock.setDate(2026, 11, 4);
        expect(await store.refreshTodos()).assertTrue();
        const dates: string[] = store.snapshot().availableDates;
        expect(dates.length >= 3).assertTrue();
        expect(dates[0]).assertEqual('2026-11-04');
        expect(dates[1]).assertEqual('2026-11-03');
        expect(dates[dates.length - 1]).assertEqual('2026-11-02');
        const summary = store.snapshot().dateSummaries[0];
        expect(summary.date).assertEqual('2026-11-04');
        expect(summary.total).assertEqual(store.snapshot().todos.length);
        expect(summary.done).assertEqual(0);
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


    it('testTodoDateHistory0006', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const clock: FixedBusinessClock = new FixedBusinessClock(2026, 11, 2);
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store: BusinessStore = await startBusiness(scope, storage, clock);
        expect(store.selectTodoDate('2026-10-31')).assertTrue();
        expect(await store.addTodo('月末补记')).assertTrue();
        const writes: number = storage.writeCount;
        store.dispose();
        const reopened: BusinessStore = await startBusiness(scope, storage, clock);
        expect(reopened.selectTodoDate('2026-10-31')).assertTrue();
        expect(reopened.snapshot().todos.some((item: TodoItem): boolean =>
          item.title === '月末补记')).assertTrue();
        expect(storage.writeCount >= writes).assertTrue();
      });
    });
  });
}
