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

import { afterEach, describe, it, Level, Size, TestType } from '@ohos/hypium';
import { sms } from '@kit.TelephonyKit';
import {
  SmsSendTrace, SmsTraceRequest, SmsTraceStep
} from '../Shared/SmsSendTrace';
import { yieldToEventLoop } from '../Shared/TestScheduling';

const CASE_TYPE = TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2;

export default function SmsRebindAfterPrimaryAcceptedTest(): void {
  describe('SmsRebindAfterPrimaryAccepted_Test', () => {
    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.name testRebindCompletionAfterPrimaryAcceptedThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_01
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionAfterPrimaryAcceptedThenOldCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindCompletion(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindCompletionAfterPrimaryAcceptedThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_02
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionAfterPrimaryAcceptedThenNewCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindCompletion(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindSendAfterPrimaryAcceptedThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_03
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindSendAfterPrimaryAcceptedThenOldCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindSend(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindSendAfterPrimaryAcceptedThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_04
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindSendAfterPrimaryAcceptedThenNewCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindSend(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindDeliveryAfterPrimaryAcceptedThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_05
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindDeliveryAfterPrimaryAcceptedThenOldCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindDelivery(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindDeliveryAfterPrimaryAcceptedThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_06
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindDeliveryAfterPrimaryAcceptedThenNewCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindDelivery(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindCompletionSendAfterPrimaryAcceptedThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_07
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionSendAfterPrimaryAcceptedThenOldCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindCompletion(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.rebindSend(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindCompletionSendAfterPrimaryAcceptedThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_08
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionSendAfterPrimaryAcceptedThenNewCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindCompletion(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.rebindSend(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindCompletionDeliveryAfterPrimaryAcceptedThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_09
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionDeliveryAfterPrimaryAcceptedThenOldCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindCompletion(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.rebindDelivery(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindCompletionDeliveryAfterPrimaryAcceptedThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_10
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionDeliveryAfterPrimaryAcceptedThenNewCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindCompletion(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.rebindDelivery(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindSendDeliveryAfterPrimaryAcceptedThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_11
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindSendDeliveryAfterPrimaryAcceptedThenOldCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindSend(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.rebindDelivery(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindSendDeliveryAfterPrimaryAcceptedThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_12
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindSendDeliveryAfterPrimaryAcceptedThenNewCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindSend(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.rebindDelivery(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindCompletionSendDeliveryAfterPrimaryAcceptedThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_13
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionSendDeliveryAfterPrimaryAcceptedThenOldCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindCompletion(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.rebindSend(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.rebindDelivery(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindCompletionSendDeliveryAfterPrimaryAcceptedThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_2_14
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionSendDeliveryAfterPrimaryAcceptedThenNewCallbacksFirst', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/complete/ok'],
        },
        {
          action: () => trace.rebindCompletion(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.rebindSend(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.rebindDelivery(),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submitWithSharedCallbacks(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['replacement/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });
  });
}
