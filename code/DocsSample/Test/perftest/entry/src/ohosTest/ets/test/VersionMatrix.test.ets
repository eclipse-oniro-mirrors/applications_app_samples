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

export default function versionMatrixTest() {
  describe('versionMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_VER_0001
   * @tc.name      testVersion0001
   * @tc.desc      Version 1 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0001', 'version 1');
    const code: number = 1010000;
    const name: string = '1.1.0';
    expect(code / 10000 - 100).assertEqual(1);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('1');
    expect(name.length).assertEqual(5);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_VER_0002
   * @tc.name      testVersion0002
   * @tc.desc      Version 2 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testVersion0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testVersion0002', 'version 2');
    const code: number = 1020000;
    const name: string = '1.2.0';
    expect(code / 10000 - 100).assertEqual(2);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('2');
    expect(name.length).assertEqual(5);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_VER_0003
   * @tc.name      testVersion0003
   * @tc.desc      Version 3 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testVersion0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testVersion0003', 'version 3');
    const code: number = 1030000;
    const name: string = '1.3.0';
    expect(code / 10000 - 100).assertEqual(3);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('3');
    expect(name.length).assertEqual(5);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_VER_0004
   * @tc.name      testVersion0004
   * @tc.desc      Version 4 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0004', 'version 4');
    const code: number = 1040000;
    const name: string = '1.4.0';
    expect(code / 10000 - 100).assertEqual(4);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('4');
    expect(name.length).assertEqual(5);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_VER_0005
   * @tc.name      testVersion0005
   * @tc.desc      Version 5 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testVersion0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testVersion0005', 'version 5');
    const code: number = 1050000;
    const name: string = '1.5.0';
    expect(code / 10000 - 100).assertEqual(5);
    expect(code % 10000).assertEqual(0);
