/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
import matrixTest from './Matrix.test';
import timeMatrixTest from './TimeMatrix.test';
import expandedTimeTest from './TimeMatrixExpanded.test';
import expandedTime2Test from './TimeMatrixExpanded2.test';
import qualityApiTest from './QualityApi.test';
import qualityStorageTest from './QualityStorage.test';
import qualityStorage2Test from './QualityStorage2.test';
import qualityStorage3Test from './QualityStorage3.test';
import qualityTimeTest from './QualityTime.test';
import qualityTime2Test from './QualityTime2.test';
import timeMatrix300Test from './TimeMatrix300.test';
import timeExtra20Test from './TimeMatrixExtra20.test';
import dateBoundaryExtraTest from './DateBoundaryExtra.test';
import dateLeapExtraTest from './DateLeapExtra.test';
import prefKeyExtraTest from './PrefKeyExtra.test';
import apiModelExtraTest from './ApiModelExtra.test';
import constantRelationExtraTest from './ConstantRelationExtra.test';
import dateRolloverExtraTest from './DateRolloverExtra.test';
import prefKeyConflictExtraTest from './PrefKeyConflictExtra.test';
import apiOptionalExtraTest from './ApiOptionalExtra.test';
import invalidInputExtraTest from './InvalidInputExtra.test';
import dateVariantExtraTest from './DateVariantExtra.test';
import prefVariantExtraTest from './PrefVariantExtra.test';
import apiVariantExtraTest from './ApiVariantExtra.test';
import timeMatrix210Test from './TimeMatrix210.test';
import timeMatrix25Test from './TimeMatrix25.test';
import timeMatrix2Test from './TimeMatrix2.test';
import timeMatrix629Test from './TimeMatrix629.test';
import dateMatrixExtraTest from './DateMatrixExtra.test';
import dateMatrix200Test from './DateMatrix200.test';
import dateMatrix6Test from './DateMatrix6.test';
import contractTest from './Contract.test';
import boundaryTest from './Boundary.test';
import extraTest from './Extra.test';

export default function testsuite() {
  abilityTest();
  matrixTest();
  timeMatrixTest();
  expandedTimeTest();
  expandedTime2Test();
  qualityApiTest();
  qualityStorageTest();
  qualityStorage2Test();
  qualityStorage3Test();
  qualityTimeTest();
  qualityTime2Test();
  timeMatrix300Test();
  timeExtra20Test();
  dateBoundaryExtraTest();
  dateLeapExtraTest();
  prefKeyExtraTest();
  apiModelExtraTest();
  constantRelationExtraTest();
  dateRolloverExtraTest();
  prefKeyConflictExtraTest();
  apiOptionalExtraTest();
  invalidInputExtraTest();
  dateVariantExtraTest();
  prefVariantExtraTest();
  apiVariantExtraTest();
  timeMatrix210Test();
  timeMatrix25Test();
  timeMatrix2Test();
  timeMatrix629Test();
  dateMatrixExtraTest();
  dateMatrix200Test();
  dateMatrix6Test();
  contractTest();
  boundaryTest();
  extraTest();
}