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
import { afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.examples.simplekeyboard';
const ABILITY: string = 'EntryAbility';
const IME_BUNDLE: string = 'com.examples.simplekeyboard';
const IME_ID: string = 'com.examples.simplekeyboard/InputMethodService';
const DOMAIN: number = 0xF814;
const TAG: string = 'KeyboardUiStateTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function shell(cmd: string): Promise<string> {
  const result = await delegator.executeShellCommand(cmd);
  return result.stdResult;
}

async function exists(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return component !== undefined && component !== null;
  } catch (error) {
    log('exists failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function clickId(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return false;
    }
    await component.click();
    await sleep(350);
    return true;
  } catch (error) {
    log('clickId failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function hideKeyboard(driver: Driver): Promise<void> {
  if (await exists(driver, 'kikaInputDown')) {
    await clickId(driver, 'kikaInputDown');
    await sleep(400);
  }
}

async function ensurePreview(driver: Driver): Promise<boolean> {
  await hideKeyboard(driver);
  if (await exists(driver, 'previewInput')) {
    return true;
  }
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  return await exists(driver, 'previewInput');
}

async function ensureNormalMenu(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'key_q')) {
      return true;
    }
    if (await exists(driver, 'btnEdit')) {
      await clickId(driver, 'keyboardMenu');
      await sleep(300);
    }
    if (await exists(driver, 'keyboardModeToggle')) {
      await clickId(driver, 'keyboardModeToggle');
      await sleep(300);
    }
  }
  return await exists(driver, 'key_q');
}

async function focusKeyboard(driver: Driver): Promise<boolean> {
  if (!await ensurePreview(driver)) {
    return false;
  }
  const input: Component = await driver.findComponent(ON.id('previewInput'));
  if (input === undefined || input === null) {
    return false;
  }
  await input.click();
  await sleep(700);
  if (!await exists(driver, 'key_q')) {
    if (await exists(driver, 'keyboardModeToggle')) {
      await clickId(driver, 'keyboardModeToggle');
      await sleep(500);
    }
  }
  return await ensureNormalMenu(driver);
}

async function clearPreview(driver: Driver): Promise<void> {
  const input: Component = await driver.findComponent(ON.id('previewInput'));
  if (input !== undefined && input !== null) {
    await input.clearText();
    await sleep(250);
  }
}

async function getPreviewText(driver: Driver): Promise<string> {
  const input: Component = await driver.findComponent(ON.id('previewInput'));
  if (input === undefined || input === null) {
    return '';
  }
  return await input.getText();
}

async function typeKeys(driver: Driver, ids: string[]): Promise<void> {
  for (let i: number = 0; i < ids.length; i++) {
    await clickId(driver, ids[i]);
  }
  await sleep(300);
}

async function prepare(driver: Driver): Promise<boolean> {
  if (!await focusKeyboard(driver)) {
    log('prepare: keyboard is not available');
    return false;
  }
  await ensureNormalMenu(driver);
  await clearPreview(driver);
  return true;
}

export default function keyboardUiStateTest(): void {
  describe('KeyboardUiState', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await shell('ime enable ' + IME_ID);
      await shell('ime set ' + IME_ID);
      await shell('ime -s ' + IME_BUNDLE);
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      await ensurePreview(driver);
      expect(await ensurePreview(driver)).assertTrue();
    });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYUI_0001
     * @tc.name      testKeyboardUiState0001
     * @tc.desc      Verify the normal keyboard exposes the core editing keys.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardUiState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await exists(driver, 'shiftKey')).assertTrue();
      expect(await exists(driver, 'deleteKey')).assertTrue();
      expect(await exists(driver, 'spaceKey')).assertTrue();
      expect(await exists(driver, 'returnItem')).assertTrue();
    })

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYUI_0002
     * @tc.name      testKeyboardUiState0002
     * @tc.desc      Verify one shift press types an uppercase letter and then resets.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardUiState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      await clickId(driver, 'shiftKey');
      await typeKeys(driver, ['key_q']);
      expect(await getPreviewText(driver)).assertEqual('Q');
      await typeKeys(driver, ['key_w']);
      expect(await getPreviewText(driver)).assertEqual('Qw');
    })

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYUI_0003
     * @tc.name      testKeyboardUiState0003
     * @tc.desc      Verify two shift presses keep uppercase mode for consecutive letters.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardUiState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      await clickId(driver, 'shiftKey');
      await clickId(driver, 'shiftKey');
      await typeKeys(driver, ['key_q', 'key_w']);
      expect(await getPreviewText(driver)).assertEqual('QW');
    })

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYUI_0004
     * @tc.name      testKeyboardUiState0004
     * @tc.desc      Verify three shift presses return the keyboard to lowercase mode.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardUiState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      await clickId(driver, 'shiftKey');
      await clickId(driver, 'shiftKey');
      await clickId(driver, 'shiftKey');
      await typeKeys(driver, ['key_q']);
      expect(await getPreviewText(driver)).assertEqual('q');
    })

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYUI_0005
     * @tc.name      testKeyboardUiState0005
     * @tc.desc      Verify the number toggle replaces letter keys with digit keys.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardUiState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await clickId(driver, 'keyboardModeToggle')).assertTrue();
      expect(await exists(driver, 'key_1')).assertTrue();
      expect(await exists(driver, 'key_9')).assertTrue();
      expect(await exists(driver, 'key_q')).assertFalse();
    })

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYUI_0006
     * @tc.name      testKeyboardUiState0006
     * @tc.desc      Verify the number panel returns to the normal letter panel.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardUiState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      await clickId(driver, 'keyboardModeToggle');
      expect(await exists(driver, 'key_1')).assertTrue();
      await clickId(driver, 'keyboardModeToggle');
      expect(await exists(driver, 'key_q')).assertTrue();
    })

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYUI_0007
     * @tc.name      testKeyboardUiState0007
     * @tc.desc      Verify the number panel opens the special symbol panel.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardUiState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      await clickId(driver, 'keyboardModeToggle');
      expect(await exists(driver, 'key_1')).assertTrue();
      await clickId(driver, 'keyboardModeToggle');
      expect(await exists(driver, 'key_~')).assertTrue();
      expect(await exists(driver, 'key_q')).assertFalse();
    })

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYUI_0008
     * @tc.name      testKeyboardUiState0008
     * @tc.desc      Verify the special panel can return to the number panel.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardUiState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      await clickId(driver, 'keyboardModeToggle');
      await clickId(driver, 'keyboardModeToggle');
      expect(await exists(driver, 'key_~')).assertTrue();
      await clickId(driver, 'keyboardModeToggle');
      expect(await exists(driver, 'key_1')).assertTrue();
    })

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYUI_0009
     * @tc.name      testKeyboardUiState0009
     * @tc.desc      Verify the special panel can return to the normal letter panel.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardUiState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      await clickId(driver, 'keyboardModeToggle');
      await clickId(driver, 'keyboardModeToggle');
      expect(await exists(driver, 'key_~')).assertTrue();
      await clickId(driver, 'keyboardModeToggle');
      await clickId(driver, 'keyboardModeToggle');
      expect(await exists(driver, 'key_q')).assertTrue();
    })

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYUI_0010
     * @tc.name      testKeyboardUiState0010
     * @tc.desc      Verify the top menu opens the input method submenu.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardUiState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await clickId(driver, 'keyboardMenu')).assertTrue();
      expect(await exists(driver, 'btnEdit')).assertTrue();
    })

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYUI_0011
     * @tc.name      testKeyboardUiState0011
     * @tc.desc      Verify the edit entry in the submenu opens the cursor edit view.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardUiState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      await clickId(driver, 'keyboardMenu');
      expect(await exists(driver, 'btnEdit')).assertTrue();
      await clickId(driver, 'btnEdit');
      expect(await exists(driver, 'btn_selection')).assertTrue();
      expect(await exists(driver, 'cursor_left')).assertTrue();
      expect(await exists(driver, 'cursor_right')).assertTrue();
    })

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYUI_0012
     * @tc.name      testKeyboardUiState0012
     * @tc.desc      Verify the down button hides the soft keyboard.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testKeyboardUiState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await clickId(driver, 'kikaInputDown')).assertTrue();
      await sleep(500);
      expect(await exists(driver, 'key_q')).assertFalse();
      expect(await exists(driver, 'previewInput')).assertTrue();
    })
  })
}
