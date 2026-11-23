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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ImageData } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ImageData.getName (1 cases). */
export default function imageDataGetNameTest(): void {
  describe('ImageDataGetNameTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_IMAGE_DATA_GET_NAME_0001
     * @tc.name      Image_ImageDataGetName_0001
     * @tc.desc      ImageData.getName() yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ImageDataGetName_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ImageDataGetName_0001 begin`);
      const subject: ImageData = new ImageData();
      const actual = subject.getName();
      logInfo(`getName(): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ImageDataGetName_0001 end`);
    });
  });
}
