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

// [Start idl_ts_proxy]
import { testIntTransactionCallback } from './i_idl_test_service';
import { testStringTransactionCallback } from './i_idl_test_service';
import { testMapTransactionCallback } from './i_idl_test_service';
import { testArrayTransactionCallback } from './i_idl_test_service';
import IIdlTestService from './i_idl_test_service';
import { rpc } from '@kit.IPCKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import IdlTestServiceStub from './idl_test_service_stub';

const DOMAIN = 0x0000;
const TAG = 'IdlTestServiceProxy';

export default class IdlTestServiceProxy implements IIdlTestService {
  private remote: rpc.IRemoteObject;

  constructor(remote: rpc.IRemoteObject) {
    this.remote = remote;
  }

  testIntTransaction(data: number, callback: testIntTransactionCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = new rpc.MessageSequence();
    let replySequence = new rpc.MessageSequence();
    dataSequence.writeInt(data);
    this.remote.sendMessageRequest(
      IdlTestServiceStub.COMMAND_TEST_INT_TRANSACTION,
      dataSequence,
      replySequence,
      option
    ).then((result: rpc.RequestResult) => {
      if (result.errCode !== 0) {
        hilog.error(DOMAIN, TAG, 'sendMessageRequest failed, errCode: %{public}d', result.errCode);
        return;
      }
      let errCode = replySequence.readInt();
      let ret = 0;
      if (errCode === 0) {
        ret = replySequence.readInt();
      }
      callback(errCode, ret);
    }).catch((err: Error) => {
      hilog.error(DOMAIN, TAG, 'catch err: %{public}s', JSON.stringify(err));
    });
  }

  testStringTransaction(data: string, callback: testStringTransactionCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = new rpc.MessageSequence();
    let replySequence = new rpc.MessageSequence();
    dataSequence.writeString(data);
    this.remote.sendMessageRequest(
      IdlTestServiceStub.COMMAND_TEST_STRING_TRANSACTION,
      dataSequence,
      replySequence,
      option
    ).then((result: rpc.RequestResult) => {
      if (result.errCode !== 0) {
        hilog.error(DOMAIN, TAG, 'sendMessageRequest failed, errCode: %{public}d', result.errCode);
        return;
      }
      let errCode = replySequence.readInt();
      callback(errCode);
    }).catch((err: Error) => {
      hilog.error(DOMAIN, TAG, 'catch err: %{public}s', JSON.stringify(err));
    });
  }

  testMapTransaction(data: Map<number, number>, callback: testMapTransactionCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = new rpc.MessageSequence();
    let replySequence = new rpc.MessageSequence();
    dataSequence.writeInt(data.size);
    data.forEach((value: number, key: number) => {
      dataSequence.writeInt(key);
      dataSequence.writeInt(value);
    });
    this.remote.sendMessageRequest(
      IdlTestServiceStub.COMMAND_TEST_MAP_TRANSACTION,
      dataSequence,
      replySequence,
      option
    ).then((result: rpc.RequestResult) => {
      if (result.errCode !== 0) {
        hilog.error(DOMAIN, TAG, 'sendMessageRequest failed, errCode: %{public}d', result.errCode);
        return;
      }
      let errCode = replySequence.readInt();
      callback(errCode);
    }).catch((err: Error) => {
      hilog.error(DOMAIN, TAG, 'catch err: %{public}s', JSON.stringify(err));
    });
  }

  testArrayTransaction(data: string[], callback: testArrayTransactionCallback): void {
    let option = new rpc.MessageOption();
    let dataSequence = new rpc.MessageSequence();
    let replySequence = new rpc.MessageSequence();
    dataSequence.writeStringArray(data);
    this.remote.sendMessageRequest(
      IdlTestServiceStub.COMMAND_TEST_ARRAY_TRANSACTION,
      dataSequence,
      replySequence,
      option
    ).then((result: rpc.RequestResult) => {
      if (result.errCode !== 0) {
        hilog.error(DOMAIN, TAG, 'sendMessageRequest failed, errCode: %{public}d', result.errCode);
        return;
      }
      let errCode = replySequence.readInt();
      let ret = 0;
      if (errCode === 0) {
        ret = replySequence.readInt();
      }
      callback(errCode, ret);
    }).catch((err: Error) => {
      hilog.error(DOMAIN, TAG, 'catch err: %{public}s', JSON.stringify(err));
    });
  }
}
// [End idl_ts_proxy]
