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
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { inputMethod } from '@kit.IMEKit';
import { describe, expect, it } from '@ohos/hypium';
import { BUNDLE, DOMAIN, TAG } from '../TestLog';

const WAIT_MS = 5000;
const OPEN_EDITOR = `${BUNDLE}_OpenPreviewEditor_001`;
const JS_PREVIEW = `${BUNDLE}_SendAndFinishJsPreview_002`;
const C_PREVIEW = `${BUNDLE}_SendAndFinishCPreview_003`;
const SETTINGS = `${BUNDLE}_OpenInputMethodSettings_004`;

async function openSample(): Promise<Driver> {
  await abilityDelegatorRegistry.getAbilityDelegator().startAbility({
    bundleName: BUNDLE,
    abilityName: 'EntryAbility'
  });
  return Driver.create();
}

async function find(driver: Driver, id: string, text?: string): Promise<Component> {
  const matcher = text === undefined ? ON.id(id) : ON.id(id).text(text);
  const node = await driver.waitForComponent(matcher, WAIT_MS);
  hilog.info(DOMAIN, TAG, 'Assert component %{public}s is visible', id);
  expect(node !== null).assertTrue();
  return node;
}

async function verifyPreview(driver: Driver, editorId: string, attachId: string): Promise<void> {
  const editor = await find(driver, editorId);
  const initial = await editor.getText();
  await (await find(driver, attachId)).click();
  await (await find(driver, 'previewAsync')).click();
  const expected = abilityDelegatorRegistry.getAbilityDelegator().getAppContext()
    .createModuleContext('entry').resourceManager.getStringByNameSync('preview_text');
  const received = await find(driver, editorId, expected);
  hilog.info(DOMAIN, TAG, 'Assert received text matches the preview resource');
  expect(await received.getText()).assertEqual(expected);
  expect(initial === expected).assertFalse();
  await (await find(driver, 'previewFinish')).click();
  const committed = await find(driver, editorId, expected);
  hilog.info(DOMAIN, TAG, 'Assert finished preview text is retained');
  expect(await committed.getText()).assertEqual(expected);
}

async function verifySettings(driver: Driver): Promise<void> {
  const settings = inputMethod.getSystemInputMethodConfigAbility();
  const unavailable = settings.bundleName.length === 0 || settings.abilityName.length === 0;
  await (await find(driver, 'openInputMethodSettings')).click();
  if (!unavailable) {
    const settingsWindow = await driver.findWindow({ bundleName: settings.bundleName });
    hilog.info(DOMAIN, TAG, 'Assert system input method settings window is visible');
    expect(settingsWindow !== null).assertTrue();
    return;
  }
  const resources = abilityDelegatorRegistry.getAbilityDelegator().getAppContext()
    .createModuleContext('entry').resourceManager;
  const current = inputMethod.getCurrentInputMethod();
  const key = current.name === BUNDLE ? 'ime_enabled_hint' : 'settings_unavailable_hint';
  await find(driver, 'inputMethodSettingsStatus', resources.getStringByNameSync(key));
}

async function runCase(name: string, action: () => Promise<void>): Promise<void> {
  hilog.info(DOMAIN, TAG, 'begin %{public}s', name);
  try {
    await action();
  } finally {
    hilog.info(DOMAIN, TAG, 'end %{public}s', name);
  }
}

export default function abilityTest(): void {
  describe(BUNDLE, () => {
    // 001: Start the sample and verify that the default JS editor is visible.
    it(OPEN_EDITOR, 0, async () => {
      await runCase(OPEN_EDITOR, async () => {
        const driver = await openSample();
        await find(driver, 'jsPreviewEditor');
      });
    });
    // 002: Verify that the JS editor receives preview text and retains it after finish.
    it(JS_PREVIEW, 0, async () => {
      await runCase(JS_PREVIEW, async () => {
        const driver = await openSample();
        await verifyPreview(driver, 'jsPreviewEditor', 'jsPreviewAttach');
        await (await find(driver, 'jsPreviewAttach')).click();
      });
    });
    // 003: Verify the C editor route, native preview callback, and return to the JS editor.
    it(C_PREVIEW, 0, async () => {
      await runCase(C_PREVIEW, async () => {
        const driver = await openSample();
        await (await find(driver, 'openCPreviewEditor')).click();
        await verifyPreview(driver, 'cStandaloneEditor', 'cStandaloneAttach');
        await (await find(driver, 'backToJsPreviewEditor')).click();
        await find(driver, 'jsPreviewEditor');
      });
    });
    // 004: Check the settings window or the fallback when the system has no settings entry.
    it(SETTINGS, 0, async () => {
      await runCase(SETTINGS, async () => {
        await verifySettings(await openSample());
      });
    });
  });
}
