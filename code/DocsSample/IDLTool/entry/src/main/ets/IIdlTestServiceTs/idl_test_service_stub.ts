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

// [Start idl_ts_stub]
import { testIntTransactionCallback } from './i_idl_test_service';
import { testStringTransactionCallback } from './i_idl_test_service';
import { testMapTransactionCallback } from './i_idl_test_service';
import { testArrayTransactionCallback } from './i_idl_test_service';
import IIdlTestService from './i_idl_test_service';
import { rpc } from '@kit.IPCKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN = 0x0000;
const TAG = 'IdlTestServiceStub';

export default class IdlTestServiceStub extends rpc.RemoteObject implements IIdlTestService {
  constructor(des: string) {
    super(des);
  }

  async onRemoteMessageRequest(code: number, data: rpc.MessageSequence, reply: rpc.MessageSequence,
    option: rpc.MessageOption): Promise<boolean> {
    hilog.info(DOMAIN, TAG, 'onRemoteMessageRequest called, code = %{public}d', code);
    if (code === IdlTestServiceStub.COMMAND_TEST_INT_TRANSACTION) {
      let _data = data.readInt();
      this.testIntTransaction(_data, (errCode: number, returnValue: number) => {
        reply.writeInt(errCode);
        if (errCode === 0) {
          reply.writeInt(returnValue);
        }
      });
      return true;
    } else if (code === IdlTestServiceStub.COMMAND_TEST_STRING_TRANSACTION) {
      let _data = data.readString();
      this.testStringTransaction(_data, (errCode: number) => {
        reply.writeInt(errCode);
      });
      return true;
    } else if (code === IdlTestServiceStub.COMMAND_TEST_MAP_TRANSACTION) {
      let _data: Map<number, number> = new Map();
      let _dataSize = data.readInt();
      for (let i = 0; i < _dataSize; ++i) {
        let key = data.readInt();
        let value = data.readInt();
        _data.set(key, value);
      }
      this.testMapTransaction(_data, (errCode: number) => {
        reply.writeInt(errCode);
      });
      return true;
    } else if (code === IdlTestServiceStub.COMMAND_TEST_ARRAY_TRANSACTION) {
      let _data = data.readStringArray();
      this.testArrayTransaction(_data, (errCode: number, returnValue: number) => {
        reply.writeInt(errCode);
        if (errCode === 0) {
          reply.writeInt(returnValue);
        }
      });
      return true;
    } else {
      hilog.error(DOMAIN, TAG, 'invalid request code: %{public}d', code);
    }
    return false;
  }

  testIntTransaction(data: number, callback: testIntTransactionCallback): void {
  }

  testStringTransaction(data: string, callback: testStringTransactionCallback): void {
  }

  testMapTransaction(data: Map<number, number>, callback: testMapTransactionCallback): void {
  }

  testArrayTransaction(data: string[], callback: testArrayTransactionCallback): void {
  }

  static readonly COMMAND_TEST_INT_TRANSACTION = 1;
  static readonly COMMAND_TEST_STRING_TRANSACTION = 2;
  static readonly COMMAND_TEST_MAP_TRANSACTION = 3;
  static readonly COMMAND_TEST_ARRAY_TRANSACTION = 4;
}
// [End idl_ts_stub]
