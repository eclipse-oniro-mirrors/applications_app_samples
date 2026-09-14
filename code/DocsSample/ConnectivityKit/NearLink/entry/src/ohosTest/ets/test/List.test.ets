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

import abilityTest from './Ability.test';
import mainPageNavigationTest from './MainPageNavigation.test';
import managerPageTest from './ManagerPage.test';
import advertisingPageTest from './AdvertisingPage.test';
import scanConfigPageTest from './ScanConfigPage.test';
import ssapServerPageTest from './SsapServerPage.test';
import ssapClientPageTest from './SsapClientPage.test';
import dataTransferPageTest from './DataTransferPage.test';
import cdsmPageTest from './CdsmPage.test';

export default function testsuite() {
  abilityTest();
  mainPageNavigationTest();
  managerPageTest();
  advertisingPageTest();
  scanConfigPageTest();
  ssapServerPageTest();
  ssapClientPageTest();
  dataTransferPageTest();
  cdsmPageTest();
}
