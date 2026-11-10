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
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { Want } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_BelowLockScreenTarget]';
const BUNDLE: string = 'BelowLockScreenTarget_';
const BUNDLE_NAME: string = 'com.samples.belowlockscreentarget';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, 'beforeAll, begin to start ability');
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'EntryAbility'
      };
      const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.startAbility(want);
      // 等待应用启动及延时加载完成（3秒延时 + 缓冲时间）
      await new Promise<void>(resolve => setTimeout(resolve, 6000));
      hilog.info(DOMAIN, TAG, 'beforeAll, ability started');
    });

    beforeEach(() => {
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * 验证页面文本组件是否存在且内容正确
     */
    it(BUNDLE + 'PageText_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'PageText_001, begin');
      try {
        const driver: Driver = Driver.create();
        await driver.assertComponentExist(ON.id('targetLaunchedText'));
        const textComponent = await driver.findComponent(ON.id('targetLaunchedText'));
        const text: string = await textComponent.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'PageText_001, text: %{public}s', text);
        expect(text).assertContain('Launched Below Lock Screen');
      } catch (error) {
        hilog.error(DOMAIN, TAG, BUNDLE + 'PageText_001, error: %{public}s', `${(error as Error).message}`);
        expect(true).assertFail();
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'PageText_001, end');
      done();
    });
  });
}
