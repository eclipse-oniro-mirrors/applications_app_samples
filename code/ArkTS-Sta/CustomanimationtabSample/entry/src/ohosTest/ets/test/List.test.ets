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

import contextContractTest from './Model/ContextContract.test';
import resourceContractTest from './Model/ResourceContract.test';
import resourceInventoryTest from './Model/ResourceInventory.test';
import tabModelIntegrationTest from './Model/TabModelIntegration.test';
import skeletonModelTest from './Model/SkeletonModel.test';
import swiperModelTest from './Model/SwiperModel.test';
import tabConsistencyContractTest from './Model/TabConsistencyContract.test';
import tabHistoryPropertyTest from './Model/TabHistoryProperty.test';
import tabIndicatorContractTest from './Model/TabIndicatorContract.test';
import tabLayoutModelTest from './Model/TabLayoutModel.test';
import tabLayoutScrollContractTest from './Model/TabLayoutScrollContract.test';
import tabModelDeepTest from './Model/TabModelDeep.test';
import tabNumericBoundaryTest from './Model/TabNumericBoundary.test';
import tabOperationCatalogTest from './Model/TabOperationCatalog.test';
import tabOperationPairTest from './Model/TabOperationPair.test';
import tabOperationTripleTest from './Model/TabOperationTriple.test';
import tabSnapshotMatrixTest from './Model/TabSnapshotMatrix.test';
import tabIndicatorParityTest from './Model/TabIndicatorParity.test';
import tabPropertyFuzzTest from './Model/TabPropertyFuzz.test';
import tabSnapshotContractTest from './Model/TabSnapshotContract.test';
import tabStateManagementTest from './Model/TabStateManagement.test';
import tabStatsPropertyTest from './Model/TabStatsProperty.test';
import tabTransitionTableTest from './Model/TabTransitionTable.test';
import tabValidatorBoundaryTest from './Model/TabValidatorBoundary.test';
import tabModelSecurityTest from './Model/TabModelSecurity.test';
import tabModelValidationTest from './Model/TabModelValidation.test';

export default function testsuite(): void {
  // Pure model and contract suites.
  tabModelDeepTest();
  tabStateManagementTest();
  tabLayoutModelTest();
  swiperModelTest();
  skeletonModelTest();
  tabOperationCatalogTest();
  tabHistoryPropertyTest();
  tabNumericBoundaryTest();
  tabStatsPropertyTest();
  tabPropertyFuzzTest();
  tabConsistencyContractTest();
  tabSnapshotContractTest();
  tabIndicatorContractTest();
  tabLayoutScrollContractTest();
  tabValidatorBoundaryTest();
  tabTransitionTableTest();
  tabOperationPairTest();
  tabOperationTripleTest();
  tabSnapshotMatrixTest();
  tabIndicatorParityTest();
  tabModelValidationTest();
  tabModelIntegrationTest();
  tabModelSecurityTest();
  resourceContractTest();
  resourceInventoryTest();
  contextContractTest();

  // UI interaction suites.
}




