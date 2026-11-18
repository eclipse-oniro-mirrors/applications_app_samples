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
import sampleWantMatrixTestSuite from './SampleWantMatrix.test';
import sampleWantFlagMatrixCoreTestSuite from './SampleWantFlagMatrixCore.test';
import sampleWantFlagMatrixTailTestSuite from './SampleWantFlagMatrixTail.test';
import sampleWantUriMatrixCoreTestSuite from './SampleWantUriMatrixCore.test';
import sampleWantUriMatrixExtendedTestSuite from './SampleWantUriMatrixExtended.test';
import sampleWantUriMatrixAdvancedTestSuite from './SampleWantUriMatrixAdvanced.test';
import sampleWantUriMatrixTailTestSuite from './SampleWantUriMatrixTail.test';
import sampleWantUriMatrixExtraTestSuite from './SampleWantUriMatrixExtra.test';
import sampleWantUriMatrixMoreTestSuite from './SampleWantUriMatrixMore.test';
import sampleWantUriMatrixFinalTestSuite from './SampleWantUriMatrixFinal.test';
import sampleWantUriMatrixLastTestSuite from './SampleWantUriMatrixLast.test';
import sampleBundleFlagMatrixCoreTestSuite from './SampleBundleFlagMatrixCore.test';
import sampleBundleFlagMatrixExtendedTestSuite from './SampleBundleFlagMatrixExtended.test';
import sampleBundleFlagMatrixTailTestSuite from './SampleBundleFlagMatrixTail.test';
import sampleBundleFlagAsyncMatrixCoreTestSuite from './SampleBundleFlagAsyncMatrixCore.test';
import sampleBundleFlagAsyncMatrixExtendedTestSuite from './SampleBundleFlagAsyncMatrixExtended.test';
import sampleBundleFlagAsyncMatrixTailTestSuite from './SampleBundleFlagAsyncMatrixTail.test';
import sampleBundleInfoMatrixTestSuite from './SampleBundleInfoMatrix.test';
import sampleModuleConfigMatrixTestSuite from './SampleModuleConfigMatrix.test';
import sampleAbilityInfoMatrixTestSuite from './SampleAbilityInfoMatrix.test';
import samplePermissionMatrixTestSuite from './SamplePermissionMatrix.test';
import sampleDeviceMatrixTestSuite from './SampleDeviceMatrix.test';
import sampleProcessMatrixTestSuite from './SampleProcessMatrix.test';
import sampleCapabilityMatrixTestSuite from './SampleCapabilityMatrix.test';
import sampleResourceMatrixTestSuite from './SampleResourceMatrix.test';
import bundleMgmtInfoByNameMatrixTestSuite from './BundleMgmtInfoByNameMatrix.test';
import bundleMgmtLaunchWantMatrixTestSuite from './BundleMgmtLaunchWantMatrix.test';
import bundleMgmtProfileMatrixTestSuite from './BundleMgmtProfileMatrix.test';
import bundleMgmtExtensionMatrixTestSuite from './BundleMgmtExtensionMatrix.test';
import bundleMgmtUidMatrixTestSuite from './BundleMgmtUidMatrix.test';
import bundleMgmtIconMatrixTestSuite from './BundleMgmtIconMatrix.test';

export default function testsuite(): void {
  abilityTest();
  sampleWantMatrixTestSuite();
  sampleWantFlagMatrixCoreTestSuite();
  sampleWantFlagMatrixTailTestSuite();
  sampleWantUriMatrixCoreTestSuite();
  sampleWantUriMatrixExtendedTestSuite();
  sampleWantUriMatrixAdvancedTestSuite();
  sampleWantUriMatrixTailTestSuite();
  sampleWantUriMatrixExtraTestSuite();
  sampleWantUriMatrixMoreTestSuite();
  sampleWantUriMatrixFinalTestSuite();
  sampleWantUriMatrixLastTestSuite();
  sampleBundleFlagMatrixCoreTestSuite();
  sampleBundleFlagMatrixExtendedTestSuite();
  sampleBundleFlagMatrixTailTestSuite();
  sampleBundleFlagAsyncMatrixCoreTestSuite();
  sampleBundleFlagAsyncMatrixExtendedTestSuite();
  sampleBundleFlagAsyncMatrixTailTestSuite();
  sampleBundleInfoMatrixTestSuite();
  sampleModuleConfigMatrixTestSuite();
  sampleAbilityInfoMatrixTestSuite();
  samplePermissionMatrixTestSuite();
  sampleDeviceMatrixTestSuite();
  sampleProcessMatrixTestSuite();
  sampleCapabilityMatrixTestSuite();
  sampleResourceMatrixTestSuite();
  bundleMgmtInfoByNameMatrixTestSuite();
  bundleMgmtLaunchWantMatrixTestSuite();
  bundleMgmtProfileMatrixTestSuite();
  bundleMgmtExtensionMatrixTestSuite();
  bundleMgmtUidMatrixTestSuite();
  bundleMgmtIconMatrixTestSuite();
}
