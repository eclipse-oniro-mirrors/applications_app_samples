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

import { describe, it } from '@ohos/hypium';
import { ON } from '@ohos.UiTest';
import { backTo, click, expectPresence, openFeature, requireComponent, withHome } from './Shared/PerformanceDriver';

async function visitDestination(button: string, title: string, back: string): Promise<void> {
  await expectPresence(ON.id('goods0'), false, 'product content absent before navigation');
  await click(ON.id(button));
  await requireComponent(ON.text(title));
  await requireComponent(ON.id('goods0'));
  await backTo(ON.id(back));
  await expectPresence(ON.id('goods0'), false, 'product content removed after back');
}

export default function importNavigationTest(): void {
  describe('PerformanceImportNavigation', () => {
    /**
     * @tc.number SUB_PERFORMANCE_IMPORTNAVIGATION_0100
     * @tc.name staticNavigationResolvesBothRegisteredDestinations
     * @tc.desc Static Navigation Resolves Both Registered Destinations.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('staticNavigationResolvesBothRegisteredDestinations', 0, async () => {
      await withHome(async () => {
        await openFeature('StaticImport');
        await click(ON.id('conventionExample'));
        await requireComponent(ON.id('staticLoadBack'));
        await visitDestination('staticPageOne', 'pageOne', 'staticLoadBack');
        await visitDestination('staticPageTwo', 'pageTwo', 'staticLoadBack');
        await click(ON.id('staticLoadBack'));
        await requireComponent(ON.id('conventionExample'));
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_IMPORTNAVIGATION_0200
     * @tc.name dynamicNavigationCanReopenTheLoadedDestination
     * @tc.desc Dynamic Navigation Can Reopen The Loaded Destination.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('dynamicNavigationCanReopenTheLoadedDestination', 0, async () => {
      await withHome(async () => {
        await openFeature('DynamicImport');
        await click(ON.id('dynamicLoadEntry'));
        await requireComponent(ON.id('dynamicLoadBack'));
        await visitDestination('dynamicPageOne', 'pageOne', 'dynamicLoadBack');
        await visitDestination('dynamicPageOne', 'pageOne', 'dynamicLoadBack');
        await click(ON.id('dynamicLoadBack'));
        await requireComponent(ON.id('dynamicLoadEntry'));
      });
    });
  });
}
