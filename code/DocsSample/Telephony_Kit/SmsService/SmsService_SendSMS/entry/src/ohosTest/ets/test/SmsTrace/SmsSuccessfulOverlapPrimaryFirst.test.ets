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

export default function SmsSuccessfulOverlapPrimaryFirstTest(): void {
  describe('SmsSuccessfulOverlapPrimaryFirst_Test', () => {
    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_PrimaryDelivered_SecondaryAccepted_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_002
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_PrimaryDelivered_SecondaryAccepted_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_SecondaryAccepted_PrimaryDelivered_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_003
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_SecondaryAccepted_PrimaryDelivered_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_004
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_005
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_006
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_007
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_SecondaryAccepted_SecondarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_008
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_SecondaryAccepted_SecondarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_009
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_010
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimarySent_SecondarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_011
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimarySent_SecondarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimarySent_SecondarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_012
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimarySent_SecondarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_013
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_014
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_015
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_016
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_017
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_SecondarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_018
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_SecondarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_019
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_020
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_SecondarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_021
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_SecondarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_SecondarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_022
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_SecondarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_SecondarySent_PrimarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_023
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_SecondarySent_PrimarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_SecondarySent_PrimarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_024
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_SecondarySent_PrimarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_025
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_026
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_SecondarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_027
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_SecondarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_SecondarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_028
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_SecondarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_SecondarySent_PrimarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_029
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_SecondarySent_PrimarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_SecondarySent_PrimarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_030
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_SecondarySent_PrimarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_SecondarySent_SecondaryDelivered_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_031
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_SecondarySent_SecondaryDelivered_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_032
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimaryAccepted_PrimarySent_PrimaryDelivered_SecondaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimaryAccepted_PrimarySent_SecondaryDelivered_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_033
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimaryAccepted_PrimarySent_SecondaryDelivered_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimaryAccepted_SecondaryDelivered_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_034
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimaryAccepted_SecondaryDelivered_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryAccepted_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_OK_035
     * @tc.desc Verify sendTextSms keeps successful callbacks isolated when both requests are in flight
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryAccepted_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const steps: SmsTraceStep[] = [
        {
          action: () => trace.submit(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: [],
        },
        {
          action: () => trace.submit(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: [],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/secondary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/0/sms://outbox/secondary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Secondary, [0x26, 0x00, 0x80, 0x3f]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/delivery/ok/38,0,128,63'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.deliver(SmsTraceRequest.Primary, [0x00, 0x81, 0xff]),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/ok/0,129,255'],
        },
      ];
      trace.verify(steps);
    });
  });
}
