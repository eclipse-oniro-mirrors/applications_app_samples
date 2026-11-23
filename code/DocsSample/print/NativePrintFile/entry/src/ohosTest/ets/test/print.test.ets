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

import { beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, ON, On } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'NativePrintFile';
const TAG: string = `[Sample_${BUNDLE}]`;
const DOMAIN: number = 0xF811;
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
let want: Want;
let plainPaperLabel: string = '';
let photoPaperLabel: string = '';

async function waitForComponentGone(driver: Driver, selector: On): Promise<void> {
  try {
    for (let attempt: number = 0; attempt < 50; attempt++) {
      const components: Component[] = await driver.findComponents(selector);
      if (components === null || components === undefined || components.length === 0) {
        return;
      }
      await driver.delayMs(100);
    }
    const remaining: Component[] = await driver.findComponents(selector);
    const remainingCount: number = remaining === null || remaining === undefined ? 0 : remaining.length;
    hilog.info(DOMAIN, TAG, 'waitForComponentGone, remaining=%{public}d', remainingCount);
    expect(remainingCount).assertEqual(0);
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'waitForComponentGone failed: %{public}s', JSON.stringify(error));
    throw new Error('waitForComponentGone failed: ' + JSON.stringify(error));
  }
}

export default function PrintTest(): void {
  describe(BUNDLE, () => {
    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, '%{public}s_Setup, begin', BUNDLE);
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      const monitor: abilityDelegatorRegistry.AbilityMonitor = { abilityName: 'EntryAbility' };
      await delegator.addAbilityMonitor(monitor);
      let ability: UIAbility;
      try {
        await delegator.startAbility(want);
        ability = await delegator.waitAbilityMonitor(monitor, 10000);
      } finally {
        await delegator.removeAbilityMonitor(monitor);
      }
      const driver: Driver = Driver.create();
      await driver.waitForComponent(ON.id('main_scroll'), 10000);
      hilog.info(DOMAIN, TAG, '%{public}s_Setup, ability=%{public}s', BUNDLE, ability.context.abilityInfo.name);
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      plainPaperLabel = ability.context.resourceManager.getStringByNameSync('media_type_plain');
      photoPaperLabel = ability.context.resourceManager.getStringByNameSync('media_type_photo');
      hilog.info(DOMAIN, TAG, '%{public}s_Setup, end', BUNDLE);
    });

    beforeEach(async () => {
      const driver: Driver = Driver.create();
      const scroll: Component = await driver.findComponent(ON.id('main_scroll'));
      await scroll.scrollToTop();
    });

    /** Verify the main controls and opening/closing the printer selection dialog without selecting a printer. */
    it(`${BUNDLE}_ControlsAndDialog_001`, 0, async () => {
      const testName: string = `${BUNDLE}_ControlsAndDialog_001`;
      hilog.info(DOMAIN, TAG, '%{public}s, begin', testName);
      try {
        const driver: Driver = Driver.create();
        const scroll: Component = await driver.findComponent(ON.id('main_scroll'));
        const controlIds: string[] = ['file_jpeg', 'file_pdf', 'printer_select', 'add_printer',
          'print_preview', 'print_direct', 'print_callback'];
        for (const id of controlIds) {
          const control: Component = await scroll.scrollSearch(ON.id(id));
          hilog.info(DOMAIN, TAG, '%{public}s, id=%{public}s, found=%{public}s', testName, id,
            (control !== null && control !== undefined).toString());
          expect(control !== null && control !== undefined).assertTrue();
        }
        const addPrinter: Component = await scroll.scrollSearch(ON.id('add_printer'));
        await addPrinter.click();
        hilog.info(DOMAIN, TAG, '%{public}s, expected dialog id=printer_dialog', testName);
        await driver.waitForComponent(ON.id('printer_dialog'), 5000);
        await driver.assertComponentExist(ON.id('printer_dialog'));
        const cancel: Component = await driver.findComponent(ON.id('printer_dialog_cancel'));
        await cancel.click();
        await waitForComponentGone(driver, ON.id('printer_dialog'));
        const remainingDialogs: Component[] = await driver.findComponents(ON.id('printer_dialog'));
        const dialogCount: number = remainingDialogs === null || remainingDialogs === undefined ? 0 :
          remainingDialogs.length;
        hilog.info(DOMAIN, TAG, '%{public}s, remainingDialogs=%{public}d', testName, dialogCount);
        expect(dialogCount).assertEqual(0);
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s, end', testName);
      }
    });

    /** Switch to the bundled PDF and check that the selected file is shown on the page. */
    it(`${BUNDLE}_FileSelection_002`, 0, async () => {
      const testName: string = `${BUNDLE}_FileSelection_002`;
      hilog.info(DOMAIN, TAG, '%{public}s, begin', testName);
      try {
        const driver: Driver = Driver.create();
        const pdfButton: Component = await driver.findComponent(ON.id('file_pdf'));
        await pdfButton.click();
        const fileStatus: Component = await driver.findComponent(ON.id('file_status'));
        const fileName: string = await fileStatus.getText();
        hilog.info(DOMAIN, TAG, '%{public}s, selectedFile=%{public}s', testName, fileName);
        expect(fileName).assertContain('printDemo.pdf');
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s, end', testName);
      }
    });

    /** Check copies, both paper types, and all four disabled zero margins when borderless printing is enabled. */
    it(`${BUNDLE}_PrintSettings_003`, 0, async () => {
      const testName: string = `${BUNDLE}_PrintSettings_003`;
      hilog.info(DOMAIN, TAG, '%{public}s, begin', testName);
      try {
        const driver: Driver = Driver.create();
        const scroll: Component = await driver.findComponent(ON.id('main_scroll'));
        const addButton: Component = await scroll.scrollSearch(ON.id('copy_add'));
        await addButton.click();
        const copyValue: Component = await driver.findComponent(ON.id('copy_value'));
        const copies: string = await copyValue.getText();
        hilog.info(DOMAIN, TAG, '%{public}s, copies=%{public}s', testName, copies);
        expect(copies).assertEqual('2');
        const subtractButton: Component = await driver.findComponent(ON.id('copy_subtract'));
        await subtractButton.click();

        for (const paperLabel of [photoPaperLabel, plainPaperLabel]) {
          const paperSelect: Component = await scroll.scrollSearch(ON.id('media_type_select'));
          await paperSelect.click();
          const paperOption: Component = await driver.waitForComponent(ON.text(paperLabel).type('Option'), 5000);
          await paperOption.click();
          await waitForComponentGone(driver, ON.type('Option'));
          const selectedPaper: Component = await driver.findComponent(ON.id('media_type_select'));
          const paperText: string = await selectedPaper.getText();
          hilog.info(DOMAIN, TAG, '%{public}s, paper=%{public}s, expected=%{public}s',
            testName, paperText, paperLabel);
          expect(paperText).assertEqual(paperLabel);
        }

        const borderlessSwitch: Component = await scroll.scrollSearch(ON.id('borderless_switch'));
        await borderlessSwitch.click();
        await driver.waitForIdle(500, 5000);
        const marginIds: string[] = ['margin_left', 'margin_top', 'margin_right', 'margin_bottom'];
        for (const id of marginIds) {
          const margin: Component = await scroll.scrollSearch(ON.id(id));
          const value: string = await margin.getText();
          hilog.info(DOMAIN, TAG, '%{public}s, id=%{public}s, value=%{public}s', testName, id, value);
          expect(value).assertEqual('0');
          const enabled: boolean = await margin.isEnabled();
          hilog.info(DOMAIN, TAG, '%{public}s, id=%{public}s, enabled=%{public}s', testName, id,
            enabled.toString());
          expect(enabled).assertFalse();
        }
        const resetBorderless: Component = await scroll.scrollSearch(ON.id('borderless_switch'));
        await resetBorderless.click();
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s, end', testName);
      }
    });

    /** Without selecting a printer, direct printing must fail safely with the invalid-printer error. */
    it(`${BUNDLE}_NoPrinter_004`, 0, async () => {
      const testName: string = `${BUNDLE}_NoPrinter_004`;
      hilog.info(DOMAIN, TAG, '%{public}s, begin', testName);
      try {
        const driver: Driver = Driver.create();
        const scroll: Component = await driver.findComponent(ON.id('main_scroll'));
        const directButton: Component = await scroll.scrollSearch(ON.id('print_direct'));
        await directButton.click();
        const resultText: Component = await scroll.scrollSearch(ON.id('operation_result'));
        const result: string = await resultText.getText();
        hilog.info(DOMAIN, TAG, '%{public}s, result=%{public}s', testName, result);
        expect(result).assertContain('24300005');
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s, end', testName);
      }
    });
  });
}
