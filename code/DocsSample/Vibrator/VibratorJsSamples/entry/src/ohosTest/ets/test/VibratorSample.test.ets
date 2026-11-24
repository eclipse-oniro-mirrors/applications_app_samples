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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { common, Want } from '@kit.AbilityKit';
import { Component, Driver, ON, On, Rect } from '@ohos.UiTest';
import { vibrator } from '@kit.SensorServiceKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { paceTurn } from './TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = 'VibratorSafeUi';
const UI_READY_TIMEOUT_MS: number = 3000;
let uiReady: Promise<Driver> | undefined = undefined;

export async function requiredComponent(driver: Driver, selector: On): Promise<Component> {
  const component: Component | null | undefined = await driver.waitForComponent(selector, UI_READY_TIMEOUT_MS);
  if (component === undefined || component === null) {
    throw new Error('Required vibrator UI component did not become available');
  }
  return component;
}

export async function textOf(driver: Driver, selector: On): Promise<string> {
  const component: Component = await requiredComponent(driver, selector);
  return component.getText();
}

async function initializeUi(): Promise<Driver> {
  const driver: Driver = Driver.create();
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  try {
    // Keep the real device awake while the UI suites interact with pickers and buttons.
    await delegator.executeShellCommand('power-shell timeout -o 2147483647');
  } catch (error) {
    hilog.warn(DOMAIN, TAG, 'Failed to keep the screen on: %{public}s', JSON.stringify(error));
  }
  const want: Want = { bundleName: 'com.samples.vibrator', moduleName: 'entry', abilityName: 'EntryAbility' };
  await delegator.startAbility(want);
  await requiredComponent(driver, ON.id('preset'));
  await requiredComponent(driver, ON.id('Please select effectId').type('TextInput'));
  await requiredComponent(driver, ON.id('callbackText'));
  return driver;
}

export function ensureUiReady(): Promise<Driver> {
  // Called only from UI cases. Keep a rejected initialization too: never restart or hide a launch failure.
  if (uiReady === undefined) {
    uiReady = initializeUi();
  }
  return uiReady;
}

export async function entryButtonText(resourceName: string): Promise<string> {
  const context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  const entryContext: common.Context = context.createModuleContext('entry');
  return entryContext.resourceManager.getStringByNameSync(resourceName);
}

export interface PickerObservation {
  text: string;
  centered: boolean;
}

export async function observePicker(driver: Driver, initialValue: string): Promise<PickerObservation> {
  const picker: Component = await requiredComponent(driver, ON.type('TextPicker'));
  // Text excludes the underlying usage TextInput. Presence alone does not prove the selected row.
  const row: Component = await requiredComponent(driver, ON.type('Text').text(initialValue));
  const pickerBounds: Rect = await picker.getBounds();
  const rowBounds: Rect = await row.getBounds();
  const pickerCenter: number = (pickerBounds.top + pickerBounds.bottom) / 2;
  const rowCenter: number = (rowBounds.top + rowBounds.bottom) / 2;
  const rowHeight: number = rowBounds.bottom - rowBounds.top;
  const centered: boolean = rowHeight > 0 && pickerBounds.bottom > pickerBounds.top &&
    rowBounds.top >= pickerBounds.top && rowBounds.bottom <= pickerBounds.bottom &&
    Math.abs(rowCenter - pickerCenter) <= rowHeight / 2;
  const observation: PickerObservation = { text: await row.getText(), centered: centered };
  return observation;
}

export async function closePickerIfOpen(driver: Driver): Promise<void> {
  const picker: Component | null | undefined = await driver.findComponent(ON.type('TextPicker'));
  if (picker === null || picker === undefined) {
    return;
  }
  const pickerBounds: Rect = await picker.getBounds();
  const buttons: Component[] = await driver.findComponents(ON.type('Button'));
  let cancelButton: Component | undefined = undefined;
  let cancelCenterX: number = Number.MAX_VALUE;
  for (const button of buttons) {
    const bounds: Rect = await button.getBounds();
    const belowPicker: boolean = bounds.top >= pickerBounds.bottom && bounds.top <= pickerBounds.bottom + 40;
    const insideDialog: boolean = bounds.bottom <= pickerBounds.bottom + 120;
    if (belowPicker && insideDialog) {
      const centerX: number = (bounds.left + bounds.right) / 2;
      if (centerX < cancelCenterX) {
        cancelCenterX = centerX;
        cancelButton = button;
      }
    }
  }
  if (cancelButton === undefined) {
    throw new Error('Vibrator picker cancel button was not found');
  }
  await cancelButton.click();
  const deadline: number = Date.now() + UI_READY_TIMEOUT_MS;
  while (true) {
    const remaining: Component | null | undefined = await driver.findComponent(ON.type('TextPicker'));
    if (remaining === null || remaining === undefined) {
      break;
    }
    if (Date.now() >= deadline) {
      throw new Error('Vibrator picker remained open after cancel');
    }
    await paceTurn();
  }
  await requiredComponent(driver, ON.id('preset'));
}

export default function vibratorSample(): void {
  describe('VibratorSafeUiSequence', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_VIBRATOR_UI_0001
     * @tc.name testVibratorSafeUi0001
     * @tc.desc 实际主界面初始preset未选效果，TextInput保持空效果值和输入类型，用途为unknown，不点击振动按钮。
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testVibratorSafeUi0001', 0, async (): Promise<void> => {
      const driver: Driver = await ensureUiReady();
      const preset: string = await textOf(driver, ON.id('preset'));
      hilog.info(DOMAIN, TAG, 'Initial preset=%{public}s', preset);
      expect(preset).assertEqual('preset:');
      const input: Component = await requiredComponent(driver, ON.id('Please select effectId'));
      const effect: string = await input.getText();
      hilog.info(DOMAIN, TAG, 'Initial effect input=%{public}s', effect);
      expect(effect).assertEqual('');
      const type: string = await input.getType();
      hilog.info(DOMAIN, TAG, 'Initial effect input type=%{public}s', type);
      expect(type).assertEqual('TextInput');
      const usage: string = await textOf(driver, ON.type('TextInput').text('unknown'));
      hilog.info(DOMAIN, TAG, 'Initial usage=%{public}s', usage);
      expect(usage).assertEqual('unknown');
    });

    /**
     * @tc.number SUB_VIBRATOR_UI_0002
     * @tc.name testVibratorSafeUi0002
     * @tc.desc 实际effect输入打开居中的默认warning选项，返回取消后输入、preset及回调保持原值。
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorSafeUi0002', 0, async (): Promise<void> => {
      const driver: Driver = await ensureUiReady();
      const input: Component = await requiredComponent(driver, ON.id('Please select effectId'));
      const before: string = await input.getText();
      const beforePreset: string = await textOf(driver, ON.id('preset'));
      const beforeCallback: string = await textOf(driver, ON.id('callbackText'));
      try {
        await input.click();
        const selected: PickerObservation = await observePicker(driver, 'haptic.notice.warning');
        hilog.info(DOMAIN, TAG, 'Default picker effect=%{public}s', selected.text);
        expect(selected.text).assertEqual('haptic.notice.warning');
        hilog.info(DOMAIN, TAG, 'Default warning row is centered=%{public}s', String(selected.centered));
        expect(selected.centered).assertTrue();
        await closePickerIfOpen(driver);
        const after: string = await textOf(driver, ON.id('Please select effectId'));
        hilog.info(DOMAIN, TAG, 'Cancel picker input before=%{public}s after=%{public}s', before, after);
        expect(after).assertEqual(before);
        const preset: string = await textOf(driver, ON.id('preset'));
        hilog.info(DOMAIN, TAG, 'Cancel picker preset before=%{public}s after=%{public}s', beforePreset, preset);
        expect(preset).assertEqual(beforePreset);
        const callback: string = await textOf(driver, ON.id('callbackText'));
        hilog.info(DOMAIN, TAG, 'Cancel picker callback before=%{public}s after=%{public}s', beforeCallback, callback);
        expect(callback).assertEqual(beforeCallback);
      } finally {
        await closePickerIfOpen(driver);
      }
    });

    /**
     * @tc.number SUB_VIBRATOR_UI_0003
     * @tc.name testVibratorSafeUi0003
     * @tc.desc 只点击实际高清能力查询，对照SDK布尔结果检查页面回显及业务成功文案，保持效果和preset，不要求支持振动。
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testVibratorSafeUi0003', 0, async (): Promise<void> => {
      const driver: Driver = await ensureUiReady();
      const beforePreset: string = await textOf(driver, ON.id('preset'));
      const beforeEffect: string = await textOf(driver, ON.id('Please select effectId'));
      const expected: boolean = vibrator.isHdHapticSupported();
      const buttonText: string = await entryButtonText('isHdHapticSupported');
      const button: Component = await requiredComponent(driver, ON.type('Button').text(buttonText));
      await button.click();
      const callbackText: string = await textOf(driver,
        ON.id('callbackText').text('Click the isHdHapticSupported button successfully'));
      hilog.info(DOMAIN, TAG, 'HD query callback=%{public}s', callbackText);
      expect(callbackText).assertEqual('Click the isHdHapticSupported button successfully');
      const info: string = await textOf(driver, ON.id('vibratorInfoContentText'));
      hilog.info(DOMAIN, TAG, 'HD query SDK=%{public}s UI=%{public}s', String(expected), info);
      expect(info).assertEqual(String(expected));
      const preset: string = await textOf(driver, ON.id('preset'));
      hilog.info(DOMAIN, TAG, 'HD query preset before=%{public}s after=%{public}s', beforePreset, preset);
      expect(preset).assertEqual(beforePreset);
      const effect: string = await textOf(driver, ON.id('Please select effectId'));
      hilog.info(DOMAIN, TAG, 'HD query effect before=%{public}s after=%{public}s', beforeEffect, effect);
      expect(effect).assertEqual(beforeEffect);
    });
  });
}

