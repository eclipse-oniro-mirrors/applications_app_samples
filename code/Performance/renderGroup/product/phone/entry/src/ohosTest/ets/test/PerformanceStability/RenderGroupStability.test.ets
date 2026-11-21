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
  PROFIT, NON_PROFIT, SCENES, SWITCH_ID, assertSwitch, assertVisibleItem, backToHome, backToIndex, countId,
  launchEntry, openHome, openScene, runSerializedUiOperation, toggleTo, withScene
} from '../Shared/SharedDriver';

const TOGGLE_STEPS: number = 8;
const ROUTE_ROUNDS: number = 3;

export default function renderGroupStabilityTest(): void {
  describe('RenderGroupStability', () => {
    for (const scene of SCENES) {
      it(`${scene.name}RepeatedTogglesPreserveGridAndSingleSwitch`, 0, async () => {
        await withScene(scene, async () => {
          await assertSwitch(false);
          for (let step = 1; step <= TOGGLE_STEPS; step++) {
            await toggleTo(step % 2 === 1);
            await assertVisibleItem(1);
            expect(await countId(SWITCH_ID)).assertEqual(1);
          }
          await assertSwitch(false);
        });
      });

      it(`${scene.name}RepeatedNavigationDoesNotAccumulateState`, 0, async () => {
        await runSerializedUiOperation(async () => {
          await launchEntry();
          await openHome();
          for (let round = 0; round < ROUTE_ROUNDS; round++) {
            await openScene(scene);
            await assertSwitch(false);
            await toggleTo(true);
            await assertVisibleItem(1);
            await backToHome(round % 2 === 1);
          }
          await backToIndex();
        });
      });
    }

    it('queuedWorkflowsOperateOnSeparateScenesInOrder', 0, async () => {
      const order: string[] = [];
      const first = runSerializedUiOperation(async () => {
        order.push('profit-start');
        await launchEntry();
        await openHome();
        await openScene(PROFIT);
        await toggleTo(true);
        await backToHome();
        order.push('profit-end');
      });
      const second = runSerializedUiOperation(async () => {
        order.push('non-profit-start');
        await openScene(NON_PROFIT);
        await assertSwitch(false);
        await assertVisibleItem(1);
        await backToHome();
        await backToIndex();
        order.push('non-profit-end');
      });
      await Promise.all([first, second]);
      expect(order.join(',')).assertEqual('profit-start,profit-end,non-profit-start,non-profit-end');
    });

    it('rejectedQueueWorkDoesNotBlockRealNavigation', 0, async () => {
      const rejected = runSerializedUiOperation(async (): Promise<void> => {
        throw new Error('Injected workflow failure');
      });
      const observed = rejected.then(() => 'unexpected success', (error: Error) => error.message);
      const recovery = runSerializedUiOperation(async () => {
        await launchEntry();
        await openHome();
        await openScene(PROFIT);
        await assertSwitch(false);
        await backToHome();
        await backToIndex();
      });
      const message = await observed;
      await recovery;
      expect(message).assertEqual('Injected workflow failure');
    });
  });
}
