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
const OTHER_IME: string = 'com.example.kikakeyboard';
const TAG: string = 'SimpleKeyboardTest';
const DOMAIN: number = 0xF814;

const LETTER_KEYS: string[] = [
  'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p',
  'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l',
  'z', 'x', 'c', 'v', 'b', 'n', 'm'
];

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

async function startApp(): Promise<Driver> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  return Driver.create();
}

async function hideKeyboard(driver: Driver): Promise<void> {
  const down: Component = await driver.findComponent(ON.id('kikaInputDown'));
  if (down) {
    await down.click();
    await sleep(500);
  }
}

async function ensurePreview(driver: Driver): Promise<boolean> {
  await hideKeyboard(driver);
  if (await driver.findComponent(ON.id('previewInput'))) {
    return true;
  }
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  return (await driver.findComponent(ON.id('previewInput'))) !== undefined;
}

async function safeWait(driver: Driver, id: string, timeout: number): Promise<Component | undefined> {
  try {
    const component: Component = await driver.waitForComponent(ON.id(id), timeout);
    log('found: ' + id);
    return component;
  } catch (error) {
    log('not found: ' + id + ' -> ' + String(error));
    return undefined;
  }
}

async function focusPreview(driver: Driver): Promise<boolean> {
  if (!await ensurePreview(driver)) {
    log('focusPreview: preview page not ready');
    return false;
  }
  const other: Component = await driver.findComponent(ON.id('noneImmersiveInput'));
  if (other) {
    await other.click();
    await sleep(500);
    await hideKeyboard(driver);
  }
  const input: Component | undefined = await safeWait(driver, 'previewInput', 3000);
  if (!input) {
    return false;
  }
  await input.click();
  await sleep(800);
  let keyQ: Component | undefined = await safeWait(driver, 'key_q', 4000);
  if (!keyQ) {
    const toggle: Component = await driver.findComponent(ON.id('keyboardModeToggle'));
    if (toggle) {
      log('focusPreview: keyboard not shown, retry with the mode toggle');
      await toggle.click();
      await sleep(800);
      keyQ = await safeWait(driver, 'key_q', 3000);
    } else {
      log('focusPreview: keyboard not shown and no mode toggle, check whether the IME service is running');
    }
  }
  return keyQ !== undefined;
}

async function ensureIme(): Promise<void> {
  const apiVersion: string = await shell('param get const.ohos.apiversion');
  log('device api version -> ' + apiVersion.trim());
  const software: string = await shell('param get const.product.software.version');
  log('device software version -> ' + software.trim());
  const enable: string = await shell('ime enable ' + IME_ID);
  log('ime enable -> ' + enable.trim());
  const set: string = await shell('ime set ' + IME_ID);
  log('ime set -> ' + set.trim());
  const list: string = await shell('ime -l');
  log('ime -l -> ' + list.trim());
  const current: string = await shell('ime -g');
  log('ime -g -> ' + current.trim());
}

async function clearPreview(driver: Driver): Promise<void> {
  const input: Component = await driver.findComponent(ON.id('previewInput'));
  if (input) {
    await input.clearText();
    await sleep(300);
  }
}

async function getText(driver: Driver, id: string): Promise<string> {
  const component: Component = await driver.findComponent(ON.id(id));
  if (!component) {
    return '';
  }
  return await component.getText();
}

async function clickKey(driver: Driver, id: string): Promise<boolean> {
  let key: Component = await driver.findComponent(ON.id(id));
  if (!key) {
    key = await driver.waitForComponent(ON.id(id), 3000);
  }
  if (!key) {
    return false;
  }
  await key.click();
  return true;
}

export default function simpleKeyboardTest() {
  describe('SimpleKeyboardTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await ensureIme();
      const result: string = await shell(`ime -s ${IME_BUNDLE}`);
      log('ime -s: ' + result);
      await startApp();
      await sleep(800);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      await hideKeyboard(driver);
      expect(await ensurePreview(driver)).assertTrue();
    });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_0100
     * @tc.name      testLaunchAndPreviewUI0001
     * @tc.desc      Launch the preview page and verify all editor controls exist.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testLaunchAndPreviewUI0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = await startApp();
          expect(await ensurePreview(driver)).assertTrue();
          const ids: string[] = ['previewInput', 'customInput', 'immersiveInput', 'noneImmersiveInput'];
          for (let i = 0; i < ids.length; i++) {
            const component: Component = await driver.findComponent(ON.id(ids[i]));
            expect(await component.getId()).assertEqual(ids[i]);
          }
        } catch (err) {
          log('testLaunchAndPreviewUI0001 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_0200
     * @tc.name      testImeListedAndCurrent0002
     * @tc.desc      Verify the keyboard is registered and is the current input method.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testImeListedAndCurrent0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const list: string = await shell('ime -l');
          log('ime -l: ' + list);
          expect(list).assertContain(IME_BUNDLE);
          const current: string = await shell('ime -g');
          log('ime -g: ' + current);
          expect(current).assertContain(IME_BUNDLE);
        } catch (err) {
          log('testImeListedAndCurrent0002 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_0300
     * @tc.name      testKeyboardPanelLayout0003
     * @tc.desc      Focus the editor and verify all letter keys and function keys are present.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testKeyboardPanelLayout0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await focusPreview(driver)).assertTrue();
          for (let i = 0; i < LETTER_KEYS.length; i++) {
            const key: Component = await driver.findComponent(ON.id('key_' + LETTER_KEYS[i]));
            expect(await key.getId()).assertEqual('key_' + LETTER_KEYS[i]);
          }
          const functionKeys: string[] = ['shiftKey', 'deleteKey', 'spaceKey', 'keyboardModeToggle',
            'returnItem', 'keyboardMenu', 'kikaInputDown'];
          for (let i = 0; i < functionKeys.length; i++) {
            const key: Component = await driver.findComponent(ON.id(functionKeys[i]));
            expect(await key.getId()).assertEqual(functionKeys[i]);
          }
        } catch (err) {
          log('testKeyboardPanelLayout0003 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_0400
     * @tc.name      testTypeLowercase0004
     * @tc.desc      Clear the editor, type q/w/e on the keyboard and verify the text.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testTypeLowercase0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await focusPreview(driver)).assertTrue();
          await clearPreview(driver);
          expect(await clickKey(driver, 'key_q')).assertTrue();
          expect(await clickKey(driver, 'key_w')).assertTrue();
          expect(await clickKey(driver, 'key_e')).assertTrue();
          await sleep(500);
          const text: string = await getText(driver, 'previewInput');
          log('lowercase text: ' + text);
          expect(text).assertContain('qwe');
        } catch (err) {
          log('testTypeLowercase0004 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_0500
     * @tc.name      testShiftUppercase0005
     * @tc.desc      Enable shift, press q and verify an uppercase Q is inserted.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testShiftUppercase0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await focusPreview(driver)).assertTrue();
          await clearPreview(driver);
          expect(await clickKey(driver, 'shiftKey')).assertTrue();
          expect(await clickKey(driver, 'key_q')).assertTrue();
          await sleep(500);
          const text: string = await getText(driver, 'previewInput');
          log('shift text: ' + text);
          expect(text).assertContain('Q');
        } catch (err) {
          log('testShiftUppercase0005 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_0600
     * @tc.name      testSpaceKey0006
     * @tc.desc      Type q, space, w and verify the space is inserted.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testSpaceKey0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await focusPreview(driver)).assertTrue();
          await clearPreview(driver);
          expect(await clickKey(driver, 'key_q')).assertTrue();
          expect(await clickKey(driver, 'spaceKey')).assertTrue();
          expect(await clickKey(driver, 'key_w')).assertTrue();
          await sleep(500);
          const text: string = await getText(driver, 'previewInput');
          log('space text: ' + text);
          expect(text).assertContain('q w');
        } catch (err) {
          log('testSpaceKey0006 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_0700
     * @tc.name      testDeleteKey0007
     * @tc.desc      Type qwe, press delete and verify the last character is removed.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testDeleteKey0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await focusPreview(driver)).assertTrue();
          await clearPreview(driver);
          expect(await clickKey(driver, 'key_q')).assertTrue();
          expect(await clickKey(driver, 'key_w')).assertTrue();
          expect(await clickKey(driver, 'key_e')).assertTrue();
          await sleep(400);
          const before: string = await getText(driver, 'previewInput');
          expect(await clickKey(driver, 'deleteKey')).assertTrue();
          await sleep(500);
          const after: string = await getText(driver, 'previewInput');
          log('delete before=' + before + ' after=' + after);
          expect(after === before).assertFalse();
        } catch (err) {
          log('testDeleteKey0007 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_0800
     * @tc.name      testSymbolMenu0008
     * @tc.desc      Open the symbol menu, verify symbol keys and insert the digit 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testSymbolMenu0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await focusPreview(driver)).assertTrue();
          await driver.click(48, 1147);
          await sleep(700);
          const key1: Component = await driver.waitForComponent(ON.id('key_1'), 3000);
          log('symbol key_1 found: ' + (key1 !== undefined));
          expect(await key1.getId()).assertEqual('key_1');
          const symbolKeys: string[] = ['key_@', 'key_!', 'key_#', 'key_?'];
          for (let i = 0; i < symbolKeys.length; i++) {
            const key: Component = await driver.findComponent(ON.id(symbolKeys[i]));
            log(symbolKeys[i] + ' found: ' + (key !== undefined));
            expect(await key.getId()).assertEqual(symbolKeys[i]);
          }
          const clicked1: boolean = await clickKey(driver, 'key_1');
          log('key_1 clicked: ' + clicked1);
          await sleep(500);
          const text: string = await getText(driver, 'previewInput');
          log('symbol text: ' + text);
          expect(text).assertContain('1');
          await driver.click(48, 1147);
          await sleep(400);
        } catch (err) {
          log('testSymbolMenu0008 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_0900
     * @tc.name      testKeyboardMenu0009
     * @tc.desc      Open the keyboard function menu and verify the edit/arrow entries.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testKeyboardMenu0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await focusPreview(driver)).assertTrue();
          expect(await clickKey(driver, 'keyboardMenu')).assertTrue();
          await sleep(600);
          const edit: Component = await driver.waitForComponent(ON.id('btnEdit'), 3000);
          expect(await edit.getId()).assertEqual('btnEdit');
          const arrows: string[] = ['arrow_up', 'arrow_left', 'arrow_right', 'arrow_down'];
          for (let i = 0; i < arrows.length; i++) {
            const key: Component = await driver.findComponent(ON.id(arrows[i]));
            expect(await key.getId()).assertEqual(arrows[i]);
          }
          await clickKey(driver, 'keyboardMenu');
          await sleep(400);
        } catch (err) {
          log('testKeyboardMenu0009 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_1000
     * @tc.name      testHideAndShowKeyboard0010
     * @tc.desc      Hide the keyboard with the down arrow, then refocus and verify it reappears.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHideAndShowKeyboard0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await focusPreview(driver)).assertTrue();
          expect(await clickKey(driver, 'kikaInputDown')).assertTrue();
          await sleep(800);
          const hidden: Component = await driver.findComponent(ON.id('key_q'));
          expect(Boolean(hidden)).assertFalse();
          const input: Component = await driver.waitForComponent(ON.id('previewInput'), 3000);
          expect(await input.getId()).assertEqual('previewInput');
          await input.click();
          const shown: Component = await driver.waitForComponent(ON.id('key_q'), 4000);
          expect(await shown.getId()).assertEqual('key_q');
        } catch (err) {
          log('testHideAndShowKeyboard0010 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_1100
     * @tc.name      testCustomInput0011
     * @tc.desc      Focus the self-drawn editor, type a key and verify its text updates.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCustomInput0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensurePreview(driver)).assertTrue();
          const custom: Component = await driver.waitForComponent(ON.id('customInput'), 3000);
          expect(await custom.getId()).assertEqual('customInput');
          await custom.click();
          await sleep(1000);
          const keyA: Component = await driver.waitForComponent(ON.id('key_a'), 4000);
          expect(await keyA.getId()).assertEqual('key_a');
          await keyA.click();
          await sleep(600);
          const text: string = await getText(driver, 'customInput');
          log('custom input text: ' + text);
          expect(text.length > 0).assertTrue();
        } catch (err) {
          log('testCustomInput0011 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_1200
     * @tc.name      testImmersiveMode0012
     * @tc.desc      Focus the immersive-mode editor and verify the keyboard still appears.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testImmersiveMode0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensurePreview(driver)).assertTrue();
          const input: Component = await driver.waitForComponent(ON.id('immersiveInput'), 3000);
          expect(await input.getId()).assertEqual('immersiveInput');
          await input.click();
          const keyQ: Component = await driver.waitForComponent(ON.id('key_q'), 4000);
          expect(await keyQ.getId()).assertEqual('key_q');
        } catch (err) {
          log('testImmersiveMode0012 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_1300
     * @tc.name      testNonImmersiveMode0013
     * @tc.desc      Focus the non-immersive editor and verify the keyboard still appears.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testNonImmersiveMode0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensurePreview(driver)).assertTrue();
          const input: Component = await driver.waitForComponent(ON.id('noneImmersiveInput'), 3000);
          expect(await input.getId()).assertEqual('noneImmersiveInput');
          await input.click();
          const keyQ: Component = await driver.waitForComponent(ON.id('key_q'), 4000);
          expect(await keyQ.getId()).assertEqual('key_q');
        } catch (err) {
          log('testNonImmersiveMode0013 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_1400
     * @tc.name      testSwitchInputMethod0014
     * @tc.desc      Switch to the reference IME and back, then verify the current IME is restored.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testSwitchInputMethod0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const toOther: string = await shell(`ime -s ${OTHER_IME}`);
          log('switch to other: ' + toOther);
          const otherCurrent: string = await shell('ime -g');
          expect(otherCurrent).assertContain(OTHER_IME);
          const back: string = await shell(`ime -s ${IME_BUNDLE}`);
          log('switch back: ' + back);
          const current: string = await shell('ime -g');
          expect(current).assertContain(IME_BUNDLE);
        } catch (err) {
          log('testSwitchInputMethod0014 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_UI_1500
     * @tc.name      testSelectionMode0015
     * @tc.desc      Enable the selection mode and verify the select-all key appears, then disable it and verify it is hidden.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testSelectionMode0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await focusPreview(driver)).assertTrue();
          expect(await clickKey(driver, 'keyboardMenu')).assertTrue();
          await sleep(600);
          const edit: Component = await driver.waitForComponent(ON.id('btnEdit'), 3000);
          expect(await edit.getId()).assertEqual('btnEdit');
          const left: Component = await driver.waitForComponent(ON.id('cursor_left'), 3000);
          expect(await left.getId()).assertEqual('cursor_left');
          const right: Component = await driver.waitForComponent(ON.id('cursor_right'), 3000);
          expect(await right.getId()).assertEqual('cursor_right');
          const selection: Component = await driver.waitForComponent(ON.id('btn_selection'), 3000);
          expect(await selection.getId()).assertEqual('btn_selection');
          const allBefore: Component = await driver.findComponent(ON.id('cursor_all'));
          if (Boolean(allBefore)) {
            await selection.click();
            await sleep(400);
          }
          const allReset: Component = await driver.findComponent(ON.id('cursor_all'));
          expect(Boolean(allReset)).assertFalse();
          await selection.click();
          await sleep(500);
          const allAfter: Component = await driver.waitForComponent(ON.id('cursor_all'), 3000);
          expect(await allAfter.getId()).assertEqual('cursor_all');
          await allAfter.click();
          await sleep(300);
          await left.click();
          await sleep(200);
          await right.click();
          await sleep(200);
          await selection.click();
          await sleep(500);
          const allGone: Component = await driver.findComponent(ON.id('cursor_all'));
          expect(Boolean(allGone)).assertFalse();
          await clickKey(driver, 'keyboardMenu');
          await sleep(300);
        } catch (err) {
          log('testSelectionMode0015 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
