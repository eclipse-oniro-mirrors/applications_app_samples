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

import harExportContractTest from './HarExportContract.test';
import harAggregationContractTest from './HarAggregationContract.test';
import harBoundaryContractTest from './HarBoundaryContract.test';
import harStabilityContractTest from './HarStabilityContract.test';
import harExportValueCoreTest from './HarExportValueCore.test';
import harExportTypeCoreTest from './HarExportTypeCore.test';
import harExportShapeCoreTest from './HarExportShapeCore.test';
import harExportNameCoreTest from './HarExportNameCore.test';
import harAggregationPackageCoreTest from './HarAggregationPackageCore.test';
import harAggregationDeepCoreTest from './HarAggregationDeepCore.test';
import harAggregationChainCoreTest from './HarAggregationChainCore.test';
import harAggregationValueCoreTest from './HarAggregationValueCore.test';
import harStringBoundaryCoreTest from './HarStringBoundaryCore.test';
import harNumberBoundaryCoreTest from './HarNumberBoundaryCore.test';
import harNameBoundaryCoreTest from './HarNameBoundaryCore.test';
import harConstantsCoreTest from './HarConstantsCore.test';
import harConstantsBoundaryTest from './HarConstantsBoundary.test';
import harStabilityReadCoreTest from './HarStabilityReadCore.test';
import harStabilityAggregateCoreTest from './HarStabilityAggregateCore.test';
import harImmutabilityCoreTest from './HarImmutabilityCore.test';
import harPerformanceReadCoreTest from './HarPerformanceReadCore.test';
import harPerformanceAggregateCoreTest from './HarPerformanceAggregateCore.test';
import harComponentCoreTest from './HarComponentCore.test';
import harComponentBoundaryCoreTest from './HarComponentBoundaryCore.test';

export default function testsuite() {
  abilityTest();
  harExportContractTest();
  harAggregationContractTest();
  harBoundaryContractTest();
  harStabilityContractTest();
  harExportValueCoreTest();
  harExportTypeCoreTest();
  harExportShapeCoreTest();
  harExportNameCoreTest();
  harAggregationPackageCoreTest();
  harAggregationDeepCoreTest();
  harAggregationChainCoreTest();
  harAggregationValueCoreTest();
  harStringBoundaryCoreTest();
  harNumberBoundaryCoreTest();
  harNameBoundaryCoreTest();
  harConstantsCoreTest();
  harConstantsBoundaryTest();
  harStabilityReadCoreTest();
  harStabilityAggregateCoreTest();
  harImmutabilityCoreTest();
  harPerformanceReadCoreTest();
  harPerformanceAggregateCoreTest();
  harComponentCoreTest();
  harComponentBoundaryCoreTest();
}