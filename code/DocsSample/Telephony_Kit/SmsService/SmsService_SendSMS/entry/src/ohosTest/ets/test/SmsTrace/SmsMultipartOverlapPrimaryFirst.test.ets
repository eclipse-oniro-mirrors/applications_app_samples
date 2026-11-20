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

export default function SmsMultipartOverlapPrimaryFirstTest(): void {
  describe('SmsMultipartOverlapPrimaryFirst_Test', () => {
    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondarySubmit_PrimaryDelivered_SecondaryAccepted_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_002
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondarySubmit_PrimaryDelivered_SecondaryAccepted_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondarySubmit_SecondaryAccepted_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_003
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondarySubmit_SecondaryAccepted_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondarySubmit_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_004
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondarySubmit_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondarySubmit_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_005
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondarySubmit_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondarySubmit_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_006
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondarySubmit_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondarySubmit_PrimarySent_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_007
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondarySubmit_PrimarySent_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondarySubmit_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_008
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondarySubmit_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondarySubmit_SecondaryAccepted_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_009
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondarySubmit_SecondaryAccepted_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondarySubmit_SecondaryAccepted_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_010
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondarySubmit_SecondaryAccepted_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_011
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimaryFirstPart_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_012
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimaryFirstPart_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimaryFirstPart_PrimarySent_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_013
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimaryFirstPart_PrimarySent_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimaryFirstPart_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_014
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimaryFirstPart_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimaryFirstPart_SecondaryAccepted_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_015
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimaryFirstPart_SecondaryAccepted_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimaryFirstPart_SecondaryAccepted_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_016
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimaryFirstPart_SecondaryAccepted_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_017
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_018
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimaryFirstPart_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_019
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimaryFirstPart_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryFirstPart_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_020
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryFirstPart_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_021
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryAccepted_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_022
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryAccepted_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_023
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_024
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryAccepted_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryAccepted_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_025
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryAccepted_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryAccepted_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_026
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimaryFirstPart_SecondaryAccepted_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_027
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_028
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimaryFirstPart_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_029
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimaryFirstPart_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryFirstPart_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_030
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_SecondaryServiceUnavailable_PrimaryFirstPart_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_031
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimaryFirstPart_PrimarySent_PrimaryDelivered_SecondaryServiceUnavailable', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_032
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimaryFirstPart_PrimarySent_SecondaryServiceUnavailable_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimaryFirstPart_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_033
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimaryFirstPart_SecondaryServiceUnavailable_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
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
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_SecondaryServiceUnavailable_PrimaryFirstPart_PrimarySent_PrimaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_MULTIPART_034
     * @tc.desc Verify sendTextSms preserves both multipart results while the other request cannot send
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_SecondaryServiceUnavailable_PrimaryFirstPart_PrimarySent_PrimaryDelivered', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_SERVICE_UNAVAILABLE, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/3//true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary-first-part', false),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary-first-part/false'],
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
