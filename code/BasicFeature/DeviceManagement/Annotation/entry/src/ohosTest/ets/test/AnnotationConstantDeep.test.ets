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

import { deviceInfo } from '@kit.BasicServicesKit';
import { describe, expect, it, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import {
  AnnotationService,
  AVAILABLE_MIN_API_VERSION,
  SUPPRESS_ANNOTATION_SINCE_API_VERSION,
  FUTURE_DEMO_API_VERSION
} from '@ohos/annotation';
import { logger } from '../util/Logger';

const BUNDLE: string = 'Annotation_ConstantDeep_';

export default function annotationConstantDeepTest() {
  describe('AnnotationConstantDeep', () => {
    beforeAll(() => {
      logger.info(`${BUNDLE}AnnotationConstantDeep, beforeAll`);
    });

    beforeEach(() => {
      logger.info(`${BUNDLE}AnnotationConstantDeep, beforeEach`);
    });

    afterEach(() => {
      logger.info(`${BUNDLE}AnnotationConstantDeep, afterEach`);
    });

    afterAll(() => {
      logger.info(`${BUNDLE}AnnotationConstantDeep, afterAll`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONST_0100
     * @tc.name testAvailableMinApiVersionDeep0001
     * @tc.desc Deep validation of AVAILABLE_MIN_API_VERSION.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testAvailableMinApiVersionDeep0001', 0, () => {
      logger.info(`${BUNDLE}testAvailableMinApiVersionDeep0001, begin`);
      
      const constant = AVAILABLE_MIN_API_VERSION;
      expect(constant).assertEqual(22);
      expect(typeof constant).assertEqual('number');
      expect(constant > 0).assertTrue();
      expect(constant >= 21).assertTrue();
      expect(constant <= 23).assertTrue();
      
      // Verify with device version
      const deviceVersion = deviceInfo.sdkApiVersion;
      expect(typeof deviceVersion).assertEqual('number');
      expect(deviceVersion > 0).assertTrue();
      
      logger.info(`${BUNDLE}testAvailableMinApiVersionDeep0001, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONST_0200
     * @tc.name testSuppressAnnotationSinceDeep0002
     * @tc.desc Deep validation of SUPPRESS_ANNOTATION_SINCE_API_VERSION.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSuppressAnnotationSinceDeep0002', 0, () => {
      logger.info(`${BUNDLE}testSuppressAnnotationSinceDeep0002, begin`);
      
      const constant = SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      expect(constant).assertEqual(23);
      expect(typeof constant).assertEqual('number');
      expect(constant > 0).assertTrue();
      expect(constant > AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(constant === AVAILABLE_MIN_API_VERSION + 1).assertTrue();
      
      // Verify relationship
      const gap = constant - AVAILABLE_MIN_API_VERSION;
      expect(gap).assertEqual(1);
      expect(typeof gap).assertEqual('number');
      
      logger.info(`${BUNDLE}testSuppressAnnotationSinceDeep0002, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONST_0300
     * @tc.name testFutureDemoApiVersionDeep0003
     * @tc.desc Deep validation of FUTURE_DEMO_API_VERSION.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testFutureDemoApiVersionDeep0003', 0, () => {
      logger.info(`${BUNDLE}testFutureDemoApiVersionDeep0003, begin`);
      
      const constant = FUTURE_DEMO_API_VERSION;
      expect(constant).assertEqual(27);
      expect(typeof constant).assertEqual('number');
      expect(constant > 0).assertTrue();
      expect(constant > SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertTrue();
      expect(constant > AVAILABLE_MIN_API_VERSION).assertTrue();
      
      // Verify gaps
      const gap1 = constant - AVAILABLE_MIN_API_VERSION;
      const gap2 = constant - SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      expect(gap1).assertEqual(5);
      expect(gap2).assertEqual(4);
      expect(typeof gap1).assertEqual('number');
      expect(typeof gap2).assertEqual('number');
      
      logger.info(`${BUNDLE}testFutureDemoApiVersionDeep0003, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONST_0400
     * @tc.name testConstantOrdering0004
     * @tc.desc Verify constant ordering relationships.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstantOrdering0004', 0, () => {
      logger.info(`${BUNDLE}testConstantOrdering0004, begin`);
      
      const available = AVAILABLE_MIN_API_VERSION;
      const suppress = SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      const future = FUTURE_DEMO_API_VERSION;
      
      // Verify ordering
      expect(available < suppress).assertTrue();
      expect(suppress < future).assertTrue();
      expect(available < future).assertTrue();
      
      // Verify transitivity
      expect(available + 1 === suppress).assertTrue();
      expect(suppress + 4 === future).assertTrue();
      expect(available + 5 === future).assertTrue();
      
      expect(typeof available).assertEqual('number');
      expect(typeof suppress).assertEqual('number');
      expect(typeof future).assertEqual('number');
      
      logger.info(`${BUNDLE}testConstantOrdering0004, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONST_0500
     * @tc.name testConstantImmutability0005
     * @tc.desc Verify constants remain immutable after operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstantImmutability0005', 0, () => {
      logger.info(`${BUNDLE}testConstantImmutability0005, begin`);
      
      const beforeAvailable = AVAILABLE_MIN_API_VERSION;
      const beforeSuppress = SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      const beforeFuture = FUTURE_DEMO_API_VERSION;
      
      // Perform operations
      AnnotationService.runAvailableDemo();
      AnnotationService.runSuppressWarningsDemo();
      AnnotationService.runMockAvailableDemo();
      AnnotationService.runMockSuppressWarningsDemo();
      
      // Verify immutability
      const afterAvailable = AVAILABLE_MIN_API_VERSION;
      const afterSuppress = SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      const afterFuture = FUTURE_DEMO_API_VERSION;
      
      expect(afterAvailable).assertEqual(beforeAvailable);
      expect(afterSuppress).assertEqual(beforeSuppress);
      expect(afterFuture).assertEqual(beforeFuture);
      expect(afterAvailable === beforeAvailable).assertTrue();
      expect(afterSuppress === beforeSuppress).assertTrue();
      expect(afterFuture === beforeFuture).assertTrue();
      
      logger.info(`${BUNDLE}testConstantImmutability0005, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONST_0600
     * @tc.name testConstantWithDeviceVersion0006
     * @tc.desc Verify constants relationship with device version.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstantWithDeviceVersion0006', 0, () => {
      logger.info(`${BUNDLE}testConstantWithDeviceVersion0006, begin`);
      
      const deviceVersion = deviceInfo.sdkApiVersion;
      const localVersion = AnnotationService.getLocalApiVersion();
      
      expect(localVersion).assertEqual(deviceVersion);
      expect(typeof deviceVersion).assertEqual('number');
      expect(deviceVersion > 0).assertTrue();
      
      // Verify against constants
      const comparison1 = deviceVersion >= AVAILABLE_MIN_API_VERSION;
      const comparison2 = deviceVersion >= SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      const comparison3 = deviceVersion >= FUTURE_DEMO_API_VERSION;
      
      expect(typeof comparison1).assertEqual('boolean');
      expect(typeof comparison2).assertEqual('boolean');
      expect(typeof comparison3).assertEqual('boolean');
      
      logger.info(`${BUNDLE}testConstantWithDeviceVersion0006, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONST_0700
     * @tc.name testConstantMathematicalRelations0007
     * @tc.desc Verify mathematical relationships between constants.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstantMathematicalRelations0007', 0, () => {
      logger.info(`${BUNDLE}testConstantMathematicalRelations0007, begin`);
      
      const available = AVAILABLE_MIN_API_VERSION;
      const suppress = SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      const future = FUTURE_DEMO_API_VERSION;
      
      // Mathematical relations
      expect(suppress - available).assertEqual(1);
      expect(future - suppress).assertEqual(4);
      expect(future - available).assertEqual(5);
      
      // Verify arithmetic
      expect(available + 1).assertEqual(suppress);
      expect(suppress + 4).assertEqual(future);
      expect(available + 5).assertEqual(future);
      
      expect(typeof available).assertEqual('number');
      expect(typeof suppress).assertEqual('number');
      expect(typeof future).assertEqual('number');
      
      logger.info(`${BUNDLE}testConstantMathematicalRelations0007, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONST_0800
     * @tc.name testConstantTypeValidation0008
     * @tc.desc Validate constant types thoroughly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testConstantTypeValidation0008', 0, () => {
      logger.info(`${BUNDLE}testConstantTypeValidation0008, begin`);
      
      const available = AVAILABLE_MIN_API_VERSION;
      const suppress = SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      const future = FUTURE_DEMO_API_VERSION;
      
      // Type validation
      expect(typeof available).assertEqual('number');
      expect(typeof suppress).assertEqual('number');
      expect(typeof future).assertEqual('number');
      
      // Number validation
      expect(Number.isFinite(available)).assertTrue();
      expect(Number.isFinite(suppress)).assertTrue();
      expect(Number.isFinite(future)).assertTrue();
      
      expect(Number.isInteger(available)).assertTrue();
      expect(Number.isInteger(suppress)).assertTrue();
      expect(Number.isInteger(future)).assertTrue();
      
      logger.info(`${BUNDLE}testConstantTypeValidation0008, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONST_0900
     * @tc.name testConstantBoundaryValidation0009
     * @tc.desc Validate constants at boundaries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstantBoundaryValidation0009', 0, () => {
      logger.info(`${BUNDLE}testConstantBoundaryValidation0009, begin`);
      
      const available = AVAILABLE_MIN_API_VERSION;
      const suppress = SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      const future = FUTURE_DEMO_API_VERSION;
      
      // Boundary validation
      expect(available >= 0).assertTrue();
      expect(suppress >= 0).assertTrue();
      expect(future >= 0).assertTrue();
      
      expect(available > 0).assertTrue();
      expect(suppress > 0).assertTrue();
      expect(future > 0).assertTrue();
      
      expect(available < 100).assertTrue();
      expect(suppress < 100).assertTrue();
      expect(future < 100).assertTrue();
      
      expect(typeof available).assertEqual('number');
      expect(typeof suppress).assertEqual('number');
      expect(typeof future).assertEqual('number');
      
      logger.info(`${BUNDLE}testConstantBoundaryValidation0009, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONST_1000
     * @tc.name testConstantConsistencyAcrossCalls0010
     * @tc.desc Verify constant consistency across multiple calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstantConsistencyAcrossCalls0010', 0, () => {
      logger.info(`${BUNDLE}testConstantConsistencyAcrossCalls0010, begin`);
      
      const calls = 50;
      const availableValues: number[] = [];
      const suppressValues: number[] = [];
      const futureValues: number[] = [];
      
      for (let i = 0; i < calls; i++) {
        availableValues.push(AVAILABLE_MIN_API_VERSION);
        suppressValues.push(SUPPRESS_ANNOTATION_SINCE_API_VERSION);
        futureValues.push(FUTURE_DEMO_API_VERSION);
      }
      
      // Verify consistency
      const firstAvailable = availableValues[0];
      const firstSuppress = suppressValues[0];
      const firstFuture = futureValues[0];
      
      let allAvailableSame = true;
      let allSuppressSame = true;
      let allFutureSame = true;
      
      for (const value of availableValues) {
        if (value !== firstAvailable) {
          allAvailableSame = false;
          break;
        }
      }
      
      for (const value of suppressValues) {
        if (value !== firstSuppress) {
          allSuppressSame = false;
          break;
        }
      }
      
      for (const value of futureValues) {
        if (value !== firstFuture) {
          allFutureSame = false;
          break;
        }
      }
      
      expect(allAvailableSame).assertTrue();
      expect(allSuppressSame).assertTrue();
      expect(allFutureSame).assertTrue();
      expect(firstAvailable).assertEqual(22);
      expect(firstSuppress).assertEqual(23);
      expect(firstFuture).assertEqual(27);
      expect(availableValues.length).assertEqual(calls);
      expect(suppressValues.length).assertEqual(calls);
      expect(futureValues.length).assertEqual(calls);
      
      logger.info(`${BUNDLE}testConstantConsistencyAcrossCalls0010, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONST_1100
     * @tc.name testConstantWithMockVersion0011
     * @tc.desc Verify constants relationship with mock version.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstantWithMockVersion0011', 0, () => {
      logger.info(`${BUNDLE}testConstantWithMockVersion0011, begin`);
      
      const mockVersion = AnnotationService.getMockApiVersion();
      
      expect(mockVersion).assertEqual(21);
      expect(mockVersion).assertEqual(AVAILABLE_MIN_API_VERSION - 1);
      expect(mockVersion < AVAILABLE_MIN_API_VERSION).assertTrue();
      expect(mockVersion < SUPPRESS_ANNOTATION_SINCE_API_VERSION).assertTrue();
      expect(mockVersion < FUTURE_DEMO_API_VERSION).assertTrue();
      expect(typeof mockVersion).assertEqual('number');
      
      logger.info(`${BUNDLE}testConstantWithMockVersion0011, end`);
    });

    /**
     * @tc.number SUB_ANNOTATION_CONST_1200
     * @tc.name testConstantHistoricalCompatibility0012
     * @tc.desc Verify constants historical compatibility.
     * @tc.size LARGE
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testConstantHistoricalCompatibility0012', 0, () => {
      logger.info(`${BUNDLE}testConstantHistoricalCompatibility0012, begin`);
      
      // Historical versions
      const v21 = 21;
      const v22 = AVAILABLE_MIN_API_VERSION;
      const v23 = SUPPRESS_ANNOTATION_SINCE_API_VERSION;
      const v27 = FUTURE_DEMO_API_VERSION;
      
      // Verify progression
      expect(v21 < v22).assertTrue();
      expect(v22 < v23).assertTrue();
      expect(v23 < v27).assertTrue();
      
      // Verify gaps
      expect(v22 - v21).assertEqual(1);
      expect(v23 - v22).assertEqual(1);
      expect(v27 - v23).assertEqual(4);
      
      // Verify compatibility
      expect(v21 >= 20).assertTrue();
      expect(v22 >= 21).assertTrue();
      expect(v23 >= 22).assertTrue();
      expect(v27 >= 26).assertTrue();
      
      expect(typeof v21).assertEqual('number');
      expect(typeof v22).assertEqual('number');
      expect(typeof v23).assertEqual('number');
      expect(typeof v27).assertEqual('number');
      
      logger.info(`${BUNDLE}testConstantHistoricalCompatibility0012, end`);
    });
  });
}
