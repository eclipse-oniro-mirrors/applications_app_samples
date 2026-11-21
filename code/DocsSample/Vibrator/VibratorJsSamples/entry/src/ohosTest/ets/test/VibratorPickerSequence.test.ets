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
import { vibrator } from '@kit.SensorServiceKit';
import { Component, Driver, ON, On } from '@ohos.UiTest';
import { afterAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  closePickerIfOpen, ensureUiReady, entryButtonText, observePicker, PickerObservation, requiredComponent, textOf
} from './VibratorSample.test';
import { paceTurn } from './TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = 'VibratorPickerSequence';

function effectSelector(): On {
  return ON.id('Please select effectId').type('TextInput');
}

function usageSelector(value: string): On {
  return ON.type('TextInput').text(value);
}

function deviceIds(infos: vibrator.VibratorInfo[]): string {
  // Compare only device identities, not full SDK objects or enumeration order.
  const ids: number[] = infos.map((info: vibrator.VibratorInfo): number => info.deviceId);
  ids.sort((left: number, right: number): number => left - right);
  return JSON.stringify(ids);
}

export default function vibratorPickerSequence(): void {
  describe('VibratorPickerSequence', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    afterAll(async (): Promise<void> => {
      try {
        await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand('power-shell timeout -r');
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'Failed to restore the screen timeout: %{public}s', JSON.stringify(error));
      }
    });

    /**
     * @tc.number SUB_VIBRATOR_UI_0004
     * @tc.name testVibratorSafeUi0004
     * @tc.desc 点击实际getVibratorInfoSync按钮，解析页面设备列表，对照前后稳定的SDK设备标识和数量，保持效果和preset。
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testVibratorSafeUi0004', 0, async (): Promise<void> => {
      const driver: Driver = await ensureUiReady();
      const beforeEffect: string = await textOf(driver, effectSelector());
      const beforePreset: string = await textOf(driver, ON.id('preset'));
      const beforeDevices: vibrator.VibratorInfo[] = vibrator.getVibratorInfoSync();
      const buttonText: string = await entryButtonText('getVibratorInfoSync');
      const button: Component = await requiredComponent(driver, ON.type('Button').text(buttonText));
      await button.click();
      const callback: string = await textOf(driver,
        ON.id('callbackText').text('Click the getVibratorInfoSync button successfully'));
      hilog.info(DOMAIN, TAG, '0004 query callback=%{public}s', callback);
      expect(callback).assertEqual('Click the getVibratorInfoSync button successfully');
      const content: string = await textOf(driver, ON.id('vibratorInfoContentText'));
      const observed: vibrator.VibratorInfo[] = JSON.parse(content) as vibrator.VibratorInfo[];
      hilog.info(DOMAIN, TAG, '0004 query UI JSON=%{public}s', content);
      expect(Array.isArray(observed)).assertTrue();
      const afterDevices: vibrator.VibratorInfo[] = vibrator.getVibratorInfoSync();
      const beforeIds: string = deviceIds(beforeDevices);
      const afterIds: string = deviceIds(afterDevices);
      // Fail on a changing topology before applying the independent SDK oracle to the UI snapshot.
      hilog.info(DOMAIN, TAG, '0004 SDK identities before=%{public}s after=%{public}s', beforeIds, afterIds);
      expect(afterIds).assertEqual(beforeIds);
      hilog.info(DOMAIN, TAG, '0004 UI device count=%{public}d SDK count=%{public}d',
        observed.length, afterDevices.length);
      expect(observed.length).assertEqual(afterDevices.length);
      const observedIds: string = deviceIds(observed);
      hilog.info(DOMAIN, TAG, '0004 UI identities=%{public}s SDK identities=%{public}s', observedIds, afterIds);
      expect(observedIds).assertEqual(afterIds);
      const effect: string = await textOf(driver, effectSelector());
      hilog.info(DOMAIN, TAG, '0004 query effect before=%{public}s after=%{public}s', beforeEffect, effect);
      expect(effect).assertEqual(beforeEffect);
      const preset: string = await textOf(driver, ON.id('preset'));
      hilog.info(DOMAIN, TAG, '0004 query preset before=%{public}s after=%{public}s', beforePreset, preset);
      expect(preset).assertEqual(beforePreset);
    });

    /**
     * @tc.number SUB_VIBRATOR_UI_0005
     * @tc.name testVibratorSafeUi0005
     * @tc.desc 实际效果选择器取消后重新打开，两次均居中显示初始warning选项，再次取消保持效果输入、preset及回调。
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testVibratorSafeUi0005', 0, async (): Promise<void> => {
      const driver: Driver = await ensureUiReady();
      const beforeEffect: string = await textOf(driver, effectSelector());
      const beforePreset: string = await textOf(driver, ON.id('preset'));
      const beforeCallback: string = await textOf(driver, ON.id('callbackText'));
      try {
        await (await requiredComponent(driver, effectSelector())).click();
        const first: PickerObservation = await observePicker(driver, 'haptic.notice.warning');
        hilog.info(DOMAIN, TAG, '0005 first effect picker value=%{public}s', first.text);
        expect(first.text).assertEqual('haptic.notice.warning');
        hilog.info(DOMAIN, TAG, '0005 first warning row is centered=%{public}s', String(first.centered));
        expect(first.centered).assertTrue();
        await closePickerIfOpen(driver);
        const afterFirst: string = await textOf(driver, effectSelector());
        hilog.info(DOMAIN, TAG, '0005 first cancel effect before=%{public}s after=%{public}s',
          beforeEffect, afterFirst);
        expect(afterFirst).assertEqual(beforeEffect);

        await (await requiredComponent(driver, effectSelector())).click();
        const reopened: PickerObservation = await observePicker(driver, 'haptic.notice.warning');
        hilog.info(DOMAIN, TAG, '0005 reopened effect picker value=%{public}s', reopened.text);
        expect(reopened.text).assertEqual('haptic.notice.warning');
        hilog.info(DOMAIN, TAG, '0005 reopened warning row is centered=%{public}s', String(reopened.centered));
        expect(reopened.centered).assertTrue();
        await closePickerIfOpen(driver);
        const effect: string = await textOf(driver, effectSelector());
        hilog.info(DOMAIN, TAG, '0005 second cancel effect before=%{public}s after=%{public}s', beforeEffect, effect);
        expect(effect).assertEqual(beforeEffect);
        const preset: string = await textOf(driver, ON.id('preset'));
        hilog.info(DOMAIN, TAG, '0005 cancels preset before=%{public}s after=%{public}s', beforePreset, preset);
        expect(preset).assertEqual(beforePreset);
        const callback: string = await textOf(driver, ON.id('callbackText'));
        hilog.info(DOMAIN, TAG, '0005 cancels callback before=%{public}s after=%{public}s', beforeCallback, callback);
        expect(callback).assertEqual(beforeCallback);
      } finally {
        await closePickerIfOpen(driver);
      }
    });

    /**
     * @tc.number SUB_VIBRATOR_UI_0006
     * @tc.name testVibratorSafeUi0006
     * @tc.desc 实际用途输入为unknown，打开选择器观察居中的unknown选项，返回取消保持用途、效果输入、preset及回调。
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testVibratorSafeUi0006', 0, async (): Promise<void> => {
      const driver: Driver = await ensureUiReady();
      const beforeUsage: string = await textOf(driver, usageSelector('unknown'));
      const beforeEffect: string = await textOf(driver, effectSelector());
      const beforePreset: string = await textOf(driver, ON.id('preset'));
      const beforeCallback: string = await textOf(driver, ON.id('callbackText'));
      hilog.info(DOMAIN, TAG, '0006 initial usage input=%{public}s', beforeUsage);
      expect(beforeUsage).assertEqual('unknown');
      try {
        await (await requiredComponent(driver, usageSelector(beforeUsage))).click();
        const selected: PickerObservation = await observePicker(driver, 'unknown');
        hilog.info(DOMAIN, TAG, '0006 usage picker value=%{public}s', selected.text);
        expect(selected.text).assertEqual('unknown');
        hilog.info(DOMAIN, TAG, '0006 unknown row is centered=%{public}s', String(selected.centered));
        expect(selected.centered).assertTrue();
        await closePickerIfOpen(driver);
        const usage: string = await textOf(driver, usageSelector(beforeUsage));
        hilog.info(DOMAIN, TAG, '0006 cancel usage before=%{public}s after=%{public}s', beforeUsage, usage);
        expect(usage).assertEqual(beforeUsage);
        const effect: string = await textOf(driver, effectSelector());
        hilog.info(DOMAIN, TAG, '0006 cancel effect before=%{public}s after=%{public}s', beforeEffect, effect);
        expect(effect).assertEqual(beforeEffect);
        const preset: string = await textOf(driver, ON.id('preset'));
        hilog.info(DOMAIN, TAG, '0006 cancel preset before=%{public}s after=%{public}s', beforePreset, preset);
        expect(preset).assertEqual(beforePreset);
        const callback: string = await textOf(driver, ON.id('callbackText'));
        hilog.info(DOMAIN, TAG, '0006 cancel callback before=%{public}s after=%{public}s', beforeCallback, callback);
        expect(callback).assertEqual(beforeCallback);
      } finally {
        await closePickerIfOpen(driver);
      }
    });

    /**
     * @tc.number SUB_VIBRATOR_UI_0007
     * @tc.name testVibratorSafeUi0007
     * @tc.desc 先打开用途选择器并取消，再打开效果选择器并取消，每一步均保持preset及回调，最终用途和效果输入不变。
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testVibratorSafeUi0007', 0, async (): Promise<void> => {
      const driver: Driver = await ensureUiReady();
      const beforeUsage: string = await textOf(driver, usageSelector('unknown'));
      const beforeEffect: string = await textOf(driver, effectSelector());
      const beforePreset: string = await textOf(driver, ON.id('preset'));
      const beforeCallback: string = await textOf(driver, ON.id('callbackText'));
      try {
        await (await requiredComponent(driver, usageSelector(beforeUsage))).click();
        const usageSelection: PickerObservation = await observePicker(driver, 'unknown');
        hilog.info(DOMAIN, TAG, '0007 first usage picker value=%{public}s', usageSelection.text);
        expect(usageSelection.text).assertEqual('unknown');
        hilog.info(DOMAIN, TAG, '0007 first unknown row is centered=%{public}s', String(usageSelection.centered));
        expect(usageSelection.centered).assertTrue();
        await closePickerIfOpen(driver);
        const afterUsagePreset: string = await textOf(driver, ON.id('preset'));
        hilog.info(DOMAIN, TAG, '0007 usage cancel preset before=%{public}s after=%{public}s',
          beforePreset, afterUsagePreset);
        expect(afterUsagePreset).assertEqual(beforePreset);
        const afterUsageCallback: string = await textOf(driver, ON.id('callbackText'));
        hilog.info(DOMAIN, TAG, '0007 usage cancel callback before=%{public}s after=%{public}s',
          beforeCallback, afterUsageCallback);
        expect(afterUsageCallback).assertEqual(beforeCallback);

        await (await requiredComponent(driver, effectSelector())).click();
        const effectSelection: PickerObservation = await observePicker(driver, 'haptic.notice.warning');
        hilog.info(DOMAIN, TAG, '0007 second effect picker value=%{public}s', effectSelection.text);
        expect(effectSelection.text).assertEqual('haptic.notice.warning');
        hilog.info(DOMAIN, TAG, '0007 second warning row is centered=%{public}s', String(effectSelection.centered));
        expect(effectSelection.centered).assertTrue();
        await closePickerIfOpen(driver);
        const preset: string = await textOf(driver, ON.id('preset'));
        hilog.info(DOMAIN, TAG, '0007 both cancels preset before=%{public}s after=%{public}s', beforePreset, preset);
        expect(preset).assertEqual(beforePreset);
        const callback: string = await textOf(driver, ON.id('callbackText'));
        hilog.info(DOMAIN, TAG, '0007 both cancels callback before=%{public}s after=%{public}s',
          beforeCallback, callback);
        expect(callback).assertEqual(beforeCallback);
        const usage: string = await textOf(driver, usageSelector(beforeUsage));
        hilog.info(DOMAIN, TAG, '0007 both cancels usage before=%{public}s after=%{public}s', beforeUsage, usage);
        expect(usage).assertEqual(beforeUsage);
        const effect: string = await textOf(driver, effectSelector());
        hilog.info(DOMAIN, TAG, '0007 both cancels effect before=%{public}s after=%{public}s', beforeEffect, effect);
        expect(effect).assertEqual(beforeEffect);
      } finally {
        await closePickerIfOpen(driver);
      }
    });
  });
}

