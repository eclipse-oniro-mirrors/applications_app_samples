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

export default function CanvasCombinedPart6Test(): void {
  describe('CvG6', () => {
    /**
     * @tc.number    SUB_CANVAS_GCGP2_6800
     * @tc.name      testCircleRad0068
     * @tc.desc      Verify pointOnCircle 50,60 r=20 angle 60deg. Plus Verify pointOnCircle -15,25 r=5 angle 60deg. Plus Verify pointOnCircle 200,-50 r=12 angle 60deg. Plus Verify pointOnCircle 7,9 r=1 angle 60deg. Plus Verify pointOnCircle 320,240 r=100 angle 60deg. Plus Verify pointOnCircleDeg 100,100 angle 0. Plus Verify pointOnCircleDeg 10,20 angle 0. Plus Verify pointOnCircleDeg -40,80 angle 0. Plus Verify pointOnCircleDeg 0,0 angle 0. Plus Verify pointOnCircleDeg 100,100 angle 15. Plus Verify pointOnCircleDeg 10,20 angle 15. Plus Verify pointOnCircleDeg -40,80 angle 15. Plus Verify pointOnCircleDeg 0,0 angle 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleRad0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0068 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircle(50, 60, 20, 1.0471975511965976);
      expect(Math.abs(p.x - (60.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (77.32050807568876)) < 0.000001).assertTrue();
      {
      const p: Point = GeometryUtil.pointOnCircle(-15, 25, 5, 1.0471975511965976);
      expect(Math.abs(p.x - (-12.5)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (29.33012701892219)) < 0.000001).assertTrue();
      }
      {
      const p: Point = GeometryUtil.pointOnCircle(200, -50, 12, 1.0471975511965976);
      expect(Math.abs(p.x - (206.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-39.607695154586736)) < 0.000001).assertTrue();
      }
      {
      const p: Point = GeometryUtil.pointOnCircle(7, 9, 1, 1.0471975511965976);
      expect(Math.abs(p.x - (7.5)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (9.86602540378444)) < 0.000001).assertTrue();
      }
      {
      const p: Point = GeometryUtil.pointOnCircle(320, 240, 100, 1.0471975511965976);
      expect(Math.abs(p.x - (370.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (326.60254037844385)) < 0.000001).assertTrue();
      }
      {
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 0);
      expect(Math.abs(p.x - (125.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (100.0)) < 0.000001).assertTrue();
      }
      {
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 0);
      expect(Math.abs(p.x - (14.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (20.0)) < 0.000001).assertTrue();
      }
      {
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 0);
      expect(Math.abs(p.x - (-25.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (80.0)) < 0.000001).assertTrue();
      }
      {
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 0);
      expect(Math.abs(p.x - (1.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (0.0)) < 0.000001).assertTrue();
      }
      {
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 15);
      expect(Math.abs(p.x - (124.1481456572267)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (106.47047612756302)) < 0.000001).assertTrue();
      }
      {
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 15);
      expect(Math.abs(p.x - (13.863703305156273)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (21.035276180410083)) < 0.000001).assertTrue();
      }
      {
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 15);
      expect(Math.abs(p.x - (-25.511112605663975)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (83.8822856765378)) < 0.000001).assertTrue();
      }
      {
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 15);
      expect(Math.abs(p.x - (0.9659258262890683)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (0.25881904510252074)) < 0.000001).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleRad0068 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_8100
     * @tc.name      testCircleDeg0081
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0081 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 30);
      expect(Math.abs(p.x - (121.65063509461098)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (112.5)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0081 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_8200
     * @tc.name      testCircleDeg0082
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0082 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 30);
      expect(Math.abs(p.x - (13.464101615137755)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (22.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0082 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_8300
     * @tc.name      testCircleDeg0083
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0083 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 30);
      expect(Math.abs(p.x - (-27.00961894323342)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (87.5)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0083 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_8400
     * @tc.name      testCircleDeg0084
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0084 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 30);
      expect(Math.abs(p.x - (0.8660254037844387)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (0.49999999999999994)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0084 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_8500
     * @tc.name      testCircleDeg0085
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0085 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 45);
      expect(Math.abs(p.x - (117.67766952966369)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (117.67766952966369)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0085 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_8600
     * @tc.name      testCircleDeg0086
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0086 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 45);
      expect(Math.abs(p.x - (12.82842712474619)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (22.82842712474619)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0086 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_8700
     * @tc.name      testCircleDeg0087
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0087 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 45);
      expect(Math.abs(p.x - (-29.393398282201787)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (90.60660171779821)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0087 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_8800
     * @tc.name      testCircleDeg0088
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0088 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 45);
      expect(Math.abs(p.x - (0.7071067811865476)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (0.7071067811865476)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0088 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_8900
     * @tc.name      testCircleDeg0089
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0089 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 60);
      expect(Math.abs(p.x - (112.5)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (121.65063509461096)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0089 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_9000
     * @tc.name      testCircleDeg0090
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0090 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 60);
      expect(Math.abs(p.x - (12.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (23.464101615137753)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0090 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_9100
     * @tc.name      testCircleDeg0091
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0091 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 60);
      expect(Math.abs(p.x - (-32.5)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (92.99038105676658)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0091 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_9200
     * @tc.name      testCircleDeg0092
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0092 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 60);
      expect(Math.abs(p.x - (0.5000000000000001)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (0.8660254037844386)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0092 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_9300
     * @tc.name      testCircleDeg0093
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle 90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0093 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 90);
      expect(Math.abs(p.x - (100.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (125.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0093 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_9400
     * @tc.name      testCircleDeg0094
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle 90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0094 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 90);
      expect(Math.abs(p.x - (10.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (24.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0094 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_9500
     * @tc.name      testCircleDeg0095
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle 90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0095 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 90);
      expect(Math.abs(p.x - (-40.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (95.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0095 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_9600
     * @tc.name      testCircleDeg0096
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle 90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0096 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 90);
      expect(Math.abs(p.x - (6.123233995736766e-17)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (1.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0096 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_9700
     * @tc.name      testCircleDeg0097
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle 120.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0097 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 120);
      expect(Math.abs(p.x - (87.5)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (121.65063509461098)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0097 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_9800
     * @tc.name      testCircleDeg0098
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle 120.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0098 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 120);
      expect(Math.abs(p.x - (8.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (23.464101615137753)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0098 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_9900
     * @tc.name      testCircleDeg0099
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle 120.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0099 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 120);
      expect(Math.abs(p.x - (-47.5)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (92.99038105676658)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0099 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_10000
     * @tc.name      testCircleDeg0100
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle 120.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0100 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 120);
      expect(Math.abs(p.x - (-0.4999999999999998)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (0.8660254037844387)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0100 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_10100
     * @tc.name      testCircleDeg0101
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle 135.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0101 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 135);
      expect(Math.abs(p.x - (82.32233047033631)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (117.67766952966369)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0101 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_10200
     * @tc.name      testCircleDeg0102
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle 135.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0102 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 135);
      expect(Math.abs(p.x - (7.17157287525381)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (22.82842712474619)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0102 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_10300
     * @tc.name      testCircleDeg0103
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle 135.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0103 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 135);
      expect(Math.abs(p.x - (-50.60660171779821)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (90.60660171779821)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0103 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_10400
     * @tc.name      testCircleDeg0104
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle 135.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0104 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 135);
      expect(Math.abs(p.x - (-0.7071067811865475)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (0.7071067811865476)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0104 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_10500
     * @tc.name      testCircleDeg0105
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle 180.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0105 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 180);
      expect(Math.abs(p.x - (75.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (100.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0105 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_10600
     * @tc.name      testCircleDeg0106
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle 180.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0106 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 180);
      expect(Math.abs(p.x - (6.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (20.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0106 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_10700
     * @tc.name      testCircleDeg0107
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle 180.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0107 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 180);
      expect(Math.abs(p.x - (-55.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (80.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0107 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_10800
     * @tc.name      testCircleDeg0108
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle 180.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0108 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 180);
      expect(Math.abs(p.x - (-1.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (1.2246467991473532e-16)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0108 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_10900
     * @tc.name      testCircleDeg0109
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle 225.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0109 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 225);
      expect(Math.abs(p.x - (82.32233047033631)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (82.32233047033631)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0109 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_11000
     * @tc.name      testCircleDeg0110
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle 225.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0110 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 225);
      expect(Math.abs(p.x - (7.171572875253809)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (17.17157287525381)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0110 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_11100
     * @tc.name      testCircleDeg0111
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle 225.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0111 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 225);
      expect(Math.abs(p.x - (-50.60660171779821)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (69.39339828220179)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0111 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_11200
     * @tc.name      testCircleDeg0112
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle 225.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0112 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 225);
      expect(Math.abs(p.x - (-0.7071067811865477)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-0.7071067811865475)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0112 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_11300
     * @tc.name      testCircleDeg0113
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle 270.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0113 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 270);
      expect(Math.abs(p.x - (100.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (75.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0113 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_11400
     * @tc.name      testCircleDeg0114
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle 270.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0114 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 270);
      expect(Math.abs(p.x - (10.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (16.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0114 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_11500
     * @tc.name      testCircleDeg0115
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle 270.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0115 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 270);
      expect(Math.abs(p.x - (-40.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (65.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0115 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_11600
     * @tc.name      testCircleDeg0116
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle 270.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0116 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 270);
      expect(Math.abs(p.x - (-1.8369701987210297e-16)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-1.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0116 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_11700
     * @tc.name      testCircleDeg0117
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle 315.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0117 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 315);
      expect(Math.abs(p.x - (117.67766952966369)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (82.32233047033631)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0117 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_11800
     * @tc.name      testCircleDeg0118
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle 315.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0118 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 315);
      expect(Math.abs(p.x - (12.82842712474619)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (17.17157287525381)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0118 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_11900
     * @tc.name      testCircleDeg0119
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle 315.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0119 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 315);
      expect(Math.abs(p.x - (-29.39339828220179)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (69.39339828220179)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0119 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP3_12000
     * @tc.name      testCircleDeg0120
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle 315.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0120 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 315);
      expect(Math.abs(p.x - (0.7071067811865474)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-0.7071067811865477)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0120 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_12100
     * @tc.name      testCircleDeg0121
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle 360.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0121 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 360);
      expect(Math.abs(p.x - (125.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (100.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0121 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_12200
     * @tc.name      testCircleDeg0122
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle 360.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0122 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 360);
      expect(Math.abs(p.x - (14.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (20.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0122 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_12300
     * @tc.name      testCircleDeg0123
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle 360.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0123 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 360);
      expect(Math.abs(p.x - (-25.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (80.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0123 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_12400
     * @tc.name      testCircleDeg0124
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle 360.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0124 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 360);
      expect(Math.abs(p.x - (1.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-2.4492935982947064e-16)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0124 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_12500
     * @tc.name      testCircleDeg0125
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle 450.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0125 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, 450);
      expect(Math.abs(p.x - (100.00000000000001)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (125.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0125 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_12600
     * @tc.name      testCircleDeg0126
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle 450.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0126 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, 450);
      expect(Math.abs(p.x - (10.000000000000002)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (24.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0126 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_12700
     * @tc.name      testCircleDeg0127
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle 450.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0127 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, 450);
      expect(Math.abs(p.x - (-39.99999999999999)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (95.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0127 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_12800
     * @tc.name      testCircleDeg0128
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle 450.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0128 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, 450);
      expect(Math.abs(p.x - (3.061616997868383e-16)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (1.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0128 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_12900
     * @tc.name      testCircleDeg0129
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle -45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0129 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, -45);
      expect(Math.abs(p.x - (117.67766952966369)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (82.32233047033631)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0129 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_13000
     * @tc.name      testCircleDeg0130
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle -45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0130 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, -45);
      expect(Math.abs(p.x - (12.82842712474619)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (17.17157287525381)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0130 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_13100
     * @tc.name      testCircleDeg0131
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle -45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0131 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, -45);
      expect(Math.abs(p.x - (-29.393398282201787)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (69.39339828220179)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0131 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_13200
     * @tc.name      testCircleDeg0132
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle -45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0132 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, -45);
      expect(Math.abs(p.x - (0.7071067811865476)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-0.7071067811865476)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0132 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_13300
     * @tc.name      testCircleDeg0133
     * @tc.desc      Verify pointOnCircleDeg 100,100 angle -180.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0133 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(100, 100, 25, -180);
      expect(Math.abs(p.x - (75.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (100.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0133 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_13400
     * @tc.name      testCircleDeg0134
     * @tc.desc      Verify pointOnCircleDeg 10,20 angle -180.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0134 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(10, 20, 4, -180);
      expect(Math.abs(p.x - (6.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (20.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0134 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_13500
     * @tc.name      testCircleDeg0135
     * @tc.desc      Verify pointOnCircleDeg -40,80 angle -180.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0135 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(-40, 80, 15, -180);
      expect(Math.abs(p.x - (-55.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (80.0)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0135 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_13600
     * @tc.name      testCircleDeg0136
     * @tc.desc      Verify pointOnCircleDeg 0,0 angle -180.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCircleDeg0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0136 begin');
      await delayTick();
      const p: Point = GeometryUtil.pointOnCircleDeg(0, 0, 1, -180);
      expect(Math.abs(p.x - (-1.0)) < 0.000001).assertTrue();
      expect(Math.abs(p.y - (-1.2246467991473532e-16)) < 0.000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCircleDeg0136 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_13700
     * @tc.name      testDegToRad0137
     * @tc.desc      Verify degToRad(-360).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0137 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(-360) - (-6.283185307179586)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0137 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_13800
     * @tc.name      testDegToRad0138
     * @tc.desc      Verify degToRad(-180).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0138 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(-180) - (-3.141592653589793)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0138 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_13900
     * @tc.name      testDegToRad0139
     * @tc.desc      Verify degToRad(-90).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0139 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(-90) - (-1.5707963267948966)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0139 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_14000
     * @tc.name      testDegToRad0140
     * @tc.desc      Verify degToRad(-1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0140 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(-1) - (-0.017453292519943295)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0140 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_14100
     * @tc.name      testDegToRad0141
     * @tc.desc      Verify degToRad(0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0141 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(0) - (0.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0141 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_14200
     * @tc.name      testDegToRad0142
     * @tc.desc      Verify degToRad(1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0142 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(1) - (0.017453292519943295)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0142 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_14300
     * @tc.name      testDegToRad0143
     * @tc.desc      Verify degToRad(30).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0143 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(30) - (0.5235987755982988)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0143 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_14400
     * @tc.name      testDegToRad0144
     * @tc.desc      Verify degToRad(45).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0144 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(45) - (0.7853981633974483)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0144 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_14500
     * @tc.name      testDegToRad0145
     * @tc.desc      Verify degToRad(90).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0145 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(90) - (1.5707963267948966)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0145 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_14600
     * @tc.name      testDegToRad0146
     * @tc.desc      Verify degToRad(180).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0146 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(180) - (3.141592653589793)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0146 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_14700
     * @tc.name      testDegToRad0147
     * @tc.desc      Verify degToRad(270).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0147 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(270) - (4.71238898038469)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0147 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_14800
     * @tc.name      testDegToRad0148
     * @tc.desc      Verify degToRad(360).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0148 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(360) - (6.283185307179586)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0148 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_14900
     * @tc.name      testDegToRad0149
     * @tc.desc      Verify degToRad(720).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDegToRad0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0149 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.degToRad(720) - (12.566370614359172)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDegToRad0149 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_15000
     * @tc.name      testRadToDeg0150
     * @tc.desc      Verify radToDeg(-6.283185307179586).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0150 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(-6.283185307179586) - (-360.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0150 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_15100
     * @tc.name      testRadToDeg0151
     * @tc.desc      Verify radToDeg(-3.141592653589793).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0151 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(-3.141592653589793) - (-180.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0151 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_15200
     * @tc.name      testRadToDeg0152
     * @tc.desc      Verify radToDeg(-1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0152 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(-1) - (-57.29577951308232)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0152 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_15300
     * @tc.name      testRadToDeg0153
     * @tc.desc      Verify radToDeg(0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0153 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(0) - (0.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0153 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_15400
     * @tc.name      testRadToDeg0154
     * @tc.desc      Verify radToDeg(0.5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0154 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(0.5) - (28.64788975654116)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0154 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_15500
     * @tc.name      testRadToDeg0155
     * @tc.desc      Verify radToDeg(1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0155 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(1) - (57.29577951308232)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0155 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_15600
     * @tc.name      testRadToDeg0156
     * @tc.desc      Verify radToDeg(3.141592653589793).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0156 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(3.141592653589793) - (180.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0156 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_15700
     * @tc.name      testRadToDeg0157
     * @tc.desc      Verify radToDeg(6.283185307179586).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0157 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(6.283185307179586) - (360.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0157 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GCGP4_15800
     * @tc.name      testRadToDeg0158
     * @tc.desc      Verify radToDeg(3.5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRadToDeg0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0158 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.radToDeg(3.5) - (200.53522829578813)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRadToDeg0158 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_0100
     * @tc.name      testDistanceGrid0001
     * @tc.desc      Verify distance(0,0,3,4).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0001 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(0, 0, 3, 4) - (5.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0001 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_0200
     * @tc.name      testDistanceGrid0002
     * @tc.desc      Verify distance(0,0,0,0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0002 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(0, 0, 0, 0) - (0.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0002 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_0300
     * @tc.name      testDistanceGrid0003
     * @tc.desc      Verify distance(1,1,1,10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0003 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(1, 1, 1, 10) - (9.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0003 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_0400
     * @tc.name      testDistanceGrid0004
     * @tc.desc      Verify distance(-3,-4,0,0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0004 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(-3, -4, 0, 0) - (5.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0004 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_0500
     * @tc.name      testDistanceGrid0005
     * @tc.desc      Verify distance(10,20,13,24).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0005 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(10, 20, 13, 24) - (5.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0005 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_0600
     * @tc.name      testDistanceGrid0006
     * @tc.desc      Verify distance(5,5,5,15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0006 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(5, 5, 5, 15) - (10.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0006 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_0700
     * @tc.name      testDistanceGrid0007
     * @tc.desc      Verify distance(-10,0,10,0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0007 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(-10, 0, 10, 0) - (20.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0007 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_0800
     * @tc.name      testDistanceGrid0008
     * @tc.desc      Verify distance(100,100,106,108).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0008 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(100, 100, 106, 108) - (10.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0008 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_0900
     * @tc.name      testDistanceGrid0009
     * @tc.desc      Verify distance(7,24,7,24).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0009 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(7, 24, 7, 24) - (0.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0009 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_1000
     * @tc.name      testDistanceGrid0010
     * @tc.desc      Verify distance(0,0,12,16).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0010 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(0, 0, 12, 16) - (20.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0010 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_1100
     * @tc.name      testDistanceGrid0011
     * @tc.desc      Verify distance(-6,8,0,0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0011 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(-6, 8, 0, 0) - (10.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0011 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_1200
     * @tc.name      testDistanceGrid0012
     * @tc.desc      Verify distance(33,44,55,66).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0012 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(33, 44, 55, 66) - (31.11269837220809)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0012 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_1300
     * @tc.name      testDistanceGrid0013
     * @tc.desc      Verify distance(2,3,5,7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0013 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(2, 3, 5, 7) - (5.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0013 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_1400
     * @tc.name      testDistanceGrid0014
     * @tc.desc      Verify distance(9,40,9,41).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDistanceGrid0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0014 begin');
      await delayTick();
      expect(Math.abs(GeometryUtil.distance(9, 40, 9, 41) - (1.0)) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDistanceGrid0014 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_1500
     * @tc.name      testRectGrid0015
     * @tc.desc      Verify rectContains(0,0,10,5) point 0,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0015 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 0, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0015 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_1600
     * @tc.name      testRectGrid0016
     * @tc.desc      Verify rectContains(0,0,10,5) point 10,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0016 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 10, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0016 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_1700
     * @tc.name      testRectGrid0017
     * @tc.desc      Verify rectContains(0,0,10,5) point -1,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0017 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, -1, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0017 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_1800
     * @tc.name      testRectGrid0018
     * @tc.desc      Verify rectContains(0,0,10,5) point 5,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0018 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 5, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0018 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_1900
     * @tc.name      testRectGrid0019
     * @tc.desc      Verify rectContains(0,0,10,5) point 11,5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0019 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 11, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0019 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_2000
     * @tc.name      testRectGrid0020
     * @tc.desc      Verify rectContains(0,0,10,5) point 10,6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0020 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 10, 6)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0020 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_2100
     * @tc.name      testRectGrid0021
     * @tc.desc      Verify rectContains(0,0,10,5) point 10,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0021 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 10, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0021 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_2200
     * @tc.name      testRectGrid0022
     * @tc.desc      Verify rectContains(0,0,10,5) point 15,25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0022 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 15, 25)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0022 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_2300
     * @tc.name      testRectGrid0023
     * @tc.desc      Verify rectContains(0,0,10,5) point -5,-5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0023 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, -5, -5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0023 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_2400
     * @tc.name      testRectGrid0024
     * @tc.desc      Verify rectContains(0,0,10,5) point 5,0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0024 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 5, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0024 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_2500
     * @tc.name      testRectGrid0025
     * @tc.desc      Verify rectContains(0,0,10,5) point 100,100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0025 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 100, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0025 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_2600
     * @tc.name      testRectGrid0026
     * @tc.desc      Verify rectContains(0,0,10,5) point 101,101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0026 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 101, 101)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0026 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_2700
     * @tc.name      testRectGrid0027
     * @tc.desc      Verify rectContains(0,0,10,5) point 20,30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0027 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 20, 30)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0027 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_2800
     * @tc.name      testRectGrid0028
     * @tc.desc      Verify rectContains(0,0,10,5) point 70,90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0028 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 70, 90)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0028 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_2900
     * @tc.name      testRectGrid0029
     * @tc.desc      Verify rectContains(0,0,10,5) point -20,-30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0029 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, -20, -30)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0029 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_3000
     * @tc.name      testRectGrid0030
     * @tc.desc      Verify rectContains(0,0,10,5) point 0,20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0030 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 0, 20)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0030 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_3100
     * @tc.name      testRectGrid0031
     * @tc.desc      Verify rectContains(0,0,10,5) point 60,10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0031 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 60, 10)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0031 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP1_3200
     * @tc.name      testRectGrid0032
     * @tc.desc      Verify rectContains(0,0,10,5) point 7,8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0032 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(0, 0, 10, 5, 7, 8)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0032 end');
    })

  })
}
