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
import baseLogicTest from './BaseLogic.test';
import gridLayoutDataTest from './GridLayoutData.test';
import constantsExtendedTest from './ConstantsExtended.test';
import beansExtendedTest from './BeansExtended.test';
import gridLayoutItemInfoParseTest from './GridLayoutItemInfoParse.test';
import dataSourceExtendedTest from './DataSourceExtended.test';
import checkEmptyUtilsEdgeTest from './CheckEmptyUtilsEdge.test';
import formModelCacheTest from './FormModelCache.test';
import resourceManagerCacheTest from './ResourceManagerCache.test';
import dataSourceListenerTest from './DataSourceListener.test';
import rdbContractTest from './RdbContract.test';
import gridLayoutMatrixExtendedTest from './GridLayoutMatrixExtended.test';
import beanMatrixExtendedTest from './BeanMatrixExtended.test';
import resourceManagerAsyncTest from './ResourceManagerAsync.test';
import desktopLayoutPositionTest from './DesktopLayoutPosition.test';
import gridLayoutItemInfoEdgeTest from './GridLayoutItemInfoEdge.test';
import launcherAbilityModelMatrixTest from './LauncherAbilityModelMatrix.test';
import launcherPermissionModelMatrixTest from './LauncherPermissionModelMatrix.test';
import launcherLaunchContractTest from './LauncherLaunchContract.test';
import launcherAppInfoDeepTest from './LauncherAppInfoDeep.test';
import launcherModuleDeepTest from './LauncherModuleDeep.test';
import launcherServiceExtensionDeepTest from './LauncherServiceExtensionDeep.test';
import launcherBundleDeep2Test from './LauncherBundleDeep2.test';
import launcherPermissionDeep2Test from './LauncherPermissionDeep2.test';
import launcherAbilityFinalTest from './LauncherAbilityFinal.test';
import bundleContractTest from './BundleContract.test';

export default function testsuite() {
  abilityTest();
  baseLogicTest();
  gridLayoutDataTest();
  constantsExtendedTest();
  beansExtendedTest();
  gridLayoutItemInfoParseTest();
  dataSourceExtendedTest();
  checkEmptyUtilsEdgeTest();
  formModelCacheTest();
  resourceManagerCacheTest();
  dataSourceListenerTest();
  rdbContractTest();
  gridLayoutMatrixExtendedTest();
  beanMatrixExtendedTest();
  resourceManagerAsyncTest();
  desktopLayoutPositionTest();
  gridLayoutItemInfoEdgeTest();
  launcherAbilityModelMatrixTest();
  launcherPermissionModelMatrixTest();
  launcherLaunchContractTest();
  launcherAppInfoDeepTest();
  launcherModuleDeepTest();
  launcherServiceExtensionDeepTest();
  launcherBundleDeep2Test();
  launcherPermissionDeep2Test();
  launcherAbilityFinalTest();
  bundleContractTest();
}
