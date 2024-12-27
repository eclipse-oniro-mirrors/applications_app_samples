/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { CreatePre } from './CreatePre'

export function OperatorsTest(): void {
  console.log('Panda Test[D2S]: ================== test operators begin ==================');

  let operatorModName = "interopTests";
  let operatorDescPre = CreatePre(operatorModName);
  const funcName = "TestNewConstructor";
  const className = "TestOperatorClass";

  // test-new-constructor / test-()-function-call
  // let testNewConstructor = globalThis.Panda.getFunction(operatorDescPre + 'ETSGLOBAL;', funcName);
  // let testNewConstructorRet = new testNewConstructor(10);
  // if (testNewConstructorRet.age == 10) {
  //   console.log('Panda Test[D2S]: test-new-constructor Passed!');
  // } else {
  //   console.log('Panda Test[D2S]: test-new-constructor Failed!');
  // }

  // test-new-class-instance / test-()-constructor-call
  // test-point-class-instance-prop / test-[]-class-instance-attr
  let testOperatorClass = globalThis.Panda.getClass(operatorDescPre + className + ";");
  let testOperatorClassRet = new testOperatorClass('TestOperatorClass');
  if (testOperatorClassRet.name == "TestOperatorClass") {
    const related_tests = `test-new-class-instance / test-()-constructor-call /
    test-point-class-instance-prop / test-[]-class-instance-attr`;
    console.log(`Panda Test[D2S]: ${related_tests} Passed!`);
  } else {
    const related_tests = `test-new-class-instance / test-()-constructor-call /
    test-point-class-instance-prop / test-[]-class-instance-attr`;
    console.log(`Panda Test[D2S]: ${related_tests} Failed!`);
  }

  // test-[]-access-arr-element
  let testAccessArrEleRet = new testOperatorClass('testAccessArrEleRet');
  if (testAccessArrEleRet.arr[1] == 2) {
    console.log('Panda Test[D2S]: test-[]-access-arr-element Passed!');
  } else {
    console.log('Panda Test[D2S]: test-[]-access-arr-element Failed!');
  }

  // test-[]-access-json-str
  let testAccessJsonStrRet = new testOperatorClass('testAccessJsonStrRet');
  const jsonData = JSON.parse(testAccessJsonStrRet.jsonStr);
  if (jsonData['age'] == 30) {
    console.log('Panda Test[D2S]: test-[]-access-json-str Passed!');
  } else {
    console.log('Panda Test[D2S]: test-[]-access-json-str Failed!');
  }

  // test-point-class-instance-static-prop
  if (testOperatorClass.pi == 3.14) {
    console.log('Panda Test[D2S]: test-point-class-instance-static-prop Passed!');
  } else {
    console.log('Panda Test[D2S]: test-point-class-instance-static-prop Failed!');
  }

  // test-point-class-instance-static-method
  if (testOperatorClass.getPI() == 3.14) {
    console.log('Panda Test[D2S]: test-point-class-instance-static-method Passed!');
  } else {
    console.log('Panda Test[D2S]: test-point-class-instance-static-method Failed!');
  }

  // test-()-method-call / test-point-class-instance-method
  let testParenthesisMethodCallRet = new testOperatorClass('TestParenthesisMethodCall');
  if (testParenthesisMethodCallRet.myMethod() == 10) {
    const related_tests = `test-()-method-call / test-point-class-instance-method`;
    console.log(`Panda Test[D2S]: ${related_tests} Passed!`);
  } else {
    const related_tests = `test-()-method-call / test-point-class-instance-method`;
    console.log(`Panda Test[D2S]: ${related_tests} Failed!`);
  }

  // test-()-anonymous-function-call not support
  // let testParenthesisAnonyCallRet = new testOperatorClass('testParenthesisAnonyCallRet');
  // let myAnonymousFunc = testParenthesisAnonyCallRet.myAnonymous()
  // if (myAnonymousFunc(1) == 1) {
  //   console.log('Panda Test[D2S]: test-()-anonymous-function-call Passed!');
  // } else {
  //   console.log('Panda Test[D2S]: test-()-anonymous-function-call Failed!');
  // }

  // test-()-arrow-function-call
  let testParenthesisArrowCallRet = new testOperatorClass('testParenthesisArrowCallRet');
  if (testParenthesisArrowCallRet.arrow() == "arrow return") {
    console.log('Panda Test[D2S]: test-()-arrow-function-call Passed!');
  } else {
    console.log('Panda Test[D2S]: test-()-arrow-function-call Failed!');
  }
}