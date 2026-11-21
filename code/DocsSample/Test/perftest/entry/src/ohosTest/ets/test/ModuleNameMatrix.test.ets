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

export default function moduleNameMatrixTest() {
  describe('moduleNameMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_NAME_0001
   * @tc.name      testModuleName0001
   * @tc.desc      Name entry keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0001', 'entry length');
    const token: string = 'entry';
    expect(token.length).assertEqual(5);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_NAME_0002
   * @tc.name      testModuleName0002
   * @tc.desc      Name entry keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0002', 'entry first char');
    const token: string = 'entry';
    expect(token.charAt(0)).assertEqual('e');
    expect(token.charCodeAt(0)).assertEqual(101);
  });

  /**
