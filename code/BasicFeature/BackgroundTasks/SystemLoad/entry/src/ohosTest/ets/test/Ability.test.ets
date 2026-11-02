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
     * @tc.number: SYSTEMLOAD_UI_0100
     * @tc.name: systemLoad_startAbility_0001
     * @tc.desc: Start the sample and verify the system load page is displayed.
     * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('systemLoad_startAbility_0001', 0, async () => {
      const caseName = 'startAbility_0001';
      logger.info(`${BUNDLE}${caseName}, begin`);
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await driver.delayMs(DELAY_MS);
      logger.info(`${BUNDLE}${caseName}, assert system_load_title exists`);
      await driver.assertComponentExist(ON.id('system_load_title'));
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number: SYSTEMLOAD_UI_0200
     * @tc.name: systemLoad_levelDisplay_0002
     * @tc.desc: Verify that a valid level, description and application recommendation are displayed.
     * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('systemLoad_levelDisplay_0002', 0, async () => {
      const caseName = 'levelDisplay_0002';
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
     * @tc.number: SYSTEMLOAD_UI_0300
     * @tc.name: systemLoad_mockData_0003
     * @tc.desc: Switch to mock data and verify the default MEDIUM level.
     * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('systemLoad_mockData_0003', 0, async () => {
      const caseName = 'mockData_0003';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_data_button');
      const mockSource = await resourceManager.getStringByName('mock_data');
      logger.info(`${BUNDLE}${caseName}, assert mock source is displayed`);
      expect(await getComponentText(driver, 'data_source_text')).assertEqual(mockSource);
      logger.info(`${BUNDLE}${caseName}, assert mock level MEDIUM is displayed`);
      expect(await getComponentText(driver, 'system_level_name')).assertEqual('MEDIUM');
      logger.info(`${BUNDLE}${caseName}, assert mock level value Level 2 is displayed`);
      expect(await getComponentText(driver, 'system_level_value')).assertEqual('Level 2');
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number: SYSTEMLOAD_UI_0400
     * @tc.name: systemLoad_mockLevelCycle_0004
     * @tc.desc: Cycle through all eight mock levels and verify each name and value.
     * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('systemLoad_mockLevelCycle_0004', 0, async () => {
      const caseName = 'mockLevelCycle_0004';
      logger.info(`${BUNDLE}${caseName}, begin`);
      for (let offset = 1; offset <= LEVEL_NAMES.length; offset++) {
        await clickComponent(driver, 'mock_next_button');
        const expectedIndex = (2 + offset) % LEVEL_NAMES.length;
        logger.info(`${BUNDLE}${caseName}, assert mock level ${LEVEL_NAMES[expectedIndex]}`);
        expect(await getComponentText(driver, 'system_level_name')).assertEqual(LEVEL_NAMES[expectedIndex]);
        logger.info(`${BUNDLE}${caseName}, assert mock value Level ${expectedIndex}`);
        expect(await getComponentText(driver, 'system_level_value')).assertEqual(`Level ${expectedIndex}`);
      }
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number: SYSTEMLOAD_UI_0500
     * @tc.name: systemLoad_mockPreviousLevel_0005
     * @tc.desc: Select the previous mock level and verify NORMAL and Level 1.
     * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('systemLoad_mockPreviousLevel_0005', 0, async () => {
      const caseName = 'mockPreviousLevel_0005';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'mock_previous_button');
      logger.info(`${BUNDLE}${caseName}, assert previous mock level is NORMAL`);
      expect(await getComponentText(driver, 'system_level_name')).assertEqual('NORMAL');
      logger.info(`${BUNDLE}${caseName}, assert previous mock value is Level 1`);
      expect(await getComponentText(driver, 'system_level_value')).assertEqual('Level 1');
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number: SYSTEMLOAD_UI_0600
     * @tc.name: systemLoad_refreshMockData_0006
     * @tc.desc: Refresh mock data without changing the selected level.
     * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('systemLoad_refreshMockData_0006', 0, async () => {
      const caseName = 'refreshMockData_0006';
      logger.info(`${BUNDLE}${caseName}, begin`);
      await clickComponent(driver, 'refresh_button');
      logger.info(`${BUNDLE}${caseName}, assert refreshed mock level remains NORMAL`);
      expect(await getComponentText(driver, 'system_level_name')).assertEqual('NORMAL');
      logger.info(`${BUNDLE}${caseName}, assert refreshed mock value remains Level 1`);
      expect(await getComponentText(driver, 'system_level_value')).assertEqual('Level 1');
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number: SYSTEMLOAD_UI_0700
     * @tc.name: systemLoad_mockListenerCleanup_0007
     * @tc.desc: Verify that mock mode unregisters both listeners and retains listener controls.
     * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('systemLoad_mockListenerCleanup_0007', 0, async () => {
      const caseName = 'mockListenerCleanup_0007';
      logger.info(`${BUNDLE}${caseName}, begin`);
      const unregistered = await resourceManager.getStringByName('not_listening');
      logger.info(`${BUNDLE}${caseName}, assert primary listener is unregistered`);
      expect(await getComponentText(driver, 'listener_status_text')).assertEqual(unregistered);
      logger.info(`${BUNDLE}${caseName}, assert secondary listener is unregistered`);
      expect(await getComponentText(driver, 'secondary_listener_status_text')).assertEqual(unregistered);
      logger.info(`${BUNDLE}${caseName}, assert unregister-all control exists`);
      await findComponent(driver, 'unregister_all_button');
      logger.info(`${BUNDLE}${caseName}, assert callback history control exists`);
      await findComponent(driver, 'callback_history_text');
      logger.info(`${BUNDLE}${caseName}, end`);
    });

    /**
     * @tc.number: SYSTEMLOAD_UI_0800
     * @tc.name: systemLoad_localData_0008
     * @tc.desc: Return to local data and verify the level or the explicit mock fallback.
     * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('systemLoad_localData_0008', 0, async () => {
      const caseName = 'localData_0008';
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
  });
}
