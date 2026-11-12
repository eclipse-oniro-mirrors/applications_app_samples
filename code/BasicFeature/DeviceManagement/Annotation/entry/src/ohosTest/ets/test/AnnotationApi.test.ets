/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { deviceInfo, SuppressWarningsType } from '@kit.BasicServicesKit';
import { describe, expect, it } from '@ohos/hypium';
import {
  AnnotationService,
  AVAILABLE_MIN_API_VERSION,
  FUTURE_DEMO_API_VERSION,
  SUPPRESS_ANNOTATION_SINCE_API_VERSION
} from '@ohos/annotation';
import { logger } from '../util/Logger';

const BUNDLE: string = 'Annotation_';
const MOCK_API_VERSION: number = 21;
const EXPECTED_AVAILABLE_MIN_API_VERSION: number = 22;
const EXPECTED_SUPPRESS_ANNOTATION_SINCE_API_VERSION: number = 23;
const EXPECTED_FUTURE_DEMO_API_VERSION: number = 27;
const SUPPRESSION_RULE_COUNT: number = 3;

export default function annotationApiTest() {
  describe('AnnotationAvailableTest', () => {
    /**
     * @tc.number SUB_ANNOTATION_API_0100
     * @tc.name testAvailable0001
     * @tc.desc Verify that the local API version is obtained from deviceInfo.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAvailable0001', 0, () => {
      logger.info(`${BUNDLE}testAvailable0001, begin`);
      const localVersion = AnnotationService.getLocalApiVersion();
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      expect(typeof localVersion).assertEqual('number');
      expect(localVersion > 0).assertTrue();
      logger.info(`${BUNDLE}testAvailable0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_API_0200
     * @tc.name testAvailable0002
     * @tc.desc Verify that the Available example uses API 22 as its minimum version.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAvailable0002', 0, () => {
      logger.info(`${BUNDLE}testAvailable0002, begin`);
      expect(AVAILABLE_MIN_API_VERSION).assertEqual(EXPECTED_AVAILABLE_MIN_API_VERSION);
      expect(typeof AVAILABLE_MIN_API_VERSION).assertEqual('number');
      expect(AVAILABLE_MIN_API_VERSION > 0).assertTrue();
      logger.info(`${BUNDLE}testAvailable0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_API_0300
     * @tc.name testAvailable0003
     * @tc.desc Verify that the mock environment is lower than the Available minimum version.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAvailable0003', 0, () => {
      logger.info(`${BUNDLE}testAvailable0003, begin`);
      const mockApiVersion = AnnotationService.getMockApiVersion();
      expect(mockApiVersion).assertEqual(MOCK_API_VERSION);
      expect(mockApiVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(typeof mockApiVersion).assertEqual('number');
      logger.info(`${BUNDLE}testAvailable0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_API_0400
     * @tc.name testAvailable0004
     * @tc.desc Verify that the Available example safely falls back in the API 21 mock environment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAvailable0004', 0, () => {
      logger.info(`${BUNDLE}testAvailable0004, begin`);
      const result = AnnotationService.runMockAvailableDemo();
      expect(result).assertFalse();
      expect(typeof result).assertEqual('boolean');
      expect(result === false).assertTrue();
      logger.info(`${BUNDLE}testAvailable0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_API_0500
     * @tc.name testAvailable0005
     * @tc.desc Verify that local Available execution follows the device API version guard.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAvailable0005', 0, () => {
      logger.info(`${BUNDLE}testAvailable0005, begin`);
      const expected = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      const result = AnnotationService.runAvailableDemo();
      expect(result).assertEqual(expected);
      expect(typeof result).assertEqual('boolean');
      expect(result === expected).assertTrue();
      logger.info(`${BUNDLE}testAvailable0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_API_0600
     * @tc.name testAvailable0006
     * @tc.desc Verify that repeated Available calls are stable and do not change the local API version.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAvailable0006', 0, () => {
      logger.info(`${BUNDLE}testAvailable0006, begin`);
      const expected = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      const result1 = AnnotationService.runAvailableDemo();
      const result2 = AnnotationService.runAvailableDemo();
      const localVersion = AnnotationService.getLocalApiVersion();
      expect(result1).assertEqual(expected);
      expect(result2).assertEqual(expected);
      expect(localVersion).assertEqual(deviceInfo.sdkApiVersion);
      logger.info(`${BUNDLE}testAvailable0006, end`);
    });
  });

  describe('AnnotationSuppressWarningsTest', () => {
    /**
     * @tc.number SUB_ANNOTATION_API_0700
     * @tc.name testSuppressWarnings0001
     * @tc.desc Verify the annotation starting version and the future example API version.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressWarnings0001', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarnings0001, begin`);
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION)
        .assertEqual(EXPECTED_SUPPRESS_ANNOTATION_SINCE_API_VERSION);
      expect(FUTURE_DEMO_API_VERSION).assertEqual(EXPECTED_FUTURE_DEMO_API_VERSION);
      expect(SUPPRESS_ANNOTATION_SINCE_API_VERSION < FUTURE_DEMO_API_VERSION).assertTrue();
      logger.info(`${BUNDLE}testSuppressWarnings0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_API_0800
     * @tc.name testSuppressWarnings0002
     * @tc.desc Verify the documented value of the compatibility suppression rule.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressWarnings0002', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarnings0002, begin`);
      expect(SuppressWarningsType.COMPATIBILITY).assertEqual('compatibility');
      expect(typeof SuppressWarningsType.COMPATIBILITY).assertEqual('string');
      expect(SuppressWarningsType.COMPATIBILITY.length > 0).assertTrue();
      logger.info(`${BUNDLE}testSuppressWarnings0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_API_0900
     * @tc.name testSuppressWarnings0003
     * @tc.desc Verify the documented value of the system capability suppression rule.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressWarnings0003', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarnings0003, begin`);
      expect(SuppressWarningsType.SYSCAP).assertEqual('syscap');
      expect(typeof SuppressWarningsType.SYSCAP).assertEqual('string');
      expect(SuppressWarningsType.SYSCAP.length > 0).assertTrue();
      logger.info(`${BUNDLE}testSuppressWarnings0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_API_1000
     * @tc.name testSuppressWarnings0004
     * @tc.desc Verify the documented value of the permission suppression rule.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressWarnings0004', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarnings0004, begin`);
      expect(SuppressWarningsType.PERMISSION).assertEqual('permission');
      expect(typeof SuppressWarningsType.PERMISSION).assertEqual('string');
      expect(SuppressWarningsType.PERMISSION.length > 0).assertTrue();
      logger.info(`${BUNDLE}testSuppressWarnings0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_API_1100
     * @tc.name testSuppressWarnings0005
     * @tc.desc Verify that all suppression rules are returned in the example definition order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressWarnings0005', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarnings0005, begin`);
      const rules = AnnotationService.getSuppressionRules();
      expect(rules.length).assertEqual(SUPPRESSION_RULE_COUNT);
      expect(rules[0]).assertEqual(SuppressWarningsType.COMPATIBILITY);
      expect(rules[1]).assertEqual(SuppressWarningsType.SYSCAP);
      expect(rules[2]).assertEqual(SuppressWarningsType.PERMISSION);
      expect(Array.isArray(rules)).assertTrue();
      logger.info(`${BUNDLE}testSuppressWarnings0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_API_1200
     * @tc.name testSuppressWarnings0006
     * @tc.desc Verify that changing a returned rule array does not affect later queries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressWarnings0006', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarnings0006, begin`);
      const changedRules = AnnotationService.getSuppressionRules();
      changedRules.pop();
      const currentRules = AnnotationService.getSuppressionRules();
      expect(currentRules.length).assertEqual(SUPPRESSION_RULE_COUNT);
      expect(currentRules[2]).assertEqual(SuppressWarningsType.PERMISSION);
      expect(changedRules.length).assertEqual(SUPPRESSION_RULE_COUNT - 1);
      logger.info(`${BUNDLE}testSuppressWarnings0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_API_1300
     * @tc.name testSuppressWarnings0007
     * @tc.desc Verify that warning suppression does not bypass the API 21 runtime fallback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressWarnings0007', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarnings0007, begin`);
      const result = AnnotationService.runMockSuppressWarningsDemo();
      expect(result).assertFalse();
      expect(typeof result).assertEqual('boolean');
      expect(result === false).assertTrue();
      logger.info(`${BUNDLE}testSuppressWarnings0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_API_1400
     * @tc.name testSuppressWarnings0008
     * @tc.desc Verify that local suppressed execution follows the future API version guard.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressWarnings0008', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarnings0008, begin`);
      const expected = deviceInfo.sdkApiVersion >= FUTURE_DEMO_API_VERSION;
      const result = AnnotationService.runSuppressWarningsDemo();
      expect(result).assertEqual(expected);
      expect(typeof result).assertEqual('boolean');
      expect(result === expected).assertTrue();
      logger.info(`${BUNDLE}testSuppressWarnings0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_API_1500
     * @tc.name testSuppressWarnings0009
     * @tc.desc Verify repeated suppressed calls and independence from the Available example.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressWarnings0009', 0, () => {
      logger.info(`${BUNDLE}testSuppressWarnings0009, begin`);
      const expectedSuppress = deviceInfo.sdkApiVersion >= FUTURE_DEMO_API_VERSION;
      const expectedAvailable = deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION;
      const resultAvailable1 = AnnotationService.runAvailableDemo();
      const resultSuppress1 = AnnotationService.runSuppressWarningsDemo();
      const resultSuppress2 = AnnotationService.runSuppressWarningsDemo();
      const resultAvailable2 = AnnotationService.runAvailableDemo();
      expect(resultAvailable1).assertEqual(expectedAvailable);
      expect(resultSuppress1).assertEqual(expectedSuppress);
      expect(resultSuppress2).assertEqual(expectedSuppress);
      expect(resultAvailable2).assertEqual(expectedAvailable);
      logger.info(`${BUNDLE}testSuppressWarnings0009, end`);
    });
  });
}
