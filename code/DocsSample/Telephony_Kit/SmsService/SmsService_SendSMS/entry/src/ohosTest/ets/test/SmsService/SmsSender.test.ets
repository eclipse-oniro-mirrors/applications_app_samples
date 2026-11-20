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

import { afterAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { AsyncCallback, BusinessError } from '@kit.BasicServicesKit';
import { sms } from '@kit.TelephonyKit';
import { sendTextSms, SmsSendCallbacks, SmsTextRequest, SmsTransport } from '../../../../main/ets/service/SmsSender';
import { yieldToEventLoop } from '../Shared/TestScheduling';

const CASE_TYPE = TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2;
// The SDK declares BusinessError as non-null, but documents null for successful asynchronous calls.
type NativeCallback<T> = (error: BusinessError | null, data: T | undefined) => void;

function invokeNativeCallback<T>(callback: AsyncCallback<T> | undefined, error: BusinessError | null,
  data: T | undefined): void {
  const nativeCallback = callback as NativeCallback<T> | undefined;
  nativeCallback?.(error, data);
}

class FixtureError extends Error implements BusinessError {
  code: number;

  constructor(code: number, message: string) {
    super(message);
    this.code = code;
  }
}

interface TransportCall {
  options: sms.SendMessageOptions;
  complete: AsyncCallback<void>;
}

class CallbackRecorder {
  completionErrors: BusinessError[] = [];
  sendErrors: BusinessError[] = [];
  sendResults: sms.ISendShortMessageCallback[] = [];
  deliveryErrors: BusinessError[] = [];
  deliveryReports: sms.IDeliveryShortMessageCallback[] = [];

  callbacks: SmsSendCallbacks = {
    onComplete: (error) => this.completionErrors.push(error),
    onSend: (error, result) => {
      this.sendErrors.push(error);
      this.sendResults.push(result);
    },
    onDelivery: (error, report) => {
      this.deliveryErrors.push(error);
      this.deliveryReports.push(report);
    },
  };
}

class RecordingTransport {
  calls: TransportCall[] = [];
  send: SmsTransport = (options, complete) => {
    const call: TransportCall = { options, complete };
    this.calls.push(call);
  };

  complete(index: number, error: BusinessError | null): void {
    invokeNativeCallback<void>(this.calls[index].complete, error, undefined);
  }

  reportSend(index: number, result: sms.ISendShortMessageCallback): void {
    invokeNativeCallback(this.calls[index].options.sendCallback, null, result);
  }

  reportDelivery(index: number, error: BusinessError | null, report?: sms.IDeliveryShortMessageCallback): void {
    invokeNativeCallback(this.calls[index].options.deliveryCallback, error, report);
  }
}

function makeRequest(): SmsTextRequest {
  return {
    slotId: 1,
    content: 'Meeting moved to the afternoon.',
    destinationHost: '+8613800138000',
    serviceCenter: '+8613800100500',
    destinationPort: 1000,
  };
}

export default function smsSenderTest(): void {
  describe('SmsSender_Test', () => {
    let transport: RecordingTransport;
    let observer: CallbackRecorder;
    let request: SmsTextRequest;

    beforeEach(() => {
      transport = new RecordingTransport();
      observer = new CallbackRecorder();
      request = makeRequest();
    });

    afterAll(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.name testSmsDispatchesMappedRequestOnce
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_0100
     * @tc.desc Verify one dispatch with the selected SIM, addresses, message and port
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsDispatchesMappedRequestOnce', CASE_TYPE, (): void => {
      sendTextSms(request, observer.callbacks, transport.send);

      expect(transport.calls.length).assertEqual(1);
      const options = transport.calls[0].options;
      expect(options.slotId).assertEqual(1);
      expect(options.destinationHost).assertEqual('+8613800138000');
      expect(options.serviceCenter).assertEqual('+8613800100500');
      expect(options.content).assertEqual('Meeting moved to the afternoon.');
      expect(options.destinationPort).assertEqual(1000);
    });

    /**
     * @tc.name testSmsPreservesMultilineUnicodeText
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_0200
     * @tc.desc Verify message text reaches the transport with its original whitespace and Unicode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsPreservesMultilineUnicodeText', CASE_TYPE, (): void => {
      request.content = '  第一行\n第二行 📦  ';

      sendTextSms(request, observer.callbacks, transport.send);

      expect(transport.calls[0].options.content).assertEqual('  第一行\n第二行 📦  ');
    });

    /**
     * @tc.name testSmsKeepsSubmittedOptionsWhenDraftChanges
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_0300
     * @tc.desc Verify editing a draft after submission leaves the first transport options intact
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsKeepsSubmittedOptionsWhenDraftChanges', CASE_TYPE, (): void => {
      sendTextSms(request, observer.callbacks, transport.send);
      request.destinationHost = '+8613900139000';
      request.content = 'Updated pickup location.';
      sendTextSms(request, observer.callbacks, transport.send);

      expect(transport.calls.length).assertEqual(2);
      const first = transport.calls[0].options;
      const second = transport.calls[1].options;
      expect(first.destinationHost).assertEqual('+8613800138000');
      expect(first.content).assertEqual('Meeting moved to the afternoon.');
      expect(second.destinationHost).assertEqual('+8613900139000');
      expect(second.content).assertEqual('Updated pickup location.');
    });

    /**
     * @tc.name testSmsAcceptanceDoesNotSignalSendOrDelivery
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_0400
     * @tc.desc Verify the successful API completion is separate from send and delivery reports
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsAcceptanceDoesNotSignalSendOrDelivery', CASE_TYPE, (): void => {
      sendTextSms(request, observer.callbacks, transport.send);
      transport.complete(0, null);

      expect(observer.completionErrors.length).assertEqual(1);
      expect(observer.completionErrors[0]).assertNull();
      expect(observer.sendResults.length).assertEqual(0);
      expect(observer.deliveryReports.length).assertEqual(0);
    });

    /**
     * @tc.name testSmsReportsPermissionDenialThroughCompletion
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_0500
     * @tc.desc Verify the original permission error reaches the request completion callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsReportsPermissionDenialThroughCompletion', CASE_TYPE, (): void => {
      const denied = new FixtureError(201, 'Permission denied');
      sendTextSms(request, observer.callbacks, transport.send);

      transport.complete(0, denied);

      expect(observer.completionErrors.length).assertEqual(1);
      expect(observer.completionErrors[0].code).assertEqual(201);
      expect(observer.completionErrors[0].message).assertEqual('Permission denied');
      expect(observer.sendResults.length).assertEqual(0);
      expect(observer.deliveryReports.length).assertEqual(0);
    });

    /**
     * @tc.name testSmsReportsEveryPartOfMultipartMessage
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_0600
     * @tc.desc Verify separate send results preserve their order and last-part flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsReportsEveryPartOfMultipartMessage', CASE_TYPE, (): void => {
      const first: sms.ISendShortMessageCallback = {
        result: sms.SendSmsResult.SEND_SMS_SUCCESS, url: 'sms://outbox/first-part', isLastPart: false,
      };
      const last: sms.ISendShortMessageCallback = {
        result: sms.SendSmsResult.SEND_SMS_SUCCESS, url: 'sms://outbox/last-part', isLastPart: true,
      };
      sendTextSms(request, observer.callbacks, transport.send);

      transport.reportSend(0, first);
      transport.reportSend(0, last);

      expect(observer.sendResults.length).assertEqual(2);
      expect(observer.sendResults[0].url).assertEqual('sms://outbox/first-part');
      expect(observer.sendResults[0].isLastPart).assertFalse();
      expect(observer.sendResults[1].url).assertEqual('sms://outbox/last-part');
      expect(observer.sendResults[1].isLastPart).assertTrue();
      expect(observer.deliveryReports.length).assertEqual(0);
    });

    /**
     * @tc.name testSmsPreservesRadioOffSendResult
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_0700
     * @tc.desc Verify radio-off is preserved as a send result after a successful submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsPreservesRadioOffSendResult', CASE_TYPE, (): void => {
      const result: sms.ISendShortMessageCallback = {
        result: sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, url: '', isLastPart: true,
      };
      sendTextSms(request, observer.callbacks, transport.send);
      transport.complete(0, null);

      transport.reportSend(0, result);

      expect(observer.completionErrors.length).assertEqual(1);
      expect(observer.completionErrors[0]).assertNull();
      expect(observer.sendErrors[0]).assertNull();
      expect(observer.sendResults[0].result).assertEqual(sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF);
      expect(observer.deliveryReports.length).assertEqual(0);
    });

    /**
     * @tc.name testSmsForwardsDeliveryReportBytesInOrder
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_0800
     * @tc.desc Verify the delivery callback receives the original ordered PDU bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsForwardsDeliveryReportBytesInOrder', CASE_TYPE, (): void => {
      const report: sms.IDeliveryShortMessageCallback = { pdu: [0x00, 0x80, 0xff, 0x27] };
      sendTextSms(request, observer.callbacks, transport.send);

      transport.reportDelivery(0, null, report);

      expect(observer.deliveryReports.length).assertEqual(1);
      expect(observer.deliveryErrors[0]).assertNull();
      expect(observer.deliveryReports[0].pdu).assertDeepEquals([0x00, 0x80, 0xff, 0x27]);
    });

    /**
     * @tc.name testSmsKeepsDeliveryErrorSeparateFromSendSuccess
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_0900
     * @tc.desc Verify a delivery failure does not overwrite a successful send result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsKeepsDeliveryErrorSeparateFromSendSuccess', CASE_TYPE, (): void => {
      const result: sms.ISendShortMessageCallback = {
        result: sms.SendSmsResult.SEND_SMS_SUCCESS, url: 'sms://outbox/sent', isLastPart: true,
      };
      const deliveryError = new FixtureError(8300001, 'Delivery report unavailable');
      sendTextSms(request, observer.callbacks, transport.send);
      transport.reportSend(0, result);

      transport.reportDelivery(0, deliveryError);

      expect(observer.sendResults.length).assertEqual(1);
      expect(observer.sendResults[0].result).assertEqual(sms.SendSmsResult.SEND_SMS_SUCCESS);
      expect(observer.deliveryErrors.length).assertEqual(1);
      expect(observer.deliveryErrors[0].message).assertEqual('Delivery report unavailable');
      expect(observer.deliveryReports[0]).assertUndefined();
      expect(observer.completionErrors.length).assertEqual(0);
    });

    /**
     * @tc.name testSmsKeepsOverlappingRequestsCallbacksIsolated
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_1000
     * @tc.desc Verify overlapping requests receive only their own callbacks in reverse completion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsKeepsOverlappingRequestsCallbacksIsolated', CASE_TYPE, (): void => {
      const secondObserver = new CallbackRecorder();
      const secondRequest = makeRequest();
      secondRequest.content = 'Second message.';
      const firstResult: sms.ISendShortMessageCallback = {
        result: sms.SendSmsResult.SEND_SMS_SUCCESS, url: 'sms://outbox/first', isLastPart: true,
      };
      const secondReport: sms.IDeliveryShortMessageCallback = { pdu: [0x19, 0x42] };
      sendTextSms(request, observer.callbacks, transport.send);
      sendTextSms(secondRequest, secondObserver.callbacks, transport.send);

      transport.complete(1, null);
      expect(observer.completionErrors.length).assertEqual(0);
      expect(secondObserver.completionErrors.length).assertEqual(1);

      transport.complete(0, null);
      transport.reportSend(0, firstResult);
      transport.reportDelivery(1, null, secondReport);

      expect(observer.sendResults.length).assertEqual(1);
      expect(observer.sendResults[0].url).assertEqual('sms://outbox/first');
      expect(observer.completionErrors.length).assertEqual(1);
      expect(observer.deliveryReports.length).assertEqual(0);
      expect(secondObserver.sendResults.length).assertEqual(0);
      expect(secondObserver.completionErrors.length).assertEqual(1);
      expect(secondObserver.deliveryReports.length).assertEqual(1);
      expect(secondObserver.deliveryReports[0].pdu).assertDeepEquals([0x19, 0x42]);
    });

    /**
     * @tc.name testSmsPreservesExplicitEmptyServiceCenterAndZeroPort
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_1100
     * @tc.desc Verify sendTextSms preserves explicit empty and zero values in transport options
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsPreservesExplicitEmptyServiceCenterAndZeroPort', CASE_TYPE, (): void => {
      request.slotId = 0;
      request.serviceCenter = '';
      request.destinationPort = 0;

      sendTextSms(request, observer.callbacks, transport.send);

      expect(transport.calls.length).assertEqual(1);
      const options = transport.calls[0].options;
      expect(options.slotId).assertEqual(0);
      expect(options.serviceCenter).assertEqual('');
      expect(options.destinationPort).assertEqual(0);
    });

    /**
     * @tc.name testSmsPropagatesSynchronousTransportException
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_1200
     * @tc.desc Verify sendTextSms propagates a synchronous exception without retrying or emitting callbacks
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsPropagatesSynchronousTransportException', CASE_TYPE, (): void => {
      const failure = new FixtureError(401, 'Invalid SMS options');
      const failingTransport: SmsTransport = (options, complete): void => {
        transport.send(options, complete);
        throw failure;
      };
      let caughtOriginalError = false;

      try {
        sendTextSms(request, observer.callbacks, failingTransport);
      } catch (error) {
        caughtOriginalError = error === failure;
        expect(caughtOriginalError).assertTrue();
      }

      expect(caughtOriginalError).assertTrue();
      expect(transport.calls.length).assertEqual(1);
      expect(observer.completionErrors.length).assertEqual(0);
      expect(observer.sendErrors.length).assertEqual(0);
      expect(observer.deliveryErrors.length).assertEqual(0);
    });

    /**
     * @tc.name testSmsRetainsCallbacksAfterSharedConfigIsRebound
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_1300
     * @tc.desc Verify sendTextSms binds the current handlers when a callback configuration is reused
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsRetainsCallbacksAfterSharedConfigIsRebound', CASE_TYPE, (): void => {
      const replacement = new CallbackRecorder();
      const shared: SmsSendCallbacks = {
        onComplete: observer.callbacks.onComplete,
        onSend: observer.callbacks.onSend,
        onDelivery: observer.callbacks.onDelivery,
      };
      const result: sms.ISendShortMessageCallback = {
        result: sms.SendSmsResult.SEND_SMS_SUCCESS, url: 'sms://outbox/rebound', isLastPart: true,
      };
      const report: sms.IDeliveryShortMessageCallback = { pdu: [0x24] };
      sendTextSms(request, shared, transport.send);
      shared.onComplete = replacement.callbacks.onComplete;
      shared.onSend = replacement.callbacks.onSend;
      shared.onDelivery = replacement.callbacks.onDelivery;
      sendTextSms(request, shared, transport.send);

      transport.complete(0, null);
      transport.reportSend(0, result);
      transport.reportDelivery(0, null, report);
      expect(observer.completionErrors.length).assertEqual(1);
      expect(observer.sendResults.length).assertEqual(1);
      expect(observer.deliveryReports.length).assertEqual(1);
      expect(replacement.completionErrors.length).assertEqual(0);
      expect(replacement.sendResults.length).assertEqual(0);
      expect(replacement.deliveryReports.length).assertEqual(0);

      transport.complete(1, null);
      transport.reportSend(1, result);
      transport.reportDelivery(1, null, report);
      expect(replacement.completionErrors.length).assertEqual(1);
      expect(replacement.sendResults.length).assertEqual(1);
      expect(replacement.deliveryReports.length).assertEqual(1);
      expect(observer.completionErrors.length).assertEqual(1);
      expect(observer.sendResults.length).assertEqual(1);
      expect(observer.deliveryReports.length).assertEqual(1);
    });

    /**
     * @tc.name testSmsCanSubmitAgainFromInlineCompletion
     * @tc.number SUB_TELEPHONY_SMS_SEND_FLOW_1400
     * @tc.desc Verify sendTextSms accepts a nested submission from a synchronous transport completion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsCanSubmitAgainFromInlineCompletion', CASE_TYPE, (): void => {
      const followUp = makeRequest();
      followUp.content = 'Follow-up after submission.';
      const followUpObserver = new CallbackRecorder();
      const steps: string[] = [];
      const inlineTransport: SmsTransport = (options, complete): void => {
        transport.send(options, complete);
        steps.push('first-dispatch');
        transport.complete(0, null);
        steps.push('first-transport-return');
      };
      const followUpTransport: SmsTransport = (options, complete): void => {
        transport.send(options, complete);
        steps.push('follow-up-dispatch');
      };
      const firstCallbacks: SmsSendCallbacks = {
        onSend: observer.callbacks.onSend,
        onDelivery: observer.callbacks.onDelivery,
        onComplete: (error, data): void => {
          observer.callbacks.onComplete(error, data);
          sendTextSms(followUp, followUpObserver.callbacks, followUpTransport);
        },
      };

      sendTextSms(request, firstCallbacks, inlineTransport);

      expect(steps).assertDeepEquals(['first-dispatch', 'follow-up-dispatch', 'first-transport-return']);
      expect(transport.calls.length).assertEqual(2);
      expect(transport.calls[1].options.content).assertEqual('Follow-up after submission.');
      expect(observer.completionErrors.length).assertEqual(1);
      expect(followUpObserver.completionErrors.length).assertEqual(0);

      transport.complete(1, null);
      expect(followUpObserver.completionErrors.length).assertEqual(1);
      expect(observer.completionErrors.length).assertEqual(1);
    });
  });
}
