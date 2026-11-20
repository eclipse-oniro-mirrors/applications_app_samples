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

export default function SmsSuccessfulOverlapSecondaryFirstTest(): void {
  describe('SmsSuccessfulOverlapSecondaryFirst_Test', () => {
    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_036
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_037
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_SecondarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_038
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_SecondarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_039
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_040
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_SecondarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_041
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_SecondarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_SecondarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_042
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_SecondarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_SecondarySent_PrimarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_043
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_SecondarySent_PrimarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_SecondarySent_PrimarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_044
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_SecondarySent_PrimarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_045
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_046
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_SecondarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_047
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_SecondarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_SecondarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_048
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_SecondarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_SecondarySent_PrimarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_049
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_SecondarySent_PrimarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_SecondarySent_PrimarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_050
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_SecondarySent_PrimarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_SecondarySent_SecondaryDelivered_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_051
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_SecondarySent_SecondaryDelivered_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondarySent_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_052
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondarySent_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondarySent_PrimaryAccepted_PrimarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_053
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondarySent_PrimaryAccepted_PrimarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondarySent_PrimaryAccepted_SecondaryDelivered_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_054
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondarySent_PrimaryAccepted_SecondaryDelivered_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryAccepted_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_055
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryAccepted_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_056
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_057
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_058
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_SecondarySent_PrimarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_059
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_SecondarySent_PrimarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_SecondarySent_PrimarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_060
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_SecondarySent_PrimarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_SecondarySent_SecondaryDelivered_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_061
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_SecondarySent_SecondaryDelivered_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondarySent_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_062
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondarySent_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondarySent_PrimaryAccepted_PrimarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_063
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondarySent_PrimaryAccepted_PrimarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondarySent_PrimaryAccepted_SecondaryDelivered_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_064
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondarySent_PrimaryAccepted_SecondaryDelivered_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondarySent_SecondaryDelivered_PrimaryAccepted_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_065
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondarySent_SecondaryDelivered_PrimaryAccepted_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySubmit_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_066
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySubmit_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_067
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySubmit_PrimaryAccepted_SecondaryDelivered_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_068
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySubmit_PrimaryAccepted_SecondaryDelivered_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySubmit_SecondaryDelivered_PrimaryAccepted_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_069
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySubmit_SecondaryDelivered_PrimaryAccepted_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });
  });
}
