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
import indexCatalogPart1Test from './IndexCatalogPart1.test';
import pageButtonCatalogPart1Test from './PageButtonCatalogPart1.test';
import pageTextCatalogPart1Test from './PageTextCatalogPart1.test';
import buttonLabelTextPart1Test from './ButtonLabelTextPart1.test';
import navigationMatrixPart1Test from './NavigationMatrixPart1.test';
import stabilityRepeatPart1Test from './StabilityRepeatPart1.test';
import perfBudgetPart1Test from './PerfBudgetPart1.test';
import recoveryPart1Test from './RecoveryPart1.test';
import loggerContractPart1Test from './LoggerContractPart1.test';
import indexOrderPart1Test from './IndexOrderPart1.test';
import inputRetentionPart1Test from './InputRetentionPart1.test';
import validationGuardPart1Test from './ValidationGuardPart1.test';
import loggerVariadicPart1Test from './LoggerVariadicPart1.test';
import crossPageRevisitPart1Test from './CrossPageRevisitPart1.test';

import indexPairOrderMatrixPart1Test from './IndexPairOrderMatrixPart1.test';
import indexLabelTypeMatrixPart1Test from './IndexLabelTypeMatrixPart1.test';
import loggerCountLevelMatrixPart1Test from './LoggerCountLevelMatrixPart1.test';
import loggerCountLevelMatrixPart2Test from './LoggerCountLevelMatrixPart2.test';
import loggerCountLevelMatrixPart3Test from './LoggerCountLevelMatrixPart3.test';
export default function testsuite() {
  abilityTest();
  indexCatalogPart1Test();
  pageButtonCatalogPart1Test();
  pageTextCatalogPart1Test();
  buttonLabelTextPart1Test();
  navigationMatrixPart1Test();
  stabilityRepeatPart1Test();
  perfBudgetPart1Test();
  recoveryPart1Test();
  loggerContractPart1Test();
  indexOrderPart1Test();
  inputRetentionPart1Test();
  validationGuardPart1Test();
  loggerVariadicPart1Test();
  crossPageRevisitPart1Test();
  indexPairOrderMatrixPart1Test();
  indexLabelTypeMatrixPart1Test();
  loggerCountLevelMatrixPart1Test();
  loggerCountLevelMatrixPart2Test();
  loggerCountLevelMatrixPart3Test();
}