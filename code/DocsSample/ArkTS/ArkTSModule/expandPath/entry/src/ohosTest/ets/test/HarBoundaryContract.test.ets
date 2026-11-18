/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import * as har from 'expandPathHar';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPath_Boundary]';

function stringExports(): string[] {
  return [har.One, har.module1, har.module2, har.module3, har.module4];
}

export default function harBoundaryContractTest() {
  describe('harBoundaryContractTest', () => {
    /**
     * @tc.number    SUB_EXPAND_BOUNDARY_0100
     * @tc.name      testExportsNotBlank
     * @tc.desc      Verify no string export is empty, padded or contains control characters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testExportsNotBlank', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExportsNotBlank begin');
      const values: string[] = stringExports();
      for (let i: number = 0; i < values.length; i++) {
        expect(values[i].length).assertEqual(1);
        expect(values[i].trim()).assertEqual(values[i]);
        expect(values[i].indexOf(' ')).assertEqual(-1);
        expect(values[i].indexOf('\n')).assertEqual(-1);
        expect(values[i].indexOf('\t')).assertEqual(-1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExportsNotBlank end');
    });

    /**
     * @tc.number    SUB_EXPAND_BOUNDARY_0200
     * @tc.name      testNumericConversion
     * @tc.desc      Verify each export converts to the number 1
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testNumericConversion', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNumericConversion begin');
      const values: string[] = stringExports();
      for (let i: number = 0; i < values.length; i++) {
        expect(Number(values[i])).assertEqual(1);
        expect(parseInt(values[i], 10)).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNumericConversion end');
    });

    /**
     * @tc.number    SUB_EXPAND_BOUNDARY_0300
     * @tc.name      testCharacterShape
     * @tc.desc      Verify every export is the single ASCII character '1'
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testCharacterShape', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCharacterShape begin');
      const values: string[] = stringExports();
      for (let i: number = 0; i < values.length; i++) {
        expect(values[i].charAt(0)).assertEqual('1');
        expect(values[i].charCodeAt(0)).assertEqual(49);
        expect(typeof values[i]).assertEqual('string');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCharacterShape end');
    });

    /**
     * @tc.number    SUB_EXPAND_BOUNDARY_0400
     * @tc.name      testExportNameMapping
     * @tc.desc      Verify export names map to stable indices and stay unique
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testExportNameMapping', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExportNameMapping begin');
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      for (let i: number = 0; i < names.length; i++) {
        expect(names.indexOf(names[i])).assertEqual(i);
        expect(names[i].length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExportNameMapping end');
    });

    /**
     * @tc.number    SUB_EXPAND_BOUNDARY_0500
     * @tc.name      testAllExportsSameValue
     * @tc.desc      Verify the five string exports are mutually equal
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAllExportsSameValue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAllExportsSameValue begin');
      const values: string[] = stringExports();
      for (let i: number = 0; i < values.length; i++) {
        expect(values[i]).assertEqual(values[0]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAllExportsSameValue end');
    });

    /**
     * @tc.number    SUB_EXPAND_BOUNDARY_0600
     * @tc.name      testStringEqualityIsStable
     * @tc.desc      Verify reading an export twice returns equal strings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testStringEqualityIsStable', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStringEqualityIsStable begin');
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(first).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStringEqualityIsStable end');
    });
  });
}
