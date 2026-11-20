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

export default function textSenseMatrixTest() {
  describe('textSenseMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0001
   * @tc.name      testTextSense0001
   * @tc.desc      Text alpha keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0001', 'text alpha length');
    const text: string = 'alpha';
    expect(text.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0002
   * @tc.name      testTextSense0002
   * @tc.desc      Text alpha keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0002', 'text alpha middle char');
    const text: string = 'alpha';
    expect(text.charAt(2)).assertEqual('p');
    expect(text.charCodeAt(2)).assertEqual(112);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0003
   * @tc.name      testTextSense0003
   * @tc.desc      Text alpha keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0003', 'text alpha slice equals substring');
    const text: string = 'alpha';
    expect(text.slice(2)).assertEqual('pha');
    expect(text.substring(2)).assertEqual('pha');
    expect(text.slice(2).length + 2).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0004
   * @tc.name      testTextSense0004
   * @tc.desc      Text alpha keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0004', 'text alpha case pairs');
    const text: string = 'alpha';
    expect(text.toUpperCase()).assertEqual('ALPHA');
    expect(text.toLowerCase()).assertEqual('alpha');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0005
   * @tc.name      testTextSense0005
   * @tc.desc      Text alpha keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0005', 'text alpha search edges');
    const text: string = 'alpha';
    expect(text.indexOf('a')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0006
   * @tc.name      testTextSense0006
   * @tc.desc      Text alpha keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0006', 'text alpha prefix and suffix');
    const text: string = 'alpha';
    expect(text.startsWith('al')).assertTrue();
    expect(text.endsWith('ha')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0007
