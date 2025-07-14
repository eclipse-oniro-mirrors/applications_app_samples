/**
 *
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import { AsyncCallback, BusinessError, Callback, ErrorCallback } from '@ohos.base';
import hilog from '@ohos.hilog';

const SYNTAX_ERROR_CODE: double = 1002;

export class MyCallback {
  static myCallback(callback: Callback<string>): void {
    hilog.info(0x0000, 'testTag', 'myCallback');
    callback('myCallback');
  }

  static myAsyncCallback(callback: AsyncCallback<string, string>): void {
    hilog.info(0x0000, 'testTag', 'myAsyncCallback');
    let error = new Error('Business Error', 'basicError2 message', undefined);
    let be2: BusinessError<string> = new BusinessError<string>(SYNTAX_ERROR_CODE, error);
    callback(be2, 'yAsyncCallback');
  }

  static myErrorCallback(callback: ErrorCallback<BusinessError<string>>): void {
    hilog.info(0x0000, 'testTag', 'myErrorCallback');
    let error = new Error('Business Error', 'myErrorCallback message', undefined);
    let result: string = 'test';
    let be: BusinessError<string> = new BusinessError<string>(SYNTAX_ERROR_CODE, result, error);
    callback(be);
  }

  static runCasesOfCallback() {
    MyCallback.myCallback((data: string) => {
      hilog.info(0x0000, 'testTag', 'MyCallback' + data);
    })
    MyCallback.myAsyncCallback((error: BusinessError<string> | null , result: string | undefined) => {
      if(error){
        hilog.info(0x0000, 'testTag', `myAsyncCallback, error: ${error.message}, result:${result}`);
      }
    })
    MyCallback.myErrorCallback((error: BusinessError<string>) => {
      hilog.info(0x0000, 'testTag', `myAsyncCallback, error: ${error.message}`);
    })
  }
}