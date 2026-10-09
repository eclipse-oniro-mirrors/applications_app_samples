/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start idl_ts_service_implementation]
import {testIntTransactionCallback} from './i_idl_test_service';
import {testStringTransactionCallback} from './i_idl_test_service';
import {testMapTransactionCallback} from './i_idl_test_service';
import {testArrayTransactionCallback} from './i_idl_test_service';
import IdlTestServiceStub from './idl_test_service_stub';

export default class IdlTestImp extends IdlTestServiceStub {

  testIntTransaction(data: number, callback: testIntTransactionCallback): void {
    callback(0, data + 1);
  }
  testStringTransaction(data: string, callback: testStringTransactionCallback): void {
    callback(0);
  }
  testMapTransaction(data: Map<number, number>, callback: testMapTransactionCallback): void {
    callback(0);
  }
  testArrayTransaction(data: string[], callback: testArrayTransactionCallback): void {
    callback(0, 1);
  }
}
// [End idl_ts_service_implementation]
