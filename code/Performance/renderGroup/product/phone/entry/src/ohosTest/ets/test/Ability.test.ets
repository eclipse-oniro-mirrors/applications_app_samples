/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { performanceTypeArray } from '../../../main/ets/model/MockData';
import {
  BACK_ID, INDEX_ID, PROFIT, NON_PROFIT, SCENES, assertEntryForeground, assertIndex, assertHome, assertScene, assertSwitch,
  backToHome, backToIndex, launchEntry, openHome, openScene, runSerializedUiOperation, startEntryAbility,
  clickCenter, toggleTo, visibleBounds, waitId, withScene
} from './Shared/SharedDriver';

export default function abilityTest(): void {
  describe('RenderGroupAbility', () => {
    it('menuModelExposesRenderGroupRoute', 0, () => {
      expect(performanceTypeArray.length).assertEqual(1);
      expect(performanceTypeArray[0].name).assertEqual('RenderGroup');
      expect(performanceTypeArray[0].uri).assertEqual('pages/renderGroup/RenderGroupHomePage');
    });

    it('entryAbilityStartsInForeground', 0, async () => {
      await runSerializedUiOperation(async () => {
        await launchEntry();
        await assertEntryForeground();
        await assertIndex();
      });
    });

    it('indexRendersMenuModelLabel', 0, async () => {
      await runSerializedUiOperation(async () => {
        await launchEntry();
        const entry = await waitId(INDEX_ID);
        expect(await entry.getText()).assertEqual(performanceTypeArray[0].name);
        expect(await entry.isEnabled()).assertTrue();
      });
    });

    it('warmLaunchPreservesHomeRoute', 0, async () => {
      await runSerializedUiOperation(async () => {
        await launchEntry();
        await openHome();
        await startEntryAbility();
        await assertHome();
        await backToIndex();
      });
    });

    for (const scene of SCENES) {
      for (const enabled of [false, true]) {
        it(`${scene.name}WarmLaunchPreserves${enabled ? 'Enabled' : 'Disabled'}Scene`, 0, async () => {
          await withScene(scene, async () => {
            await assertSwitch(false);
            if (enabled) {
              await toggleTo(true);
            }
            await startEntryAbility();
            await assertScene(scene);
            await assertSwitch(enabled);
            await backToHome();
            await backToIndex();
          });
        });
      }
    }

    it('homeCanReturnToIndexWithToolbarBack', 0, async () => {
      await runSerializedUiOperation(async () => {
        await launchEntry();
        await openHome();
        await backToIndex();
      });
    });

    it('indexMenuCanOpenHomeByCoordinateTouch', 0, async () => {
      await runSerializedUiOperation(async () => {
        await launchEntry();
        await clickCenter(INDEX_ID);
        await assertHome();
        await backToIndex();
      });
    });

    it('homeToolbarCanReturnToIndexByCoordinateTouch', 0, async () => {
      await runSerializedUiOperation(async () => {
        await launchEntry();
        await openHome();
        await clickCenter(BACK_ID);
        await assertIndex();
      });
    });

    it('homeCanReturnToIndexWithSystemBack', 0, async () => {
      await runSerializedUiOperation(async () => {
        await launchEntry();
        await openHome();
        await backToIndex(true);
      });
    });

    it('bothSceneLinksRemainUsableAfterReturning', 0, async () => {
      await runSerializedUiOperation(async () => {
        await launchEntry();
        await openHome();
        await openScene(PROFIT);
        await backToHome();
        await openScene(NON_PROFIT);
        await backToHome();
        await assertHome();
        await backToIndex();
      });
    });

    it('homeSceneLinksExposeDistinctLabelsAndTouchTargets', 0, async () => {
      await runSerializedUiOperation(async () => {
        await launchEntry();
        await openHome();
        const profit = await waitId(PROFIT.buttonId);
        const nonProfit = await waitId(NON_PROFIT.buttonId);
        expect(await profit.getText()).assertEqual(PROFIT.title);
        expect(await nonProfit.getText()).assertEqual(NON_PROFIT.title);
        expect(await profit.isEnabled()).assertTrue();
        expect(await nonProfit.isEnabled()).assertTrue();
        expect(await profit.isClickable()).assertTrue();
        expect(await nonProfit.isClickable()).assertTrue();
        const first = await visibleBounds(profit);
        const second = await visibleBounds(nonProfit);
        expect(second.top >= first.bottom).assertTrue();
      });
    });

    it('sceneHomeCanBeOpenedAgainAfterSystemBack', 0, async () => {
      await runSerializedUiOperation(async () => {
        await launchEntry();
        await openHome();
        await backToIndex(true);
        await openHome();
        await openScene(NON_PROFIT);
        await assertSwitch(false);
        await backToHome(true);
        await backToIndex(true);
      });
    });
  });
}
