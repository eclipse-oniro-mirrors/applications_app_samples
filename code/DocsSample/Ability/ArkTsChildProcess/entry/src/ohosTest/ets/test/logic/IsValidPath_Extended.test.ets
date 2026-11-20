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

import { describe, expect, it, beforeAll, afterAll, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ChildProcessModel } from '../Shared/ChildProcessFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_arktschildprocess]';
const BUNDLE: string = 'ArkTsChildProcess_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isValidPath (50 cases). */
export default function isValidPathExtendedTest(): void {
  describe('IsValidPathExtendedTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidPathExtendedTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidPathExtendedTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0001
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0001
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p0.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_isValidPath_Extended_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p0.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0002
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0002
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p1.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Extended_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p1.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0003
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0003
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p2.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Extended_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p2.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0004
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0004
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p3.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Extended_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p3.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0005
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0005
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p4.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Extended_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p4.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0006
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0006
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p5.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Extended_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p5.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0007
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0007
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p6.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Extended_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p6.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0008
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0008
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p7.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Extended_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p7.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0009
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0009
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p8.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Extended_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p8.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0010
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0010
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p9.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidPath_Extended_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p9.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0011
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0011
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p10.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p10.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0012
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0012
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p11.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p11.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0013
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0013
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p12.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p12.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0014
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0014
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p13.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p13.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0015
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0015
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p14.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p14.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0016
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0016
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p15.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p15.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0017
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0017
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p16.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p16.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0018
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0018
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p17.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p17.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0019
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0019
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p18.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p18.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0020
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0020
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p19.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p19.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0021
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0021
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p20.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p20.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0022
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0022
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p21.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p21.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0023
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0023
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p22.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p22.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0024
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0024
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p23.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p23.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0025
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0025
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p24.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p24.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0026
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0026
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p25.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p25.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0027
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0027
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p26.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p26.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0028
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0028
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p27.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p27.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0029
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0029
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p28.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p28.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0030
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0030
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p29.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidPath_Extended_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p29.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0031
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0031
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p30.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p30.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0032
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0032
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p31.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p31.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0033
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0033
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p32.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p32.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0034
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0034
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p33.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p33.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0035
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0035
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p34.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p34.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0036
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0036
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p35.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p35.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0037
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0037
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p36.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p36.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0038
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0038
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p37.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p37.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0039
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0039
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p38.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p38.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0040
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0040
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p39.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p39.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0041
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0041
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p40.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p40.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0042
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0042
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p41.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p41.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0043
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0043
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p42.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p42.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0044
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0044
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p43.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p43.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0045
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0045
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p44.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p44.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0046
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0046
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p45.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p45.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0047
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0047
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p46.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p46.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0048
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0048
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p47.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p47.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0049
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0049
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p48.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p48.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_PATH_EXTENDED_0050
     * @tc.name      ArkTsChildProcess_isValidPath_Extended_0050
     * @tc.desc      [DelimitedString|expected=false] Verify isValidPath(/data/p49.txt) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidPath_Extended_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: DelimitedString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidPath('/data/p49.txt');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

  });
}
