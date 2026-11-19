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

import { shortcutManager } from '@kit.AbilityKit';
import { describe } from '@ohos/hypium';
import { caseName, expect, it } from '../support/TestCase';
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

    it(caseName('ShortcutService', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutService', '0001'), async (scope: CaseScope): Promise<void> => {
        for (const mode of [0, 1, 2]) {
          const fixture: ShortcutFixture = new ShortcutFixture(scope);
          fixture.api.supported = mode === 0;
          if (mode === 2) { fixture.api.supportError = new FixtureError(801, 'probe failed'); }
          fixture.initialize();
          if (mode === 0) { (await fixture.query(0)).resolve([]); }
          await fixture.idle();
          const view: ShortcutView = fixture.service.snapshot();
          expect(fixture.api.supportCalls, caseName('ShortcutService', '0001'), 'ShortcutService.test.ets:A0001').assertEqual(1);
          expect(view.supported, caseName('ShortcutService', '0001'), 'ShortcutService.test.ets:A0002').assertEqual(mode === 0);
          expect(view.support, caseName('ShortcutService', '0001'), 'ShortcutService.test.ets:A0003').assertEqual(mode === 0 ? '支持' : mode === 1 ? '不支持' : '检测失败');
          expect(view.queryError, caseName('ShortcutService', '0001'), 'ShortcutService.test.ets:A0004').assertEqual('');
          expect(view.busy, caseName('ShortcutService', '0001'), 'ShortcutService.test.ets:A0005').assertFalse();
          if (mode === 2) {
            expect(view.supportError, caseName('ShortcutService', '0001'), 'ShortcutService.test.ets:A0006').assertContain('code=801');
            expect(hasRecord(view, 'isShortcutSupported', '失败', 'probe failed'), caseName('ShortcutService', '0001'), 'ShortcutService.test.ets:A0007').assertTrue();
          } else {
            expect(view.supportError, caseName('ShortcutService', '0001'), 'ShortcutService.test.ets:A0008').assertEqual('');
            expect(hasRecord(view, 'isShortcutSupported', '成功', `${mode === 0}`), caseName('ShortcutService', '0001'), 'ShortcutService.test.ets:A0009').assertTrue();
          }
          if (mode !== 0) {
            await fixture.service.refresh();
            await fixture.service.setVisible('blocked', false);
            await fixture.service.restoreAll();
            expect(fixture.api.queries.length, caseName('ShortcutService', '0001'), 'ShortcutService.test.ets:A0010').assertEqual(0);
            expect(fixture.api.settings.length, caseName('ShortcutService', '0001'), 'ShortcutService.test.ets:A0011').assertEqual(0);
          } else {
            expect(fixture.api.queries.length, caseName('ShortcutService', '0001'), 'ShortcutService.test.ets:A0012').assertEqual(1);
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

    it(caseName('ShortcutService', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutService', '0002'), async (scope: CaseScope): Promise<void> => {
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
        expect(first !== second, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0013').assertTrue();
        expect(first.items.length, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0014').assertEqual(4);
        expect(first.items[0] !== second.items[0], caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0015').assertTrue();
        expect(first.items[0].raw !== second.items[0].raw, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0016').assertTrue();
        expect(first.records[0] !== second.records[0], caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0017').assertTrue();
        const raw: shortcutManager.ShortcutInfo = first.items[0].raw;
        expect(raw.id, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0018').assertEqual(id);
        expect(raw.bundleName, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0019').assertEqual(full.bundleName);
        expect(raw.moduleName, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0020').assertEqual('entry');
        expect(raw.hostAbility, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0021').assertEqual('EntryAbility');
        expect(raw.icon, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0022').assertEqual('$media:shortcut_note');
        expect(raw.iconId, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0023').assertEqual(0);
        expect(raw.label, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0024').assertEqual(full.label);
        expect(raw.labelId, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0025').assertEqual(0);
        expect(raw.appIndex, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0026').assertEqual(0);
        expect(raw.sourceType, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0027').assertEqual(2);
        expect(raw.visible, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0028').assertFalse();
        expect(first.items[0].title, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0029').assertEqual(full.label);
        expect(first.items[1].visible, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0030').assertTrue();
        expect(first.items[1].visibleExplicit, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0031').assertFalse();
        expect(first.items[1].raw.visible, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0032').assertUndefined();
        const title: string = getTestContext().createModuleContext('entry_test').resourceManager.getStringSync(labelId);
        expect(first.items[2].title, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0033').assertEqual(title);
        expect(first.items[3].title, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0034').assertEqual(title);
        const wants: shortcutManager.ShortcutWant[] = raw.wants ?? [];
        expect(wants.length, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0035').assertEqual(1);
        expect(wants[0].targetBundle, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0036').assertEqual(full.bundleName);
        expect(wants[0].targetModule, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0037').assertEqual('entry');
        expect(wants[0].targetAbility, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0038').assertEqual('EntryAbility');
        const parameters: shortcutManager.ParameterItem[] = wants[0].parameters ?? [];
        expect(parameters.length, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0039').assertEqual(2);
        expect(parameters[0].key, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0040').assertEqual('page');
        expect(parameters[0].value, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0041').assertEqual('note');
        expect(parameters[1].value, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0042').assertEqual('p'.repeat(180));
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
        expect(fresh.items.length, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0043').assertEqual(4);
        expect(fresh.items[0].id, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0044').assertEqual(id);
        expect(fresh.items[0].raw.id, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0045').assertEqual(id);
        expect(fresh.items[0].title, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0046').assertEqual(full.label);
        expect(freshWants[0].targetAbility, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0047').assertEqual('EntryAbility');
        expect(freshParameters[0].value, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0048').assertEqual('note');
        expect(freshParameters[1].value, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0049').assertEqual('p'.repeat(180));
        expect(fresh.records[0].status, caseName('ShortcutService', '0002'), 'ShortcutService.test.ets:A0050').assertEqual('成功');
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

    it(caseName('ShortcutService', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutService', '0003'), async (scope: CaseScope): Promise<void> => {
        const fixture: ShortcutFixture = new ShortcutFixture(scope);
        await fixture.load([shortcutInfo('kept', false)]);
        const lastQuery: string = fixture.service.snapshot().lastQuery;
        const refresh: Promise<void> = fixture.service.refresh();
        (await fixture.query(1)).reject(new FixtureError(123456, 'query failed'));
        await refresh;
        const view: ShortcutView = fixture.service.snapshot();
        expect(view.items.length, caseName('ShortcutService', '0003'), 'ShortcutService.test.ets:A0051').assertEqual(1);
        expect(view.items[0].id, caseName('ShortcutService', '0003'), 'ShortcutService.test.ets:A0052').assertEqual('kept');
        expect(view.items[0].visible, caseName('ShortcutService', '0003'), 'ShortcutService.test.ets:A0053').assertFalse();
        expect(view.lastQuery, caseName('ShortcutService', '0003'), 'ShortcutService.test.ets:A0054').assertEqual(lastQuery);
        expect(view.queryError, caseName('ShortcutService', '0003'), 'ShortcutService.test.ets:A0055').assertContain('code=123456');
        expect(view.supported, caseName('ShortcutService', '0003'), 'ShortcutService.test.ets:A0056').assertTrue();
        expect(view.supportError, caseName('ShortcutService', '0003'), 'ShortcutService.test.ets:A0057').assertEqual('');
        expect(view.busy, caseName('ShortcutService', '0003'), 'ShortcutService.test.ets:A0058').assertFalse();
        expect(view.querying, caseName('ShortcutService', '0003'), 'ShortcutService.test.ets:A0059').assertFalse();
        expect(hasRecord(view, 'getAllShortcutInfoForSelf', '失败', 'query failed'), caseName('ShortcutService', '0003'), 'ShortcutService.test.ets:A0060').assertTrue();
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

    it(caseName('ShortcutService', '0004'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutService', '0004'), async (scope: CaseScope): Promise<void> => {
        const fixture: ShortcutFixture = new ShortcutFixture(scope);
        await fixture.load([shortcutInfo('toggle', true)]);
        const values: boolean[] = [false, true];
        for (let index = 0; index < values.length; index++) {
          const visible: boolean = values[index];
          const operation: Promise<void> = fixture.service.setVisible('toggle', visible);
          const request: SetRequest = await fixture.setting(index);
          expect(request.id, caseName('ShortcutService', '0004'), 'ShortcutService.test.ets:A0061').assertEqual('toggle');
          expect(request.visible, caseName('ShortcutService', '0004'), 'ShortcutService.test.ets:A0062').assertEqual(visible);
          expect(fixture.api.queries.length, caseName('ShortcutService', '0004'), 'ShortcutService.test.ets:A0063').assertEqual(index + 1);
          expect(fixture.service.snapshot().settingId, caseName('ShortcutService', '0004'), 'ShortcutService.test.ets:A0064').assertEqual('toggle');
          expect(fixture.service.snapshot().busy, caseName('ShortcutService', '0004'), 'ShortcutService.test.ets:A0065').assertTrue();
          request.pending.resolve(undefined);
          (await fixture.query(index + 1)).resolve([shortcutInfo('toggle', visible)]);
          await operation;
          const view: ShortcutView = fixture.service.snapshot();
          expect(fixture.api.settings.length, caseName('ShortcutService', '0004'), 'ShortcutService.test.ets:A0066').assertEqual(index + 1);
          expect(fixture.api.queries.length, caseName('ShortcutService', '0004'), 'ShortcutService.test.ets:A0067').assertEqual(index + 2);
          expect(view.items[0].visible, caseName('ShortcutService', '0004'), 'ShortcutService.test.ets:A0068').assertEqual(visible);
          expect(view.items[0].status, caseName('ShortcutService', '0004'), 'ShortcutService.test.ets:A0069').assertEqual('回读一致');
          expect(view.batchMessage, caseName('ShortcutService', '0004'), 'ShortcutService.test.ets:A0070').assertEqual('回读一致');
          expect(view.busy, caseName('ShortcutService', '0004'), 'ShortcutService.test.ets:A0071').assertFalse();
          expect(view.settingId, caseName('ShortcutService', '0004'), 'ShortcutService.test.ets:A0072').assertEqual('');
          expect(hasRecord(view, '可见性核对', '回读一致', `visible=${visible}`), caseName('ShortcutService', '0004'), 'ShortcutService.test.ets:A0073').assertTrue();
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

    it(caseName('ShortcutService', '0005'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutService', '0005'), async (scope: CaseScope): Promise<void> => {
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
          expect(fixture.api.settings.length, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0074').assertEqual(1);
          expect(fixture.api.queries.length, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0075').assertEqual(mode === 0 ? 1 : 2);
          expect(view.busy, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0076').assertFalse();
          expect(view.supported, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0077').assertTrue();
          expect(view.supportError, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0078').assertEqual('');
          if (mode === 0) {
            expect(view.items[0].error, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0079').assertContain('code=17700070');
            expect(view.items[0].visible, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0080').assertTrue();
            expect(view.batchMessage, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0081').assertEqual('设置失败');
            expect(hasRecord(view, 'setShortcutVisibleForSelf', '失败', '17700070'), caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0082').assertTrue();
          } else if (mode === 1) {
            expect(view.items[0].visible, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0083').assertTrue();
            expect(view.items[0].error, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0084').assertContain('期望 visible=false');
            expect(view.batchMessage, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0085').assertEqual('回读不一致');
            expect(hasRecord(view, '可见性核对', '回读不一致'), caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0086').assertTrue();
          } else {
            expect(view.batchMessage, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0087').assertEqual('已提交，待核对');
            expect(hasRecord(view, '可见性核对', '待核对'), caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0088').assertTrue();
            if (mode === 2) {
              expect(view.queryError, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0089').assertContain('code=350001');
              expect(view.items[0].id, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0090').assertEqual('target');
              expect(view.items[0].error, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0091').assertContain('code=350001');
            } else if (mode === 3) {
              expect(view.items[0].visibleExplicit, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0092').assertFalse();
              expect(view.items[0].status, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0093').assertEqual('待核对');
            } else {
              expect(view.items.length, caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0094').assertEqual(0);
              expect(hasRecord(view, '可见性核对', '待核对', '未返回该快捷方式'), caseName('ShortcutService', '0005'), 'ShortcutService.test.ets:A0095').assertTrue();
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

    it(caseName('ShortcutService', '0006'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutService', '0006'), async (scope: CaseScope): Promise<void> => {
        const shown: ShortcutFixture = new ShortcutFixture(scope);
        await shown.load([shortcutInfo('shown', true), shortcutInfo('default')]);
        await shown.service.restoreAll();
        expect(shown.api.settings.length, caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0096').assertEqual(0);
        expect(shown.api.queries.length, caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0097').assertEqual(1);
        expect(shown.service.snapshot().batchMessage, caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0098').assertEqual('全部入口已显示');
        for (const stop of [false, true]) {
          const fixture: ShortcutFixture = new ShortcutFixture(scope);
          const infos: shortcutManager.ShortcutInfo[] = [shortcutInfo('shown', true),
            shortcutInfo('first', false), shortcutInfo('second', false), shortcutInfo('third', false)];
          await fixture.load(infos);
          const operation: Promise<void> = fixture.service.restoreAll();
          for (let index = 0; index < 3; index++) {
            const request: SetRequest = await fixture.setting(index);
            expect(request.id, caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0099').assertEqual(infos[index + 1].id);
            expect(request.visible, caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0100').assertTrue();
            if (stop && index === 1) {
              request.pending.reject(new FixtureError(17700070, 'stop here'));
              break;
            }
            request.pending.resolve(undefined);
            const readback = await fixture.query(index + 1);
            expect(fixture.api.settings.length, caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0101').assertEqual(index + 1);
            infos[index + 1].visible = true;
            readback.resolve(infos);
          }
          await operation;
          expect(fixture.api.settings.map((request: SetRequest) => request.id).join(','), caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0102')
            .assertEqual(stop ? 'first,second' : 'first,second,third');
          expect(fixture.api.queries.length, caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0103').assertEqual(stop ? 2 : 4);
          const view: ShortcutView = fixture.service.snapshot();
          expect(view.busy, caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0104').assertFalse();
          if (stop) {
            expect(view.batchMessage, caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0105').assertContain('已恢复 1/3');
            expect(view.batchMessage, caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0106').assertContain('已停止');
            expect(hasRecord(view, 'setShortcutVisibleForSelf', '失败', '17700070'), caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0107').assertTrue();
          } else {
            expect(view.batchMessage, caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0108').assertEqual('已恢复 3 项');
            expect(view.items.every((item: ShortcutItem) => item.visible), caseName('ShortcutService', '0006'), 'ShortcutService.test.ets:A0109').assertTrue();
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

    it(caseName('ShortcutService', '0007'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutService', '0007'), async (scope: CaseScope): Promise<void> => {
        const fixture: ShortcutFixture = new ShortcutFixture(scope);
        fixture.initialize();
        fixture.service.checkSupport();
        await fixture.service.refresh();
        await fixture.service.setVisible('blocked', false);
        await fixture.service.restoreAll();
        expect(fixture.api.supportCalls, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0110').assertEqual(1);
        expect(fixture.api.queries.length, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0111').assertEqual(1);
        expect(fixture.api.settings.length, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0112').assertEqual(0);
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
        expect(fixture.api.settings.length, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0113').assertEqual(1);
        expect(fixture.api.queries.length, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0114').assertEqual(1);
        expect(fixture.api.supportCalls, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0115').assertEqual(1);
        fixture.service.dispose();
        const beforeLate: number = notifications;
        pending.pending.resolve(undefined);
        await operation;
        expect(notifications, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0116').assertEqual(beforeLate);
        expect(fixture.api.queries.length, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0117').assertEqual(1);
        expect(fixture.service.snapshot().items.length, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0118').assertEqual(0);
        expect(fixture.service.snapshot().records.length, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0119').assertEqual(0);
        fixture.initialize();
        (await fixture.query(1)).resolve([shortcutInfo('new', true)]);
        await fixture.idle();
        expect(notifications, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0120').assertEqual(beforeLate);
        let currentNotifications: number = 0;
        const subscription: number = fixture.service.subscribe((): void => { currentNotifications++; });
        fixture.service.recordNavigation('note', 'opened');
        expect(currentNotifications, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0121').assertEqual(1);
        fixture.service.unsubscribe(subscription);
        for (let index = 0; index < 65; index++) { fixture.service.recordNavigation('note', `${index}`); }
        expect(currentNotifications, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0122').assertEqual(1);
        expect(fixture.service.snapshot().records.length, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0123').assertEqual(60);
        expect(fixture.service.snapshot().records[0].message, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0124').assertEqual('64');
        fixture.service.clearRecords();
        expect(fixture.service.snapshot().records.length, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0125').assertEqual(0);
        const lateQuery: ShortcutFixture = new ShortcutFixture(scope);
        lateQuery.initialize();
        const old = await lateQuery.query(0);
        lateQuery.service.dispose();
        lateQuery.initialize();
        expect(lateQuery.api.queries.length, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0126').assertEqual(1);
        old.resolve([shortcutInfo('stale', false)]);
        const fresh = await lateQuery.query(1);
        expect(lateQuery.service.snapshot().items.length, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0127').assertEqual(0);
        fresh.resolve([shortcutInfo('fresh', true)]);
        await lateQuery.idle();
        expect(lateQuery.service.snapshot().items[0].id, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0128').assertEqual('fresh');
        expect(lateQuery.api.supportCalls, caseName('ShortcutService', '0007'), 'ShortcutService.test.ets:A0129').assertEqual(2);
      });
    });
  });
}
