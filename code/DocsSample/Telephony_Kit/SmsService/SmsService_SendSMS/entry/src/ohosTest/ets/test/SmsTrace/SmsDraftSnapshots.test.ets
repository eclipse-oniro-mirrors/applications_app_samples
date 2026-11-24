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

import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  makeSmsTraceRequest, SmsSendTrace, SmsTraceRequest
} from '../Shared/SmsSendTrace';
import { yieldToEventLoop } from '../Shared/TestScheduling';

const CASE_TYPE = TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2;

export default function SmsDraftSnapshotsTest(): void {
  describe('SmsDraftSnapshots_Test', () => {
    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.name testSnapshotAfterEditingSlot
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_01
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlot', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: first.destinationHost,
        serviceCenter: first.serviceCenter,
        destinationPort: first.destinationPort,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingRecipient
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_02
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingRecipient', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.destinationHost = '+442079460101';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: '+442079460101',
        serviceCenter: first.serviceCenter,
        destinationPort: first.destinationPort,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingCenter
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_03
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingCenter', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.serviceCenter = '';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: first.destinationHost,
        serviceCenter: '',
        destinationPort: first.destinationPort,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingPort
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_04
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingPort', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.destinationPort = 0;
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: first.destinationHost,
        serviceCenter: first.serviceCenter,
        destinationPort: 0,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_05
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: first.destinationHost,
        serviceCenter: first.serviceCenter,
        destinationPort: first.destinationPort,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotRecipient
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_06
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotRecipient', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.destinationHost = '+442079460101';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: '+442079460101',
        serviceCenter: first.serviceCenter,
        destinationPort: first.destinationPort,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotCenter
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_07
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotCenter', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.serviceCenter = '';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: first.destinationHost,
        serviceCenter: '',
        destinationPort: first.destinationPort,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotPort
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_08
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotPort', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.destinationPort = 0;
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: first.destinationHost,
        serviceCenter: first.serviceCenter,
        destinationPort: 0,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_09
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: first.destinationHost,
        serviceCenter: first.serviceCenter,
        destinationPort: first.destinationPort,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingRecipientCenter
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_10
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingRecipientCenter', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.destinationHost = '+442079460101';
      draft.serviceCenter = '';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: '+442079460101',
        serviceCenter: '',
        destinationPort: first.destinationPort,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingRecipientPort
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_11
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingRecipientPort', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.destinationHost = '+442079460101';
      draft.destinationPort = 0;
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: '+442079460101',
        serviceCenter: first.serviceCenter,
        destinationPort: 0,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingRecipientText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_12
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingRecipientText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.destinationHost = '+442079460101';
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: '+442079460101',
        serviceCenter: first.serviceCenter,
        destinationPort: first.destinationPort,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingCenterPort
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_13
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingCenterPort', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.serviceCenter = '';
      draft.destinationPort = 0;
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: first.destinationHost,
        serviceCenter: '',
        destinationPort: 0,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingCenterText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_14
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingCenterText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.serviceCenter = '';
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: first.destinationHost,
        serviceCenter: '',
        destinationPort: first.destinationPort,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingPortText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_15
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingPortText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.destinationPort = 0;
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: first.destinationHost,
        serviceCenter: first.serviceCenter,
        destinationPort: 0,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotRecipientCenter
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_16
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotRecipientCenter', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.destinationHost = '+442079460101';
      draft.serviceCenter = '';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: '+442079460101',
        serviceCenter: '',
        destinationPort: first.destinationPort,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotRecipientPort
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_17
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotRecipientPort', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.destinationHost = '+442079460101';
      draft.destinationPort = 0;
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: '+442079460101',
        serviceCenter: first.serviceCenter,
        destinationPort: 0,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotRecipientText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_18
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotRecipientText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.destinationHost = '+442079460101';
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: '+442079460101',
        serviceCenter: first.serviceCenter,
        destinationPort: first.destinationPort,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotCenterPort
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_19
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotCenterPort', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.serviceCenter = '';
      draft.destinationPort = 0;
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: first.destinationHost,
        serviceCenter: '',
        destinationPort: 0,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotCenterText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_20
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotCenterText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.serviceCenter = '';
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: first.destinationHost,
        serviceCenter: '',
        destinationPort: first.destinationPort,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotPortText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_21
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotPortText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.destinationPort = 0;
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: first.destinationHost,
        serviceCenter: first.serviceCenter,
        destinationPort: 0,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingRecipientCenterPort
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_22
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingRecipientCenterPort', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.destinationHost = '+442079460101';
      draft.serviceCenter = '';
      draft.destinationPort = 0;
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: '+442079460101',
        serviceCenter: '',
        destinationPort: 0,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingRecipientCenterText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_23
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingRecipientCenterText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.destinationHost = '+442079460101';
      draft.serviceCenter = '';
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: '+442079460101',
        serviceCenter: '',
        destinationPort: first.destinationPort,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingRecipientPortText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_24
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingRecipientPortText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.destinationHost = '+442079460101';
      draft.destinationPort = 0;
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: '+442079460101',
        serviceCenter: first.serviceCenter,
        destinationPort: 0,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingCenterPortText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_25
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingCenterPortText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.serviceCenter = '';
      draft.destinationPort = 0;
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: first.destinationHost,
        serviceCenter: '',
        destinationPort: 0,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotRecipientCenterPort
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_26
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotRecipientCenterPort', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.destinationHost = '+442079460101';
      draft.serviceCenter = '';
      draft.destinationPort = 0;
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: '+442079460101',
        serviceCenter: '',
        destinationPort: 0,
        content: first.content,
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual(first.content);
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotRecipientCenterText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_27
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotRecipientCenterText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.destinationHost = '+442079460101';
      draft.serviceCenter = '';
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: '+442079460101',
        serviceCenter: '',
        destinationPort: first.destinationPort,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(first.destinationPort);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotRecipientPortText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_28
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotRecipientPortText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.destinationHost = '+442079460101';
      draft.destinationPort = 0;
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: '+442079460101',
        serviceCenter: first.serviceCenter,
        destinationPort: 0,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual(first.serviceCenter);
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotCenterPortText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_29
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotCenterPortText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.serviceCenter = '';
      draft.destinationPort = 0;
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: first.destinationHost,
        serviceCenter: '',
        destinationPort: 0,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual(first.destinationHost);
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingRecipientCenterPortText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_30
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingRecipientCenterPortText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.destinationHost = '+442079460101';
      draft.serviceCenter = '';
      draft.destinationPort = 0;
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: first.slotId,
        destinationHost: '+442079460101',
        serviceCenter: '',
        destinationPort: 0,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(first.slotId);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });

    /**
     * @tc.name testSnapshotAfterEditingSlotRecipientCenterPortText
     * @tc.number SUB_TELEPHONY_SMS_TRACE_DRAFT_31
     * @tc.desc Verify sendTextSms preserves the original options when the same draft is edited and sent again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSnapshotAfterEditingSlotRecipientCenterPortText', CASE_TYPE, (): void => {
      const trace = new SmsSendTrace();
      const draft = makeSmsTraceRequest(SmsTraceRequest.Primary);
      const first = makeSmsTraceRequest(SmsTraceRequest.Primary);

      trace.submitDraft(draft);
      draft.slotId = 0;
      draft.destinationHost = '+442079460101';
      draft.serviceCenter = '';
      draft.destinationPort = 0;
      draft.content = '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ';
      trace.submitDraft(draft);

      trace.verifyDrafts(first, {
        slotId: 0,
        destinationHost: '+442079460101',
        serviceCenter: '',
        destinationPort: 0,
        content: '  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ',
      });
      expect(draft.slotId).assertEqual(0);
      expect(draft.destinationHost).assertEqual('+442079460101');
      expect(draft.serviceCenter).assertEqual('');
      expect(draft.destinationPort).assertEqual(0);
      expect(draft.content).assertEqual('  Stop C\r\n\u65B0\u7AD9\uD83D\uDE89\u0000  ');
    });
  });
}
