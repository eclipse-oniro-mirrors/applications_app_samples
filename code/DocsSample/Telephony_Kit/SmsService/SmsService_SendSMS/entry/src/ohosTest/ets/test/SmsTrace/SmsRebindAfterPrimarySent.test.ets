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

export default function SmsRebindAfterPrimarySentTest(): void {
  describe('SmsRebindAfterPrimarySent_Test', () => {
    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.name testRebindCompletionAfterPrimarySentThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_01
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionAfterPrimarySentThenOldCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
     * @tc.name testRebindCompletionAfterPrimarySentThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_02
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionAfterPrimarySentThenNewCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindSendAfterPrimarySentThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_03
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindSendAfterPrimarySentThenOldCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
     * @tc.name testRebindSendAfterPrimarySentThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_04
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindSendAfterPrimarySentThenNewCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindDeliveryAfterPrimarySentThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_05
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindDeliveryAfterPrimarySentThenOldCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
     * @tc.name testRebindDeliveryAfterPrimarySentThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_06
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindDeliveryAfterPrimarySentThenNewCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindCompletionSendAfterPrimarySentThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_07
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionSendAfterPrimarySentThenOldCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
     * @tc.name testRebindCompletionSendAfterPrimarySentThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_08
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionSendAfterPrimarySentThenNewCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindCompletionDeliveryAfterPrimarySentThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_09
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionDeliveryAfterPrimarySentThenOldCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
     * @tc.name testRebindCompletionDeliveryAfterPrimarySentThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_10
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionDeliveryAfterPrimarySentThenNewCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindSendDeliveryAfterPrimarySentThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_11
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindSendDeliveryAfterPrimarySentThenOldCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
     * @tc.name testRebindSendDeliveryAfterPrimarySentThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_12
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindSendDeliveryAfterPrimarySentThenNewCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testRebindCompletionSendDeliveryAfterPrimarySentThenOldCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_13
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionSendDeliveryAfterPrimarySentThenOldCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
     * @tc.name testRebindCompletionSendDeliveryAfterPrimarySentThenNewCallbacksFirst
     * @tc.number SUB_TELEPHONY_SMS_TRACE_REBIND_3_14
     * @tc.desc Verify sendTextSms keeps each handler bound at its own request submission
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRebindCompletionSendDeliveryAfterPrimarySentThenNewCallbacksFirst', CASE_TYPE, (): void => {
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
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['original/send/ok/0/sms://outbox/primary/true'],
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
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['original/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });
  });
}
