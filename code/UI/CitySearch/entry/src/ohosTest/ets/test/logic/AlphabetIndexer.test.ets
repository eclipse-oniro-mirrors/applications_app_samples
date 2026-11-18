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
import { alphabetIndexer } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for alphabetIndexer (1 cases). */
export default function alphabetIndexerTest(): void {
  describe('AlphabetIndexerTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_ALPHABET_INDEXER_0001
     * @tc.name      CitySearch_AlphabetIndexer_0001
     * @tc.desc      alphabetIndexer() returns ["A","B","C","F","G","H","J","L","N","Q","S","T","W","X","Y","Z"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_AlphabetIndexer_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AlphabetIndexer_0001 begin`);
      const actual: string[] = alphabetIndexer();
      logInfo(`alphabetIndexer(): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`alphabetIndexer(): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["A","B","C","F","G","H","J","L","N","Q","S","T","W","X","Y","Z"]');
      logInfo(`${BUNDLE}AlphabetIndexer_0001 end`);
    });
  });
}
