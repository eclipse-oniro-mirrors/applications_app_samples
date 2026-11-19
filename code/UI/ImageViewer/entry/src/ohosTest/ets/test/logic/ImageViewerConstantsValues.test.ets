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
import { ImageViewerConstants } from '../../../../main/ets/constants/ImageViewerConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImageViewer]';
const BUNDLE: string = 'ImageViewer_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ImageViewerConstants (2 cases). */
export default function imageViewerConstantsValuesTest(): void {
  describe('ImageViewerConstantsValuesTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_IMAGE_VIEWER_CONSTANTS_VALUES_0001
     * @tc.name      ImageViewer_ImageViewerConstantsValues_0001
     * @tc.desc      ImageViewerConstants.ANIMATE_DURATION keeps value 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_ImageViewerConstantsValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ImageViewerConstantsValues_0001 begin`);
      const actual: number = ImageViewerConstants.ANIMATE_DURATION;
      logInfo(`ImageViewerConstants.ANIMATE_DURATION: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}ImageViewerConstantsValues_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_IMAGE_VIEWER_CONSTANTS_VALUES_0002
     * @tc.name      ImageViewer_ImageViewerConstantsValues_0002
     * @tc.desc      ImageViewerConstants.SWIPER_CACHE_COUNT keeps value 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImageViewer_ImageViewerConstantsValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ImageViewerConstantsValues_0002 begin`);
      const actual: number = ImageViewerConstants.SWIPER_CACHE_COUNT;
      logInfo(`ImageViewerConstants.SWIPER_CACHE_COUNT: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ImageViewerConstantsValues_0002 end`);
    });
  });
}
