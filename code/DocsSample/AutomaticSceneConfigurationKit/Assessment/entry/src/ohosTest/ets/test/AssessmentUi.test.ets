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
import { describe, expect, it } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, ON, On } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_Assessment]';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'Assessment_';
const ABILITY_NAME: string = 'EntryAbility';
const ID_INDEX_TITLE: string = 'assessment_index_title';
const ID_BEGIN_BUTTON: string = 'assessment_begin_button';
const ID_END_BUTTON: string = 'assessment_end_button';
const ID_QUERY_STATE_BUTTON: string = 'assessment_query_state_button';
const ID_QUERY_CONFIG_BUTTON: string = 'assessment_query_config_button';
const ID_BUNDLE_INPUT: string = 'assessment_bundle_input';
const ID_ADD_BUTTON: string = 'assessment_add_button';
const TEST_BUNDLE_NAME: string = 'com.samples.dictionary';
const WAIT_PAGE_MS: number = 1000;
// The entry page is a List, its off-screen ListItem is not created until it is scrolled into the viewport.
const TYPE_PAGE_LIST: string = 'List';
const TYPE_TEXT: string = 'Text';

async function startEntryAbility(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const want: Want = {
    bundleName: abilityDelegatorRegistry.getArguments().bundleName,
    abilityName: ABILITY_NAME
  };
  try {
    await delegator.startAbility(want);
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'startEntryAbility failed, code: %{public}d', err.code);
  }
}

/**
 * Finds a component on the entry page.
 *
 * The page root is a List, so a card that is scrolled out of the viewport has no rendered node and
 * Driver.findComponent returns null for it. In that case the List is scrolled to search the target.
 */
async function findComponent(driver: Driver, on: On): Promise<Component | null> {
  const target: Component | null = await driver.findComponent(on);
  if (target !== null) {
    return target;
  }
  const pageList: Component | null = await driver.findComponent(ON.type(TYPE_PAGE_LIST));
  if (pageList === null) {
    hilog.warn(DOMAIN, TAG, 'findComponent, the page list is not found');
    return null;
  }
  try {
    const scrolled: Component | null = await pageList.scrollSearch(on);
    return scrolled;
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.warn(DOMAIN, TAG, 'findComponent, scrollSearch failed, code: %{public}d', err.code);
    return null;
  }
}

/**
 * Dismisses the soft keyboard that is raised by a TextInput.
 *
 * The keyboard resizes the ability window, which pushes the cards below the input out of the List
 * viewport, so it is closed before any further component is looked up. When the Back key already
 * left the page, the ability is brought back to the foreground.
 */
async function hideSoftKeyboard(driver: Driver): Promise<void> {
  await driver.pressBack();
  await driver.delayMs(WAIT_PAGE_MS);
  const title: Component | null = await driver.findComponent(ON.id(ID_INDEX_TITLE));
  if (title === null) {
    hilog.warn(DOMAIN, TAG, 'hideSoftKeyboard, the entry page is left, restart the ability');
    await startEntryAbility();
    await driver.delayMs(WAIT_PAGE_MS);
  }
}

export default function assessmentUiTest() {
  describe('AssessmentUiTest', () => {
    /**
     * Scenario: launch the sample and check the layout of the entry page.
     * Expectation: the title and the four API buttons are all displayed.
     */
    it(BUNDLE + 'ShowIndexPage_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ShowIndexPage_001, begin');
      await startEntryAbility();
      const driver: Driver = Driver.create();
      await driver.delayMs(WAIT_PAGE_MS);
      const title = await findComponent(driver, ON.id(ID_INDEX_TITLE));
      hilog.info(DOMAIN, TAG, BUNDLE + 'ShowIndexPage_001, assert the title is displayed');
      expect(title !== null).assertTrue();
      const beginButton = await findComponent(driver, ON.id(ID_BEGIN_BUTTON));
      hilog.info(DOMAIN, TAG, BUNDLE + 'ShowIndexPage_001, assert the begin button is displayed');
      expect(beginButton !== null).assertTrue();
      const endButton = await findComponent(driver, ON.id(ID_END_BUTTON));
      hilog.info(DOMAIN, TAG, BUNDLE + 'ShowIndexPage_001, assert the end button is displayed');
      expect(endButton !== null).assertTrue();
      const stateButton = await findComponent(driver, ON.id(ID_QUERY_STATE_BUTTON));
      hilog.info(DOMAIN, TAG, BUNDLE + 'ShowIndexPage_001, assert the isActive button is displayed');
      expect(stateButton !== null).assertTrue();
      const configButton = await findComponent(driver, ON.id(ID_QUERY_CONFIG_BUTTON));
      hilog.info(DOMAIN, TAG, BUNDLE + 'ShowIndexPage_001, assert the getConfiguration button is displayed');
      expect(configButton !== null).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'ShowIndexPage_001, end');
      done();
    });

    /**
     * Scenario: the device is not in assessment mode when the sample starts.
     * Expectation: the begin button is clickable and the end button is disabled.
     */
    it(BUNDLE + 'CheckButtonState_002', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CheckButtonState_002, begin');
      await startEntryAbility();
      const driver: Driver = Driver.create();
      await driver.delayMs(WAIT_PAGE_MS);
      const beginButton = await findComponent(driver, ON.id(ID_BEGIN_BUTTON));
      hilog.info(DOMAIN, TAG, BUNDLE + 'CheckButtonState_002, assert the begin button is found');
      expect(beginButton !== null).assertTrue();
      if (beginButton !== null) {
        const beginEnabled: boolean = await beginButton.isEnabled();
        hilog.info(DOMAIN, TAG, BUNDLE + 'CheckButtonState_002, begin enabled: %{public}s', `${beginEnabled}`);
        expect(beginEnabled).assertTrue();
      }
      const endButton = await findComponent(driver, ON.id(ID_END_BUTTON));
      hilog.info(DOMAIN, TAG, BUNDLE + 'CheckButtonState_002, assert the end button is found');
      expect(endButton !== null).assertTrue();
      if (endButton !== null) {
        const endEnabled: boolean = await endButton.isEnabled();
        hilog.info(DOMAIN, TAG, BUNDLE + 'CheckButtonState_002, end enabled: %{public}s', `${endEnabled}`);
        expect(endEnabled).assertFalse();
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'CheckButtonState_002, end');
      done();
    });

    /**
     * Scenario: add a bundle name to the whitelist of the assessment configuration.
     * Expectation: the new bundle name is displayed in the whitelist.
     */
    it(BUNDLE + 'AddAllowedApp_003', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'AddAllowedApp_003, begin');
      await startEntryAbility();
      const driver: Driver = Driver.create();
      await driver.delayMs(WAIT_PAGE_MS);
      const input = await findComponent(driver, ON.id(ID_BUNDLE_INPUT));
      hilog.info(DOMAIN, TAG, BUNDLE + 'AddAllowedApp_003, assert the input box is found');
      expect(input !== null).assertTrue();
      if (input !== null) {
        await input.inputText(TEST_BUNDLE_NAME);
        await driver.delayMs(WAIT_PAGE_MS);
        await hideSoftKeyboard(driver);
      }
      const addButton = await findComponent(driver, ON.id(ID_ADD_BUTTON));
      hilog.info(DOMAIN, TAG, BUNDLE + 'AddAllowedApp_003, assert the add button is found');
      expect(addButton !== null).assertTrue();
      if (addButton !== null) {
        await addButton.click();
      }
      await driver.delayMs(WAIT_PAGE_MS);
      // The TextInput also carries the typed value, so the whitelist entry is matched by its Text type.
      const addedItem = await findComponent(driver, ON.type(TYPE_TEXT).text(TEST_BUNDLE_NAME));
      hilog.info(DOMAIN, TAG, BUNDLE + 'AddAllowedApp_003, assert the bundle name is in the whitelist');
      expect(addedItem !== null).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'AddAllowedApp_003, end');
      done();
    });

    /**
     * Scenario: click the isActive and getConfiguration buttons on the entry page.
     * Expectation: the page does not crash and the title is still displayed.
     */
    it(BUNDLE + 'QueryStateAndConfig_004', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'QueryStateAndConfig_004, begin');
      await startEntryAbility();
      const driver: Driver = Driver.create();
      await driver.delayMs(WAIT_PAGE_MS);
      const stateButton = await findComponent(driver, ON.id(ID_QUERY_STATE_BUTTON));
      hilog.info(DOMAIN, TAG, BUNDLE + 'QueryStateAndConfig_004, assert the isActive button is found');
      expect(stateButton !== null).assertTrue();
      if (stateButton !== null) {
        await stateButton.click();
      }
      await driver.delayMs(WAIT_PAGE_MS);
      const configButton = await findComponent(driver, ON.id(ID_QUERY_CONFIG_BUTTON));
      hilog.info(DOMAIN, TAG, BUNDLE + 'QueryStateAndConfig_004, assert the getConfiguration button is found');
      expect(configButton !== null).assertTrue();
      if (configButton !== null) {
        await configButton.click();
      }
      await driver.delayMs(WAIT_PAGE_MS);
      const title = await findComponent(driver, ON.id(ID_INDEX_TITLE));
      hilog.info(DOMAIN, TAG, BUNDLE + 'QueryStateAndConfig_004, assert the page is still alive');
      expect(title !== null).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'QueryStateAndConfig_004, end');
      done();
    });
  });
}
