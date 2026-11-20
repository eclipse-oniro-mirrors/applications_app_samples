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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  DEFAULT_SLOT_ID,
  DEFAULT_DESTINATION_PORT,
  DEFAULT_DESTINATION_HOST,
  DEFAULT_SERVICE_CENTER,
  SLOT_ID_MIN,
  SLOT_ID_MAX,
  CONTENT_MAX_LENGTH,
  CONTENT_EMPTY,
  DESTINATION_PORT_MIN,
  DESTINATION_PORT_MAX,
  validateSmsParameters,
  validateSmsContentLength,
  validatePhoneNumber,
  logTestProgress,
} from '../Shared/SharedSmsDriver';
import { yieldToEventLoop } from '../Shared/TestScheduling';

const TAG: string = 'SmsAuthSession';

/**
 * SmsTracker: singleton test execution tracker for recording pure-logic test metrics
 */
class SmsTracker {
  private static instance: SmsTracker | null = null;
  private operationCount: number = 0;
  private validationHistory: boolean[] = [];
  private timestampHistory: number[] = [];

  private constructor() {
    hilog.info(0x0000, TAG, '%{public}s', 'SmsTracker: instance created');
  }

  public static getInstance(): SmsTracker {
    if (SmsTracker.instance === null) {
      SmsTracker.instance = new SmsTracker();
    }
    return SmsTracker.instance;
  }

  public recordVisible(visible: boolean): void {
    this.validationHistory.push(visible);
    this.operationCount++;
    this.timestampHistory.push(Date.now());
    hilog.info(0x0000, TAG, '%{public}s', 'SmsTracker: validation recorded: ' + visible);
  }

  public getOperationCount(): number {
    return this.operationCount;
  }

  public reset(): void {
    this.operationCount = 0;
    this.validationHistory = [];
    this.timestampHistory = [];
    hilog.info(0x0000, TAG, '%{public}s', 'SmsTracker: state reset');
  }
}

export default function smsSmsAuthSessionTest() {
  describe('SmsAuthSession_Test', () => {
    let tracker: SmsTracker;

    beforeAll(async () => {
      hilog.info(0x0000, TAG, '%{public}s', 'beforeAll: SmsAuthSession test suite start');
      tracker = SmsTracker.getInstance();
      tracker.reset();
    })

    afterAll(async () => {
      hilog.info(0x0000, TAG, '%{public}s', 'afterAll: SmsAuthSession test suite end');
      hilog.info(0x0000, TAG, '%{public}s', 'afterAll: Operations: ' + tracker.getOperationCount());
      await yieldToEventLoop();
    })

    /**
     * 测试用例：testSmsSlotIdValidBoundary1
     * 验证 slotId 边界值 1 的参数校验逻辑
     */
    it('testSmsSlotIdValidBoundary1', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdValidBoundary1 begin');
      const testSlotId: number = 1;
      const testContent: string = 'Hello SMS 1';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdInvalidBoundary2
     * 验证 slotId 非法值 99 被参数校验逻辑正确拒绝
     */
    it('testSmsSlotIdInvalidBoundary2', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdInvalidBoundary2 begin');
      const testSlotId: number = 99;
      const testContent: string = 'Boundary test 2';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthValid3
     * 验证短信内容长度 1 通过内容长度校验
     */
    it('testSmsContentLengthValid3', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthValid3 begin');
      const testContent: string = 'A'.repeat(1);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthInvalid4
     * 验证短信内容长度 200 被内容长度校验正确拒绝
     */
    it('testSmsContentLengthInvalid4', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthInvalid4 begin');
      const testContent: string = 'A'.repeat(200);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsDestinationPortValid5
     * 验证 destinationPort 边界值 65535 通过参数校验
     */
    it('testSmsDestinationPortValid5', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsDestinationPortValid5 begin');
      const testPort: number = 65535;
      const testContent: string = 'Port test 5';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsDestinationPortInvalid6
     * 验证 destinationPort 非法值 -1 被参数校验正确拒绝
     */
    it('testSmsDestinationPortInvalid6', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsDestinationPortInvalid6 begin');
      const testPort: number = -1;
      const testContent: string = 'Port invalid test 6';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsPhoneNumberFormatValid7
     * 验证目标主机号码 +8613900000002 通过号码格式校验
     */
    it('testSmsPhoneNumberFormatValid7', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsPhoneNumberFormatValid7 begin');
      const testPhone: string = '+8613900000002';
      const isValid: boolean = validatePhoneNumber(testPhone);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'phone: ' + testPhone + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdValidBoundary24073
     * 验证 slotId 边界值 1 的参数校验逻辑
     */
    it('testSmsSlotIdValidBoundary24073', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdValidBoundary24073 begin');
      const testSlotId: number = 1;
      const testContent: string = 'Hello SMS 24073';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdInvalidBoundary24074
     * 验证 slotId 非法值 99 被参数校验逻辑正确拒绝
     */
    it('testSmsSlotIdInvalidBoundary24074', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdInvalidBoundary24074 begin');
      const testSlotId: number = 99;
      const testContent: string = 'Boundary test 24074';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthValid24075
     * 验证短信内容长度 1 通过内容长度校验
     */
    it('testSmsContentLengthValid24075', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthValid24075 begin');
      const testContent: string = 'A'.repeat(1);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthInvalid24076
     * 验证短信内容长度 200 被内容长度校验正确拒绝
     */
    it('testSmsContentLengthInvalid24076', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthInvalid24076 begin');
      const testContent: string = 'A'.repeat(200);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsDestinationPortValid24077
     * 验证 destinationPort 边界值 65535 通过参数校验
     */
    it('testSmsDestinationPortValid24077', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsDestinationPortValid24077 begin');
      const testPort: number = 65535;
      const testContent: string = 'Port test 24077';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsCombinedParamsValid24094
     * 验证 slotId=1 content 和 port=1000 的组合参数校验
     */
    it('testSmsCombinedParamsValid24094', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsCombinedParamsValid24094 begin');
      const testSlotId: number = 1;
      const testContent: string = 'Combined valid 24094';
      const testPort: number = 1000;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'combined params valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdMinBoundary24110
     * 验证 slotId 最小值 0 的边界校验
     */
    it('testSmsSlotIdMinBoundary24110', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdMinBoundary24110 begin');
      const testSlotId: number = 0;
      const testContent: string = 'Boundary 24110';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthExactMax24111
     * 验证短信内容长度恰好为最大值时的校验行为
     */
    it('testSmsContentLengthExactMax24111', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthExactMax24111 begin');
      const testContent: string = 'B'.repeat(140);
      const isValid: boolean = validateSmsContentLength(testContent);
      const lengthMatches: boolean = testContent.length === 140;
      tracker.recordVisible(isValid && lengthMatches);
      hilog.info(0x0000, TAG, '%{public}s', 'length: ' + testContent.length + ' matches: ' + lengthMatches);
      expect(isValid && lengthMatches).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsPhoneNumberVariations24112
     * 验证号码 +8613900000002 的格式校验
     */
    it('testSmsPhoneNumberVariations24112', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsPhoneNumberVariations24112 begin');
      const testPhone: string = '+8613900000002';
      const isValid: boolean = validatePhoneNumber(testPhone);
      const lengthOk: boolean = testPhone.length === 14;
      tracker.recordVisible(isValid && lengthOk);
      hilog.info(0x0000, TAG, '%{public}s', 'phone: ' + testPhone + ' valid: ' + isValid + ' lengthOk: ' + lengthOk);
      expect(isValid).assertTrue();
      expect(testPhone.length).assertEqual(14);
      done();
    })

    /**
     * 测试用例：testSmsPortMaxBoundary24113
     * 验证 destinationPort 最大值 65535 的边界校验
     */
    it('testSmsPortMaxBoundary24113', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsPortMaxBoundary24113 begin');
      const testPort: number = 65535;
      const testContent: string = 'Port boundary 24113';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsValidateContentWithEmoji24114
     * 验证含 emoji 的短信内容通过长度校验
     */
    it('testSmsValidateContentWithEmoji24114', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsValidateContentWithEmoji24114 begin');
      const testContent: string = 'Hello 👋 world';
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'emoji content valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdValidBoundary24115
     * 验证 slotId 边界值 1 的参数校验逻辑
     */
    it('testSmsSlotIdValidBoundary24115', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdValidBoundary24115 begin');
      const testSlotId: number = 1;
      const testContent: string = 'Hello SMS 24115';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

  })
}
