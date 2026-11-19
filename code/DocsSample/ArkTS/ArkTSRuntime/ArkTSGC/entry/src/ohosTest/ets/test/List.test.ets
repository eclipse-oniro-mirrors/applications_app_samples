/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import abilityTest from './Ability.test';
import hintGcGuardTest from './HintGcGuard.test';
import cyclicReferenceMatrixTest from './CyclicReferenceMatrix.test';
import cyclicReferenceSequenceTest from './CyclicReferenceSequence.test';
import gcRuntimeStatTableTest from './GcRuntimeStatTable.test';
import vmMemoryInvariantTest from './VmMemoryInvariant.test';
import bundleConfigGuardTest from './BundleConfigGuard.test';
import resourceGuardTest from './ResourceGuard.test';
import abilityLifecycleSequenceTest from './AbilityLifecycleSequence.test';
import indexUiTest from './IndexUi.test';
import gcWeakRefLifecycleTest from './GcWeakRefLifecycle.test';
import gcFinalizationRegistryTest from './GcFinalizationRegistry.test';
import gcObjectGraphTest from './GcObjectGraph.test';
import gcStatSamplingTest from './GcStatSampling.test';
import gcStatErrorMatrixTest from './GcStatErrorMatrix.test';
import vmHeapMatrixTest from './VmHeapMatrix.test';
import bundleSelfInfoTest from './BundleSelfInfo.test';
import resourceStringMatrixTest from './ResourceStringMatrix.test';
import resourceColorMatrixTest from './ResourceColorMatrix.test';
import resourceMediaMatrixTest from './ResourceMediaMatrix.test';
import bundleModuleMatrixTest from './BundleModuleMatrix.test';
import bundleErrorMatrixTest from './BundleErrorMatrix.test';
import abilityLifecycleMatrixTest from './AbilityLifecycleMatrix.test';
import abilityWindowMatrixTest from './AbilityWindowMatrix.test';
import appContextMatrixTest from './AppContextMatrix.test';
import runtimeIntegrationMatrixTest from './RuntimeIntegrationMatrix.test';

export default function testsuite() {
  abilityTest();
  hintGcGuardTest();
  cyclicReferenceMatrixTest();
  cyclicReferenceSequenceTest();
  gcRuntimeStatTableTest();
  vmMemoryInvariantTest();
  bundleConfigGuardTest();
  resourceGuardTest();
  abilityLifecycleSequenceTest();
  indexUiTest();
  gcWeakRefLifecycleTest();
  gcFinalizationRegistryTest();
  gcObjectGraphTest();
  gcStatSamplingTest();
  gcStatErrorMatrixTest();
  vmHeapMatrixTest();
  bundleSelfInfoTest();
  resourceStringMatrixTest();
  resourceColorMatrixTest();
  resourceMediaMatrixTest();
  bundleModuleMatrixTest();
  bundleErrorMatrixTest();
  abilityLifecycleMatrixTest();
  abilityWindowMatrixTest();
  appContextMatrixTest();
  runtimeIntegrationMatrixTest();
}
