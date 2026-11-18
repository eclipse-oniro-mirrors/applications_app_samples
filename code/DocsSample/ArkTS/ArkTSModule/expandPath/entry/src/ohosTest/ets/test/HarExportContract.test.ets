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
import { MainPage } from 'expandPathHar';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPath_Export]';

export default function harExportContractTest() {
  describe('harExportContractTest', () => {
    /**
     * @tc.number    SUB_EXPAND_EXPORT_0100
     * @tc.name      testExportsDefined
     * @tc.desc      Verify all documented exports of expandPathHar are defined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testExportsDefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExportsDefined begin');
      expect(har.One !== undefined).assertTrue();
      expect(har.module1 !== undefined).assertTrue();
      expect(har.module2 !== undefined).assertTrue();
      expect(har.module3 !== undefined).assertTrue();
      expect(har.module4 !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExportsDefined end');
    });

    /**
     * @tc.number    SUB_EXPAND_EXPORT_0200
     * @tc.name      testStringExportValues
     * @tc.desc      Verify the five string exports keep the value '1'
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testStringExportValues', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStringExportValues begin');
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStringExportValues end');
    });

    /**
     * @tc.number    SUB_EXPAND_EXPORT_0300
     * @tc.name      testStringExportShape
     * @tc.desc      Verify the string exports are single-character numeric strings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testStringExportShape', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStringExportShape begin');
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      for (let i: number = 0; i < values.length; i++) {
        expect(typeof values[i]).assertEqual('string');
        expect(values[i].length).assertEqual(1);
        expect(values[i].charCodeAt(0)).assertEqual(49);
        expect(values[i].trim()).assertEqual(values[i]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStringExportShape end');
    });

    /**
     * @tc.number    SUB_EXPAND_EXPORT_0400
     * @tc.name      testExportNamesUnique
     * @tc.desc      Verify the export names are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testExportNamesUnique', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExportNamesUnique begin');
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      for (let i: number = 0; i < names.length; i++) {
        expect(names.indexOf(names[i])).assertEqual(i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testExportNamesUnique end');
    });

    /**
     * @tc.number    SUB_EXPAND_EXPORT_0500
     * @tc.name      testMainPageExport
     * @tc.desc      Verify MainPage is exported from both the package and the named export
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testMainPageExport', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMainPageExport begin');
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMainPageExport end');
    });
  });
}
