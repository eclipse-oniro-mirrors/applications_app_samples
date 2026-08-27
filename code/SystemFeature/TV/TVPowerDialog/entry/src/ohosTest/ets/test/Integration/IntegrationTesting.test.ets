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

import { describe, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  createFreshDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  runSerializedUiOperation
} from '../Shared/SharedDriver';

export default function integrationTestingTest() {
  describe('IntegrationTesting_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = createFreshDriver();
      await runSerializedUiOperation(async () => {
        await driver.delayMs(1000);
      });
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });
    });
  });
}
