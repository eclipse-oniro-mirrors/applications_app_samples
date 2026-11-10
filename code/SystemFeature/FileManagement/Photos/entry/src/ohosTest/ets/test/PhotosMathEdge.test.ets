/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import HiLog from '@ohos.hilog';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { MathUtils } from '../../../main/ets/utils/MathUtils';

const TAG = '[Sample_PhotosMathEdgeTest]';
const DOMAIN = 0xF811;

export default function PhotosMathEdgeTest(): void {
  describe('PhotosMathEdgeTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0001
     * @tc.name      testPhotosMathEdge0001
     * @tc.desc      Clamps decimal range -100 to -99. case 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0001 begin');
      expect(MathUtils.clamp(-100.25, -100, -99)).assertEqual(-100);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0002
     * @tc.name      testPhotosMathEdge0002
     * @tc.desc      Clamps decimal range -100 to -99. case 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0002 begin');
      expect(MathUtils.clamp(-100, -100, -99)).assertEqual(-100);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0003
     * @tc.name      testPhotosMathEdge0003
     * @tc.desc      Clamps decimal range -100 to -99. case 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0003 begin');
      expect(MathUtils.clamp(-99.5, -100, -99)).assertEqual(-99.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0004
     * @tc.name      testPhotosMathEdge0004
     * @tc.desc      Clamps decimal range -100 to -99. case 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0004 begin');
      expect(MathUtils.clamp(-99, -100, -99)).assertEqual(-99);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0005
     * @tc.name      testPhotosMathEdge0005
     * @tc.desc      Clamps decimal range -100 to -99. case 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0005 begin');
      expect(MathUtils.clamp(-98.75, -100, -99)).assertEqual(-99);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0005 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0006
     * @tc.name      testPhotosMathEdge0006
     * @tc.desc      Clamps decimal range -99.75 to -97.75. case 6
