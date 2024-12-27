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

export function InteropS2DTest(): void {
  console.log('Panda Test[S2D]: InteropS2DTest start!');

  let funcModName = "interopTests";
  let funcDescPre = CreatePre(funcModName);
  const funcCallRetTypeFuncName = "TestFuncCallReturnType";
  const funcCallArgFuncName = "TestFuncCallArg";

  // test-function-call-return-type
  let testFuncCallReturnType = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', funcCallRetTypeFuncName);
  testFuncCallReturnType();
  // test-function-call-arg-type
  let testFuncCallArg = globalThis.Panda.getFunction(funcDescPre + 'ETSGLOBAL;', funcCallArgFuncName);
  testFuncCallArg();

  let methodModName = "test_s2d_class_method_call";
  let methodDescPre = CreatePre(methodModName);
  const methodCallRetTypeFuncName = "TestMethodCallReturnType";
  const methodCallArgFuncName = "TestMethodCallArg";

  // test-method-call-return-type
  let testMethodCallReturnType = globalThis.Panda.getFunction(methodDescPre + 'ETSGLOBAL;', methodCallRetTypeFuncName);
  testMethodCallReturnType();
  // test-method-call-arg-type
  let testMethodCallArg = globalThis.Panda.getFunction(methodDescPre + 'ETSGLOBAL;', methodCallArgFuncName);
  testMethodCallArg();

  let convModName = "test_s2d_conversions";
  let convDescPre = CreatePre(convModName);
  const convFuncName = "TestConversion";

  // test-conversions
  let testConversion = globalThis.Panda.getFunction(convDescPre + 'ETSGLOBAL;', convFuncName);
  testConversion();

  // test operators
  let opeModName = "test_s2d_operators";
  let opeDescPre = CreatePre(opeModName);
  const opeFuncName = "TestOperators";

  let testOperators = globalThis.Panda.getFunction(opeDescPre + 'ETSGLOBAL;', opeFuncName);
  testOperators();

  // test import statements
  let impModName = "test_s2d_import_statements";
  let impDescPre = CreatePre(impModName);
  const impFuncName = "TestImportStatements";

  let testImportStatements = globalThis.Panda.getFunction(impDescPre + 'ETSGLOBAL;', impFuncName);
  testImportStatements();

  // test import statements
  let expModName = "test_s2d_simple_exception";
  let expDescPre = CreatePre(expModName);
  const expFuncName = "TestSimpleException";

  let testSimpleException = globalThis.Panda.getFunction(expDescPre + 'ETSGLOBAL;', expFuncName);
  testSimpleException();
}