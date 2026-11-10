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
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0006 begin');
      expect(MathUtils.clamp(-100, -99.75, -97.75)).assertEqual(-99.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0007
     * @tc.name      testPhotosMathEdge0007
     * @tc.desc      Clamps decimal range -99.75 to -97.75. case 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0007 begin');
      expect(MathUtils.clamp(-99.75, -99.75, -97.75)).assertEqual(-99.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0008
     * @tc.name      testPhotosMathEdge0008
     * @tc.desc      Clamps decimal range -99.75 to -97.75. case 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0008 begin');
      expect(MathUtils.clamp(-98.75, -99.75, -97.75)).assertEqual(-98.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0009
     * @tc.name      testPhotosMathEdge0009
     * @tc.desc      Clamps decimal range -99.75 to -97.75. case 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0009 begin');
      expect(MathUtils.clamp(-97.75, -99.75, -97.75)).assertEqual(-97.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0010
     * @tc.name      testPhotosMathEdge0010
     * @tc.desc      Clamps decimal range -99.75 to -97.75. case 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0010 begin');
      expect(MathUtils.clamp(-97.5, -99.75, -97.75)).assertEqual(-97.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0010 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0011
     * @tc.name      testPhotosMathEdge0011
     * @tc.desc      Clamps decimal range -99.5 to -96.5. case 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0011 begin');
      expect(MathUtils.clamp(-99.75, -99.5, -96.5)).assertEqual(-99.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0012
     * @tc.name      testPhotosMathEdge0012
     * @tc.desc      Clamps decimal range -99.5 to -96.5. case 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0012 begin');
      expect(MathUtils.clamp(-99.5, -99.5, -96.5)).assertEqual(-99.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0013
     * @tc.name      testPhotosMathEdge0013
     * @tc.desc      Clamps decimal range -99.5 to -96.5. case 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0013 begin');
      expect(MathUtils.clamp(-98, -99.5, -96.5)).assertEqual(-98);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0014
     * @tc.name      testPhotosMathEdge0014
     * @tc.desc      Clamps decimal range -99.5 to -96.5. case 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0014 begin');
      expect(MathUtils.clamp(-96.5, -99.5, -96.5)).assertEqual(-96.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0015
     * @tc.name      testPhotosMathEdge0015
     * @tc.desc      Clamps decimal range -99.5 to -96.5. case 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0015 begin');
      expect(MathUtils.clamp(-96.25, -99.5, -96.5)).assertEqual(-96.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0015 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0016
     * @tc.name      testPhotosMathEdge0016
     * @tc.desc      Clamps decimal range -99.25 to -95.25. case 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0016 begin');
      expect(MathUtils.clamp(-99.5, -99.25, -95.25)).assertEqual(-99.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0017
     * @tc.name      testPhotosMathEdge0017
     * @tc.desc      Clamps decimal range -99.25 to -95.25. case 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0017 begin');
      expect(MathUtils.clamp(-99.25, -99.25, -95.25)).assertEqual(-99.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0018
     * @tc.name      testPhotosMathEdge0018
     * @tc.desc      Clamps decimal range -99.25 to -95.25. case 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0018 begin');
      expect(MathUtils.clamp(-97.25, -99.25, -95.25)).assertEqual(-97.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0019
     * @tc.name      testPhotosMathEdge0019
     * @tc.desc      Clamps decimal range -99.25 to -95.25. case 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0019 begin');
      expect(MathUtils.clamp(-95.25, -99.25, -95.25)).assertEqual(-95.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0020
     * @tc.name      testPhotosMathEdge0020
     * @tc.desc      Clamps decimal range -99.25 to -95.25. case 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0020 begin');
      expect(MathUtils.clamp(-95, -99.25, -95.25)).assertEqual(-95.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0020 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0021
     * @tc.name      testPhotosMathEdge0021
     * @tc.desc      Clamps decimal range -99 to -94. case 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0021 begin');
      expect(MathUtils.clamp(-99.25, -99, -94)).assertEqual(-99);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0022
     * @tc.name      testPhotosMathEdge0022
     * @tc.desc      Clamps decimal range -99 to -94. case 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0022 begin');
      expect(MathUtils.clamp(-99, -99, -94)).assertEqual(-99);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0023
     * @tc.name      testPhotosMathEdge0023
     * @tc.desc      Clamps decimal range -99 to -94. case 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0023 begin');
      expect(MathUtils.clamp(-96.5, -99, -94)).assertEqual(-96.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0024
     * @tc.name      testPhotosMathEdge0024
     * @tc.desc      Clamps decimal range -99 to -94. case 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0024 begin');
      expect(MathUtils.clamp(-94, -99, -94)).assertEqual(-94);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0025
     * @tc.name      testPhotosMathEdge0025
     * @tc.desc      Clamps decimal range -99 to -94. case 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0025 begin');
      expect(MathUtils.clamp(-93.75, -99, -94)).assertEqual(-94);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0025 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0026
     * @tc.name      testPhotosMathEdge0026
     * @tc.desc      Clamps decimal range -98.75 to -92.75. case 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0026 begin');
      expect(MathUtils.clamp(-99, -98.75, -92.75)).assertEqual(-98.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0027
     * @tc.name      testPhotosMathEdge0027
     * @tc.desc      Clamps decimal range -98.75 to -92.75. case 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0027 begin');
      expect(MathUtils.clamp(-98.75, -98.75, -92.75)).assertEqual(-98.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0028
     * @tc.name      testPhotosMathEdge0028
     * @tc.desc      Clamps decimal range -98.75 to -92.75. case 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0028 begin');
      expect(MathUtils.clamp(-95.75, -98.75, -92.75)).assertEqual(-95.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0029
     * @tc.name      testPhotosMathEdge0029
     * @tc.desc      Clamps decimal range -98.75 to -92.75. case 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0029 begin');
      expect(MathUtils.clamp(-92.75, -98.75, -92.75)).assertEqual(-92.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0030
     * @tc.name      testPhotosMathEdge0030
     * @tc.desc      Clamps decimal range -98.75 to -92.75. case 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0030 begin');
      expect(MathUtils.clamp(-92.5, -98.75, -92.75)).assertEqual(-92.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0030 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0031
     * @tc.name      testPhotosMathEdge0031
     * @tc.desc      Clamps decimal range -98.5 to -91.5. case 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0031 begin');
      expect(MathUtils.clamp(-98.75, -98.5, -91.5)).assertEqual(-98.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0032
     * @tc.name      testPhotosMathEdge0032
     * @tc.desc      Clamps decimal range -98.5 to -91.5. case 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0032 begin');
      expect(MathUtils.clamp(-98.5, -98.5, -91.5)).assertEqual(-98.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0033
     * @tc.name      testPhotosMathEdge0033
     * @tc.desc      Clamps decimal range -98.5 to -91.5. case 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0033 begin');
      expect(MathUtils.clamp(-95, -98.5, -91.5)).assertEqual(-95);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0034
     * @tc.name      testPhotosMathEdge0034
     * @tc.desc      Clamps decimal range -98.5 to -91.5. case 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0034 begin');
      expect(MathUtils.clamp(-91.5, -98.5, -91.5)).assertEqual(-91.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0035
     * @tc.name      testPhotosMathEdge0035
     * @tc.desc      Clamps decimal range -98.5 to -91.5. case 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0035 begin');
      expect(MathUtils.clamp(-91.25, -98.5, -91.5)).assertEqual(-91.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0035 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0036
     * @tc.name      testPhotosMathEdge0036
     * @tc.desc      Clamps decimal range -98.25 to -90.25. case 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0036 begin');
      expect(MathUtils.clamp(-98.5, -98.25, -90.25)).assertEqual(-98.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0037
     * @tc.name      testPhotosMathEdge0037
     * @tc.desc      Clamps decimal range -98.25 to -90.25. case 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0037 begin');
      expect(MathUtils.clamp(-98.25, -98.25, -90.25)).assertEqual(-98.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0038
     * @tc.name      testPhotosMathEdge0038
     * @tc.desc      Clamps decimal range -98.25 to -90.25. case 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0038 begin');
      expect(MathUtils.clamp(-94.25, -98.25, -90.25)).assertEqual(-94.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0039
     * @tc.name      testPhotosMathEdge0039
     * @tc.desc      Clamps decimal range -98.25 to -90.25. case 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0039 begin');
      expect(MathUtils.clamp(-90.25, -98.25, -90.25)).assertEqual(-90.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0040
     * @tc.name      testPhotosMathEdge0040
     * @tc.desc      Clamps decimal range -98.25 to -90.25. case 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0040 begin');
      expect(MathUtils.clamp(-90, -98.25, -90.25)).assertEqual(-90.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0040 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0041
     * @tc.name      testPhotosMathEdge0041
     * @tc.desc      Clamps decimal range -98 to -89. case 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0041 begin');
      expect(MathUtils.clamp(-98.25, -98, -89)).assertEqual(-98);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0042
     * @tc.name      testPhotosMathEdge0042
     * @tc.desc      Clamps decimal range -98 to -89. case 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0042 begin');
      expect(MathUtils.clamp(-98, -98, -89)).assertEqual(-98);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0043
     * @tc.name      testPhotosMathEdge0043
     * @tc.desc      Clamps decimal range -98 to -89. case 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0043 begin');
      expect(MathUtils.clamp(-93.5, -98, -89)).assertEqual(-93.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0044
     * @tc.name      testPhotosMathEdge0044
     * @tc.desc      Clamps decimal range -98 to -89. case 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0044 begin');
      expect(MathUtils.clamp(-89, -98, -89)).assertEqual(-89);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0045
     * @tc.name      testPhotosMathEdge0045
     * @tc.desc      Clamps decimal range -98 to -89. case 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0045 begin');
      expect(MathUtils.clamp(-88.75, -98, -89)).assertEqual(-89);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0045 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0046
     * @tc.name      testPhotosMathEdge0046
     * @tc.desc      Clamps decimal range -97.75 to -87.75. case 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0046 begin');
      expect(MathUtils.clamp(-98, -97.75, -87.75)).assertEqual(-97.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0047
     * @tc.name      testPhotosMathEdge0047
     * @tc.desc      Clamps decimal range -97.75 to -87.75. case 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0047 begin');
      expect(MathUtils.clamp(-97.75, -97.75, -87.75)).assertEqual(-97.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0048
     * @tc.name      testPhotosMathEdge0048
     * @tc.desc      Clamps decimal range -97.75 to -87.75. case 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0048 begin');
      expect(MathUtils.clamp(-92.75, -97.75, -87.75)).assertEqual(-92.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0049
     * @tc.name      testPhotosMathEdge0049
     * @tc.desc      Clamps decimal range -97.75 to -87.75. case 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0049 begin');
      expect(MathUtils.clamp(-87.75, -97.75, -87.75)).assertEqual(-87.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0050
     * @tc.name      testPhotosMathEdge0050
     * @tc.desc      Clamps decimal range -97.75 to -87.75. case 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0050 begin');
      expect(MathUtils.clamp(-87.5, -97.75, -87.75)).assertEqual(-87.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0050 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0051
     * @tc.name      testPhotosMathEdge0051
     * @tc.desc      Clamps decimal range -97.5 to -86.5. case 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0051 begin');
      expect(MathUtils.clamp(-97.75, -97.5, -86.5)).assertEqual(-97.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0052
     * @tc.name      testPhotosMathEdge0052
     * @tc.desc      Clamps decimal range -97.5 to -86.5. case 52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0052 begin');
      expect(MathUtils.clamp(-97.5, -97.5, -86.5)).assertEqual(-97.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0053
     * @tc.name      testPhotosMathEdge0053
     * @tc.desc      Clamps decimal range -97.5 to -86.5. case 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0053 begin');
      expect(MathUtils.clamp(-92, -97.5, -86.5)).assertEqual(-92);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0054
     * @tc.name      testPhotosMathEdge0054
     * @tc.desc      Clamps decimal range -97.5 to -86.5. case 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0054 begin');
      expect(MathUtils.clamp(-86.5, -97.5, -86.5)).assertEqual(-86.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0055
     * @tc.name      testPhotosMathEdge0055
     * @tc.desc      Clamps decimal range -97.5 to -86.5. case 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0055 begin');
      expect(MathUtils.clamp(-86.25, -97.5, -86.5)).assertEqual(-86.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0055 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0056
     * @tc.name      testPhotosMathEdge0056
     * @tc.desc      Clamps decimal range -97.25 to -85.25. case 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0056 begin');
      expect(MathUtils.clamp(-97.5, -97.25, -85.25)).assertEqual(-97.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0057
     * @tc.name      testPhotosMathEdge0057
     * @tc.desc      Clamps decimal range -97.25 to -85.25. case 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0057 begin');
      expect(MathUtils.clamp(-97.25, -97.25, -85.25)).assertEqual(-97.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0058
     * @tc.name      testPhotosMathEdge0058
     * @tc.desc      Clamps decimal range -97.25 to -85.25. case 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0058 begin');
      expect(MathUtils.clamp(-91.25, -97.25, -85.25)).assertEqual(-91.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0059
     * @tc.name      testPhotosMathEdge0059
     * @tc.desc      Clamps decimal range -97.25 to -85.25. case 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0059 begin');
      expect(MathUtils.clamp(-85.25, -97.25, -85.25)).assertEqual(-85.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0060
     * @tc.name      testPhotosMathEdge0060
     * @tc.desc      Clamps decimal range -97.25 to -85.25. case 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0060 begin');
      expect(MathUtils.clamp(-85, -97.25, -85.25)).assertEqual(-85.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0060 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0061
     * @tc.name      testPhotosMathEdge0061
     * @tc.desc      Clamps decimal range -97 to -84. case 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0061 begin');
      expect(MathUtils.clamp(-97.25, -97, -84)).assertEqual(-97);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0062
     * @tc.name      testPhotosMathEdge0062
     * @tc.desc      Clamps decimal range -97 to -84. case 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0062 begin');
      expect(MathUtils.clamp(-97, -97, -84)).assertEqual(-97);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0063
     * @tc.name      testPhotosMathEdge0063
     * @tc.desc      Clamps decimal range -97 to -84. case 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0063 begin');
      expect(MathUtils.clamp(-90.5, -97, -84)).assertEqual(-90.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0064
     * @tc.name      testPhotosMathEdge0064
     * @tc.desc      Clamps decimal range -97 to -84. case 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0064 begin');
      expect(MathUtils.clamp(-84, -97, -84)).assertEqual(-84);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0065
     * @tc.name      testPhotosMathEdge0065
     * @tc.desc      Clamps decimal range -97 to -84. case 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0065 begin');
      expect(MathUtils.clamp(-83.75, -97, -84)).assertEqual(-84);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0065 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0066
     * @tc.name      testPhotosMathEdge0066
     * @tc.desc      Clamps decimal range -96.75 to -82.75. case 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0066 begin');
      expect(MathUtils.clamp(-97, -96.75, -82.75)).assertEqual(-96.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0067
     * @tc.name      testPhotosMathEdge0067
     * @tc.desc      Clamps decimal range -96.75 to -82.75. case 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0067 begin');
      expect(MathUtils.clamp(-96.75, -96.75, -82.75)).assertEqual(-96.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0068
     * @tc.name      testPhotosMathEdge0068
     * @tc.desc      Clamps decimal range -96.75 to -82.75. case 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0068 begin');
      expect(MathUtils.clamp(-89.75, -96.75, -82.75)).assertEqual(-89.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0069
     * @tc.name      testPhotosMathEdge0069
     * @tc.desc      Clamps decimal range -96.75 to -82.75. case 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0069 begin');
      expect(MathUtils.clamp(-82.75, -96.75, -82.75)).assertEqual(-82.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0070
     * @tc.name      testPhotosMathEdge0070
     * @tc.desc      Clamps decimal range -96.75 to -82.75. case 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0070 begin');
      expect(MathUtils.clamp(-82.5, -96.75, -82.75)).assertEqual(-82.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0070 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0071
     * @tc.name      testPhotosMathEdge0071
     * @tc.desc      Clamps decimal range -96.5 to -81.5. case 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0071 begin');
      expect(MathUtils.clamp(-96.75, -96.5, -81.5)).assertEqual(-96.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0072
     * @tc.name      testPhotosMathEdge0072
     * @tc.desc      Clamps decimal range -96.5 to -81.5. case 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0072 begin');
      expect(MathUtils.clamp(-96.5, -96.5, -81.5)).assertEqual(-96.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0073
     * @tc.name      testPhotosMathEdge0073
     * @tc.desc      Clamps decimal range -96.5 to -81.5. case 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0073 begin');
      expect(MathUtils.clamp(-89, -96.5, -81.5)).assertEqual(-89);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0074
     * @tc.name      testPhotosMathEdge0074
     * @tc.desc      Clamps decimal range -96.5 to -81.5. case 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0074 begin');
      expect(MathUtils.clamp(-81.5, -96.5, -81.5)).assertEqual(-81.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0075
     * @tc.name      testPhotosMathEdge0075
     * @tc.desc      Clamps decimal range -96.5 to -81.5. case 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0075 begin');
      expect(MathUtils.clamp(-81.25, -96.5, -81.5)).assertEqual(-81.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0075 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0076
     * @tc.name      testPhotosMathEdge0076
     * @tc.desc      Clamps decimal range -96.25 to -80.25. case 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0076 begin');
      expect(MathUtils.clamp(-96.5, -96.25, -80.25)).assertEqual(-96.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0077
     * @tc.name      testPhotosMathEdge0077
     * @tc.desc      Clamps decimal range -96.25 to -80.25. case 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0077 begin');
      expect(MathUtils.clamp(-96.25, -96.25, -80.25)).assertEqual(-96.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0078
     * @tc.name      testPhotosMathEdge0078
     * @tc.desc      Clamps decimal range -96.25 to -80.25. case 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0078 begin');
      expect(MathUtils.clamp(-88.25, -96.25, -80.25)).assertEqual(-88.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0079
     * @tc.name      testPhotosMathEdge0079
     * @tc.desc      Clamps decimal range -96.25 to -80.25. case 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0079 begin');
      expect(MathUtils.clamp(-80.25, -96.25, -80.25)).assertEqual(-80.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0080
     * @tc.name      testPhotosMathEdge0080
     * @tc.desc      Clamps decimal range -96.25 to -80.25. case 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0080 begin');
      expect(MathUtils.clamp(-80, -96.25, -80.25)).assertEqual(-80.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0080 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0081
     * @tc.name      testPhotosMathEdge0081
     * @tc.desc      Clamps decimal range -96 to -95. case 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0081 begin');
      expect(MathUtils.clamp(-96.25, -96, -95)).assertEqual(-96);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0082
     * @tc.name      testPhotosMathEdge0082
     * @tc.desc      Clamps decimal range -96 to -95. case 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0082 begin');
      expect(MathUtils.clamp(-96, -96, -95)).assertEqual(-96);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0083
     * @tc.name      testPhotosMathEdge0083
     * @tc.desc      Clamps decimal range -96 to -95. case 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0083 begin');
      expect(MathUtils.clamp(-95.5, -96, -95)).assertEqual(-95.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0084
     * @tc.name      testPhotosMathEdge0084
     * @tc.desc      Clamps decimal range -96 to -95. case 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0084 begin');
      expect(MathUtils.clamp(-95, -96, -95)).assertEqual(-95);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0084 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0085
     * @tc.name      testPhotosMathEdge0085
     * @tc.desc      Clamps decimal range -96 to -95. case 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0085 begin');
      expect(MathUtils.clamp(-94.75, -96, -95)).assertEqual(-95);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0085 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0086
     * @tc.name      testPhotosMathEdge0086
     * @tc.desc      Clamps decimal range -95.75 to -93.75. case 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0086 begin');
      expect(MathUtils.clamp(-96, -95.75, -93.75)).assertEqual(-95.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0087
     * @tc.name      testPhotosMathEdge0087
     * @tc.desc      Clamps decimal range -95.75 to -93.75. case 87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0087 begin');
      expect(MathUtils.clamp(-95.75, -95.75, -93.75)).assertEqual(-95.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0088
     * @tc.name      testPhotosMathEdge0088
     * @tc.desc      Clamps decimal range -95.75 to -93.75. case 88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0088 begin');
      expect(MathUtils.clamp(-94.75, -95.75, -93.75)).assertEqual(-94.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0089
     * @tc.name      testPhotosMathEdge0089
     * @tc.desc      Clamps decimal range -95.75 to -93.75. case 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0089 begin');
      expect(MathUtils.clamp(-93.75, -95.75, -93.75)).assertEqual(-93.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0090
     * @tc.name      testPhotosMathEdge0090
     * @tc.desc      Clamps decimal range -95.75 to -93.75. case 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0090 begin');
      expect(MathUtils.clamp(-93.5, -95.75, -93.75)).assertEqual(-93.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0090 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0091
     * @tc.name      testPhotosMathEdge0091
     * @tc.desc      Clamps decimal range -95.5 to -92.5. case 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0091 begin');
      expect(MathUtils.clamp(-95.75, -95.5, -92.5)).assertEqual(-95.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0092
     * @tc.name      testPhotosMathEdge0092
     * @tc.desc      Clamps decimal range -95.5 to -92.5. case 92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0092 begin');
      expect(MathUtils.clamp(-95.5, -95.5, -92.5)).assertEqual(-95.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0093
     * @tc.name      testPhotosMathEdge0093
     * @tc.desc      Clamps decimal range -95.5 to -92.5. case 93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0093 begin');
      expect(MathUtils.clamp(-94, -95.5, -92.5)).assertEqual(-94);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0093 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0094
     * @tc.name      testPhotosMathEdge0094
     * @tc.desc      Clamps decimal range -95.5 to -92.5. case 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0094 begin');
      expect(MathUtils.clamp(-92.5, -95.5, -92.5)).assertEqual(-92.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0095
     * @tc.name      testPhotosMathEdge0095
     * @tc.desc      Clamps decimal range -95.5 to -92.5. case 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0095 begin');
      expect(MathUtils.clamp(-92.25, -95.5, -92.5)).assertEqual(-92.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0095 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0096
     * @tc.name      testPhotosMathEdge0096
     * @tc.desc      Clamps decimal range -95.25 to -91.25. case 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0096 begin');
      expect(MathUtils.clamp(-95.5, -95.25, -91.25)).assertEqual(-95.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0096 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0097
     * @tc.name      testPhotosMathEdge0097
     * @tc.desc      Clamps decimal range -95.25 to -91.25. case 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0097 begin');
      expect(MathUtils.clamp(-95.25, -95.25, -91.25)).assertEqual(-95.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0098
     * @tc.name      testPhotosMathEdge0098
     * @tc.desc      Clamps decimal range -95.25 to -91.25. case 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0098 begin');
      expect(MathUtils.clamp(-93.25, -95.25, -91.25)).assertEqual(-93.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0099
     * @tc.name      testPhotosMathEdge0099
     * @tc.desc      Clamps decimal range -95.25 to -91.25. case 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0099 begin');
      expect(MathUtils.clamp(-91.25, -95.25, -91.25)).assertEqual(-91.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0099 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0100
     * @tc.name      testPhotosMathEdge0100
     * @tc.desc      Clamps decimal range -95.25 to -91.25. case 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0100 begin');
      expect(MathUtils.clamp(-91, -95.25, -91.25)).assertEqual(-91.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0100 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0101
     * @tc.name      testPhotosMathEdge0101
     * @tc.desc      Clamps decimal range -95 to -90. case 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0101 begin');
      expect(MathUtils.clamp(-95.25, -95, -90)).assertEqual(-95);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0101 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0102
     * @tc.name      testPhotosMathEdge0102
     * @tc.desc      Clamps decimal range -95 to -90. case 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0102 begin');
      expect(MathUtils.clamp(-95, -95, -90)).assertEqual(-95);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0102 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0103
     * @tc.name      testPhotosMathEdge0103
     * @tc.desc      Clamps decimal range -95 to -90. case 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0103 begin');
      expect(MathUtils.clamp(-92.5, -95, -90)).assertEqual(-92.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0103 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0104
     * @tc.name      testPhotosMathEdge0104
     * @tc.desc      Clamps decimal range -95 to -90. case 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0104 begin');
      expect(MathUtils.clamp(-90, -95, -90)).assertEqual(-90);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0104 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0105
     * @tc.name      testPhotosMathEdge0105
     * @tc.desc      Clamps decimal range -95 to -90. case 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0105 begin');
      expect(MathUtils.clamp(-89.75, -95, -90)).assertEqual(-90);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0105 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0106
     * @tc.name      testPhotosMathEdge0106
     * @tc.desc      Clamps decimal range -94.75 to -88.75. case 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0106 begin');
      expect(MathUtils.clamp(-95, -94.75, -88.75)).assertEqual(-94.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0106 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0107
     * @tc.name      testPhotosMathEdge0107
     * @tc.desc      Clamps decimal range -94.75 to -88.75. case 107
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0107 begin');
      expect(MathUtils.clamp(-94.75, -94.75, -88.75)).assertEqual(-94.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0107 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0108
     * @tc.name      testPhotosMathEdge0108
     * @tc.desc      Clamps decimal range -94.75 to -88.75. case 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0108 begin');
      expect(MathUtils.clamp(-91.75, -94.75, -88.75)).assertEqual(-91.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0108 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0109
     * @tc.name      testPhotosMathEdge0109
     * @tc.desc      Clamps decimal range -94.75 to -88.75. case 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0109 begin');
      expect(MathUtils.clamp(-88.75, -94.75, -88.75)).assertEqual(-88.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0109 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0110
     * @tc.name      testPhotosMathEdge0110
     * @tc.desc      Clamps decimal range -94.75 to -88.75. case 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0110 begin');
      expect(MathUtils.clamp(-88.5, -94.75, -88.75)).assertEqual(-88.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0110 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0111
     * @tc.name      testPhotosMathEdge0111
     * @tc.desc      Clamps decimal range -94.5 to -87.5. case 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0111 begin');
      expect(MathUtils.clamp(-94.75, -94.5, -87.5)).assertEqual(-94.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0111 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0112
     * @tc.name      testPhotosMathEdge0112
     * @tc.desc      Clamps decimal range -94.5 to -87.5. case 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0112 begin');
      expect(MathUtils.clamp(-94.5, -94.5, -87.5)).assertEqual(-94.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0112 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0113
     * @tc.name      testPhotosMathEdge0113
     * @tc.desc      Clamps decimal range -94.5 to -87.5. case 113
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0113 begin');
      expect(MathUtils.clamp(-91, -94.5, -87.5)).assertEqual(-91);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0113 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0114
     * @tc.name      testPhotosMathEdge0114
     * @tc.desc      Clamps decimal range -94.5 to -87.5. case 114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0114 begin');
      expect(MathUtils.clamp(-87.5, -94.5, -87.5)).assertEqual(-87.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0114 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0115
     * @tc.name      testPhotosMathEdge0115
     * @tc.desc      Clamps decimal range -94.5 to -87.5. case 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0115 begin');
      expect(MathUtils.clamp(-87.25, -94.5, -87.5)).assertEqual(-87.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0115 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0116
     * @tc.name      testPhotosMathEdge0116
     * @tc.desc      Clamps decimal range -94.25 to -86.25. case 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0116 begin');
      expect(MathUtils.clamp(-94.5, -94.25, -86.25)).assertEqual(-94.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0116 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0117
     * @tc.name      testPhotosMathEdge0117
     * @tc.desc      Clamps decimal range -94.25 to -86.25. case 117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0117 begin');
      expect(MathUtils.clamp(-94.25, -94.25, -86.25)).assertEqual(-94.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0117 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0118
     * @tc.name      testPhotosMathEdge0118
     * @tc.desc      Clamps decimal range -94.25 to -86.25. case 118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0118 begin');
      expect(MathUtils.clamp(-90.25, -94.25, -86.25)).assertEqual(-90.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0118 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0119
     * @tc.name      testPhotosMathEdge0119
     * @tc.desc      Clamps decimal range -94.25 to -86.25. case 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0119 begin');
      expect(MathUtils.clamp(-86.25, -94.25, -86.25)).assertEqual(-86.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0119 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0120
     * @tc.name      testPhotosMathEdge0120
     * @tc.desc      Clamps decimal range -94.25 to -86.25. case 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0120 begin');
      expect(MathUtils.clamp(-86, -94.25, -86.25)).assertEqual(-86.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0120 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0121
     * @tc.name      testPhotosMathEdge0121
     * @tc.desc      Clamps decimal range -94 to -85. case 121
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0121 begin');
      expect(MathUtils.clamp(-94.25, -94, -85)).assertEqual(-94);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0121 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0122
     * @tc.name      testPhotosMathEdge0122
     * @tc.desc      Clamps decimal range -94 to -85. case 122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0122 begin');
      expect(MathUtils.clamp(-94, -94, -85)).assertEqual(-94);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0122 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0123
     * @tc.name      testPhotosMathEdge0123
     * @tc.desc      Clamps decimal range -94 to -85. case 123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0123 begin');
      expect(MathUtils.clamp(-89.5, -94, -85)).assertEqual(-89.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0123 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0124
     * @tc.name      testPhotosMathEdge0124
     * @tc.desc      Clamps decimal range -94 to -85. case 124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0124 begin');
      expect(MathUtils.clamp(-85, -94, -85)).assertEqual(-85);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0124 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0125
     * @tc.name      testPhotosMathEdge0125
     * @tc.desc      Clamps decimal range -94 to -85. case 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0125 begin');
      expect(MathUtils.clamp(-84.75, -94, -85)).assertEqual(-85);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0125 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0126
     * @tc.name      testPhotosMathEdge0126
     * @tc.desc      Clamps decimal range -93.75 to -83.75. case 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0126 begin');
      expect(MathUtils.clamp(-94, -93.75, -83.75)).assertEqual(-93.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0126 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0127
     * @tc.name      testPhotosMathEdge0127
     * @tc.desc      Clamps decimal range -93.75 to -83.75. case 127
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0127 begin');
      expect(MathUtils.clamp(-93.75, -93.75, -83.75)).assertEqual(-93.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0127 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0128
     * @tc.name      testPhotosMathEdge0128
     * @tc.desc      Clamps decimal range -93.75 to -83.75. case 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0128 begin');
      expect(MathUtils.clamp(-88.75, -93.75, -83.75)).assertEqual(-88.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0128 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0129
     * @tc.name      testPhotosMathEdge0129
     * @tc.desc      Clamps decimal range -93.75 to -83.75. case 129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0129 begin');
      expect(MathUtils.clamp(-83.75, -93.75, -83.75)).assertEqual(-83.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0129 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0130
     * @tc.name      testPhotosMathEdge0130
     * @tc.desc      Clamps decimal range -93.75 to -83.75. case 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0130 begin');
      expect(MathUtils.clamp(-83.5, -93.75, -83.75)).assertEqual(-83.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0130 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0131
     * @tc.name      testPhotosMathEdge0131
     * @tc.desc      Clamps decimal range -93.5 to -82.5. case 131
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0131 begin');
      expect(MathUtils.clamp(-93.75, -93.5, -82.5)).assertEqual(-93.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0131 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0132
     * @tc.name      testPhotosMathEdge0132
     * @tc.desc      Clamps decimal range -93.5 to -82.5. case 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0132 begin');
      expect(MathUtils.clamp(-93.5, -93.5, -82.5)).assertEqual(-93.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0132 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0133
     * @tc.name      testPhotosMathEdge0133
     * @tc.desc      Clamps decimal range -93.5 to -82.5. case 133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0133 begin');
      expect(MathUtils.clamp(-88, -93.5, -82.5)).assertEqual(-88);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0133 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0134
     * @tc.name      testPhotosMathEdge0134
     * @tc.desc      Clamps decimal range -93.5 to -82.5. case 134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0134 begin');
      expect(MathUtils.clamp(-82.5, -93.5, -82.5)).assertEqual(-82.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0134 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0135
     * @tc.name      testPhotosMathEdge0135
     * @tc.desc      Clamps decimal range -93.5 to -82.5. case 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0135 begin');
      expect(MathUtils.clamp(-82.25, -93.5, -82.5)).assertEqual(-82.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0135 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0136
     * @tc.name      testPhotosMathEdge0136
     * @tc.desc      Clamps decimal range -93.25 to -81.25. case 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0136 begin');
      expect(MathUtils.clamp(-93.5, -93.25, -81.25)).assertEqual(-93.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0136 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0137
     * @tc.name      testPhotosMathEdge0137
     * @tc.desc      Clamps decimal range -93.25 to -81.25. case 137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0137 begin');
      expect(MathUtils.clamp(-93.25, -93.25, -81.25)).assertEqual(-93.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0137 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0138
     * @tc.name      testPhotosMathEdge0138
     * @tc.desc      Clamps decimal range -93.25 to -81.25. case 138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0138 begin');
      expect(MathUtils.clamp(-87.25, -93.25, -81.25)).assertEqual(-87.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0138 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0139
     * @tc.name      testPhotosMathEdge0139
     * @tc.desc      Clamps decimal range -93.25 to -81.25. case 139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0139 begin');
      expect(MathUtils.clamp(-81.25, -93.25, -81.25)).assertEqual(-81.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0139 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0140
     * @tc.name      testPhotosMathEdge0140
     * @tc.desc      Clamps decimal range -93.25 to -81.25. case 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0140 begin');
      expect(MathUtils.clamp(-81, -93.25, -81.25)).assertEqual(-81.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0140 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0141
     * @tc.name      testPhotosMathEdge0141
     * @tc.desc      Clamps decimal range -93 to -80. case 141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0141 begin');
      expect(MathUtils.clamp(-93.25, -93, -80)).assertEqual(-93);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0141 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0142
     * @tc.name      testPhotosMathEdge0142
     * @tc.desc      Clamps decimal range -93 to -80. case 142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0142 begin');
      expect(MathUtils.clamp(-93, -93, -80)).assertEqual(-93);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0142 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0143
     * @tc.name      testPhotosMathEdge0143
     * @tc.desc      Clamps decimal range -93 to -80. case 143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0143 begin');
      expect(MathUtils.clamp(-86.5, -93, -80)).assertEqual(-86.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0143 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0144
     * @tc.name      testPhotosMathEdge0144
     * @tc.desc      Clamps decimal range -93 to -80. case 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0144 begin');
      expect(MathUtils.clamp(-80, -93, -80)).assertEqual(-80);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0144 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0145
     * @tc.name      testPhotosMathEdge0145
     * @tc.desc      Clamps decimal range -93 to -80. case 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0145 begin');
      expect(MathUtils.clamp(-79.75, -93, -80)).assertEqual(-80);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0145 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0146
     * @tc.name      testPhotosMathEdge0146
     * @tc.desc      Clamps decimal range -92.75 to -78.75. case 146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0146 begin');
      expect(MathUtils.clamp(-93, -92.75, -78.75)).assertEqual(-92.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0146 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0147
     * @tc.name      testPhotosMathEdge0147
     * @tc.desc      Clamps decimal range -92.75 to -78.75. case 147
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0147 begin');
      expect(MathUtils.clamp(-92.75, -92.75, -78.75)).assertEqual(-92.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0147 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0148
     * @tc.name      testPhotosMathEdge0148
     * @tc.desc      Clamps decimal range -92.75 to -78.75. case 148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0148 begin');
      expect(MathUtils.clamp(-85.75, -92.75, -78.75)).assertEqual(-85.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0148 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0149
     * @tc.name      testPhotosMathEdge0149
     * @tc.desc      Clamps decimal range -92.75 to -78.75. case 149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0149 begin');
      expect(MathUtils.clamp(-78.75, -92.75, -78.75)).assertEqual(-78.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0149 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0150
     * @tc.name      testPhotosMathEdge0150
     * @tc.desc      Clamps decimal range -92.75 to -78.75. case 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0150 begin');
      expect(MathUtils.clamp(-78.5, -92.75, -78.75)).assertEqual(-78.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0150 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0151
     * @tc.name      testPhotosMathEdge0151
     * @tc.desc      Clamps decimal range -92.5 to -77.5. case 151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0151 begin');
      expect(MathUtils.clamp(-92.75, -92.5, -77.5)).assertEqual(-92.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0151 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0152
     * @tc.name      testPhotosMathEdge0152
     * @tc.desc      Clamps decimal range -92.5 to -77.5. case 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0152 begin');
      expect(MathUtils.clamp(-92.5, -92.5, -77.5)).assertEqual(-92.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0152 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0153
     * @tc.name      testPhotosMathEdge0153
     * @tc.desc      Clamps decimal range -92.5 to -77.5. case 153
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0153 begin');
      expect(MathUtils.clamp(-85, -92.5, -77.5)).assertEqual(-85);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0153 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0154
     * @tc.name      testPhotosMathEdge0154
     * @tc.desc      Clamps decimal range -92.5 to -77.5. case 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0154 begin');
      expect(MathUtils.clamp(-77.5, -92.5, -77.5)).assertEqual(-77.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0154 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0155
     * @tc.name      testPhotosMathEdge0155
     * @tc.desc      Clamps decimal range -92.5 to -77.5. case 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0155 begin');
      expect(MathUtils.clamp(-77.25, -92.5, -77.5)).assertEqual(-77.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0155 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0156
     * @tc.name      testPhotosMathEdge0156
     * @tc.desc      Clamps decimal range -92.25 to -76.25. case 156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0156 begin');
      expect(MathUtils.clamp(-92.5, -92.25, -76.25)).assertEqual(-92.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0156 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0157
     * @tc.name      testPhotosMathEdge0157
     * @tc.desc      Clamps decimal range -92.25 to -76.25. case 157
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0157 begin');
      expect(MathUtils.clamp(-92.25, -92.25, -76.25)).assertEqual(-92.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0157 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0158
     * @tc.name      testPhotosMathEdge0158
     * @tc.desc      Clamps decimal range -92.25 to -76.25. case 158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0158 begin');
      expect(MathUtils.clamp(-84.25, -92.25, -76.25)).assertEqual(-84.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0158 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0159
     * @tc.name      testPhotosMathEdge0159
     * @tc.desc      Clamps decimal range -92.25 to -76.25. case 159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0159 begin');
      expect(MathUtils.clamp(-76.25, -92.25, -76.25)).assertEqual(-76.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0159 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0160
     * @tc.name      testPhotosMathEdge0160
     * @tc.desc      Clamps decimal range -92.25 to -76.25. case 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0160 begin');
      expect(MathUtils.clamp(-76, -92.25, -76.25)).assertEqual(-76.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0160 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0161
     * @tc.name      testPhotosMathEdge0161
     * @tc.desc      Clamps decimal range -92 to -91. case 161
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0161 begin');
      expect(MathUtils.clamp(-92.25, -92, -91)).assertEqual(-92);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0161 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0162
     * @tc.name      testPhotosMathEdge0162
     * @tc.desc      Clamps decimal range -92 to -91. case 162
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0162 begin');
      expect(MathUtils.clamp(-92, -92, -91)).assertEqual(-92);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0162 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0163
     * @tc.name      testPhotosMathEdge0163
     * @tc.desc      Clamps decimal range -92 to -91. case 163
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0163 begin');
      expect(MathUtils.clamp(-91.5, -92, -91)).assertEqual(-91.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0163 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0164
     * @tc.name      testPhotosMathEdge0164
     * @tc.desc      Clamps decimal range -92 to -91. case 164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0164 begin');
      expect(MathUtils.clamp(-91, -92, -91)).assertEqual(-91);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0164 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0165
     * @tc.name      testPhotosMathEdge0165
     * @tc.desc      Clamps decimal range -92 to -91. case 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0165 begin');
      expect(MathUtils.clamp(-90.75, -92, -91)).assertEqual(-91);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0165 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0166
     * @tc.name      testPhotosMathEdge0166
     * @tc.desc      Clamps decimal range -91.75 to -89.75. case 166
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0166 begin');
      expect(MathUtils.clamp(-92, -91.75, -89.75)).assertEqual(-91.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0166 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0167
     * @tc.name      testPhotosMathEdge0167
     * @tc.desc      Clamps decimal range -91.75 to -89.75. case 167
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0167 begin');
      expect(MathUtils.clamp(-91.75, -91.75, -89.75)).assertEqual(-91.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0167 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0168
     * @tc.name      testPhotosMathEdge0168
     * @tc.desc      Clamps decimal range -91.75 to -89.75. case 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0168 begin');
      expect(MathUtils.clamp(-90.75, -91.75, -89.75)).assertEqual(-90.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0168 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0169
     * @tc.name      testPhotosMathEdge0169
     * @tc.desc      Clamps decimal range -91.75 to -89.75. case 169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0169 begin');
      expect(MathUtils.clamp(-89.75, -91.75, -89.75)).assertEqual(-89.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0169 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0170
     * @tc.name      testPhotosMathEdge0170
     * @tc.desc      Clamps decimal range -91.75 to -89.75. case 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0170 begin');
      expect(MathUtils.clamp(-89.5, -91.75, -89.75)).assertEqual(-89.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0170 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0171
     * @tc.name      testPhotosMathEdge0171
     * @tc.desc      Clamps decimal range -91.5 to -88.5. case 171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0171 begin');
      expect(MathUtils.clamp(-91.75, -91.5, -88.5)).assertEqual(-91.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0171 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0172
     * @tc.name      testPhotosMathEdge0172
     * @tc.desc      Clamps decimal range -91.5 to -88.5. case 172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0172 begin');
      expect(MathUtils.clamp(-91.5, -91.5, -88.5)).assertEqual(-91.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0172 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0173
     * @tc.name      testPhotosMathEdge0173
     * @tc.desc      Clamps decimal range -91.5 to -88.5. case 173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0173 begin');
      expect(MathUtils.clamp(-90, -91.5, -88.5)).assertEqual(-90);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0173 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0174
     * @tc.name      testPhotosMathEdge0174
     * @tc.desc      Clamps decimal range -91.5 to -88.5. case 174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0174 begin');
      expect(MathUtils.clamp(-88.5, -91.5, -88.5)).assertEqual(-88.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0174 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0175
     * @tc.name      testPhotosMathEdge0175
     * @tc.desc      Clamps decimal range -91.5 to -88.5. case 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0175 begin');
      expect(MathUtils.clamp(-88.25, -91.5, -88.5)).assertEqual(-88.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0175 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0176
     * @tc.name      testPhotosMathEdge0176
     * @tc.desc      Clamps decimal range -91.25 to -87.25. case 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0176 begin');
      expect(MathUtils.clamp(-91.5, -91.25, -87.25)).assertEqual(-91.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0176 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0177
     * @tc.name      testPhotosMathEdge0177
     * @tc.desc      Clamps decimal range -91.25 to -87.25. case 177
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0177 begin');
      expect(MathUtils.clamp(-91.25, -91.25, -87.25)).assertEqual(-91.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0177 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0178
     * @tc.name      testPhotosMathEdge0178
     * @tc.desc      Clamps decimal range -91.25 to -87.25. case 178
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0178 begin');
      expect(MathUtils.clamp(-89.25, -91.25, -87.25)).assertEqual(-89.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0178 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0179
     * @tc.name      testPhotosMathEdge0179
     * @tc.desc      Clamps decimal range -91.25 to -87.25. case 179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0179 begin');
      expect(MathUtils.clamp(-87.25, -91.25, -87.25)).assertEqual(-87.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0179 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0180
     * @tc.name      testPhotosMathEdge0180
     * @tc.desc      Clamps decimal range -91.25 to -87.25. case 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0180 begin');
      expect(MathUtils.clamp(-87, -91.25, -87.25)).assertEqual(-87.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0180 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0181
     * @tc.name      testPhotosMathEdge0181
     * @tc.desc      Clamps decimal range -91 to -86. case 181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0181 begin');
      expect(MathUtils.clamp(-91.25, -91, -86)).assertEqual(-91);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0181 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0182
     * @tc.name      testPhotosMathEdge0182
     * @tc.desc      Clamps decimal range -91 to -86. case 182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0182 begin');
      expect(MathUtils.clamp(-91, -91, -86)).assertEqual(-91);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0182 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0183
     * @tc.name      testPhotosMathEdge0183
     * @tc.desc      Clamps decimal range -91 to -86. case 183
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0183 begin');
      expect(MathUtils.clamp(-88.5, -91, -86)).assertEqual(-88.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0183 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0184
     * @tc.name      testPhotosMathEdge0184
     * @tc.desc      Clamps decimal range -91 to -86. case 184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0184 begin');
      expect(MathUtils.clamp(-86, -91, -86)).assertEqual(-86);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0184 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0185
     * @tc.name      testPhotosMathEdge0185
     * @tc.desc      Clamps decimal range -91 to -86. case 185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0185 begin');
      expect(MathUtils.clamp(-85.75, -91, -86)).assertEqual(-86);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0185 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0186
     * @tc.name      testPhotosMathEdge0186
     * @tc.desc      Clamps decimal range -90.75 to -84.75. case 186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0186 begin');
      expect(MathUtils.clamp(-91, -90.75, -84.75)).assertEqual(-90.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0186 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0187
     * @tc.name      testPhotosMathEdge0187
     * @tc.desc      Clamps decimal range -90.75 to -84.75. case 187
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0187 begin');
      expect(MathUtils.clamp(-90.75, -90.75, -84.75)).assertEqual(-90.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0187 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0188
     * @tc.name      testPhotosMathEdge0188
     * @tc.desc      Clamps decimal range -90.75 to -84.75. case 188
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0188 begin');
      expect(MathUtils.clamp(-87.75, -90.75, -84.75)).assertEqual(-87.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0188 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0189
     * @tc.name      testPhotosMathEdge0189
     * @tc.desc      Clamps decimal range -90.75 to -84.75. case 189
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0189 begin');
      expect(MathUtils.clamp(-84.75, -90.75, -84.75)).assertEqual(-84.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0189 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0190
     * @tc.name      testPhotosMathEdge0190
     * @tc.desc      Clamps decimal range -90.75 to -84.75. case 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0190 begin');
      expect(MathUtils.clamp(-84.5, -90.75, -84.75)).assertEqual(-84.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0190 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0191
     * @tc.name      testPhotosMathEdge0191
     * @tc.desc      Clamps decimal range -90.5 to -83.5. case 191
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0191 begin');
      expect(MathUtils.clamp(-90.75, -90.5, -83.5)).assertEqual(-90.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0191 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0192
     * @tc.name      testPhotosMathEdge0192
     * @tc.desc      Clamps decimal range -90.5 to -83.5. case 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0192 begin');
      expect(MathUtils.clamp(-90.5, -90.5, -83.5)).assertEqual(-90.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0192 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0193
     * @tc.name      testPhotosMathEdge0193
     * @tc.desc      Clamps decimal range -90.5 to -83.5. case 193
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0193 begin');
      expect(MathUtils.clamp(-87, -90.5, -83.5)).assertEqual(-87);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0193 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0194
     * @tc.name      testPhotosMathEdge0194
     * @tc.desc      Clamps decimal range -90.5 to -83.5. case 194
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0194 begin');
      expect(MathUtils.clamp(-83.5, -90.5, -83.5)).assertEqual(-83.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0194 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0195
     * @tc.name      testPhotosMathEdge0195
     * @tc.desc      Clamps decimal range -90.5 to -83.5. case 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0195 begin');
      expect(MathUtils.clamp(-83.25, -90.5, -83.5)).assertEqual(-83.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0195 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0196
     * @tc.name      testPhotosMathEdge0196
     * @tc.desc      Clamps decimal range -90.25 to -82.25. case 196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0196 begin');
      expect(MathUtils.clamp(-90.5, -90.25, -82.25)).assertEqual(-90.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0196 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0197
     * @tc.name      testPhotosMathEdge0197
     * @tc.desc      Clamps decimal range -90.25 to -82.25. case 197
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0197 begin');
      expect(MathUtils.clamp(-90.25, -90.25, -82.25)).assertEqual(-90.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0197 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0198
     * @tc.name      testPhotosMathEdge0198
     * @tc.desc      Clamps decimal range -90.25 to -82.25. case 198
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0198 begin');
      expect(MathUtils.clamp(-86.25, -90.25, -82.25)).assertEqual(-86.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0198 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0199
     * @tc.name      testPhotosMathEdge0199
     * @tc.desc      Clamps decimal range -90.25 to -82.25. case 199
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0199 begin');
      expect(MathUtils.clamp(-82.25, -90.25, -82.25)).assertEqual(-82.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0199 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0200
     * @tc.name      testPhotosMathEdge0200
     * @tc.desc      Clamps decimal range -90.25 to -82.25. case 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0200 begin');
      expect(MathUtils.clamp(-82, -90.25, -82.25)).assertEqual(-82.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0200 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0201
     * @tc.name      testPhotosMathEdge0201
     * @tc.desc      Clamps decimal range -90 to -81. case 201
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0201 begin');
      expect(MathUtils.clamp(-90.25, -90, -81)).assertEqual(-90);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0201 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0202
     * @tc.name      testPhotosMathEdge0202
     * @tc.desc      Clamps decimal range -90 to -81. case 202
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0202 begin');
      expect(MathUtils.clamp(-90, -90, -81)).assertEqual(-90);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0202 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0203
     * @tc.name      testPhotosMathEdge0203
     * @tc.desc      Clamps decimal range -90 to -81. case 203
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0203 begin');
      expect(MathUtils.clamp(-85.5, -90, -81)).assertEqual(-85.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0203 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0204
     * @tc.name      testPhotosMathEdge0204
     * @tc.desc      Clamps decimal range -90 to -81. case 204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0204 begin');
      expect(MathUtils.clamp(-81, -90, -81)).assertEqual(-81);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0204 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0205
     * @tc.name      testPhotosMathEdge0205
     * @tc.desc      Clamps decimal range -90 to -81. case 205
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0205 begin');
      expect(MathUtils.clamp(-80.75, -90, -81)).assertEqual(-81);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0205 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0206
     * @tc.name      testPhotosMathEdge0206
     * @tc.desc      Clamps decimal range -89.75 to -79.75. case 206
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0206 begin');
      expect(MathUtils.clamp(-90, -89.75, -79.75)).assertEqual(-89.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0206 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0207
     * @tc.name      testPhotosMathEdge0207
     * @tc.desc      Clamps decimal range -89.75 to -79.75. case 207
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0207 begin');
      expect(MathUtils.clamp(-89.75, -89.75, -79.75)).assertEqual(-89.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0207 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0208
     * @tc.name      testPhotosMathEdge0208
     * @tc.desc      Clamps decimal range -89.75 to -79.75. case 208
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0208 begin');
      expect(MathUtils.clamp(-84.75, -89.75, -79.75)).assertEqual(-84.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0208 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0209
     * @tc.name      testPhotosMathEdge0209
     * @tc.desc      Clamps decimal range -89.75 to -79.75. case 209
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0209 begin');
      expect(MathUtils.clamp(-79.75, -89.75, -79.75)).assertEqual(-79.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0209 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0210
     * @tc.name      testPhotosMathEdge0210
     * @tc.desc      Clamps decimal range -89.75 to -79.75. case 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0210 begin');
      expect(MathUtils.clamp(-79.5, -89.75, -79.75)).assertEqual(-79.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0210 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0211
     * @tc.name      testPhotosMathEdge0211
     * @tc.desc      Clamps decimal range -89.5 to -78.5. case 211
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0211 begin');
      expect(MathUtils.clamp(-89.75, -89.5, -78.5)).assertEqual(-89.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0211 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0212
     * @tc.name      testPhotosMathEdge0212
     * @tc.desc      Clamps decimal range -89.5 to -78.5. case 212
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0212 begin');
      expect(MathUtils.clamp(-89.5, -89.5, -78.5)).assertEqual(-89.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0212 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0213
     * @tc.name      testPhotosMathEdge0213
     * @tc.desc      Clamps decimal range -89.5 to -78.5. case 213
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0213 begin');
      expect(MathUtils.clamp(-84, -89.5, -78.5)).assertEqual(-84);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0213 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0214
     * @tc.name      testPhotosMathEdge0214
     * @tc.desc      Clamps decimal range -89.5 to -78.5. case 214
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0214 begin');
      expect(MathUtils.clamp(-78.5, -89.5, -78.5)).assertEqual(-78.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0214 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0215
     * @tc.name      testPhotosMathEdge0215
     * @tc.desc      Clamps decimal range -89.5 to -78.5. case 215
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0215 begin');
      expect(MathUtils.clamp(-78.25, -89.5, -78.5)).assertEqual(-78.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0215 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0216
     * @tc.name      testPhotosMathEdge0216
     * @tc.desc      Clamps decimal range -89.25 to -77.25. case 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0216 begin');
      expect(MathUtils.clamp(-89.5, -89.25, -77.25)).assertEqual(-89.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0216 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0217
     * @tc.name      testPhotosMathEdge0217
     * @tc.desc      Clamps decimal range -89.25 to -77.25. case 217
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0217 begin');
      expect(MathUtils.clamp(-89.25, -89.25, -77.25)).assertEqual(-89.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0217 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0218
     * @tc.name      testPhotosMathEdge0218
     * @tc.desc      Clamps decimal range -89.25 to -77.25. case 218
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0218 begin');
      expect(MathUtils.clamp(-83.25, -89.25, -77.25)).assertEqual(-83.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0218 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0219
     * @tc.name      testPhotosMathEdge0219
     * @tc.desc      Clamps decimal range -89.25 to -77.25. case 219
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0219 begin');
      expect(MathUtils.clamp(-77.25, -89.25, -77.25)).assertEqual(-77.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0219 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0220
     * @tc.name      testPhotosMathEdge0220
     * @tc.desc      Clamps decimal range -89.25 to -77.25. case 220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0220 begin');
      expect(MathUtils.clamp(-77, -89.25, -77.25)).assertEqual(-77.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0220 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0221
     * @tc.name      testPhotosMathEdge0221
     * @tc.desc      Clamps decimal range -89 to -76. case 221
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0221 begin');
      expect(MathUtils.clamp(-89.25, -89, -76)).assertEqual(-89);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0221 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0222
     * @tc.name      testPhotosMathEdge0222
     * @tc.desc      Clamps decimal range -89 to -76. case 222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0222 begin');
      expect(MathUtils.clamp(-89, -89, -76)).assertEqual(-89);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0222 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0223
     * @tc.name      testPhotosMathEdge0223
     * @tc.desc      Clamps decimal range -89 to -76. case 223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0223 begin');
      expect(MathUtils.clamp(-82.5, -89, -76)).assertEqual(-82.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0223 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0224
     * @tc.name      testPhotosMathEdge0224
     * @tc.desc      Clamps decimal range -89 to -76. case 224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0224 begin');
      expect(MathUtils.clamp(-76, -89, -76)).assertEqual(-76);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0224 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0225
     * @tc.name      testPhotosMathEdge0225
     * @tc.desc      Clamps decimal range -89 to -76. case 225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0225 begin');
      expect(MathUtils.clamp(-75.75, -89, -76)).assertEqual(-76);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0225 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0226
     * @tc.name      testPhotosMathEdge0226
     * @tc.desc      Clamps decimal range -88.75 to -74.75. case 226
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0226 begin');
      expect(MathUtils.clamp(-89, -88.75, -74.75)).assertEqual(-88.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0226 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0227
     * @tc.name      testPhotosMathEdge0227
     * @tc.desc      Clamps decimal range -88.75 to -74.75. case 227
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0227 begin');
      expect(MathUtils.clamp(-88.75, -88.75, -74.75)).assertEqual(-88.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0227 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0228
     * @tc.name      testPhotosMathEdge0228
     * @tc.desc      Clamps decimal range -88.75 to -74.75. case 228
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0228 begin');
      expect(MathUtils.clamp(-81.75, -88.75, -74.75)).assertEqual(-81.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0228 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0229
     * @tc.name      testPhotosMathEdge0229
     * @tc.desc      Clamps decimal range -88.75 to -74.75. case 229
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0229 begin');
      expect(MathUtils.clamp(-74.75, -88.75, -74.75)).assertEqual(-74.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0229 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0230
     * @tc.name      testPhotosMathEdge0230
     * @tc.desc      Clamps decimal range -88.75 to -74.75. case 230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0230 begin');
      expect(MathUtils.clamp(-74.5, -88.75, -74.75)).assertEqual(-74.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0230 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0231
     * @tc.name      testPhotosMathEdge0231
     * @tc.desc      Clamps decimal range -88.5 to -73.5. case 231
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0231 begin');
      expect(MathUtils.clamp(-88.75, -88.5, -73.5)).assertEqual(-88.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0231 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0232
     * @tc.name      testPhotosMathEdge0232
     * @tc.desc      Clamps decimal range -88.5 to -73.5. case 232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0232 begin');
      expect(MathUtils.clamp(-88.5, -88.5, -73.5)).assertEqual(-88.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0232 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0233
     * @tc.name      testPhotosMathEdge0233
     * @tc.desc      Clamps decimal range -88.5 to -73.5. case 233
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0233 begin');
      expect(MathUtils.clamp(-81, -88.5, -73.5)).assertEqual(-81);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0233 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0234
     * @tc.name      testPhotosMathEdge0234
     * @tc.desc      Clamps decimal range -88.5 to -73.5. case 234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0234 begin');
      expect(MathUtils.clamp(-73.5, -88.5, -73.5)).assertEqual(-73.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0234 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0235
     * @tc.name      testPhotosMathEdge0235
     * @tc.desc      Clamps decimal range -88.5 to -73.5. case 235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0235 begin');
      expect(MathUtils.clamp(-73.25, -88.5, -73.5)).assertEqual(-73.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0235 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0236
     * @tc.name      testPhotosMathEdge0236
     * @tc.desc      Clamps decimal range -88.25 to -72.25. case 236
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0236 begin');
      expect(MathUtils.clamp(-88.5, -88.25, -72.25)).assertEqual(-88.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0236 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0237
     * @tc.name      testPhotosMathEdge0237
     * @tc.desc      Clamps decimal range -88.25 to -72.25. case 237
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0237 begin');
      expect(MathUtils.clamp(-88.25, -88.25, -72.25)).assertEqual(-88.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0237 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0238
     * @tc.name      testPhotosMathEdge0238
     * @tc.desc      Clamps decimal range -88.25 to -72.25. case 238
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0238 begin');
      expect(MathUtils.clamp(-80.25, -88.25, -72.25)).assertEqual(-80.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0238 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0239
     * @tc.name      testPhotosMathEdge0239
     * @tc.desc      Clamps decimal range -88.25 to -72.25. case 239
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0239 begin');
      expect(MathUtils.clamp(-72.25, -88.25, -72.25)).assertEqual(-72.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0239 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0240
     * @tc.name      testPhotosMathEdge0240
     * @tc.desc      Clamps decimal range -88.25 to -72.25. case 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0240 begin');
      expect(MathUtils.clamp(-72, -88.25, -72.25)).assertEqual(-72.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0240 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0241
     * @tc.name      testPhotosMathEdge0241
     * @tc.desc      Clamps decimal range -88 to -87. case 241
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0241 begin');
      expect(MathUtils.clamp(-88.25, -88, -87)).assertEqual(-88);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0241 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0242
     * @tc.name      testPhotosMathEdge0242
     * @tc.desc      Clamps decimal range -88 to -87. case 242
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0242 begin');
      expect(MathUtils.clamp(-88, -88, -87)).assertEqual(-88);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0242 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0243
     * @tc.name      testPhotosMathEdge0243
     * @tc.desc      Clamps decimal range -88 to -87. case 243
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0243 begin');
      expect(MathUtils.clamp(-87.5, -88, -87)).assertEqual(-87.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0243 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0244
     * @tc.name      testPhotosMathEdge0244
     * @tc.desc      Clamps decimal range -88 to -87. case 244
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0244 begin');
      expect(MathUtils.clamp(-87, -88, -87)).assertEqual(-87);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0244 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0245
     * @tc.name      testPhotosMathEdge0245
     * @tc.desc      Clamps decimal range -88 to -87. case 245
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0245 begin');
      expect(MathUtils.clamp(-86.75, -88, -87)).assertEqual(-87);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0245 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0246
     * @tc.name      testPhotosMathEdge0246
     * @tc.desc      Clamps decimal range -87.75 to -85.75. case 246
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0246 begin');
      expect(MathUtils.clamp(-88, -87.75, -85.75)).assertEqual(-87.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0246 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0247
     * @tc.name      testPhotosMathEdge0247
     * @tc.desc      Clamps decimal range -87.75 to -85.75. case 247
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0247 begin');
      expect(MathUtils.clamp(-87.75, -87.75, -85.75)).assertEqual(-87.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0247 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0248
     * @tc.name      testPhotosMathEdge0248
     * @tc.desc      Clamps decimal range -87.75 to -85.75. case 248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0248 begin');
      expect(MathUtils.clamp(-86.75, -87.75, -85.75)).assertEqual(-86.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0248 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0249
     * @tc.name      testPhotosMathEdge0249
     * @tc.desc      Clamps decimal range -87.75 to -85.75. case 249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0249 begin');
      expect(MathUtils.clamp(-85.75, -87.75, -85.75)).assertEqual(-85.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0249 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0250
     * @tc.name      testPhotosMathEdge0250
     * @tc.desc      Clamps decimal range -87.75 to -85.75. case 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0250 begin');
      expect(MathUtils.clamp(-85.5, -87.75, -85.75)).assertEqual(-85.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0250 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0251
     * @tc.name      testPhotosMathEdge0251
     * @tc.desc      Clamps decimal range -87.5 to -84.5. case 251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0251 begin');
      expect(MathUtils.clamp(-87.75, -87.5, -84.5)).assertEqual(-87.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0251 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0252
     * @tc.name      testPhotosMathEdge0252
     * @tc.desc      Clamps decimal range -87.5 to -84.5. case 252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0252 begin');
      expect(MathUtils.clamp(-87.5, -87.5, -84.5)).assertEqual(-87.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0252 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0253
     * @tc.name      testPhotosMathEdge0253
     * @tc.desc      Clamps decimal range -87.5 to -84.5. case 253
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0253 begin');
      expect(MathUtils.clamp(-86, -87.5, -84.5)).assertEqual(-86);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0253 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0254
     * @tc.name      testPhotosMathEdge0254
     * @tc.desc      Clamps decimal range -87.5 to -84.5. case 254
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0254 begin');
      expect(MathUtils.clamp(-84.5, -87.5, -84.5)).assertEqual(-84.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0254 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0255
     * @tc.name      testPhotosMathEdge0255
     * @tc.desc      Clamps decimal range -87.5 to -84.5. case 255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0255 begin');
      expect(MathUtils.clamp(-84.25, -87.5, -84.5)).assertEqual(-84.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0255 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0256
     * @tc.name      testPhotosMathEdge0256
     * @tc.desc      Clamps decimal range -87.25 to -83.25. case 256
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0256 begin');
      expect(MathUtils.clamp(-87.5, -87.25, -83.25)).assertEqual(-87.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0256 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0257
     * @tc.name      testPhotosMathEdge0257
     * @tc.desc      Clamps decimal range -87.25 to -83.25. case 257
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0257 begin');
      expect(MathUtils.clamp(-87.25, -87.25, -83.25)).assertEqual(-87.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0257 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0258
     * @tc.name      testPhotosMathEdge0258
     * @tc.desc      Clamps decimal range -87.25 to -83.25. case 258
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0258 begin');
      expect(MathUtils.clamp(-85.25, -87.25, -83.25)).assertEqual(-85.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0258 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0259
     * @tc.name      testPhotosMathEdge0259
     * @tc.desc      Clamps decimal range -87.25 to -83.25. case 259
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0259 begin');
      expect(MathUtils.clamp(-83.25, -87.25, -83.25)).assertEqual(-83.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0259 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0260
     * @tc.name      testPhotosMathEdge0260
     * @tc.desc      Clamps decimal range -87.25 to -83.25. case 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0260 begin');
      expect(MathUtils.clamp(-83, -87.25, -83.25)).assertEqual(-83.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0260 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0261
     * @tc.name      testPhotosMathEdge0261
     * @tc.desc      Clamps decimal range -87 to -82. case 261
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0261 begin');
      expect(MathUtils.clamp(-87.25, -87, -82)).assertEqual(-87);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0261 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0262
     * @tc.name      testPhotosMathEdge0262
     * @tc.desc      Clamps decimal range -87 to -82. case 262
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0262 begin');
      expect(MathUtils.clamp(-87, -87, -82)).assertEqual(-87);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0262 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0263
     * @tc.name      testPhotosMathEdge0263
     * @tc.desc      Clamps decimal range -87 to -82. case 263
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0263 begin');
      expect(MathUtils.clamp(-84.5, -87, -82)).assertEqual(-84.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0263 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0264
     * @tc.name      testPhotosMathEdge0264
     * @tc.desc      Clamps decimal range -87 to -82. case 264
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0264 begin');
      expect(MathUtils.clamp(-82, -87, -82)).assertEqual(-82);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0264 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0265
     * @tc.name      testPhotosMathEdge0265
     * @tc.desc      Clamps decimal range -87 to -82. case 265
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0265 begin');
      expect(MathUtils.clamp(-81.75, -87, -82)).assertEqual(-82);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0265 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0266
     * @tc.name      testPhotosMathEdge0266
     * @tc.desc      Clamps decimal range -86.75 to -80.75. case 266
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0266 begin');
      expect(MathUtils.clamp(-87, -86.75, -80.75)).assertEqual(-86.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0266 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0267
     * @tc.name      testPhotosMathEdge0267
     * @tc.desc      Clamps decimal range -86.75 to -80.75. case 267
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0267 begin');
      expect(MathUtils.clamp(-86.75, -86.75, -80.75)).assertEqual(-86.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0267 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0268
     * @tc.name      testPhotosMathEdge0268
     * @tc.desc      Clamps decimal range -86.75 to -80.75. case 268
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0268 begin');
      expect(MathUtils.clamp(-83.75, -86.75, -80.75)).assertEqual(-83.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0268 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0269
     * @tc.name      testPhotosMathEdge0269
     * @tc.desc      Clamps decimal range -86.75 to -80.75. case 269
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0269 begin');
      expect(MathUtils.clamp(-80.75, -86.75, -80.75)).assertEqual(-80.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0269 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0270
     * @tc.name      testPhotosMathEdge0270
     * @tc.desc      Clamps decimal range -86.75 to -80.75. case 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0270 begin');
      expect(MathUtils.clamp(-80.5, -86.75, -80.75)).assertEqual(-80.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0270 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0271
     * @tc.name      testPhotosMathEdge0271
     * @tc.desc      Clamps decimal range -86.5 to -79.5. case 271
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0271 begin');
      expect(MathUtils.clamp(-86.75, -86.5, -79.5)).assertEqual(-86.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0271 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0272
     * @tc.name      testPhotosMathEdge0272
     * @tc.desc      Clamps decimal range -86.5 to -79.5. case 272
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0272 begin');
      expect(MathUtils.clamp(-86.5, -86.5, -79.5)).assertEqual(-86.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0272 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0273
     * @tc.name      testPhotosMathEdge0273
     * @tc.desc      Clamps decimal range -86.5 to -79.5. case 273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0273 begin');
      expect(MathUtils.clamp(-83, -86.5, -79.5)).assertEqual(-83);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0273 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0274
     * @tc.name      testPhotosMathEdge0274
     * @tc.desc      Clamps decimal range -86.5 to -79.5. case 274
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0274 begin');
      expect(MathUtils.clamp(-79.5, -86.5, -79.5)).assertEqual(-79.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0274 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0275
     * @tc.name      testPhotosMathEdge0275
     * @tc.desc      Clamps decimal range -86.5 to -79.5. case 275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0275 begin');
      expect(MathUtils.clamp(-79.25, -86.5, -79.5)).assertEqual(-79.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0275 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0276
     * @tc.name      testPhotosMathEdge0276
     * @tc.desc      Clamps decimal range -86.25 to -78.25. case 276
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0276 begin');
      expect(MathUtils.clamp(-86.5, -86.25, -78.25)).assertEqual(-86.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0276 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0277
     * @tc.name      testPhotosMathEdge0277
     * @tc.desc      Clamps decimal range -86.25 to -78.25. case 277
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0277 begin');
      expect(MathUtils.clamp(-86.25, -86.25, -78.25)).assertEqual(-86.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0277 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0278
     * @tc.name      testPhotosMathEdge0278
     * @tc.desc      Clamps decimal range -86.25 to -78.25. case 278
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0278 begin');
      expect(MathUtils.clamp(-82.25, -86.25, -78.25)).assertEqual(-82.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0278 end');
    })

