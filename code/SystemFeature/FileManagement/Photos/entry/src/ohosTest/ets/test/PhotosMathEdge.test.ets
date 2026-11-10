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

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0279
     * @tc.name      testPhotosMathEdge0279
     * @tc.desc      Clamps decimal range -86.25 to -78.25. case 279
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0279 begin');
      expect(MathUtils.clamp(-78.25, -86.25, -78.25)).assertEqual(-78.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0279 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0280
     * @tc.name      testPhotosMathEdge0280
     * @tc.desc      Clamps decimal range -86.25 to -78.25. case 280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0280 begin');
      expect(MathUtils.clamp(-78, -86.25, -78.25)).assertEqual(-78.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0280 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0281
     * @tc.name      testPhotosMathEdge0281
     * @tc.desc      Clamps decimal range -86 to -77. case 281
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0281 begin');
      expect(MathUtils.clamp(-86.25, -86, -77)).assertEqual(-86);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0281 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0282
     * @tc.name      testPhotosMathEdge0282
     * @tc.desc      Clamps decimal range -86 to -77. case 282
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0282 begin');
      expect(MathUtils.clamp(-86, -86, -77)).assertEqual(-86);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0282 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0283
     * @tc.name      testPhotosMathEdge0283
     * @tc.desc      Clamps decimal range -86 to -77. case 283
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0283 begin');
      expect(MathUtils.clamp(-81.5, -86, -77)).assertEqual(-81.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0283 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0284
     * @tc.name      testPhotosMathEdge0284
     * @tc.desc      Clamps decimal range -86 to -77. case 284
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0284 begin');
      expect(MathUtils.clamp(-77, -86, -77)).assertEqual(-77);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0284 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0285
     * @tc.name      testPhotosMathEdge0285
     * @tc.desc      Clamps decimal range -86 to -77. case 285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0285 begin');
      expect(MathUtils.clamp(-76.75, -86, -77)).assertEqual(-77);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0285 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0286
     * @tc.name      testPhotosMathEdge0286
     * @tc.desc      Clamps decimal range -85.75 to -75.75. case 286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0286 begin');
      expect(MathUtils.clamp(-86, -85.75, -75.75)).assertEqual(-85.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0286 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0287
     * @tc.name      testPhotosMathEdge0287
     * @tc.desc      Clamps decimal range -85.75 to -75.75. case 287
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0287 begin');
      expect(MathUtils.clamp(-85.75, -85.75, -75.75)).assertEqual(-85.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0287 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0288
     * @tc.name      testPhotosMathEdge0288
     * @tc.desc      Clamps decimal range -85.75 to -75.75. case 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0288 begin');
      expect(MathUtils.clamp(-80.75, -85.75, -75.75)).assertEqual(-80.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0288 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0289
     * @tc.name      testPhotosMathEdge0289
     * @tc.desc      Clamps decimal range -85.75 to -75.75. case 289
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0289 begin');
      expect(MathUtils.clamp(-75.75, -85.75, -75.75)).assertEqual(-75.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0289 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0290
     * @tc.name      testPhotosMathEdge0290
     * @tc.desc      Clamps decimal range -85.75 to -75.75. case 290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0290 begin');
      expect(MathUtils.clamp(-75.5, -85.75, -75.75)).assertEqual(-75.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0290 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0291
     * @tc.name      testPhotosMathEdge0291
     * @tc.desc      Clamps decimal range -85.5 to -74.5. case 291
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0291 begin');
      expect(MathUtils.clamp(-85.75, -85.5, -74.5)).assertEqual(-85.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0291 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0292
     * @tc.name      testPhotosMathEdge0292
     * @tc.desc      Clamps decimal range -85.5 to -74.5. case 292
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0292 begin');
      expect(MathUtils.clamp(-85.5, -85.5, -74.5)).assertEqual(-85.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0292 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0293
     * @tc.name      testPhotosMathEdge0293
     * @tc.desc      Clamps decimal range -85.5 to -74.5. case 293
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0293 begin');
      expect(MathUtils.clamp(-80, -85.5, -74.5)).assertEqual(-80);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0293 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0294
     * @tc.name      testPhotosMathEdge0294
     * @tc.desc      Clamps decimal range -85.5 to -74.5. case 294
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0294 begin');
      expect(MathUtils.clamp(-74.5, -85.5, -74.5)).assertEqual(-74.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0294 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0295
     * @tc.name      testPhotosMathEdge0295
     * @tc.desc      Clamps decimal range -85.5 to -74.5. case 295
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0295 begin');
      expect(MathUtils.clamp(-74.25, -85.5, -74.5)).assertEqual(-74.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0295 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0296
     * @tc.name      testPhotosMathEdge0296
     * @tc.desc      Clamps decimal range -85.25 to -73.25. case 296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0296 begin');
      expect(MathUtils.clamp(-85.5, -85.25, -73.25)).assertEqual(-85.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0296 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0297
     * @tc.name      testPhotosMathEdge0297
     * @tc.desc      Clamps decimal range -85.25 to -73.25. case 297
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0297 begin');
      expect(MathUtils.clamp(-85.25, -85.25, -73.25)).assertEqual(-85.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0297 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0298
     * @tc.name      testPhotosMathEdge0298
     * @tc.desc      Clamps decimal range -85.25 to -73.25. case 298
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0298 begin');
      expect(MathUtils.clamp(-79.25, -85.25, -73.25)).assertEqual(-79.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0298 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0299
     * @tc.name      testPhotosMathEdge0299
     * @tc.desc      Clamps decimal range -85.25 to -73.25. case 299
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0299 begin');
      expect(MathUtils.clamp(-73.25, -85.25, -73.25)).assertEqual(-73.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0299 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0300
     * @tc.name      testPhotosMathEdge0300
     * @tc.desc      Clamps decimal range -85.25 to -73.25. case 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0300 begin');
      expect(MathUtils.clamp(-73, -85.25, -73.25)).assertEqual(-73.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0300 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0301
     * @tc.name      testPhotosMathEdge0301
     * @tc.desc      Clamps decimal range -85 to -72. case 301
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0301 begin');
      expect(MathUtils.clamp(-85.25, -85, -72)).assertEqual(-85);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0301 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0302
     * @tc.name      testPhotosMathEdge0302
     * @tc.desc      Clamps decimal range -85 to -72. case 302
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0302 begin');
      expect(MathUtils.clamp(-85, -85, -72)).assertEqual(-85);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0302 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0303
     * @tc.name      testPhotosMathEdge0303
     * @tc.desc      Clamps decimal range -85 to -72. case 303
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0303 begin');
      expect(MathUtils.clamp(-78.5, -85, -72)).assertEqual(-78.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0303 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0304
     * @tc.name      testPhotosMathEdge0304
     * @tc.desc      Clamps decimal range -85 to -72. case 304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0304 begin');
      expect(MathUtils.clamp(-72, -85, -72)).assertEqual(-72);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0304 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0305
     * @tc.name      testPhotosMathEdge0305
     * @tc.desc      Clamps decimal range -85 to -72. case 305
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0305 begin');
      expect(MathUtils.clamp(-71.75, -85, -72)).assertEqual(-72);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0305 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0306
     * @tc.name      testPhotosMathEdge0306
     * @tc.desc      Clamps decimal range -84.75 to -70.75. case 306
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0306 begin');
      expect(MathUtils.clamp(-85, -84.75, -70.75)).assertEqual(-84.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0306 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0307
     * @tc.name      testPhotosMathEdge0307
     * @tc.desc      Clamps decimal range -84.75 to -70.75. case 307
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0307 begin');
      expect(MathUtils.clamp(-84.75, -84.75, -70.75)).assertEqual(-84.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0307 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0308
     * @tc.name      testPhotosMathEdge0308
     * @tc.desc      Clamps decimal range -84.75 to -70.75. case 308
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0308 begin');
      expect(MathUtils.clamp(-77.75, -84.75, -70.75)).assertEqual(-77.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0308 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0309
     * @tc.name      testPhotosMathEdge0309
     * @tc.desc      Clamps decimal range -84.75 to -70.75. case 309
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0309 begin');
      expect(MathUtils.clamp(-70.75, -84.75, -70.75)).assertEqual(-70.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0309 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0310
     * @tc.name      testPhotosMathEdge0310
     * @tc.desc      Clamps decimal range -84.75 to -70.75. case 310
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0310 begin');
      expect(MathUtils.clamp(-70.5, -84.75, -70.75)).assertEqual(-70.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0310 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0311
     * @tc.name      testPhotosMathEdge0311
     * @tc.desc      Clamps decimal range -84.5 to -69.5. case 311
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0311 begin');
      expect(MathUtils.clamp(-84.75, -84.5, -69.5)).assertEqual(-84.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0311 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0312
     * @tc.name      testPhotosMathEdge0312
     * @tc.desc      Clamps decimal range -84.5 to -69.5. case 312
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0312 begin');
      expect(MathUtils.clamp(-84.5, -84.5, -69.5)).assertEqual(-84.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0312 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0313
     * @tc.name      testPhotosMathEdge0313
     * @tc.desc      Clamps decimal range -84.5 to -69.5. case 313
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0313 begin');
      expect(MathUtils.clamp(-77, -84.5, -69.5)).assertEqual(-77);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0313 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0314
     * @tc.name      testPhotosMathEdge0314
     * @tc.desc      Clamps decimal range -84.5 to -69.5. case 314
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0314 begin');
      expect(MathUtils.clamp(-69.5, -84.5, -69.5)).assertEqual(-69.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0314 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0315
     * @tc.name      testPhotosMathEdge0315
     * @tc.desc      Clamps decimal range -84.5 to -69.5. case 315
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0315 begin');
      expect(MathUtils.clamp(-69.25, -84.5, -69.5)).assertEqual(-69.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0315 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0316
     * @tc.name      testPhotosMathEdge0316
     * @tc.desc      Clamps decimal range -84.25 to -68.25. case 316
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0316 begin');
      expect(MathUtils.clamp(-84.5, -84.25, -68.25)).assertEqual(-84.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0316 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0317
     * @tc.name      testPhotosMathEdge0317
     * @tc.desc      Clamps decimal range -84.25 to -68.25. case 317
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0317 begin');
      expect(MathUtils.clamp(-84.25, -84.25, -68.25)).assertEqual(-84.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0317 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0318
     * @tc.name      testPhotosMathEdge0318
     * @tc.desc      Clamps decimal range -84.25 to -68.25. case 318
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0318 begin');
      expect(MathUtils.clamp(-76.25, -84.25, -68.25)).assertEqual(-76.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0318 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0319
     * @tc.name      testPhotosMathEdge0319
     * @tc.desc      Clamps decimal range -84.25 to -68.25. case 319
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0319 begin');
      expect(MathUtils.clamp(-68.25, -84.25, -68.25)).assertEqual(-68.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0319 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0320
     * @tc.name      testPhotosMathEdge0320
     * @tc.desc      Clamps decimal range -84.25 to -68.25. case 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0320 begin');
      expect(MathUtils.clamp(-68, -84.25, -68.25)).assertEqual(-68.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0320 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0321
     * @tc.name      testPhotosMathEdge0321
     * @tc.desc      Clamps decimal range -84 to -83. case 321
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0321 begin');
      expect(MathUtils.clamp(-84.25, -84, -83)).assertEqual(-84);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0321 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0322
     * @tc.name      testPhotosMathEdge0322
     * @tc.desc      Clamps decimal range -84 to -83. case 322
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0322 begin');
      expect(MathUtils.clamp(-84, -84, -83)).assertEqual(-84);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0322 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0323
     * @tc.name      testPhotosMathEdge0323
     * @tc.desc      Clamps decimal range -84 to -83. case 323
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0323 begin');
      expect(MathUtils.clamp(-83.5, -84, -83)).assertEqual(-83.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0323 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0324
     * @tc.name      testPhotosMathEdge0324
     * @tc.desc      Clamps decimal range -84 to -83. case 324
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0324 begin');
      expect(MathUtils.clamp(-83, -84, -83)).assertEqual(-83);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0324 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0325
     * @tc.name      testPhotosMathEdge0325
     * @tc.desc      Clamps decimal range -84 to -83. case 325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0325 begin');
      expect(MathUtils.clamp(-82.75, -84, -83)).assertEqual(-83);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0325 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0326
     * @tc.name      testPhotosMathEdge0326
     * @tc.desc      Clamps decimal range -83.75 to -81.75. case 326
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0326 begin');
      expect(MathUtils.clamp(-84, -83.75, -81.75)).assertEqual(-83.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0326 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0327
     * @tc.name      testPhotosMathEdge0327
     * @tc.desc      Clamps decimal range -83.75 to -81.75. case 327
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0327 begin');
      expect(MathUtils.clamp(-83.75, -83.75, -81.75)).assertEqual(-83.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0327 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0328
     * @tc.name      testPhotosMathEdge0328
     * @tc.desc      Clamps decimal range -83.75 to -81.75. case 328
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0328 begin');
      expect(MathUtils.clamp(-82.75, -83.75, -81.75)).assertEqual(-82.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0328 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0329
     * @tc.name      testPhotosMathEdge0329
     * @tc.desc      Clamps decimal range -83.75 to -81.75. case 329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0329 begin');
      expect(MathUtils.clamp(-81.75, -83.75, -81.75)).assertEqual(-81.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0329 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0330
     * @tc.name      testPhotosMathEdge0330
     * @tc.desc      Clamps decimal range -83.75 to -81.75. case 330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0330 begin');
      expect(MathUtils.clamp(-81.5, -83.75, -81.75)).assertEqual(-81.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0330 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0331
     * @tc.name      testPhotosMathEdge0331
     * @tc.desc      Clamps decimal range -83.5 to -80.5. case 331
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0331 begin');
      expect(MathUtils.clamp(-83.75, -83.5, -80.5)).assertEqual(-83.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0331 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0332
     * @tc.name      testPhotosMathEdge0332
     * @tc.desc      Clamps decimal range -83.5 to -80.5. case 332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0332 begin');
      expect(MathUtils.clamp(-83.5, -83.5, -80.5)).assertEqual(-83.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0332 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0333
     * @tc.name      testPhotosMathEdge0333
     * @tc.desc      Clamps decimal range -83.5 to -80.5. case 333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0333 begin');
      expect(MathUtils.clamp(-82, -83.5, -80.5)).assertEqual(-82);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0333 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0334
     * @tc.name      testPhotosMathEdge0334
     * @tc.desc      Clamps decimal range -83.5 to -80.5. case 334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0334 begin');
      expect(MathUtils.clamp(-80.5, -83.5, -80.5)).assertEqual(-80.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0334 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0335
     * @tc.name      testPhotosMathEdge0335
     * @tc.desc      Clamps decimal range -83.5 to -80.5. case 335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0335 begin');
      expect(MathUtils.clamp(-80.25, -83.5, -80.5)).assertEqual(-80.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0335 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0336
     * @tc.name      testPhotosMathEdge0336
     * @tc.desc      Clamps decimal range -83.25 to -79.25. case 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0336 begin');
      expect(MathUtils.clamp(-83.5, -83.25, -79.25)).assertEqual(-83.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0336 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0337
     * @tc.name      testPhotosMathEdge0337
     * @tc.desc      Clamps decimal range -83.25 to -79.25. case 337
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0337 begin');
      expect(MathUtils.clamp(-83.25, -83.25, -79.25)).assertEqual(-83.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0337 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0338
     * @tc.name      testPhotosMathEdge0338
     * @tc.desc      Clamps decimal range -83.25 to -79.25. case 338
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0338 begin');
      expect(MathUtils.clamp(-81.25, -83.25, -79.25)).assertEqual(-81.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0338 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0339
     * @tc.name      testPhotosMathEdge0339
     * @tc.desc      Clamps decimal range -83.25 to -79.25. case 339
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0339 begin');
      expect(MathUtils.clamp(-79.25, -83.25, -79.25)).assertEqual(-79.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0339 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0340
     * @tc.name      testPhotosMathEdge0340
     * @tc.desc      Clamps decimal range -83.25 to -79.25. case 340
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0340 begin');
      expect(MathUtils.clamp(-79, -83.25, -79.25)).assertEqual(-79.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0340 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0341
     * @tc.name      testPhotosMathEdge0341
     * @tc.desc      Clamps decimal range -83 to -78. case 341
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0341 begin');
      expect(MathUtils.clamp(-83.25, -83, -78)).assertEqual(-83);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0341 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0342
     * @tc.name      testPhotosMathEdge0342
     * @tc.desc      Clamps decimal range -83 to -78. case 342
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0342 begin');
      expect(MathUtils.clamp(-83, -83, -78)).assertEqual(-83);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0342 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0343
     * @tc.name      testPhotosMathEdge0343
     * @tc.desc      Clamps decimal range -83 to -78. case 343
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0343 begin');
      expect(MathUtils.clamp(-80.5, -83, -78)).assertEqual(-80.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0343 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0344
     * @tc.name      testPhotosMathEdge0344
     * @tc.desc      Clamps decimal range -83 to -78. case 344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0344 begin');
      expect(MathUtils.clamp(-78, -83, -78)).assertEqual(-78);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0344 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0345
     * @tc.name      testPhotosMathEdge0345
     * @tc.desc      Clamps decimal range -83 to -78. case 345
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0345 begin');
      expect(MathUtils.clamp(-77.75, -83, -78)).assertEqual(-78);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0345 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0346
     * @tc.name      testPhotosMathEdge0346
     * @tc.desc      Clamps decimal range -82.75 to -76.75. case 346
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0346 begin');
      expect(MathUtils.clamp(-83, -82.75, -76.75)).assertEqual(-82.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0346 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0347
     * @tc.name      testPhotosMathEdge0347
     * @tc.desc      Clamps decimal range -82.75 to -76.75. case 347
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0347 begin');
      expect(MathUtils.clamp(-82.75, -82.75, -76.75)).assertEqual(-82.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0347 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0348
     * @tc.name      testPhotosMathEdge0348
     * @tc.desc      Clamps decimal range -82.75 to -76.75. case 348
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0348 begin');
      expect(MathUtils.clamp(-79.75, -82.75, -76.75)).assertEqual(-79.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0348 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0349
     * @tc.name      testPhotosMathEdge0349
     * @tc.desc      Clamps decimal range -82.75 to -76.75. case 349
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0349 begin');
      expect(MathUtils.clamp(-76.75, -82.75, -76.75)).assertEqual(-76.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0349 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0350
     * @tc.name      testPhotosMathEdge0350
     * @tc.desc      Clamps decimal range -82.75 to -76.75. case 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0350 begin');
      expect(MathUtils.clamp(-76.5, -82.75, -76.75)).assertEqual(-76.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0350 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0351
     * @tc.name      testPhotosMathEdge0351
     * @tc.desc      Clamps decimal range -82.5 to -75.5. case 351
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0351 begin');
      expect(MathUtils.clamp(-82.75, -82.5, -75.5)).assertEqual(-82.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0351 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0352
     * @tc.name      testPhotosMathEdge0352
     * @tc.desc      Clamps decimal range -82.5 to -75.5. case 352
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0352 begin');
      expect(MathUtils.clamp(-82.5, -82.5, -75.5)).assertEqual(-82.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0352 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0353
     * @tc.name      testPhotosMathEdge0353
     * @tc.desc      Clamps decimal range -82.5 to -75.5. case 353
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0353 begin');
      expect(MathUtils.clamp(-79, -82.5, -75.5)).assertEqual(-79);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0353 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0354
     * @tc.name      testPhotosMathEdge0354
     * @tc.desc      Clamps decimal range -82.5 to -75.5. case 354
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0354 begin');
      expect(MathUtils.clamp(-75.5, -82.5, -75.5)).assertEqual(-75.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0354 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0355
     * @tc.name      testPhotosMathEdge0355
     * @tc.desc      Clamps decimal range -82.5 to -75.5. case 355
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0355 begin');
      expect(MathUtils.clamp(-75.25, -82.5, -75.5)).assertEqual(-75.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0355 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0356
     * @tc.name      testPhotosMathEdge0356
     * @tc.desc      Clamps decimal range -82.25 to -74.25. case 356
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0356 begin');
      expect(MathUtils.clamp(-82.5, -82.25, -74.25)).assertEqual(-82.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0356 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0357
     * @tc.name      testPhotosMathEdge0357
     * @tc.desc      Clamps decimal range -82.25 to -74.25. case 357
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0357 begin');
      expect(MathUtils.clamp(-82.25, -82.25, -74.25)).assertEqual(-82.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0357 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0358
     * @tc.name      testPhotosMathEdge0358
     * @tc.desc      Clamps decimal range -82.25 to -74.25. case 358
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0358 begin');
      expect(MathUtils.clamp(-78.25, -82.25, -74.25)).assertEqual(-78.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0358 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0359
     * @tc.name      testPhotosMathEdge0359
     * @tc.desc      Clamps decimal range -82.25 to -74.25. case 359
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0359 begin');
      expect(MathUtils.clamp(-74.25, -82.25, -74.25)).assertEqual(-74.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0359 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0360
     * @tc.name      testPhotosMathEdge0360
     * @tc.desc      Clamps decimal range -82.25 to -74.25. case 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0360 begin');
      expect(MathUtils.clamp(-74, -82.25, -74.25)).assertEqual(-74.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0360 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0361
     * @tc.name      testPhotosMathEdge0361
     * @tc.desc      Clamps decimal range -82 to -73. case 361
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0361 begin');
      expect(MathUtils.clamp(-82.25, -82, -73)).assertEqual(-82);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0361 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0362
     * @tc.name      testPhotosMathEdge0362
     * @tc.desc      Clamps decimal range -82 to -73. case 362
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0362 begin');
      expect(MathUtils.clamp(-82, -82, -73)).assertEqual(-82);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0362 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0363
     * @tc.name      testPhotosMathEdge0363
     * @tc.desc      Clamps decimal range -82 to -73. case 363
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0363 begin');
      expect(MathUtils.clamp(-77.5, -82, -73)).assertEqual(-77.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0363 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0364
     * @tc.name      testPhotosMathEdge0364
     * @tc.desc      Clamps decimal range -82 to -73. case 364
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0364 begin');
      expect(MathUtils.clamp(-73, -82, -73)).assertEqual(-73);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0364 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0365
     * @tc.name      testPhotosMathEdge0365
     * @tc.desc      Clamps decimal range -82 to -73. case 365
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0365 begin');
      expect(MathUtils.clamp(-72.75, -82, -73)).assertEqual(-73);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0365 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0366
     * @tc.name      testPhotosMathEdge0366
     * @tc.desc      Clamps decimal range -81.75 to -71.75. case 366
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0366 begin');
      expect(MathUtils.clamp(-82, -81.75, -71.75)).assertEqual(-81.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0366 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0367
     * @tc.name      testPhotosMathEdge0367
     * @tc.desc      Clamps decimal range -81.75 to -71.75. case 367
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0367 begin');
      expect(MathUtils.clamp(-81.75, -81.75, -71.75)).assertEqual(-81.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0367 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0368
     * @tc.name      testPhotosMathEdge0368
     * @tc.desc      Clamps decimal range -81.75 to -71.75. case 368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0368 begin');
      expect(MathUtils.clamp(-76.75, -81.75, -71.75)).assertEqual(-76.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0368 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0369
     * @tc.name      testPhotosMathEdge0369
     * @tc.desc      Clamps decimal range -81.75 to -71.75. case 369
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0369 begin');
      expect(MathUtils.clamp(-71.75, -81.75, -71.75)).assertEqual(-71.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0369 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0370
     * @tc.name      testPhotosMathEdge0370
     * @tc.desc      Clamps decimal range -81.75 to -71.75. case 370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0370 begin');
      expect(MathUtils.clamp(-71.5, -81.75, -71.75)).assertEqual(-71.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0370 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0371
     * @tc.name      testPhotosMathEdge0371
     * @tc.desc      Clamps decimal range -81.5 to -70.5. case 371
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0371 begin');
      expect(MathUtils.clamp(-81.75, -81.5, -70.5)).assertEqual(-81.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0371 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0372
     * @tc.name      testPhotosMathEdge0372
     * @tc.desc      Clamps decimal range -81.5 to -70.5. case 372
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0372 begin');
      expect(MathUtils.clamp(-81.5, -81.5, -70.5)).assertEqual(-81.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0372 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0373
     * @tc.name      testPhotosMathEdge0373
     * @tc.desc      Clamps decimal range -81.5 to -70.5. case 373
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0373 begin');
      expect(MathUtils.clamp(-76, -81.5, -70.5)).assertEqual(-76);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0373 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0374
     * @tc.name      testPhotosMathEdge0374
     * @tc.desc      Clamps decimal range -81.5 to -70.5. case 374
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0374 begin');
      expect(MathUtils.clamp(-70.5, -81.5, -70.5)).assertEqual(-70.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0374 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0375
     * @tc.name      testPhotosMathEdge0375
     * @tc.desc      Clamps decimal range -81.5 to -70.5. case 375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0375 begin');
      expect(MathUtils.clamp(-70.25, -81.5, -70.5)).assertEqual(-70.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0375 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0376
     * @tc.name      testPhotosMathEdge0376
     * @tc.desc      Clamps decimal range -81.25 to -69.25. case 376
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0376 begin');
      expect(MathUtils.clamp(-81.5, -81.25, -69.25)).assertEqual(-81.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0376 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0377
     * @tc.name      testPhotosMathEdge0377
     * @tc.desc      Clamps decimal range -81.25 to -69.25. case 377
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0377 begin');
      expect(MathUtils.clamp(-81.25, -81.25, -69.25)).assertEqual(-81.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0377 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0378
     * @tc.name      testPhotosMathEdge0378
     * @tc.desc      Clamps decimal range -81.25 to -69.25. case 378
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0378 begin');
      expect(MathUtils.clamp(-75.25, -81.25, -69.25)).assertEqual(-75.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0378 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0379
     * @tc.name      testPhotosMathEdge0379
     * @tc.desc      Clamps decimal range -81.25 to -69.25. case 379
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0379 begin');
      expect(MathUtils.clamp(-69.25, -81.25, -69.25)).assertEqual(-69.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0379 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0380
     * @tc.name      testPhotosMathEdge0380
     * @tc.desc      Clamps decimal range -81.25 to -69.25. case 380
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0380 begin');
      expect(MathUtils.clamp(-69, -81.25, -69.25)).assertEqual(-69.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0380 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0381
     * @tc.name      testPhotosMathEdge0381
     * @tc.desc      Clamps decimal range -81 to -68. case 381
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0381 begin');
      expect(MathUtils.clamp(-81.25, -81, -68)).assertEqual(-81);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0381 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0382
     * @tc.name      testPhotosMathEdge0382
     * @tc.desc      Clamps decimal range -81 to -68. case 382
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0382 begin');
      expect(MathUtils.clamp(-81, -81, -68)).assertEqual(-81);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0382 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0383
     * @tc.name      testPhotosMathEdge0383
     * @tc.desc      Clamps decimal range -81 to -68. case 383
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0383 begin');
      expect(MathUtils.clamp(-74.5, -81, -68)).assertEqual(-74.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0383 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0384
     * @tc.name      testPhotosMathEdge0384
     * @tc.desc      Clamps decimal range -81 to -68. case 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0384 begin');
      expect(MathUtils.clamp(-68, -81, -68)).assertEqual(-68);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0384 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0385
     * @tc.name      testPhotosMathEdge0385
     * @tc.desc      Clamps decimal range -81 to -68. case 385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0385 begin');
      expect(MathUtils.clamp(-67.75, -81, -68)).assertEqual(-68);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0385 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0386
     * @tc.name      testPhotosMathEdge0386
     * @tc.desc      Clamps decimal range -80.75 to -66.75. case 386
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0386 begin');
      expect(MathUtils.clamp(-81, -80.75, -66.75)).assertEqual(-80.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0386 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0387
     * @tc.name      testPhotosMathEdge0387
     * @tc.desc      Clamps decimal range -80.75 to -66.75. case 387
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0387 begin');
      expect(MathUtils.clamp(-80.75, -80.75, -66.75)).assertEqual(-80.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0387 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0388
     * @tc.name      testPhotosMathEdge0388
     * @tc.desc      Clamps decimal range -80.75 to -66.75. case 388
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0388 begin');
      expect(MathUtils.clamp(-73.75, -80.75, -66.75)).assertEqual(-73.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0388 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0389
     * @tc.name      testPhotosMathEdge0389
     * @tc.desc      Clamps decimal range -80.75 to -66.75. case 389
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0389 begin');
      expect(MathUtils.clamp(-66.75, -80.75, -66.75)).assertEqual(-66.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0389 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0390
     * @tc.name      testPhotosMathEdge0390
     * @tc.desc      Clamps decimal range -80.75 to -66.75. case 390
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0390 begin');
      expect(MathUtils.clamp(-66.5, -80.75, -66.75)).assertEqual(-66.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0390 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0391
     * @tc.name      testPhotosMathEdge0391
     * @tc.desc      Clamps decimal range -80.5 to -65.5. case 391
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0391 begin');
      expect(MathUtils.clamp(-80.75, -80.5, -65.5)).assertEqual(-80.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0391 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0392
     * @tc.name      testPhotosMathEdge0392
     * @tc.desc      Clamps decimal range -80.5 to -65.5. case 392
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0392 begin');
      expect(MathUtils.clamp(-80.5, -80.5, -65.5)).assertEqual(-80.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0392 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0393
     * @tc.name      testPhotosMathEdge0393
     * @tc.desc      Clamps decimal range -80.5 to -65.5. case 393
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0393 begin');
      expect(MathUtils.clamp(-73, -80.5, -65.5)).assertEqual(-73);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0393 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0394
     * @tc.name      testPhotosMathEdge0394
     * @tc.desc      Clamps decimal range -80.5 to -65.5. case 394
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0394 begin');
      expect(MathUtils.clamp(-65.5, -80.5, -65.5)).assertEqual(-65.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0394 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0395
     * @tc.name      testPhotosMathEdge0395
     * @tc.desc      Clamps decimal range -80.5 to -65.5. case 395
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0395 begin');
      expect(MathUtils.clamp(-65.25, -80.5, -65.5)).assertEqual(-65.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0395 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0396
     * @tc.name      testPhotosMathEdge0396
     * @tc.desc      Clamps decimal range -80.25 to -64.25. case 396
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0396 begin');
      expect(MathUtils.clamp(-80.5, -80.25, -64.25)).assertEqual(-80.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0396 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0397
     * @tc.name      testPhotosMathEdge0397
     * @tc.desc      Clamps decimal range -80.25 to -64.25. case 397
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0397 begin');
      expect(MathUtils.clamp(-80.25, -80.25, -64.25)).assertEqual(-80.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0397 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0398
     * @tc.name      testPhotosMathEdge0398
     * @tc.desc      Clamps decimal range -80.25 to -64.25. case 398
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0398 begin');
      expect(MathUtils.clamp(-72.25, -80.25, -64.25)).assertEqual(-72.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0398 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0399
     * @tc.name      testPhotosMathEdge0399
     * @tc.desc      Clamps decimal range -80.25 to -64.25. case 399
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0399 begin');
      expect(MathUtils.clamp(-64.25, -80.25, -64.25)).assertEqual(-64.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0399 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0400
     * @tc.name      testPhotosMathEdge0400
     * @tc.desc      Clamps decimal range -80.25 to -64.25. case 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0400 begin');
      expect(MathUtils.clamp(-64, -80.25, -64.25)).assertEqual(-64.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0400 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0401
     * @tc.name      testPhotosMathEdge0401
     * @tc.desc      Clamps decimal range -80 to -79. case 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0401 begin');
      expect(MathUtils.clamp(-80.25, -80, -79)).assertEqual(-80);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0401 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0402
     * @tc.name      testPhotosMathEdge0402
     * @tc.desc      Clamps decimal range -80 to -79. case 402
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0402 begin');
      expect(MathUtils.clamp(-80, -80, -79)).assertEqual(-80);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0402 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0403
     * @tc.name      testPhotosMathEdge0403
     * @tc.desc      Clamps decimal range -80 to -79. case 403
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0403 begin');
      expect(MathUtils.clamp(-79.5, -80, -79)).assertEqual(-79.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0403 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0404
     * @tc.name      testPhotosMathEdge0404
     * @tc.desc      Clamps decimal range -80 to -79. case 404
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0404 begin');
      expect(MathUtils.clamp(-79, -80, -79)).assertEqual(-79);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0404 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0405
     * @tc.name      testPhotosMathEdge0405
     * @tc.desc      Clamps decimal range -80 to -79. case 405
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0405 begin');
      expect(MathUtils.clamp(-78.75, -80, -79)).assertEqual(-79);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0405 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0406
     * @tc.name      testPhotosMathEdge0406
     * @tc.desc      Clamps decimal range -79.75 to -77.75. case 406
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0406 begin');
      expect(MathUtils.clamp(-80, -79.75, -77.75)).assertEqual(-79.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0406 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0407
     * @tc.name      testPhotosMathEdge0407
     * @tc.desc      Clamps decimal range -79.75 to -77.75. case 407
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0407 begin');
      expect(MathUtils.clamp(-79.75, -79.75, -77.75)).assertEqual(-79.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0407 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0408
     * @tc.name      testPhotosMathEdge0408
     * @tc.desc      Clamps decimal range -79.75 to -77.75. case 408
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0408 begin');
      expect(MathUtils.clamp(-78.75, -79.75, -77.75)).assertEqual(-78.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0408 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0409
     * @tc.name      testPhotosMathEdge0409
     * @tc.desc      Clamps decimal range -79.75 to -77.75. case 409
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0409 begin');
      expect(MathUtils.clamp(-77.75, -79.75, -77.75)).assertEqual(-77.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0409 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0410
     * @tc.name      testPhotosMathEdge0410
     * @tc.desc      Clamps decimal range -79.75 to -77.75. case 410
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0410 begin');
      expect(MathUtils.clamp(-77.5, -79.75, -77.75)).assertEqual(-77.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0410 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0411
     * @tc.name      testPhotosMathEdge0411
     * @tc.desc      Clamps decimal range -79.5 to -76.5. case 411
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0411 begin');
      expect(MathUtils.clamp(-79.75, -79.5, -76.5)).assertEqual(-79.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0411 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0412
     * @tc.name      testPhotosMathEdge0412
     * @tc.desc      Clamps decimal range -79.5 to -76.5. case 412
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0412 begin');
      expect(MathUtils.clamp(-79.5, -79.5, -76.5)).assertEqual(-79.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0412 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0413
     * @tc.name      testPhotosMathEdge0413
     * @tc.desc      Clamps decimal range -79.5 to -76.5. case 413
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0413 begin');
      expect(MathUtils.clamp(-78, -79.5, -76.5)).assertEqual(-78);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0413 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0414
     * @tc.name      testPhotosMathEdge0414
     * @tc.desc      Clamps decimal range -79.5 to -76.5. case 414
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0414 begin');
      expect(MathUtils.clamp(-76.5, -79.5, -76.5)).assertEqual(-76.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0414 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0415
     * @tc.name      testPhotosMathEdge0415
     * @tc.desc      Clamps decimal range -79.5 to -76.5. case 415
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0415 begin');
      expect(MathUtils.clamp(-76.25, -79.5, -76.5)).assertEqual(-76.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0415 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0416
     * @tc.name      testPhotosMathEdge0416
     * @tc.desc      Clamps decimal range -79.25 to -75.25. case 416
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0416 begin');
      expect(MathUtils.clamp(-79.5, -79.25, -75.25)).assertEqual(-79.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0416 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0417
     * @tc.name      testPhotosMathEdge0417
     * @tc.desc      Clamps decimal range -79.25 to -75.25. case 417
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0417 begin');
      expect(MathUtils.clamp(-79.25, -79.25, -75.25)).assertEqual(-79.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0417 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0418
     * @tc.name      testPhotosMathEdge0418
     * @tc.desc      Clamps decimal range -79.25 to -75.25. case 418
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0418 begin');
      expect(MathUtils.clamp(-77.25, -79.25, -75.25)).assertEqual(-77.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0418 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0419
     * @tc.name      testPhotosMathEdge0419
     * @tc.desc      Clamps decimal range -79.25 to -75.25. case 419
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0419 begin');
      expect(MathUtils.clamp(-75.25, -79.25, -75.25)).assertEqual(-75.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0419 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0420
     * @tc.name      testPhotosMathEdge0420
     * @tc.desc      Clamps decimal range -79.25 to -75.25. case 420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0420 begin');
      expect(MathUtils.clamp(-75, -79.25, -75.25)).assertEqual(-75.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0420 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0421
     * @tc.name      testPhotosMathEdge0421
     * @tc.desc      Clamps decimal range -79 to -74. case 421
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0421 begin');
      expect(MathUtils.clamp(-79.25, -79, -74)).assertEqual(-79);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0421 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0422
     * @tc.name      testPhotosMathEdge0422
     * @tc.desc      Clamps decimal range -79 to -74. case 422
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0422 begin');
      expect(MathUtils.clamp(-79, -79, -74)).assertEqual(-79);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0422 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0423
     * @tc.name      testPhotosMathEdge0423
     * @tc.desc      Clamps decimal range -79 to -74. case 423
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0423 begin');
      expect(MathUtils.clamp(-76.5, -79, -74)).assertEqual(-76.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0423 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0424
     * @tc.name      testPhotosMathEdge0424
     * @tc.desc      Clamps decimal range -79 to -74. case 424
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0424 begin');
      expect(MathUtils.clamp(-74, -79, -74)).assertEqual(-74);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0424 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0425
     * @tc.name      testPhotosMathEdge0425
     * @tc.desc      Clamps decimal range -79 to -74. case 425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0425 begin');
      expect(MathUtils.clamp(-73.75, -79, -74)).assertEqual(-74);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0425 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0426
     * @tc.name      testPhotosMathEdge0426
     * @tc.desc      Clamps decimal range -78.75 to -72.75. case 426
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0426 begin');
      expect(MathUtils.clamp(-79, -78.75, -72.75)).assertEqual(-78.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0426 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0427
     * @tc.name      testPhotosMathEdge0427
     * @tc.desc      Clamps decimal range -78.75 to -72.75. case 427
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0427 begin');
      expect(MathUtils.clamp(-78.75, -78.75, -72.75)).assertEqual(-78.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0427 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0428
     * @tc.name      testPhotosMathEdge0428
     * @tc.desc      Clamps decimal range -78.75 to -72.75. case 428
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0428 begin');
      expect(MathUtils.clamp(-75.75, -78.75, -72.75)).assertEqual(-75.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0428 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0429
     * @tc.name      testPhotosMathEdge0429
     * @tc.desc      Clamps decimal range -78.75 to -72.75. case 429
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0429 begin');
      expect(MathUtils.clamp(-72.75, -78.75, -72.75)).assertEqual(-72.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0429 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0430
     * @tc.name      testPhotosMathEdge0430
     * @tc.desc      Clamps decimal range -78.75 to -72.75. case 430
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0430 begin');
      expect(MathUtils.clamp(-72.5, -78.75, -72.75)).assertEqual(-72.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0430 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0431
     * @tc.name      testPhotosMathEdge0431
     * @tc.desc      Clamps decimal range -78.5 to -71.5. case 431
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0431 begin');
      expect(MathUtils.clamp(-78.75, -78.5, -71.5)).assertEqual(-78.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0431 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0432
     * @tc.name      testPhotosMathEdge0432
     * @tc.desc      Clamps decimal range -78.5 to -71.5. case 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0432 begin');
      expect(MathUtils.clamp(-78.5, -78.5, -71.5)).assertEqual(-78.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0432 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0433
     * @tc.name      testPhotosMathEdge0433
     * @tc.desc      Clamps decimal range -78.5 to -71.5. case 433
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0433 begin');
      expect(MathUtils.clamp(-75, -78.5, -71.5)).assertEqual(-75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0433 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0434
     * @tc.name      testPhotosMathEdge0434
     * @tc.desc      Clamps decimal range -78.5 to -71.5. case 434
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0434 begin');
      expect(MathUtils.clamp(-71.5, -78.5, -71.5)).assertEqual(-71.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0434 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0435
     * @tc.name      testPhotosMathEdge0435
     * @tc.desc      Clamps decimal range -78.5 to -71.5. case 435
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0435 begin');
      expect(MathUtils.clamp(-71.25, -78.5, -71.5)).assertEqual(-71.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0435 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0436
     * @tc.name      testPhotosMathEdge0436
     * @tc.desc      Clamps decimal range -78.25 to -70.25. case 436
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0436 begin');
      expect(MathUtils.clamp(-78.5, -78.25, -70.25)).assertEqual(-78.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0436 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0437
     * @tc.name      testPhotosMathEdge0437
     * @tc.desc      Clamps decimal range -78.25 to -70.25. case 437
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0437 begin');
      expect(MathUtils.clamp(-78.25, -78.25, -70.25)).assertEqual(-78.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0437 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0438
     * @tc.name      testPhotosMathEdge0438
     * @tc.desc      Clamps decimal range -78.25 to -70.25. case 438
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0438 begin');
      expect(MathUtils.clamp(-74.25, -78.25, -70.25)).assertEqual(-74.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0438 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0439
     * @tc.name      testPhotosMathEdge0439
     * @tc.desc      Clamps decimal range -78.25 to -70.25. case 439
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0439 begin');
      expect(MathUtils.clamp(-70.25, -78.25, -70.25)).assertEqual(-70.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0439 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0440
     * @tc.name      testPhotosMathEdge0440
     * @tc.desc      Clamps decimal range -78.25 to -70.25. case 440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0440 begin');
      expect(MathUtils.clamp(-70, -78.25, -70.25)).assertEqual(-70.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0440 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0441
     * @tc.name      testPhotosMathEdge0441
     * @tc.desc      Clamps decimal range -78 to -69. case 441
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0441 begin');
      expect(MathUtils.clamp(-78.25, -78, -69)).assertEqual(-78);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0441 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0442
     * @tc.name      testPhotosMathEdge0442
     * @tc.desc      Clamps decimal range -78 to -69. case 442
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0442 begin');
      expect(MathUtils.clamp(-78, -78, -69)).assertEqual(-78);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0442 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0443
     * @tc.name      testPhotosMathEdge0443
     * @tc.desc      Clamps decimal range -78 to -69. case 443
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0443 begin');
      expect(MathUtils.clamp(-73.5, -78, -69)).assertEqual(-73.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0443 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0444
     * @tc.name      testPhotosMathEdge0444
     * @tc.desc      Clamps decimal range -78 to -69. case 444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0444 begin');
      expect(MathUtils.clamp(-69, -78, -69)).assertEqual(-69);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0444 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0445
     * @tc.name      testPhotosMathEdge0445
     * @tc.desc      Clamps decimal range -78 to -69. case 445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0445 begin');
      expect(MathUtils.clamp(-68.75, -78, -69)).assertEqual(-69);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0445 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0446
     * @tc.name      testPhotosMathEdge0446
     * @tc.desc      Clamps decimal range -77.75 to -67.75. case 446
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0446 begin');
      expect(MathUtils.clamp(-78, -77.75, -67.75)).assertEqual(-77.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0446 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0447
     * @tc.name      testPhotosMathEdge0447
     * @tc.desc      Clamps decimal range -77.75 to -67.75. case 447
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0447 begin');
      expect(MathUtils.clamp(-77.75, -77.75, -67.75)).assertEqual(-77.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0447 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0448
     * @tc.name      testPhotosMathEdge0448
     * @tc.desc      Clamps decimal range -77.75 to -67.75. case 448
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0448 begin');
      expect(MathUtils.clamp(-72.75, -77.75, -67.75)).assertEqual(-72.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0448 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0449
     * @tc.name      testPhotosMathEdge0449
     * @tc.desc      Clamps decimal range -77.75 to -67.75. case 449
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0449 begin');
      expect(MathUtils.clamp(-67.75, -77.75, -67.75)).assertEqual(-67.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0449 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0450
     * @tc.name      testPhotosMathEdge0450
     * @tc.desc      Clamps decimal range -77.75 to -67.75. case 450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0450 begin');
      expect(MathUtils.clamp(-67.5, -77.75, -67.75)).assertEqual(-67.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0450 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0451
     * @tc.name      testPhotosMathEdge0451
     * @tc.desc      Clamps decimal range -77.5 to -66.5. case 451
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0451 begin');
      expect(MathUtils.clamp(-77.75, -77.5, -66.5)).assertEqual(-77.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0451 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0452
     * @tc.name      testPhotosMathEdge0452
     * @tc.desc      Clamps decimal range -77.5 to -66.5. case 452
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0452 begin');
      expect(MathUtils.clamp(-77.5, -77.5, -66.5)).assertEqual(-77.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0452 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0453
     * @tc.name      testPhotosMathEdge0453
     * @tc.desc      Clamps decimal range -77.5 to -66.5. case 453
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0453 begin');
      expect(MathUtils.clamp(-72, -77.5, -66.5)).assertEqual(-72);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0453 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0454
     * @tc.name      testPhotosMathEdge0454
     * @tc.desc      Clamps decimal range -77.5 to -66.5. case 454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0454 begin');
      expect(MathUtils.clamp(-66.5, -77.5, -66.5)).assertEqual(-66.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0454 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0455
     * @tc.name      testPhotosMathEdge0455
     * @tc.desc      Clamps decimal range -77.5 to -66.5. case 455
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0455 begin');
      expect(MathUtils.clamp(-66.25, -77.5, -66.5)).assertEqual(-66.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0455 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0456
     * @tc.name      testPhotosMathEdge0456
     * @tc.desc      Clamps decimal range -77.25 to -65.25. case 456
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0456 begin');
      expect(MathUtils.clamp(-77.5, -77.25, -65.25)).assertEqual(-77.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0456 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0457
     * @tc.name      testPhotosMathEdge0457
     * @tc.desc      Clamps decimal range -77.25 to -65.25. case 457
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0457 begin');
      expect(MathUtils.clamp(-77.25, -77.25, -65.25)).assertEqual(-77.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0457 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0458
     * @tc.name      testPhotosMathEdge0458
     * @tc.desc      Clamps decimal range -77.25 to -65.25. case 458
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0458 begin');
      expect(MathUtils.clamp(-71.25, -77.25, -65.25)).assertEqual(-71.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0458 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0459
     * @tc.name      testPhotosMathEdge0459
     * @tc.desc      Clamps decimal range -77.25 to -65.25. case 459
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0459 begin');
      expect(MathUtils.clamp(-65.25, -77.25, -65.25)).assertEqual(-65.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0459 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0460
     * @tc.name      testPhotosMathEdge0460
     * @tc.desc      Clamps decimal range -77.25 to -65.25. case 460
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0460 begin');
      expect(MathUtils.clamp(-65, -77.25, -65.25)).assertEqual(-65.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0460 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0461
     * @tc.name      testPhotosMathEdge0461
     * @tc.desc      Clamps decimal range -77 to -64. case 461
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0461 begin');
      expect(MathUtils.clamp(-77.25, -77, -64)).assertEqual(-77);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0461 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0462
     * @tc.name      testPhotosMathEdge0462
     * @tc.desc      Clamps decimal range -77 to -64. case 462
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0462 begin');
      expect(MathUtils.clamp(-77, -77, -64)).assertEqual(-77);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0462 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0463
     * @tc.name      testPhotosMathEdge0463
     * @tc.desc      Clamps decimal range -77 to -64. case 463
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0463 begin');
      expect(MathUtils.clamp(-70.5, -77, -64)).assertEqual(-70.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0463 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0464
     * @tc.name      testPhotosMathEdge0464
     * @tc.desc      Clamps decimal range -77 to -64. case 464
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0464 begin');
      expect(MathUtils.clamp(-64, -77, -64)).assertEqual(-64);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0464 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0465
     * @tc.name      testPhotosMathEdge0465
     * @tc.desc      Clamps decimal range -77 to -64. case 465
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0465 begin');
      expect(MathUtils.clamp(-63.75, -77, -64)).assertEqual(-64);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0465 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0466
     * @tc.name      testPhotosMathEdge0466
     * @tc.desc      Clamps decimal range -76.75 to -62.75. case 466
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0466 begin');
      expect(MathUtils.clamp(-77, -76.75, -62.75)).assertEqual(-76.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0466 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0467
     * @tc.name      testPhotosMathEdge0467
     * @tc.desc      Clamps decimal range -76.75 to -62.75. case 467
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0467 begin');
      expect(MathUtils.clamp(-76.75, -76.75, -62.75)).assertEqual(-76.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0467 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0468
     * @tc.name      testPhotosMathEdge0468
     * @tc.desc      Clamps decimal range -76.75 to -62.75. case 468
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0468 begin');
      expect(MathUtils.clamp(-69.75, -76.75, -62.75)).assertEqual(-69.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0468 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0469
     * @tc.name      testPhotosMathEdge0469
     * @tc.desc      Clamps decimal range -76.75 to -62.75. case 469
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0469 begin');
      expect(MathUtils.clamp(-62.75, -76.75, -62.75)).assertEqual(-62.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0469 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0470
     * @tc.name      testPhotosMathEdge0470
     * @tc.desc      Clamps decimal range -76.75 to -62.75. case 470
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0470 begin');
      expect(MathUtils.clamp(-62.5, -76.75, -62.75)).assertEqual(-62.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0470 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0471
     * @tc.name      testPhotosMathEdge0471
     * @tc.desc      Clamps decimal range -76.5 to -61.5. case 471
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0471 begin');
      expect(MathUtils.clamp(-76.75, -76.5, -61.5)).assertEqual(-76.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0471 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0472
     * @tc.name      testPhotosMathEdge0472
     * @tc.desc      Clamps decimal range -76.5 to -61.5. case 472
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0472 begin');
      expect(MathUtils.clamp(-76.5, -76.5, -61.5)).assertEqual(-76.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0472 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0473
     * @tc.name      testPhotosMathEdge0473
     * @tc.desc      Clamps decimal range -76.5 to -61.5. case 473
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0473 begin');
      expect(MathUtils.clamp(-69, -76.5, -61.5)).assertEqual(-69);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0473 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0474
     * @tc.name      testPhotosMathEdge0474
     * @tc.desc      Clamps decimal range -76.5 to -61.5. case 474
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0474 begin');
      expect(MathUtils.clamp(-61.5, -76.5, -61.5)).assertEqual(-61.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0474 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0475
     * @tc.name      testPhotosMathEdge0475
     * @tc.desc      Clamps decimal range -76.5 to -61.5. case 475
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0475 begin');
      expect(MathUtils.clamp(-61.25, -76.5, -61.5)).assertEqual(-61.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0475 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0476
     * @tc.name      testPhotosMathEdge0476
     * @tc.desc      Clamps decimal range -76.25 to -60.25. case 476
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0476 begin');
      expect(MathUtils.clamp(-76.5, -76.25, -60.25)).assertEqual(-76.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0476 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0477
     * @tc.name      testPhotosMathEdge0477
     * @tc.desc      Clamps decimal range -76.25 to -60.25. case 477
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0477 begin');
      expect(MathUtils.clamp(-76.25, -76.25, -60.25)).assertEqual(-76.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0477 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0478
     * @tc.name      testPhotosMathEdge0478
     * @tc.desc      Clamps decimal range -76.25 to -60.25. case 478
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0478 begin');
      expect(MathUtils.clamp(-68.25, -76.25, -60.25)).assertEqual(-68.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0478 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0479
     * @tc.name      testPhotosMathEdge0479
     * @tc.desc      Clamps decimal range -76.25 to -60.25. case 479
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0479 begin');
      expect(MathUtils.clamp(-60.25, -76.25, -60.25)).assertEqual(-60.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0479 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0480
     * @tc.name      testPhotosMathEdge0480
     * @tc.desc      Clamps decimal range -76.25 to -60.25. case 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0480 begin');
      expect(MathUtils.clamp(-60, -76.25, -60.25)).assertEqual(-60.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0480 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0481
     * @tc.name      testPhotosMathEdge0481
     * @tc.desc      Clamps decimal range -76 to -75. case 481
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0481 begin');
      expect(MathUtils.clamp(-76.25, -76, -75)).assertEqual(-76);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0481 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0482
     * @tc.name      testPhotosMathEdge0482
     * @tc.desc      Clamps decimal range -76 to -75. case 482
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0482 begin');
      expect(MathUtils.clamp(-76, -76, -75)).assertEqual(-76);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0482 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0483
     * @tc.name      testPhotosMathEdge0483
     * @tc.desc      Clamps decimal range -76 to -75. case 483
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0483 begin');
      expect(MathUtils.clamp(-75.5, -76, -75)).assertEqual(-75.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0483 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0484
     * @tc.name      testPhotosMathEdge0484
     * @tc.desc      Clamps decimal range -76 to -75. case 484
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0484 begin');
      expect(MathUtils.clamp(-75, -76, -75)).assertEqual(-75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0484 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0485
     * @tc.name      testPhotosMathEdge0485
     * @tc.desc      Clamps decimal range -76 to -75. case 485
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0485 begin');
      expect(MathUtils.clamp(-74.75, -76, -75)).assertEqual(-75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0485 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0486
     * @tc.name      testPhotosMathEdge0486
     * @tc.desc      Clamps decimal range -75.75 to -73.75. case 486
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0486 begin');
      expect(MathUtils.clamp(-76, -75.75, -73.75)).assertEqual(-75.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0486 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0487
     * @tc.name      testPhotosMathEdge0487
     * @tc.desc      Clamps decimal range -75.75 to -73.75. case 487
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0487 begin');
      expect(MathUtils.clamp(-75.75, -75.75, -73.75)).assertEqual(-75.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0487 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0488
     * @tc.name      testPhotosMathEdge0488
     * @tc.desc      Clamps decimal range -75.75 to -73.75. case 488
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0488 begin');
      expect(MathUtils.clamp(-74.75, -75.75, -73.75)).assertEqual(-74.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0488 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0489
     * @tc.name      testPhotosMathEdge0489
     * @tc.desc      Clamps decimal range -75.75 to -73.75. case 489
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0489 begin');
      expect(MathUtils.clamp(-73.75, -75.75, -73.75)).assertEqual(-73.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0489 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0490
     * @tc.name      testPhotosMathEdge0490
     * @tc.desc      Clamps decimal range -75.75 to -73.75. case 490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0490 begin');
      expect(MathUtils.clamp(-73.5, -75.75, -73.75)).assertEqual(-73.75);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0490 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0491
     * @tc.name      testPhotosMathEdge0491
     * @tc.desc      Clamps decimal range -75.5 to -72.5. case 491
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0491 begin');
      expect(MathUtils.clamp(-75.75, -75.5, -72.5)).assertEqual(-75.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0491 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0492
     * @tc.name      testPhotosMathEdge0492
     * @tc.desc      Clamps decimal range -75.5 to -72.5. case 492
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0492 begin');
      expect(MathUtils.clamp(-75.5, -75.5, -72.5)).assertEqual(-75.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0492 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0493
     * @tc.name      testPhotosMathEdge0493
     * @tc.desc      Clamps decimal range -75.5 to -72.5. case 493
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0493 begin');
      expect(MathUtils.clamp(-74, -75.5, -72.5)).assertEqual(-74);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0493 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0494
     * @tc.name      testPhotosMathEdge0494
     * @tc.desc      Clamps decimal range -75.5 to -72.5. case 494
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0494 begin');
      expect(MathUtils.clamp(-72.5, -75.5, -72.5)).assertEqual(-72.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0494 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0495
     * @tc.name      testPhotosMathEdge0495
     * @tc.desc      Clamps decimal range -75.5 to -72.5. case 495
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0495 begin');
      expect(MathUtils.clamp(-72.25, -75.5, -72.5)).assertEqual(-72.5);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0495 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0496
     * @tc.name      testPhotosMathEdge0496
     * @tc.desc      Clamps decimal range -75.25 to -71.25. case 496
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0496 begin');
      expect(MathUtils.clamp(-75.5, -75.25, -71.25)).assertEqual(-75.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0496 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0497
     * @tc.name      testPhotosMathEdge0497
     * @tc.desc      Clamps decimal range -75.25 to -71.25. case 497
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0497 begin');
      expect(MathUtils.clamp(-75.25, -75.25, -71.25)).assertEqual(-75.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0497 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0498
     * @tc.name      testPhotosMathEdge0498
     * @tc.desc      Clamps decimal range -75.25 to -71.25. case 498
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0498 begin');
      expect(MathUtils.clamp(-73.25, -75.25, -71.25)).assertEqual(-73.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0498 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0499
     * @tc.name      testPhotosMathEdge0499
     * @tc.desc      Clamps decimal range -75.25 to -71.25. case 499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0499 begin');
      expect(MathUtils.clamp(-71.25, -75.25, -71.25)).assertEqual(-71.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0499 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0500
     * @tc.name      testPhotosMathEdge0500
     * @tc.desc      Clamps decimal range -75.25 to -71.25. case 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0500 begin');
      expect(MathUtils.clamp(-71, -75.25, -71.25)).assertEqual(-71.25);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0500 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0501
     * @tc.name      testPhotosMathEdge0501
     * @tc.desc      Clamps extreme range sample 1. case 501
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0501 begin');
      expect(MathUtils.clamp(-1000000, -1000000, 1000000)).assertEqual(-1000000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0501 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0502
     * @tc.name      testPhotosMathEdge0502
     * @tc.desc      Clamps extreme range sample 1. case 502
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0502 begin');
      expect(MathUtils.clamp(0, -1000000, 1000000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0502 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0503
     * @tc.name      testPhotosMathEdge0503
     * @tc.desc      Clamps extreme range sample 1. case 503
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0503 begin');
      expect(MathUtils.clamp(1000000, -1000000, 1000000)).assertEqual(1000000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0503 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0504
     * @tc.name      testPhotosMathEdge0504
     * @tc.desc      Clamps extreme range sample 1. case 504
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0504 begin');
      expect(MathUtils.clamp(1000001, -1000000, 1000000)).assertEqual(1000000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0504 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0505
     * @tc.name      testPhotosMathEdge0505
     * @tc.desc      Clamps extreme range sample 2. case 505
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0505 begin');
      expect(MathUtils.clamp(-1001000, -1001000, 1001000)).assertEqual(-1001000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0505 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0506
     * @tc.name      testPhotosMathEdge0506
     * @tc.desc      Clamps extreme range sample 2. case 506
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0506 begin');
      expect(MathUtils.clamp(0, -1001000, 1001000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0506 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0507
     * @tc.name      testPhotosMathEdge0507
     * @tc.desc      Clamps extreme range sample 2. case 507
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0507 begin');
      expect(MathUtils.clamp(1001000, -1001000, 1001000)).assertEqual(1001000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0507 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0508
     * @tc.name      testPhotosMathEdge0508
     * @tc.desc      Clamps extreme range sample 2. case 508
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0508 begin');
      expect(MathUtils.clamp(1001001, -1001000, 1001000)).assertEqual(1001000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0508 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0509
     * @tc.name      testPhotosMathEdge0509
     * @tc.desc      Clamps extreme range sample 3. case 509
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0509 begin');
      expect(MathUtils.clamp(-1002000, -1002000, 1002000)).assertEqual(-1002000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0509 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0510
     * @tc.name      testPhotosMathEdge0510
     * @tc.desc      Clamps extreme range sample 3. case 510
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0510 begin');
      expect(MathUtils.clamp(0, -1002000, 1002000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0510 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0511
     * @tc.name      testPhotosMathEdge0511
     * @tc.desc      Clamps extreme range sample 3. case 511
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0511 begin');
      expect(MathUtils.clamp(1002000, -1002000, 1002000)).assertEqual(1002000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0511 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0512
     * @tc.name      testPhotosMathEdge0512
     * @tc.desc      Clamps extreme range sample 3. case 512
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0512 begin');
      expect(MathUtils.clamp(1002001, -1002000, 1002000)).assertEqual(1002000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0512 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0513
     * @tc.name      testPhotosMathEdge0513
     * @tc.desc      Clamps extreme range sample 4. case 513
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0513 begin');
      expect(MathUtils.clamp(-1003000, -1003000, 1003000)).assertEqual(-1003000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0513 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0514
     * @tc.name      testPhotosMathEdge0514
     * @tc.desc      Clamps extreme range sample 4. case 514
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0514 begin');
      expect(MathUtils.clamp(0, -1003000, 1003000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0514 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0515
     * @tc.name      testPhotosMathEdge0515
     * @tc.desc      Clamps extreme range sample 4. case 515
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0515 begin');
      expect(MathUtils.clamp(1003000, -1003000, 1003000)).assertEqual(1003000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0515 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0516
     * @tc.name      testPhotosMathEdge0516
     * @tc.desc      Clamps extreme range sample 4. case 516
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0516 begin');
      expect(MathUtils.clamp(1003001, -1003000, 1003000)).assertEqual(1003000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0516 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0517
     * @tc.name      testPhotosMathEdge0517
     * @tc.desc      Clamps extreme range sample 5. case 517
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0517 begin');
      expect(MathUtils.clamp(-1004000, -1004000, 1004000)).assertEqual(-1004000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0517 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0518
     * @tc.name      testPhotosMathEdge0518
     * @tc.desc      Clamps extreme range sample 5. case 518
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0518 begin');
      expect(MathUtils.clamp(0, -1004000, 1004000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0518 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0519
     * @tc.name      testPhotosMathEdge0519
     * @tc.desc      Clamps extreme range sample 5. case 519
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0519 begin');
      expect(MathUtils.clamp(1004000, -1004000, 1004000)).assertEqual(1004000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0519 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0520
     * @tc.name      testPhotosMathEdge0520
     * @tc.desc      Clamps extreme range sample 5. case 520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0520 begin');
      expect(MathUtils.clamp(1004001, -1004000, 1004000)).assertEqual(1004000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0520 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0521
     * @tc.name      testPhotosMathEdge0521
     * @tc.desc      Clamps extreme range sample 6. case 521
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0521 begin');
      expect(MathUtils.clamp(-1005000, -1005000, 1005000)).assertEqual(-1005000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0521 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0522
     * @tc.name      testPhotosMathEdge0522
     * @tc.desc      Clamps extreme range sample 6. case 522
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0522 begin');
      expect(MathUtils.clamp(0, -1005000, 1005000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0522 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0523
     * @tc.name      testPhotosMathEdge0523
     * @tc.desc      Clamps extreme range sample 6. case 523
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0523 begin');
      expect(MathUtils.clamp(1005000, -1005000, 1005000)).assertEqual(1005000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0523 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0524
     * @tc.name      testPhotosMathEdge0524
     * @tc.desc      Clamps extreme range sample 6. case 524
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0524 begin');
      expect(MathUtils.clamp(1005001, -1005000, 1005000)).assertEqual(1005000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0524 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0525
     * @tc.name      testPhotosMathEdge0525
     * @tc.desc      Clamps extreme range sample 7. case 525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0525 begin');
      expect(MathUtils.clamp(-1006000, -1006000, 1006000)).assertEqual(-1006000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0525 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0526
     * @tc.name      testPhotosMathEdge0526
     * @tc.desc      Clamps extreme range sample 7. case 526
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0526 begin');
      expect(MathUtils.clamp(0, -1006000, 1006000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0526 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0527
     * @tc.name      testPhotosMathEdge0527
     * @tc.desc      Clamps extreme range sample 7. case 527
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0527 begin');
      expect(MathUtils.clamp(1006000, -1006000, 1006000)).assertEqual(1006000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0527 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0528
     * @tc.name      testPhotosMathEdge0528
     * @tc.desc      Clamps extreme range sample 7. case 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0528 begin');
      expect(MathUtils.clamp(1006001, -1006000, 1006000)).assertEqual(1006000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0528 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0529
     * @tc.name      testPhotosMathEdge0529
     * @tc.desc      Clamps extreme range sample 8. case 529
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0529 begin');
      expect(MathUtils.clamp(-1007000, -1007000, 1007000)).assertEqual(-1007000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0529 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0530
     * @tc.name      testPhotosMathEdge0530
     * @tc.desc      Clamps extreme range sample 8. case 530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0530 begin');
      expect(MathUtils.clamp(0, -1007000, 1007000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0530 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0531
     * @tc.name      testPhotosMathEdge0531
     * @tc.desc      Clamps extreme range sample 8. case 531
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0531 begin');
      expect(MathUtils.clamp(1007000, -1007000, 1007000)).assertEqual(1007000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0531 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0532
     * @tc.name      testPhotosMathEdge0532
     * @tc.desc      Clamps extreme range sample 8. case 532
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0532 begin');
      expect(MathUtils.clamp(1007001, -1007000, 1007000)).assertEqual(1007000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0532 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0533
     * @tc.name      testPhotosMathEdge0533
     * @tc.desc      Clamps extreme range sample 9. case 533
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0533 begin');
      expect(MathUtils.clamp(-1008000, -1008000, 1008000)).assertEqual(-1008000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0533 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0534
     * @tc.name      testPhotosMathEdge0534
     * @tc.desc      Clamps extreme range sample 9. case 534
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0534 begin');
      expect(MathUtils.clamp(0, -1008000, 1008000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0534 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0535
     * @tc.name      testPhotosMathEdge0535
     * @tc.desc      Clamps extreme range sample 9. case 535
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0535 begin');
      expect(MathUtils.clamp(1008000, -1008000, 1008000)).assertEqual(1008000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0535 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0536
     * @tc.name      testPhotosMathEdge0536
     * @tc.desc      Clamps extreme range sample 9. case 536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0536 begin');
      expect(MathUtils.clamp(1008001, -1008000, 1008000)).assertEqual(1008000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0536 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0537
     * @tc.name      testPhotosMathEdge0537
     * @tc.desc      Clamps extreme range sample 10. case 537
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0537 begin');
      expect(MathUtils.clamp(-1009000, -1009000, 1009000)).assertEqual(-1009000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0537 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0538
     * @tc.name      testPhotosMathEdge0538
     * @tc.desc      Clamps extreme range sample 10. case 538
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0538 begin');
      expect(MathUtils.clamp(0, -1009000, 1009000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0538 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0539
     * @tc.name      testPhotosMathEdge0539
     * @tc.desc      Clamps extreme range sample 10. case 539
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0539 begin');
      expect(MathUtils.clamp(1009000, -1009000, 1009000)).assertEqual(1009000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0539 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0540
     * @tc.name      testPhotosMathEdge0540
     * @tc.desc      Clamps extreme range sample 10. case 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0540 begin');
      expect(MathUtils.clamp(1009001, -1009000, 1009000)).assertEqual(1009000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0540 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0541
     * @tc.name      testPhotosMathEdge0541
     * @tc.desc      Clamps extreme range sample 11. case 541
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0541 begin');
      expect(MathUtils.clamp(-1010000, -1010000, 1010000)).assertEqual(-1010000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0541 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0542
     * @tc.name      testPhotosMathEdge0542
     * @tc.desc      Clamps extreme range sample 11. case 542
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0542 begin');
      expect(MathUtils.clamp(0, -1010000, 1010000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0542 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0543
     * @tc.name      testPhotosMathEdge0543
     * @tc.desc      Clamps extreme range sample 11. case 543
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0543 begin');
      expect(MathUtils.clamp(1010000, -1010000, 1010000)).assertEqual(1010000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0543 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0544
     * @tc.name      testPhotosMathEdge0544
     * @tc.desc      Clamps extreme range sample 11. case 544
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0544 begin');
      expect(MathUtils.clamp(1010001, -1010000, 1010000)).assertEqual(1010000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0544 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0545
     * @tc.name      testPhotosMathEdge0545
     * @tc.desc      Clamps extreme range sample 12. case 545
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0545 begin');
      expect(MathUtils.clamp(-1011000, -1011000, 1011000)).assertEqual(-1011000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0545 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0546
     * @tc.name      testPhotosMathEdge0546
     * @tc.desc      Clamps extreme range sample 12. case 546
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0546 begin');
      expect(MathUtils.clamp(0, -1011000, 1011000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0546 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0547
     * @tc.name      testPhotosMathEdge0547
     * @tc.desc      Clamps extreme range sample 12. case 547
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0547 begin');
      expect(MathUtils.clamp(1011000, -1011000, 1011000)).assertEqual(1011000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0547 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0548
     * @tc.name      testPhotosMathEdge0548
     * @tc.desc      Clamps extreme range sample 12. case 548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0548 begin');
      expect(MathUtils.clamp(1011001, -1011000, 1011000)).assertEqual(1011000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0548 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0549
     * @tc.name      testPhotosMathEdge0549
     * @tc.desc      Clamps extreme range sample 13. case 549
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0549 begin');
      expect(MathUtils.clamp(-1012000, -1012000, 1012000)).assertEqual(-1012000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0549 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0550
     * @tc.name      testPhotosMathEdge0550
     * @tc.desc      Clamps extreme range sample 13. case 550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0550 begin');
      expect(MathUtils.clamp(0, -1012000, 1012000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0550 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0551
     * @tc.name      testPhotosMathEdge0551
     * @tc.desc      Clamps extreme range sample 13. case 551
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0551 begin');
      expect(MathUtils.clamp(1012000, -1012000, 1012000)).assertEqual(1012000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0551 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0552
     * @tc.name      testPhotosMathEdge0552
     * @tc.desc      Clamps extreme range sample 13. case 552
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0552 begin');
      expect(MathUtils.clamp(1012001, -1012000, 1012000)).assertEqual(1012000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0552 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0553
     * @tc.name      testPhotosMathEdge0553
     * @tc.desc      Clamps extreme range sample 14. case 553
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0553 begin');
      expect(MathUtils.clamp(-1013000, -1013000, 1013000)).assertEqual(-1013000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0553 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0554
     * @tc.name      testPhotosMathEdge0554
     * @tc.desc      Clamps extreme range sample 14. case 554
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0554 begin');
      expect(MathUtils.clamp(0, -1013000, 1013000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0554 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0555
     * @tc.name      testPhotosMathEdge0555
     * @tc.desc      Clamps extreme range sample 14. case 555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0555 begin');
      expect(MathUtils.clamp(1013000, -1013000, 1013000)).assertEqual(1013000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0555 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0556
     * @tc.name      testPhotosMathEdge0556
     * @tc.desc      Clamps extreme range sample 14. case 556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0556 begin');
      expect(MathUtils.clamp(1013001, -1013000, 1013000)).assertEqual(1013000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0556 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0557
     * @tc.name      testPhotosMathEdge0557
     * @tc.desc      Clamps extreme range sample 15. case 557
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0557 begin');
      expect(MathUtils.clamp(-1014000, -1014000, 1014000)).assertEqual(-1014000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0557 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0558
     * @tc.name      testPhotosMathEdge0558
     * @tc.desc      Clamps extreme range sample 15. case 558
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0558 begin');
      expect(MathUtils.clamp(0, -1014000, 1014000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0558 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0559
     * @tc.name      testPhotosMathEdge0559
     * @tc.desc      Clamps extreme range sample 15. case 559
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0559 begin');
      expect(MathUtils.clamp(1014000, -1014000, 1014000)).assertEqual(1014000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0559 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0560
     * @tc.name      testPhotosMathEdge0560
     * @tc.desc      Clamps extreme range sample 15. case 560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0560 begin');
      expect(MathUtils.clamp(1014001, -1014000, 1014000)).assertEqual(1014000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0560 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0561
     * @tc.name      testPhotosMathEdge0561
     * @tc.desc      Clamps extreme range sample 16. case 561
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0561 begin');
      expect(MathUtils.clamp(-1015000, -1015000, 1015000)).assertEqual(-1015000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0561 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0562
     * @tc.name      testPhotosMathEdge0562
     * @tc.desc      Clamps extreme range sample 16. case 562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0562 begin');
      expect(MathUtils.clamp(0, -1015000, 1015000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0562 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0563
     * @tc.name      testPhotosMathEdge0563
     * @tc.desc      Clamps extreme range sample 16. case 563
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0563 begin');
      expect(MathUtils.clamp(1015000, -1015000, 1015000)).assertEqual(1015000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0563 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0564
     * @tc.name      testPhotosMathEdge0564
     * @tc.desc      Clamps extreme range sample 16. case 564
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0564 begin');
      expect(MathUtils.clamp(1015001, -1015000, 1015000)).assertEqual(1015000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0564 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0565
     * @tc.name      testPhotosMathEdge0565
     * @tc.desc      Clamps extreme range sample 17. case 565
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0565 begin');
      expect(MathUtils.clamp(-1016000, -1016000, 1016000)).assertEqual(-1016000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0565 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0566
     * @tc.name      testPhotosMathEdge0566
     * @tc.desc      Clamps extreme range sample 17. case 566
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0566 begin');
      expect(MathUtils.clamp(0, -1016000, 1016000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0566 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0567
     * @tc.name      testPhotosMathEdge0567
     * @tc.desc      Clamps extreme range sample 17. case 567
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0567 begin');
      expect(MathUtils.clamp(1016000, -1016000, 1016000)).assertEqual(1016000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0567 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0568
     * @tc.name      testPhotosMathEdge0568
     * @tc.desc      Clamps extreme range sample 17. case 568
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0568 begin');
      expect(MathUtils.clamp(1016001, -1016000, 1016000)).assertEqual(1016000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0568 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0569
     * @tc.name      testPhotosMathEdge0569
     * @tc.desc      Clamps extreme range sample 18. case 569
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0569 begin');
      expect(MathUtils.clamp(-1017000, -1017000, 1017000)).assertEqual(-1017000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0569 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0570
     * @tc.name      testPhotosMathEdge0570
     * @tc.desc      Clamps extreme range sample 18. case 570
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0570 begin');
      expect(MathUtils.clamp(0, -1017000, 1017000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0570 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0571
     * @tc.name      testPhotosMathEdge0571
     * @tc.desc      Clamps extreme range sample 18. case 571
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0571 begin');
      expect(MathUtils.clamp(1017000, -1017000, 1017000)).assertEqual(1017000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0571 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0572
     * @tc.name      testPhotosMathEdge0572
     * @tc.desc      Clamps extreme range sample 18. case 572
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0572 begin');
      expect(MathUtils.clamp(1017001, -1017000, 1017000)).assertEqual(1017000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0572 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0573
     * @tc.name      testPhotosMathEdge0573
     * @tc.desc      Clamps extreme range sample 19. case 573
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0573 begin');
      expect(MathUtils.clamp(-1018000, -1018000, 1018000)).assertEqual(-1018000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0573 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0574
     * @tc.name      testPhotosMathEdge0574
     * @tc.desc      Clamps extreme range sample 19. case 574
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0574 begin');
      expect(MathUtils.clamp(0, -1018000, 1018000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0574 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0575
     * @tc.name      testPhotosMathEdge0575
     * @tc.desc      Clamps extreme range sample 19. case 575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0575 begin');
      expect(MathUtils.clamp(1018000, -1018000, 1018000)).assertEqual(1018000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0575 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0576
     * @tc.name      testPhotosMathEdge0576
     * @tc.desc      Clamps extreme range sample 19. case 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0576 begin');
      expect(MathUtils.clamp(1018001, -1018000, 1018000)).assertEqual(1018000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0576 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0577
     * @tc.name      testPhotosMathEdge0577
     * @tc.desc      Clamps extreme range sample 20. case 577
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0577 begin');
      expect(MathUtils.clamp(-1019000, -1019000, 1019000)).assertEqual(-1019000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0577 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0578
     * @tc.name      testPhotosMathEdge0578
     * @tc.desc      Clamps extreme range sample 20. case 578
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0578 begin');
      expect(MathUtils.clamp(0, -1019000, 1019000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0578 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0579
     * @tc.name      testPhotosMathEdge0579
     * @tc.desc      Clamps extreme range sample 20. case 579
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0579 begin');
      expect(MathUtils.clamp(1019000, -1019000, 1019000)).assertEqual(1019000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0579 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0580
     * @tc.name      testPhotosMathEdge0580
     * @tc.desc      Clamps extreme range sample 20. case 580
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0580 begin');
      expect(MathUtils.clamp(1019001, -1019000, 1019000)).assertEqual(1019000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0580 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0581
     * @tc.name      testPhotosMathEdge0581
     * @tc.desc      Clamps extreme range sample 21. case 581
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0581 begin');
      expect(MathUtils.clamp(-1020000, -1020000, 1020000)).assertEqual(-1020000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0581 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0582
     * @tc.name      testPhotosMathEdge0582
     * @tc.desc      Clamps extreme range sample 21. case 582
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0582 begin');
      expect(MathUtils.clamp(0, -1020000, 1020000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0582 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0583
     * @tc.name      testPhotosMathEdge0583
     * @tc.desc      Clamps extreme range sample 21. case 583
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0583 begin');
      expect(MathUtils.clamp(1020000, -1020000, 1020000)).assertEqual(1020000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0583 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0584
     * @tc.name      testPhotosMathEdge0584
     * @tc.desc      Clamps extreme range sample 21. case 584
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0584 begin');
      expect(MathUtils.clamp(1020001, -1020000, 1020000)).assertEqual(1020000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0584 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0585
     * @tc.name      testPhotosMathEdge0585
     * @tc.desc      Clamps extreme range sample 22. case 585
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0585 begin');
      expect(MathUtils.clamp(-1021000, -1021000, 1021000)).assertEqual(-1021000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0585 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0586
     * @tc.name      testPhotosMathEdge0586
     * @tc.desc      Clamps extreme range sample 22. case 586
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0586 begin');
      expect(MathUtils.clamp(0, -1021000, 1021000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0586 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0587
     * @tc.name      testPhotosMathEdge0587
     * @tc.desc      Clamps extreme range sample 22. case 587
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0587 begin');
      expect(MathUtils.clamp(1021000, -1021000, 1021000)).assertEqual(1021000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0587 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0588
     * @tc.name      testPhotosMathEdge0588
     * @tc.desc      Clamps extreme range sample 22. case 588
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0588 begin');
      expect(MathUtils.clamp(1021001, -1021000, 1021000)).assertEqual(1021000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0588 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0589
     * @tc.name      testPhotosMathEdge0589
     * @tc.desc      Clamps extreme range sample 23. case 589
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0589 begin');
      expect(MathUtils.clamp(-1022000, -1022000, 1022000)).assertEqual(-1022000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0589 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0590
     * @tc.name      testPhotosMathEdge0590
     * @tc.desc      Clamps extreme range sample 23. case 590
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0590 begin');
      expect(MathUtils.clamp(0, -1022000, 1022000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0590 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0591
     * @tc.name      testPhotosMathEdge0591
     * @tc.desc      Clamps extreme range sample 23. case 591
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0591 begin');
      expect(MathUtils.clamp(1022000, -1022000, 1022000)).assertEqual(1022000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0591 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0592
     * @tc.name      testPhotosMathEdge0592
     * @tc.desc      Clamps extreme range sample 23. case 592
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0592 begin');
      expect(MathUtils.clamp(1022001, -1022000, 1022000)).assertEqual(1022000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0592 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0593
     * @tc.name      testPhotosMathEdge0593
     * @tc.desc      Clamps extreme range sample 24. case 593
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0593 begin');
      expect(MathUtils.clamp(-1023000, -1023000, 1023000)).assertEqual(-1023000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0593 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0594
     * @tc.name      testPhotosMathEdge0594
     * @tc.desc      Clamps extreme range sample 24. case 594
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0594 begin');
      expect(MathUtils.clamp(0, -1023000, 1023000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0594 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0595
     * @tc.name      testPhotosMathEdge0595
     * @tc.desc      Clamps extreme range sample 24. case 595
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0595 begin');
      expect(MathUtils.clamp(1023000, -1023000, 1023000)).assertEqual(1023000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0595 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0596
     * @tc.name      testPhotosMathEdge0596
     * @tc.desc      Clamps extreme range sample 24. case 596
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0596 begin');
      expect(MathUtils.clamp(1023001, -1023000, 1023000)).assertEqual(1023000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0596 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0597
     * @tc.name      testPhotosMathEdge0597
     * @tc.desc      Clamps extreme range sample 25. case 597
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0597 begin');
      expect(MathUtils.clamp(-1024000, -1024000, 1024000)).assertEqual(-1024000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0597 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0598
     * @tc.name      testPhotosMathEdge0598
     * @tc.desc      Clamps extreme range sample 25. case 598
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0598 begin');
      expect(MathUtils.clamp(0, -1024000, 1024000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0598 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0599
     * @tc.name      testPhotosMathEdge0599
     * @tc.desc      Clamps extreme range sample 25. case 599
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0599 begin');
      expect(MathUtils.clamp(1024000, -1024000, 1024000)).assertEqual(1024000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0599 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0600
     * @tc.name      testPhotosMathEdge0600
     * @tc.desc      Clamps extreme range sample 25. case 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0600 begin');
      expect(MathUtils.clamp(1024001, -1024000, 1024000)).assertEqual(1024000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0600 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0601
     * @tc.name      testPhotosMathEdge0601
     * @tc.desc      Clamps extreme range sample 26. case 601
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0601 begin');
      expect(MathUtils.clamp(-1025000, -1025000, 1025000)).assertEqual(-1025000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0601 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0602
     * @tc.name      testPhotosMathEdge0602
     * @tc.desc      Clamps extreme range sample 26. case 602
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0602 begin');
      expect(MathUtils.clamp(0, -1025000, 1025000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0602 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0603
     * @tc.name      testPhotosMathEdge0603
     * @tc.desc      Clamps extreme range sample 26. case 603
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0603 begin');
      expect(MathUtils.clamp(1025000, -1025000, 1025000)).assertEqual(1025000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0603 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0604
     * @tc.name      testPhotosMathEdge0604
     * @tc.desc      Clamps extreme range sample 26. case 604
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0604 begin');
      expect(MathUtils.clamp(1025001, -1025000, 1025000)).assertEqual(1025000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0604 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0605
     * @tc.name      testPhotosMathEdge0605
     * @tc.desc      Clamps extreme range sample 27. case 605
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0605 begin');
      expect(MathUtils.clamp(-1026000, -1026000, 1026000)).assertEqual(-1026000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0605 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0606
     * @tc.name      testPhotosMathEdge0606
     * @tc.desc      Clamps extreme range sample 27. case 606
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0606 begin');
      expect(MathUtils.clamp(0, -1026000, 1026000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0606 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0607
     * @tc.name      testPhotosMathEdge0607
     * @tc.desc      Clamps extreme range sample 27. case 607
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0607 begin');
      expect(MathUtils.clamp(1026000, -1026000, 1026000)).assertEqual(1026000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0607 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0608
     * @tc.name      testPhotosMathEdge0608
     * @tc.desc      Clamps extreme range sample 27. case 608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0608 begin');
      expect(MathUtils.clamp(1026001, -1026000, 1026000)).assertEqual(1026000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0608 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0609
     * @tc.name      testPhotosMathEdge0609
     * @tc.desc      Clamps extreme range sample 28. case 609
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0609 begin');
      expect(MathUtils.clamp(-1027000, -1027000, 1027000)).assertEqual(-1027000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0609 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0610
     * @tc.name      testPhotosMathEdge0610
     * @tc.desc      Clamps extreme range sample 28. case 610
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0610 begin');
      expect(MathUtils.clamp(0, -1027000, 1027000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0610 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0611
     * @tc.name      testPhotosMathEdge0611
     * @tc.desc      Clamps extreme range sample 28. case 611
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0611 begin');
      expect(MathUtils.clamp(1027000, -1027000, 1027000)).assertEqual(1027000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0611 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0612
     * @tc.name      testPhotosMathEdge0612
     * @tc.desc      Clamps extreme range sample 28. case 612
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0612 begin');
      expect(MathUtils.clamp(1027001, -1027000, 1027000)).assertEqual(1027000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0612 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0613
     * @tc.name      testPhotosMathEdge0613
     * @tc.desc      Clamps extreme range sample 29. case 613
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0613 begin');
      expect(MathUtils.clamp(-1028000, -1028000, 1028000)).assertEqual(-1028000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0613 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0614
     * @tc.name      testPhotosMathEdge0614
     * @tc.desc      Clamps extreme range sample 29. case 614
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0614 begin');
      expect(MathUtils.clamp(0, -1028000, 1028000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0614 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0615
     * @tc.name      testPhotosMathEdge0615
     * @tc.desc      Clamps extreme range sample 29. case 615
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0615 begin');
      expect(MathUtils.clamp(1028000, -1028000, 1028000)).assertEqual(1028000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0615 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0616
     * @tc.name      testPhotosMathEdge0616
     * @tc.desc      Clamps extreme range sample 29. case 616
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0616 begin');
      expect(MathUtils.clamp(1028001, -1028000, 1028000)).assertEqual(1028000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0616 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0617
     * @tc.name      testPhotosMathEdge0617
     * @tc.desc      Clamps extreme range sample 30. case 617
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0617', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0617 begin');
      expect(MathUtils.clamp(-1029000, -1029000, 1029000)).assertEqual(-1029000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0617 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0618
     * @tc.name      testPhotosMathEdge0618
     * @tc.desc      Clamps extreme range sample 30. case 618
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0618', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0618 begin');
      expect(MathUtils.clamp(0, -1029000, 1029000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0618 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0619
     * @tc.name      testPhotosMathEdge0619
     * @tc.desc      Clamps extreme range sample 30. case 619
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0619', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0619 begin');
      expect(MathUtils.clamp(1029000, -1029000, 1029000)).assertEqual(1029000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0619 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0620
     * @tc.name      testPhotosMathEdge0620
     * @tc.desc      Clamps extreme range sample 30. case 620
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0620', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0620 begin');
      expect(MathUtils.clamp(1029001, -1029000, 1029000)).assertEqual(1029000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0620 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0621
     * @tc.name      testPhotosMathEdge0621
     * @tc.desc      Clamps extreme range sample 31. case 621
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0621', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0621 begin');
      expect(MathUtils.clamp(-1030000, -1030000, 1030000)).assertEqual(-1030000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0621 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0622
     * @tc.name      testPhotosMathEdge0622
     * @tc.desc      Clamps extreme range sample 31. case 622
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0622', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0622 begin');
      expect(MathUtils.clamp(0, -1030000, 1030000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0622 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0623
     * @tc.name      testPhotosMathEdge0623
     * @tc.desc      Clamps extreme range sample 31. case 623
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0623', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0623 begin');
      expect(MathUtils.clamp(1030000, -1030000, 1030000)).assertEqual(1030000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0623 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0624
     * @tc.name      testPhotosMathEdge0624
     * @tc.desc      Clamps extreme range sample 31. case 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0624', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0624 begin');
      expect(MathUtils.clamp(1030001, -1030000, 1030000)).assertEqual(1030000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0624 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0625
     * @tc.name      testPhotosMathEdge0625
     * @tc.desc      Clamps extreme range sample 32. case 625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0625', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0625 begin');
      expect(MathUtils.clamp(-1031000, -1031000, 1031000)).assertEqual(-1031000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0625 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0626
     * @tc.name      testPhotosMathEdge0626
     * @tc.desc      Clamps extreme range sample 32. case 626
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0626', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0626 begin');
      expect(MathUtils.clamp(0, -1031000, 1031000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0626 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0627
     * @tc.name      testPhotosMathEdge0627
     * @tc.desc      Clamps extreme range sample 32. case 627
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0627', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0627 begin');
      expect(MathUtils.clamp(1031000, -1031000, 1031000)).assertEqual(1031000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0627 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0628
     * @tc.name      testPhotosMathEdge0628
     * @tc.desc      Clamps extreme range sample 32. case 628
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0628', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0628 begin');
      expect(MathUtils.clamp(1031001, -1031000, 1031000)).assertEqual(1031000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0628 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0629
     * @tc.name      testPhotosMathEdge0629
     * @tc.desc      Clamps extreme range sample 33. case 629
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0629', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0629 begin');
      expect(MathUtils.clamp(-1032000, -1032000, 1032000)).assertEqual(-1032000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0629 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0630
     * @tc.name      testPhotosMathEdge0630
     * @tc.desc      Clamps extreme range sample 33. case 630
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0630', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0630 begin');
      expect(MathUtils.clamp(0, -1032000, 1032000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0630 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0631
     * @tc.name      testPhotosMathEdge0631
     * @tc.desc      Clamps extreme range sample 33. case 631
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0631', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0631 begin');
      expect(MathUtils.clamp(1032000, -1032000, 1032000)).assertEqual(1032000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0631 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0632
     * @tc.name      testPhotosMathEdge0632
     * @tc.desc      Clamps extreme range sample 33. case 632
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0632', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0632 begin');
      expect(MathUtils.clamp(1032001, -1032000, 1032000)).assertEqual(1032000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0632 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0633
     * @tc.name      testPhotosMathEdge0633
     * @tc.desc      Clamps extreme range sample 34. case 633
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0633', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0633 begin');
      expect(MathUtils.clamp(-1033000, -1033000, 1033000)).assertEqual(-1033000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0633 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0634
     * @tc.name      testPhotosMathEdge0634
     * @tc.desc      Clamps extreme range sample 34. case 634
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0634', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0634 begin');
      expect(MathUtils.clamp(0, -1033000, 1033000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0634 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0635
     * @tc.name      testPhotosMathEdge0635
     * @tc.desc      Clamps extreme range sample 34. case 635
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0635', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0635 begin');
      expect(MathUtils.clamp(1033000, -1033000, 1033000)).assertEqual(1033000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0635 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0636
     * @tc.name      testPhotosMathEdge0636
     * @tc.desc      Clamps extreme range sample 34. case 636
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0636', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0636 begin');
      expect(MathUtils.clamp(1033001, -1033000, 1033000)).assertEqual(1033000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0636 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0637
     * @tc.name      testPhotosMathEdge0637
     * @tc.desc      Clamps extreme range sample 35. case 637
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0637', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0637 begin');
      expect(MathUtils.clamp(-1034000, -1034000, 1034000)).assertEqual(-1034000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0637 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0638
     * @tc.name      testPhotosMathEdge0638
     * @tc.desc      Clamps extreme range sample 35. case 638
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0638', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0638 begin');
      expect(MathUtils.clamp(0, -1034000, 1034000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0638 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0639
     * @tc.name      testPhotosMathEdge0639
     * @tc.desc      Clamps extreme range sample 35. case 639
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0639', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0639 begin');
      expect(MathUtils.clamp(1034000, -1034000, 1034000)).assertEqual(1034000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0639 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0640
     * @tc.name      testPhotosMathEdge0640
     * @tc.desc      Clamps extreme range sample 35. case 640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0640', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0640 begin');
      expect(MathUtils.clamp(1034001, -1034000, 1034000)).assertEqual(1034000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0640 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0641
     * @tc.name      testPhotosMathEdge0641
     * @tc.desc      Clamps extreme range sample 36. case 641
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0641', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0641 begin');
      expect(MathUtils.clamp(-1035000, -1035000, 1035000)).assertEqual(-1035000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0641 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0642
     * @tc.name      testPhotosMathEdge0642
     * @tc.desc      Clamps extreme range sample 36. case 642
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0642', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0642 begin');
      expect(MathUtils.clamp(0, -1035000, 1035000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0642 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0643
     * @tc.name      testPhotosMathEdge0643
     * @tc.desc      Clamps extreme range sample 36. case 643
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0643', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0643 begin');
      expect(MathUtils.clamp(1035000, -1035000, 1035000)).assertEqual(1035000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0643 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0644
     * @tc.name      testPhotosMathEdge0644
     * @tc.desc      Clamps extreme range sample 36. case 644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0644', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0644 begin');
      expect(MathUtils.clamp(1035001, -1035000, 1035000)).assertEqual(1035000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0644 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0645
     * @tc.name      testPhotosMathEdge0645
     * @tc.desc      Clamps extreme range sample 37. case 645
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0645', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0645 begin');
      expect(MathUtils.clamp(-1036000, -1036000, 1036000)).assertEqual(-1036000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0645 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0646
     * @tc.name      testPhotosMathEdge0646
     * @tc.desc      Clamps extreme range sample 37. case 646
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0646', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0646 begin');
      expect(MathUtils.clamp(0, -1036000, 1036000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0646 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0647
     * @tc.name      testPhotosMathEdge0647
     * @tc.desc      Clamps extreme range sample 37. case 647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0647', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0647 begin');
      expect(MathUtils.clamp(1036000, -1036000, 1036000)).assertEqual(1036000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0647 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0648
     * @tc.name      testPhotosMathEdge0648
     * @tc.desc      Clamps extreme range sample 37. case 648
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0648', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0648 begin');
      expect(MathUtils.clamp(1036001, -1036000, 1036000)).assertEqual(1036000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0648 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0649
     * @tc.name      testPhotosMathEdge0649
     * @tc.desc      Clamps extreme range sample 38. case 649
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0649', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0649 begin');
      expect(MathUtils.clamp(-1037000, -1037000, 1037000)).assertEqual(-1037000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0649 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0650
     * @tc.name      testPhotosMathEdge0650
     * @tc.desc      Clamps extreme range sample 38. case 650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0650', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0650 begin');
      expect(MathUtils.clamp(0, -1037000, 1037000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0650 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0651
     * @tc.name      testPhotosMathEdge0651
     * @tc.desc      Clamps extreme range sample 38. case 651
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0651', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0651 begin');
      expect(MathUtils.clamp(1037000, -1037000, 1037000)).assertEqual(1037000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0651 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0652
     * @tc.name      testPhotosMathEdge0652
     * @tc.desc      Clamps extreme range sample 38. case 652
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0652', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0652 begin');
      expect(MathUtils.clamp(1037001, -1037000, 1037000)).assertEqual(1037000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0652 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0653
     * @tc.name      testPhotosMathEdge0653
     * @tc.desc      Clamps extreme range sample 39. case 653
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0653', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0653 begin');
      expect(MathUtils.clamp(-1038000, -1038000, 1038000)).assertEqual(-1038000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0653 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0654
     * @tc.name      testPhotosMathEdge0654
     * @tc.desc      Clamps extreme range sample 39. case 654
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0654', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0654 begin');
      expect(MathUtils.clamp(0, -1038000, 1038000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0654 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0655
     * @tc.name      testPhotosMathEdge0655
     * @tc.desc      Clamps extreme range sample 39. case 655
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0655', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0655 begin');
      expect(MathUtils.clamp(1038000, -1038000, 1038000)).assertEqual(1038000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0655 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0656
     * @tc.name      testPhotosMathEdge0656
     * @tc.desc      Clamps extreme range sample 39. case 656
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0656', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0656 begin');
      expect(MathUtils.clamp(1038001, -1038000, 1038000)).assertEqual(1038000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0656 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0657
     * @tc.name      testPhotosMathEdge0657
     * @tc.desc      Clamps extreme range sample 40. case 657
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0657', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0657 begin');
      expect(MathUtils.clamp(-1039000, -1039000, 1039000)).assertEqual(-1039000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0657 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0658
     * @tc.name      testPhotosMathEdge0658
     * @tc.desc      Clamps extreme range sample 40. case 658
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0658', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0658 begin');
      expect(MathUtils.clamp(0, -1039000, 1039000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0658 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0659
     * @tc.name      testPhotosMathEdge0659
     * @tc.desc      Clamps extreme range sample 40. case 659
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0659', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0659 begin');
      expect(MathUtils.clamp(1039000, -1039000, 1039000)).assertEqual(1039000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0659 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0660
     * @tc.name      testPhotosMathEdge0660
     * @tc.desc      Clamps extreme range sample 40. case 660
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0660', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0660 begin');
      expect(MathUtils.clamp(1039001, -1039000, 1039000)).assertEqual(1039000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0660 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0661
     * @tc.name      testPhotosMathEdge0661
     * @tc.desc      Clamps extreme range sample 41. case 661
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0661', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0661 begin');
      expect(MathUtils.clamp(-1040000, -1040000, 1040000)).assertEqual(-1040000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0661 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0662
     * @tc.name      testPhotosMathEdge0662
     * @tc.desc      Clamps extreme range sample 41. case 662
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0662', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0662 begin');
      expect(MathUtils.clamp(0, -1040000, 1040000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0662 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0663
     * @tc.name      testPhotosMathEdge0663
     * @tc.desc      Clamps extreme range sample 41. case 663
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0663', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0663 begin');
      expect(MathUtils.clamp(1040000, -1040000, 1040000)).assertEqual(1040000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0663 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0664
     * @tc.name      testPhotosMathEdge0664
     * @tc.desc      Clamps extreme range sample 41. case 664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0664', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0664 begin');
      expect(MathUtils.clamp(1040001, -1040000, 1040000)).assertEqual(1040000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0664 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0665
     * @tc.name      testPhotosMathEdge0665
     * @tc.desc      Clamps extreme range sample 42. case 665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0665', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0665 begin');
      expect(MathUtils.clamp(-1041000, -1041000, 1041000)).assertEqual(-1041000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0665 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0666
     * @tc.name      testPhotosMathEdge0666
     * @tc.desc      Clamps extreme range sample 42. case 666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0666', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0666 begin');
      expect(MathUtils.clamp(0, -1041000, 1041000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0666 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0667
     * @tc.name      testPhotosMathEdge0667
     * @tc.desc      Clamps extreme range sample 42. case 667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0667', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0667 begin');
      expect(MathUtils.clamp(1041000, -1041000, 1041000)).assertEqual(1041000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0667 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0668
     * @tc.name      testPhotosMathEdge0668
     * @tc.desc      Clamps extreme range sample 42. case 668
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0668', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0668 begin');
      expect(MathUtils.clamp(1041001, -1041000, 1041000)).assertEqual(1041000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0668 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0669
     * @tc.name      testPhotosMathEdge0669
     * @tc.desc      Clamps extreme range sample 43. case 669
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0669', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0669 begin');
      expect(MathUtils.clamp(-1042000, -1042000, 1042000)).assertEqual(-1042000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0669 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0670
     * @tc.name      testPhotosMathEdge0670
     * @tc.desc      Clamps extreme range sample 43. case 670
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0670', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0670 begin');
      expect(MathUtils.clamp(0, -1042000, 1042000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0670 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0671
     * @tc.name      testPhotosMathEdge0671
     * @tc.desc      Clamps extreme range sample 43. case 671
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0671', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0671 begin');
      expect(MathUtils.clamp(1042000, -1042000, 1042000)).assertEqual(1042000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0671 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0672
     * @tc.name      testPhotosMathEdge0672
     * @tc.desc      Clamps extreme range sample 43. case 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0672', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0672 begin');
      expect(MathUtils.clamp(1042001, -1042000, 1042000)).assertEqual(1042000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0672 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0673
     * @tc.name      testPhotosMathEdge0673
     * @tc.desc      Clamps extreme range sample 44. case 673
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0673', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0673 begin');
      expect(MathUtils.clamp(-1043000, -1043000, 1043000)).assertEqual(-1043000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0673 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0674
     * @tc.name      testPhotosMathEdge0674
     * @tc.desc      Clamps extreme range sample 44. case 674
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0674', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0674 begin');
      expect(MathUtils.clamp(0, -1043000, 1043000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0674 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0675
     * @tc.name      testPhotosMathEdge0675
     * @tc.desc      Clamps extreme range sample 44. case 675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0675', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0675 begin');
      expect(MathUtils.clamp(1043000, -1043000, 1043000)).assertEqual(1043000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0675 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0676
     * @tc.name      testPhotosMathEdge0676
     * @tc.desc      Clamps extreme range sample 44. case 676
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0676', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0676 begin');
      expect(MathUtils.clamp(1043001, -1043000, 1043000)).assertEqual(1043000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0676 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0677
     * @tc.name      testPhotosMathEdge0677
     * @tc.desc      Clamps extreme range sample 45. case 677
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0677', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0677 begin');
      expect(MathUtils.clamp(-1044000, -1044000, 1044000)).assertEqual(-1044000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0677 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0678
     * @tc.name      testPhotosMathEdge0678
     * @tc.desc      Clamps extreme range sample 45. case 678
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0678', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0678 begin');
      expect(MathUtils.clamp(0, -1044000, 1044000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0678 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0679
     * @tc.name      testPhotosMathEdge0679
     * @tc.desc      Clamps extreme range sample 45. case 679
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0679', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0679 begin');
      expect(MathUtils.clamp(1044000, -1044000, 1044000)).assertEqual(1044000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0679 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0680
     * @tc.name      testPhotosMathEdge0680
     * @tc.desc      Clamps extreme range sample 45. case 680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0680', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0680 begin');
      expect(MathUtils.clamp(1044001, -1044000, 1044000)).assertEqual(1044000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0680 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0681
     * @tc.name      testPhotosMathEdge0681
     * @tc.desc      Clamps extreme range sample 46. case 681
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0681', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0681 begin');
      expect(MathUtils.clamp(-1045000, -1045000, 1045000)).assertEqual(-1045000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0681 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0682
     * @tc.name      testPhotosMathEdge0682
     * @tc.desc      Clamps extreme range sample 46. case 682
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0682', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0682 begin');
      expect(MathUtils.clamp(0, -1045000, 1045000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0682 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0683
     * @tc.name      testPhotosMathEdge0683
     * @tc.desc      Clamps extreme range sample 46. case 683
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0683', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0683 begin');
      expect(MathUtils.clamp(1045000, -1045000, 1045000)).assertEqual(1045000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0683 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0684
     * @tc.name      testPhotosMathEdge0684
     * @tc.desc      Clamps extreme range sample 46. case 684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0684', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0684 begin');
      expect(MathUtils.clamp(1045001, -1045000, 1045000)).assertEqual(1045000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0684 end');
    })


    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0685
     * @tc.name      testPhotosMathEdge0685
     * @tc.desc      Clamps extreme range sample 47. case 685
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0685', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0685 begin');
      expect(MathUtils.clamp(-1046000, -1046000, 1046000)).assertEqual(-1046000);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0685 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0686
     * @tc.name      testPhotosMathEdge0686
     * @tc.desc      Clamps extreme range sample 47. case 686
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathEdge0686', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0686 begin');
      expect(MathUtils.clamp(0, -1046000, 1046000)).assertEqual(0);
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathEdge0686 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_EDGE_0687
     * @tc.name      testPhotosMathEdge0687
     * @tc.desc      Clamps extreme range sample 47. case 687
     * @tc.type      FUNCTION
