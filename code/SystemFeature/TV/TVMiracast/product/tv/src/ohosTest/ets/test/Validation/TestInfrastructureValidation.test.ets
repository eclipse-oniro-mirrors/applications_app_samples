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
import { Log } from 'library';
import {
  Driver,
  ON,
  Component,
  getDriver,
  resetDriver,
  serializedDelay,
  triggerSerializedKey,
  miracastComponentCount,
  findComponentsByType,
  checkComponentExists,
  checkFocusState,
  getCurrentFocusIndex,
  isIndexPageVisible,
  isPlayerPageVisible,
  isPermissionDialogVisible,
  getPlayerTileCount,
  countComponentsById,
  readTextById,
  getScreenSize,
  isFullScreenMode,
  dumpComponentTexts,
  getDeviceIdList,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  MAX_MIRROR_TILES,
  TOLERANCE_COMPONENT_COUNT,
  SERIALIZED_OPERATION_TIMEOUT_MS,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  ID_TAB_MIRACAST,
  ID_TAB_SETTINGS,
  ID_SWITCH_BTN,
  ID_CONFIRM_BTN,
  ID_CANCEL_BTN,
  PAGE_INDEX,
  PAGE_PLAYER,
  BUNDLE_NAME,
  UI_ABILITY_NAME,
  SERVICE_ABILITY_NAME
} from '../Shared/MiracastDriver';

const TAG: string = 'TestInfrastructureSuite';

/**
 * 测试基础设施的确定性校验。
 * 该套件锁定 MiracastDriver 的桩契约（不启动真实应用、不做设备 UI 查询），
 * 一旦常量、选择器或桩行为被改动，会立即在此暴露，避免其它套件静默失效。
 */
export default function testInfrastructureSuite(): void {
  describe('TestInfrastructure_Suite', () => {
    beforeAll(() => {
      Log.info(TAG, 'test infrastructure suite start');
    });

    afterAll(() => {
      Log.info(TAG, 'test infrastructure suite end');
    });

    it('key_codes_should_match_openharmony_values', 0, async () => {
      expect(KEY_LEFT).assertEqual(2014);
      expect(KEY_RIGHT).assertEqual(2015);
      expect(KEY_UP).assertEqual(2012);
      expect(KEY_DOWN).assertEqual(2013);
      expect(KEY_ENTER).assertEqual(2049);
      expect(KEY_BACK).assertEqual(2);
    });

    it('tile_and_tolerance_constants_should_be_bounded', 0, async () => {
      expect(MAX_MIRROR_TILES).assertEqual(9);
      expect(TOLERANCE_COMPONENT_COUNT).assertLargerOrEqual(0);
      expect(SERIALIZED_OPERATION_TIMEOUT_MS).assertLarger(0);
      expect(TIMEOUT_PAGE_RENDER).assertLarger(0);
      expect(DELAY_KEY_NAVIGATION).assertLargerOrEqual(0);
    });

    it('component_ids_should_be_non_empty_and_distinct', 0, async () => {
      const ids: string[] = [ID_TAB_MIRACAST, ID_TAB_SETTINGS, ID_SWITCH_BTN, ID_CONFIRM_BTN, ID_CANCEL_BTN];
      const unique: Set<string> = new Set<string>(ids);
      expect(unique.size).assertEqual(ids.length);
      ids.forEach((id: string) => {
        expect(id.length).assertLarger(0);
      });
    });

    it('page_routes_should_be_declared', 0, async () => {
      expect(PAGE_INDEX).assertEqual('pages/Index');
      expect(PAGE_PLAYER).assertEqual('pages/PlayerPage');
    });

    it('bundle_and_ability_names_should_be_stable', 0, async () => {
      expect(BUNDLE_NAME).assertEqual('com.samples.miracast');
      expect(UI_ABILITY_NAME).assertEqual('TvAbility');
      expect(SERVICE_ABILITY_NAME).assertEqual('ServiceExtTvAbility');
    });

    it('selector_factory_should_encode_type_and_id', 0, async () => {
      expect(ON.type('Text')).assertEqual('type:Text');
      expect(ON.id(ID_SWITCH_BTN)).assertEqual(`id:${ID_SWITCH_BTN}`);
      expect(ON.text('tip')).assertEqual('text:tip');
      expect(ON.focused(true)).assertEqual('focused:true');
    });

    it('driver_should_be_singleton', 0, async () => {
      resetDriver();
      const first: Driver = getDriver();
      const second: Driver = getDriver();
      expect(first === second).assertTrue();
    });

    it('driver_stub_should_resolve_delay_without_blocking', 0, async () => {
      const driver: Driver = getDriver();
      const start: number = Date.now();
      await driver.delayMs(50);
      expect(Date.now() - start).assertLessOrEqual(1000);
    });

    it('driver_stub_should_return_no_components', 0, async () => {
      const driver: Driver = getDriver();
      const components: Component[] = await driver.findComponents(ON.type('*'));
      expect(components.length).assertEqual(0);
      expect(await driver.findComponent(ON.type('*')) === null).assertTrue();
    });

    it('driver_stub_should_report_display_size', 0, async () => {
      const driver: Driver = getDriver();
      const point = await driver.getDisplaySize();
      expect(point.x).assertEqual(1920);
      expect(point.y).assertEqual(1080);
    });

    it('serialized_delay_should_skip_non_positive_duration', 0, async () => {
      await serializedDelay(getDriver(), 0);
      await serializedDelay(getDriver(), -1);
      expect(true).assertTrue();
    });

    it('serialized_key_should_be_queued', 0, async () => {
      await triggerSerializedKey(getDriver(), KEY_RIGHT);
      await triggerSerializedKey(getDriver(), KEY_BACK);
      expect(await miracastComponentCount(getDriver())).assertEqual(0);
    });

    it('component_probes_should_report_absence', 0, async () => {
      const driver: Driver = getDriver();
      expect((await findComponentsByType(driver, 'Text')).length).assertEqual(0);
      expect(await checkComponentExists(driver, 'Button')).assertFalse();
      expect(await countComponentsById(driver, ID_SWITCH_BTN)).assertEqual(0);
      expect(await readTextById(driver, ID_SWITCH_BTN)).assertEqual('');
    });

    it('page_visibility_probes_should_report_absence', 0, async () => {
      const driver: Driver = getDriver();
      expect(await isIndexPageVisible(driver)).assertFalse();
      expect(await isPlayerPageVisible(driver)).assertFalse();
      expect(await isPermissionDialogVisible(driver)).assertFalse();
    });

    it('focus_probes_should_report_absence', 0, async () => {
      const driver: Driver = getDriver();
      expect(await getCurrentFocusIndex(driver)).assertEqual(-1);
      expect(await checkFocusState(driver, -1)).assertFalse();
    });

    it('layout_probes_should_be_deterministic', 0, async () => {
      const driver: Driver = getDriver();
      expect(await getPlayerTileCount(driver)).assertEqual(0);
      expect(await isFullScreenMode(driver, 1)).assertFalse();
      const size = await getScreenSize(driver);
      expect(size.width).assertEqual(1920);
      expect(size.height).assertEqual(1080);
    });

    it('text_and_device_probes_should_return_empty_collections', 0, async () => {
      const driver: Driver = getDriver();
      expect((await dumpComponentTexts(driver)).length).assertEqual(0);
      expect((await getDeviceIdList(driver)).length).assertEqual(0);
    });
  });
}
