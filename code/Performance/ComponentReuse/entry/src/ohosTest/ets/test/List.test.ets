/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import builderContextCoreTest from './BuilderContextCore.test';
import builderContextExtendedTest from './BuilderContextExtended.test';
import builderContextAdvancedTest from './BuilderContextAdvanced.test';
import builderContextTailTest from './BuilderContextTail.test';
import dataSourceListenerCoreTest from './DataSourceListenerCore.test';
import dataSourceListenerExtendedTest from './DataSourceListenerExtended.test';
import dataSourceListenerAdvancedTest from './DataSourceListenerAdvanced.test';
import dataSourceListenerTailTest from './DataSourceListenerTail.test';
import colorDataCoreTest from './ColorDataCore.test';
import colorDataExtendedTest from './ColorDataExtended.test';
import colorDataAdvancedTest from './ColorDataAdvanced.test';
import colorDataTailTest from './ColorDataTail.test';
import friendMomentDataCoreTest from './FriendMomentDataCore.test';
import friendMomentDataExtendedTest from './FriendMomentDataExtended.test';
import friendMomentDataAdvancedTest from './FriendMomentDataAdvanced.test';
import friendMomentDataTailTest from './FriendMomentDataTail.test';
import constantsDataCoreTest from './ConstantsDataCore.test';
import constantsDataExtendedTest from './ConstantsDataExtended.test';
import constantsDataAdvancedTest from './ConstantsDataAdvanced.test';
import constantsDataTailTest from './ConstantsDataTail.test';
import modelContractCoreTest from './ModelContractCore.test';
import modelContractExtendedTest from './ModelContractExtended.test';
import modelContractAdvancedTest from './ModelContractAdvanced.test';
import modelContractTailTest from './ModelContractTail.test';

export default function testsuite() {
  abilityTest();
  builderContextCoreTest();
  builderContextExtendedTest();
  builderContextAdvancedTest();
  builderContextTailTest();
  dataSourceListenerCoreTest();
  dataSourceListenerExtendedTest();
  dataSourceListenerAdvancedTest();
  dataSourceListenerTailTest();
  colorDataCoreTest();
  colorDataExtendedTest();
  colorDataAdvancedTest();
  colorDataTailTest();
  friendMomentDataCoreTest();
  friendMomentDataExtendedTest();
  friendMomentDataAdvancedTest();
  friendMomentDataTailTest();
  constantsDataCoreTest();
  constantsDataExtendedTest();
  constantsDataAdvancedTest();
  constantsDataTailTest();
  modelContractCoreTest();
  modelContractExtendedTest();
  modelContractAdvancedTest();
  modelContractTailTest();
}