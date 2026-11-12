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

import DriverProbeTest from './DriverProbe.test';
import CommonProblem01Test from './Ability.test';
import ProbeSmokeTest from './ProbeSmoke.test';
import BundleSignatureContractTest from './BundleSignatureContract.test';
import BundleFlagsMatrixTest from './BundleFlagsMatrix.test';
import BundleAppInfoContractTest from './BundleAppInfoContract.test';
import BundleErrorCodeMatrixTest from './BundleErrorCodeMatrix.test';

import SignatureInfoTest from './SignatureInfo.test';

import bundleQualityTest from './BundleQualityDimensions.test';
import bundleFlagCompatMatrixTest from './BundleFlagCompatMatrix.test';
import bundleRobustnessMatrixTest from './BundleRobustnessMatrix.test';
import bundlePerformanceMatrixTest from './BundlePerformanceMatrix.test';
import bundleRecoveryMatrixTest from './BundleRecoveryMatrix.test';
import bundleInterleaveMatrixTest from './BundleInterleaveMatrix.test';
import bundleFlagStabilityMatrixTest from './BundleFlagStabilityMatrix.test';

import bundleConcurrentQueryTest from './BundleConcurrentQueryMatrix.test';
import bundleApiSurfaceTest from './BundleApiSurfaceMatrix.test';
import bundleFieldGateTest from './BundleFieldGateMatrix.test';
import bundleAsyncPerformanceTest from './BundleAsyncPerformanceMatrix.test';
import bundleAlternationStabilityTest from './BundleAlternationStability.test';
import bundleFieldContentTest from './BundleFieldContentMatrix.test';

import bundleAppIdTest from './BundleAppId.test';
import bundleAppIdentifierTest from './BundleAppIdentifier.test';
import bundleFingerprintTest from './BundleFingerprint.test';
import bundleFieldTest from './BundleField.test';
import bundleModuleTest from './BundleModule.test';
import bundleSignatureMatrixTest from './BundleSignatureMatrix.test';
export default function testsuite() {
  DriverProbeTest();
  CommonProblem01Test();
  ProbeSmokeTest();
  BundleSignatureContractTest();
  BundleFlagsMatrixTest();
  BundleAppInfoContractTest();
  BundleErrorCodeMatrixTest();

  SignatureInfoTest();
  bundleQualityTest();
  bundleFlagCompatMatrixTest();
  bundleRobustnessMatrixTest();
  bundlePerformanceMatrixTest();
  bundleRecoveryMatrixTest();
  bundleInterleaveMatrixTest();
  bundleFlagStabilityMatrixTest();
  bundleConcurrentQueryTest();
  bundleApiSurfaceTest();
  bundleFieldGateTest();
  bundleAppIdTest();
  bundleAppIdentifierTest();
  bundleFingerprintTest();
  bundleFieldTest();
  bundleModuleTest();
  bundleSignatureMatrixTest();
  bundleAsyncPerformanceTest();
  bundleAlternationStabilityTest();
  bundleFieldContentTest();
}
