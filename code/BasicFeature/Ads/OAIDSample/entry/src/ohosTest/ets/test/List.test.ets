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
import oaidWantMatrixCoreTestSuite from './OaidWantMatrixCore.test';
import oaidWantMatrixTailTestSuite from './OaidWantMatrixTail.test';
import oaidBundleFlagMatrixCoreTestSuite from './OaidBundleFlagMatrixCore.test';
import oaidBundleFlagMatrixExtendedTestSuite from './OaidBundleFlagMatrixExtended.test';
import oaidBundleFlagMatrixTailTestSuite from './OaidBundleFlagMatrixTail.test';
import oaidBundleFlagAsyncMatrixCoreTestSuite from './OaidBundleFlagAsyncMatrixCore.test';
import oaidBundleFlagAsyncMatrixExtendedTestSuite from './OaidBundleFlagAsyncMatrixExtended.test';
import oaidBundleFlagAsyncMatrixTailTestSuite from './OaidBundleFlagAsyncMatrixTail.test';
import oaidBundleInfoMatrixTestSuite from './OaidBundleInfoMatrix.test';
import oaidModuleConfigMatrixTestSuite from './OaidModuleConfigMatrix.test';
import oaidResourceMatrixTestSuite from './OaidResourceMatrix.test';
import oaidWantFlagMatrixCoreTestSuite from './OaidWantFlagMatrixCore.test';
import oaidWantFlagMatrixTailTestSuite from './OaidWantFlagMatrixTail.test';
import oaidWantUriMatrixCoreTestSuite from './OaidWantUriMatrixCore.test';
import oaidWantUriMatrixExtendedTestSuite from './OaidWantUriMatrixExtended.test';
import oaidWantUriMatrixAdvancedTestSuite from './OaidWantUriMatrixAdvanced.test';
import oaidWantUriMatrixTailTestSuite from './OaidWantUriMatrixTail.test';
import oaidWantUriMatrixExtraTestSuite from './OaidWantUriMatrixExtra.test';
import oaidWantUriMatrixMoreTestSuite from './OaidWantUriMatrixMore.test';
import oaidWantUriMatrixFinalTestSuite from './OaidWantUriMatrixFinal.test';
import oaidWantUriMatrixLastTestSuite from './OaidWantUriMatrixLast.test';
import oaidWantUriMatrixNinthTestSuite from './OaidWantUriMatrixNinth.test';
import oaidPermissionMatrixTestSuite from './OaidPermissionMatrix.test';
import oaidApiMatrixTestSuite from './OaidApiMatrix.test';
import oaidDeviceMatrixTestSuite from './OaidDeviceMatrix.test';
import oaidProcessMatrixTestSuite from './OaidProcessMatrix.test';
import oaidCapabilityMatrixTestSuite from './OaidCapabilityMatrix.test';

export default function testsuite(): void {
  abilityTest();
  oaidWantMatrixCoreTestSuite();
  oaidWantMatrixTailTestSuite();
  oaidBundleFlagMatrixCoreTestSuite();
  oaidBundleFlagMatrixExtendedTestSuite();
  oaidBundleFlagMatrixTailTestSuite();
  oaidBundleFlagAsyncMatrixCoreTestSuite();
  oaidBundleFlagAsyncMatrixExtendedTestSuite();
  oaidBundleFlagAsyncMatrixTailTestSuite();
  oaidBundleInfoMatrixTestSuite();
  oaidModuleConfigMatrixTestSuite();
  oaidResourceMatrixTestSuite();
  oaidWantFlagMatrixCoreTestSuite();
  oaidWantFlagMatrixTailTestSuite();
  oaidWantUriMatrixCoreTestSuite();
  oaidWantUriMatrixExtendedTestSuite();
  oaidWantUriMatrixAdvancedTestSuite();
  oaidWantUriMatrixTailTestSuite();
  oaidWantUriMatrixExtraTestSuite();
  oaidWantUriMatrixMoreTestSuite();
  oaidWantUriMatrixFinalTestSuite();
  oaidWantUriMatrixLastTestSuite();
  oaidWantUriMatrixNinthTestSuite();
  oaidPermissionMatrixTestSuite();
  oaidApiMatrixTestSuite();
  oaidDeviceMatrixTestSuite();
  oaidProcessMatrixTestSuite();
  oaidCapabilityMatrixTestSuite();
}
