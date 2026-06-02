'use static';
/**
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

import basicTest from './basicExampleTest/BasicExample.test';
import executeOrder1 from './basicExampleTest/ExecuteOrder1.test';
import executeOrder2 from './basicExampleTest/ExecuteOrder2.test';
import executeOrder3 from './basicExampleTest/ExecuteOrder3.test';
import executeOrder4 from './basicExampleTest/ExecuteOrder4.test';
import assert from './assertExampleTest/AssertExample.test';
import custom from './customExampleTest/CustomExample.test';
import cover from './coverExampleTest/CoverExample.test';
import callBack from './callBackExampleTest/CallBackExample.test';
import customAssertTest from './customEexpect/CustomAssert.test';
import resourceReferenceTest from './resourceReferenceTest/ResourceReference.test';
import dataDriver from './dataDriver/DataDriver.test';
import paramExampleTest from './paramExampleTest/ParamExample.test'
export default function testsuite(): void {
  basicTest();
  executeOrder1();
  executeOrder2();
  executeOrder3();
  executeOrder4();
  assert();
  custom();
  cover();
  callBack();
  resourceReferenceTest();
  dataDriver();
  paramExampleTest();
  customAssertTest();
}