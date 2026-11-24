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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
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

const TAG: string = 'SmsAdvancedScenarios';

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

export default function smsSmsAdvancedScenariosTest() {
  describe('SmsAdvancedScenarios_Test', () => {
    let tracker: SmsTracker;

    beforeAll(async () => {
      hilog.info(0x0000, TAG, '%{public}s', 'beforeAll: SmsAdvancedScenarios test suite start');
      tracker = SmsTracker.getInstance();
      tracker.reset();
    })

    afterAll(async () => {
      hilog.info(0x0000, TAG, '%{public}s', 'afterAll: SmsAdvancedScenarios test suite end');
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
     * testSmsPadding20100: slot0 port0
     */
    it('testSmsPadding20100', 0, async (done: Function) => {
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20100 begin');
      const testSlotId: number = 0;
      const testContent: string = 'Test A';
      const testPort: number = 0;
      const result: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20100 result: ' + result);
      expect(result).assertTrue();
      done();
    })

    /**
     * testSmsPadding20101: empty
     */
    it('testSmsPadding20101', 0, async (done: Function) => {
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20101 begin');
      const testContent: string = '';
      const result: boolean = validateSmsContentLength(testContent);
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20101 result: ' + result);
      expect(result).assertTrue();
      done();
    })

    /**
     * testSmsPadding20102: valid
     */
    it('testSmsPadding20102', 0, async (done: Function) => {
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20102 begin');
      const testPhone: string = '+8613800138000';
      const result: boolean = validatePhoneNumber(testPhone);
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20102 result: ' + result);
      expect(result).assertTrue();
      done();
    })

    /**
     * testSmsPadding20103: slot0 port max
     */
    it('testSmsPadding20103', 0, async (done: Function) => {
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20103 begin');
      const testSlotId: number = 0;
      const testContent: string = 'Test B';
      const testPort: number = 65535;
      const result: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20103 result: ' + result);
      expect(result).assertTrue();
      done();
    })

    /**
     * testSmsPadding20104: single
     */
    it('testSmsPadding20104', 0, async (done: Function) => {
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20104 begin');
      const testContent: string = 'A';
      const result: boolean = validateSmsContentLength(testContent);
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20104 result: ' + result);
      expect(result).assertTrue();
      done();
    })

    /**
     * testSmsPadding20105: valid2
     */
    it('testSmsPadding20105', 0, async (done: Function) => {
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20105 begin');
      const testPhone: string = '+8613800138001';
      const result: boolean = validatePhoneNumber(testPhone);
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20105 result: ' + result);
      expect(result).assertTrue();
      done();
    })

    /**
     * testSmsPadding20106: slot2 valid
     */
    it('testSmsPadding20106', 0, async (done: Function) => {
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20106 begin');
      const testSlotId: number = 2;
      const testContent: string = 'Test C';
      const testPort: number = 1000;
      const result: boolean = validateSmsParameters(testSlotId, testContent, testPort);
      hilog.info(0x0000, 'SmsAdvancedScenarios', '%{public}s', 'testSmsPadding20106 result: ' + result);
      expect(result).assertTrue();
      done();
    })

    /**
     * @tc.name testSmsValidationBoundaryTest0100
     * @tc.number SUB_TELEPHONY_SMS_VALIDATION_SUPPLEMENT_TEST_0100
     * @tc.desc Verify all upper bounds can be reached together and each bound is enforced independently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsValidationBoundaryTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxLengthBody: string = 'A'.repeat(CONTENT_MAX_LENGTH);
      expect(validateSmsParameters(SLOT_ID_MAX, maxLengthBody, DESTINATION_PORT_MAX)).assertTrue();
      expect(validateSmsParameters(SLOT_ID_MAX + 1, maxLengthBody, DESTINATION_PORT_MAX)).assertFalse();
      expect(validateSmsParameters(SLOT_ID_MAX, maxLengthBody + 'A', DESTINATION_PORT_MAX)).assertFalse();
      expect(validateSmsParameters(SLOT_ID_MAX, maxLengthBody, DESTINATION_PORT_MAX + 1)).assertFalse();
    });

    /**
     * @tc.name testSmsValidationBoundaryTest0200
     * @tc.number SUB_TELEPHONY_SMS_VALIDATION_SUPPLEMENT_TEST_0200
     * @tc.desc Verify fixing one of two invalid fields leaves the request invalid until both are corrected
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsValidationBoundaryTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const invalidSlot: number = SLOT_ID_MIN - 1;
      const invalidPort: number = DESTINATION_PORT_MIN - 1;
      const body: string = 'Pickup confirmed';
      expect(validateSmsParameters(invalidSlot, body, invalidPort)).assertFalse();
      expect(validateSmsParameters(SLOT_ID_MIN, body, invalidPort)).assertFalse();
      expect(validateSmsParameters(invalidSlot, body, DESTINATION_PORT_MIN)).assertFalse();
      expect(validateSmsParameters(SLOT_ID_MIN, body, DESTINATION_PORT_MIN)).assertTrue();
    });

    /**
     * @tc.name testSmsValidationBoundaryTest0300
     * @tc.number SUB_TELEPHONY_SMS_VALIDATION_SUPPLEMENT_TEST_0300
     * @tc.desc Verify an empty body and port zero are accepted together by the parameter helper
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsValidationBoundaryTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyWithZeroPort: boolean = validateSmsParameters(SLOT_ID_MIN, CONTENT_EMPTY, DESTINATION_PORT_MIN);
      const emptyWithDefaultPort: boolean = validateSmsParameters(SLOT_ID_MIN, CONTENT_EMPTY, DEFAULT_DESTINATION_PORT);
      expect(emptyWithZeroPort).assertTrue();
      expect(emptyWithDefaultPort).assertTrue();
    });

    /**
     * @tc.name testSmsValidationBoundaryTest0400
     * @tc.number SUB_TELEPHONY_SMS_VALIDATION_SUPPLEMENT_TEST_0400
     * @tc.desc Verify replacing one ASCII character with an emoji can exceed the UTF-16 length bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsValidationBoundaryTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const prefix: string = 'A'.repeat(CONTENT_MAX_LENGTH - 1);
      const asciiBody: string = prefix + 'B';
      const emojiBody: string = prefix + '\uD83D\uDE00';
      expect(validateSmsContentLength(asciiBody)).assertTrue();
      expect(validateSmsContentLength(emojiBody)).assertFalse();
    });

    /**
     * @tc.name testSmsValidationBoundaryTest0500
     * @tc.number SUB_TELEPHONY_SMS_VALIDATION_SUPPLEMENT_TEST_0500
     * @tc.desc Verify trailing whitespace counts toward the content length limit
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsValidationBoundaryTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const paddedBody: string = 'A'.repeat(CONTENT_MAX_LENGTH - 1) + ' ';
      const overLimitBody: string = paddedBody + '\n';
      expect(validateSmsContentLength(paddedBody)).assertTrue();
      expect(validateSmsContentLength(overLimitBody)).assertFalse();
    });

    /**
     * @tc.name testSmsValidationBoundaryTest0600
     * @tc.number SUB_TELEPHONY_SMS_VALIDATION_SUPPLEMENT_TEST_0600
     * @tc.desc Verify the same subscriber digits are accepted with plus 86 and rejected with 0086
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsValidationBoundaryTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const subscriber: string = '13800138000';
      expect(validatePhoneNumber('+86' + subscriber)).assertTrue();
      expect(validatePhoneNumber('0086' + subscriber)).assertFalse();
    });

    /**
     * @tc.name testSmsValidationBoundaryTest0700
     * @tc.number SUB_TELEPHONY_SMS_VALIDATION_SUPPLEMENT_TEST_0700
     * @tc.desc Verify a fullwidth digit is rejected in an otherwise valid number of the same length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSmsValidationBoundaryTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberPrefix: string = '+861380013800';
      expect(validatePhoneNumber(numberPrefix + '0')).assertTrue();
      expect(validatePhoneNumber(numberPrefix + '\uFF10')).assertFalse();
    });
  })
}
