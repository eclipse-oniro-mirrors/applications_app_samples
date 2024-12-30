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

export function FunctionCallTest(): void {
  console.log('Panda Test[D2S]: ================== test function call begin ==================');

  let funcModName = "interopTests";
  let funcDescPre = CreatePre(funcModName);

  // test-function-arg-null
  const nulArgFuncName = "nullArgFunc";
  let nulArgFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', nulArgFuncName);
  if (nulArgFunc(null) == null) {
    console.log('Panda Test[D2S]: test-function-arg-null Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-arg-null Failed!');
  }

  // test-function-arg-undefined
  const undefinedArgFuncName = "undefinedArgFunc";
  let undefinedArgFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', undefinedArgFuncName);
  if (undefinedArgFunc(undefined) == undefined) {
    console.log('Panda Test[D2S]: test-function-arg-undefined Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-arg-undefined Failed!');
  }

  // test-function-arg-boolean
  const booleanArgFuncName = "booleanArgFunc";
  let booleanArgFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', booleanArgFuncName);
  if (booleanArgFunc(true) == true) {
    console.log('Panda Test[D2S]: test-function-arg-boolean Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-arg-boolean Failed!');
  }

  // test-function-arg-number
  const numberArgFuncName = "numberArgFunc";
  let numberArgFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', numberArgFuncName);
  if (numberArgFunc(6) == 6) {
    console.log('Panda Test[D2S]: test-function-arg-number Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-arg-number Failed!');
  }

  // test-function-arg-bigint
  const bigintArgFuncName = "bigintArgFunc";
  let bigintArgFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', bigintArgFuncName);
  if (bigintArgFunc(0n) == 0n) {
    console.log('Panda Test[D2S]: test-function-arg-bigint Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-arg-bigint Failed!');
  }

  // test-function-arg-string
  const stringArgFuncName = "stringArgFunc";
  let stringArgFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', stringArgFuncName);
  if (stringArgFunc("hello") == "hello") {
    console.log('Panda Test[D2S]: test-function-arg-string Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-arg-string Failed!');
  }

  // test-function-arg-class-instance
  let instAA = new ClassA();
  const classInstArgFuncName = "classInstArgFunc";
  let classInstArgFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', classInstArgFuncName);
  if (classInstArgFunc(instAA.num) == 123) {
    console.log('Panda Test[D2S]: test-function-arg-class-instance Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-arg-class-instance Failed!');
  }

  // test-function-return-value-number
  const numberRetValFuncName = "numberRetValFunc";
  let numberRetValFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', numberRetValFuncName);
  if (numberRetValFunc() == 1) {
    console.log('Panda Test[D2S]: test-function-return-value-number Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-return-value-number Failed!');
  }

  // test-function-return-value-byte
  const byteRetValFuncName = "byteRetValFunc";
  let byteRetValFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', byteRetValFuncName);
  if (byteRetValFunc() == 1) {
    console.log('Panda Test[D2S]: test-function-return-value-byte Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-return-value-byte Failed!');
  }

  // test-function-return-value-short
  const shortRetValFuncName = "shortRetValFunc";
  let shortRetValFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', shortRetValFuncName);
  if (shortRetValFunc() == 0) {
    console.log('Panda Test[D2S]: test-function-return-value-short Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-return-value-short Failed!');
  }

  // test-function-return-value-int
  const intRetValFuncName = "intRetValFunc";
  let intRetValFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', intRetValFuncName);
  if (intRetValFunc() == 1) {
    console.log('Panda Test[D2S]: test-function-return-value-int Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-return-value-int Failed!');
  }

  // test-function-return-value-long
  const longRetValFuncName = "longRetValFunc";
  let longRetValFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', longRetValFuncName);
  if (longRetValFunc() == 0) {
    console.log('Panda Test[D2S]: test-function-return-value-long Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-return-value-long Failed!');
  }

  // test-function-return-value-float
  const floatRetValFuncName = "floatRetValFunc";
  let floatRetValFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', floatRetValFuncName);
  if (floatRetValFunc() == 0.0) {
    console.log('Panda Test[D2S]: test-function-return-value-float Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-return-value-float Failed!');
  }

  // test-function-return-value-double
  const doubleRetValFuncName = "doubleRetValFunc";
  let doubleRetValFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', doubleRetValFuncName);
  if (doubleRetValFunc() == 0.0) {
    console.log('Panda Test[D2S]: test-function-return-value-double Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-return-value-double Failed!');
  }

  // test-function-return-value-char
  const charRetValFuncName = "charRetValFunc";
  let charRetValFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', charRetValFuncName);
  if (charRetValFunc() == "3") {
    console.log('Panda Test[D2S]: test-function-return-value-char Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-return-value-char Failed!');
  }

  // test-function-return-value-boolean
  const booleanRetValFuncName = "booleanRetValFunc";
  let booleanRetValFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', booleanRetValFuncName);
  if (booleanRetValFunc() == false) {
    console.log('Panda Test[D2S]: test-function-return-value-boolean Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-return-value-boolean Failed!');
  }

  // test-function-return-value-string
  const stringRetValFuncName = "stringRetValFunc";
  let stringRetValFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', stringRetValFuncName);
  if (stringRetValFunc() == "hi") {
    console.log('Panda Test[D2S]: test-function-return-value-string Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-return-value-string Failed!');
  }

  // test-function-return-value-bigint
  const bigintRetValFuncName = "bigintRetValFunc";
  let bigintRetValFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', bigintRetValFuncName);
  if (bigintRetValFunc() == 0n) {
    console.log('Panda Test[D2S]: test-function-return-value-bigint Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-return-value-bigint Failed!');
  }

  // test-function-return-value-null
  const nullRetValFuncName = "nullRetValFunc";
  let nullRetValFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', nullRetValFuncName);
  if (nullRetValFunc() == null) {
    console.log('Panda Test[D2S]: test-function-return-value-null Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-return-value-null Failed!');
  }

  // test-function-return-value-undefined
  const undefinedRetValFuncName = "undefinedRetValFunc";
  let undefinedRetValFunc = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', undefinedRetValFuncName);
  if (undefinedRetValFunc() == undefined) {
    console.log('Panda Test[D2S]: test-function-return-value-undefined Passed!');
  } else {
    console.log('Panda Test[D2S]: test-function-return-value-undefined Failed!');
  }
}