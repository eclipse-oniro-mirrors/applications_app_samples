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

const TAG: string = 'SmsOperationCatalog';

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

export default function smsSmsOperationCatalogTest() {
  describe('SmsOperationCatalog_Test', () => {
    let tracker: SmsTracker;

    beforeAll(async () => {
      hilog.info(0x0000, TAG, '%{public}s', 'beforeAll: SmsOperationCatalog test suite start');
      tracker = SmsTracker.getInstance();
      tracker.reset();
    })

    afterAll(async () => {
      hilog.info(0x0000, TAG, '%{public}s', 'afterAll: SmsOperationCatalog test suite end');
      hilog.info(0x0000, TAG, '%{public}s', 'afterAll: Operations: ' + tracker.getOperationCount());
      await yieldToEventLoop();
    })

    /**
     * 测试用例：testSmsSlotIdValidBoundary21319
     * 验证 slotId 边界值 1 的参数校验逻辑
     */
    it('testSmsSlotIdValidBoundary21319', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdValidBoundary21319 begin');
      const testSlotId: number = 1;
      const testContent: string = 'Hello SMS 21319';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdInvalidBoundary21320
     * 验证 slotId 非法值 99 被参数校验逻辑正确拒绝
     */
    it('testSmsSlotIdInvalidBoundary21320', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdInvalidBoundary21320 begin');
      const testSlotId: number = 99;
      const testContent: string = 'Boundary test 21320';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthValid21321
     * 验证短信内容长度 1 通过内容长度校验
     */
    it('testSmsContentLengthValid21321', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthValid21321 begin');
      const testContent: string = 'A'.repeat(1);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthInvalid21322
     * 验证短信内容长度 200 被内容长度校验正确拒绝
     */
    it('testSmsContentLengthInvalid21322', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthInvalid21322 begin');
      const testContent: string = 'A'.repeat(200);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsDestinationPortValid21323
     * 验证 destinationPort 边界值 65535 通过参数校验
     */
    it('testSmsDestinationPortValid21323', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsDestinationPortValid21323 begin');
      const testPort: number = 65535;
      const testContent: string = 'Port test 21323';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsCombinedParamsValid21340
     * 验证 slotId=1 content 和 port=1000 的组合参数校验
     */
    it('testSmsCombinedParamsValid21340', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsCombinedParamsValid21340 begin');
      const testSlotId: number = 1;
      const testContent: string = 'Combined valid 21340';
      const testPort: number = 1000;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'combined params valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdMinBoundary21356
     * 验证 slotId 最小值 0 的边界校验
     */
    it('testSmsSlotIdMinBoundary21356', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdMinBoundary21356 begin');
      const testSlotId: number = 0;
      const testContent: string = 'Boundary 21356';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthExactMax21357
     * 验证短信内容长度恰好为最大值时的校验行为
     */
    it('testSmsContentLengthExactMax21357', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthExactMax21357 begin');
      const testContent: string = 'B'.repeat(140);
      const isValid: boolean = validateSmsContentLength(testContent);
      const lengthMatches: boolean = testContent.length === 140;
      tracker.recordVisible(isValid && lengthMatches);
      hilog.info(0x0000, TAG, '%{public}s', 'length: ' + testContent.length + ' matches: ' + lengthMatches);
      expect(isValid && lengthMatches).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsPhoneNumberVariations21358
     * 验证号码 +8613900000002 的格式校验
     */
    it('testSmsPhoneNumberVariations21358', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsPhoneNumberVariations21358 begin');
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
     * 测试用例：testSmsPortMaxBoundary21359
     * 验证 destinationPort 最大值 65535 的边界校验
     */
    it('testSmsPortMaxBoundary21359', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsPortMaxBoundary21359 begin');
      const testPort: number = 65535;
      const testContent: string = 'Port boundary 21359';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsValidateContentWithEmoji21360
     * 验证含 emoji 的短信内容通过长度校验
     */
    it('testSmsValidateContentWithEmoji21360', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsValidateContentWithEmoji21360 begin');
      const testContent: string = 'Hello 👋 world';
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'emoji content valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdValidBoundary21361
     * 验证 slotId 边界值 1 的参数校验逻辑
     */
    it('testSmsSlotIdValidBoundary21361', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdValidBoundary21361 begin');
      const testSlotId: number = 1;
      const testContent: string = 'Hello SMS 21361';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdInvalidBoundary21362
     * 验证 slotId 非法值 99 被参数校验逻辑正确拒绝
     */
    it('testSmsSlotIdInvalidBoundary21362', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdInvalidBoundary21362 begin');
      const testSlotId: number = 99;
      const testContent: string = 'Boundary test 21362';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthValid21363
     * 验证短信内容长度 1 通过内容长度校验
     */
    it('testSmsContentLengthValid21363', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthValid21363 begin');
      const testContent: string = 'A'.repeat(1);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthInvalid21364
     * 验证短信内容长度 200 被内容长度校验正确拒绝
     */
    it('testSmsContentLengthInvalid21364', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthInvalid21364 begin');
      const testContent: string = 'A'.repeat(200);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsDestinationPortValid21365
     * 验证 destinationPort 边界值 65535 通过参数校验
     */
    it('testSmsDestinationPortValid21365', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsDestinationPortValid21365 begin');
      const testPort: number = 65535;
      const testContent: string = 'Port test 21365';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

  })
}
