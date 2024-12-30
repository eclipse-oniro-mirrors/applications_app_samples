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

export function ConversionsTest(): void {
  globalThis.Panda = globalThis.requireNapi("ets_interop_js_napi", false);
  console.log('Panda Test[D2S]: ================== test conversions begin ==================');

  let converModName = "interopTests";
  let converDescPre = CreatePre(converModName);
  const converClassName = "ConversionsClass";

  // test-conversions-number
  let testConversions = globalThis.Panda.getClass(converDescPre + converClassName + ";");
  let testConversionsRet = new testConversions('testConversions');
  let jsNumber = testConversionsRet.stsNumber;
  if (typeof jsNumber == 'number') {
    console.log('Panda Test[D2S]: test-conversions-number Passed!');
  } else {
    console.log('Panda Test[D2S]: test-conversions-number Failed!');
  }

  // test-conversions-byte
  let jsByte = testConversionsRet.stsByte;
  if (typeof jsByte == 'number') {
    console.log('Panda Test[D2S]: test-conversions-byte Passed!');
  } else {
    console.log('Panda Test[D2S]: test-conversions-byte Failed!');
  }

  // test-conversions-short
  let jsShort = testConversionsRet.stsShort;
  if (typeof jsShort == 'number') {
    console.log('Panda Test[D2S]: test-conversions-short Passed!');
  } else {
    console.log('Panda Test[D2S]: test-conversions-short Failed!');
  }

  // test-conversions-int
  let jsInt = testConversionsRet.stsShort;
  if (typeof jsInt == 'number') {
    console.log('Panda Test[D2S]: test-conversions-int Passed!');
  } else {
    console.log('Panda Test[D2S]: test-conversions-int Failed!');
  }

  // test-conversions-long
  let jsLong = testConversionsRet.stsLong;
  if (typeof jsLong == 'number') {
    console.log('Panda Test[D2S]: test-conversions-long Passed!');
  } else {
    console.log('Panda Test[D2S]: test-conversions-long Failed!');
  }

  // test-conversions-float
  let jsFloat = testConversionsRet.stsFloat;
  if (typeof jsFloat == 'number') {
    console.log('Panda Test[D2S]: test-conversions-float Passed!');
  } else {
    console.log('Panda Test[D2S]: test-conversions-float Failed!');
  }

  // test-conversions-double
  let jsDouble = testConversionsRet.stsDouble;
  if (typeof jsDouble == 'number') {
    console.log('Panda Test[D2S]: test-conversions-double Passed!');
  } else {
    console.log('Panda Test[D2S]: test-conversions-double Failed!');
  }

  // test-conversions-char
  let jsChar = testConversionsRet.stsChar;
  let typeChar = typeof jsChar;
  if (typeof jsChar == 'string') {
    console.log('Panda Test[D2S]: test-conversions-char Passed!');
  } else {
    console.log(`Panda Test[D2S]: test-conversions-char Failed! expected string but got ${typeChar}`);
  }

  // test-conversions-boolean
  let jsBoolean = testConversionsRet.stsBoolean;
  if (typeof jsBoolean == 'boolean') {
    console.log('Panda Test[D2S]: test-conversions-boolean Passed!');
  } else {
    console.log('Panda Test[D2S]: test-conversions-boolean Failed!');
  }

  // test-conversions-string
  let jsString = testConversionsRet.stsString;
  if (typeof jsString == 'string') {
    console.log('Panda Test[D2S]: test-conversions-string Passed!');
  } else {
    console.log('Panda Test[D2S]: test-conversions-string Failed!');
  }

  // test-conversions-bigint
  let jsBigint = testConversionsRet.stsBigint;
  if (typeof jsBigint == 'bigint') {
    console.log('Panda Test[D2S]: test-conversions-bigint Passed!');
  } else {
    console.log('Panda Test[D2S]: test-conversions-bigint Failed!');
  }

  // test-conversions-enum
  // let jsEnum = testConversionsRet.stsEnum;
  // if (typeof jsEnum == 'string') {
  //   console.log('Panda Test[D2S]: test-conversions-enum Passed!');
  // } else {
  //   console.log('Panda Test[D2S]: test-conversions-enum Failed!');
  // }

  // test-conversions-literal
  // let jsLiteral = testConversionsRet.stsLiteral;
  // if (typeof jsLiteral == 'string') {
  //   console.log('Panda Test[D2S]: test-conversions-literal Passed!');
  // } else {
  //   console.log('Panda Test[D2S]: test-conversions-literal Failed!');
  // }

  // test-conversions-undefined
  let jsUndefined = testConversionsRet.stsUndefined;
  if (typeof jsUndefined == 'undefined') {
    console.log('Panda Test[D2S]: test-conversions-undefined Passed!');
  } else {
    console.log('Panda Test[D2S]: test-conversions-undefined Failed!');
  }

  // test-conversions-null
  let jsNull = testConversionsRet.stsNull;
  if (typeof jsNull == 'object') { // object?
    console.log('Panda Test[D2S]: test-conversions-null Passed!');
  } else {
    console.log('Panda Test[D2S]: test-conversions-null Failed!');
  }
}