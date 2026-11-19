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
import { beforeAll, describe, expect, it } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';

/** Application context contract. 15 registered cases, no page is launched. */
let appContext: common.Context | null = null;

export default function contextContractTest(): void {
  describe('ContextContractTest', (): void => {
    beforeAll((): void => {
      appContext = abilityDelegatorRegistry
        .getAbilityDelegator()
        .getAppContext();
    });

    for (let index: number = 0; index < 15; index++) {
      const caseIndex: number = index;
      it(
        'contextContractTest' + String(caseIndex),
        0,
        async (): Promise<void> => {
          expect(appContext !== null).assertTrue();
          if (appContext === null) {
            return;
          }
          if (caseIndex === 0) {
            expect(appContext !== null).assertTrue();
          } else if (caseIndex === 1) {
            expect(appContext.filesDir.length > 0).assertTrue();
          } else if (caseIndex === 2) {
            expect(appContext.cacheDir.length > 0).assertTrue();
          } else if (caseIndex === 3) {
            expect(appContext.databaseDir.length > 0).assertTrue();
          } else if (caseIndex === 4) {
            expect(appContext.preferencesDir.length > 0).assertTrue();
          } else if (caseIndex === 5) {
            expect(appContext.bundleCodeDir.length > 0).assertTrue();
          } else if (caseIndex === 6) {
            expect(appContext.applicationInfo.name).assertEqual(
              'com.samples.CustomanimationtabSample',
            );
          } else if (caseIndex === 7) {
            expect(appContext.applicationInfo.label.length > 0).assertTrue();
          } else if (caseIndex === 8) {
            expect(appContext.applicationInfo.systemApp).assertFalse();
          } else if (caseIndex === 9) {
            expect(appContext.applicationInfo.enabled).assertTrue();
          } else if (caseIndex === 10) {
            expect(appContext.resourceManager !== undefined).assertTrue();
          } else if (caseIndex === 11) {
            expect(appContext.applicationInfo.icon.length > 0).assertTrue();
          } else if (caseIndex === 12) {
            expect(appContext.applicationInfo.uid >= 0).assertTrue();
          } else if (caseIndex === 13) {
            const manager: resourceManager.ResourceManager =
              appContext.resourceManager;
            const color: number = manager.getColorSync(
              $r('app.color.start_window_background'),
            );
            expect(color !== 0).assertTrue();
          } else {
            const manager: resourceManager.ResourceManager =
              appContext.resourceManager;
            const label: string = manager.getStringSync(
              $r('app.string.EntryAbility_label'),
            );
            expect(label).assertEqual('CustomanimationtabSample');
          }
        },
      );
    }
  });
}


