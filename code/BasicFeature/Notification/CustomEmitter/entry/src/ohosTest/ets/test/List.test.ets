/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import customEmitterEventDispatchTest from './CustomEmitterEventDispatch.test';
import customEmitterOnceSemanticsTest from './CustomEmitterOnceSemantics.test';
import customEmitterChannelSeparationTest from './CustomEmitterChannelSeparation.test';
import customEmitterBoundaryTest from './CustomEmitterBoundary.test';
import customEmitterStabilityTest from './CustomEmitterStability.test';
import customEmitterInterleaveTest from './CustomEmitterInterleave.test';
import productDataContractTest from './ProductDataContract.test';
import shopCartDataContractTest from './ShopCartDataContract.test';
import tabTitleContractTest from './TabTitleContract.test';
import customEmitterPayloadTypeTest from './CustomEmitterPayloadType.test';
import productInfoMatrixTest from './ProductInfoMatrix.test';
import customEmitterPerformanceTest from './CustomEmitterPerformance.test';
import customEmitterRecoveryTest from './CustomEmitterRecovery.test';
import customEmitterGlobalBusTest from './CustomEmitterGlobalBus.test';
import customEmitterListenerMatrixTest from './CustomEmitterListenerMatrix.test';
import dataCompatibilityTest from './DataCompatibility.test';
import mockDataBoundaryTest from './MockDataBoundary.test';

export default function testsuite() {
  abilityTest();
  customEmitterEventDispatchTest();
  customEmitterOnceSemanticsTest();
  customEmitterChannelSeparationTest();
  customEmitterBoundaryTest();
  customEmitterStabilityTest();
  customEmitterInterleaveTest();
  productDataContractTest();
  shopCartDataContractTest();
  tabTitleContractTest();
  customEmitterPayloadTypeTest();
  productInfoMatrixTest();
  customEmitterPerformanceTest();
  customEmitterRecoveryTest();
  customEmitterGlobalBusTest();
  customEmitterListenerMatrixTest();
  dataCompatibilityTest();
  mockDataBoundaryTest();
}