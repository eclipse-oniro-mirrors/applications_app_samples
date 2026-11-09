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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

// Default exported entry that registers the local unit test suite.
export default function localUnitTest() {
  // Define a test suite that groups the local unit test cases below.
  describe('localUnitTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    // Runs once before all test cases in this suite.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    // Runs before each test case in this suite.
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    // Runs after each test case in this suite ends.
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    // Runs once after all test cases in this suite end.
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    /**
     * @tc.number    SUB_NETWORKSECURITY_UNIT_ASSERTCONTAIN_0100
     * @tc.name      testAssertContain0001
     * @tc.desc      Verify hypium expect assertions for substring containment and equality.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testAssertContain0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Per-case log tag, kept identical to the it() name and @tc.name.
      const TAG: string = 'testAssertContain0001';
      // Local unit tests run outside a device, so use console for log retrieval.
      console.info(TAG + ' start');
      // Declare the sample string used by the assertions.
      let a: string = 'abc';
      // Declare the substring expected to be contained in a.
      let b: string = 'b';
      // Assert that a contains the substring b.
      expect(a).assertContain(b);
      // Assert that a equals itself to verify the equality assertion.
      expect(a).assertEqual(a);
      console.info(TAG + ' end');
    });
  });
}
