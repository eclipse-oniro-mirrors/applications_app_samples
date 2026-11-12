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

import bundleAppIdCoreTest from './BundleAppIdCore.test';
import bundleAppIdExtendedTest from './BundleAppIdExtended.test';
import bundleAppIdAdvancedTest from './BundleAppIdAdvanced.test';
import bundleAppIdTailTest from './BundleAppIdTail.test';
import bundleAppIdentifierCoreTest from './BundleAppIdentifierCore.test';
import bundleAppIdentifierExtendedTest from './BundleAppIdentifierExtended.test';
import bundleAppIdentifierAdvancedTest from './BundleAppIdentifierAdvanced.test';
import bundleAppIdentifierTailTest from './BundleAppIdentifierTail.test';
import bundleFingerprintCoreTest from './BundleFingerprintCore.test';
import bundleFingerprintExtendedTest from './BundleFingerprintExtended.test';
import bundleFingerprintAdvancedTest from './BundleFingerprintAdvanced.test';
import bundleFingerprintTailTest from './BundleFingerprintTail.test';
import bundleFieldCoreTest from './BundleFieldCore.test';
import bundleFieldExtendedTest from './BundleFieldExtended.test';
import bundleFieldAdvancedTest from './BundleFieldAdvanced.test';
import bundleFieldTailTest from './BundleFieldTail.test';
import bundleModuleCoreTest from './BundleModuleCore.test';
import bundleModuleExtendedTest from './BundleModuleExtended.test';
import bundleModuleAdvancedTest from './BundleModuleAdvanced.test';
import bundleModuleTailTest from './BundleModuleTail.test';
import bundleSignatureMatrixCoreTest from './BundleSignatureMatrixCore.test';
import bundleSignatureMatrixExtendedTest from './BundleSignatureMatrixExtended.test';
import bundleSignatureMatrixAdvancedTest from './BundleSignatureMatrixAdvanced.test';
import bundleSignatureMatrixTailTest from './BundleSignatureMatrixTail.test';

export default function testsuite() {
  DriverProbeTest();
  CommonProblem01Test();
  ProbeSmokeTest();
  BundleSignatureContractTest();
  BundleFlagsMatrixTest();
  BundleAppInfoContractTest();
  BundleErrorCodeMatrixTest();

  SignatureInfoTest();
  bundleAppIdCoreTest();
  bundleAppIdExtendedTest();
  bundleAppIdAdvancedTest();
  bundleAppIdTailTest();
  bundleAppIdentifierCoreTest();
  bundleAppIdentifierExtendedTest();
  bundleAppIdentifierAdvancedTest();
  bundleAppIdentifierTailTest();
  bundleFingerprintCoreTest();
  bundleFingerprintExtendedTest();
  bundleFingerprintAdvancedTest();
  bundleFingerprintTailTest();
  bundleFieldCoreTest();
  bundleFieldExtendedTest();
  bundleFieldAdvancedTest();
  bundleFieldTailTest();
  bundleModuleCoreTest();
  bundleModuleExtendedTest();
  bundleModuleAdvancedTest();
  bundleModuleTailTest();
  bundleSignatureMatrixCoreTest();
  bundleSignatureMatrixExtendedTest();
  bundleSignatureMatrixAdvancedTest();
  bundleSignatureMatrixTailTest();
}
