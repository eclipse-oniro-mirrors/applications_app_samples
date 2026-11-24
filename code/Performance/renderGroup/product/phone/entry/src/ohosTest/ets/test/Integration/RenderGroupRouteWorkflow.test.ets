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

import { describe, expect, it } from '@ohos/hypium';
import {
  BACK_ID, INDEX_ID, NON_PROFIT, PROFIT, SCENES, SWITCH_ID, Scene, assertEntryForeground, assertHome,
  assertScene, assertSwitch, assertVisibleItem, backToHome, backToIndex, backgroundAndRestoreEntry,
  clickCenter, countText, openHome, openScene, toggleTo, withScene
} from '../Shared/SharedDriver';

class BackMethod {
  public name: string;
  public system: boolean;

  constructor(name: string, system: boolean) {
    this.name = name;
    this.system = system;
  }
}

const RETURN_METHODS: BackMethod[] = [new BackMethod('Toolbar', false), new BackMethod('System', true)];

function opposite(scene: Scene): Scene {
  return scene === PROFIT ? NON_PROFIT : PROFIT;
}

async function assertActiveScene(scene: Scene, enabled: boolean): Promise<void> {
  await assertEntryForeground();
  await assertScene(scene);
  await assertSwitch(enabled);
  await assertVisibleItem(1);
  await assertVisibleItem(6);
}

async function assertGridGone(): Promise<void> {
  const firstCount = await countText('item1');
  const lastCount = await countText('item6');
  expect(firstCount).assertEqual(0);
  expect(lastCount).assertEqual(0);
}

// Keep the two route pops explicit. Recovery helpers here could hide a duplicate push.
async function changeSceneThroughIndex(initial: Scene, sceneBack: BackMethod, homeBack: BackMethod): Promise<void> {
  await withScene(initial, async () => {
    await assertActiveScene(initial, false);
    await toggleTo(true);
    await assertActiveScene(initial, true);

    await backToHome(sceneBack.system);
    await assertGridGone();
    await backToIndex(homeBack.system);
    await assertGridGone();

    await openHome();
    const next = opposite(initial);
    await openScene(next);
    await assertActiveScene(next, false);
    await backToHome(homeBack.system);
    await openScene(initial);
    await assertActiveScene(initial, false);
  });
}

export default function renderGroupRouteWorkflowTest(): void {
  describe('RenderGroupRouteWorkflow', () => {
    for (const initial of SCENES) {
      for (const sceneBack of RETURN_METHODS) {
        for (const homeBack of RETURN_METHODS) {
          it(`${initial.name}ReturnsVia${sceneBack.name}Then${homeBack.name}AndReopensBothRoutes`, 0, async () => {
            await changeSceneThroughIndex(initial, sceneBack, homeBack);
          });
        }
      }

      it(`${initial.name}BackgroundedAfterCoordinateToggleCanStillReturnByTouch`, 0, async () => {
        await withScene(initial, async () => {
          await assertActiveScene(initial, false);
          await clickCenter(SWITCH_ID);
          await assertActiveScene(initial, true);
          await backgroundAndRestoreEntry();
          await assertActiveScene(initial, true);

          await clickCenter(BACK_ID);
          await assertHome();
          await assertGridGone();
          await clickCenter(initial.buttonId);
          await assertActiveScene(initial, false);
        });
      });

      it(`${initial.name}RestoresHomeAfterVisitingOtherSceneAndReopensOriginalRoute`, 0, async () => {
        await withScene(initial, async () => {
          await assertActiveScene(initial, false);
          const next = opposite(initial);
          await backToHome();
          await clickCenter(next.buttonId);
          await assertActiveScene(next, false);

          await toggleTo(true);
          await toggleTo(false);
          await backToHome(true);
          await backgroundAndRestoreEntry();
          await assertEntryForeground();
          await assertHome();
          await assertGridGone();
          await backToIndex();

          await clickCenter(INDEX_ID);
          await assertHome();
          await clickCenter(initial.buttonId);
          await assertActiveScene(initial, false);
        });
      });
    }
  });
}
