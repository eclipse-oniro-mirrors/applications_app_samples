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
import ArkTSFullLanguageGuideTest from './ArkTSFullLanguageGuide.test';
import ArkTSCommonServicesTest from './CommonServices.test';
import ArkTSCommonModulesTest from './CommonModules.test';
import ArkTSModuleSystemTest from './ModuleSystemExports.test';
import ArkTSModuleStateTest from './ModuleSystemState.test';
import ArkTSBarrelModulesTest from './BarrelAndUseModule.test';
import ArkTSSharedTypesTest from './SharedTypesUsage.test';
import ArkTSSnippetRuntimeTest from './SnippetRuntime.test';
import ArkTSUiLogBodyTest from './UiLogBody.test';
import ArkTSUiStatusTextTest from './UiStatusText.test';
import ArkTSUiNavigationTest from './UiNavigation.test';
import ArkTSUiRobustnessTest from './UiRobustness.test';
import userServiceFindMatrixTest from './UserServiceFindMatrix.test';
import BuildUrlMatrixTest from './BuildUrlMatrix.test';
import mathIdentityMatrixTest from './MathIdentityMatrix.test';
import sharedTypesMatrixTest from './SharedTypesMatrix.test';
import ProductNameMatrixTest from './ProductNameMatrix.test';
import UserRepositoryMatrixTest from './UserRepositoryMatrix.test';
import mathMatrixTest from './MathMatrix.test';
import RequestTrackerMatrixTest from './RequestTrackerMatrix.test';
import ConfigReportMatrixTest from './ConfigReportMatrix.test';
import userServiceLookupMatrixPart1Test from './UserServiceLookupMatrixPart1.test';
import userServiceLookupMatrixPart2Test from './UserServiceLookupMatrixPart2.test';
import userRepositoryBulkMatrixPart1Test from './UserRepositoryBulkMatrixPart1.test';
import userRepositoryBulkMatrixPart2Test from './UserRepositoryBulkMatrixPart2.test';
import createUserMatrixPart1Test from './CreateUserMatrixPart1.test';
import createUserMatrixPart2Test from './CreateUserMatrixPart2.test';
import productFactoryMatrixPart1Test from './ProductFactoryMatrixPart1.test';
import productFactoryMatrixPart2Test from './ProductFactoryMatrixPart2.test';
import buildUrlCompositionMatrixPart1Test from './BuildUrlCompositionMatrixPart1.test';
import buildUrlCompositionMatrixPart2Test from './BuildUrlCompositionMatrixPart2.test';
import mathArithmeticMatrixPart1Test from './MathArithmeticMatrixPart1.test';
import mathArithmeticMatrixPart2Test from './MathArithmeticMatrixPart2.test';
import userServiceBoundaryPart1Test from './UserServiceBoundaryPart1.test';
import userServiceBoundaryPart2Test from './UserServiceBoundaryPart2.test';
import sharedTypesBoundaryPart1Test from './SharedTypesBoundaryPart1.test';
import sharedTypesBoundaryPart2Test from './SharedTypesBoundaryPart2.test';
import requestTrackerSequencePart1Test from './RequestTrackerSequencePart1.test';
import requestTrackerSequencePart2Test from './RequestTrackerSequencePart2.test';
import aflgPerfPart1Test from './AflgPerfPart1.test';
import aflgStabilityPart1Test from './AflgStabilityPart1.test';
import aflgIntegrationPart1Test from './AflgIntegrationPart1.test';

export default function testsuite() {
  abilityTest();
  ArkTSFullLanguageGuideTest();
  ArkTSCommonServicesTest();
  ArkTSCommonModulesTest();
  ArkTSModuleSystemTest();
  ArkTSModuleStateTest();
  ArkTSBarrelModulesTest();
  ArkTSSharedTypesTest();
  ArkTSSnippetRuntimeTest();
  ArkTSUiLogBodyTest();
  ArkTSUiStatusTextTest();
  ArkTSUiNavigationTest();
  ArkTSUiRobustnessTest();
  userServiceFindMatrixTest();
  BuildUrlMatrixTest();
  mathIdentityMatrixTest();
  sharedTypesMatrixTest();
  ProductNameMatrixTest();
  UserRepositoryMatrixTest();
  mathMatrixTest();
  RequestTrackerMatrixTest();
  ConfigReportMatrixTest();
  userServiceLookupMatrixPart1Test();
  userServiceLookupMatrixPart2Test();
  userRepositoryBulkMatrixPart1Test();
  userRepositoryBulkMatrixPart2Test();
  createUserMatrixPart1Test();
  createUserMatrixPart2Test();
  productFactoryMatrixPart1Test();
  productFactoryMatrixPart2Test();
  buildUrlCompositionMatrixPart1Test();
  buildUrlCompositionMatrixPart2Test();
  mathArithmeticMatrixPart1Test();
  mathArithmeticMatrixPart2Test();
  userServiceBoundaryPart1Test();
  userServiceBoundaryPart2Test();
  sharedTypesBoundaryPart1Test();
  sharedTypesBoundaryPart2Test();
  requestTrackerSequencePart1Test();
  requestTrackerSequencePart2Test();
  aflgPerfPart1Test();
  aflgStabilityPart1Test();
  aflgIntegrationPart1Test();
}