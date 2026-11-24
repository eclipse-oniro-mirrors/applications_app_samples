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

export default function SmsDeliveryFailureOverlapPrimaryFirstTest(): void {
  describe('SmsDeliveryFailureOverlapPrimaryFirst_Test', () => {
    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_PrimaryDeliveryFailed_SecondaryAccepted_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_002
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_PrimaryDeliveryFailed_SecondaryAccepted_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_SecondaryAccepted_PrimaryDeliveryFailed_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_003
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_SecondaryAccepted_PrimaryDeliveryFailed_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_SecondaryAccepted_SecondaryRadioOff_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_004
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_PrimarySent_SecondarySubmit_SecondaryAccepted_SecondaryRadioOff_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_PrimaryDeliveryFailed_SecondaryAccepted_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_005
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_PrimaryDeliveryFailed_SecondaryAccepted_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_SecondaryAccepted_PrimaryDeliveryFailed_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_006
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_SecondaryAccepted_PrimaryDeliveryFailed_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_SecondaryAccepted_SecondaryRadioOff_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_007
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_PrimarySent_SecondaryAccepted_SecondaryRadioOff_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_008
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimarySent_SecondaryRadioOff_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_009
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_PrimarySent_SecondaryRadioOff_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_SecondaryRadioOff_PrimarySent_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_010
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_PrimaryAccepted_SecondarySubmit_SecondaryAccepted_SecondaryRadioOff_PrimarySent_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryAccepted_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_011
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryAccepted_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_PrimaryDeliveryFailed_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_012
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_PrimaryDeliveryFailed_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_SecondaryRadioOff_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_013
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_SecondaryRadioOff_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_014
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_SecondaryRadioOff_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_015
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_SecondaryRadioOff_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_SecondaryRadioOff_PrimarySent_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_016
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryAccepted_SecondaryAccepted_SecondaryRadioOff_PrimarySent_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_017
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_SecondaryRadioOff_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_018
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_SecondaryRadioOff_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_SecondaryRadioOff_PrimarySent_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_019
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryAccepted_SecondaryRadioOff_PrimarySent_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondaryRadioOff_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_020
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondaryRadioOff_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['secondary/send/ok/2//true'],
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });
  });
}
