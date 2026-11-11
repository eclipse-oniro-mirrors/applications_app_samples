import { shortcutManager } from '@kit.AbilityKit';
import { describe, expect, it } from '@ohos/hypium';
import { CallRecord, ShortcutItem, ShortcutView } from '../../../main/ets/model/ShortcutModels';
import { CaseScope, getTestContext, runCase } from '../support/CaseScope';
import { FixtureError, SetRequest, ShortcutFixture, shortcutInfo } from '../support/ShortcutFixture';

function hasRecord(view: ShortcutView, api: string, status: string, text: string = ''): boolean {
  return view.records.some((record: CallRecord) => record.api === api && record.status === status &&
    record.message.includes(text));
}

export default function shortcutServiceTests(): void {
  describe('ShortcutService', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTSERVICE_0100
     * @tc.name      testShortcutService0001
     * @tc.desc      Verify support result error and gate
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testShortcutService0001', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        for (const mode of [0, 1, 2]) {
          const fixture: ShortcutFixture = new ShortcutFixture(scope);
          fixture.api.supported = mode === 0;
          if (mode === 2) { fixture.api.supportError = new FixtureError(801, 'probe failed'); }
          fixture.initialize();
          if (mode === 0) { (await fixture.query(0)).resolve([]); }
          await fixture.idle();
          const view: ShortcutView = fixture.service.snapshot();
          expect(fixture.api.supportCalls).assertEqual(1);
          expect(view.supported).assertEqual(mode === 0);
          expect(view.support).assertEqual(mode === 0 ? '支持' : mode === 1 ? '不支持' : '检测失败');
          expect(view.queryError).assertEqual('');
          expect(view.busy).assertFalse();
          if (mode === 2) {
            expect(view.supportError).assertContain('code=801');
            expect(hasRecord(view, 'isShortcutSupported', '失败', 'probe failed')).assertTrue();
          } else {
            expect(view.supportError).assertEqual('');
            expect(hasRecord(view, 'isShortcutSupported', '成功', `${mode === 0}`)).assertTrue();
          }
          if (mode !== 0) {
            await fixture.service.refresh();
            await fixture.service.setVisible('blocked', false);
            await fixture.service.restoreAll();
            expect(fixture.api.queries.length).assertEqual(0);
            expect(fixture.api.settings.length).assertEqual(0);
          } else {
            expect(fixture.api.queries.length).assertEqual(1);
          }
        }
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTSERVICE_0200
     * @tc.name      testShortcutService0002
     * @tc.desc      Verify complete mapping defaults resources and snapshot isolation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testShortcutService0002', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const fixture: ShortcutFixture = new ShortcutFixture(scope);
        const id: string = `sc.${'x'.repeat(60)}`;
        const full: shortcutManager.ShortcutInfo = shortcutInfo(id, false);
        full.label = '标题'.repeat(100);
        const labelId: number = $r('app.string.shortcut_note_new').id;
        const resource: shortcutManager.ShortcutInfo = shortcutInfo('resource', true);
        resource.moduleName = 'entry_test';
        resource.labelId = labelId;
        const numeric: shortcutManager.ShortcutInfo = shortcutInfo('numeric', true);
        numeric.moduleName = 'entry_test';
        numeric.labelId = undefined;
        numeric.label = `$string:${labelId}`;
        await fixture.load([full, shortcutInfo('default'), resource, numeric]);
        const first: ShortcutView = fixture.service.snapshot();
        const second: ShortcutView = fixture.service.snapshot();
        expect(first !== second).assertTrue();
        expect(first.items.length).assertEqual(4);
        expect(first.items[0] !== second.items[0]).assertTrue();
        expect(first.items[0].raw !== second.items[0].raw).assertTrue();
        expect(first.records[0] !== second.records[0]).assertTrue();
        const raw: shortcutManager.ShortcutInfo = first.items[0].raw;
        expect(raw.id).assertEqual(id);
        expect(raw.bundleName).assertEqual(full.bundleName);
        expect(raw.moduleName).assertEqual('entry');
        expect(raw.hostAbility).assertEqual('EntryAbility');
        expect(raw.icon).assertEqual('$media:shortcut_note');
        expect(raw.iconId).assertEqual(0);
        expect(raw.label).assertEqual(full.label);
        expect(raw.labelId).assertEqual(0);
        expect(raw.appIndex).assertEqual(0);
        expect(raw.sourceType).assertEqual(2);
        expect(raw.visible).assertFalse();
        expect(first.items[0].title).assertEqual(full.label);
        expect(first.items[1].visible).assertTrue();
        expect(first.items[1].visibleExplicit).assertFalse();
        expect(first.items[1].raw.visible).assertUndefined();
        const title: string = getTestContext().createModuleContext('entry_test').resourceManager.getStringSync(labelId);
        expect(first.items[2].title).assertEqual(title);
        expect(first.items[3].title).assertEqual(title);
        const wants: shortcutManager.ShortcutWant[] = raw.wants ?? [];
        expect(wants.length).assertEqual(1);
        expect(wants[0].targetBundle).assertEqual(full.bundleName);
        expect(wants[0].targetModule).assertEqual('entry');
        expect(wants[0].targetAbility).assertEqual('EntryAbility');
        const parameters: shortcutManager.ParameterItem[] = wants[0].parameters ?? [];
        expect(parameters.length).assertEqual(2);
        expect(parameters[0].key).assertEqual('page');
        expect(parameters[0].value).assertEqual('note');
        expect(parameters[1].value).assertEqual('p'.repeat(180));
        first.items[0].title = 'changed';
        raw.id = 'changed';
        wants[0].targetAbility = 'changed';
        parameters[0].value = 'changed';
        first.records[0].status = 'changed';
        first.items.splice(1, 1);
        const sourceWants: shortcutManager.ShortcutWant[] = full.wants ?? [];
        const sourceParameters: shortcutManager.ParameterItem[] = sourceWants[0].parameters ?? [];
        sourceParameters[1].value = 'source changed';
        const fresh: ShortcutView = fixture.service.snapshot();
        const freshWants: shortcutManager.ShortcutWant[] = fresh.items[0].raw.wants ?? [];
        const freshParameters: shortcutManager.ParameterItem[] = freshWants[0].parameters ?? [];
        expect(fresh.items.length).assertEqual(4);
        expect(fresh.items[0].id).assertEqual(id);
        expect(fresh.items[0].raw.id).assertEqual(id);
        expect(fresh.items[0].title).assertEqual(full.label);
        expect(freshWants[0].targetAbility).assertEqual('EntryAbility');
        expect(freshParameters[0].value).assertEqual('note');
        expect(freshParameters[1].value).assertEqual('p'.repeat(180));
        expect(fresh.records[0].status).assertEqual('成功');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTSERVICE_0300
     * @tc.name      testShortcutService0003
     * @tc.desc      Verify query failure preserves items and raw code
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testShortcutService0003', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const fixture: ShortcutFixture = new ShortcutFixture(scope);
        await fixture.load([shortcutInfo('kept', false)]);
        const lastQuery: string = fixture.service.snapshot().lastQuery;
        const refresh: Promise<void> = fixture.service.refresh();
        (await fixture.query(1)).reject(new FixtureError(123456, 'query failed'));
        await refresh;
        const view: ShortcutView = fixture.service.snapshot();
        expect(view.items.length).assertEqual(1);
        expect(view.items[0].id).assertEqual('kept');
        expect(view.items[0].visible).assertFalse();
        expect(view.lastQuery).assertEqual(lastQuery);
        expect(view.queryError).assertContain('code=123456');
        expect(view.supported).assertTrue();
        expect(view.supportError).assertEqual('');
        expect(view.busy).assertFalse();
        expect(view.querying).assertFalse();
        expect(hasRecord(view, 'getAllShortcutInfoForSelf', '失败', 'query failed')).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTSERVICE_0400
     * @tc.name      testShortcutService0004
     * @tc.desc      Verify hide show parameters and single readback
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testShortcutService0004', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const fixture: ShortcutFixture = new ShortcutFixture(scope);
        await fixture.load([shortcutInfo('toggle', true)]);
        const values: boolean[] = [false, true];
        for (let index = 0; index < values.length; index++) {
          const visible: boolean = values[index];
          const operation: Promise<void> = fixture.service.setVisible('toggle', visible);
          const request: SetRequest = await fixture.setting(index);
          expect(request.id).assertEqual('toggle');
          expect(request.visible).assertEqual(visible);
          expect(fixture.api.queries.length).assertEqual(index + 1);
          expect(fixture.service.snapshot().settingId).assertEqual('toggle');
          expect(fixture.service.snapshot().busy).assertTrue();
          request.pending.resolve(undefined);
          (await fixture.query(index + 1)).resolve([shortcutInfo('toggle', visible)]);
          await operation;
          const view: ShortcutView = fixture.service.snapshot();
          expect(fixture.api.settings.length).assertEqual(index + 1);
          expect(fixture.api.queries.length).assertEqual(index + 2);
          expect(view.items[0].visible).assertEqual(visible);
          expect(view.items[0].status).assertEqual('回读一致');
          expect(view.batchMessage).assertEqual('回读一致');
          expect(view.busy).assertFalse();
          expect(view.settingId).assertEqual('');
          expect(hasRecord(view, '可见性核对', '回读一致', `visible=${visible}`)).assertTrue();
        }
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTSERVICE_0500
     * @tc.name      testShortcutService0005
     * @tc.desc      Verify set error mismatch and pending readback
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testShortcutService0005', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        for (const mode of [0, 1, 2, 3, 4]) {
          const fixture: ShortcutFixture = new ShortcutFixture(scope);
          await fixture.load([shortcutInfo('target', true)]);
          const operation: Promise<void> = fixture.service.setVisible('target', false);
          const request: SetRequest = await fixture.setting(0);
          if (mode === 0) {
            request.pending.reject(new FixtureError(17700070, 'id missing'));
          } else {
            request.pending.resolve(undefined);
            const readback = await fixture.query(1);
            if (mode === 2) {
              readback.reject(new FixtureError(350001, 'readback failed'));
            } else if (mode === 3) {
              readback.resolve([shortcutInfo('target')]);
            } else {
              readback.resolve(mode === 4 ? [] : [shortcutInfo('target', true)]);
            }
          }
          await operation;
          const view: ShortcutView = fixture.service.snapshot();
          expect(fixture.api.settings.length).assertEqual(1);
          expect(fixture.api.queries.length).assertEqual(mode === 0 ? 1 : 2);
          expect(view.busy).assertFalse();
          expect(view.supported).assertTrue();
          expect(view.supportError).assertEqual('');
          if (mode === 0) {
            expect(view.items[0].error).assertContain('code=17700070');
            expect(view.items[0].visible).assertTrue();
            expect(view.batchMessage).assertEqual('设置失败');
            expect(hasRecord(view, 'setShortcutVisibleForSelf', '失败', '17700070')).assertTrue();
          } else if (mode === 1) {
            expect(view.items[0].visible).assertTrue();
            expect(view.items[0].error).assertContain('期望 visible=false');
            expect(view.batchMessage).assertEqual('回读不一致');
            expect(hasRecord(view, '可见性核对', '回读不一致')).assertTrue();
          } else {
            expect(view.batchMessage).assertEqual('已提交，待核对');
            expect(hasRecord(view, '可见性核对', '待核对')).assertTrue();
            if (mode === 2) {
              expect(view.queryError).assertContain('code=350001');
              expect(view.items[0].id).assertEqual('target');
              expect(view.items[0].error).assertContain('code=350001');
            } else if (mode === 3) {
              expect(view.items[0].visibleExplicit).assertFalse();
              expect(view.items[0].status).assertEqual('待核对');
            } else {
              expect(view.items.length).assertEqual(0);
              expect(hasRecord(view, '可见性核对', '待核对', '未返回该快捷方式')).assertTrue();
            }
          }
        }
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTSERVICE_0600
     * @tc.name      testShortcutService0006
     * @tc.desc      Verify restore skips visible orders writes and stops on failure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testShortcutService0006', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const shown: ShortcutFixture = new ShortcutFixture(scope);
        await shown.load([shortcutInfo('shown', true), shortcutInfo('default')]);
        await shown.service.restoreAll();
        expect(shown.api.settings.length).assertEqual(0);
        expect(shown.api.queries.length).assertEqual(1);
        expect(shown.service.snapshot().batchMessage).assertEqual('全部入口已显示');
        for (const stop of [false, true]) {
          const fixture: ShortcutFixture = new ShortcutFixture(scope);
          const infos: shortcutManager.ShortcutInfo[] = [shortcutInfo('shown', true),
            shortcutInfo('first', false), shortcutInfo('second', false), shortcutInfo('third', false)];
          await fixture.load(infos);
          const operation: Promise<void> = fixture.service.restoreAll();
          for (let index = 0; index < 3; index++) {
            const request: SetRequest = await fixture.setting(index);
            expect(request.id).assertEqual(infos[index + 1].id);
            expect(request.visible).assertTrue();
            if (stop && index === 1) {
              request.pending.reject(new FixtureError(17700070, 'stop here'));
              break;
            }
            request.pending.resolve(undefined);
            const readback = await fixture.query(index + 1);
            expect(fixture.api.settings.length).assertEqual(index + 1);
            infos[index + 1].visible = true;
            readback.resolve(infos);
          }
          await operation;
          expect(fixture.api.settings.map((request: SetRequest) => request.id).join(','))
            .assertEqual(stop ? 'first,second' : 'first,second,third');
          expect(fixture.api.queries.length).assertEqual(stop ? 2 : 4);
          const view: ShortcutView = fixture.service.snapshot();
          expect(view.busy).assertFalse();
          if (stop) {
            expect(view.batchMessage).assertContain('已恢复 1/3');
            expect(view.batchMessage).assertContain('已停止');
            expect(hasRecord(view, 'setShortcutVisibleForSelf', '失败', '17700070')).assertTrue();
          } else {
            expect(view.batchMessage).assertEqual('已恢复 3 项');
            expect(view.items.every((item: ShortcutItem) => item.visible)).assertTrue();
          }
        }
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTSERVICE_0700
     * @tc.name      testShortcutService0007
     * @tc.desc      Verify busy gate dispose late results and subscriptions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testShortcutService0007', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const fixture: ShortcutFixture = new ShortcutFixture(scope);
        fixture.initialize();
        fixture.service.checkSupport();
        await fixture.service.refresh();
        await fixture.service.setVisible('blocked', false);
        await fixture.service.restoreAll();
        expect(fixture.api.supportCalls).assertEqual(1);
        expect(fixture.api.queries.length).assertEqual(1);
        expect(fixture.api.settings.length).assertEqual(0);
        (await fixture.query(0)).resolve([shortcutInfo('target', true)]);
        await fixture.idle();
        let notifications: number = 0;
        fixture.service.subscribe((): void => { notifications++; });
        const operation: Promise<void> = fixture.service.setVisible('target', false);
        const pending: SetRequest = await fixture.setting(0);
        await fixture.service.setVisible('other', true);
        await fixture.service.restoreAll();
        await fixture.service.refresh();
        fixture.service.checkSupport();
        expect(fixture.api.settings.length).assertEqual(1);
        expect(fixture.api.queries.length).assertEqual(1);
        expect(fixture.api.supportCalls).assertEqual(1);
        fixture.service.dispose();
        const beforeLate: number = notifications;
        pending.pending.resolve(undefined);
        await operation;
        expect(notifications).assertEqual(beforeLate);
        expect(fixture.api.queries.length).assertEqual(1);
        expect(fixture.service.snapshot().items.length).assertEqual(0);
        expect(fixture.service.snapshot().records.length).assertEqual(0);
        fixture.initialize();
        (await fixture.query(1)).resolve([shortcutInfo('new', true)]);
        await fixture.idle();
        expect(notifications).assertEqual(beforeLate);
        let currentNotifications: number = 0;
        const subscription: number = fixture.service.subscribe((): void => { currentNotifications++; });
        fixture.service.recordNavigation('note', 'opened');
        expect(currentNotifications).assertEqual(1);
        fixture.service.unsubscribe(subscription);
        for (let index = 0; index < 65; index++) { fixture.service.recordNavigation('note', `${index}`); }
        expect(currentNotifications).assertEqual(1);
        expect(fixture.service.snapshot().records.length).assertEqual(60);
        expect(fixture.service.snapshot().records[0].message).assertEqual('64');
        fixture.service.clearRecords();
        expect(fixture.service.snapshot().records.length).assertEqual(0);
        const lateQuery: ShortcutFixture = new ShortcutFixture(scope);
        lateQuery.initialize();
        const old = await lateQuery.query(0);
        lateQuery.service.dispose();
        lateQuery.initialize();
        expect(lateQuery.api.queries.length).assertEqual(1);
        old.resolve([shortcutInfo('stale', false)]);
        const fresh = await lateQuery.query(1);
        expect(lateQuery.service.snapshot().items.length).assertEqual(0);
        fresh.resolve([shortcutInfo('fresh', true)]);
        await lateQuery.idle();
        expect(lateQuery.service.snapshot().items[0].id).assertEqual('fresh');
        expect(lateQuery.api.supportCalls).assertEqual(2);
      });
    });
  });
}
