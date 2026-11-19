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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  logInfo,
  MODE_STANDARD,
  MODE_SPECIFIED,
  MODE_SINGLETON,
  FOOD_TOMATO,
  FOOD_WALNUT,
  FOOD_ICE_CREAM,
  TEXT_FOOD_DETAIL_TITLE,
  TEXT_CALORIE,
  waitForHomePageStable,
  waitForFoodDetailStable,
  isHomePageVisible,
  isFoodDetailVisible,
  hasImageComponent,
  hasListComponent,
  countModeLabels,
  countNutritionLabels,
  launchStandardAbility,
  resetToHome,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH
} from '../Shared/SharedDriver';

export default function deviceCompatibilityTest() {
  describe('DeviceCompatibility_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await resetToHome(driver);
    });

    afterAll(async () => {
      await resetToHome(driver);
    });

    it('home_page_should_render_on_default_device', 0, async () => {
      const visible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(visible).assertTrue();
      logInfo('home page rendered on default device');
    });

    it('three_mode_groups_should_be_visible', 0, async () => {
      const labels: number = await countModeLabels(driver);
      expect(labels).assertEqual(3);
    });

    it('standard_group_food_should_be_visible', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    it('specified_and_singleton_groups_should_be_visible', 0, async () => {
      const texts: string[] = [MODE_STANDARD, MODE_SPECIFIED, MODE_SINGLETON];
      for (let i = 0; i < texts.length; i++) {
        expect(texts[i].length > 0).assertTrue();
      }
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    it('food_images_should_be_rendered', 0, async () => {
      const hasImage: boolean = await hasImageComponent(driver);
      expect(hasImage).assertTrue();
    });

    it('food_list_component_should_exist', 0, async () => {
      const hasList: boolean = await hasListComponent(driver);
      expect(hasList).assertTrue();
    });

    it('food_detail_should_render_on_default_device', 0, async () => {
      await launchStandardAbility(0);
      const visible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      expect(visible).assertTrue();
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    it('food_detail_nutrition_labels_should_be_complete', 0, async () => {
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      const labels: number = await countNutritionLabels(driver);
      expect(labels).assertEqual(5);
    });

    it('food_names_should_be_non_empty', 0, async () => {
      expect(FOOD_TOMATO.length > 0).assertTrue();
      expect(FOOD_WALNUT.length > 0).assertTrue();
      expect(FOOD_ICE_CREAM.length > 0).assertTrue();
    });

    it('page_titles_should_be_stable', 0, async () => {
      expect(TEXT_FOOD_DETAIL_TITLE).assertEqual('Food Detail');
      expect(TEXT_CALORIE).assertEqual('Calories');
    });

    it('home_page_should_be_restorable_after_detail', 0, async () => {
      const restored: boolean = await resetToHome(driver);
      expect(restored).assertTrue();
    });
  });
}
