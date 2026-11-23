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

import harApiSmokeTest from './HarApiSmoke.test';
import nativeAddBasicMatrixTest from './NativeAddBasicMatrix.test';
import nativeAddNegativeMatrixTest from './NativeAddNegativeMatrix.test';
import nativeAddFractionMatrixTest from './NativeAddFractionMatrix.test';
import nativeAddBoundaryMatrixTest from './NativeAddBoundaryMatrix.test';
import nativeAddPrecisionMatrixTest from './NativeAddPrecisionMatrix.test';
import nativeAddSeriesMatrixTest from './NativeAddSeriesMatrix.test';
import harStringContractMatrixTest from './HarStringContractMatrix.test';
import harStringResourceMatrixTest from './HarStringResourceMatrix.test';
import harColorResourceMatrixTest from './HarColorResourceMatrix.test';
import harFloatResourceMatrixTest from './HarFloatResourceMatrix.test';
import harMediaResourceMatrixTest from './HarMediaResourceMatrix.test';
import bundleIdentityMatrixTest from './BundleIdentityMatrix.test';
import bundleModuleMatrixTest from './BundleModuleMatrix.test';
import bundleAbilityMatrixTest from './BundleAbilityMatrix.test';
import bundleBackupMatrixTest from './BundleBackupMatrix.test';
import contextMatrixTest from './ContextMatrix.test';
import abilityLifecycleMatrixTest from './AbilityLifecycleMatrix.test';
import windowMatrixTest from './WindowMatrix.test';
import indexUiMatrixTest from './IndexUiMatrix.test';
import nativeAddPerturbationMatrixTest from './NativeAddPerturbationMatrix.test';
import harStringUnicodeMatrixTest from './HarStringUnicodeMatrix.test';
import fileIoMatrixTest from './FileIoMatrix.test';
import bundleInvariantMatrixTest from './BundleInvariantMatrix.test';
import integrationChainMatrixTest from './IntegrationChainMatrix.test';

export default function testsuite() {
  harApiSmokeTest();
  nativeAddBasicMatrixTest();
  nativeAddNegativeMatrixTest();
  nativeAddFractionMatrixTest();
  nativeAddBoundaryMatrixTest();
  nativeAddPrecisionMatrixTest();
  nativeAddSeriesMatrixTest();
  harStringContractMatrixTest();
  harStringResourceMatrixTest();
  harColorResourceMatrixTest();
  harFloatResourceMatrixTest();
  harMediaResourceMatrixTest();
  bundleIdentityMatrixTest();
  bundleModuleMatrixTest();
  bundleAbilityMatrixTest();
  bundleBackupMatrixTest();
  contextMatrixTest();
  abilityLifecycleMatrixTest();
  windowMatrixTest();
  indexUiMatrixTest();
  nativeAddPerturbationMatrixTest();
  harStringUnicodeMatrixTest();
  fileIoMatrixTest();
  bundleInvariantMatrixTest();
  integrationChainMatrixTest();
}
