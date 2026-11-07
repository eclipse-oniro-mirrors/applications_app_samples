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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { describe, expect, it } from '@ohos/hypium';
import { Driver, ON, UiComponent } from '@ohos.UiTest';
import { logger } from '../util/Logger';
import { deviceInfo } from '@kit.BasicServicesKit';

const BUNDLE: string = 'Annotation_';
const BUNDLE_NAME: string = 'com.samples.annotation';
const DELAY_MS: number = 1500;
const AVAILABLE_MIN_API_VERSION: number = 22;
const SUPPRESS_ANNOTATION_SINCE_API_VERSION: number = 23;
const FUTURE_DEMO_API_VERSION: number = 27;
const MOCK_API_VERSION: number = 21;

async function findComponentWithScroll(driver: Driver, id: string): Promise<Object> {
  const matcher = ON.id(id);
  const maxScrollAttempts = 5;
  const scrollDistance = 800;
  
  for (let attempt = 0; attempt < maxScrollAttempts; attempt++) {
    try {
      logger.info(`${BUNDLE}findComponentWithScroll, attempt ${attempt + 1} for ${id}`);
      const component = await driver.findComponent(matcher);
      if (component !== null && component !== undefined) {
        logger.info(`${BUNDLE}findComponentWithScroll, found ${id} on attempt ${attempt + 1}`);
        return component;
      }
      logger.info(`${BUNDLE}findComponentWithScroll, component is null on attempt ${attempt + 1} for ${id}`);
    } catch (e) {
      logger.info(`${BUNDLE}findComponentWithScroll, not found on attempt ${attempt + 1} for ${id}, scrolling down`);
    }
    await driver.swipe(300, 800, 300, 800 - scrollDistance, 5);
    // Reduced delay from 500ms to 100ms to avoid appfreeze (max 1s for 10 attempts)
    await driver.delayMs(100);
  }
  
  for (let attempt = 0; attempt < maxScrollAttempts; attempt++) {
    try {
      logger.info(`${BUNDLE}findComponentWithScroll, scrolling up attempt ${attempt + 1} for ${id}`);
      await driver.swipe(300, 200, 300, 200 + scrollDistance, 5);
      // Reduced delay from 500ms to 100ms to avoid appfreeze
      await driver.delayMs(100);
      const component = await driver.findComponent(matcher);
      if (component !== null && component !== undefined) {
        logger.info(`${BUNDLE}findComponentWithScroll, found ${id} on scroll up attempt ${attempt + 1}`);
        return component;
      }
      logger.info(`${BUNDLE}findComponentWithScroll, component is null on scroll up attempt ${attempt + 1} for ${id}`);
    } catch (e) {
      logger.info(`${BUNDLE}findComponentWithScroll, still not found on scroll up attempt ${attempt + 1} for ${id}`);
    }
  }
  
  throw new Error(`Component with id '${id}' not found after all scroll attempts`);
}

async function getComponentText(driver: Driver, id: string): Promise<string> {
  const component: Object = await findComponentWithScroll(driver, id);
  if (component === null || component === undefined) {
    throw new Error(`Component with id '${id}' is null or undefined`);
  }
  const uiComponent = component as UiComponent;
  const text = await uiComponent.getText();
  logger.info(`${BUNDLE}getComponentText, ${id} text: ${text}`);
  return text;
}

export default function abilityTest() {
  const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let driver: Driver;
  const resourceManager = delegator.getAppContext().resourceManager;

  // Helper function to get or create driver with error handling
  const getDriver = (): Driver => {
    if (!driver) {
      try {
        driver = Driver.create();
        logger.info(`${BUNDLE}Driver created successfully`);
      } catch (e) {
        logger.error(`${BUNDLE}Failed to create Driver: ${e}`);
        throw new Error(`Cannot create Driver: ${e}`);
      }
    }
    return driver;
  };

  describe('AnnotationAbilityTest', () => {
    /**
     * @tc.number SUB_ANNOTATION_ABILITY_0100
     * @tc.name testStartAbility0001
     * @tc.desc Start EntryAbility and verify that the Annotation home page is displayed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testStartAbility0001', 0, async (done: Function) => {
      logger.info(`${BUNDLE}StartAbility_0001, begin`);
      const testDriver = getDriver();
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await testDriver.delayMs(DELAY_MS);
      logger.info(`${BUNDLE}StartAbility_0001, assert annotation_title exists`);
      await testDriver.assertComponentExist(ON.id('annotation_title'));
      const component = await testDriver.findComponent(ON.id('annotation_title'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(want.bundleName).assertEqual(BUNDLE_NAME);
      expect(want.abilityName).assertEqual('EntryAbility');
      logger.info(`${BUNDLE}StartAbility_0001, end`);
      done();
    });

    /**
     * @tc.number SUB_ANNOTATION_ABILITY_0200
     * @tc.name testEnvironment0002
     * @tc.desc Verify environment details, annotation versions, rules, and initial execution states.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEnvironment0002', 0, async (done: Function) => {
      logger.info(`${BUNDLE}Environment_0002, begin`);
      const testDriver = getDriver();
      const componentIds: string[] = [
        'annotation_environment_card',
        'api_version_value',
        'available_card',
        'available_min_api',
        'available_status',
        'suppress_card',
        'suppress_annotation_since',
        'suppress_demo_api',
        'suppression_rules',
        'suppress_status'
      ];
      for (const id of componentIds) {
        logger.info(`${BUNDLE}Environment_0002, assert ${id} exists`);
        await findComponentWithScroll(testDriver, id);
      }
      const apiVersion = Number(await getComponentText(testDriver, 'api_version_value'));
      const rules = await getComponentText(testDriver, 'suppression_rules');
      logger.info(`${BUNDLE}Environment_0002, assert local API version ${apiVersion} is valid`);
      expect(apiVersion > 0).assertTrue();
      expect(typeof apiVersion).assertEqual('number');
      expect(apiVersion).assertEqual(deviceInfo.sdkApiVersion);
      logger.info(`${BUNDLE}Environment_0002, assert annotation since API is ${SUPPRESS_ANNOTATION_SINCE_API_VERSION}`);
      expect(await getComponentText(testDriver, 'suppress_annotation_since'))
        .assertEqual(SUPPRESS_ANNOTATION_SINCE_API_VERSION.toString());
      logger.info(`${BUNDLE}Environment_0002, assert demo function API is ${FUTURE_DEMO_API_VERSION}`);
      expect(await getComponentText(testDriver, 'suppress_demo_api')).assertEqual(FUTURE_DEMO_API_VERSION.toString());
      for (const rule of ['compatibility', 'syscap', 'permission']) {
        logger.info(`${BUNDLE}Environment_0002, assert rule ${rule} is displayed`);
        expect(rules.includes(rule)).assertTrue();
      }
      const notRun = await resourceManager.getStringByName('not_run');
      logger.info(`${BUNDLE}Environment_0002, assert Available minimum API is 22`);
      expect(await getComponentText(testDriver, 'available_min_api')).assertEqual(AVAILABLE_MIN_API_VERSION.toString());
      logger.info(`${BUNDLE}Environment_0002, assert Available example has not run`);
      expect(await getComponentText(testDriver, 'available_status')).assertEqual(notRun);
      logger.info(`${BUNDLE}Environment_0002, assert SuppressWarnings example has not run`);
      expect(await getComponentText(testDriver, 'suppress_status')).assertEqual(notRun);
      logger.info(`${BUNDLE}Environment_0002, end`);
      done();
    });

    /**
     * @tc.number SUB_ANNOTATION_ABILITY_0300
     * @tc.name testMockData0003
     * @tc.desc Switch to the API 21 mock environment and verify that both execution states reset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockData0003', 0, async (done: Function) => {
      logger.info(`${BUNDLE}MockData_0003, begin`);
      const mockButton = await driver.findComponent(ON.id('mock_data_button'));
      await mockButton.click();
      await driver.delayMs(DELAY_MS);
      const source = await getComponentText(driver, 'data_source_text');
      const apiVersion = await getComponentText(driver, 'api_version_value');
      const mockSource = await resourceManager.getStringByName('mock_data');
      const notRun = await resourceManager.getStringByName('not_run');
      logger.info(`${BUNDLE}MockData_0003, assert mock source ${source} is displayed`);
      expect(source).assertEqual(mockSource);
      expect(typeof source).assertEqual('string');
      expect(source.length > 0).assertTrue();
      logger.info(`${BUNDLE}MockData_0003, assert mock API version is ${MOCK_API_VERSION}`);
      expect(apiVersion).assertEqual(MOCK_API_VERSION.toString());
      logger.info(`${BUNDLE}MockData_0003, assert Available demo is reset`);
      expect(await getComponentText(driver, 'available_status')).assertEqual(notRun);
      logger.info(`${BUNDLE}MockData_0003, assert SuppressWarnings demo is reset`);
      expect(await getComponentText(driver, 'suppress_status')).assertEqual(notRun);
      logger.info(`${BUNDLE}MockData_0003, end`);
      done();
    });

    /**
     * @tc.number SUB_ANNOTATION_ABILITY_0400
     * @tc.name testMockFallback0004
     * @tc.desc Verify API 21 fallback and refresh behavior for both annotation examples.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMockFallback0004', 0, async (done: Function) => {
      logger.info(`${BUNDLE}MockFallback_0004, begin`);
      const availableButton = await driver.findComponent(ON.id('available_run_button'));
      const suppressButton = await driver.findComponent(ON.id('suppress_run_button'));
      await availableButton.click();
      await suppressButton.click();
      await driver.delayMs(DELAY_MS);
      const fallback = await resourceManager.getStringByName('fallback');
      const notRun = await resourceManager.getStringByName('not_run');
      logger.info(`${BUNDLE}MockFallback_0004, assert Available demo falls back on API 21`);
      expect(await getComponentText(driver, 'available_status')).assertEqual(fallback);
      expect(typeof fallback).assertEqual('string');
      expect(fallback.length > 0).assertTrue();
      logger.info(`${BUNDLE}MockFallback_0004, assert SuppressWarnings demo falls back on API 21`);
      expect(await getComponentText(driver, 'suppress_status')).assertEqual(fallback);
      const refreshButton = await driver.findComponent(ON.id('refresh_button'));
      await refreshButton.click();
      await driver.delayMs(DELAY_MS);
      logger.info(`${BUNDLE}MockFallback_0004, assert refresh resets Available demo`);
      expect(await getComponentText(driver, 'available_status')).assertEqual(notRun);
      logger.info(`${BUNDLE}MockFallback_0004, assert refresh resets SuppressWarnings demo`);
      expect(await getComponentText(driver, 'suppress_status')).assertEqual(notRun);
      logger.info(`${BUNDLE}MockFallback_0004, end`);
      done();
    });

    /**
     * @tc.number SUB_ANNOTATION_ABILITY_0500
     * @tc.name testLocalData0005
     * @tc.desc Verify that local execution results match the device API version thresholds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testLocalData0005', 0, async (done: Function) => {
      logger.info(`${BUNDLE}LocalData_0005, begin`);
      const localButton = await driver.findComponent(ON.id('local_data_button'));
      await localButton.click();
      await driver.delayMs(DELAY_MS);
      const source = await getComponentText(driver, 'data_source_text');
      const apiVersion = Number(await getComponentText(driver, 'api_version_value'));
      const localSource = await resourceManager.getStringByName('local_data');
      const executed = await resourceManager.getStringByName('executed');
      const fallback = await resourceManager.getStringByName('fallback');
      logger.info(`${BUNDLE}LocalData_0005, assert local source ${source} is displayed`);
      expect(source).assertEqual(localSource);
      expect(typeof source).assertEqual('string');
      expect(source.length > 0).assertTrue();
      const availableButton = await driver.findComponent(ON.id('available_run_button'));
      const suppressButton = await driver.findComponent(ON.id('suppress_run_button'));
      await availableButton.click();
      await suppressButton.click();
      await driver.delayMs(DELAY_MS);
      const expectedAvailable = apiVersion >= AVAILABLE_MIN_API_VERSION ? executed : fallback;
      const expectedSuppress = apiVersion >= FUTURE_DEMO_API_VERSION ? executed : fallback;
      logger.info(`${BUNDLE}LocalData_0005, assert Available result matches API ${apiVersion}`);
      expect(await getComponentText(driver, 'available_status')).assertEqual(expectedAvailable);
      logger.info(`${BUNDLE}LocalData_0005, assert SuppressWarnings result matches API ${apiVersion}`);
      expect(await getComponentText(driver, 'suppress_status')).assertEqual(expectedSuppress);
      logger.info(`${BUNDLE}LocalData_0005, end`);
      done();
    });

    /**
     * @tc.number SUB_ANNOTATION_ABILITY_0600
     * @tc.name testRepeatedExecution0006
     * @tc.desc Verify repeated example execution and independent Available and SuppressWarnings states.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRepeatedExecution0006', 0, async (done: Function) => {
      logger.info(`${BUNDLE}RepeatedExecution_0006, begin`);
      const localButton = await driver.findComponent(ON.id('local_data_button'));
      await localButton.click();
      await driver.delayMs(DELAY_MS);
      const apiVersion = Number(await getComponentText(driver, 'api_version_value'));
      const executed = await resourceManager.getStringByName('executed');
      const fallback = await resourceManager.getStringByName('fallback');
      const notRun = await resourceManager.getStringByName('not_run');
      const expectedAvailable = apiVersion >= AVAILABLE_MIN_API_VERSION ? executed : fallback;
      const expectedSuppress = apiVersion >= FUTURE_DEMO_API_VERSION ? executed : fallback;
      const availableButton = await driver.findComponent(ON.id('available_run_button'));
      const suppressButton = await driver.findComponent(ON.id('suppress_run_button'));
      await availableButton.click();
      await driver.delayMs(DELAY_MS);
      logger.info(`${BUNDLE}RepeatedExecution_0006, assert first Available result`);
      expect(await getComponentText(driver, 'available_status')).assertEqual(expectedAvailable);
      expect(typeof expectedAvailable).assertEqual('string');
      expect(expectedAvailable === executed || expectedAvailable === fallback).assertTrue();
      logger.info(`${BUNDLE}RepeatedExecution_0006, assert SuppressWarnings remains independent`);
      expect(await getComponentText(driver, 'suppress_status')).assertEqual(notRun);
      await availableButton.click();
      await suppressButton.click();
      await suppressButton.click();
      await driver.delayMs(DELAY_MS);
      logger.info(`${BUNDLE}RepeatedExecution_0006, assert repeated Available result`);
      expect(await getComponentText(driver, 'available_status')).assertEqual(expectedAvailable);
      logger.info(`${BUNDLE}RepeatedExecution_0006, assert repeated SuppressWarnings result`);
      expect(await getComponentText(driver, 'suppress_status')).assertEqual(expectedSuppress);
      logger.info(`${BUNDLE}RepeatedExecution_0006, end`);
      done();
    });

    /**
     * @tc.number SUB_ANNOTATION_ABILITY_0700
     * @tc.name testEnvironmentSwitch0007
     * @tc.desc Verify that switching local and mock environments resets prior execution results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEnvironmentSwitch0007', 0, async (done: Function) => {
      logger.info(`${BUNDLE}EnvironmentSwitch_0007, begin`);
      const mockButton = await driver.findComponent(ON.id('mock_data_button'));
      const localButton = await driver.findComponent(ON.id('local_data_button'));
      const notRun = await resourceManager.getStringByName('not_run');
      const mockSource = await resourceManager.getStringByName('mock_data');
      const localSource = await resourceManager.getStringByName('local_data');
      await mockButton.click();
      await driver.delayMs(DELAY_MS);
      logger.info(`${BUNDLE}EnvironmentSwitch_0007, assert mock source is selected`);
      expect(await getComponentText(driver, 'data_source_text')).assertEqual(mockSource);
      expect(typeof mockSource).assertEqual('string');
      expect(mockSource.length > 0).assertTrue();
      logger.info(`${BUNDLE}EnvironmentSwitch_0007, assert mock API version is 21`);
      expect(await getComponentText(driver, 'api_version_value')).assertEqual(MOCK_API_VERSION.toString());
      logger.info(`${BUNDLE}EnvironmentSwitch_0007, assert mock switch resets Available result`);
      expect(await getComponentText(driver, 'available_status')).assertEqual(notRun);
      logger.info(`${BUNDLE}EnvironmentSwitch_0007, assert mock switch resets SuppressWarnings result`);
      expect(await getComponentText(driver, 'suppress_status')).assertEqual(notRun);
      await localButton.click();
      await driver.delayMs(DELAY_MS);
      logger.info(`${BUNDLE}EnvironmentSwitch_0007, assert local source is selected`);
      expect(await getComponentText(driver, 'data_source_text')).assertEqual(localSource);
      logger.info(`${BUNDLE}EnvironmentSwitch_0007, assert local switch resets Available result`);
      expect(await getComponentText(driver, 'available_status')).assertEqual(notRun);
      logger.info(`${BUNDLE}EnvironmentSwitch_0007, assert local switch resets SuppressWarnings result`);
      expect(await getComponentText(driver, 'suppress_status')).assertEqual(notRun);
      logger.info(`${BUNDLE}EnvironmentSwitch_0007, end`);
      done();
    });

    /**
     * @tc.number SUB_ANNOTATION_ABILITY_0800
     * @tc.name testRefreshMock0008
     * @tc.desc Verify that refresh resets execution results without leaving the mock environment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRefreshMock0008', 0, async (done: Function) => {
      logger.info(`${BUNDLE}RefreshMock_0008, begin`);
      const mockButton = await driver.findComponent(ON.id('mock_data_button'));
      const availableButton = await driver.findComponent(ON.id('available_run_button'));
      const refreshButton = await driver.findComponent(ON.id('refresh_button'));
      const notRun = await resourceManager.getStringByName('not_run');
      const mockSource = await resourceManager.getStringByName('mock_data');
      await mockButton.click();
      await driver.delayMs(DELAY_MS);
      await availableButton.click();
      await driver.delayMs(DELAY_MS);
      await refreshButton.click();
      await driver.delayMs(DELAY_MS);
      logger.info(`${BUNDLE}RefreshMock_0008, assert refresh retains mock source`);
      expect(await getComponentText(driver, 'data_source_text')).assertEqual(mockSource);
      expect(typeof mockSource).assertEqual('string');
      expect(mockSource.length > 0).assertTrue();
      logger.info(`${BUNDLE}RefreshMock_0008, assert refresh retains mock API 21`);
      expect(await getComponentText(driver, 'api_version_value')).assertEqual(MOCK_API_VERSION.toString());
      logger.info(`${BUNDLE}RefreshMock_0008, assert refresh resets Available result`);
      expect(await getComponentText(driver, 'available_status')).assertEqual(notRun);
      logger.info(`${BUNDLE}RefreshMock_0008, assert refresh resets SuppressWarnings result`);
      expect(await getComponentText(driver, 'suppress_status')).assertEqual(notRun);
      logger.info(`${BUNDLE}RefreshMock_0008, end`);
      done();
    });
  });
}
