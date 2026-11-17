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

import builderContextTest from './BuilderContext.test';
import dataSourceListenerTest from './DataSourceListener.test';
import colorDataTest from './ColorData.test';
import friendMomentDataTest from './FriendMomentData.test';
import constantsDataTest from './ConstantsData.test';
import modelContractTest from './ModelContract.test';
import componentReuseQualityTest from './QualityDimensions.test';
import performanceMatrixTest from './PerformanceMatrix.test';
import robustnessMatrixTest from './RobustnessMatrix.test';
import dataModelContractTest from './DataModelContract.test';
import stateIsolationTest from './StateIsolation.test';
import listenerLifecycleMatrixTest from './ListenerLifecycleMatrix.test';
import interleavingMatrixTest from './InterleavingMatrix.test';
import builderContextOverwriteTest from './BuilderContextOverwriteMatrix.test';
import listenerMultiNotifyTest from './ListenerMultiNotifyMatrix.test';
import shareModelIsolationTest from './ShareModelIsolationMatrix.test';
import dataSourceAlternationTest from './DataSourceAlternationMatrix.test';
import colorModelFieldMatrixTest from './ColorModelFieldMatrix.test';
import friendMomentFieldMatrixTest from './FriendMomentFieldMatrix.test';

export default function testsuite() {
  abilityTest();
  builderContextTest();
  dataSourceListenerTest();
  colorDataTest();
  friendMomentDataTest();
  constantsDataTest();
  modelContractTest();
  componentReuseQualityTest();
  performanceMatrixTest();
  robustnessMatrixTest();
  dataModelContractTest();
  stateIsolationTest();
  listenerLifecycleMatrixTest();
  interleavingMatrixTest();
  builderContextOverwriteTest();
  listenerMultiNotifyTest();
  shareModelIsolationTest();
  dataSourceAlternationTest();
  colorModelFieldMatrixTest();
  friendMomentFieldMatrixTest();
}