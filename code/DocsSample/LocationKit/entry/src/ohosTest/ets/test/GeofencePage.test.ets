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

export default function geofencePageTest() {
  describe('LocationKitGeofencePageTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = await startApp();
      await enterPage(driver, 'menu_GeofencePage');
    });

    /**
     * Verify the Geofence page displays fence parameters and event sections
     */
    it(BUNDLE + 'GeofenceUI_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeofenceUI_001, begin');

      let exist: boolean = await componentExists(driver, 'section_fence_params');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeofenceUI_001, component section_fence_params exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'section_fence_events');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeofenceUI_001, component section_fence_events exist: %{public}s', String(exist));
      expect(exist).assertTrue();

      hilog.info(DOMAIN, TAG, BUNDLE + 'GeofenceUI_001, end');
    });

    /**
     * Verify the fence inputs and buttons exist on the Geofence page
     */
    it(BUNDLE + 'GeofenceUI_002', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeofenceUI_002, begin');

      let exist: boolean = await componentExists(driver, 'input_fence_latitude');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeofenceUI_002, component input_fence_latitude exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'input_fence_longitude');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeofenceUI_002, component input_fence_longitude exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'input_fence_radius');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeofenceUI_002, component input_fence_radius exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'btn_add_fence');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeofenceUI_002, component btn_add_fence exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'btn_remove_fence');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeofenceUI_002, component btn_remove_fence exist: %{public}s', String(exist));
      expect(exist).assertTrue();

      hilog.info(DOMAIN, TAG, BUNDLE + 'GeofenceUI_002, end');
    });
  });
}
