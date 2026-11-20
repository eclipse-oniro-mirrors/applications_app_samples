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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { fruitArray } from '../../../../main/ets/data/CollectionCategory';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CollectionCategory (1 cases). */
export default function collectionCategoryConstantsTest(): void {
  describe('CollectionCategoryConstantsTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COLLECTION_CATEGORY_CONSTANTS_0001
     * @tc.name      ComponentCollection_CollectionCategoryConstants_0001
     * @tc.desc      fruitArray keeps value len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_CollectionCategoryConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CollectionCategoryConstants_0001 begin`);
      const actual = fruitArray;
      logInfo(`fruitArray: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}CollectionCategoryConstants_0001 end`);
    });
  });
}
