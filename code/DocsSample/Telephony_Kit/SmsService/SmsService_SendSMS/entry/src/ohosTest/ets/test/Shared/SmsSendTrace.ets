/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { expect } from '@ohos/hypium';
import { AsyncCallback, BusinessError } from '@kit.BasicServicesKit';
import { sms } from '@kit.TelephonyKit';
import { sendTextSms, SmsSendCallbacks, SmsTextRequest } from '../../../../main/ets/service/SmsSender';

export enum SmsTraceRequest {
  Primary = 'primary',
  Secondary = 'secondary',
}

export interface SmsTraceStep {
  action: () => void;
  dispatches: SmsTraceRequest[];
  callbacks: string[];
}

interface SmsTraceCall {
  request: SmsTraceRequest;
  options: sms.SendMessageOptions;
  complete: AsyncCallback<void>;
}

type NativeCallback<T> = (error: BusinessError | null, data: T | undefined) => void;

class TraceError extends Error implements BusinessError {
  code: number;

  constructor(code: number, message: string) {
    super(message);
    this.code = code;
  }
}

function invokeCallback<T>(callback: AsyncCallback<T> | undefined, error: BusinessError | null,
  data: T | undefined): void {
  const nativeCallback = callback as NativeCallback<T> | undefined;
  if (nativeCallback === undefined) {
    throw new Error('Missing transport callback');
  }
  nativeCallback(error, data);
}

function errorLabel(error: BusinessError | null): string {
  if (error === null) {
    return 'ok';
  }
  return `${error.code}/${error.message}`;
}

export function makeSmsTraceRequest(request: SmsTraceRequest): SmsTextRequest {
  if (request === SmsTraceRequest.Primary) {
    return {
      slotId: 1,
      destinationHost: '+12025550141',
      serviceCenter: '+12025550199',
      destinationPort: 1024,
      content: 'Meet at the platform.\nBring ticket A.',
    };
  }
  return {
    slotId: 0,
    destinationHost: '+442079460082',
    serviceCenter: '',
    destinationPort: 0,
    content: 'Station B\n\u5230\u8FBE\uD83D\uDE89',
  };
}

export function expectSmsOptions(options: sms.SendMessageOptions, expected: SmsTextRequest): void {
  expect(options.slotId).assertEqual(expected.slotId);
  expect(options.destinationHost).assertEqual(expected.destinationHost);
  expect(options.serviceCenter).assertEqual(expected.serviceCenter);
  expect(options.destinationPort).assertEqual(expected.destinationPort);
  expect(options.content).assertEqual(expected.content);
}

export class SmsSendTrace {
  private calls: SmsTraceCall[] = [];
  private callbackLog: string[] = [];
  private sharedCallbacks: SmsSendCallbacks = this.makeCallbacks('original');
  private replacementCallbacks: SmsSendCallbacks = this.makeCallbacks('replacement');

  private makeCallbacks(receiver: string): SmsSendCallbacks {
    return {
      onComplete: (error): void => {
        this.callbackLog.push(`${receiver}/complete/${errorLabel(error)}`);
      },
      onSend: (error, result): void => {
        const body = result === undefined ? 'missing' : `${result.result}/${result.url}/${result.isLastPart}`;
        this.callbackLog.push(`${receiver}/send/${errorLabel(error)}/${body}`);
      },
      onDelivery: (error, report): void => {
        const body = report === undefined ? 'missing' : report.pdu.join(',');
        this.callbackLog.push(`${receiver}/delivery/${errorLabel(error)}/${body}`);
      },
    };
  }

  private dispatch(request: SmsTraceRequest, draft: SmsTextRequest, callbacks: SmsSendCallbacks): void {
    sendTextSms(draft, callbacks, (options, complete): void => {
      this.calls.push({ request, options, complete });
    });
  }

  submit(request: SmsTraceRequest): void {
    this.dispatch(request, makeSmsTraceRequest(request), this.makeCallbacks(request));
  }

  submitWithSharedCallbacks(request: SmsTraceRequest): void {
    this.dispatch(request, makeSmsTraceRequest(request), this.sharedCallbacks);
  }

  submitDraft(draft: SmsTextRequest): void {
    this.dispatch(SmsTraceRequest.Primary, draft, this.makeCallbacks(SmsTraceRequest.Primary));
  }

  rebindCompletion(): void {
    this.sharedCallbacks.onComplete = this.replacementCallbacks.onComplete;
  }

  rebindSend(): void {
    this.sharedCallbacks.onSend = this.replacementCallbacks.onSend;
  }

  rebindDelivery(): void {
    this.sharedCallbacks.onDelivery = this.replacementCallbacks.onDelivery;
  }

  private getCall(request: SmsTraceRequest): SmsTraceCall {
    const call = this.calls.find((record) => record.request === request);
    if (call === undefined) {
      throw new Error(`No dispatch for ${request}`);
    }
    return call;
  }

  accept(request: SmsTraceRequest): void {
    invokeCallback<void>(this.getCall(request).complete, null, undefined);
  }

  denyPermission(request: SmsTraceRequest): void {
    const error = new TraceError(201, 'Permission denied');
    invokeCallback<void>(this.getCall(request).complete, error, undefined);
  }

  sendResult(request: SmsTraceRequest, result: sms.SendSmsResult, url: string, isLastPart: boolean): void {
    const report: sms.ISendShortMessageCallback = { result, url, isLastPart };
    invokeCallback(this.getCall(request).options.sendCallback, null, report);
  }

  deliver(request: SmsTraceRequest, pdu: number[]): void {
    const report: sms.IDeliveryShortMessageCallback = { pdu };
    invokeCallback(this.getCall(request).options.deliveryCallback, null, report);
  }

  reportDeliveryUnavailable(request: SmsTraceRequest): void {
    const error = new TraceError(8300002, 'Delivery report unavailable');
    invokeCallback(this.getCall(request).options.deliveryCallback, error, undefined);
  }

  verify(steps: SmsTraceStep[]): void {
    for (const step of steps) {
      const previousCallbacks = this.callbackLog.length;
      step.action();
      const emitted = this.callbackLog.slice(previousCallbacks);
      const requests = this.calls.map((call) => call.request);
      expect(requests).assertDeepEquals(step.dispatches);
      expect(emitted).assertDeepEquals(step.callbacks);
      for (const call of this.calls) {
        expectSmsOptions(call.options, makeSmsTraceRequest(call.request));
      }
    }
  }

  verifyDrafts(before: SmsTextRequest, after: SmsTextRequest): void {
    expect(this.calls.length).assertEqual(2);
    const firstOptions = this.calls[0].options;
    const secondOptions = this.calls[1].options;
    const distinctOptions = firstOptions !== secondOptions;
    expect(distinctOptions).assertTrue();
    expectSmsOptions(firstOptions, before);
    expectSmsOptions(secondOptions, after);
    expect(this.callbackLog.length).assertEqual(0);
  }
}
