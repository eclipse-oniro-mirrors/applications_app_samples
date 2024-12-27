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

class ClassA {
  num = 123;
}

export function ClassMethodCallTest(): void {
  console.log('Panda Test[D2S]: ================== test method call begin ==================');

  let methodModName = "interopTests";
  let methodDescPre = CreatePre(methodModName);
  const methodClassName = "TestMyClass";

  // test-method-arg-null
  let testMethod = globalThis.Panda.getClass(methodDescPre + methodClassName + ";");
  let testMethodRet = new testMethod('testMethod');
  if (testMethodRet.nullArgMethod(null) == null) {
    console.log('Panda Test[D2S]: test-method-arg-null Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-arg-null Failed!');
  }

  // test-method-arg-undefined
  if (testMethodRet.undefinedArgMethod(undefined) == undefined) {
    console.log('Panda Test[D2S]: test-method-arg-undefined Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-arg-undefined Failed!');
  }

  // test-method-arg-boolean
  if (testMethodRet.booleanArgMethod(true) == true) {
    console.log('Panda Test[D2S]: test-method-arg-boolean Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-arg-boolean Failed!');
  }

  // test-method-arg-number
  if (testMethodRet.numberArgMethod(6) == 6) {
    console.log('Panda Test[D2S]: test-method-arg-number Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-arg-number Failed!');
  }

  // test-method-arg-bigint
  if (testMethodRet.bigintArgMethod(0n) == 0n) {
    console.log('Panda Test[D2S]: test-method-arg-bigint Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-arg-bigint Failed!');
  }

  // test-method-arg-string
  if (testMethodRet.stringArgMethod("hello") == "hello") {
    console.log('Panda Test[D2S]: test-method-arg-string Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-arg-string Failed!');
  }

  // test-method-arg-class-instance
  let instA = new ClassA();
  if (testMethodRet.classInstArgMethod(instA.num) == 123) {
    console.log('Panda Test[D2S]: test-method-arg-class-instance Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-arg-class-instance Failed!');
  }

  // test-method-return-value-number
  if (testMethodRet.numberRetValMethod() == 1) {
    console.log('Panda Test[D2S]: test-method-return-value-number Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-return-value-number Failed!');
  }

  // test-method-return-value-byte
  if (testMethodRet.byteRetValMethod() == 1) {
    console.log('Panda Test[D2S]: test-method-return-value-byte Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-return-value-byte Failed!');
  }

  // test-method-return-value-short
  if (testMethodRet.shortRetValMethod() == 0) {
    console.log('Panda Test[D2S]: test-method-return-value-short Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-return-value-short Failed!');
  }

  // test-method-return-value-int
  if (testMethodRet.intRetValMethod() == 1) {
    console.log('Panda Test[D2S]: test-method-return-value-int Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-return-value-int Failed!');
  }

  // test-method-return-value-long
  if (testMethodRet.longRetValMethod() == 0) {
    console.log('Panda Test[D2S]: test-method-return-value-long Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-return-value-long Failed!');
  }

  // test-method-return-value-float
  if (testMethodRet.floatRetValMethod() == 0.0) {
    console.log('Panda Test[D2S]: test-method-return-value-float Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-return-value-float Failed!');
  }

  // test-method-return-value-double
  if (testMethodRet.doubleRetValMethod() == 0.0) {
    console.log('Panda Test[D2S]: test-method-return-value-double Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-return-value-double Failed!');
  }

  // test-method-return-value-char
  if (testMethodRet.charRetValMethod() == "3") {
    console.log('Panda Test[D2S]: test-method-return-value-char Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-return-value-char Failed!');
  }

  // test-method-return-value-boolean
  if (testMethodRet.booleanRetValMethod() == false) {
    console.log('Panda Test[D2S]: test-method-return-value-boolean Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-return-value-boolean Failed!');
  }

  // test-method-return-value-string
  if (testMethodRet.stringRetValMethod() == "hi") {
    console.log('Panda Test[D2S]: test-method-return-value-string Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-return-value-string Failed!');
  }

  // test-method-return-value-bigint
  if (testMethodRet.bigintRetValMethod() == 0n) {
    console.log('Panda Test[D2S]: test-method-return-value-bigint Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-return-value-bigint Failed!');
  }

  // test-method-return-value-enum
  // if (testMethodRet.enumRetValMethod() == "green") {
  //   console.log('Panda Test[D2S]: test-method-return-value-enum Passed!');
  // } else {
  //   console.log('Panda Test[D2S]: test-method-return-value-enum Failed!');
  // }

  // test-method-return-value-literal
  // if (testMethodRet.literalRetValMethod() == "1") {
  //   console.log('Panda Test[D2S]: test-method-return-value-literal Passed!');
  // } else {
  //   console.log('Panda Test[D2S]: test-method-return-value-literal Failed!');
  // }

  // test-method-return-value-null
  if (testMethodRet.nullRetValMethod() == null) {
    console.log('Panda Test[D2S]: test-method-return-value-null Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-return-value-null Failed!');
  }

  // test-method-return-value-undefined
  if (testMethodRet.undefinedRetValMethod() == undefined) {
    console.log('Panda Test[D2S]: test-method-return-value-undefined Passed!');
  } else {
    console.log('Panda Test[D2S]: test-method-return-value-undefined Failed!');
  }
}