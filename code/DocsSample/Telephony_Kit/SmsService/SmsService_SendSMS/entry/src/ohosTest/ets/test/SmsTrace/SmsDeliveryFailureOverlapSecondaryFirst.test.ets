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

export default function SmsDeliveryFailureOverlapSecondaryFirstTest(): void {
  describe('SmsDeliveryFailureOverlapSecondaryFirst_Test', () => {
    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryAccepted_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_021
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryAccepted_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.accept(SmsTraceRequest.Secondary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/complete/ok'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_PrimaryDeliveryFailed_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_022
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_PrimaryDeliveryFailed_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_SecondaryRadioOff_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_023
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryAccepted_SecondaryRadioOff_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_024
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_SecondaryRadioOff_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_025
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_PrimarySent_SecondaryRadioOff_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_SecondaryRadioOff_PrimarySent_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_026
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryAccepted_SecondaryAccepted_SecondaryRadioOff_PrimarySent_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_027
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_SecondaryRadioOff_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_028
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_PrimarySent_SecondaryRadioOff_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_SecondaryRadioOff_PrimarySent_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_029
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryAccepted_SecondaryRadioOff_PrimarySent_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondaryRadioOff_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_030
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondaryRadioOff_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryRadioOff
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_031
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed_SecondaryRadioOff', CASE_TYPE, (): void => {
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Secondary,
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryRadioOff_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_032
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_PrimarySent_SecondaryRadioOff_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_SecondaryRadioOff_PrimarySent_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_033
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryAccepted_SecondaryRadioOff_PrimarySent_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
        },
        {
          action: () => trace.sendResult(SmsTraceRequest.Primary,
            sms.SendSmsResult.SEND_SMS_SUCCESS, 'sms://outbox/primary', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/send/ok/0/sms://outbox/primary/true'],
        },
        {
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondaryRadioOff_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DELIVERY_034
     * @tc.desc Verify sendTextSms keeps a delivery error separate from the other request reporting radio off
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondaryRadioOff_PrimaryAccepted_PrimarySent_PrimaryDeliveryFailed', CASE_TYPE, (): void => {
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
            sms.SendSmsResult.SEND_SMS_FAILURE_RADIO_OFF, '', true),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['secondary/send/ok/2//true'],
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
          action: () => trace.reportDeliveryUnavailable(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/delivery/8300002/Delivery report unavailable/missing'],
        },
      ];
      trace.verify(steps);
    });
  });
}
