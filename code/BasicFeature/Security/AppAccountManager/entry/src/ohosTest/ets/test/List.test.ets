/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import appTest from './App.test'
import keyBuildTest from './KeyBuildVolume01.test'
import errorCodeTest from './ErrorCodeVolume01.test'
import structureTest from './StructureVolume01.test'
import metadataTest from './MetadataReal01.test'
import catalogIndexTest from './CatalogIndex01.test'
import dataSourceSeqTest from './DataSourceSeq01.test'
import accountDataTest from './AccountDataVolume01.test'
import storeIsolationTest from './StoreIsolation01.test'
import accountModelTest from './AccountModelVolume01.test'
import serviceRealTest from './ServiceReal01.test'
import serviceBoundaryTest from './ServiceBoundary01.test'
import emailTest01 from './EmailVolume01.test'
import emailTest02 from './EmailVolume02.test'
import emailTest03 from './EmailVolume03.test'
import passwordTest01 from './PasswordVolume01.test'
import passwordTest02 from './PasswordVolume02.test'
import registerValidateTest01 from './RegisterValidateVolume01.test'
import registerValidateTest02 from './RegisterValidateVolume02.test'
import registerValidateTest03 from './RegisterValidateVolume03.test'
import modifyValidateTest01 from './ModifyValidateVolume01.test'
import modifyValidateTest02 from './ModifyValidateVolume02.test'
import registerPriorityTest from './RegisterPriority01.test'
import modifyPriorityTest from './ModifyPriority01.test'
import loginMatrixTest from './LoginMatrix01.test'
import validateRealTest from './ValidateReal01.test'
import flowValidateRealTest from './FlowValidateReal01.test'
import accountUiFlowTest from './AccountUiFlow01.test'
import accountUiWideTest from './AccountUiWide01.test'
import uiStateTest from './UiState01.test'

export default function testsuite() {
  appTest()
  keyBuildTest()
  errorCodeTest()
  structureTest()
  metadataTest()
  catalogIndexTest()
  dataSourceSeqTest()
  accountDataTest()
  storeIsolationTest()
  accountModelTest()
  serviceRealTest()
  serviceBoundaryTest()
  emailTest01()
  emailTest02()
  emailTest03()
  passwordTest01()
  passwordTest02()
  registerValidateTest01()
  registerValidateTest02()
  registerValidateTest03()
  modifyValidateTest01()
  modifyValidateTest02()
  registerPriorityTest()
  modifyPriorityTest()
  loginMatrixTest()
  validateRealTest()
  flowValidateRealTest()
  accountUiFlowTest()
  accountUiWideTest()
  uiStateTest()
}