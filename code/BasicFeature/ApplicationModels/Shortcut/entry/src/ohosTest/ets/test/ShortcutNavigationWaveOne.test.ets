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

import { Want } from '@kit.AbilityKit';
import { describe } from '@ohos/hypium';
import { caseName, expect, it } from '../support/TestCase';
import { AppNavigation } from '../../../main/ets/navigation/AppNavigation';
import { BusinessStore, CollectionCategory, TodoFilter } from '../../../main/ets/business/BusinessStore';
import { PageKey } from '../../../main/ets/model/ShortcutScenes';
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
    it(caseName('ShortcutNavigationWaveOne', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNavigationWaveOne', '0001'), async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.nav.receiveWant(shortcutWant('todo.list', 'todayOpen'), true);
        h.nav.receiveWant(shortcutWant('collection.list', 'saved'), true);
        h.nav.activate(PageKey.HOME, (): void => {});
        await waveSettle();
        expect(h.routes.calls.join(','), caseName('ShortcutNavigationWaveOne', '0001'), 'ShortcutNavigationWaveOne.test.ets:A0001').assertEqual('push:scenes/pages/CollectionPage:');
        expect(h.store.snapshot().favoritesOnly, caseName('ShortcutNavigationWaveOne', '0001'), 'ShortcutNavigationWaveOne.test.ets:A0002').assertTrue();
        expect(h.store.snapshot().todoFilter, caseName('ShortcutNavigationWaveOne', '0001'),
          'ShortcutNavigationWaveOne.test.ets:A0003').assertEqual('todo_all');
        expect(h.io.writes, caseName('ShortcutNavigationWaveOne', '0001'), 'ShortcutNavigationWaveOne.test.ets:A0004').assertEqual(0);
        expect(h.reports.join(','), caseName('ShortcutNavigationWaveOne', '0001'), 'ShortcutNavigationWaveOne.test.ets:A0005').assertEqual('collection:冷启动:成功');
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
    it(caseName('ShortcutNavigationWaveOne', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNavigationWaveOne', '0002'), async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.nav.receiveWant(shortcutWant('todo.list', 'todayOpen'), false);
        h.nav.receiveWant(shortcutWant('collection.list', 'todayOpen'), false);
        h.nav.activate(PageKey.HOME, (): void => {});
        await waveSettle();
        expect(h.routes.calls.join(','), caseName('ShortcutNavigationWaveOne', '0002'), 'ShortcutNavigationWaveOne.test.ets:A0006').assertEqual('push:scenes/pages/TodoPage:');
        expect(h.store.snapshot().todoFilter, caseName('ShortcutNavigationWaveOne', '0002'),
          'ShortcutNavigationWaveOne.test.ets:A0007').assertEqual('todo_open');
        expect(h.reports.join(','), caseName('ShortcutNavigationWaveOne', '0002'), 'ShortcutNavigationWaveOne.test.ets:A0008').assertEqual('启动参数:invalid-parameters:失败,todo:热启动:成功');
        expect(h.store.snapshot().favoritesOnly, caseName('ShortcutNavigationWaveOne', '0002'), 'ShortcutNavigationWaveOne.test.ets:A0009').assertFalse();
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
    it(caseName('ShortcutNavigationWaveOne', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNavigationWaveOne', '0003'), async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        let revisits: number = 0;
        h.nav.activate(PageKey.HOME, (): void => { revisits++; });
        h.nav.deactivate(PageKey.NOTE);
        await h.nav.open(PageKey.HOME);
        expect(revisits, caseName('ShortcutNavigationWaveOne', '0003'), 'ShortcutNavigationWaveOne.test.ets:A0010').assertEqual(1);
        h.nav.deactivate(PageKey.HOME);
        h.nav.receiveWant(shortcutWant('collection.list', 'saved'), false);
        await waveSettle();
        expect(h.routes.calls.length, caseName('ShortcutNavigationWaveOne', '0003'), 'ShortcutNavigationWaveOne.test.ets:A0011').assertEqual(0);
        expect(h.store.snapshot().favoritesOnly, caseName('ShortcutNavigationWaveOne', '0003'), 'ShortcutNavigationWaveOne.test.ets:A0012').assertFalse();
        h.nav.activate(PageKey.HOME, (): void => {});
        await waveSettle();
        expect(h.routes.calls.join(','), caseName('ShortcutNavigationWaveOne', '0003'), 'ShortcutNavigationWaveOne.test.ets:A0013').assertEqual('push:scenes/pages/CollectionPage:');
        expect(h.store.snapshot().favoritesOnly, caseName('ShortcutNavigationWaveOne', '0003'), 'ShortcutNavigationWaveOne.test.ets:A0014').assertTrue();
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
    it(caseName('ShortcutNavigationWaveOne', '0004'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNavigationWaveOne', '0004'), async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.store.setDraftBody('未保存的会议结论');
        let revisits: number = 0;
        h.nav.activate(PageKey.NOTE, (): void => { revisits++; });
        h.nav.receiveWant(shortcutWant('note.new'), false);
        await waveSettle();
        expect(revisits, caseName('ShortcutNavigationWaveOne', '0004'), 'ShortcutNavigationWaveOne.test.ets:A0015').assertEqual(1);
        expect(h.store.snapshot().draftBody, caseName('ShortcutNavigationWaveOne', '0004'), 'ShortcutNavigationWaveOne.test.ets:A0016').assertEqual('未保存的会议结论');
        expect(h.store.hasUnsavedNoteWork(), caseName('ShortcutNavigationWaveOne', '0004'), 'ShortcutNavigationWaveOne.test.ets:A0017').assertTrue();
        expect(h.dialog.editing.length, caseName('ShortcutNavigationWaveOne', '0004'), 'ShortcutNavigationWaveOne.test.ets:A0018').assertEqual(0);
        expect(h.routes.calls.length, caseName('ShortcutNavigationWaveOne', '0004'), 'ShortcutNavigationWaveOne.test.ets:A0019').assertEqual(0);
        expect(h.io.writes, caseName('ShortcutNavigationWaveOne', '0004'), 'ShortcutNavigationWaveOne.test.ets:A0020').assertEqual(0);
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
    it(caseName('ShortcutNavigationWaveOne', '0005'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNavigationWaveOne', '0005'), async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        let revisits: number = 0;
        h.nav.activate(PageKey.DETAIL, (): void => { revisits++; });
        await h.nav.openDetail('sc.note.new');
        await h.nav.openDetail('sc.todo.today');
        expect(h.routes.calls.join(','), caseName('ShortcutNavigationWaveOne', '0005'), 'ShortcutNavigationWaveOne.test.ets:A0021').assertEqual(
          'replace:scenes/pages/ShortcutDetailPage:sc.note.new,replace:scenes/pages/ShortcutDetailPage:sc.todo.today');
        expect(revisits, caseName('ShortcutNavigationWaveOne', '0005'), 'ShortcutNavigationWaveOne.test.ets:A0022').assertEqual(0);
        expect(h.reports.join(','), caseName('ShortcutNavigationWaveOne', '0005'), 'ShortcutNavigationWaveOne.test.ets:A0023').assertEqual('detail:应用内:成功,detail:应用内:成功');
        expect(h.io.writes, caseName('ShortcutNavigationWaveOne', '0005'), 'ShortcutNavigationWaveOne.test.ets:A0024').assertEqual(0);
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
    it(caseName('ShortcutNavigationWaveOne', '0006'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNavigationWaveOne', '0006'), async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.routes.depth = 1;
        h.nav.activate(PageKey.TODO, (): void => {});
        await h.nav.back();
        h.nav.receiveWant(shortcutWant('collection.list', 'saved'), false);
        await waveSettle();
        expect(h.routes.calls.join(','), caseName('ShortcutNavigationWaveOne', '0006'), 'ShortcutNavigationWaveOne.test.ets:A0025').assertEqual('replace:pages/Index:');
        expect(h.store.snapshot().favoritesOnly, caseName('ShortcutNavigationWaveOne', '0006'), 'ShortcutNavigationWaveOne.test.ets:A0026').assertFalse();
        h.nav.activate(PageKey.HOME, (): void => {});
        await waveSettle();
        expect(h.routes.calls[1], caseName('ShortcutNavigationWaveOne', '0006'), 'ShortcutNavigationWaveOne.test.ets:A0027').assertEqual('push:scenes/pages/CollectionPage:');
        expect(h.reports.join(','), caseName('ShortcutNavigationWaveOne', '0006'), 'ShortcutNavigationWaveOne.test.ets:A0028').assertEqual('collection:热启动:成功');
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
    it(caseName('ShortcutNavigationWaveOne', '0007'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNavigationWaveOne', '0007'), async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.routes.gate = new Deferred<void>();
        h.nav.activate(PageKey.TODO, (): void => {});
        const returning: Promise<void> = h.nav.back();
        await waveSettle();
        h.nav.receiveWant(shortcutWant('note.new'), false);
        h.routes.gate.resolve(undefined);
        await returning;
        expect(h.routes.calls.join(','), caseName('ShortcutNavigationWaveOne', '0007'), 'ShortcutNavigationWaveOne.test.ets:A0029').assertEqual('back:false');
        expect(h.reports.length, caseName('ShortcutNavigationWaveOne', '0007'), 'ShortcutNavigationWaveOne.test.ets:A0030').assertEqual(0);
        h.nav.activate(PageKey.HOME, (): void => {});
        await waveSettle();
        expect(h.routes.calls[1], caseName('ShortcutNavigationWaveOne', '0007'), 'ShortcutNavigationWaveOne.test.ets:A0031').assertEqual('push:scenes/pages/NotePage:');
        expect(h.dialog.editing.length, caseName('ShortcutNavigationWaveOne', '0007'), 'ShortcutNavigationWaveOne.test.ets:A0032').assertEqual(0);
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
    it(caseName('ShortcutNavigationWaveOne', '0008'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNavigationWaveOne', '0008'), async (scope: CaseScope): Promise<void> => {
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
        expect(h.routes.calls.length, caseName('ShortcutNavigationWaveOne', '0008'), 'ShortcutNavigationWaveOne.test.ets:A0033').assertEqual(0);
        expect(h.store.snapshot().draftTitle, caseName('ShortcutNavigationWaveOne', '0008'), 'ShortcutNavigationWaveOne.test.ets:A0034').assertEqual('继续编辑');
        expect(h.store.hasUnsavedNoteWork(), caseName('ShortcutNavigationWaveOne', '0008'), 'ShortcutNavigationWaveOne.test.ets:A0035').assertTrue();
        expect(h.store.snapshot().favoritesOnly, caseName('ShortcutNavigationWaveOne', '0008'), 'ShortcutNavigationWaveOne.test.ets:A0036').assertFalse();
        expect(h.dialog.editing.join(','), caseName('ShortcutNavigationWaveOne', '0008'), 'ShortcutNavigationWaveOne.test.ets:A0037').assertEqual('false');
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
    it(caseName('ShortcutNavigationWaveOne', '0009'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNavigationWaveOne', '0009'), async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.nav.activate(PageKey.TODO, (): void => {});
        h.routes.fail = true;
        await h.nav.back();
        expect(h.reports.join(','), caseName('ShortcutNavigationWaveOne', '0009'), 'ShortcutNavigationWaveOne.test.ets:A0038').assertEqual('todo:router-failed:失败');
        expect(h.dialog.toasts.join(','), caseName('ShortcutNavigationWaveOne', '0009'), 'ShortcutNavigationWaveOne.test.ets:A0039').assertEqual('页面打开失败，请重试');
        h.routes.fail = false;
        await h.nav.back();
        expect(h.routes.calls.join(','), caseName('ShortcutNavigationWaveOne', '0009'), 'ShortcutNavigationWaveOne.test.ets:A0040').assertEqual('back:false,back:false');
        expect(h.io.writes, caseName('ShortcutNavigationWaveOne', '0009'), 'ShortcutNavigationWaveOne.test.ets:A0041').assertEqual(0);
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
    it(caseName('ShortcutNavigationWaveOne', '0010'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNavigationWaveOne', '0010'), async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.store.setDraftTitle('对话框失败前草稿');
        h.dialog.fail = true;
        h.nav.activate(PageKey.NOTE, (): void => {});
        await h.nav.open(PageKey.TODO);
        expect(h.routes.calls.length, caseName('ShortcutNavigationWaveOne', '0010'), 'ShortcutNavigationWaveOne.test.ets:A0042').assertEqual(0);
        expect(h.io.writes, caseName('ShortcutNavigationWaveOne', '0010'), 'ShortcutNavigationWaveOne.test.ets:A0043').assertEqual(0);
        expect(h.store.hasUnsavedNoteWork(), caseName('ShortcutNavigationWaveOne', '0010'), 'ShortcutNavigationWaveOne.test.ets:A0044').assertTrue();
        expect(h.reports.join(','), caseName('ShortcutNavigationWaveOne', '0010'), 'ShortcutNavigationWaveOne.test.ets:A0045').assertEqual('todo:应用内:取消');
        expect(h.dialog.toasts.length, caseName('ShortcutNavigationWaveOne', '0010'), 'ShortcutNavigationWaveOne.test.ets:A0046').assertEqual(0);
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
    it(caseName('ShortcutNavigationWaveOne', '0011'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNavigationWaveOne', '0011'), async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.store.selectTodoDate('2026-11-01');
        h.store.setTodoFilter(TodoFilter.DONE);
        h.store.setCollectionQuery('阅读');
        h.store.setCollectionCategory(CollectionCategory.READING);
        h.routes.fail = true;
        h.nav.activate(PageKey.COLLECTION, (): void => {});
        h.nav.receiveWant(shortcutWant('todo.list', 'todayOpen'), false);
        await waveSettle();
        expect(h.store.snapshot().todoDate, caseName('ShortcutNavigationWaveOne', '0011'), 'ShortcutNavigationWaveOne.test.ets:A0047').assertEqual('2026-11-01');
        expect(h.store.snapshot().todoFollowToday, caseName('ShortcutNavigationWaveOne', '0011'), 'ShortcutNavigationWaveOne.test.ets:A0048').assertFalse();
        expect(h.store.snapshot().todoFilter, caseName('ShortcutNavigationWaveOne', '0011'),
          'ShortcutNavigationWaveOne.test.ets:A0049').assertEqual('todo_done');
        expect(h.store.snapshot().collectionQuery, caseName('ShortcutNavigationWaveOne', '0011'), 'ShortcutNavigationWaveOne.test.ets:A0050').assertEqual('阅读');
        expect(h.store.snapshot().collectionCategory, caseName('ShortcutNavigationWaveOne', '0011'),
          'ShortcutNavigationWaveOne.test.ets:A0051').assertEqual('collection_reading');
        expect(h.reports.join(','), caseName('ShortcutNavigationWaveOne', '0011'), 'ShortcutNavigationWaveOne.test.ets:A0052').assertEqual('collection:router-failed:失败');
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
    it(caseName('ShortcutNavigationWaveOne', '0012'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNavigationWaveOne', '0012'), async (scope: CaseScope): Promise<void> => {
        const h: NavigationWaveHarness = await navigationWave(scope);
        h.store.selectTodoDate('2026-11-01');
        h.nav.activate(PageKey.TODO, (): void => {});
        h.nav.receiveWant(shortcutWant('todo.list', 'todayOpen'), false);
        await waveSettle();
        expect(h.store.snapshot().todoDate, caseName('ShortcutNavigationWaveOne', '0012'), 'ShortcutNavigationWaveOne.test.ets:A0053').assertEqual('2026-11-02');
        expect(h.store.snapshot().todoFollowToday, caseName('ShortcutNavigationWaveOne', '0012'), 'ShortcutNavigationWaveOne.test.ets:A0054').assertTrue();
        const oldId: string = h.store.snapshot().todos[0].id;
        h.clock.setDate(2026, 11, 3);
        expect(await h.store.setTodoDone(oldId, true), caseName('ShortcutNavigationWaveOne', '0012'), 'ShortcutNavigationWaveOne.test.ets:A0055').assertFalse();
        expect(h.store.snapshot().todoDate, caseName('ShortcutNavigationWaveOne', '0012'), 'ShortcutNavigationWaveOne.test.ets:A0056').assertEqual('2026-11-03');
        expect(h.store.snapshot().todos[0].done, caseName('ShortcutNavigationWaveOne', '0012'), 'ShortcutNavigationWaveOne.test.ets:A0057').assertFalse();
        expect(h.store.errorText(), caseName('ShortcutNavigationWaveOne', '0012'), 'ShortcutNavigationWaveOne.test.ets:A0058').assertEqual('日期已更新，请重新选择');
      });
    });
  });
}
