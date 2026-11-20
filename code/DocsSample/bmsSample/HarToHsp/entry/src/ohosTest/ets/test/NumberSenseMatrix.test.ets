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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function numberSenseMatrixTest() {
  describe('numberSenseMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NUM_0001
   * @tc.name      testNumberSense0001
   * @tc.desc      Integer parse round 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0001', 'int parse 1');
    expect(parseInt('20', 10)).assertEqual(20);
    expect(Number('20')).assertEqual(20);
    expect(parseInt('14', 16)).assertEqual(20);
    expect(parseInt('10100', 2)).assertEqual(20);
    expect((20).toString(16)).assertEqual('14');
    expect(Number.isInteger(20)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NUM_0002
   * @tc.name      testNumberSense0002
   * @tc.desc      Integer parse round 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0002', 'int parse 2');
    expect(parseInt('33', 10)).assertEqual(33);
    expect(Number('33')).assertEqual(33);
    expect(parseInt('21', 16)).assertEqual(33);
    expect(parseInt('100001', 2)).assertEqual(33);
    expect((33).toString(16)).assertEqual('21');
    expect(Number.isInteger(33)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NUM_0003
   * @tc.name      testNumberSense0003
   * @tc.desc      Integer parse round 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0003', 'int parse 3');
    expect(parseInt('46', 10)).assertEqual(46);
    expect(Number('46')).assertEqual(46);
    expect(parseInt('2e', 16)).assertEqual(46);
    expect(parseInt('101110', 2)).assertEqual(46);
    expect((46).toString(16)).assertEqual('2e');
    expect(Number.isInteger(46)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NUM_0004
   * @tc.name      testNumberSense0004
