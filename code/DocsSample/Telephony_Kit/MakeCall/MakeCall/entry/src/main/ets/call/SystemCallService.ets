/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { call, observer } from '@kit.TelephonyKit';
import { BusinessError } from '@kit.BasicServicesKit';
import hilog from '@ohos.hilog';
import { CallCompletion, CallFailure, CallLogger, CallService, CallStateInfo, CallStateListener } from './CallController';

export class SystemCallService implements CallService {
  hasVoiceCapability(): boolean {
    return call.hasVoiceCapability();
  }

  makeCall(phoneNumber: string, callback: CallCompletion): void {
    call.makeCall(phoneNumber, (error: BusinessError): void => callback(error));
  }

  subscribe(listener: CallStateListener): void {
    try {
      observer.on('callStateChange', { slotId: 0 }, listener);
    } catch (error) {
      const failure = error as BusinessError;
      const forwarded = new Error(failure.message);
      (forwarded as BusinessError).code = failure.code;
      throw forwarded;
    }
  }

  unsubscribe(listener: CallStateListener): void {
    try {
      observer.off('callStateChange', listener);
    } catch (error) {
      const failure = error as BusinessError;
      const forwarded = new Error(failure.message);
      (forwarded as BusinessError).code = failure.code;
      throw forwarded;
    }
  }
}

export class HilogCallLogger implements CallLogger {
  success(): void {
    hilog.info(0x0000, 'MakeCall', 'makeCall completed');
  }

  failure(operation: string, error: CallFailure): void {
    hilog.error(0x0000, 'MakeCall', '%{public}s failed, code: %{public}d', operation, error.code);
  }

  stateChanged(info: CallStateInfo): void {
    hilog.info(0x0000, 'MakeCall', 'Call state changed: %{public}d', info.state);
  }
}
