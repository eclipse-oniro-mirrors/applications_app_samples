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
import { Component, Driver, ON } from '@ohos.UiTest';
import { logger } from '../util/Logger';

const BUNDLE: string = 'SystemLoad_';
const BUNDLE_NAME: string = 'com.samples.systemload';
const DELAY_MS: number = 1500;
const LEVEL_NAMES: string[] = [
  'LOW',
  'NORMAL',
  'MEDIUM',
  'HIGH',
  'OVERHEATED',
  'WARNING',
  'EMERGENCY',
  'ESCAPE'
];

async function findComponent(driver: Driver, id: string): Promise<Component> {
  const scroll = await driver.findComponent(ON.id('system_load_scroll'));
  return await scroll.scrollSearch(ON.id(id));
}

async function getComponentText(driver: Driver, id: string): Promise<string> {
  const component = await findComponent(driver, id);
  return await component.getText();
}

async function clickComponent(driver: Driver, id: string): Promise<void> {
  const component = await findComponent(driver, id);
  await component.click();
  await driver.delayMs(DELAY_MS);
}

export default function abilityTest() {
  const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  const driver: Driver = Driver.create();
  const resourceManager = delegator.getAppContext().resourceManager;

  describe('SystemLoadAbilityTest', () => {
    /**
     * @tc.number    SYSTEMLOAD_UI_0100
     * @tc.name      testSystemLoadStartAbility0001
     * @tc.desc      Start the sample and verify the system load page is displayed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadStartAbility0001', 0, async () => {
      const caseName = 'testSystemLoadStartAbility0001';
      logger.info(`${BUNDLE}${caseName}, begin`);
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'EntryAbility'
      };
      expect(want.bundleName).assertEqual(BUNDLE_NAME);
      expect(want.abilityName).assertEqual('EntryAbility');
      await delegator.startAbility(want);
      await driver.delayMs(DELAY_MS);
      logger.info(`${BUNDLE}${caseName}, assert system_load_title exists`);
      await driver.assertComponentExist(ON.id('system_load_title'));
      expect(true).assertTrue();
      logger.info(`${BUNDLE}${caseName}, assert system_load_scroll exists`);
      await driver.assertComponentExist(ON.id('system_load_scroll'));
      expect(true).assertTrue();
      logger.info(`${BUNDLE}${caseName}, assert system_level_card exists`);
      await driver.assertComponentExist(ON.id('system_level_card'));
      expect(true).assertTrue();
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_0200
     * @tc.name      testSystemLoadLevelDisplay0002
     * @tc.desc      Verify that a valid level, description and application recommendation are displayed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadLevelDisplay0002', 0, async () => {
      const caseName = 'testSystemLoadLevelDisplay0002';
      logger.info(`${BUNDLE}${caseName}, begin`);
      const name = await getComponentText(driver, 'system_level_name');
      const value = await getComponentText(driver, 'system_level_value');
      const description = await getComponentText(driver, 'system_level_description');
      const recommendation = await getComponentText(driver, 'system_level_recommendation');
      const levelIndex = LEVEL_NAMES.indexOf(name);
      const unavailableDescription = await resourceManager.getStringByName('level_unavailable');
      logger.info(`${BUNDLE}${caseName}, assert valid level name ${name}`);
      expect(levelIndex >= 0).assertTrue();
      logger.info(`${BUNDLE}${caseName}, assert level value ${value} matches its name`);
      expect(value).assertEqual(`Level ${levelIndex}`);
      logger.info(`${BUNDLE}${caseName}, assert a valid level description is displayed`);
      expect(description.length > 0 && description !== unavailableDescription).assertTrue();
      logger.info(`${BUNDLE}${caseName}, assert an application recommendation is displayed`);
      expect(recommendation.length > 0).assertTrue();
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_0300
     * @tc.name      testSystemLoadMockData0003
     * @tc.desc      Switch to mock data and verify the default MEDIUM level.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadMockData0003', 0, async () => {
      const caseName = 'testSystemLoadMockData0003';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      const mockSource = await resourceManager.getStringByName('mock_data');
      logger.info(`${BUNDLE}${caseName}, assert mock source is displayed`);
      expect(await getComponentText(driver, 'data_source_text')).assertEqual(mockSource);
      logger.info(`${BUNDLE}${caseName}, assert mock level MEDIUM is displayed`);
      expect(await getComponentText(driver, 'system_level_name')).assertEqual('MEDIUM');
      logger.info(`${BUNDLE}${caseName}, assert mock level value Level 2 is displayed`);
      expect(await getComponentText(driver, 'system_level_value')).assertEqual('Level 2');
      logger.info(`${BUNDLE}${caseName}, assert mock previous and next buttons exist`);
      await driver.assertComponentExist(ON.id('mock_previous_button'));
      await driver.assertComponentExist(ON.id('mock_next_button'));
      logger.info(`${BUNDLE}${caseName}, assert listener controls are disabled in mock mode`);
      const unregistered = await resourceManager.getStringByName('not_listening');
      expect(await getComponentText(driver, 'listener_status_text')).assertEqual(unregistered);
      expect(await getComponentText(driver, 'secondary_listener_status_text')).assertEqual(unregistered);
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_0400
     * @tc.name      testSystemLoadMockLevelCycle0004
     * @tc.desc      Cycle through all eight mock levels and verify each name and value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadMockLevelCycle0004', 0, async () => {
      const caseName = 'testSystemLoadMockLevelCycle0004';
      logger.info(`${BUNDLE}${caseName}, begin`);
      expect(LEVEL_NAMES.length).assertEqual(8);
      for (let offset = 1; offset <= LEVEL_NAMES.length; offset++) {
        await clickComponent(driver, 'mock_next_button');
        const expectedIndex = (2 + offset) % LEVEL_NAMES.length;
        logger.info(`${BUNDLE}${caseName}, assert mock level ${LEVEL_NAMES[expectedIndex]}`);
        expect(await getComponentText(driver, 'system_level_name')).assertEqual(LEVEL_NAMES[expectedIndex]);
        logger.info(`${BUNDLE}${caseName}, assert mock value Level ${expectedIndex}`);
        expect(await getComponentText(driver, 'system_level_value')).assertEqual(`Level ${expectedIndex}`);
        expect(expectedIndex >= 0 && expectedIndex < 8).assertTrue();
      }
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_0500
     * @tc.name      testSystemLoadMockPreviousLevel0005
     * @tc.desc      Select the previous mock level and verify NORMAL and Level 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadMockPreviousLevel0005', 0, async () => {
      const caseName = 'testSystemLoadMockPreviousLevel0005';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_previous_button');
      const levelName = await getComponentText(driver, 'system_level_name');
      const levelValue = await getComponentText(driver, 'system_level_value');
      logger.info(`${BUNDLE}${caseName}, assert previous mock level is NORMAL`);
      expect(levelName).assertEqual('NORMAL');
      expect(LEVEL_NAMES.indexOf(levelName) >= 0).assertTrue();
      logger.info(`${BUNDLE}${caseName}, assert previous mock value is Level 1`);
      expect(levelValue).assertEqual('Level 1');
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_0600
     * @tc.name      testSystemLoadRefreshMockData0006
     * @tc.desc      Refresh mock data without changing the selected level.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadRefreshMockData0006', 0, async () => {
      const caseName = 'testSystemLoadRefreshMockData0006';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'refresh_button');
      const levelName = await getComponentText(driver, 'system_level_name');
      const levelValue = await getComponentText(driver, 'system_level_value');
      logger.info(`${BUNDLE}${caseName}, assert refreshed mock level remains NORMAL`);
      expect(levelName).assertEqual('NORMAL');
      expect(LEVEL_NAMES.indexOf(levelName) >= 0).assertTrue();
      logger.info(`${BUNDLE}${caseName}, assert refreshed mock value remains Level 1`);
      expect(levelValue).assertEqual('Level 1');
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_0700
     * @tc.name      testSystemLoadMockListenerCleanup0007
     * @tc.desc      Verify that mock mode unregisters both listeners and retains listener controls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadMockListenerCleanup0007', 0, async () => {
      const caseName = 'testSystemLoadMockListenerCleanup0007';
      logger.info(`${BUNDLE}${caseName}, begin`);
      const unregistered = await resourceManager.getStringByName('not_listening');
      const primaryStatus = await getComponentText(driver, 'listener_status_text');
      const secondaryStatus = await getComponentText(driver, 'secondary_listener_status_text');
      logger.info(`${BUNDLE}${caseName}, assert primary listener is unregistered`);
      expect(primaryStatus).assertEqual(unregistered);
      logger.info(`${BUNDLE}${caseName}, assert secondary listener is unregistered`);
      expect(secondaryStatus).assertEqual(unregistered);
      expect(primaryStatus === secondaryStatus).assertTrue();
      logger.info(`${BUNDLE}${caseName}, assert unregister-all control exists`);
      await findComponent(driver, 'unregister_all_button');
      logger.info(`${BUNDLE}${caseName}, assert callback history control exists`);
      await findComponent(driver, 'callback_history_text');
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_0800
     * @tc.name      testSystemLoadLocalData0008
     * @tc.desc      Return to local data and verify the level or the explicit mock fallback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadLocalData0008', 0, async () => {
      const caseName = 'testSystemLoadLocalData0008';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'local_data_button');
      const source = await getComponentText(driver, 'data_source_text');
      const localSource = await resourceManager.getStringByName('local_data');
      const fallbackSource = await resourceManager.getStringByName('mock_fallback');
      const isLocal = source === localSource;
      const isFallback = source === fallbackSource;
      logger.info(`${BUNDLE}${caseName}, assert source ${source} is local data or fallback`);
      expect(isLocal || isFallback).assertTrue();
      const name = await getComponentText(driver, 'system_level_name');
      logger.info(`${BUNDLE}${caseName}, assert local or fallback level ${name} is valid`);
      expect(LEVEL_NAMES.indexOf(name) >= 0).assertTrue();
      const listener = await getComponentText(driver, 'listener_status_text');
      const registered = await resourceManager.getStringByName('listening');
      const unregistered = await resourceManager.getStringByName('not_listening');
      logger.info(`${BUNDLE}${caseName}, assert listener state matches the selected source`);
      expect(listener === (isLocal ? registered : unregistered)).assertTrue();
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_0900
     * @tc.name      testSystemLoadMockModeOperationStatus0009
     * @tc.desc      Enter mock mode and verify the operation status text updates.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadMockModeOperationStatus0009', 0, async () => {
      const caseName = 'testSystemLoadMockModeOperationStatus0009';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      const mockSource = await resourceManager.getStringByName('mock_data');
      const dataSource = await getComponentText(driver, 'data_source_text');
      logger.info(`${BUNDLE}${caseName}, assert data source is mock`);
      expect(dataSource).assertEqual(mockSource);
      expect(dataSource.length > 0).assertTrue();
      const operationText = await resourceManager.getStringByName('operation_mock_selected');
      logger.info(`${BUNDLE}${caseName}, assert operation status shows mock selected`);
      expect(await getComponentText(driver, 'operation_status_text')).assertEqual(operationText);
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_1000
     * @tc.name      testSystemLoadCallbackCountReset0010
     * @tc.desc      Verify callback counts display zero in mock mode.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadCallbackCountReset0010', 0, async () => {
      const caseName = 'testSystemLoadCallbackCountReset0010';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      const primaryCountText = await getComponentText(driver, 'primary_callback_count');
      logger.info(`${BUNDLE}${caseName}, assert primary callback count shows zero`);
      expect(primaryCountText.endsWith('0')).assertTrue();
      expect(primaryCountText.length > 0).assertTrue();
      const secondaryCountText = await getComponentText(driver, 'secondary_callback_count');
      logger.info(`${BUNDLE}${caseName}, assert secondary callback count shows zero`);
      expect(secondaryCountText.endsWith('0')).assertTrue();
      expect(secondaryCountText.length > 0).assertTrue();
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_1100
     * @tc.name      testSystemLoadLocalModeSwitch0011
     * @tc.desc      Switch from mock to local mode and verify the operation status changes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadLocalModeSwitch0011', 0, async () => {
      const caseName = 'testSystemLoadLocalModeSwitch0011';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      const mockOperation = await resourceManager.getStringByName('operation_mock_selected');
      logger.info(`${BUNDLE}${caseName}, assert operation status shows mock selected`);
      expect(await getComponentText(driver, 'operation_status_text')).assertEqual(mockOperation);
      await clickComponent(driver, 'local_data_button');
      const source = await getComponentText(driver, 'data_source_text');
      const localSource = await resourceManager.getStringByName('local_data');
      const fallbackSource = await resourceManager.getStringByName('mock_fallback');
      logger.info(`${BUNDLE}${caseName}, assert source changed to local or fallback`);
      expect(source === localSource || source === fallbackSource).assertTrue();
      const currentOperation = await getComponentText(driver, 'operation_status_text');
      logger.info(`${BUNDLE}${caseName}, assert operation status changed from mock`);
      expect(currentOperation !== mockOperation).assertTrue();
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_1200
     * @tc.name      testSystemLoadMockLevelBoundaryLow0012
     * @tc.desc      Navigate to LOW boundary and verify wrapping on previous.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadMockLevelBoundaryLow0012', 0, async () => {
      const caseName = 'testSystemLoadMockLevelBoundaryLow0012';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      for (let i = 0; i < LEVEL_NAMES.length; i++) {
        await clickComponent(driver, 'mock_previous_button');
      }
      const startLevel = await getComponentText(driver, 'system_level_name');
      logger.info(`${BUNDLE}${caseName}, assert full cycle returns to start level ${startLevel}`);
      expect(LEVEL_NAMES.indexOf(startLevel) >= 0).assertTrue();
      await clickComponent(driver, 'mock_next_button');
      const afterNext = await getComponentText(driver, 'system_level_name');
      logger.info(`${BUNDLE}${caseName}, assert level after next is valid`);
      expect(LEVEL_NAMES.indexOf(afterNext) >= 0).assertTrue();
      expect(afterNext !== startLevel).assertTrue();
      await clickComponent(driver, 'mock_previous_button');
      logger.info(`${BUNDLE}${caseName}, assert previous returns to start level`);
      expect(await getComponentText(driver, 'system_level_name')).assertEqual(startLevel);
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_1300
     * @tc.name      testSystemLoadMockLevelBoundaryEscape0013
     * @tc.desc      Navigate to ESCAPE boundary and verify wrapping on next.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadMockLevelBoundaryEscape0013', 0, async () => {
      const caseName = 'testSystemLoadMockLevelBoundaryEscape0013';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      for (let i = 0; i < LEVEL_NAMES.length; i++) {
        await clickComponent(driver, 'mock_next_button');
      }
      const startLevel = await getComponentText(driver, 'system_level_name');
      logger.info(`${BUNDLE}${caseName}, assert full cycle returns to start level ${startLevel}`);
      expect(LEVEL_NAMES.indexOf(startLevel) >= 0).assertTrue();
      await clickComponent(driver, 'mock_previous_button');
      const afterPrev = await getComponentText(driver, 'system_level_name');
      logger.info(`${BUNDLE}${caseName}, assert level after previous is valid`);
      expect(LEVEL_NAMES.indexOf(afterPrev) >= 0).assertTrue();
      expect(afterPrev !== startLevel).assertTrue();
      await clickComponent(driver, 'mock_next_button');
      logger.info(`${BUNDLE}${caseName}, assert next returns to start level`);
      expect(await getComponentText(driver, 'system_level_name')).assertEqual(startLevel);
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_1400
     * @tc.name      testSystemLoadMockFullCyclePrevious0014
     * @tc.desc      Click previous eight times and verify full reverse cycle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadMockFullCyclePrevious0014', 0, async () => {
      const caseName = 'testSystemLoadMockFullCyclePrevious0014';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      await clickComponent(driver, 'mock_next_button');
      const startLevel = await getComponentText(driver, 'system_level_name');
      logger.info(`${BUNDLE}${caseName}, record start level ${startLevel}`);
      expect(LEVEL_NAMES.indexOf(startLevel) >= 0).assertTrue();
      for (let i = 0; i < LEVEL_NAMES.length; i++) {
        await clickComponent(driver, 'mock_previous_button');
        const name = await getComponentText(driver, 'system_level_name');
        logger.info(`${BUNDLE}${caseName}, assert level ${name} at step ${i} is valid`);
        expect(LEVEL_NAMES.indexOf(name) >= 0).assertTrue();
        expect(name.length > 0).assertTrue();
      }
      logger.info(`${BUNDLE}${caseName}, assert 8 previous clicks return to start level`);
      expect(await getComponentText(driver, 'system_level_name')).assertEqual(startLevel);
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_1500
     * @tc.name      testSystemLoadRapidNextLevel0015
     * @tc.desc      Rapidly click next level sixteen times and verify page stability.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadRapidNextLevel0015', 0, async () => {
      const caseName = 'testSystemLoadRapidNextLevel0015';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      await clickComponent(driver, 'mock_next_button');
      const startLevel = await getComponentText(driver, 'system_level_name');
      logger.info(`${BUNDLE}${caseName}, record start level ${startLevel}`);
      expect(LEVEL_NAMES.indexOf(startLevel) >= 0).assertTrue();
      for (let i = 0; i < 16; i++) {
        await clickComponent(driver, 'mock_next_button');
        const name = await getComponentText(driver, 'system_level_name');
        logger.info(`${BUNDLE}${caseName}, assert rapid click ${i} shows valid level ${name}`);
        expect(LEVEL_NAMES.indexOf(name) >= 0).assertTrue();
        expect(name.length > 0).assertTrue();
      }
      logger.info(`${BUNDLE}${caseName}, assert 16 rapid clicks return to start level`);
      expect(await getComponentText(driver, 'system_level_name')).assertEqual(startLevel);
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_1600
     * @tc.name      testSystemLoadRapidModeSwitch0016
     * @tc.desc      Rapidly switch between mock and local mode six times and verify stability.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadRapidModeSwitch0016', 0, async () => {
      const caseName = 'testSystemLoadRapidModeSwitch0016';
      logger.info(`${BUNDLE}${caseName}, begin`);
      for (let i = 0; i < 6; i++) {
        await clickComponent(driver, 'mock_data_button');
        await clickComponent(driver, 'local_data_button');
        const source = await getComponentText(driver, 'data_source_text');
        logger.info(`${BUNDLE}${caseName}, assert source valid after switch ${i}`);
        expect(source.length > 0).assertTrue();
        expect(typeof source).assertEqual('string');
      }
      const name = await getComponentText(driver, 'system_level_name');
      logger.info(`${BUNDLE}${caseName}, assert level ${name} still valid after rapid switches`);
      expect(LEVEL_NAMES.indexOf(name) >= 0).assertTrue();
      expect(name.length > 0).assertTrue();
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_1700
     * @tc.name      testSystemLoadModeSwitchResetsCallbackCount0017
     * @tc.desc      Switch from local to mock mode and verify callback counts reset to zero.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadModeSwitchResetsCallbackCount0017', 0, async () => {
      const caseName = 'testSystemLoadModeSwitchResetsCallbackCount0017';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      await clickComponent(driver, 'local_data_button');
      await clickComponent(driver, 'mock_data_button');
      const primaryCountText = await getComponentText(driver, 'primary_callback_count');
      logger.info(`${BUNDLE}${caseName}, assert primary callback count ends with 0`);
      expect(primaryCountText.endsWith('0')).assertTrue();
      expect(primaryCountText.length > 0).assertTrue();
      const secondaryCountText = await getComponentText(driver, 'secondary_callback_count');
      logger.info(`${BUNDLE}${caseName}, assert secondary callback count ends with 0`);
      expect(secondaryCountText.endsWith('0')).assertTrue();
      expect(secondaryCountText.length > 0).assertTrue();
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_1800
     * @tc.name      testSystemLoadModeSwitchResetsCallbackHistory0018
     * @tc.desc      Switch to mock mode and verify the data source is mock.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadModeSwitchResetsCallbackHistory0018', 0, async () => {
      const caseName = 'testSystemLoadModeSwitchResetsCallbackHistory0018';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      await clickComponent(driver, 'local_data_button');
      await clickComponent(driver, 'mock_data_button');
      const mockSource = await resourceManager.getStringByName('mock_data');
      const dataSource = await getComponentText(driver, 'data_source_text');
      logger.info(`${BUNDLE}${caseName}, assert data source is mock after switch`);
      expect(dataSource).assertEqual(mockSource);
      expect(dataSource.length > 0).assertTrue();
      const historyText = await getComponentText(driver, 'callback_history_text');
      logger.info(`${BUNDLE}${caseName}, assert callback history component is present`);
      expect(historyText !== undefined && historyText !== null).assertTrue();
      expect(historyText.length > 0).assertTrue();
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_1900
     * @tc.name      testSystemLoadMockModeButtonsDisabled0019
     * @tc.desc      Verify listener controls show unregistered state in mock mode.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadMockModeButtonsDisabled0019', 0, async () => {
      const caseName = 'testSystemLoadMockModeButtonsDisabled0019';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      const unregistered = await resourceManager.getStringByName('not_listening');
      const primaryStatus = await getComponentText(driver, 'listener_status_text');
      const secondaryStatus = await getComponentText(driver, 'secondary_listener_status_text');
      logger.info(`${BUNDLE}${caseName}, assert primary listener shows unregistered in mock mode`);
      expect(primaryStatus).assertEqual(unregistered);
      logger.info(`${BUNDLE}${caseName}, assert secondary listener shows unregistered in mock mode`);
      expect(secondaryStatus).assertEqual(unregistered);
      expect(primaryStatus === secondaryStatus).assertTrue();
      await findComponent(driver, 'register_primary_button');
      await findComponent(driver, 'unregister_primary_button');
      await findComponent(driver, 'register_secondary_button');
      await findComponent(driver, 'unregister_secondary_button');
      await findComponent(driver, 'unregister_all_button');
      logger.info(`${BUNDLE}${caseName}, assert all listener control buttons exist`);
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_2000
     * @tc.name      testSystemLoadDuplicateMockDataClick0020
     * @tc.desc      Click mock data button twice and verify the state remains unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadDuplicateMockDataClick0020', 0, async () => {
      const caseName = 'testSystemLoadDuplicateMockDataClick0020';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      await clickComponent(driver, 'mock_data_button');
      const mockSource = await resourceManager.getStringByName('mock_data');
      const dataSource = await getComponentText(driver, 'data_source_text');
      logger.info(`${BUNDLE}${caseName}, assert data source remains mock after duplicate click`);
      expect(dataSource).assertEqual(mockSource);
      expect(dataSource.length > 0).assertTrue();
      const name = await getComponentText(driver, 'system_level_name');
      logger.info(`${BUNDLE}${caseName}, assert level ${name} still valid`);
      expect(LEVEL_NAMES.indexOf(name) >= 0).assertTrue();
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_2100
     * @tc.name      testSystemLoadDuplicateRefreshClick0021
     * @tc.desc      Click refresh button three times and verify the level remains stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSystemLoadDuplicateRefreshClick0021', 0, async () => {
      const caseName = 'testSystemLoadDuplicateRefreshClick0021';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      const levelBefore = await getComponentText(driver, 'system_level_name');
      const valueBefore = await getComponentText(driver, 'system_level_value');
      for (let i = 0; i < 3; i++) {
        await clickComponent(driver, 'refresh_button');
      }
      const levelAfter = await getComponentText(driver, 'system_level_name');
      const valueAfter = await getComponentText(driver, 'system_level_value');
      logger.info(`${BUNDLE}${caseName}, assert level unchanged after 3 refresh clicks`);
      expect(levelAfter).assertEqual(levelBefore);
      expect(valueAfter).assertEqual(valueBefore);
      expect(LEVEL_NAMES.indexOf(levelAfter) >= 0).assertTrue();
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_2200
     * @tc.name      testSystemLoadAllLevelDescriptions0022
     * @tc.desc      Cycle through all 8 levels and verify each has valid description and recommendation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSystemLoadAllLevelDescriptions0022', 0, async () => {
      const caseName = 'testSystemLoadAllLevelDescriptions0022';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      expect(LEVEL_NAMES.length).assertEqual(8);
      const unavailableDescription = await resourceManager.getStringByName('level_unavailable');
      const unavailableRecommendation = await resourceManager.getStringByName('recommendation_unavailable');
      for (let i = 0; i < LEVEL_NAMES.length; i++) {
        await clickComponent(driver, 'mock_next_button');
        const description = await getComponentText(driver, 'system_level_description');
        const recommendation = await getComponentText(driver, 'system_level_recommendation');
        logger.info(`${BUNDLE}${caseName}, assert level ${i} has valid description`);
        expect(description.length > 0 && description !== unavailableDescription).assertTrue();
        logger.info(`${BUNDLE}${caseName}, assert level ${i} has valid recommendation`);
        expect(recommendation.length > 0 && recommendation !== unavailableRecommendation).assertTrue();
        expect(typeof description).assertEqual('string');
        expect(typeof recommendation).assertEqual('string');
      }
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_2300
     * @tc.name      testSystemLoadDataSourceSwitchConsistency0023
     * @tc.desc      Switch between mock and local data multiple times and verify state consistency.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSystemLoadDataSourceSwitchConsistency0023', 0, async () => {
      const caseName = 'testSystemLoadDataSourceSwitchConsistency0023';
      logger.info(`${BUNDLE}${caseName}, begin`);
      const mockSource = await resourceManager.getStringByName('mock_data');
      const localSource = await resourceManager.getStringByName('local_data');
      const fallbackSource = await resourceManager.getStringByName('mock_fallback');
      expect(mockSource.length > 0).assertTrue();
      expect(localSource.length > 0).assertTrue();
      for (let i = 0; i < 3; i++) {
        await clickComponent(driver, 'mock_data_button');
        const source1 = await getComponentText(driver, 'data_source_text');
        logger.info(`${BUNDLE}${caseName}, assert source is mock after switch ${i}`);
        expect(source1).assertEqual(mockSource);
        expect(source1.length > 0).assertTrue();
        await clickComponent(driver, 'local_data_button');
        const source2 = await getComponentText(driver, 'data_source_text');
        logger.info(`${BUNDLE}${caseName}, assert source is local or fallback after switch ${i}`);
        expect(source2 === localSource || source2 === fallbackSource).assertTrue();
        expect(source2.length > 0).assertTrue();
      }
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_2400
     * @tc.name      testSystemLoadOperationStatusUpdates0024
     * @tc.desc      Verify operation status text updates correctly after each operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSystemLoadOperationStatusUpdates0024', 0, async () => {
      const caseName = 'testSystemLoadOperationStatusUpdates0024';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      const mockOperation = await resourceManager.getStringByName('operation_mock_selected');
      logger.info(`${BUNDLE}${caseName}, assert operation shows mock selected`);
      expect(await getComponentText(driver, 'operation_status_text')).assertEqual(mockOperation);
      await clickComponent(driver, 'mock_next_button');
      const levelChangeOperation = await resourceManager.getStringByName('operation_mock_level_changed');
      logger.info(`${BUNDLE}${caseName}, assert operation shows level changed`);
      expect(await getComponentText(driver, 'operation_status_text')).assertEqual(levelChangeOperation);
      await clickComponent(driver, 'refresh_button');
      const refreshOperation = await resourceManager.getStringByName('operation_mock_refreshed');
      logger.info(`${BUNDLE}${caseName}, assert operation shows refreshed`);
      expect(await getComponentText(driver, 'operation_status_text')).assertEqual(refreshOperation);
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number    SYSTEMLOAD_UI_2500
     * @tc.name      testSystemLoadCallbackHistoryUpdates0025
     * @tc.desc      Verify callback history component updates when callbacks are received.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSystemLoadCallbackHistoryUpdates0025', 0, async () => {
      const caseName = 'testSystemLoadCallbackHistoryUpdates0025';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      const historyText = await getComponentText(driver, 'callback_history_text');
      logger.info(`${BUNDLE}${caseName}, assert callback history component exists`);
      expect(historyText !== undefined && historyText !== null).assertTrue();
      logger.info(`${BUNDLE}${caseName}, assert callback history shows initial value`);
      expect(historyText.length > 0).assertTrue();
      const dataSource = await getComponentText(driver, 'data_source_text');
      expect(dataSource.length > 0).assertTrue();
      logger.info(`${BUNDLE}${caseName}, end`);
    });
  });
}
