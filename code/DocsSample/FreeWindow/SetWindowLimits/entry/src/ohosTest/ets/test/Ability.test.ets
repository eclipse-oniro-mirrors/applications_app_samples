/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, ResizeDirection } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = 'SetWindowLimits_Test';
const DOMAIN = 0x0000;
const DELAY_UI_READY = 1000;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
const driver = Driver.create();

async function launchEntryAbility(): Promise<void> {
  const want: Want = {
    bundleName: bundleName,
    abilityName: 'EntryAbility'
  };
  await delegator.startAbility(want);
}

async function getTopAbilityName(): Promise<string> {
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  return ability.context.abilityInfo.name;
}

export default function abilityTest() {
  describe('SetWindowLimitsTest', () => {
    /**
     * 打开应用，主页正常显示
     */
    it('SetWindowLimits_ui_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'ui_001 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const abilityName = await getTopAbilityName();
      expect(abilityName).assertEqual('EntryAbility');
      await driver.assertComponentExist(ON.text('setWindowLimits.'));
      hilog.info(DOMAIN, TAG, 'ui_001 end');
      done();
    });

    /**
     * setWindowLimits接口设置的窗口尺寸限制生效，窗口缩放不超出限定范围
     */
    it('SetWindowLimits_ui_002', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'ui_002 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const window = await driver.findWindow({ bundleName: bundleName });
      try {
        // 尝试将窗口缩放至远大于最大限值的尺寸
        await window.resize(20000, 20000, ResizeDirection.RIGHT_DOWN);
        await driver.delayMs(DELAY_UI_READY);
        let bounds = await window.getBounds();
        // 窗口宽度、高度被限制在setWindowLimits设置的最大值以内
        expect(bounds.width < 20000).assertTrue();
        expect(bounds.height < 20000).assertTrue();
        // 尝试将窗口缩放至远小于最小限值的尺寸
        await window.resize(10, 10, ResizeDirection.LEFT_UP);
        await driver.delayMs(DELAY_UI_READY);
        bounds = await window.getBounds();
        // 窗口宽度、高度被限制在setWindowLimits设置的最小值以上
        expect(bounds.width > 100).assertTrue();
        expect(bounds.height > 100).assertTrue();
      } catch (err) {
        if (err.message == 'this device can not support this action') {
          // 当前设备不支持自由窗口时，仅校验窗口对象获取成功
          expect(window != null).assertTrue();
        } else {
          expect(false).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, 'ui_002 end');
      done();
    });
  })
}
