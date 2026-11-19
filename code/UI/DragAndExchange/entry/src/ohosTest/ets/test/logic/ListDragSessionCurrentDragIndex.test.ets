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
import { ListDragSession } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ListDragSession.currentDragIndex (1 cases). */
export default function listDragSessionCurrentDragIndexTest(): void {
  describe('ListDragSessionCurrentDragIndexTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_CURRENT_DRAG_INDEX_0001
     * @tc.name      DragAndExchange_ListDragSessionCurrentDragIndex_0001
     * @tc.desc      ListDragSession.currentDragIndex() yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ListDragSessionCurrentDragIndex_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListDragSessionCurrentDragIndex_0001 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: number = subject.currentDragIndex();
      logInfo(`currentDragIndex(): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionCurrentDragIndex_0001 end`);
    });
  });
}
