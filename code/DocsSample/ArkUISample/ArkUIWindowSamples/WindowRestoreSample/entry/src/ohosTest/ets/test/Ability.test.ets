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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import Want from '@ohos.app.ability.Want';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRestore]';
const BUNDLE: string = 'WindowRestore_';
const BUNDLE_NAME: string = 'com.samples.windowrestore';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, 'beforeAll, begin to start ability');
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'EntryAbility'
      };
      const abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.startAbility(want);
      // 等待应用启动完成
      await new Promise<void>(resolve => setTimeout(resolve, 3000));
      hilog.info(DOMAIN, TAG, 'beforeAll, ability started');
    });

    beforeEach(() => {
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * 验证页面标题文本组件是否存在且内容正确
     */
    it(BUNDLE + 'PageTitle_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'PageTitle_001, begin');
      try {
        const driver: Driver = Driver.create();
        await driver.assertComponentExist(ON.id('minimizeText'));
        const textComponent = await driver.findComponent(ON.id('minimizeText'));
        const text: string = await textComponent.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'PageTitle_001, text: %{public}s', text);
        expect(text).assertEqual('Minimize Window');
      } catch (error) {
        hilog.error(DOMAIN, TAG, BUNDLE + 'PageTitle_001, error: %{public}s', `${(error as Error).message}`);
        expect(true).assertFail();
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'PageTitle_001, end');
      done();
    });

    /**
     * 验证最小化按钮组件是否存在且内容正确
     */
    it(BUNDLE + 'ButtonText_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ButtonText_001, begin');
      try {
        const driver: Driver = Driver.create();
        await driver.assertComponentExist(ON.id('minimizeButton'));
        const buttonComponent = await driver.findComponent(ON.id('minimizeButton'));
        const text: string = await buttonComponent.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'ButtonText_001, text: %{public}s', text);
        expect(text).assertEqual('Minimize');
      } catch (error) {
        hilog.error(DOMAIN, TAG, BUNDLE + 'ButtonText_001, error: %{public}s', `${(error as Error).message}`);
        expect(true).assertFail();
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'ButtonText_001, end');
      done();
    });

    /**
     * 点击最小化按钮，验证点击操作不抛出异常
     */
    it(BUNDLE + 'ClickMinimize_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ClickMinimize_001, begin');
      try {
        const driver: Driver = Driver.create();
        await driver.assertComponentExist(ON.id('minimizeButton'));
        const buttonComponent = await driver.findComponent(ON.id('minimizeButton'));
        await buttonComponent.click();
        await driver.delayMs(1000);
        hilog.info(DOMAIN, TAG, BUNDLE + 'ClickMinimize_001, click succeeded');
        expect(true).assertTrue();
      } catch (error) {
        hilog.error(DOMAIN, TAG, BUNDLE + 'ClickMinimize_001, error: %{public}s', `${(error as Error).message}`);
        expect(true).assertFail();
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'ClickMinimize_001, end');
      done();
    });
  });
}
