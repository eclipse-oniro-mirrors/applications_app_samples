import { Want } from '@kit.AbilityKit';
import { describe, expect, it } from '@ohos/hypium';
import { AppNavigation } from '../../../main/ets/navigation/AppNavigation';
import { BusinessStore } from '../../../main/ets/business/BusinessStore';
import { PageKey } from '../../../main/ets/model/ShortcutModels';
import { CaseScope, runCase } from '../support/CaseScope';
import { FixedBusinessClock } from '../support/BusinessFixture';
import { ControlledBusinessStorage, loadBusiness } from '../support/CoverageFixture';
import { Deferred } from '../support/ShortcutFixture';
import { WaveDialog, WaveRouter, waveSettle } from '../support/ShortcutWaveFixture';

class NavigationWaveHarness {
  public io: ControlledBusinessStorage;
  public clock: FixedBusinessClock;
  public store: BusinessStore;
  public routes: WaveRouter = new WaveRouter();
  public dialog: WaveDialog = new WaveDialog();
  public reports: string[] = [];
  public nav: AppNavigation;
  constructor(scope: CaseScope, store: BusinessStore, io: ControlledBusinessStorage, clock: FixedBusinessClock) {
    this.store = store;
    this.io = io;
    this.clock = clock;
    this.nav = new AppNavigation(store, this.routes, this.dialog,
      (target: string, source: string, status: string): void => {
        this.reports.push(`${target}:${source}:${status}`);
      });
    this.nav.initialize();
    scope.cleanup((): void => {
      this.nav.dispose();
      this.routes.gate?.resolve(undefined);
      this.dialog.gate?.resolve(2);
    });
  }
}
async function navigationWave(scope: CaseScope): Promise<NavigationWaveHarness> {
  const io: ControlledBusinessStorage = new ControlledBusinessStorage();
  const clock: FixedBusinessClock = new FixedBusinessClock();
  const store: BusinessStore = await loadBusiness(scope, io, clock.now);
  return new NavigationWaveHarness(scope, store, io, clock);
}
function shortcutWant(action: string, filter: string = ''): Want {
  return { parameters: { 'sc.version': '1', 'sc.action': action, 'sc.filter': filter } };
}

export default function shortcutNavigationWaveOneTests(): void {
  describe('ShortcutNavigationWaveOne', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_NAVIGATIONWAVEONE_0100
     * @tc.name testShortcutNavigationWaveOne0001
     * @tc.desc 页面尚未激活时只交付最后一个不同的桌面请求
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutNavigationWaveOne0001', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.nav.receiveWant(shortcutWant('todo.list', 'todayOpen'), true);
        h.nav.receiveWant(shortcutWant('collection.list', 'saved'), true);
        h.nav.activate(PageKey.HOME, (): void => {});
        await waveSettle();
        expect(h.routes.calls.join(',')).assertEqual('push:pages/CollectionPage:');
        expect(h.store.snapshot().favoritesOnly).assertTrue();
        expect(h.store.snapshot().todoFilter).assertEqual('全部');
        expect(h.io.writes).assertEqual(0);
        expect(h.reports.join(',')).assertEqual('collection:冷启动:成功');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_NAVIGATIONWAVEONE_0200
     * @tc.name testShortcutNavigationWaveOne0002
     * @tc.desc 非法启动参数单独记录失败但不挤掉已排队的合法入口
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutNavigationWaveOne0002', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.nav.receiveWant(shortcutWant('todo.list', 'todayOpen'), false);
        h.nav.receiveWant(shortcutWant('collection.list', 'todayOpen'), false);
        h.nav.activate(PageKey.HOME, (): void => {});
        await waveSettle();
        expect(h.routes.calls.join(',')).assertEqual('push:pages/TodoPage:');
        expect(h.store.snapshot().todoFilter).assertEqual('未完成');
        expect(h.reports.join(',')).assertEqual('启动参数:invalid-parameters:失败,todo:热启动:成功');
        expect(h.store.snapshot().favoritesOnly).assertFalse();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_NAVIGATIONWAVEONE_0300
     * @tc.name testShortcutNavigationWaveOne0003
     * @tc.desc 只有当前页的失活通知暂停交付并在再次激活后排空
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutNavigationWaveOne0003', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        let revisits: number = 0;
        h.nav.activate(PageKey.HOME, (): void => { revisits++; });
        h.nav.deactivate(PageKey.NOTE);
        await h.nav.open(PageKey.HOME);
        expect(revisits).assertEqual(1);
        h.nav.deactivate(PageKey.HOME);
        h.nav.receiveWant(shortcutWant('collection.list', 'saved'), false);
        await waveSettle();
        expect(h.routes.calls.length).assertEqual(0);
        expect(h.store.snapshot().favoritesOnly).assertFalse();
        h.nav.activate(PageKey.HOME, (): void => {});
        await waveSettle();
        expect(h.routes.calls.join(',')).assertEqual('push:pages/CollectionPage:');
        expect(h.store.snapshot().favoritesOnly).assertTrue();
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_NAVIGATIONWAVEONE_0400
     * @tc.name testShortcutNavigationWaveOne0004
     * @tc.desc 已在便签页时重复桌面入口保留未保存正文并执行重访回调
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutNavigationWaveOne0004', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.store.setDraftBody('未保存的会议结论');
        let revisits: number = 0;
        h.nav.activate(PageKey.NOTE, (): void => { revisits++; });
        h.nav.receiveWant(shortcutWant('note.new'), false);
        await waveSettle();
        expect(revisits).assertEqual(1);
        expect(h.store.snapshot().draftBody).assertEqual('未保存的会议结论');
        expect(h.store.hasUnsavedNoteWork()).assertTrue();
        expect(h.dialog.editing.length).assertEqual(0);
        expect(h.routes.calls.length).assertEqual(0);
        expect(h.io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_NAVIGATIONWAVEONE_0500
     * @tc.name testShortcutNavigationWaveOne0005
     * @tc.desc 详情页再次打开不同入口时替换路由并保留各自标识
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutNavigationWaveOne0005', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        let revisits: number = 0;
        h.nav.activate(PageKey.DETAIL, (): void => { revisits++; });
        await h.nav.openDetail('sc.note.new');
        await h.nav.openDetail('sc.todo.today');
        expect(h.routes.calls.join(',')).assertEqual(
          'replace:pages/ShortcutDetailPage:sc.note.new,replace:pages/ShortcutDetailPage:sc.todo.today');
        expect(revisits).assertEqual(0);
        expect(h.reports.join(',')).assertEqual('detail:应用内:成功,detail:应用内:成功');
        expect(h.io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_NAVIGATIONWAVEONE_0600
     * @tc.name testShortcutNavigationWaveOne0006
     * @tc.desc 单页栈返回替换首页并等待首页生命周期后交付新入口
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutNavigationWaveOne0006', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.routes.depth = 1;
        h.nav.activate(PageKey.TODO, (): void => {});
        await h.nav.back();
        h.nav.receiveWant(shortcutWant('collection.list', 'saved'), false);
        await waveSettle();
        expect(h.routes.calls.join(',')).assertEqual('replace:pages/Index:');
        expect(h.store.snapshot().favoritesOnly).assertFalse();
        h.nav.activate(PageKey.HOME, (): void => {});
        await waveSettle();
        expect(h.routes.calls[1]).assertEqual('push:pages/CollectionPage:');
        expect(h.reports.join(',')).assertEqual('collection:热启动:成功');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_NAVIGATIONWAVEONE_0700
     * @tc.name testShortcutNavigationWaveOne0007
     * @tc.desc 多页栈返回中的请求不能继续按旧页面身份导航
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutNavigationWaveOne0007', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.routes.gate = new Deferred<void>();
        h.nav.activate(PageKey.TODO, (): void => {});
        const returning: Promise<void> = h.nav.back();
        await waveSettle();
        h.nav.receiveWant(shortcutWant('note.new'), false);
        h.routes.gate.resolve(undefined);
        await returning;
        expect(h.routes.calls.join(',')).assertEqual('back:false');
        expect(h.reports.length).assertEqual(0);
        h.nav.activate(PageKey.HOME, (): void => {});
        await waveSettle();
        expect(h.routes.calls[1]).assertEqual('push:pages/NotePage:');
        expect(h.dialog.editing.length).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_NAVIGATIONWAVEONE_0800
     * @tc.name testShortcutNavigationWaveOne0008
     * @tc.desc 返回时选择继续编辑会清除期间排队的其它快捷方式
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutNavigationWaveOne0008', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.store.setDraftTitle('继续编辑');
        h.dialog.gate = new Deferred<number>();
        h.nav.activate(PageKey.NOTE, (): void => {});
        const returning: Promise<void> = h.nav.back();
        h.nav.receiveWant(shortcutWant('collection.list', 'saved'), false);
        h.dialog.gate.resolve(2);
        await returning;
        h.nav.activate(PageKey.NOTE, (): void => {});
        await waveSettle();
        expect(h.routes.calls.length).assertEqual(0);
        expect(h.store.snapshot().draftTitle).assertEqual('继续编辑');
        expect(h.store.hasUnsavedNoteWork()).assertTrue();
        expect(h.store.snapshot().favoritesOnly).assertFalse();
        expect(h.dialog.editing.join(',')).assertEqual('false');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_NAVIGATIONWAVEONE_0900
     * @tc.name testShortcutNavigationWaveOne0009
     * @tc.desc 返回路由失败报告安全提示且解除导航忙状态以便重试
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutNavigationWaveOne0009', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.nav.activate(PageKey.TODO, (): void => {});
        h.routes.fail = true;
        await h.nav.back();
        expect(h.reports.join(',')).assertEqual('todo:router-failed:失败');
        expect(h.dialog.toasts.join(',')).assertEqual('页面打开失败，请重试');
        h.routes.fail = false;
        await h.nav.back();
        expect(h.routes.calls.join(',')).assertEqual('back:false,back:false');
        expect(h.io.writes).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_NAVIGATIONWAVEONE_1000
     * @tc.name testShortcutNavigationWaveOne0010
     * @tc.desc 离开对话框拒绝时不保存不导航并保留编辑工作
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutNavigationWaveOne0010', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.store.setDraftTitle('对话框失败前草稿');
        h.dialog.fail = true;
        h.nav.activate(PageKey.NOTE, (): void => {});
        await h.nav.open(PageKey.TODO);
        expect(h.routes.calls.length).assertEqual(0);
        expect(h.io.writes).assertEqual(0);
        expect(h.store.hasUnsavedNoteWork()).assertTrue();
        expect(h.reports.join(',')).assertEqual('todo:应用内:取消');
        expect(h.dialog.toasts.length).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_NAVIGATIONWAVEONE_1100
     * @tc.name testShortcutNavigationWaveOne0011
     * @tc.desc 跳转失败恢复原日期跟随模式与收藏查询分类
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutNavigationWaveOne0011', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.store.selectTodoDate('2026-11-01');
        h.store.setTodoFilter('已完成');
        h.store.setCollectionQuery('阅读');
        h.store.setCollectionCategory('阅读');
        h.routes.fail = true;
        h.nav.activate(PageKey.COLLECTION, (): void => {});
        h.nav.receiveWant(shortcutWant('todo.list', 'todayOpen'), false);
        await waveSettle();
        expect(h.store.snapshot().todoDate).assertEqual('2026-11-01');
        expect(h.store.snapshot().todoFollowToday).assertFalse();
        expect(h.store.snapshot().todoFilter).assertEqual('已完成');
        expect(h.store.snapshot().collectionQuery).assertEqual('阅读');
        expect(h.store.snapshot().collectionCategory).assertEqual('阅读');
        expect(h.reports.join(',')).assertEqual('collection:router-failed:失败');
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_NAVIGATIONWAVEONE_1200
     * @tc.name testShortcutNavigationWaveOne0012
     * @tc.desc 从历史日期点击今日未完成入口后跨日写入必须先刷新今天
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutNavigationWaveOne0012', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.store.selectTodoDate('2026-11-01');
        h.nav.activate(PageKey.TODO, (): void => {});
        h.nav.receiveWant(shortcutWant('todo.list', 'todayOpen'), false);
        await waveSettle();
        expect(h.store.snapshot().todoDate).assertEqual('2026-11-02');
        expect(h.store.snapshot().todoFollowToday).assertTrue();
        const oldId: string = h.store.snapshot().todos[0].id;
        h.clock.setDate(2026, 11, 3);
        expect(await h.store.setTodoDone(oldId, true)).assertFalse();
        expect(h.store.snapshot().todoDate).assertEqual('2026-11-03');
        expect(h.store.snapshot().todos[0].done).assertFalse();
        expect(h.store.errorText()).assertEqual('日期已更新，请重新选择');
      });
    });
  });
}
