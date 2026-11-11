import { Want } from '@kit.AbilityKit';
import { describe, expect, it } from '@ohos/hypium';
import { AppNavigation, NavigationDialog, NavigationRouter } from '../../../main/ets/navigation/AppNavigation';
import { parseLaunchRequest } from '../../../main/ets/navigation/LaunchRequest';
import { PageKey } from '../../../main/ets/model/ShortcutModels';
import { BusinessStore } from '../../../main/ets/business/BusinessStore';
import { CaseScope, getTestContext, runCase } from '../support/CaseScope';
import { FixedBusinessClock, MemoryBusinessStorage, startBusiness } from '../support/BusinessFixture';
import { ControlledBusinessStorage, createBusiness, waitBusiness } from '../support/CoverageFixture';
import { Deferred } from '../support/ShortcutFixture';

class TestRouter implements NavigationRouter {
  public calls: string[] = [];
  public fail: boolean = false;
  public gate: Deferred<void> | undefined = undefined;
  async push(url: string, id: string): Promise<void> { await this.run(`push:${url}:${id}`); }
  async replace(url: string, id: string): Promise<void> { await this.run(`replace:${url}:${id}`); }
  async back(home: boolean): Promise<void> { await this.run(`back:${home}`); }
  length(): number { return 2; }
  private async run(value: string): Promise<void> {
    this.calls.push(value);
    if (this.gate !== undefined) { await this.gate.promise; }
    if (this.fail) { throw new Error('router secret must not be reported'); }
  }
}
class TestDialog implements NavigationDialog {
  public answer: number = 2;
  public calls: number = 0;
  public toasts: number = 0;
  public gate: Deferred<number> | undefined = undefined;
  async choose(_editing: boolean): Promise<number> {
    this.calls++;
    return this.gate === undefined ? this.answer : this.gate.promise;
  }
  toast(_message: string): void { this.toasts++; }
}
function want(action: string, filter: string = ''): Want {
  return { parameters: { 'sc.version': '1', 'sc.action': action, 'sc.filter': filter } };
}
// Drain only controlled promise continuations; no native router or wall-clock sleeps are used.
async function settle(): Promise<void> { for (let n = 0; n < 16; n++) { await Promise.resolve(); } }
function navigation(scope: CaseScope, store: BusinessStore, routes: TestRouter,
  dialogs: TestDialog = new TestDialog()): AppNavigation {
  const nav: AppNavigation = new AppNavigation(store, routes, dialogs, () => {});
  scope.cleanup(() => nav.dispose());
  nav.initialize();
  return nav;
}

export default function appNavigationTests(): void {
  describe('ProductionAppNavigation', () => {
    /**
     * @tc.number    SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0100
     * @tc.name      testProductionAppNavigation0001
     * @tc.desc      Verify cold want waits for store and applies today open
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testProductionAppNavigation0001', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        io.readGate = new Deferred<string>();
        const store: BusinessStore = createBusiness(scope, io, new FixedBusinessClock().now);
        const routes: TestRouter = new TestRouter();
        const nav = navigation(scope, store, routes);
        expect(parseLaunchRequest(want('todo.list', 'todayOpen'), true).filter).assertEqual('todayOpen');
        nav.receiveWant(want('todo.list', 'todayOpen'), true);
        nav.activate(PageKey.HOME, () => {});
        store.initialize(getTestContext());
        expect(routes.calls.length).assertEqual(0);
        io.readGate.resolve('');
        await waitBusiness(scope, store);
        await settle();
        expect(routes.calls.length).assertEqual(1);
        expect(store.snapshot().todoFilter).assertEqual('未完成');
        expect(store.snapshot().todoDate).assertEqual('2026-11-02');
        expect(io.writes).assertEqual(0);
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0200
     * @tc.name      testProductionAppNavigation0002
     * @tc.desc      Verify duplicate pending and same page want uses production store
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testProductionAppNavigation0002', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const store = await startBusiness(scope, new MemoryBusinessStorage(), new FixedBusinessClock());
        const routes: TestRouter = new TestRouter();
        routes.gate = new Deferred<void>();
        const nav = navigation(scope, store, routes);
        nav.activate(PageKey.HOME, () => {});
        nav.receiveWant(want('todo.list', 'todayOpen'), false);
        nav.receiveWant(want('todo.list', 'todayOpen'), false);
        nav.receiveWant(want('collection.list', 'saved'), false);
        await settle();
        expect(routes.calls.length).assertEqual(1);
        routes.gate.resolve(undefined);
        await settle();
        expect(routes.calls.length).assertEqual(1);
        nav.activate(PageKey.TODO, () => {});
        await settle();
        expect(routes.calls.length).assertEqual(2);
        expect(store.snapshot().favoritesOnly).assertTrue();
        let revisits: number = 0;
        nav.activate(PageKey.COLLECTION, () => { revisits++; });
        store.setFavoritesOnly(false);
        store.setCollectionQuery('不存在');
        nav.receiveWant(want('collection.list', 'saved'), false);
        await settle();
        expect(routes.calls.length).assertEqual(2);
        expect(revisits).assertEqual(1);
        expect(store.snapshot().favoritesOnly).assertTrue();
        expect(store.snapshot().collectionQuery).assertEqual('');
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0300
     * @tc.name      testProductionAppNavigation0003
     * @tc.desc      Verify leave cancel and save failure never navigate or apply context
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testProductionAppNavigation0003', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const storage: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, storage, new FixedBusinessClock());
        store.setDraftTitle('原稿');
        expect(await store.saveNote()).assertTrue();
        store.beginEditNote(store.snapshot().notes[0].id);
        store.setDraftTitle('修改中');
        const routes: TestRouter = new TestRouter();
        const dialogs: TestDialog = new TestDialog();
        const nav = navigation(scope, store, routes, dialogs);
        nav.activate(PageKey.NOTE, () => {});
        nav.receiveWant(want('collection.list', 'saved'), false);
        await settle();
        expect(dialogs.calls).assertEqual(1);
        expect(routes.calls.length).assertEqual(0);
        expect(store.snapshot().favoritesOnly).assertFalse();
        dialogs.answer = 0;
        storage.failNextWrite = true;
        nav.receiveWant(want('collection.list', 'saved'), false);
        await settle();
        expect(routes.calls.length).assertEqual(0);
        expect(store.snapshot().draftTitle).assertEqual('修改中');
        expect(store.hasUnsavedNoteWork()).assertTrue();
        expect(dialogs.toasts).assertEqual(1);
        nav.receiveWant(want('collection.list', 'saved'), false);
        await settle();
        expect(routes.calls.length).assertEqual(1);
        expect(store.snapshot().notes[0].title).assertEqual('修改中');
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0400
     * @tc.name      testProductionAppNavigation0004
     * @tc.desc      Verify route failure rolls back filter and successful leave save remains saved
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testProductionAppNavigation0004', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const store = await startBusiness(scope, new MemoryBusinessStorage(), new FixedBusinessClock());
        store.setDraftTitle('原稿');
        expect(await store.saveNote()).assertTrue();
        store.beginEditNote(store.snapshot().notes[0].id);
        store.setDraftTitle('已保存修改');
        const routes: TestRouter = new TestRouter();
        routes.fail = true;
        const dialogs: TestDialog = new TestDialog();
        dialogs.answer = 0;
        const nav: AppNavigation = new AppNavigation(store, routes, dialogs, () => { throw new Error('observer'); });
        scope.cleanup(() => nav.dispose());
        nav.initialize();
        nav.activate(PageKey.NOTE, () => {});
        nav.receiveWant(want('collection.list', 'saved'), false);
        await settle();
        expect(store.snapshot().favoritesOnly).assertFalse();
        expect(store.snapshot().notes[0].title).assertEqual('已保存修改');
        expect(store.hasUnsavedNoteWork()).assertFalse();
        routes.fail = false;
        nav.receiveWant(want('collection.list', 'saved'), false);
        await settle();
        expect(routes.calls.length).assertEqual(2);
        expect(store.snapshot().favoritesOnly).assertTrue();
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0500
     * @tc.name      testProductionAppNavigation0005
     * @tc.desc      Verify late dialog and canceled pending do not run after dispose
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testProductionAppNavigation0005', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const store = await startBusiness(scope, new MemoryBusinessStorage(), new FixedBusinessClock());
        store.setDraftTitle('未保存');
        const routes: TestRouter = new TestRouter();
        const dialogs: TestDialog = new TestDialog();
        dialogs.gate = new Deferred<number>();
        const nav = navigation(scope, store, routes, dialogs);
        nav.activate(PageKey.NOTE, () => {});
        nav.receiveWant(want('todo.list', 'todayOpen'), false);
        nav.receiveWant(want('todo.list', 'todayOpen'), false);
        nav.receiveWant(want('collection.list', 'saved'), false);
        dialogs.gate.resolve(2);
        await settle();
        expect(dialogs.calls).assertEqual(1);
        expect(routes.calls.length).assertEqual(0);
        dialogs.gate = new Deferred<number>();
        nav.receiveWant(want('todo.list', 'todayOpen'), false);
        nav.dispose();
        dialogs.gate.resolve(0);
        await settle();
        expect(routes.calls.length).assertEqual(0);
        expect(store.hasUnsavedNoteWork()).assertTrue();
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0600
     * @tc.name      testProductionAppNavigation0006
     * @tc.desc      Verify pending detail retains id when cold or busy
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testProductionAppNavigation0006', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        const store: BusinessStore = createBusiness(scope, io, new FixedBusinessClock().now);
        const routes: TestRouter = new TestRouter();
        const nav = navigation(scope, store, routes);
        nav.activate(PageKey.HOME, () => {});
        await nav.openDetail('sc.note.new');
        expect(routes.calls.length).assertEqual(0);
        store.initialize(getTestContext());
        await waitBusiness(scope, store);
        await settle();
        expect(routes.calls[0]).assertEqual('push:pages/ShortcutDetailPage:sc.note.new');
        nav.activate(PageKey.HOME, () => {});
        io.writeGate = new Deferred<void>();
        store.setDraftTitle('写入中');
        const saving: Promise<boolean> = store.keepDraft();
        await nav.openDetail('sc.todo.today');
        expect(routes.calls.length).assertEqual(1);
        io.writeGate.resolve(undefined);
        expect(await saving).assertTrue();
        await settle();
        expect(routes.calls[1]).assertEqual('push:pages/ShortcutDetailPage:sc.todo.today');
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0700
     * @tc.name      testProductionAppNavigation0007
     * @tc.desc      Verify old dialog cannot clear reinitialized session pending
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testProductionAppNavigation0007', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        const store: BusinessStore = createBusiness(scope, io, new FixedBusinessClock().now);
        store.initialize(getTestContext());
        await waitBusiness(scope, store);
        store.setDraftTitle('草稿');
        const routes: TestRouter = new TestRouter();
        const dialogs: TestDialog = new TestDialog();
        const old: Deferred<number> = new Deferred<number>();
        dialogs.gate = old;
        let reports: number = 0;
        const nav: AppNavigation = new AppNavigation(store, routes, dialogs, () => { reports++; });
        scope.cleanup(() => nav.dispose());
        nav.initialize();
        nav.activate(PageKey.NOTE, () => {});
        nav.receiveWant(want('todo.list', 'todayOpen'), false);
        nav.dispose();
        nav.initialize();
        nav.activate(PageKey.NOTE, () => {});
        io.writeGate = new Deferred<void>();
        const saving: Promise<boolean> = store.keepDraft();
        nav.receiveWant(want('collection.list', 'saved'), false);
        old.resolve(2);
        await settle();
        expect(reports).assertEqual(0);
        expect(dialogs.toasts).assertEqual(0);
        io.writeGate.resolve(undefined);
        expect(await saving).assertTrue();
        await settle();
        expect(routes.calls.length).assertEqual(1);
        expect(store.snapshot().favoritesOnly).assertTrue();
        expect(reports).assertEqual(1);
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0800
     * @tc.name      testProductionAppNavigation0008
     * @tc.desc      A home activation before back resolves keeps its handler and permits the next real route.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProductionAppNavigation0008', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const io: MemoryBusinessStorage = new MemoryBusinessStorage();
        const store = await startBusiness(scope, io, new FixedBusinessClock());
        const routes: TestRouter = new TestRouter();
        const backGate: Deferred<void> = new Deferred<void>();
        routes.gate = backGate;
        const nav = navigation(scope, store, routes);
        nav.activate(PageKey.DETAIL, () => {});
        const returning: Promise<void> = nav.back();
        await settle();
        expect(routes.calls[0]).assertEqual('back:false');
        let homeRevisits: number = 0;
        nav.activate(PageKey.HOME, (): void => { homeRevisits++; });
        backGate.resolve(undefined);
        await returning;
        await nav.open(PageKey.HOME);
        await nav.open(PageKey.ACTIVITY);
        expect(homeRevisits).assertEqual(1);
        expect(routes.calls.length).assertEqual(2);
        expect(routes.calls[1]).assertEqual('push:pages/ActivityPage:');
        expect(io.writeCount).assertEqual(0);
      });
    });
  });
}
