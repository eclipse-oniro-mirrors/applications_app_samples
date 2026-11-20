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

export default function SmsPermissionOverlapPrimaryFirstTest(): void {
  describe('SmsPermissionOverlapPrimaryFirst_Test', () => {
    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.name testPrimarySubmit_SecondarySubmit_PrimaryDenied_SecondaryAccepted_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_PERMISSION_002
     * @tc.desc Verify sendTextSms keeps a permission denial from affecting another request
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_PrimaryDenied_SecondaryAccepted_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
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
          action: () => trace.denyPermission(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/201/Permission denied'],
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
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryDenied_SecondarySent_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_PERMISSION_003
     * @tc.desc Verify sendTextSms keeps a permission denial from affecting another request
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_PrimaryDenied_SecondarySent_SecondaryDelivered', CASE_TYPE, (): void => {
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
          action: () => trace.denyPermission(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/201/Permission denied'],
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
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimaryDenied_SecondaryDelivered
     * @tc.number SUB_TELEPHONY_SMS_TRACE_PERMISSION_004
     * @tc.desc Verify sendTextSms keeps a permission denial from affecting another request
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondarySent_PrimaryDenied_SecondaryDelivered', CASE_TYPE, (): void => {
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
          action: () => trace.denyPermission(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/201/Permission denied'],
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
     * @tc.name testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryDenied
     * @tc.number SUB_TELEPHONY_SMS_TRACE_PERMISSION_005
     * @tc.desc Verify sendTextSms keeps a permission denial from affecting another request
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testPrimarySubmit_SecondarySubmit_SecondaryAccepted_SecondarySent_SecondaryDelivered_PrimaryDenied', CASE_TYPE, (): void => {
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
          action: () => trace.denyPermission(SmsTraceRequest.Primary),
          dispatches: [SmsTraceRequest.Primary, SmsTraceRequest.Secondary],
          callbacks: ['primary/complete/201/Permission denied'],
        },
      ];
      trace.verify(steps);
    });
  });
}
