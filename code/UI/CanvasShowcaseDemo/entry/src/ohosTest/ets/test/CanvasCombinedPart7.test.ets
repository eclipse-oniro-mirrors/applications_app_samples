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
import { ColorUtil, ColorRgba, GradientPreset } from '../../../main/ets/model/utils/ColorUtil';
import { GeometryUtil, Point } from '../../../main/ets/model/utils/GeometryUtil';
import { LogUtil, LogLevel } from '../../../main/ets/model/utils/LogUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_CanvasShowcase]';

export default function CanvasCombinedPart7Test(): void {
  describe('CvG7', () => {
    /**
     * @tc.number    SUB_CANVAS_GRGP1_3300
     * @tc.name      testRectGrid0033
     * @tc.desc      Verify rectContains(0,0,10,5) point 16,18. Plus Verify rectContains(0,0,10,5) point 8,9. Plus Verify rectContains(10,20,30,40) point 0,0. Plus Verify rectContains(10,20,30,40) point 10,5. Plus Verify rectContains(10,20,30,40) point -1,0. Plus Verify rectContains(10,20,30,40) point 5,5. Plus Verify rectContains(10,20,30,40) point 11,5. Plus Verify rectContains(10,20,30,40) point 10,6. Plus Verify rectContains(10,20,30,40) point 10,0. Plus Verify rectContains(10,20,30,40) point 15,25. Plus Verify rectContains(10,20,30,40) point -5,-5. Plus Verify rectContains(10,20,30,40) point 5,0. Plus Verify rectContains(10,20,30,40) point 100,100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0033 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 16, 18)).assertEqual(false);
      {
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 8, 9)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 0, 0)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 10, 5)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(10, 20, 30, 40, -1, 0)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 5, 5)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 11, 5)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 10, 6)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 10, 0)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 15, 25)).assertEqual(true);
      }
      {
      expect(GeometryUtil.rectContains(10, 20, 30, 40, -5, -5)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 5, 0)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 100, 100)).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0033 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_4600
     * @tc.name      testRectGrid0046
     * @tc.desc      Verify rectContains(10,20,30,40) point 101,101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0046 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 101, 101)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0046 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_4700
     * @tc.name      testRectGrid0047
     * @tc.desc      Verify rectContains(10,20,30,40) point 20,30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0047 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 20, 30)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0047 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_4800
     * @tc.name      testRectGrid0048
     * @tc.desc      Verify rectContains(10,20,30,40) point 70,90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0048 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 70, 90)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0048 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_4900
     * @tc.name      testRectGrid0049
     * @tc.desc      Verify rectContains(10,20,30,40) point -20,-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0049 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 30, 40, -20, -30)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0049 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_5000
     * @tc.name      testRectGrid0050
     * @tc.desc      Verify rectContains(10,20,30,40) point 0,20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0050 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 0, 20)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0050 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_5100
     * @tc.name      testRectGrid0051
     * @tc.desc      Verify rectContains(10,20,30,40) point 60,10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0051 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 60, 10)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0051 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_5200
     * @tc.name      testRectGrid0052
     * @tc.desc      Verify rectContains(10,20,30,40) point 7,8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0052 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 7, 8)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0052 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_5300
     * @tc.name      testRectGrid0053
     * @tc.desc      Verify rectContains(10,20,30,40) point 16,18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0053 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 16, 18)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0053 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_5400
     * @tc.name      testRectGrid0054
     * @tc.desc      Verify rectContains(10,20,30,40) point 8,9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0054 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(10, 20, 30, 40, 8, 9)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0054 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_5500
     * @tc.name      testRectGrid0055
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 0,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0055 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 0, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0055 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_5600
     * @tc.name      testRectGrid0056
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 10,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0056 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 10, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0056 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_5700
     * @tc.name      testRectGrid0057
     * @tc.desc      Verify rectContains(-5,-5,10,10) point -1,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0057 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, -1, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0057 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_5800
     * @tc.name      testRectGrid0058
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 5,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0058 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 5, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0058 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_5900
     * @tc.name      testRectGrid0059
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 11,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0059 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 11, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0059 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_6000
     * @tc.name      testRectGrid0060
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 10,6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0060 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 10, 6)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0060 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_6100
     * @tc.name      testRectGrid0061
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 10,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0061 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 10, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0061 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_6200
     * @tc.name      testRectGrid0062
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 15,25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0062 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 15, 25)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0062 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_6300
     * @tc.name      testRectGrid0063
     * @tc.desc      Verify rectContains(-5,-5,10,10) point -5,-5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0063 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, -5, -5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0063 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_6400
     * @tc.name      testRectGrid0064
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 5,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0064 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 5, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0064 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_6500
     * @tc.name      testRectGrid0065
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 100,100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0065 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 100, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0065 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_6600
     * @tc.name      testRectGrid0066
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 101,101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0066 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 101, 101)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0066 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_6700
     * @tc.name      testRectGrid0067
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 20,30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0067 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 20, 30)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0067 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_6800
     * @tc.name      testRectGrid0068
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 70,90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0068 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 70, 90)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0068 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_6900
     * @tc.name      testRectGrid0069
     * @tc.desc      Verify rectContains(-5,-5,10,10) point -20,-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0069 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, -20, -30)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0069 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_7000
     * @tc.name      testRectGrid0070
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 0,20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0070 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 0, 20)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0070 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_7100
     * @tc.name      testRectGrid0071
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 60,10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0071 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 60, 10)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0071 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_7200
     * @tc.name      testRectGrid0072
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 7,8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0072 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 7, 8)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0072 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_7300
     * @tc.name      testRectGrid0073
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 16,18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0073 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 16, 18)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0073 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_7400
     * @tc.name      testRectGrid0074
     * @tc.desc      Verify rectContains(-5,-5,10,10) point 8,9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0074 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-5, -5, 10, 10, 8, 9)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0074 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_7500
     * @tc.name      testRectGrid0075
     * @tc.desc      Verify rectContains(100,100,0,0) point 0,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0075 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 0, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0075 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_7600
     * @tc.name      testRectGrid0076
     * @tc.desc      Verify rectContains(100,100,0,0) point 10,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0076 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 10, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0076 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_7700
     * @tc.name      testRectGrid0077
     * @tc.desc      Verify rectContains(100,100,0,0) point -1,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0077 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, -1, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0077 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_7800
     * @tc.name      testRectGrid0078
     * @tc.desc      Verify rectContains(100,100,0,0) point 5,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0078 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 5, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0078 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_7900
     * @tc.name      testRectGrid0079
     * @tc.desc      Verify rectContains(100,100,0,0) point 11,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0079 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 11, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0079 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP2_8000
     * @tc.name      testRectGrid0080
     * @tc.desc      Verify rectContains(100,100,0,0) point 10,6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0080 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 10, 6)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0080 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_8100
     * @tc.name      testRectGrid0081
     * @tc.desc      Verify rectContains(100,100,0,0) point 10,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0081 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 10, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0081 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_8200
     * @tc.name      testRectGrid0082
     * @tc.desc      Verify rectContains(100,100,0,0) point 15,25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0082 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 15, 25)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0082 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_8300
     * @tc.name      testRectGrid0083
     * @tc.desc      Verify rectContains(100,100,0,0) point -5,-5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0083 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, -5, -5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0083 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_8400
     * @tc.name      testRectGrid0084
     * @tc.desc      Verify rectContains(100,100,0,0) point 5,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0084 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 5, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0084 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_8500
     * @tc.name      testRectGrid0085
     * @tc.desc      Verify rectContains(100,100,0,0) point 100,100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0085 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 100, 100)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0085 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_8600
     * @tc.name      testRectGrid0086
     * @tc.desc      Verify rectContains(100,100,0,0) point 101,101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0086 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 101, 101)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0086 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_8700
     * @tc.name      testRectGrid0087
     * @tc.desc      Verify rectContains(100,100,0,0) point 20,30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0087 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 20, 30)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0087 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_8800
     * @tc.name      testRectGrid0088
     * @tc.desc      Verify rectContains(100,100,0,0) point 70,90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0088 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 70, 90)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0088 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_8900
     * @tc.name      testRectGrid0089
     * @tc.desc      Verify rectContains(100,100,0,0) point -20,-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0089 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, -20, -30)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0089 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_9000
     * @tc.name      testRectGrid0090
     * @tc.desc      Verify rectContains(100,100,0,0) point 0,20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0090 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 0, 20)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0090 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_9100
     * @tc.name      testRectGrid0091
     * @tc.desc      Verify rectContains(100,100,0,0) point 60,10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0091 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 60, 10)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0091 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_9200
     * @tc.name      testRectGrid0092
     * @tc.desc      Verify rectContains(100,100,0,0) point 7,8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0092 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 7, 8)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0092 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_9300
     * @tc.name      testRectGrid0093
     * @tc.desc      Verify rectContains(100,100,0,0) point 16,18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0093 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 16, 18)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0093 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_9400
     * @tc.name      testRectGrid0094
     * @tc.desc      Verify rectContains(100,100,0,0) point 8,9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0094 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(100, 100, 0, 0, 8, 9)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0094 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_9500
     * @tc.name      testRectGrid0095
     * @tc.desc      Verify rectContains(3,4,5,6) point 0,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0095 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 0, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0095 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_9600
     * @tc.name      testRectGrid0096
     * @tc.desc      Verify rectContains(3,4,5,6) point 10,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0096 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 10, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0096 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_9700
     * @tc.name      testRectGrid0097
     * @tc.desc      Verify rectContains(3,4,5,6) point -1,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0097 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, -1, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0097 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_9800
     * @tc.name      testRectGrid0098
     * @tc.desc      Verify rectContains(3,4,5,6) point 5,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0098 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 5, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0098 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_9900
     * @tc.name      testRectGrid0099
     * @tc.desc      Verify rectContains(3,4,5,6) point 11,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0099 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 11, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0099 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_10000
     * @tc.name      testRectGrid0100
     * @tc.desc      Verify rectContains(3,4,5,6) point 10,6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0100 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 10, 6)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0100 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_10100
     * @tc.name      testRectGrid0101
     * @tc.desc      Verify rectContains(3,4,5,6) point 10,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0101 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 10, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0101 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_10200
     * @tc.name      testRectGrid0102
     * @tc.desc      Verify rectContains(3,4,5,6) point 15,25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0102 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 15, 25)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0102 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_10300
     * @tc.name      testRectGrid0103
     * @tc.desc      Verify rectContains(3,4,5,6) point -5,-5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0103 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, -5, -5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0103 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_10400
     * @tc.name      testRectGrid0104
     * @tc.desc      Verify rectContains(3,4,5,6) point 5,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0104 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 5, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0104 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_10500
     * @tc.name      testRectGrid0105
     * @tc.desc      Verify rectContains(3,4,5,6) point 100,100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0105 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 100, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0105 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_10600
     * @tc.name      testRectGrid0106
     * @tc.desc      Verify rectContains(3,4,5,6) point 101,101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0106 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 101, 101)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0106 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_10700
     * @tc.name      testRectGrid0107
     * @tc.desc      Verify rectContains(3,4,5,6) point 20,30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0107 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 20, 30)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0107 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_10800
     * @tc.name      testRectGrid0108
     * @tc.desc      Verify rectContains(3,4,5,6) point 70,90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0108 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 70, 90)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0108 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_10900
     * @tc.name      testRectGrid0109
     * @tc.desc      Verify rectContains(3,4,5,6) point -20,-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0109 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, -20, -30)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0109 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_11000
     * @tc.name      testRectGrid0110
     * @tc.desc      Verify rectContains(3,4,5,6) point 0,20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0110 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 0, 20)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0110 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_11100
     * @tc.name      testRectGrid0111
     * @tc.desc      Verify rectContains(3,4,5,6) point 60,10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0111 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 60, 10)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0111 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_11200
     * @tc.name      testRectGrid0112
     * @tc.desc      Verify rectContains(3,4,5,6) point 7,8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0112 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 7, 8)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0112 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_11300
     * @tc.name      testRectGrid0113
     * @tc.desc      Verify rectContains(3,4,5,6) point 16,18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0113 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 16, 18)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0113 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_11400
     * @tc.name      testRectGrid0114
     * @tc.desc      Verify rectContains(3,4,5,6) point 8,9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0114 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(3, 4, 5, 6, 8, 9)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0114 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_11500
     * @tc.name      testRectGrid0115
     * @tc.desc      Verify rectContains(20,30,50,60) point 0,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0115 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 0, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0115 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_11600
     * @tc.name      testRectGrid0116
     * @tc.desc      Verify rectContains(20,30,50,60) point 10,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0116 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 10, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0116 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_11700
     * @tc.name      testRectGrid0117
     * @tc.desc      Verify rectContains(20,30,50,60) point -1,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0117 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, -1, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0117 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_11800
     * @tc.name      testRectGrid0118
     * @tc.desc      Verify rectContains(20,30,50,60) point 5,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0118 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 5, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0118 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_11900
     * @tc.name      testRectGrid0119
     * @tc.desc      Verify rectContains(20,30,50,60) point 11,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0119 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 11, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0119 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP3_12000
     * @tc.name      testRectGrid0120
     * @tc.desc      Verify rectContains(20,30,50,60) point 10,6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0120 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 10, 6)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0120 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_12100
     * @tc.name      testRectGrid0121
     * @tc.desc      Verify rectContains(20,30,50,60) point 10,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0121 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 10, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0121 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_12200
     * @tc.name      testRectGrid0122
     * @tc.desc      Verify rectContains(20,30,50,60) point 15,25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0122 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 15, 25)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0122 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_12300
     * @tc.name      testRectGrid0123
     * @tc.desc      Verify rectContains(20,30,50,60) point -5,-5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0123 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, -5, -5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0123 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_12400
     * @tc.name      testRectGrid0124
     * @tc.desc      Verify rectContains(20,30,50,60) point 5,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0124 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 5, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0124 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_12500
     * @tc.name      testRectGrid0125
     * @tc.desc      Verify rectContains(20,30,50,60) point 100,100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0125 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 100, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0125 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_12600
     * @tc.name      testRectGrid0126
     * @tc.desc      Verify rectContains(20,30,50,60) point 101,101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0126 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 101, 101)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0126 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_12700
     * @tc.name      testRectGrid0127
     * @tc.desc      Verify rectContains(20,30,50,60) point 20,30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0127 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 20, 30)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0127 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_12800
     * @tc.name      testRectGrid0128
     * @tc.desc      Verify rectContains(20,30,50,60) point 70,90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0128 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 70, 90)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0128 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_12900
     * @tc.name      testRectGrid0129
     * @tc.desc      Verify rectContains(20,30,50,60) point -20,-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0129 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, -20, -30)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0129 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_13000
     * @tc.name      testRectGrid0130
     * @tc.desc      Verify rectContains(20,30,50,60) point 0,20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0130 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 0, 20)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0130 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_13100
     * @tc.name      testRectGrid0131
     * @tc.desc      Verify rectContains(20,30,50,60) point 60,10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0131 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 60, 10)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0131 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_13200
     * @tc.name      testRectGrid0132
     * @tc.desc      Verify rectContains(20,30,50,60) point 7,8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0132 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 7, 8)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0132 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_13300
     * @tc.name      testRectGrid0133
     * @tc.desc      Verify rectContains(20,30,50,60) point 16,18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0133 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 16, 18)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0133 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_13400
     * @tc.name      testRectGrid0134
     * @tc.desc      Verify rectContains(20,30,50,60) point 8,9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0134 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(20, 30, 50, 60, 8, 9)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0134 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_13500
     * @tc.name      testRectGrid0135
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 0,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0135 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 0, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0135 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_13600
     * @tc.name      testRectGrid0136
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 10,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0136 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 10, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0136 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_13700
     * @tc.name      testRectGrid0137
     * @tc.desc      Verify rectContains(-20,-30,40,50) point -1,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0137 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, -1, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0137 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_13800
     * @tc.name      testRectGrid0138
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 5,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0138 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 5, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0138 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_13900
     * @tc.name      testRectGrid0139
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 11,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0139 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 11, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0139 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_14000
     * @tc.name      testRectGrid0140
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 10,6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0140 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 10, 6)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0140 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_14100
     * @tc.name      testRectGrid0141
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 10,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0141 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 10, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0141 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_14200
     * @tc.name      testRectGrid0142
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 15,25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0142 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 15, 25)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0142 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_14300
     * @tc.name      testRectGrid0143
     * @tc.desc      Verify rectContains(-20,-30,40,50) point -5,-5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0143 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, -5, -5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0143 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_14400
     * @tc.name      testRectGrid0144
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 5,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0144 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 5, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0144 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_14500
     * @tc.name      testRectGrid0145
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 100,100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0145 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 100, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0145 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_14600
     * @tc.name      testRectGrid0146
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 101,101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0146 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 101, 101)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0146 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_14700
     * @tc.name      testRectGrid0147
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 20,30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0147 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 20, 30)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0147 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_14800
     * @tc.name      testRectGrid0148
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 70,90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0148 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 70, 90)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0148 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_14900
     * @tc.name      testRectGrid0149
     * @tc.desc      Verify rectContains(-20,-30,40,50) point -20,-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0149 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, -20, -30)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0149 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_15000
     * @tc.name      testRectGrid0150
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 0,20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0150 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 0, 20)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0150 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_15100
     * @tc.name      testRectGrid0151
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 60,10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0151 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 60, 10)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0151 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_15200
     * @tc.name      testRectGrid0152
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 7,8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0152 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 7, 8)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0152 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_15300
     * @tc.name      testRectGrid0153
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 16,18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0153 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 16, 18)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0153 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_15400
     * @tc.name      testRectGrid0154
     * @tc.desc      Verify rectContains(-20,-30,40,50) point 8,9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0154 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(-20, -30, 40, 50, 8, 9)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0154 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_15500
     * @tc.name      testRectGrid0155
     * @tc.desc      Verify rectContains(7,8,9,10) point 0,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0155 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 0, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0155 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_15600
     * @tc.name      testRectGrid0156
     * @tc.desc      Verify rectContains(7,8,9,10) point 10,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0156 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 10, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0156 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_15700
     * @tc.name      testRectGrid0157
     * @tc.desc      Verify rectContains(7,8,9,10) point -1,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0157 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(7, 8, 9, 10, -1, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0157 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_15800
     * @tc.name      testRectGrid0158
     * @tc.desc      Verify rectContains(7,8,9,10) point 5,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0158 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 5, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0158 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_15900
     * @tc.name      testRectGrid0159
     * @tc.desc      Verify rectContains(7,8,9,10) point 11,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0159 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 11, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0159 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP4_16000
     * @tc.name      testRectGrid0160
     * @tc.desc      Verify rectContains(7,8,9,10) point 10,6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0160 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 10, 6)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0160 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP5_16100
     * @tc.name      testRectGrid0161
     * @tc.desc      Verify rectContains(7,8,9,10) point 10,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0161 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 10, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0161 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP5_16200
     * @tc.name      testRectGrid0162
     * @tc.desc      Verify rectContains(7,8,9,10) point 15,25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0162 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 15, 25)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0162 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP5_16300
     * @tc.name      testRectGrid0163
     * @tc.desc      Verify rectContains(7,8,9,10) point -5,-5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0163 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(7, 8, 9, 10, -5, -5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0163 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP5_16400
     * @tc.name      testRectGrid0164
     * @tc.desc      Verify rectContains(7,8,9,10) point 5,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0164 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 5, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0164 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP5_16500
     * @tc.name      testRectGrid0165
     * @tc.desc      Verify rectContains(7,8,9,10) point 100,100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0165 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 100, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0165 end');
    })

  })
}
