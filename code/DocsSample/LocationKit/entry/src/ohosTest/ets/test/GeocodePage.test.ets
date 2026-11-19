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

export default function geocodePageTest() {
  describe('LocationKitGeocodePageTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = await startApp();
      await enterPage(driver, 'menu_GeocodePage');
    });

    /**
     * Verify the Geocode page displays availability and both conversion sections
     */
    it(BUNDLE + 'GeocodeUI_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeocodeUI_001, begin');

      let exist: boolean = await componentExists(driver, 'section_geocoder_availability');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeocodeUI_001, component section_geocoder_availability exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'section_reverse_geocode');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeocodeUI_001, component section_reverse_geocode exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'section_forward_geocode');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeocodeUI_001, component section_forward_geocode exist: %{public}s', String(exist));
      expect(exist).assertTrue();

      hilog.info(DOMAIN, TAG, BUNDLE + 'GeocodeUI_001, end');
    });

    /**
     * Verify the geocode inputs and buttons exist on the Geocode page
     */
    it(BUNDLE + 'GeocodeUI_002', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeocodeUI_002, begin');

      let exist: boolean = await componentExists(driver, 'btn_check_availability');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeocodeUI_002, component btn_check_availability exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'input_reverse_latitude');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeocodeUI_002, component input_reverse_latitude exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'input_reverse_longitude');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeocodeUI_002, component input_reverse_longitude exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'btn_reverse_geocode');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeocodeUI_002, component btn_reverse_geocode exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'input_forward_description');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeocodeUI_002, component input_forward_description exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'btn_forward_geocode');
      hilog.info(DOMAIN, TAG, BUNDLE + 'GeocodeUI_002, component btn_forward_geocode exist: %{public}s', String(exist));
      expect(exist).assertTrue();

      hilog.info(DOMAIN, TAG, BUNDLE + 'GeocodeUI_002, end');
    });
  });
}
