'use static';
/**
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
// [Start slideFps_sta_sample]
import { describe, beforeAll, expect, it, Level } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
import { PerfMeasureResult, PerfMetric, PerfTest, PerfTestStrategy } from '@ohos.test.PerfTest';
import { Callback } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import { TestHelper, startAbility, stopApplication } from './TestHelper.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;

export default function PerfTestTest(): void {
  describe('PerfTestTest1', () => {
    beforeAll(async () => {
      await startAbility(bundleName, 'EntryAbility');
      await TestHelper.msSleep(2000);
    })
    it('testExample2', Level.LEVEL3, async (): Promise<void> => {
      let driver = Driver.create();
      await TestHelper.pushUrl('pages/Index', 'Index');
      await driver!.delayMs(2000);
      let toPageListBtn = await driver.findComponent(ON.id('toPageList'));
      if (toPageListBtn != null) {
        await toPageListBtn.click();
      }
      await driver.delayMs(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      if (scroll == null) {
        return;
      }
      await driver.delayMs(1000);
      let center = await scroll.getBoundsCenter();
      await driver.delayMs(1000);
      let metrics: Array<PerfMetric> = [PerfMetric.LIST_SWIPE_FPS];
      let actionCode = (finish: Callback<boolean>) => {
        (async () => {
          await driver.fling({ x: center.x, y: Math.floor(center.y * 3 / 2).toInt() },
            { x: center.x, y: Math.floor(center.y / 2).toInt() }, 50, 20000);
          await driver.delayMs(3000);
          finish(true);
        })().awaitSync()
      };
      let resetCode = (finish: Callback<boolean>) => {
        (async () => {
          await scroll!.scrollToTop(40000);
          await driver.delayMs(1000);
          finish(true);
        })().awaitSync()
      };
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        resetCode: resetCode,
        iterations: 5,
        timeout: 50000,
      };
      try {
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy);
        await perfTest.run();
        let res: PerfMeasureResult = perfTest.getMeasureResult(PerfMetric.LIST_SWIPE_FPS);
        perfTest.destroy();
        expect(res.average).assertLargerOrEqual(30);
      } catch (error) {
        console.error(`Failed to execute perftest. Cause:${JSON.stringify(error)}`);
      }
    })
  })
}

// [End slideFps_sta_sample]
