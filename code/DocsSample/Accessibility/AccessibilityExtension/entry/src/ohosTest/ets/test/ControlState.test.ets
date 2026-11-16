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

import { afterAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@kit.TestKit';
import {
  addLog, clickId, counterValue, getDriver, runCase, scrollToId, startApp, textOfId, waitId
} from '../testkit/SharedDriver';
import { localizeText, parseTrailingNumber } from '../testkit/LocaleText';

const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

async function swipeHorizontal(id: string, startRatio: number, endRatio: number): Promise<void> {
  const component: Component = await waitId(id);
  const bounds = await component.getBounds();
  const y: number = Math.round(bounds.top + (bounds.bottom - bounds.top) / 2);
  const startX: number = Math.round(bounds.left + (bounds.right - bounds.left) * startRatio);
  const endX: number = Math.round(bounds.left + (bounds.right - bounds.left) * endRatio);
  const driver: Driver = getDriver();
  await driver.swipe(startX, y, endX, y, 1000);
  await driver.waitForIdle(300, 3000);
}

function parseSliderValue(text: string): number {
  return parseTrailingNumber(text);
}

export default function controlStateTest(): void {
  describe('ControlStateTest', () => {
    afterAll(() => {
      addLog('ControlStateTest suite finished');
    })

    /**
     * @tc.number    SUB_A11Y_EXT_CONTROL_STATE_0100
     * @tc.name      testControlState0001
     * @tc.desc      Verify slider default value and both value boundaries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testControlState0001', 0, async (done: Function) => {
      await runCase('testControlState0001', async (): Promise<void> => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await scrollToId('volumeSlider');

        const initialText: string = await textOfId('sliderValueText');
        const initialValue: number = parseSliderValue(initialText);
        addLog('testControlState0001: initial=%{public}s value=%{public}d', initialText, initialValue);
        // 用例共享同一页面实例，滑块值可能被前序用例改动；这里校验初始读数落在合法区间
        expect(Number.isNaN(initialValue)).assertFalse();
        expect(initialValue >= 0 && initialValue <= 100).assertTrue();

        // 滑到轨道右端附近：值应接近最大值（手势落点受轨道边距影响，不断言精确 100）
        await swipeHorizontal('volumeSlider', 0.2, 0.98);
        const maximumValue: number = parseSliderValue(await textOfId('sliderValueText'));
        addLog('testControlState0001: maximum=%{public}d', maximumValue);
        expect(maximumValue >= 90).assertTrue();

        // 滑到轨道左端附近：值应接近最小值，且小于向右滑动后的结果
        await swipeHorizontal('volumeSlider', 0.9, 0.02);
        const minimumValue: number = parseSliderValue(await textOfId('sliderValueText'));
        addLog('testControlState0001: minimum=%{public}d', minimumValue);
        expect(minimumValue <= 10).assertTrue();
        expect(minimumValue < maximumValue).assertTrue();
      }, done);
    });

    /**
     * @tc.number    SUB_A11Y_EXT_CONTROL_STATE_0200
     * @tc.name      testControlState0002
     * @tc.desc      Verify checkbox state changes on selection and deselection.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testControlState0002', 0, async (done: Function) => {
      await runCase('testControlState0002', async (): Promise<void> => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await scrollToId('notificationCheckbox');

        // 每次读取前重新定位：滚动与点击可能使旧组件句柄失效
        const initialState: boolean = await (await waitId('notificationCheckbox')).isChecked();
        const counterBefore: number = await counterValue();
        addLog('testControlState0002: initial=%{public}s', String(initialState));

        // 点击一次应翻转勾选状态（不依赖跨用例残留的初始值）
        await clickId('notificationCheckbox');
        const selectedState: boolean = await (await waitId('notificationCheckbox')).isChecked();
        addLog('testControlState0002: selected=%{public}s', String(selectedState));
        expect(selectedState).assertEqual(!initialState);

        // 再次点击应回到初始状态
        await clickId('notificationCheckbox');
        const deselectedState: boolean = await (await waitId('notificationCheckbox')).isChecked();
        addLog('testControlState0002: deselected=%{public}s', String(deselectedState));
        expect(deselectedState).assertEqual(initialState);

        // 勾选操作不应影响点击计数器
        const counterAfter: number = await counterValue();
        addLog('testControlState0002: counter before=%{public}d after=%{public}d', counterBefore, counterAfter);
        expect(counterAfter).assertEqual(counterBefore);
      }, done);
    });

    /**
     * @tc.number    SUB_A11Y_EXT_CONTROL_STATE_0300
     * @tc.name      testControlState0003
     * @tc.desc      Verify swiper forward navigation and backward navigation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testControlState0003', 0, async (done: Function) => {
      await runCase('testControlState0003', async (): Promise<void> => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await scrollToId('pageSwiper');

        // 页面实例在套件间复用，Swiper 可能停留在非首页；先反向滑回首页（已在首页时幂等）
        for (let i = 0; i < 3; i++) {
          await swipeHorizontal('pageSwiper', 0.2, 0.8);
        }

        const firstPage: Component = await waitId('swiperPage1');
        expect(await firstPage.getText()).assertEqual(localizeText('Page 1'));

        await swipeHorizontal('pageSwiper', 0.8, 0.2);
        const secondPage: Component = await waitId('swiperPage2');
        const secondText: string = await secondPage.getText();
        addLog('testControlState0003: forward page=%{public}s', secondText);
        expect(secondText).assertEqual(localizeText('Page 2'));

        await swipeHorizontal('pageSwiper', 0.8, 0.2);
        const thirdPage: Component = await waitId('swiperPage3');
        const thirdText: string = await thirdPage.getText();
        addLog('testControlState0003: last page=%{public}s', thirdText);
        expect(thirdText).assertEqual(localizeText('Page 3'));

        await swipeHorizontal('pageSwiper', 0.2, 0.8);
        const previousPage: Component = await waitId('swiperPage2');
        const previousText: string = await previousPage.getText();
        addLog('testControlState0003: backward page=%{public}s', previousText);
        expect(previousText).assertEqual(localizeText('Page 2'));
      }, done);
    });
  });
}
