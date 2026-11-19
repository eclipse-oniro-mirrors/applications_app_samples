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
import { OffsetModel } from '../../../../main/ets/model/OffsetModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImageViewer]';
const BUNDLE: string = 'ImageViewer_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for OffsetModel.toString (1 cases). */
export default function offsetModelToStringTest(): void {
  describe('OffsetModelToStringTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_OFFSET_MODEL_TO_STRING_0001
     * @tc.name      ImageViewer_OffsetModelToString_0001
     * @tc.desc      OffsetModel.toString() yields "[currentX: 0 currentY: 0 lastX: 0 lastY: 0]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_OffsetModelToString_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}OffsetModelToString_0001 begin`);
      const subject: OffsetModel = new OffsetModel(0, 0);
      const actual: string = subject.toString();
      logInfo(`toString(): actual=${actual}`);
      expect(actual).assertEqual('[currentX: 0 currentY: 0 lastX: 0 lastY: 0]');
      logInfo(`${BUNDLE}OffsetModelToString_0001 end`);
    });
  });
}
