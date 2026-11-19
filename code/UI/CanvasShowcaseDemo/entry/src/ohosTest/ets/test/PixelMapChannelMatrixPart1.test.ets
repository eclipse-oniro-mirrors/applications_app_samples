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
import { delayTick } from './shared/AsyncYield';
import { PixelMapUtil } from '../../../main/ets/model/utils/PixelMapUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function PixelMapChannelMatrixPart1Test(): void {
  describe('PixelMapChannelMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_PMCP1_0100
     * @tc.name      testChannelPosition0001
     * @tc.desc      Verify channel 0 value 0 packs correctly.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testChannelPosition0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelPosition0001 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(0, 0, 0, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelPosition0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PMCP1_0200
     * @tc.name      testChannelPosition0002
     * @tc.desc      Verify channel 0 value 255 packs correctly.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testChannelPosition0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelPosition0002 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(255, 0, 0, 0)).assertEqual(4278190080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelPosition0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PMCP1_0300
     * @tc.name      testChannelPosition0003
     * @tc.desc      Verify channel 1 value 255 packs correctly.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testChannelPosition0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelPosition0003 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(0, 255, 0, 0)).assertEqual(16711680);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelPosition0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PMCP1_0400
     * @tc.name      testChannelPosition0004
     * @tc.desc      Verify channel 3 value 255 packs correctly.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testChannelPosition0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelPosition0004 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(0, 0, 0, 255)).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testChannelPosition0004 end');
    })

  })
}
