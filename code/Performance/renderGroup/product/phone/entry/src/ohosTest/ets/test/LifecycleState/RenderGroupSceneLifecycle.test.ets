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
import {
  PROFIT, NON_PROFIT, SCENES, assertHome, assertIndex, assertScene, assertSwitch, assertVisibleItem, backToHome, backToIndex,
  backgroundAndRestoreEntry, launchEntry, openHome, openScene, runSerializedUiOperation, toggleTo, withScene
} from '../Shared/SharedDriver';

export default function renderGroupSceneLifecycleTest(): void {
  describe('RenderGroupSceneLifecycle', () => {
    it('profitStateDoesNotLeakIntoNonProfit', 0, async () => {
      await withScene(PROFIT, async () => {
        await toggleTo(true);
        await backToHome();
        await openScene(NON_PROFIT);
        await assertSwitch(false);
        await assertVisibleItem(1);
        await toggleTo(true);
        await backToHome();
        await openScene(PROFIT);
        await assertSwitch(false);
      });
    });

    it('nonProfitStateDoesNotLeakIntoProfit', 0, async () => {
      await withScene(NON_PROFIT, async () => {
        await toggleTo(true);
        await backToHome();
        await openScene(PROFIT);
        await assertSwitch(false);
        await assertVisibleItem(1);
        await toggleTo(true);
        await backToHome();
        await openScene(NON_PROFIT);
        await assertSwitch(false);
      });
    });

    for (const scene of SCENES) {
      it(`${scene.name}SystemBackResetsEnabledStateOnReentry`, 0, async () => {
        await withScene(scene, async () => {
          await toggleTo(true);
          await backToHome(true);
          await openScene(scene);
          await assertSwitch(false);
          await assertVisibleItem(1);
        });
      });

      it(`${scene.name}NewRouteAfterReturningToIndexStartsDisabled`, 0, async () => {
        await withScene(scene, async () => {
          await toggleTo(true);
          await backToHome();
          await backToIndex();
          await openHome();
          await openScene(scene);
          await assertSwitch(false);
        });
      });

      it(`${scene.name}ForegroundRestoresActiveSceneAndFlag`, 0, async () => {
        await withScene(scene, async () => {
          await toggleTo(true);
          await backgroundAndRestoreEntry();
          await assertScene(scene);
          await assertSwitch(true);
          await assertVisibleItem(1);
          await toggleTo(false);
        });
      });

      it(`${scene.name}ForegroundPreservesDisabledScene`, 0, async () => {
        await withScene(scene, async () => {
          await assertSwitch(false);
          await backgroundAndRestoreEntry();
          await assertScene(scene);
          await assertSwitch(false);
          await assertVisibleItem(1);
          await toggleTo(true);
        });
      });
    }

    it('homeRouteSurvivesBackgroundRoundTrip', 0, async () => {
      await runSerializedUiOperation(async () => {
        await launchEntry();
        await openHome();
        await backgroundAndRestoreEntry();
        await assertHome();
        await openScene(NON_PROFIT);
        await assertSwitch(false);
        await backToHome();
        await backToIndex();
      });
    });

    it('indexRouteSurvivesBackgroundRoundTrip', 0, async () => {
      await runSerializedUiOperation(async () => {
        await launchEntry();
        await backgroundAndRestoreEntry();
        await assertIndex();
        await openHome();
        await assertHome();
        await backToIndex();
      });
    });

    it('bothScenesCanBeRevisitedThroughACompleteHomeRoundTrip', 0, async () => {
      await runSerializedUiOperation(async () => {
        await launchEntry();
        for (const scene of SCENES) {
          await openHome();
          await openScene(scene);
          await assertSwitch(false);
          await toggleTo(true);
          await backToHome();
          await backToIndex();
        }
      });
    });
  });
}
