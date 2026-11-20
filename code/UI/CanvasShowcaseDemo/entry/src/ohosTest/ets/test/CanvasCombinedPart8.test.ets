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

export default function CanvasCombinedPart8Test(): void {
  describe('CvG8', () => {
    /**
     * @tc.number    SUB_CANVAS_GRGP5_16600
     * @tc.name      testRectGrid0166
     * @tc.desc      Verify rectContains(7,8,9,10) point 101,101. Plus Verify rectContains(7,8,9,10) point 20,30. Plus Verify rectContains(7,8,9,10) point 70,90. Plus Verify rectContains(7,8,9,10) point -20,-30. Plus Verify rectContains(7,8,9,10) point 0,20. Plus Verify rectContains(7,8,9,10) point 60,10. Plus Verify rectContains(7,8,9,10) point 7,8. Plus Verify rectContains(7,8,9,10) point 16,18. Plus Verify rectContains(7,8,9,10) point 8,9. Plus Verify GeometryUtil.clamp(-5, 0, 10). Plus Verify GeometryUtil.clamp(15, 0, 10). Plus Verify GeometryUtil.clamp(0, -10, 10). Plus Verify GeometryUtil.clamp(10, 5, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRectGrid0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0166 begin');
      await delayTick();
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 101, 101)).assertEqual(false);
      {
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 20, 30)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 70, 90)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(7, 8, 9, 10, -20, -30)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 0, 20)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 60, 10)).assertEqual(false);
      }
      {
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 7, 8)).assertEqual(true);
      }
      {
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 16, 18)).assertEqual(true);
      }
      {
      expect(GeometryUtil.rectContains(7, 8, 9, 10, 8, 9)).assertEqual(true);
      }
      {
      expect(GeometryUtil.clamp(-5, 0, 10)).assertEqual(0);
      }
      {
      expect(GeometryUtil.clamp(15, 0, 10)).assertEqual(10);
      }
      {
      expect(GeometryUtil.clamp(0, -10, 10)).assertEqual(0);
      }
      {
      expect(GeometryUtil.clamp(10, 5, 1)).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRectGrid0166 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP5_17900
     * @tc.name      testGeoClamp0179
     * @tc.desc      Verify GeometryUtil.clamp(5, 5, 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGeoClamp0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGeoClamp0179 begin');
      await delayTick();
      expect(GeometryUtil.clamp(5, 5, 5)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGeoClamp0179 end');
    })
    /**
     * @tc.number    SUB_CANVAS_GRGP5_18000
     * @tc.name      testGeoClamp0180
     * @tc.desc      Verify GeometryUtil.clamp(-1, -1, -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGeoClamp0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGeoClamp0180 begin');
      await delayTick();
      expect(GeometryUtil.clamp(-1, -1, -1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGeoClamp0180 end');
    })
    /**
     * @tc.number    SUB_CANVAS_LTGP1_0100
     * @tc.name      testTimeGrid0001
     * @tc.desc      Verify LogUtil.formatTime(00:00:01).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0001 begin');
      await delayTick();
      const d: Date = new Date(2026, 0, 1, 0, 0, 1);
      expect(LogUtil.formatTime(d)).assertEqual('00:00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0001 end');
    })
    /**
     * @tc.number    SUB_CANVAS_LTGP1_0200
     * @tc.name      testTimeGrid0002
     * @tc.desc      Verify LogUtil.formatTime(00:01:00).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0002 begin');
      await delayTick();
      const d: Date = new Date(2026, 0, 1, 0, 1, 0);
      expect(LogUtil.formatTime(d)).assertEqual('00:01:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0002 end');
    })
    /**
     * @tc.number    SUB_CANVAS_LTGP1_0300
     * @tc.name      testTimeGrid0003
     * @tc.desc      Verify LogUtil.formatTime(09:08:07).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0003 begin');
      await delayTick();
      const d: Date = new Date(2026, 0, 1, 9, 8, 7);
      expect(LogUtil.formatTime(d)).assertEqual('09:08:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0003 end');
    })
    /**
     * @tc.number    SUB_CANVAS_LTGP1_0400
     * @tc.name      testTimeGrid0004
     * @tc.desc      Verify LogUtil.formatTime(10:20:30).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0004 begin');
      await delayTick();
      const d: Date = new Date(2026, 0, 1, 10, 20, 30);
      expect(LogUtil.formatTime(d)).assertEqual('10:20:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0004 end');
    })
    /**
     * @tc.number    SUB_CANVAS_LTGP1_0500
     * @tc.name      testTimeGrid0005
     * @tc.desc      Verify LogUtil.formatTime(12:00:00).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0005 begin');
      await delayTick();
      const d: Date = new Date(2026, 0, 1, 12, 0, 0);
      expect(LogUtil.formatTime(d)).assertEqual('12:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0005 end');
    })
    /**
     * @tc.number    SUB_CANVAS_LTGP1_0600
     * @tc.name      testTimeGrid0006
     * @tc.desc      Verify LogUtil.formatTime(05:10:15).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0006 begin');
      await delayTick();
      const d: Date = new Date(2026, 0, 1, 5, 10, 15);
      expect(LogUtil.formatTime(d)).assertEqual('05:10:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0006 end');
    })
    /**
     * @tc.number    SUB_CANVAS_LTGP1_0700
     * @tc.name      testTimeGrid0007
     * @tc.desc      Verify LogUtil.formatTime(15:45:05).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0007 begin');
      await delayTick();
      const d: Date = new Date(2026, 0, 1, 15, 45, 5);
      expect(LogUtil.formatTime(d)).assertEqual('15:45:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0007 end');
    })

  })
}
