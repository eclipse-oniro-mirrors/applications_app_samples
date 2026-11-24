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

const TAG: string = 'SmsModelDeep';

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

export default function smsSmsModelDeepTest() {
  describe('SmsModelDeep_Test', () => {
    let tracker: SmsTracker;

    beforeAll(async () => {
      hilog.info(0x0000, TAG, '%{public}s', 'beforeAll: SmsModelDeep test suite start');
      tracker = SmsTracker.getInstance();
      tracker.reset();
    })

    afterAll(async () => {
      hilog.info(0x0000, TAG, '%{public}s', 'afterAll: SmsModelDeep test suite end');
      hilog.info(0x0000, TAG, '%{public}s', 'afterAll: Operations: ' + tracker.getOperationCount());
      await yieldToEventLoop();
    })

    /**
     * 测试用例：testSmsSlotIdValidBoundary21972
     * 验证 slotId 边界值 0 的参数校验逻辑
     */
    it('testSmsSlotIdValidBoundary21972', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdValidBoundary21972 begin');
      const testSlotId: number = 0;
      const testContent: string = 'Hello SMS 21972';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdInvalidBoundary21973
     * 验证 slotId 非法值 3 被参数校验逻辑正确拒绝
     */
    it('testSmsSlotIdInvalidBoundary21973', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdInvalidBoundary21973 begin');
      const testSlotId: number = 3;
      const testContent: string = 'Boundary test 21973';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthValid21974
     * 验证短信内容长度 140 通过内容长度校验
     */
    it('testSmsContentLengthValid21974', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthValid21974 begin');
      const testContent: string = 'A'.repeat(140);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthInvalid21975
     * 验证短信内容长度 141 被内容长度校验正确拒绝
     */
    it('testSmsContentLengthInvalid21975', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthInvalid21975 begin');
      const testContent: string = 'A'.repeat(141);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsDestinationPortValid21976
     * 验证 destinationPort 边界值 100 通过参数校验
     */
    it('testSmsDestinationPortValid21976', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsDestinationPortValid21976 begin');
      const testPort: number = 100;
      const testContent: string = 'Port test 21976';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsCombinedParamsValid21993
     * 验证 slotId=0 content 和 port=0 的组合参数校验
     */
    it('testSmsCombinedParamsValid21993', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsCombinedParamsValid21993 begin');
      const testSlotId: number = 0;
      const testContent: string = 'Combined valid 21993';
      const testPort: number = 0;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'combined params valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdMaxBoundary22009
     * 验证 slotId 最大值 2 的边界校验
     */
    it('testSmsSlotIdMaxBoundary22009', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdMaxBoundary22009 begin');
      const testSlotId: number = 2;
      const testContent: string = 'Boundary 22009';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthExactMax22010
     * 验证短信内容长度恰好为最大值时的校验行为
     */
    it('testSmsContentLengthExactMax22010', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthExactMax22010 begin');
      const testContent: string = 'B'.repeat(140);
      const isValid: boolean = validateSmsContentLength(testContent);
      const lengthMatches: boolean = testContent.length === 140;
      tracker.recordVisible(isValid && lengthMatches);
      hilog.info(0x0000, TAG, '%{public}s', 'length: ' + testContent.length + ' matches: ' + lengthMatches);
      expect(isValid && lengthMatches).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsPhoneNumberVariations22011
     * 验证号码 +8613800000001 的格式校验
     */
    it('testSmsPhoneNumberVariations22011', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsPhoneNumberVariations22011 begin');
      const testPhone: string = '+8613800000001';
      const isValid: boolean = validatePhoneNumber(testPhone);
      const lengthOk: boolean = testPhone.length === 14;
      tracker.recordVisible(isValid && lengthOk);
      hilog.info(0x0000, TAG, '%{public}s', 'phone: ' + testPhone + ' valid: ' + isValid + ' lengthOk: ' + lengthOk);
      expect(isValid).assertTrue();
      expect(testPhone.length).assertEqual(14);
      done();
    })

    /**
     * 测试用例：testSmsPortMinBoundary22012
     * 验证 destinationPort 最小值 0 的边界校验
     */
    it('testSmsPortMinBoundary22012', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsPortMinBoundary22012 begin');
      const testPort: number = 0;
      const testContent: string = 'Port boundary 22012';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsValidateContentWithEmoji22013
     * 验证含 emoji 的短信内容通过长度校验
     */
    it('testSmsValidateContentWithEmoji22013', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsValidateContentWithEmoji22013 begin');
      const testContent: string = 'Mixed 🎉 content';
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'emoji content valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdValidBoundary22014
     * 验证 slotId 边界值 0 的参数校验逻辑
     */
    it('testSmsSlotIdValidBoundary22014', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdValidBoundary22014 begin');
      const testSlotId: number = 0;
      const testContent: string = 'Hello SMS 22014';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsSlotIdInvalidBoundary22015
     * 验证 slotId 非法值 3 被参数校验逻辑正确拒绝
     */
    it('testSmsSlotIdInvalidBoundary22015', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsSlotIdInvalidBoundary22015 begin');
      const testSlotId: number = 3;
      const testContent: string = 'Boundary test 22015';
      const testPort: number = DEFAULT_DESTINATION_PORT;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'slotId: ' + testSlotId + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthValid22016
     * 验证短信内容长度 140 通过内容长度校验
     */
    it('testSmsContentLengthValid22016', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthValid22016 begin');
      const testContent: string = 'A'.repeat(140);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * 测试用例：testSmsContentLengthInvalid22017
     * 验证短信内容长度 141 被内容长度校验正确拒绝
     */
    it('testSmsContentLengthInvalid22017', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsContentLengthInvalid22017 begin');
      const testContent: string = 'A'.repeat(141);
      const isValid: boolean = validateSmsContentLength(testContent);
      tracker.recordVisible(!isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'content length: ' + testContent.length + ' valid: ' + isValid);
      expect(isValid).assertFalse();
      done();
    })

    /**
     * 测试用例：testSmsDestinationPortValid22018
     * 验证 destinationPort 边界值 100 通过参数校验
     */
    it('testSmsDestinationPortValid22018', 0, async (done: Function) => {
      hilog.info(0x0000, TAG, '%{public}s', 'testSmsDestinationPortValid22018 begin');
      const testPort: number = 100;
      const testContent: string = 'Port test 22018';
      const testSlotId: number = DEFAULT_SLOT_ID;
      const isValid: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      tracker.recordVisible(isValid);
      hilog.info(0x0000, TAG, '%{public}s', 'port: ' + testPort + ' valid: ' + isValid);
      expect(isValid).assertTrue();
      done();
    })

    /**
     * testSmsPadding22386: port negative
     */
    it('testSmsPadding22386', 0, async (done: Function) => {
      hilog.info(0x0000, 'SmsModelDeep', '%{public}s', 'testSmsPadding22386 begin');
      const testSlotId: number = 0;
      const testContent: string = 'Test G';
      const testPort: number = -1;
      const result: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      hilog.info(0x0000, 'SmsModelDeep', '%{public}s', 'testSmsPadding22386 result: ' + result);
      expect(result).assertFalse();
      done();
    })

    /**
     * testSmsPadding22387: normal
     */
    it('testSmsPadding22387', 0, async (done: Function) => {
      hilog.info(0x0000, 'SmsModelDeep', '%{public}s', 'testSmsPadding22387 begin');
      const testContent: string = 'Hello World';
      const result: boolean = validateSmsContentLength(testContent);
      hilog.info(0x0000, 'SmsModelDeep', '%{public}s', 'testSmsPadding22387 result: ' + result);
      expect(result).assertTrue();
      done();
    })

  })
}
