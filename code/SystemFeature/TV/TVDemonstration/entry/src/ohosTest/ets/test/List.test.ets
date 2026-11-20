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

import a11yTreeIntegrityContractTest from './A11yTreeIntegrityContract.test';
import abilityForegroundContractTest from './AbilityForegroundContract.test';
import abilityLifecycleContractTest from './AbilityLifecycleContract.test';
import animationUtilsContractTest from './AnimationUtilsContract.test';
import bootstrapContractTest from './BootstrapContract.test';
import bundleContractTest from './BundleContract.test';
import bundleMetadataMatrixContractTest from './BundleMetadataMatrixContract.test';
import bundleIdentityExpandedMatrixContractTest from './BundleIdentityExpandedMatrix.test';
import detailIndexPolicyMatrixContractTest from './DetailIndexPolicyMatrixContract.test';
import detailIndexPolicyExpandedMatrixContractTest from './DetailIndexPolicyExpandedMatrix.test';
import displayDiagonalMatrixContractTest from './DisplayDiagonalMatrixContract.test';
import displayDiagonalStubContractTest from './DisplayDiagonalStubContract.test';
import displayPropertyExpandedMatrixContractTest from './DisplayPropertyExpandedMatrix.test';
import productSpecDiagonalExpandedMatrixContractTest from './ProductSpecDiagonalExpandedMatrix.test';
import domainWiringContractTest from './DomainWiringContract.test';
import fileBackupContractTest from './FileBackupContract.test';
import indexHomeBehaviorContractTest from './IndexHomeBehaviorContract.test';
import mediaIntegrityContractTest from './MediaIntegrityContract.test';
import mediaPayloadExpandedMatrixContractTest from './MediaPayloadExpandedMatrix.test';
import resourceContractTest from './ResourceContract.test';
import resourceExhaustiveMatrixContractTest from './ResourceExhaustiveMatrixContract.test';
import resourceLocaleConsistencyMatrixContractTest from './ResourceLocaleConsistencyMatrixContract.test';
import resourceLocaleParityExpandedMatrixContractTest from './ResourceLocaleParityExpandedMatrix.test';
import resourceStringExpandedMatrixContractTest from './ResourceStringExpandedMatrix.test';
import appStoragePersistenceContractTest from './AppStoragePersistenceContract.test';
import backStackSemanticsContractTest from './BackStackSemanticsContract.test';
import catalogPagesContractTest from './CatalogPagesContract.test';
import crossDomainDeepChainContractTest from './CrossDomainDeepChainContract.test';
import detailContractTest from './DetailContract.test';
import domainProductTest from './DomainProduct.test';
import domainSmartTest from './DomainSmart.test';
import domainSupportTest from './DomainSupport.test';
import expandedA11y01Test from './ExpandedA11y.test';
import expandedChaosRecovery01Test from './ExpandedChaosRecovery.test';
import expandedFeatureCatalog01Test from './ExpandedFeatureCatalog.test';
import expandedFocusTest from './ExpandedFocus.test';
import expandedRecoveryTest from './ExpandedRecovery.test';
import expandedSmartCatalog01Test from './ExpandedSmartCatalog.test';
import expandedSmartDetail01Test from './ExpandedSmartDetail.test';
import expandedSupportCarousel01Test from './ExpandedSupportCarousel.test';
import globalReadabilitySweepContractTest from './GlobalReadabilitySweepContract.test';
import indexRouterContractTest from './IndexRouterContract.test';
import { layoutRenderContractTest } from './LayoutRenderContract.test';
import lifecycleLaunchContractTest from './LifecycleLaunchContract.test';
import mediaVideoContractTest from './MediaVideoContract.test';
import { pressureResilienceContractTest } from './PressureResilienceContract.test';
import screenSaverContractTest from './ScreenSaverContract.test';
import windowDisplayContractTest from './WindowDisplayContract.test';

import keyCodeValidationTest from './Validation/KeyCodeValidation.test';
import animationControllerValidationTest from './Validation/AnimationControllerValidation.test';
import commonEventUtilValidationTest from './Validation/CommonEventUtilValidation.test';
import focusNavigationTest from './Interaction/FocusNavigation.test';
import focusManagerValidationTest from './Validation/FocusManagerValidation.test';
import pointerUtilValidationTest from './Validation/PointerUtilValidation.test';
import dialogStateManagerValidationTest from './Validation/DialogStateManagerValidation.test';
import featureDetailWorkflowTest from './Domain/FeatureDetailWorkflow.test';

import animationPerformanceTest from './PerformanceStability/AnimationPerformance.test';

import featureDetailFlowTest from './Domain/FeatureDetailFlow.test';
import featureMenuConfigurationTest from './Domain/FeatureMenuConfiguration.test';
import bundleVersionValidationTest from './ContentValidation/BundleVersionValidation.test';
import lifecycleNotificationValidationTest from './ContentValidation/LifecycleNotificationValidation.test';
import offlineRenderValidationTest from './ContentValidation/OfflineRenderValidation.test';
import permissionSessionValidationTest from './ContentValidation/PermissionSessionValidation.test';
import mediaInterruptionRecoveryTest from './ContentValidation/MediaInterruptionRecovery.test';
import screenSaverSessionValidationTest from './ContentValidation/ScreenSaverSessionValidation.test';
import featureDetailLifecycleTest from './Domain/FeatureDetailLifecycle.test';
import featureDetailStateManagementTest from './Domain/FeatureDetailStateManagement.test';
import eventToolValidationTest from './ContentValidation/EventToolValidation.test';

export default function testsuite(): void {
  featureDetailFlowTest();
  featureMenuConfigurationTest();
  bundleVersionValidationTest();
  lifecycleNotificationValidationTest();
  offlineRenderValidationTest();
  permissionSessionValidationTest();
  mediaInterruptionRecoveryTest();
  screenSaverSessionValidationTest();
  featureDetailLifecycleTest();
  featureDetailStateManagementTest();
  eventToolValidationTest();
  animationPerformanceTest();
  keyCodeValidationTest();
  animationControllerValidationTest();
  commonEventUtilValidationTest();
  focusNavigationTest();
  focusManagerValidationTest();
  pointerUtilValidationTest();
  dialogStateManagerValidationTest();
  featureDetailWorkflowTest();
  bootstrapContractTest();
  a11yTreeIntegrityContractTest();
  abilityForegroundContractTest();
  abilityLifecycleContractTest();
  indexHomeBehaviorContractTest();
  bundleContractTest();
  bundleMetadataMatrixContractTest();
  bundleIdentityExpandedMatrixContractTest();
  fileBackupContractTest();
  domainWiringContractTest();
  mediaIntegrityContractTest();
  mediaPayloadExpandedMatrixContractTest();
  resourceContractTest();
  resourceExhaustiveMatrixContractTest();
  resourceStringExpandedMatrixContractTest();
  resourceLocaleParityExpandedMatrixContractTest();
  resourceLocaleConsistencyMatrixContractTest();
  detailIndexPolicyMatrixContractTest();
  displayDiagonalMatrixContractTest();
  productSpecDiagonalExpandedMatrixContractTest();
  displayDiagonalStubContractTest();
  displayPropertyExpandedMatrixContractTest();
  animationUtilsContractTest();
  detailIndexPolicyExpandedMatrixContractTest();
  appStoragePersistenceContractTest();
  backStackSemanticsContractTest();
  catalogPagesContractTest();
  crossDomainDeepChainContractTest();
  detailContractTest();

  domainProductTest();
  domainSmartTest();
  domainSupportTest();
  expandedA11y01Test();
  expandedChaosRecovery01Test();
  expandedFeatureCatalog01Test();
  expandedFocusTest();
  expandedRecoveryTest();
  expandedSmartCatalog01Test();
  expandedSmartDetail01Test();
  expandedSupportCarousel01Test();
  globalReadabilitySweepContractTest();
  indexRouterContractTest();
  layoutRenderContractTest();
  lifecycleLaunchContractTest();
  mediaVideoContractTest();
  pressureResilienceContractTest();
  screenSaverContractTest();
  windowDisplayContractTest();
}
