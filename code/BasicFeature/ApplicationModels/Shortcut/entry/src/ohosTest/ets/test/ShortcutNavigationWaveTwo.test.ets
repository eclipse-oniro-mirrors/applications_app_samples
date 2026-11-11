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
import { describe, expect, it } from '@ohos/hypium';
import { AppNavigation } from '../../../main/ets/navigation/AppNavigation';
import { BusinessStore } from '../../../main/ets/business/BusinessStore';
import { PageKey } from '../../../main/ets/model/ShortcutModels';
import { CaseScope, runCase } from '../support/CaseScope';
import { FixedBusinessClock } from '../support/BusinessFixture';
import { ControlledBusinessStorage, loadBusiness } from '../support/CoverageFixture';
import { WaveDialog, WaveRouter, waveSettle } from '../support/ShortcutWaveFixture';

export default function shortcutNavigationWaveTwoTests(): void {
  describe('ShortcutNavigationWaveTwo', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_NAVIGATIONWAVETWO_0100
     * @tc.name testShortcutNavigationWaveTwo0001
     * @tc.desc 明确返回首页走指定首页回退并等首页激活后再交付待办请求
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortcutNavigationWaveTwo0001', 0, async (): Promise<void> => {
      await runCase(async (scope: CaseScope): Promise<void> => {
        const io: ControlledBusinessStorage = new ControlledBusinessStorage();
        const store: BusinessStore = await loadBusiness(scope, io, new FixedBusinessClock().now);
        const routes: WaveRouter = new WaveRouter();
        const reports: string[] = [];
        const nav: AppNavigation = new AppNavigation(store, routes, new WaveDialog(),
          (target: string, source: string, status: string): void => { reports.push(`${target}:${source}:${status}`); });
        scope.cleanup((): void => { nav.dispose(); });
        nav.initialize();
        nav.activate(PageKey.COLLECTION, (): void => {});
        await nav.open(PageKey.HOME);
        const want: Want = { parameters: { 'sc.version': '1', 'sc.action': 'todo.list', 'sc.filter': 'todayOpen' } };
        nav.receiveWant(want, false);
        await waveSettle();
        expect(routes.calls.join(',')).assertEqual('back:true');
        expect(reports.join(',')).assertEqual('home:应用内:成功');
        expect(store.snapshot().todoFilter).assertEqual('全部');
        nav.activate(PageKey.HOME, (): void => {});
        await waveSettle();
        expect(routes.calls[1]).assertEqual('push:pages/TodoPage:');
        expect(store.snapshot().todoFilter).assertEqual('未完成');
        expect(io.writes).assertEqual(0);
      });
    });
  });
}
