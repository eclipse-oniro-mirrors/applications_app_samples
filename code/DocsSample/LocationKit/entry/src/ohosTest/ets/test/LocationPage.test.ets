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
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { startApp, enterPage, componentExists } from './PageTestCommon';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_LocationKit]';
const BUNDLE: string = 'LocationKit_';

export default function locationPageTest() {
  describe('LocationKitLocationPageTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = await startApp();
      await enterPage(driver, 'menu_LocationPage');
    });

    /**
     * Verify the Location page displays switch, single location and
     * continuous location sections
     */
    it(BUNDLE + 'LocationUI_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocationUI_001, begin');

      let exist: boolean = await componentExists(driver, 'section_location_switch');
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocationUI_001, component section_location_switch exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'section_single_location');
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocationUI_001, component section_single_location exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'section_continuous_location');
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocationUI_001, component section_continuous_location exist: %{public}s', String(exist));
      expect(exist).assertTrue();

      hilog.info(DOMAIN, TAG, BUNDLE + 'LocationUI_001, end');
    });

    /**
     * Verify the location buttons exist on the Location page
     */
    it(BUNDLE + 'LocationUI_002', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocationUI_002, begin');

      let exist: boolean = await componentExists(driver, 'btn_check_switch');
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocationUI_002, component btn_check_switch exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'btn_get_last_location');
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocationUI_002, component btn_get_last_location exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'btn_get_current_location');
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocationUI_002, component btn_get_current_location exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'btn_start_continuous');
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocationUI_002, component btn_start_continuous exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'btn_stop_continuous');
      hilog.info(DOMAIN, TAG, BUNDLE + 'LocationUI_002, component btn_stop_continuous exist: %{public}s', String(exist));
      expect(exist).assertTrue();

      hilog.info(DOMAIN, TAG, BUNDLE + 'LocationUI_002, end');
    });
  });
}
