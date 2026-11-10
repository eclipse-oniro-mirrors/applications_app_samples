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
