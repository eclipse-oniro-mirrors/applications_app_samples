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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BlurAnimateUtil } from '../../../main/ets/common/utils/BlurAnimateUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';



export default function BlurAnimateStateMatrixPart1Test(): void {
  describe('BlurAnimateStateMatrixPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_BASP1_0100
     * @tc.name      testSurfaceShotInitiallyEmpty0001
     * @tc.desc      Verify no surface screenshot exists before any capture.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSurfaceShotInitiallyEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSurfaceShotInitiallyEmpty0001 begin');
      expect(BlurAnimateUtil.getSurfaceShot() === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSurfaceShotInitiallyEmpty0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_BASP1_0200
     * @tc.name      testEmptySurfaceIdNoShot0002
     * @tc.desc      Verify an empty surface id does not create a screenshot.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testEmptySurfaceIdNoShot0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptySurfaceIdNoShot0002 begin');
      await BlurAnimateUtil.doSurfaceShot('');
      expect(BlurAnimateUtil.getSurfaceShot() === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptySurfaceIdNoShot0002 end');
    })

  })
}
