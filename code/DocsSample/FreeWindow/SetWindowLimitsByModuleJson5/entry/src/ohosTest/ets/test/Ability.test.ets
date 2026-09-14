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

const TAG = 'SetWindowLimitsByModuleJson5_Test';
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
  describe('SetWindowLimitsByModuleJson5Test', () => {
    /**
     * 打开应用，主页正常显示
     */
    it('SetWindowLimitsByModuleJson5_ui_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'ui_001 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const abilityName = await getTopAbilityName();
      expect(abilityName).assertEqual('EntryAbility');
      await driver.assertComponentExist(ON.text('Top layout area, do not hide the title bar.'));
      await driver.assertComponentExist(ON.text('hide the title bar and avoid the three buttons.'));
      await driver.assertComponentExist(ON.text('do not hide the title bar.'));
      hilog.info(DOMAIN, TAG, 'ui_001 end');
      done();
    });

    /**
     * 点击"hide the title bar and avoid the three buttons."按钮，隐藏标题栏并避让三键控制按钮
     */
    it('SetWindowLimitsByModuleJson5_ui_002', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'ui_002 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hideButton = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      await hideButton.click();
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, hide the title bar and avoid the three buttons.'));
      hilog.info(DOMAIN, TAG, 'ui_002 end');
      done();
    });

    /**
     * 点击"do not hide the title bar."按钮，恢复显示标题栏
     */
    it('SetWindowLimitsByModuleJson5_ui_003', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'ui_003 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hideButton = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      await hideButton.click();
      await driver.delayMs(DELAY_UI_READY);
      const showButton = await driver.findComponent(ON.text('do not hide the title bar.'));
      await showButton.click();
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, do not hide the title bar.'));
      hilog.info(DOMAIN, TAG, 'ui_003 end');
      done();
    });

    /**
     * module.json5静态配置的窗口尺寸限制生效，窗口缩放不超出限定范围
     */
    it('SetWindowLimitsByModuleJson5_ui_004', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'ui_004 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const window = await driver.findWindow({ bundleName: bundleName });
      try {
        // 尝试将窗口缩放至远大于最大限值的尺寸
        await window.resize(20000, 20000, ResizeDirection.RIGHT_DOWN);
        await driver.delayMs(DELAY_UI_READY);
        let bounds = await window.getBounds();
        // 窗口宽度、高度被限制在module.json5配置的最大值以内
        expect(bounds.width < 20000).assertTrue();
        expect(bounds.height < 20000).assertTrue();
        // 尝试将窗口缩放至远小于最小限值的尺寸
        await window.resize(10, 10, ResizeDirection.LEFT_UP);
        await driver.delayMs(DELAY_UI_READY);
        bounds = await window.getBounds();
        // 窗口宽度、高度被限制在module.json5配置的最小值以上
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
      hilog.info(DOMAIN, TAG, 'ui_004 end');
      done();
    });
  })
}
