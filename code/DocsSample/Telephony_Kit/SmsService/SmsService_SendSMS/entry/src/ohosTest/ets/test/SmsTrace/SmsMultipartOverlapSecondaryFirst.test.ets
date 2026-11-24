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

export default function SmsMultipartOverlapSecondaryFirstTest(): void {
  describe('SmsMultipartOverlapSecondaryFirst_Test', () => {
    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_036
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_037
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_038
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_039
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryAccepted_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_040
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryAccepted_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryAccepted_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_041
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryAccepted_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_042
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_043
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimaryFirstPart_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_044
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimaryFirstPart_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryFirstPart_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_045
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryFirstPart_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_046
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_047
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimaryFirstPart_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_048
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimaryFirstPart_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_SecondaryServiceUnavailable_PrimaryFirstPart_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_049
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_SecondaryServiceUnavailable_PrimaryFirstPart_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_050
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_051
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_052
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_053
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_SecondaryServiceUnavailable_PrimaryFirstPart_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_054
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_SecondaryServiceUnavailable_PrimaryFirstPart_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondaryServiceUnavailable_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_055
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondaryServiceUnavailable_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/3//true'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
