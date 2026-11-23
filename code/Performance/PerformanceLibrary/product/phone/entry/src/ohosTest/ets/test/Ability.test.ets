/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
import { ON } from '@ohos.UiTest';
import { backTo, click, eventually, openFeature, readText, requireComponent, resourceText, withHome }
  from './Shared/PerformanceDriver';

async function verifyNativeCallback(button: string): Promise<void> {
  await withHome(async () => {
    await openFeature('NativeThreadsCallJS');
    const result = ON.id('textNativeValue');
    expect(await readText(result)).assertEqual('0');
    expect(await (await requireComponent(result)).getDescription()).assertEqual('Completed callbacks: 0');
    await click(ON.text(button));
    await eventually(async () => await (await requireComponent(result)).getDescription() === 'Completed callbacks: 3',
      'all three native callbacks', 10000);
    const baseline: number = Number(await readText(result));
    await click(ON.text(button));
    await eventually(async () => await (await requireComponent(result)).getDescription() === 'Completed callbacks: 6',
      'three more native callbacks', 10000);
    expect(Number(await readText(result))).assertEqual(baseline + 30);
  });
}

export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.number SUB_PERFORMANCE_ABILITY_0100
     * @tc.name homeDisplaysFeatureEntriesAfterLaunch
     * @tc.desc Home Displays Feature Entries After Launch.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('homeDisplaysFeatureEntriesAfterLaunch', 0, async () => {
      await withHome(async () => {
        const home = await requireComponent(ON.id('performanceHome'));
        await home.scrollToTop(40000);
        await requireComponent(ON.text('HiDumper'));
        await requireComponent(ON.text('StaticImport'));
        await requireComponent(ON.text('DynamicImport'));
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_ABILITY_0600
     * @tc.name transientTaskPageDisplaysInitialCalculationState
     * @tc.desc Transient Task Page Displays Initial Calculation State.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('transientTaskPageDisplaysInitialCalculationState', 0, async () => {
      await withHome(async () => {
        await openFeature('BackgroundTask');
        await click(ON.text(resourceText('transient_task')));
        await requireComponent(ON.text('开始计算'));
        expect(await readText(ON.text('Click button to calculate.'))).assertEqual('Click button to calculate.');
        await backTo(ON.text(resourceText('transient_task')));
      });
    });

    /**
     * @tc.number SUB_PERFORMANCE_ABILITY_0700
     * @tc.name threadSafeCallbacksDeliverThreeResultsOnEachInvocation
     * @tc.desc Thread Safe Callbacks Deliver Three Results On Each Invocation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('threadSafeCallbacksDeliverThreeResultsOnEachInvocation', 0, async () => {
      await verifyNativeCallback('threadSafeTest');
    });

    /**
     * @tc.number SUB_PERFORMANCE_ABILITY_0800
     * @tc.name libuvCallbacksDeliverThreeResultsOnEachInvocation
     * @tc.desc Libuv Callbacks Deliver Three Results On Each Invocation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('libuvCallbacksDeliverThreeResultsOnEachInvocation', 0, async () => {
      await verifyNativeCallback('libuvTest');
    });

    /**
     * @tc.number SUB_PERFORMANCE_ABILITY_1000
     * @tc.name threadDataTransferPageDisplaysConfigurationControls
     * @tc.desc Thread Data Transfer Page Displays Configuration Controls.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('threadDataTransferPageDisplaysConfigurationControls', 0, async () => {
      await withHome(async () => {
        await openFeature('ThreadDataTransfer');
        await requireComponent(ON.text(resourceText('task_num')));
        await requireComponent(ON.text(resourceText('pass_params')));
        await requireComponent(ON.text(resourceText('running_time')));
        await requireComponent(ON.type('Slider'));
        await requireComponent(ON.type('Toggle'));
        await requireComponent(ON.type('Image'));
      });
    });
  });
}
