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

const TAG: string = 'SmsOperationFlow';

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

export default function smsSmsOperationFlowTest() {
  describe('SmsOperationFlow_Test', () => {
    let tracker: SmsTracker;

    beforeAll(async () => {
      hilog.info(0x0000, TAG, '%{public}s', 'beforeAll: SmsOperationFlow test suite start');
      tracker = SmsTracker.getInstance();
      tracker.reset();
    })

    afterAll(async () => {
      hilog.info(0x0000, TAG, '%{public}s', 'afterAll: SmsOperationFlow test suite end');
      hilog.info(0x0000, TAG, '%{public}s', 'afterAll: Operations: ' + tracker.getOperationCount());
      await yieldToEventLoop();
    })

    /**
     * 测试用例：testSmsSlotIdValidBoundary21554
     * 验证 slotId 边界值 2 的参数校验逻辑
     */
    it('testSmsSlotIdValidBoundary21554', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdValidBoundary21554 begin');
      const testSlotId: number = 2;
      const testContent: string = 'Hello SMS 21554';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdInvalidBoundary21555
     * 验证 slotId 非法值 -1 被参数校验逻辑正确拒绝
     */
    it('testSmsSlotIdInvalidBoundary21555', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdInvalidBoundary21555 begin');
      const testSlotId: number = -1;
      const testContent: string = 'Boundary test 21555';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthValid21556
     * 验证短信内容长度 70 通过内容长度校验
     */
    it('testSmsContentLengthValid21556', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthValid21556 begin');
      const testContent: string = 'A'.repeat(70);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthInvalid21557
     * 验证短信内容长度 500 被内容长度校验正确拒绝
     */
    it('testSmsContentLengthInvalid21557', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthInvalid21557 begin');
      const testContent: string = 'A'.repeat(500);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsDestinationPortValid21558
     * 验证 destinationPort 边界值 0 通过参数校验
     */
    it('testSmsDestinationPortValid21558', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsDestinationPortValid21558 begin');
      const testPort: number = 0;
      const testContent: string = 'Port test 21558';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsDestinationPortInvalid21559
     * 验证 destinationPort 非法值 65536 被参数校验正确拒绝
     */
    it('testSmsDestinationPortInvalid21559', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsDestinationPortInvalid21559 begin');
      const testPort: number = 65536;
      const testContent: string = 'Port invalid test 21559';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsCombinedParamsValid21575
     * 验证 slotId=2 content 和 port=65535 的组合参数校验
     */
    it('testSmsCombinedParamsValid21575', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsCombinedParamsValid21575 begin');
      const testSlotId: number = 2;
      const testContent: string = 'Combined valid 21575';
      const testPort: number = 65535;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'combined params valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdMaxBoundary21591
     * 验证 slotId 最大值 2 的边界校验
     */
    it('testSmsSlotIdMaxBoundary21591', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdMaxBoundary21591 begin');
      const testSlotId: number = 2;
      const testContent: string = 'Boundary 21591';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthExactMax21592
     * 验证短信内容长度恰好为最大值时的校验行为
     */
    it('testSmsContentLengthExactMax21592', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthExactMax21592 begin');
      const testContent: string = 'B'.repeat(140);
      const isValid: boolean = validateSmsContentLength(testContent);
      const lengthMatches: boolean = testContent.length === 140;
      tracker.recordVisible(isValid && lengthMatches);
      hilog.info(0x0000, TAG, '%{public}s', 'length: ' + testContent.length + ' matches: ' + lengthMatches);
      expect(isValid && lengthMatches).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsPhoneNumberVariations21593
     * 验证号码 +8613600000003 的格式校验
     */
    it('testSmsPhoneNumberVariations21593', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsPhoneNumberVariations21593 begin');
      const testPhone: string = '+8613600000003';
      const isValid: boolean = validatePhoneNumber(testPhone);
      const lengthOk: boolean = testPhone.length === 14;
      tracker.recordVisible(isValid && lengthOk);
      hilog.info(0x0000, TAG, '%{public}s', 'phone: ' + testPhone + ' valid: ' + isValid + ' lengthOk: ' + lengthOk);
      expect(isValid).assertTrue();
      expect(testPhone.length).assertEqual(14);
      done();
    })

    /**
     * 测试用例：testSmsPortMinBoundary21594
     * 验证 destinationPort 最小值 0 的边界校验
     */
    it('testSmsPortMinBoundary21594', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsPortMinBoundary21594 begin');
      const testPort: number = 0;
      const testContent: string = 'Port boundary 21594';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsValidateContentWithEmoji21595
     * 验证含 emoji 的短信内容通过长度校验
     */
    it('testSmsValidateContentWithEmoji21595', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsValidateContentWithEmoji21595 begin');
      const testContent: string = '短信 😊 测试';
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'emoji content valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdValidBoundary21596
     * 验证 slotId 边界值 2 的参数校验逻辑
     */
    it('testSmsSlotIdValidBoundary21596', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdValidBoundary21596 begin');
      const testSlotId: number = 2;
      const testContent: string = 'Hello SMS 21596';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdInvalidBoundary21597
     * 验证 slotId 非法值 -1 被参数校验逻辑正确拒绝
     */
    it('testSmsSlotIdInvalidBoundary21597', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdInvalidBoundary21597 begin');
      const testSlotId: number = -1;
      const testContent: string = 'Boundary test 21597';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthValid21598
     * 验证短信内容长度 70 通过内容长度校验
     */
    it('testSmsContentLengthValid21598', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthValid21598 begin');
      const testContent: string = 'A'.repeat(70);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthInvalid21599
     * 验证短信内容长度 500 被内容长度校验正确拒绝
     */
    it('testSmsContentLengthInvalid21599', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthInvalid21599 begin');
      const testContent: string = 'A'.repeat(500);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsDestinationPortValid21600
     * 验证 destinationPort 边界值 0 通过参数校验
     */
    it('testSmsDestinationPortValid21600', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsDestinationPortValid21600 begin');
      const testPort: number = 0;
      const testContent: string = 'Port test 21600';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsDestinationPortInvalid21601
     * 验证 destinationPort 非法值 65536 被参数校验正确拒绝
     */
    it('testSmsDestinationPortInvalid21601', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsDestinationPortInvalid21601 begin');
      const testPort: number = 65536;
      const testContent: string = 'Port invalid test 21601';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

  })
}
