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

export function ExceptionsTest(): void {
  console.log('Panda Test[D2S]: ================== test exceptions begin ==================');

  let exceptionsModName = "interopTests";
  let exceptionsDescPre = CreatePre(exceptionsModName);
  const errorFuncName = "ErrorFunc";
  const customErrorFuncName = "CustomErrorFunc";

  // test-throw-error
  let testThrowError = globalThis.Panda.getFunction(exceptionsDescPre + 'ETSGLOBAL;', errorFuncName);
  try {
    testThrowError();
  } catch (e) {
    // console.log(e.msg);
    console.log('Panda Test[D2S]: test-throw-error Passed!');
  }

  // test-throw-custom-error / test-point-error-prop
  let testThrowCustomError = globalThis.Panda.getFunction(exceptionsDescPre + 'ETSGLOBAL;', customErrorFuncName);
  try {
    testThrowCustomError();
  } catch (e) {
    console.log(e.msg);
    console.log('Panda Test[D2S]: test-throw-custom-error Passed!');
  }
}