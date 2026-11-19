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

export default function locationCapiPageTest() {
  describe('LocationKitCapiPageTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = await startApp();
      await enterPage(driver, 'menu_LocationCapiPage');
    });

    /**
     * Verify the Location C API page displays native switch and locating sections
     */
    it(BUNDLE + 'CapiUI_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CapiUI_001, begin');

      let exist: boolean = await componentExists(driver, 'section_native_switch');
      hilog.info(DOMAIN, TAG, BUNDLE + 'CapiUI_001, component section_native_switch exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'section_native_locating');
      hilog.info(DOMAIN, TAG, BUNDLE + 'CapiUI_001, component section_native_locating exist: %{public}s', String(exist));
      expect(exist).assertTrue();

      hilog.info(DOMAIN, TAG, BUNDLE + 'CapiUI_001, end');
    });

    /**
     * Verify the native buttons exist on the Location C API page
     */
    it(BUNDLE + 'CapiUI_002', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CapiUI_002, begin');

      let exist: boolean = await componentExists(driver, 'btn_native_check_switch');
      hilog.info(DOMAIN, TAG, BUNDLE + 'CapiUI_002, component btn_native_check_switch exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'btn_native_start');
      hilog.info(DOMAIN, TAG, BUNDLE + 'CapiUI_002, component btn_native_start exist: %{public}s', String(exist));
      expect(exist).assertTrue();
      let exist: boolean = await componentExists(driver, 'btn_native_stop');
      hilog.info(DOMAIN, TAG, BUNDLE + 'CapiUI_002, component btn_native_stop exist: %{public}s', String(exist));
      expect(exist).assertTrue();

      hilog.info(DOMAIN, TAG, BUNDLE + 'CapiUI_002, end');
    });
  });
}
