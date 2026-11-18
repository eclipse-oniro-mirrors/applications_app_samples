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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CategoryId } from '../../../main/ets/model/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_StartMode]';

export default function startModeCategoryMatrixTest(): void {
  describe('StartModeCategoryMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_START_MODE_CATEGORY_0001
     * @tc.name      startModeCategoryMatrix0001
     * @tc.desc      CategoryId.Fruit 的枚举值为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeCategoryMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeCategoryMatrix0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 CategoryId.Fruit=${CategoryId.Fruit}`);
      expect(CategoryId.Fruit).assertEqual(0);
      const actual2: string = typeof CategoryId.Fruit;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = CategoryId.Fruit >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeCategoryMatrix0001 end');
    })

    /**
     * @tc.number    SUB_START_MODE_CATEGORY_0002
     * @tc.name      startModeCategoryMatrix0002
     * @tc.desc      CategoryId.Vegetable 的枚举值为 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeCategoryMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeCategoryMatrix0002 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 CategoryId.Vegetable=${CategoryId.Vegetable}`);
      expect(CategoryId.Vegetable).assertEqual(1);
      const actual2: string = typeof CategoryId.Vegetable;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = CategoryId.Vegetable >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeCategoryMatrix0002 end');
    })

    /**
     * @tc.number    SUB_START_MODE_CATEGORY_0003
     * @tc.name      startModeCategoryMatrix0003
     * @tc.desc      CategoryId.Nut 的枚举值为 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeCategoryMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeCategoryMatrix0003 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 CategoryId.Nut=${CategoryId.Nut}`);
      expect(CategoryId.Nut).assertEqual(2);
      const actual2: string = typeof CategoryId.Nut;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = CategoryId.Nut >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeCategoryMatrix0003 end');
    })

    /**
     * @tc.number    SUB_START_MODE_CATEGORY_0004
     * @tc.name      startModeCategoryMatrix0004
     * @tc.desc      CategoryId.Seafood 的枚举值为 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeCategoryMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeCategoryMatrix0004 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 CategoryId.Seafood=${CategoryId.Seafood}`);
      expect(CategoryId.Seafood).assertEqual(3);
      const actual2: string = typeof CategoryId.Seafood;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = CategoryId.Seafood >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeCategoryMatrix0004 end');
    })

    /**
     * @tc.number    SUB_START_MODE_CATEGORY_0005
     * @tc.name      startModeCategoryMatrix0005
     * @tc.desc      CategoryId.Dessert 的枚举值为 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeCategoryMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeCategoryMatrix0005 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 CategoryId.Dessert=${CategoryId.Dessert}`);
      expect(CategoryId.Dessert).assertEqual(4);
      const actual2: string = typeof CategoryId.Dessert;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = CategoryId.Dessert >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeCategoryMatrix0005 end');
    })

    /**
     * @tc.number    SUB_START_MODE_CATEGORY_0006
     * @tc.name      startModeCategoryMatrix0006
     * @tc.desc      CategoryId 五个分类取值互不相同且递增
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeCategoryMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeCategoryMatrix0006 begin');
      const values: Array<number> = [CategoryId.Fruit, CategoryId.Vegetable, CategoryId.Nut,
        CategoryId.Seafood, CategoryId.Dessert];
      let uniqueCount: number = 0;
      for (let i = 0; i < values.length; i++) {
        if (values.indexOf(values[i]) === i) {
          uniqueCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uniqueCount=${uniqueCount}`);
      expect(uniqueCount).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 values.length=${values.length}`);
      expect(values.length).assertEqual(5);
      const actual3: boolean = values[0] < values[4];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeCategoryMatrix0006 end');
    })
  })
}
