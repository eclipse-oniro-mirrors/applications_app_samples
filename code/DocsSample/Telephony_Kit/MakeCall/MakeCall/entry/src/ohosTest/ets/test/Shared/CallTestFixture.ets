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

import { BusinessError } from '@kit.BasicServicesKit';
import {
  CallCompletion,
  CallController,
  CallFailure,
  CallLogger,
  CallService,
  CallStateInfo,
  CallStateListener,
} from '../../../../main/ets/call/CallController';

export class FakeCallService implements CallService {
  supported: boolean = true;
  capabilityFailure: BusinessError | undefined = undefined;
  makeFailure: BusinessError | undefined = undefined;
  subscribeFailure: BusinessError | undefined = undefined;
  unsubscribeFailure: BusinessError | undefined = undefined;
  completionFailure: BusinessError | undefined = undefined;
  immediateCompletion: boolean = false;
  capabilityChecks: number = 0;
  subscribeAttempts: number = 0;
  unsubscribeAttempts: number = 0;
  requests: string[] = [];
  completions: CallCompletion[] = [];
  listeners: CallStateListener[] = [];
  removedListeners: CallStateListener[] = [];
  operations: string[] = [];

  hasVoiceCapability(): boolean {
    this.capabilityChecks++;
    this.operations.push('capability');
    if (this.capabilityFailure !== undefined) {
      const error = new Error(this.capabilityFailure.message);
      (error as BusinessError).code = this.capabilityFailure.code;
      throw error;
    }
    return this.supported;
  }

  makeCall(phoneNumber: string, callback: CallCompletion): void {
    this.operations.push('makeCall');
    if (this.makeFailure !== undefined) {
      const error = new Error(this.makeFailure.message);
      (error as BusinessError).code = this.makeFailure.code;
      throw error;
    }
    this.requests.push(phoneNumber);
    this.completions.push(callback);
    if (this.immediateCompletion) {
      callback(this.completionFailure);
    }
  }

  subscribe(listener: CallStateListener): void {
    this.subscribeAttempts++;
    this.operations.push('subscribe');
    if (this.subscribeFailure !== undefined) {
      const error = new Error(this.subscribeFailure.message);
      (error as BusinessError).code = this.subscribeFailure.code;
      throw error;
    }
    this.listeners.push(listener);
  }

  unsubscribe(listener: CallStateListener): void {
    this.unsubscribeAttempts++;
    this.operations.push('unsubscribe');
    if (this.unsubscribeFailure !== undefined) {
      const error = new Error(this.unsubscribeFailure.message);
      (error as BusinessError).code = this.unsubscribeFailure.code;
      throw error;
    }
    this.removedListeners.push(listener);
  }

  complete(index: number, error?: CallFailure): void {
    this.completions[index](error);
  }

  async completeLater(index: number, error?: CallFailure): Promise<void> {
    await Promise.resolve();
    this.complete(index, error);
  }

  emit(index: number, state: number, phoneNumber: string): void {
    const info: CallStateInfo = { state: state, number: phoneNumber };
    this.listeners[index](info);
  }
}

export class RecordedCallFailure {
  operation: string;
  code: number;
  message: string;

  constructor(operation: string, error: CallFailure) {
    this.operation = operation;
    this.code = error.code;
    this.message = error.message;
  }
}

export class RecordingCallLogger implements CallLogger {
  successes: number = 0;
  failures: RecordedCallFailure[] = [];
  states: CallStateInfo[] = [];

  success(): void {
    this.successes++;
  }

  failure(operation: string, error: CallFailure): void {
    this.failures.push(new RecordedCallFailure(operation, error));
  }

  stateChanged(info: CallStateInfo): void {
    this.states.push({ state: info.state, number: info.number });
  }
}

export class CallTestFixture {
  service: FakeCallService = new FakeCallService();
  logger: RecordingCallLogger = new RecordingCallLogger();
  controller: CallController = new CallController(this.service, this.logger);

  async yieldToEventLoop(): Promise<void> {
    /* A positive delay lets the native loop process lifecycle and watchdog events. */
    await new Promise<void>((resolve): void => {
      setTimeout((): void => {
        resolve();
      }, 10);
    });
  }

  dispose(): void {
    this.service.unsubscribeFailure = undefined;
    this.controller.dispose();
  }
}

export function makeFailure(code: number, message: string): BusinessError {
  const failure = new Error(message) as BusinessError;
  failure.code = code;
  return failure;
}
