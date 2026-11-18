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

export default function CanvasCombinedPart3Test(): void {
  describe('CvG3', () => {
    /**
     * @tc.number    SUB_CANVAS_CLSP5_19100
     * @tc.name      testLerpStopsGrid0191
     * @tc.desc      Verify lerpHexStops set 2 at t=0.9. Plus Verify lerpHexStops set 2 at t=1. Plus Verify lerpHexStops set 2 at t=-0.2. Plus Verify lerpHexStops set 2 at t=1.2. Plus Verify lerpHexStops set 3 at t=0. Plus Verify lerpHexStops set 3 at t=0.1. Plus Verify lerpHexStops set 3 at t=0.25. Plus Verify lerpHexStops set 3 at t=0.5. Plus Verify lerpHexStops set 3 at t=0.75. Plus Verify lerpHexStops set 3 at t=0.9. Plus Verify lerpHexStops set 3 at t=1. Plus Verify lerpHexStops set 3 at t=-0.2. Plus Verify lerpHexStops set 3 at t=1.2. Plus Verify lerpHexStops set 4 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0191 begin');
      await delayTick();
      const colors: string[] = ['#FF0000', '#00FF00', '#0000FF'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(0,51,204,1)');
      {
      const colors: string[] = ['#FF0000', '#00FF00', '#0000FF'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(0,0,255,1)');
      }
      {
      const colors: string[] = ['#FF0000', '#00FF00', '#0000FF'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(255,0,0,1)');
      }
      {
      const colors: string[] = ['#FF0000', '#00FF00', '#0000FF'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(0,0,255,1)');
      }
      {
      const colors: string[] = ['#0D47A1', '#1976D2', '#64B5F6', '#BBDEFB'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(13,71,161,1)');
      }
      {
      const colors: string[] = ['#0D47A1', '#1976D2', '#64B5F6', '#BBDEFB'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(17,85,176,1)');
      }
      {
      const colors: string[] = ['#0D47A1', '#1976D2', '#64B5F6', '#BBDEFB'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(22,106,198,1)');
      }
      {
      const colors: string[] = ['#0D47A1', '#1976D2', '#64B5F6', '#BBDEFB'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(63,150,228,1)');
      }
      {
      const colors: string[] = ['#0D47A1', '#1976D2', '#64B5F6', '#BBDEFB'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(122,191,247,1)');
      }
      {
      const colors: string[] = ['#0D47A1', '#1976D2', '#64B5F6', '#BBDEFB'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(161,210,250,1)');
      }
      {
      const colors: string[] = ['#0D47A1', '#1976D2', '#64B5F6', '#BBDEFB'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(187,222,251,1)');
      }
      {
      const colors: string[] = ['#0D47A1', '#1976D2', '#64B5F6', '#BBDEFB'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(13,71,161,1)');
      }
      {
      const colors: string[] = ['#0D47A1', '#1976D2', '#64B5F6', '#BBDEFB'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(187,222,251,1)');
      }
      {
      const colors: string[] = ['#FF1744', '#FF6D00', '#FFD600', '#FFF59D'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(255,23,68,1)');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0191 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_20500
     * @tc.name      testLerpStopsGrid0205
     * @tc.desc      Verify lerpHexStops set 4 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0205 begin');
      await delayTick();
      const colors: string[] = ['#FF1744', '#FF6D00', '#FFD600', '#FFF59D'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(255,49,48,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0205 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_20600
     * @tc.name      testLerpStopsGrid0206
     * @tc.desc      Verify lerpHexStops set 4 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0206 begin');
      await delayTick();
      const colors: string[] = ['#FF1744', '#FF6D00', '#FFD600', '#FFF59D'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(255,88,17,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0206 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_20700
     * @tc.name      testLerpStopsGrid0207
     * @tc.desc      Verify lerpHexStops set 4 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0207 begin');
      await delayTick();
      const colors: string[] = ['#FF1744', '#FF6D00', '#FFD600', '#FFF59D'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(255,162,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0207 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_20800
     * @tc.name      testLerpStopsGrid0208
     * @tc.desc      Verify lerpHexStops set 4 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0208 begin');
      await delayTick();
      const colors: string[] = ['#FF1744', '#FF6D00', '#FFD600', '#FFF59D'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(255,222,39,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0208 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_20900
     * @tc.name      testLerpStopsGrid0209
     * @tc.desc      Verify lerpHexStops set 4 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0209 begin');
      await delayTick();
      const colors: string[] = ['#FF1744', '#FF6D00', '#FFD600', '#FFF59D'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(255,236,110,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0209 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_21000
     * @tc.name      testLerpStopsGrid0210
     * @tc.desc      Verify lerpHexStops set 4 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0210 begin');
      await delayTick();
      const colors: string[] = ['#FF1744', '#FF6D00', '#FFD600', '#FFF59D'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(255,245,157,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0210 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_21100
     * @tc.name      testLerpStopsGrid0211
     * @tc.desc      Verify lerpHexStops set 4 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0211 begin');
      await delayTick();
      const colors: string[] = ['#FF1744', '#FF6D00', '#FFD600', '#FFF59D'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(255,23,68,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0211 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_21200
     * @tc.name      testLerpStopsGrid0212
     * @tc.desc      Verify lerpHexStops set 4 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0212 begin');
      await delayTick();
      const colors: string[] = ['#FF1744', '#FF6D00', '#FFD600', '#FFF59D'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(255,245,157,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0212 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_21300
     * @tc.name      testLerpStopsGrid0213
     * @tc.desc      Verify lerpHexStops set 5 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0213 begin');
      await delayTick();
      const colors: string[] = ['#004D40', '#00897B', '#4DB6AC', '#B2DFDB'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(0,77,64,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0213 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_21400
     * @tc.name      testLerpStopsGrid0214
     * @tc.desc      Verify lerpHexStops set 5 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0214 begin');
      await delayTick();
      const colors: string[] = ['#004D40', '#00897B', '#4DB6AC', '#B2DFDB'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(0,95,82,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0214 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_21500
     * @tc.name      testLerpStopsGrid0215
     * @tc.desc      Verify lerpHexStops set 5 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0215 begin');
      await delayTick();
      const colors: string[] = ['#004D40', '#00897B', '#4DB6AC', '#B2DFDB'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(0,122,108,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0215 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_21600
     * @tc.name      testLerpStopsGrid0216
     * @tc.desc      Verify lerpHexStops set 5 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0216 begin');
      await delayTick();
      const colors: string[] = ['#004D40', '#00897B', '#4DB6AC', '#B2DFDB'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(39,160,148,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0216 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_21700
     * @tc.name      testLerpStopsGrid0217
     * @tc.desc      Verify lerpHexStops set 5 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0217 begin');
      await delayTick();
      const colors: string[] = ['#004D40', '#00897B', '#4DB6AC', '#B2DFDB'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(102,192,184,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0217 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_21800
     * @tc.name      testLerpStopsGrid0218
     * @tc.desc      Verify lerpHexStops set 5 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0218 begin');
      await delayTick();
      const colors: string[] = ['#004D40', '#00897B', '#4DB6AC', '#B2DFDB'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(148,211,205,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0218 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_21900
     * @tc.name      testLerpStopsGrid0219
     * @tc.desc      Verify lerpHexStops set 5 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0219 begin');
      await delayTick();
      const colors: string[] = ['#004D40', '#00897B', '#4DB6AC', '#B2DFDB'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(178,223,219,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0219 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_22000
     * @tc.name      testLerpStopsGrid0220
     * @tc.desc      Verify lerpHexStops set 5 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0220 begin');
      await delayTick();
      const colors: string[] = ['#004D40', '#00897B', '#4DB6AC', '#B2DFDB'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(0,77,64,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0220 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_22100
     * @tc.name      testLerpStopsGrid0221
     * @tc.desc      Verify lerpHexStops set 5 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0221 begin');
      await delayTick();
      const colors: string[] = ['#004D40', '#00897B', '#4DB6AC', '#B2DFDB'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(178,223,219,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0221 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_22200
     * @tc.name      testLerpStopsGrid0222
     * @tc.desc      Verify lerpHexStops set 6 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0222 begin');
      await delayTick();
      const colors: string[] = ['#1B5E20', '#43A047', '#9CCC65', '#DCEDC8'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(27,94,32,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0222 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_22300
     * @tc.name      testLerpStopsGrid0223
     * @tc.desc      Verify lerpHexStops set 6 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0223 begin');
      await delayTick();
      const colors: string[] = ['#1B5E20', '#43A047', '#9CCC65', '#DCEDC8'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(39,114,44,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0223 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_22400
     * @tc.name      testLerpStopsGrid0224
     * @tc.desc      Verify lerpHexStops set 6 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0224 begin');
      await delayTick();
      const colors: string[] = ['#1B5E20', '#43A047', '#9CCC65', '#DCEDC8'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(57,144,61,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0224 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_22500
     * @tc.name      testLerpStopsGrid0225
     * @tc.desc      Verify lerpHexStops set 6 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0225 begin');
      await delayTick();
      const colors: string[] = ['#1B5E20', '#43A047', '#9CCC65', '#DCEDC8'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(112,182,86,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0225 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_22600
     * @tc.name      testLerpStopsGrid0226
     * @tc.desc      Verify lerpHexStops set 6 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0226 begin');
      await delayTick();
      const colors: string[] = ['#1B5E20', '#43A047', '#9CCC65', '#DCEDC8'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(172,212,126,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0226 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_22700
     * @tc.name      testLerpStopsGrid0227
     * @tc.desc      Verify lerpHexStops set 6 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0227 begin');
      await delayTick();
      const colors: string[] = ['#1B5E20', '#43A047', '#9CCC65', '#DCEDC8'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(201,227,170,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0227 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_22800
     * @tc.name      testLerpStopsGrid0228
     * @tc.desc      Verify lerpHexStops set 6 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0228 begin');
      await delayTick();
      const colors: string[] = ['#1B5E20', '#43A047', '#9CCC65', '#DCEDC8'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(220,237,200,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0228 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_22900
     * @tc.name      testLerpStopsGrid0229
     * @tc.desc      Verify lerpHexStops set 6 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0229 begin');
      await delayTick();
      const colors: string[] = ['#1B5E20', '#43A047', '#9CCC65', '#DCEDC8'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(27,94,32,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0229 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_23000
     * @tc.name      testLerpStopsGrid0230
     * @tc.desc      Verify lerpHexStops set 6 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0230 begin');
      await delayTick();
      const colors: string[] = ['#1B5E20', '#43A047', '#9CCC65', '#DCEDC8'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(220,237,200,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0230 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_23100
     * @tc.name      testLerpStopsGrid0231
     * @tc.desc      Verify lerpHexStops set 7 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0231 begin');
      await delayTick();
      const colors: string[] = ['#80112233', '#FF445566'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(17,34,51,0.5)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0231 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_23200
     * @tc.name      testLerpStopsGrid0232
     * @tc.desc      Verify lerpHexStops set 7 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0232 begin');
      await delayTick();
      const colors: string[] = ['#80112233', '#FF445566'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(22,39,56,0.55)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0232 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_23300
     * @tc.name      testLerpStopsGrid0233
     * @tc.desc      Verify lerpHexStops set 7 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0233 begin');
      await delayTick();
      const colors: string[] = ['#80112233', '#FF445566'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(30,47,64,0.63)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0233 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_23400
     * @tc.name      testLerpStopsGrid0234
     * @tc.desc      Verify lerpHexStops set 7 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0234 begin');
      await delayTick();
      const colors: string[] = ['#80112233', '#FF445566'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(43,60,77,0.75)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0234 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_23500
     * @tc.name      testLerpStopsGrid0235
     * @tc.desc      Verify lerpHexStops set 7 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0235 begin');
      await delayTick();
      const colors: string[] = ['#80112233', '#FF445566'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(55,72,89,0.87)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0235 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_23600
     * @tc.name      testLerpStopsGrid0236
     * @tc.desc      Verify lerpHexStops set 7 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0236 begin');
      await delayTick();
      const colors: string[] = ['#80112233', '#FF445566'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(63,80,97,0.95)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0236 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_23700
     * @tc.name      testLerpStopsGrid0237
     * @tc.desc      Verify lerpHexStops set 7 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0237 begin');
      await delayTick();
      const colors: string[] = ['#80112233', '#FF445566'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(68,85,102,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0237 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_23800
     * @tc.name      testLerpStopsGrid0238
     * @tc.desc      Verify lerpHexStops set 7 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0238 begin');
      await delayTick();
      const colors: string[] = ['#80112233', '#FF445566'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(17,34,51,0.5)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0238 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_23900
     * @tc.name      testLerpStopsGrid0239
     * @tc.desc      Verify lerpHexStops set 7 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0239 begin');
      await delayTick();
      const colors: string[] = ['#80112233', '#FF445566'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(68,85,102,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0239 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP6_24000
     * @tc.name      testLerpStopsGrid0240
     * @tc.desc      Verify lerpHexStops set 8 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0240 begin');
      await delayTick();
      const colors: string[] = ['#000000'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(0,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0240 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_24100
     * @tc.name      testLerpStopsGrid0241
     * @tc.desc      Verify lerpHexStops set 8 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0241 begin');
      await delayTick();
      const colors: string[] = ['#000000'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(0,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0241 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_24200
     * @tc.name      testLerpStopsGrid0242
     * @tc.desc      Verify lerpHexStops set 8 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0242 begin');
      await delayTick();
      const colors: string[] = ['#000000'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(0,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0242 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_24300
     * @tc.name      testLerpStopsGrid0243
     * @tc.desc      Verify lerpHexStops set 8 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0243 begin');
      await delayTick();
      const colors: string[] = ['#000000'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(0,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0243 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_24400
     * @tc.name      testLerpStopsGrid0244
     * @tc.desc      Verify lerpHexStops set 8 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0244 begin');
      await delayTick();
      const colors: string[] = ['#000000'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(0,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0244 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_24500
     * @tc.name      testLerpStopsGrid0245
     * @tc.desc      Verify lerpHexStops set 8 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0245 begin');
      await delayTick();
      const colors: string[] = ['#000000'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(0,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0245 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_24600
     * @tc.name      testLerpStopsGrid0246
     * @tc.desc      Verify lerpHexStops set 8 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0246 begin');
      await delayTick();
      const colors: string[] = ['#000000'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(0,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0246 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_24700
     * @tc.name      testLerpStopsGrid0247
     * @tc.desc      Verify lerpHexStops set 8 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0247 begin');
      await delayTick();
      const colors: string[] = ['#000000'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(0,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0247 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_24800
     * @tc.name      testLerpStopsGrid0248
     * @tc.desc      Verify lerpHexStops set 8 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0248 begin');
      await delayTick();
      const colors: string[] = ['#000000'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(0,0,0,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0248 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_24900
     * @tc.name      testLerpStopsGrid0249
     * @tc.desc      Verify lerpHexStops set 9 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0249 begin');
      await delayTick();
      const colors: string[] = [];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0249 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_25000
     * @tc.name      testLerpStopsGrid0250
     * @tc.desc      Verify lerpHexStops set 9 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0250 begin');
      await delayTick();
      const colors: string[] = [];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0250 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_25100
     * @tc.name      testLerpStopsGrid0251
     * @tc.desc      Verify lerpHexStops set 9 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0251 begin');
      await delayTick();
      const colors: string[] = [];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0251 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_25200
     * @tc.name      testLerpStopsGrid0252
     * @tc.desc      Verify lerpHexStops set 9 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0252 begin');
      await delayTick();
      const colors: string[] = [];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0252 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_25300
     * @tc.name      testLerpStopsGrid0253
     * @tc.desc      Verify lerpHexStops set 9 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0253 begin');
      await delayTick();
      const colors: string[] = [];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0253 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_25400
     * @tc.name      testLerpStopsGrid0254
     * @tc.desc      Verify lerpHexStops set 9 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0254 begin');
      await delayTick();
      const colors: string[] = [];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0254 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_25500
     * @tc.name      testLerpStopsGrid0255
     * @tc.desc      Verify lerpHexStops set 9 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0255 begin');
      await delayTick();
      const colors: string[] = [];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0255 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_25600
     * @tc.name      testLerpStopsGrid0256
     * @tc.desc      Verify lerpHexStops set 9 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0256 begin');
      await delayTick();
      const colors: string[] = [];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0256 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_25700
     * @tc.name      testLerpStopsGrid0257
     * @tc.desc      Verify lerpHexStops set 9 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0257 begin');
      await delayTick();
      const colors: string[] = [];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0257 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_25800
     * @tc.name      testLerpStopsGrid0258
     * @tc.desc      Verify lerpHexStops set 10 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0258 begin');
      await delayTick();
      const colors: string[] = ['#GGGGGG', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0258 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_25900
     * @tc.name      testLerpStopsGrid0259
     * @tc.desc      Verify lerpHexStops set 10 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0259 begin');
      await delayTick();
      const colors: string[] = ['#GGGGGG', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0259 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_26000
     * @tc.name      testLerpStopsGrid0260
     * @tc.desc      Verify lerpHexStops set 10 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0260 begin');
      await delayTick();
      const colors: string[] = ['#GGGGGG', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0260 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_26100
     * @tc.name      testLerpStopsGrid0261
     * @tc.desc      Verify lerpHexStops set 10 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0261 begin');
      await delayTick();
      const colors: string[] = ['#GGGGGG', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0261 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_26200
     * @tc.name      testLerpStopsGrid0262
     * @tc.desc      Verify lerpHexStops set 10 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0262 begin');
      await delayTick();
      const colors: string[] = ['#GGGGGG', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0262 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_26300
     * @tc.name      testLerpStopsGrid0263
     * @tc.desc      Verify lerpHexStops set 10 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0263 begin');
      await delayTick();
      const colors: string[] = ['#GGGGGG', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0263 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_26400
     * @tc.name      testLerpStopsGrid0264
     * @tc.desc      Verify lerpHexStops set 10 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0264 begin');
      await delayTick();
      const colors: string[] = ['#GGGGGG', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0264 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_26500
     * @tc.name      testLerpStopsGrid0265
     * @tc.desc      Verify lerpHexStops set 10 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0265 begin');
      await delayTick();
      const colors: string[] = ['#GGGGGG', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0265 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_26600
     * @tc.name      testLerpStopsGrid0266
     * @tc.desc      Verify lerpHexStops set 10 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0266 begin');
      await delayTick();
      const colors: string[] = ['#GGGGGG', '#FFFFFF'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0266 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_26700
     * @tc.name      testLerpStopsGrid0267
     * @tc.desc      Verify lerpHexStops set 11 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0267 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#BADBAD'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(18,52,86,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0267 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_26800
     * @tc.name      testLerpStopsGrid0268
     * @tc.desc      Verify lerpHexStops set 11 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0268 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#BADBAD'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(35,69,95,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0268 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_26900
     * @tc.name      testLerpStopsGrid0269
     * @tc.desc      Verify lerpHexStops set 11 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0269 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#BADBAD'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(60,94,108,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0269 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_27000
     * @tc.name      testLerpStopsGrid0270
     * @tc.desc      Verify lerpHexStops set 11 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0270 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#BADBAD'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(102,136,130,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0270 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_27100
     * @tc.name      testLerpStopsGrid0271
     * @tc.desc      Verify lerpHexStops set 11 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0271 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#BADBAD'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(144,177,151,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0271 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_27200
     * @tc.name      testLerpStopsGrid0272
     * @tc.desc      Verify lerpHexStops set 11 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0272 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#BADBAD'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(169,202,164,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0272 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_27300
     * @tc.name      testLerpStopsGrid0273
     * @tc.desc      Verify lerpHexStops set 11 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0273 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#BADBAD'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(186,219,173,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0273 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_27400
     * @tc.name      testLerpStopsGrid0274
     * @tc.desc      Verify lerpHexStops set 11 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0274 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#BADBAD'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(18,52,86,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0274 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_27500
     * @tc.name      testLerpStopsGrid0275
     * @tc.desc      Verify lerpHexStops set 11 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0275 begin');
      await delayTick();
      const colors: string[] = ['#123456', '#BADBAD'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(186,219,173,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0275 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_27600
     * @tc.name      testLerpStopsGrid0276
     * @tc.desc      Verify lerpHexStops set 12 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0276 begin');
      await delayTick();
      const colors: string[] = ['#102030', '#405060', '#708090'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(16,32,48,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0276 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_27700
     * @tc.name      testLerpStopsGrid0277
     * @tc.desc      Verify lerpHexStops set 12 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0277 begin');
      await delayTick();
      const colors: string[] = ['#102030', '#405060', '#708090'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(26,42,58,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0277 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_27800
     * @tc.name      testLerpStopsGrid0278
     * @tc.desc      Verify lerpHexStops set 12 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0278 begin');
      await delayTick();
      const colors: string[] = ['#102030', '#405060', '#708090'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(40,56,72,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0278 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_27900
     * @tc.name      testLerpStopsGrid0279
     * @tc.desc      Verify lerpHexStops set 12 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0279 begin');
      await delayTick();
      const colors: string[] = ['#102030', '#405060', '#708090'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(64,80,96,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0279 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP7_28000
     * @tc.name      testLerpStopsGrid0280
     * @tc.desc      Verify lerpHexStops set 12 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0280 begin');
      await delayTick();
      const colors: string[] = ['#102030', '#405060', '#708090'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(88,104,120,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0280 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_28100
     * @tc.name      testLerpStopsGrid0281
     * @tc.desc      Verify lerpHexStops set 12 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0281 begin');
      await delayTick();
      const colors: string[] = ['#102030', '#405060', '#708090'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(102,118,134,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0281 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_28200
     * @tc.name      testLerpStopsGrid0282
     * @tc.desc      Verify lerpHexStops set 12 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0282 begin');
      await delayTick();
      const colors: string[] = ['#102030', '#405060', '#708090'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(112,128,144,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0282 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_28300
     * @tc.name      testLerpStopsGrid0283
     * @tc.desc      Verify lerpHexStops set 12 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0283 begin');
      await delayTick();
      const colors: string[] = ['#102030', '#405060', '#708090'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(16,32,48,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0283 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_28400
     * @tc.name      testLerpStopsGrid0284
     * @tc.desc      Verify lerpHexStops set 12 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0284 begin');
      await delayTick();
      const colors: string[] = ['#102030', '#405060', '#708090'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(112,128,144,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0284 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_28500
     * @tc.name      testLerpStopsGrid0285
     * @tc.desc      Verify lerpHexStops set 13 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0285 begin');
      await delayTick();
      const colors: string[] = ['#AABBCC', '#DDEEFF'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(170,187,204,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0285 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_28600
     * @tc.name      testLerpStopsGrid0286
     * @tc.desc      Verify lerpHexStops set 13 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0286 begin');
      await delayTick();
      const colors: string[] = ['#AABBCC', '#DDEEFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(175,192,209,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0286 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_28700
     * @tc.name      testLerpStopsGrid0287
     * @tc.desc      Verify lerpHexStops set 13 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0287 begin');
      await delayTick();
      const colors: string[] = ['#AABBCC', '#DDEEFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(183,200,217,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0287 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_28800
     * @tc.name      testLerpStopsGrid0288
     * @tc.desc      Verify lerpHexStops set 13 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0288 begin');
      await delayTick();
      const colors: string[] = ['#AABBCC', '#DDEEFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(196,213,230,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0288 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_28900
     * @tc.name      testLerpStopsGrid0289
     * @tc.desc      Verify lerpHexStops set 13 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0289 begin');
      await delayTick();
      const colors: string[] = ['#AABBCC', '#DDEEFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(208,225,242,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0289 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_29000
     * @tc.name      testLerpStopsGrid0290
     * @tc.desc      Verify lerpHexStops set 13 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0290 begin');
      await delayTick();
      const colors: string[] = ['#AABBCC', '#DDEEFF'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(216,233,250,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0290 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_29100
     * @tc.name      testLerpStopsGrid0291
     * @tc.desc      Verify lerpHexStops set 13 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0291 begin');
      await delayTick();
      const colors: string[] = ['#AABBCC', '#DDEEFF'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(221,238,255,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0291 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_29200
     * @tc.name      testLerpStopsGrid0292
     * @tc.desc      Verify lerpHexStops set 13 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0292 begin');
      await delayTick();
      const colors: string[] = ['#AABBCC', '#DDEEFF'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(170,187,204,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0292 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_29300
     * @tc.name      testLerpStopsGrid0293
     * @tc.desc      Verify lerpHexStops set 13 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0293 begin');
      await delayTick();
      const colors: string[] = ['#AABBCC', '#DDEEFF'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(221,238,255,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0293 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_29400
     * @tc.name      testLerpStopsGrid0294
     * @tc.desc      Verify lerpHexStops set 14 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0294 begin');
      await delayTick();
      const colors: string[] = ['#010203', '#040506', '#070809', '#0A0B0C'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(1,2,3,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0294 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_29500
     * @tc.name      testLerpStopsGrid0295
     * @tc.desc      Verify lerpHexStops set 14 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0295 begin');
      await delayTick();
      const colors: string[] = ['#010203', '#040506', '#070809', '#0A0B0C'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(2,3,4,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0295 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_29600
     * @tc.name      testLerpStopsGrid0296
     * @tc.desc      Verify lerpHexStops set 14 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0296 begin');
      await delayTick();
      const colors: string[] = ['#010203', '#040506', '#070809', '#0A0B0C'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(3,4,5,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0296 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_29700
     * @tc.name      testLerpStopsGrid0297
     * @tc.desc      Verify lerpHexStops set 14 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0297 begin');
      await delayTick();
      const colors: string[] = ['#010203', '#040506', '#070809', '#0A0B0C'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(6,7,8,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0297 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_29800
     * @tc.name      testLerpStopsGrid0298
     * @tc.desc      Verify lerpHexStops set 14 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0298 begin');
      await delayTick();
      const colors: string[] = ['#010203', '#040506', '#070809', '#0A0B0C'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(8,9,10,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0298 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_29900
     * @tc.name      testLerpStopsGrid0299
     * @tc.desc      Verify lerpHexStops set 14 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0299 begin');
      await delayTick();
      const colors: string[] = ['#010203', '#040506', '#070809', '#0A0B0C'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(9,10,11,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0299 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_30000
     * @tc.name      testLerpStopsGrid0300
     * @tc.desc      Verify lerpHexStops set 14 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0300 begin');
      await delayTick();
      const colors: string[] = ['#010203', '#040506', '#070809', '#0A0B0C'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(10,11,12,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0300 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_30100
     * @tc.name      testLerpStopsGrid0301
     * @tc.desc      Verify lerpHexStops set 14 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0301 begin');
      await delayTick();
      const colors: string[] = ['#010203', '#040506', '#070809', '#0A0B0C'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(1,2,3,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0301 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_30200
     * @tc.name      testLerpStopsGrid0302
     * @tc.desc      Verify lerpHexStops set 14 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0302 begin');
      await delayTick();
      const colors: string[] = ['#010203', '#040506', '#070809', '#0A0B0C'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(10,11,12,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0302 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_30300
     * @tc.name      testLerpStopsGrid0303
     * @tc.desc      Verify lerpHexStops set 15 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0303 begin');
      await delayTick();
      const colors: string[] = ['#FEDCBA', '#987654', '#3210FE'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(254,220,186,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0303 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_30400
     * @tc.name      testLerpStopsGrid0304
     * @tc.desc      Verify lerpHexStops set 15 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0304 begin');
      await delayTick();
      const colors: string[] = ['#FEDCBA', '#987654', '#3210FE'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(234,200,166,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0304 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_30500
     * @tc.name      testLerpStopsGrid0305
     * @tc.desc      Verify lerpHexStops set 15 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0305 begin');
      await delayTick();
      const colors: string[] = ['#FEDCBA', '#987654', '#3210FE'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(203,169,135,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0305 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_30600
     * @tc.name      testLerpStopsGrid0306
     * @tc.desc      Verify lerpHexStops set 15 at t=0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0306 begin');
      await delayTick();
      const colors: string[] = ['#FEDCBA', '#987654', '#3210FE'];
      expect(ColorUtil.lerpHexStops(colors, 0.5)).assertEqual('rgba(152,118,84,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0306 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_30700
     * @tc.name      testLerpStopsGrid0307
     * @tc.desc      Verify lerpHexStops set 15 at t=0.75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0307 begin');
      await delayTick();
      const colors: string[] = ['#FEDCBA', '#987654', '#3210FE'];
      expect(ColorUtil.lerpHexStops(colors, 0.75)).assertEqual('rgba(101,67,169,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0307 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_30800
     * @tc.name      testLerpStopsGrid0308
     * @tc.desc      Verify lerpHexStops set 15 at t=0.9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0308 begin');
      await delayTick();
      const colors: string[] = ['#FEDCBA', '#987654', '#3210FE'];
      expect(ColorUtil.lerpHexStops(colors, 0.9)).assertEqual('rgba(70,36,220,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0308 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_30900
     * @tc.name      testLerpStopsGrid0309
     * @tc.desc      Verify lerpHexStops set 15 at t=1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0309 begin');
      await delayTick();
      const colors: string[] = ['#FEDCBA', '#987654', '#3210FE'];
      expect(ColorUtil.lerpHexStops(colors, 1)).assertEqual('rgba(50,16,254,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0309 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_31000
     * @tc.name      testLerpStopsGrid0310
     * @tc.desc      Verify lerpHexStops set 15 at t=-0.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0310 begin');
      await delayTick();
      const colors: string[] = ['#FEDCBA', '#987654', '#3210FE'];
      expect(ColorUtil.lerpHexStops(colors, -0.2)).assertEqual('rgba(254,220,186,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0310 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_31100
     * @tc.name      testLerpStopsGrid0311
     * @tc.desc      Verify lerpHexStops set 15 at t=1.2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0311 begin');
      await delayTick();
      const colors: string[] = ['#FEDCBA', '#987654', '#3210FE'];
      expect(ColorUtil.lerpHexStops(colors, 1.2)).assertEqual('rgba(50,16,254,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0311 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_31200
     * @tc.name      testLerpStopsGrid0312
     * @tc.desc      Verify lerpHexStops set 16 at t=0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0312 begin');
      await delayTick();
      const colors: string[] = ['#111111', '#222222', '#333333'];
      expect(ColorUtil.lerpHexStops(colors, 0)).assertEqual('rgba(17,17,17,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0312 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_31300
     * @tc.name      testLerpStopsGrid0313
     * @tc.desc      Verify lerpHexStops set 16 at t=0.1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0313 begin');
      await delayTick();
      const colors: string[] = ['#111111', '#222222', '#333333'];
      expect(ColorUtil.lerpHexStops(colors, 0.1)).assertEqual('rgba(20,20,20,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0313 end');
    })
    /**
     * @tc.number    SUB_CANVAS_CLSP8_31400
     * @tc.name      testLerpStopsGrid0314
     * @tc.desc      Verify lerpHexStops set 16 at t=0.25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLerpStopsGrid0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0314 begin');
      await delayTick();
      const colors: string[] = ['#111111', '#222222', '#333333'];
      expect(ColorUtil.lerpHexStops(colors, 0.25)).assertEqual('rgba(26,26,26,1)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLerpStopsGrid0314 end');
    })

  })
}
