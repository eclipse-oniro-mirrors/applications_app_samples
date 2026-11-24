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

export default function SmsPermissionOverlapSecondaryFirstTest(): void {
  describe('SmsPermissionOverlapSecondaryFirst_Test', () => {
    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.name testSecondarySubmit_PrimarySubmit_PrimaryDenied_SecondaryAccepted_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_PERMISSION_006
     * @tc.desc Verify sendTextSms keeps a permission denial from affecting another request
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_PrimaryDenied_SecondaryAccepted_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
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
          action: () => trace.denyPermission(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/201/Permission denied'],
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
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryDenied_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_PERMISSION_007
     * @tc.desc Verify sendTextSms keeps a permission denial from affecting another request
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_PrimaryDenied_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
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
          action: () => trace.denyPermission(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/201/Permission denied'],
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
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondarySent_PrimaryDenied_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_PERMISSION_008
     * @tc.desc Verify sendTextSms keeps a permission denial from affecting another request
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondarySent_PrimaryDenied_SecondaryDelivered', CASE_TYPE, (): void => {
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
          action: () => trace.denyPermission(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/201/Permission denied'],
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
     * @tc.name testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryDenied
     * @tc.number SUB_TELEPHONY_SMS_TRACE_PERMISSION_009
     * @tc.desc Verify sendTextSms keeps a permission denial from affecting another request
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_PrimarySubmit_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryDenied', CASE_TYPE, (): void => {
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
          action: () => trace.denyPermission(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/201/Permission denied'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryDenied_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_PERMISSION_010
     * @tc.desc Verify sendTextSms keeps a permission denial from affecting another request
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_PrimaryDenied_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
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
          action: () => trace.denyPermission(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/201/Permission denied'],
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
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondarySent_PrimaryDenied_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_PERMISSION_011
     * @tc.desc Verify sendTextSms keeps a permission denial from affecting another request
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondarySent_PrimaryDenied_SecondaryDelivered', CASE_TYPE, (): void => {
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
          action: () => trace.denyPermission(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/201/Permission denied'],
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
     * @tc.name testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondarySent_SecondaryDelivered_PrimaryDenied
     * @tc.number SUB_TELEPHONY_SMS_TRACE_PERMISSION_012
     * @tc.desc Verify sendTextSms keeps a permission denial from affecting another request
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_PrimarySubmit_SecondarySent_SecondaryDelivered_PrimaryDenied', CASE_TYPE, (): void => {
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
          action: () => trace.denyPermission(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/201/Permission denied'],
        },
      ];
      trace.verify(steps);
    });

    /**
     * @tc.name testSecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySubmit_PrimaryDenied_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_PERMISSION_013
     * @tc.desc Verify sendTextSms keeps a permission denial from affecting another request
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySubmit_PrimaryDenied_SecondaryDelivered', CASE_TYPE, (): void => {
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
          action: () => trace.denyPermission(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/201/Permission denied'],
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
     * @tc.name testSecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySubmit_SecondaryDelivered_PrimaryDenied
     * @tc.number SUB_TELEPHONY_SMS_TRACE_PERMISSION_014
     * @tc.desc Verify sendTextSms keeps a permission denial from affecting another request
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSecondarySubmit_SecondaryAccepted_SecondarySent_PrimarySubmit_SecondaryDelivered_PrimaryDenied', CASE_TYPE, (): void => {
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
          action: () => trace.denyPermission(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Secondary, SmsTraceRequest.Primary],
          callbacks: ['primary/complete/201/Permission denied'],
        },
      ];
      trace.verify(steps);
    });
  });
}
