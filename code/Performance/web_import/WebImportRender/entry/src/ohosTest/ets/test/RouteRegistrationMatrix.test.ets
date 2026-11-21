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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { logCase } from './shared/TestLog';
import { paceTurn } from './shared/TestPace';

export default function routeRegistrationMatrix(): void {
  describe('RouteRegistrationMatrix', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_WEB_IMPORT_RENDER_ROUTEREGISTRATIONMATRIX_0001
     * @tc.name testRouteRegistrationMatrix0001
     * @tc.desc Installed main entry registers pageOne with the second page builder
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testRouteRegistrationMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
          bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ROUTER_MAP;
        const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
        const entry: bundleManager.HapModuleInfo | undefined = info.hapModulesInfo.find(
          (module: bundleManager.HapModuleInfo): boolean => module.name === 'entry');
        if (entry === undefined) {
          throw new Error('Install main entry HAP before running route tests');
        }
        const names: string[] = entry.routerMap.map((item: bundleManager.RouterItem): string => item.name);
        const builders: string[] = entry.routerMap.map(
          (item: bundleManager.RouterItem): string => item.buildFunction);
        logCase('testRouteRegistrationMatrix0001', 'registered route names=' + JSON.stringify(names));
        expect(JSON.stringify(names)).assertEqual('["pageOne"]');
        logCase('testRouteRegistrationMatrix0001', 'registered route builders=' + JSON.stringify(builders));
        expect(JSON.stringify(builders)).assertEqual('["PageTwoBuilder"]');
        logCase('testRouteRegistrationMatrix0001', 'main ability=' + JSON.stringify(entry.mainElementName));
        expect(entry.mainElementName).assertEqual('EntryAbility');
        logCase('testRouteRegistrationMatrix0001', 'installed bundle=' + JSON.stringify(info.name));
        expect(info.name).assertEqual('com.example.myrender');
      });

  });
}
