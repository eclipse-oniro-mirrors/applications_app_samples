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

import { describe, it, expect } from '@ohos/hypium';
import {
  BACK_ID, SCENES, SWITCH_ID, assertBounds, assertHome, assertScene, assertSwitch, assertVisibleItem, backToHome,
  clickCenter, clickComponentCenter, launchEntry, openHome, openScene, runSerializedUiOperation,
  toggleTo, waitId, waitText, visibleBounds, withScene
} from '../Shared/SharedDriver';

export default function renderGroupInteractionTest(): void {
  describe('RenderGroupInteraction', () => {
    for (const scene of SCENES) {
      it(`${scene.name}HomeLinkCanBeOpenedByCoordinateTouch`, 0, async () => {
        await runSerializedUiOperation(async () => {
          await launchEntry();
          await openHome();
          await clickCenter(scene.buttonId);
          await assertScene(scene);
          await assertSwitch(false);
          await assertVisibleItem(1);
          await backToHome();
        });
      });

      it(`${scene.name}ShowsEnabledSwitchAndBackTarget`, 0, async () => {
        await withScene(scene, async () => {
          const button = await waitId(SWITCH_ID);
          expect(await button.getType()).assertEqual('Button');
          expect(await button.isEnabled()).assertTrue();
          expect(await button.isClickable()).assertTrue();
          const back = await waitId(BACK_ID);
          expect(await back.isEnabled()).assertTrue();
          expect(await back.isClickable()).assertTrue();
          await assertBounds(SWITCH_ID);
          await assertBounds(BACK_ID);
          await assertSwitch(false);
        });
      });

      it(`${scene.name}SwitchCanBeEnabledByTouch`, 0, async () => {
        await withScene(scene, async () => {
          await assertSwitch(false);
          await clickCenter(SWITCH_ID);
          await assertSwitch(true);
          await assertScene(scene);
        });
      });

      it(`${scene.name}SwitchCanBeDisabledByComponentClick`, 0, async () => {
        await withScene(scene, async () => {
          await assertSwitch(false);
          await toggleTo(true);
          await toggleTo(false);
          await assertScene(scene);
        });
      });

      it(`${scene.name}SwitchCanBeDisabledByTouch`, 0, async () => {
        await withScene(scene, async () => {
          await toggleTo(true);
          await clickCenter(SWITCH_ID);
          await assertSwitch(false);
          await assertVisibleItem(1);
          await assertScene(scene);
        });
      });

      for (const enabled of [false, true]) {
        it(`${scene.name}GridTouchPreserves${enabled ? 'Enabled' : 'Disabled'}State`, 0, async () => {
          await withScene(scene, async () => {
            if (enabled) {
              await toggleTo(true);
            }
            const label = await waitId(SWITCH_ID);
            const switchBounds = await visibleBounds(label);
            await assertVisibleItem(1);
            const item = await waitText('item1');
            const bounds = await visibleBounds(item);
            expect(bounds.top >= switchBounds.bottom).assertTrue();
            await clickComponentCenter(item);
            await assertVisibleItem(1);
            await assertSwitch(enabled);
            await assertScene(scene);
          });
        });
      }

      it(`${scene.name}SwitchLabelChangePreservesTouchTarget`, 0, async () => {
        await withScene(scene, async () => {
          const before = await visibleBounds(await waitId(SWITCH_ID));
          await toggleTo(true);
          const after = await visibleBounds(await waitId(SWITCH_ID));
          expect(Math.abs(after.left - before.left) <= 1).assertTrue();
          expect(Math.abs(after.top - before.top) <= 1).assertTrue();
          expect(Math.abs(after.right - before.right) <= 1).assertTrue();
          expect(Math.abs(after.bottom - before.bottom) <= 1).assertTrue();
          await clickCenter(SWITCH_ID);
          await assertSwitch(false);
        });
      });

      it(`${scene.name}TouchBackLeavesEnabledScene`, 0, async () => {
        await withScene(scene, async () => {
          await toggleTo(true);
          await clickCenter(BACK_ID);
          await assertHome();
          await openScene(scene);
          await assertSwitch(false);
        });
      });

      it(`${scene.name}SystemBackLeavesDisabledScene`, 0, async () => {
        await withScene(scene, async () => {
          await assertSwitch(false);
          await backToHome(true);
        });
      });
    }
  });
}
