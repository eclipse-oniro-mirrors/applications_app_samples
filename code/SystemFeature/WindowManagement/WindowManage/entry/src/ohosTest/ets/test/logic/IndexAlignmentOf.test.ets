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
import { indexAlignmentOf } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for indexAlignmentOf (2 cases). */
export default function indexAlignmentOfTest(): void {
  describe('IndexAlignmentOfTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_INDEX_ALIGNMENT_OF_0001
     * @tc.name      WindowManage_IndexAlignmentOf_0001
     * @tc.desc      indexAlignmentOf(isChangeWindow=true) returns "Start"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_IndexAlignmentOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}IndexAlignmentOf_0001 begin`);
      const actual: string = indexAlignmentOf(true);
      logInfo(`indexAlignmentOf(isChangeWindow=true): actual=${actual}`);
      expect(actual).assertEqual('Start');
      logInfo(`${BUNDLE}IndexAlignmentOf_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INDEX_ALIGNMENT_OF_0002
     * @tc.name      WindowManage_IndexAlignmentOf_0002
     * @tc.desc      indexAlignmentOf(isChangeWindow=false) returns "Center"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_IndexAlignmentOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}IndexAlignmentOf_0002 begin`);
      const actual: string = indexAlignmentOf(false);
      logInfo(`indexAlignmentOf(isChangeWindow=false): actual=${actual}`);
      expect(actual).assertEqual('Center');
      logInfo(`${BUNDLE}IndexAlignmentOf_0002 end`);
    });
  });
}
