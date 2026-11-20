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

import constantsDataMatrixTest from './ConstantsDataMatrix.test';
import mockDataMatrixTest from './MockDataMatrix.test';
import titleDataSourceMatrixTest from './TitleDataSourceMatrix.test';
import waterFlowDataSourceMatrixTest from './WaterFlowDataSourceMatrix.test';
import viewItemModelMatrixTest from './ViewItemModelMatrix.test';
import nodePoolMatrixTest from './NodePoolMatrix.test';
import perfBudgetTest from './PerfBudget.test';
import stabilityRepeatTest from './StabilityRepeat.test';
import inputBoundaryTest from './InputBoundary.test';
import compatibilityTest from './Compatibility.test';
import i18nResourceTest from './I18nResource.test';
import recoveryIsolationTest from './RecoveryIsolation.test';
import eventListenerLifecycleTest from './EventListenerLifecycle.test';
import dataSourceMutationSequenceTest from './DataSourceMutationSequence.test';
import modelFieldContractTest from './ModelFieldContract.test';
import mockDataInvariantTest from './MockDataInvariant.test';
import dataSourceReadBoundaryTest from './DataSourceReadBoundary.test';

export default function testsuite() {
  constantsDataMatrixTest();
  mockDataMatrixTest();
  titleDataSourceMatrixTest();
  waterFlowDataSourceMatrixTest();
  viewItemModelMatrixTest();
  nodePoolMatrixTest();
  perfBudgetTest();
  stabilityRepeatTest();
  inputBoundaryTest();
  compatibilityTest();
  i18nResourceTest();
  recoveryIsolationTest();
  eventListenerLifecycleTest();
  dataSourceMutationSequenceTest();
  modelFieldContractTest();
  mockDataInvariantTest();
  dataSourceReadBoundaryTest();
}
