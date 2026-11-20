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
import { One as DeepOne } from 'expandPathHar/src/main/ets/NumberString';
import { One as UtilsOne } from 'expandPathHar/src/main/ets/Utils';
import { module1 as DeepModule1 } from 'expandPathHar/src/main/ets/OtherModule1';
import { module3 as DeepModule3 } from 'expandPathHar/src/main/ets/OtherModule3';
import { module3 as UtilsModule3 } from 'expandPathHar/src/main/ets/Utils';
import { module4 as DeepModule4 } from 'expandPathHar/src/main/ets/OtherModule4';
import { module4 as UtilsModule4 } from 'expandPathHar/src/main/ets/Utils';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPath_Aggregation]';

export default function harAggregationContractTest() {
  describe('harAggregationContractTest', () => {
    /**
     * @tc.number    SUB_EXPAND_AGGREGATION_0100
     * @tc.name      testOnePackageMatchesDeepImport
     * @tc.desc      Verify package entry and deep NumberString import expose the same One value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testOnePackageMatchesDeepImport', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOnePackageMatchesDeepImport begin');
      expect(har.One).assertEqual(DeepOne);
      expect(har.One).assertEqual(UtilsOne);
      expect(har.One).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOnePackageMatchesDeepImport end');
    });

    /**
     * @tc.number    SUB_EXPAND_AGGREGATION_0200
     * @tc.name      testModule1PackageMatchesDeepImport
     * @tc.desc      Verify package module1 and deep OtherModule1 export are identical
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModule1PackageMatchesDeepImport', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModule1PackageMatchesDeepImport begin');
      expect(har.module1).assertEqual(DeepModule1);
      expect(har.module1).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModule1PackageMatchesDeepImport end');
    });

    /**
     * @tc.number    SUB_EXPAND_AGGREGATION_0300
     * @tc.name      testModule3ReexportChain
     * @tc.desc      Verify module3 is reachable through Utils, package entry and deep import
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModule3ReexportChain', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModule3ReexportChain begin');
      expect(har.module3).assertEqual(DeepModule3);
      expect(har.module3).assertEqual(UtilsModule3);
      expect(har.module3).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModule3ReexportChain end');
    });

    /**
     * @tc.number    SUB_EXPAND_AGGREGATION_0400
     * @tc.name      testModule4ReexportChain
     * @tc.desc      Verify module4 is reachable through Utils, package entry and deep import
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testModule4ReexportChain', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModule4ReexportChain begin');
      expect(har.module4).assertEqual(DeepModule4);
      expect(har.module4).assertEqual(UtilsModule4);
      expect(har.module4).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModule4ReexportChain end');
    });

    /**
     * @tc.number    SUB_EXPAND_AGGREGATION_0500
     * @tc.name      testAllAggregatedExportsEqual
     * @tc.desc      Verify all aggregation paths produce the same value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAllAggregatedExportsEqual', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAllAggregatedExportsEqual begin');
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1, DeepModule3, UtilsModule3, DeepModule4, UtilsModule4];
      for (let i: number = 0; i < values.length; i++) {
        expect(values[i]).assertEqual('1');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAllAggregatedExportsEqual end');
    });
  });
}
