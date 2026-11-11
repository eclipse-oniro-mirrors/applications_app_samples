import { describe, expect, it } from '@ohos/hypium';
import { BusinessStore, TodoItem } from '../../../main/ets/business/BusinessStore';
import { CaseScope, runCase } from '../support/CaseScope';
import { FixedBusinessClock } from '../support/BusinessFixture';
import { ControlledBusinessStorage, loadBusiness } from '../support/CoverageFixture';

export default function shortcutTodoWaveTwoTests(): void {
  describe('ShortcutTodoWaveTwo', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_TODOWAVETWO_0100
     * @tc.name testShortcutTodoWaveTwo0001
     * @tc.desc 更新待办拒绝空和超长输入且接受六十字边界
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutTodoWaveTwo0001', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
        const before: TodoItem = store.snapshot().todos[0];
        expect(await store.updateTodo(before.id, ' \n ')).assertFalse();
        expect(store.errorText()).assertEqual('请输入待办内容');
        expect(await store.updateTodo(before.id, '长'.repeat(61))).assertFalse();
        expect(store.errorText()).assertEqual('待办最多 60 个字符');
        expect(io.writes).assertEqual(0);
        expect(store.snapshot().todos[0].title).assertEqual(before.title);
        expect(await store.updateTodo(before.id, '  ' + '界'.repeat(60) + ' ')).assertTrue();
        expect(store.snapshot().todos[0].title).assertEqual('界'.repeat(60));
        expect(store.snapshot().todos[0].done).assertFalse();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_TODOWAVETWO_0200
     * @tc.name testShortcutTodoWaveTwo0002
     * @tc.desc 待办标题去空白后未变化时不写盘且保留完成状态
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutTodoWaveTwo0002', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
        const item: TodoItem = store.snapshot().todos[0];
        await store.setTodoDone(item.id, true);
        const writes: number = io.writes;
        const committed: string = io.value;
        expect(await store.updateTodo(item.id, `  ${item.title}\n`)).assertTrue();
        expect(store.snapshot().message).assertEqual('内容未变化');
        expect(store.snapshot().todos[0].done).assertTrue();
        expect(io.writes).assertEqual(writes);
        expect(io.value).assertEqual(committed);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_TODOWAVETWO_0300
     * @tc.name testShortcutTodoWaveTwo0003
     * @tc.desc 当前日不能更新不存在或属于其它日期的待办标识
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutTodoWaveTwo0003', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const past: TodoItem = store.snapshot().todos[0];
        clock.setDate(2026, 11, 3);
        await store.refreshTodos();
        const committed: string = io.value;
        const writes: number = io.writes;
        expect(await store.updateTodo('no-such-task', '新内容')).assertFalse();
        expect(await store.updateTodo(past.id, '改写昨天')).assertFalse();
        expect(store.errorText()).assertEqual('待办已更新，请刷新');
        expect(store.snapshot().todoDate).assertEqual('2026-11-03');
        expect(io.writes).assertEqual(writes);
        expect(io.value).assertEqual(committed);
        store.selectTodoDate('2026-11-02');
        expect(store.snapshot().todos[0].title).assertEqual(past.title);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_TODOWAVETWO_0400
     * @tc.name testShortcutTodoWaveTwo0004
     * @tc.desc 完成项改标题失败可重试且重开保留标题与完成状态组合
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutTodoWaveTwo0004', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        const item: TodoItem = store.snapshot().todos[0];
        await store.setTodoDone(item.id, true);
        const committed: string = io.value;
        io.failWrite = true;
        expect(await store.updateTodo(item.id, '失败后续改标题')).assertFalse();
        expect(store.snapshot().todos[0].title).assertEqual(item.title);
        expect(store.snapshot().todos[0].done).assertTrue();
        expect(io.value).assertEqual(committed);
        io.failWrite = false;
        expect(await store.updateTodo(item.id, '失败后续改标题')).assertTrue();
        store.dispose();
        const reopened: BusinessStore = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().todos[0].title).assertEqual('失败后续改标题');
        expect(reopened.snapshot().todos[0].done).assertTrue();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_TODOWAVETWO_0500
     * @tc.name testShortcutTodoWaveTwo0005
     * @tc.desc 达到二十项后拒绝新增并在删除释放名额后正确持久化新项
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutTodoWaveTwo0005', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        const clock: FixedBusinessClock = new FixedBusinessClock();
        const store: BusinessStore = await loadBusiness(scope, io, clock.now);
        for (let index: number = 0; index < 17; index++) {
          if (!await store.addTodo(`扩充实际待办${index}`)) { throw new Error('capacity setup failed'); }
        }
        const committed: string = io.value;
        const writes: number = io.writes;
        expect(await store.addTodo('第二十一项')).assertFalse();
        expect(store.errorText()).assertEqual('当日待办已满，请先删除');
        expect(io.value).assertEqual(committed);
        expect(io.writes).assertEqual(writes);
        const removed: string = store.snapshot().todos[3].id;
        await store.deleteTodo(removed);
        expect(await store.addTodo('释放名额后的待办')).assertTrue();
        store.dispose();
        const reopened: BusinessStore = await loadBusiness(scope, io, clock.now);
        expect(reopened.snapshot().todos.length).assertEqual(20);
        expect(reopened.snapshot().todos.some((todo: TodoItem): boolean => todo.id === removed)).assertFalse();
        expect(reopened.snapshot().todos[19].title).assertEqual('释放名额后的待办');
      });
    });
  });
}
