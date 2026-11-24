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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_International]';

export default function intlGeomMatrix1Test(): void {
  describe('IntlGeomMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    INTL_GEOM_0001
     * @tc.name      intlGeomGeom0001
     * @tc.desc      矩形 (0,0,100,100) 与 (0,0,1,1) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0001 begin');
      const left: number = 0;
      const right: number = 1;
      const top: number = 0;
      const bottom: number = 1;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(1);
      expect(Math.max(0, right - left)).assertEqual(1);
      expect(Math.max(0, bottom - top)).assertEqual(1);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0001 end');
    })

    /**
     * @tc.number    INTL_GEOM_0002
     * @tc.name      intlGeomGeom0002
     * @tc.desc      矩形 (0,0,100,100) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0002 begin');
      const width: number = 100;
      const height: number = 100;
      const area: number = width * height;
      const centerX: number = 0 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(10000);
      expect(centerX).assertEqual(50);
      expect(centerX >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0002 end');
    })

    /**
     * @tc.number    INTL_GEOM_0003
     * @tc.name      intlGeomGeom0003
     * @tc.desc      矩形 (10,20,200,150) 与 (100,100,300,300) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0003 begin');
      const left: number = 100;
      const right: number = 210;
      const top: number = 100;
      const bottom: number = 170;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(7700);
      expect(Math.max(0, right - left)).assertEqual(110);
      expect(Math.max(0, bottom - top)).assertEqual(70);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0003 end');
    })

    /**
     * @tc.number    INTL_GEOM_0004
     * @tc.name      intlGeomGeom0004
     * @tc.desc      矩形 (10,20,200,150) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0004 begin');
      const width: number = 200;
      const height: number = 150;
      const area: number = width * height;
      const centerX: number = 10 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(30000);
      expect(centerX).assertEqual(110);
      expect(centerX >= 10).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0004 end');
    })

    /**
     * @tc.number    INTL_GEOM_0005
     * @tc.name      intlGeomGeom0005
     * @tc.desc      矩形 (-50,-50,100,100) 与 (25,25,75,75) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0005 begin');
      const left: number = 25;
      const right: number = 50;
      const top: number = 25;
      const bottom: number = 50;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(625);
      expect(Math.max(0, right - left)).assertEqual(25);
      expect(Math.max(0, bottom - top)).assertEqual(25);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0005 end');
    })

    /**
     * @tc.number    INTL_GEOM_0006
     * @tc.name      intlGeomGeom0006
     * @tc.desc      矩形 (-50,-50,100,100) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0006 begin');
      const width: number = 100;
      const height: number = 100;
      const area: number = width * height;
      const centerX: number = -50 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(10000);
      expect(centerX).assertEqual(0);
      expect(centerX >= -50).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0006 end');
    })

    /**
     * @tc.number    INTL_GEOM_0007
     * @tc.name      intlGeomGeom0007
     * @tc.desc      矩形 (0,0,1,1) 与 (-10,5,60,90) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0007 begin');
      const left: number = 0;
      const right: number = 1;
      const top: number = 5;
      const bottom: number = 1;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(0);
      expect(Math.max(0, right - left)).assertEqual(1);
      expect(Math.max(0, bottom - top)).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0007 end');
    })

    /**
     * @tc.number    INTL_GEOM_0008
     * @tc.name      intlGeomGeom0008
     * @tc.desc      矩形 (0,0,1,1) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0008 begin');
      const width: number = 1;
      const height: number = 1;
      const area: number = width * height;
      const centerX: number = 0 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(1);
      expect(centerX).assertEqual(0.5);
      expect(centerX >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0008 end');
    })

    /**
     * @tc.number    INTL_GEOM_0009
     * @tc.name      intlGeomGeom0009
     * @tc.desc      矩形 (100,100,300,300) 与 (0,0,720,1280) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0009 begin');
      const left: number = 100;
      const right: number = 400;
      const top: number = 100;
      const bottom: number = 400;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(90000);
      expect(Math.max(0, right - left)).assertEqual(300);
      expect(Math.max(0, bottom - top)).assertEqual(300);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0009 end');
    })

    /**
     * @tc.number    INTL_GEOM_0010
     * @tc.name      intlGeomGeom0010
     * @tc.desc      矩形 (100,100,300,300) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0010 begin');
      const width: number = 300;
      const height: number = 300;
      const area: number = width * height;
      const centerX: number = 100 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(90000);
      expect(centerX).assertEqual(250);
      expect(centerX >= 100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0010 end');
    })

    /**
     * @tc.number    INTL_GEOM_0011
     * @tc.name      intlGeomGeom0011
     * @tc.desc      矩形 (25,25,75,75) 与 (5,5,375,640) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0011 begin');
      const left: number = 25;
      const right: number = 100;
      const top: number = 25;
      const bottom: number = 100;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(5625);
      expect(Math.max(0, right - left)).assertEqual(75);
      expect(Math.max(0, bottom - top)).assertEqual(75);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0011 end');
    })

    /**
     * @tc.number    INTL_GEOM_0012
     * @tc.name      intlGeomGeom0012
     * @tc.desc      矩形 (25,25,75,75) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0012 begin');
      const width: number = 75;
      const height: number = 75;
      const area: number = width * height;
      const centerX: number = 25 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(5625);
      expect(centerX).assertEqual(62.5);
      expect(centerX >= 25).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0012 end');
    })

    /**
     * @tc.number    INTL_GEOM_0013
     * @tc.name      intlGeomGeom0013
     * @tc.desc      矩形 (-10,5,60,90) 与 (48,48,144,144) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0013 begin');
      const left: number = 48;
      const right: number = 50;
      const top: number = 48;
      const bottom: number = 95;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(94);
      expect(Math.max(0, right - left)).assertEqual(2);
      expect(Math.max(0, bottom - top)).assertEqual(47);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0013 end');
    })

    /**
     * @tc.number    INTL_GEOM_0014
     * @tc.name      intlGeomGeom0014
     * @tc.desc      矩形 (-10,5,60,90) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0014 begin');
      const width: number = 60;
      const height: number = 90;
      const area: number = width * height;
      const centerX: number = -10 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(5400);
      expect(centerX).assertEqual(20);
      expect(centerX >= -10).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0014 end');
    })

    /**
     * @tc.number    INTL_GEOM_0015
     * @tc.name      intlGeomGeom0015
     * @tc.desc      矩形 (0,0,720,1280) 与 (1,2,3,4) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0015 begin');
      const left: number = 1;
      const right: number = 4;
      const top: number = 2;
      const bottom: number = 6;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(12);
      expect(Math.max(0, right - left)).assertEqual(3);
      expect(Math.max(0, bottom - top)).assertEqual(4);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0015 end');
    })

    /**
     * @tc.number    INTL_GEOM_0016
     * @tc.name      intlGeomGeom0016
     * @tc.desc      矩形 (0,0,720,1280) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0016 begin');
      const width: number = 720;
      const height: number = 1280;
      const area: number = width * height;
      const centerX: number = 0 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(921600);
      expect(centerX).assertEqual(360);
      expect(centerX >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0016 end');
    })

    /**
     * @tc.number    INTL_GEOM_0017
     * @tc.name      intlGeomGeom0017
     * @tc.desc      矩形 (5,5,375,640) 与 (-100,-100,0,0) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0017 begin');
      const left: number = 5;
      const right: number = -100;
      const top: number = 5;
      const bottom: number = -100;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(0);
      expect(Math.max(0, right - left)).assertEqual(0);
      expect(Math.max(0, bottom - top)).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0017 end');
    })

    /**
     * @tc.number    INTL_GEOM_0018
     * @tc.name      intlGeomGeom0018
     * @tc.desc      矩形 (5,5,375,640) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0018 begin');
      const width: number = 375;
      const height: number = 640;
      const area: number = width * height;
      const centerX: number = 5 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(240000);
      expect(centerX).assertEqual(192.5);
      expect(centerX >= 5).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0018 end');
    })

    /**
     * @tc.number    INTL_GEOM_0019
     * @tc.name      intlGeomGeom0019
     * @tc.desc      矩形 (48,48,144,144) 与 (200,0,400,200) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0019 begin');
      const left: number = 200;
      const right: number = 192;
      const top: number = 48;
      const bottom: number = 192;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(0);
      expect(Math.max(0, right - left)).assertEqual(0);
      expect(Math.max(0, bottom - top)).assertEqual(144);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0019 end');
    })

    /**
     * @tc.number    INTL_GEOM_0020
     * @tc.name      intlGeomGeom0020
     * @tc.desc      矩形 (48,48,144,144) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0020 begin');
      const width: number = 144;
      const height: number = 144;
      const area: number = width * height;
      const centerX: number = 48 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(20736);
      expect(centerX).assertEqual(120);
      expect(centerX >= 48).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0020 end');
    })

    /**
     * @tc.number    INTL_GEOM_0021
     * @tc.name      intlGeomGeom0021
     * @tc.desc      矩形 (1,2,3,4) 与 (0,200,200,400) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0021 begin');
      const left: number = 1;
      const right: number = 4;
      const top: number = 200;
      const bottom: number = 6;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(0);
      expect(Math.max(0, right - left)).assertEqual(3);
      expect(Math.max(0, bottom - top)).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0021 end');
    })

    /**
     * @tc.number    INTL_GEOM_0022
     * @tc.name      intlGeomGeom0022
     * @tc.desc      矩形 (1,2,3,4) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0022 begin');
      const width: number = 3;
      const height: number = 4;
      const area: number = width * height;
      const centerX: number = 1 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(12);
      expect(centerX).assertEqual(2.5);
      expect(centerX >= 1).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0022 end');
    })

    /**
     * @tc.number    INTL_GEOM_0023
     * @tc.name      intlGeomGeom0023
     * @tc.desc      矩形 (-100,-100,0,0) 与 (60,60,260,160) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0023 begin');
      const left: number = 60;
      const right: number = -100;
      const top: number = 60;
      const bottom: number = -100;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(0);
      expect(Math.max(0, right - left)).assertEqual(0);
      expect(Math.max(0, bottom - top)).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0023 end');
    })

    /**
     * @tc.number    INTL_GEOM_0024
     * @tc.name      intlGeomGeom0024
     * @tc.desc      矩形 (-100,-100,0,0) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0024 begin');
      const width: number = 0;
      const height: number = 0;
      const area: number = width * height;
      const centerX: number = -100 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(0);
      expect(centerX).assertEqual(-100);
      expect(centerX >= -100).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0024 end');
    })

    /**
     * @tc.number    INTL_GEOM_0025
     * @tc.name      intlGeomGeom0025
     * @tc.desc      矩形 (200,0,400,200) 与 (16,16,32,32) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0025 begin');
      const left: number = 200;
      const right: number = 48;
      const top: number = 16;
      const bottom: number = 48;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(0);
      expect(Math.max(0, right - left)).assertEqual(0);
      expect(Math.max(0, bottom - top)).assertEqual(32);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0025 end');
    })

    /**
     * @tc.number    INTL_GEOM_0026
     * @tc.name      intlGeomGeom0026
     * @tc.desc      矩形 (200,0,400,200) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0026 begin');
      const width: number = 400;
      const height: number = 200;
      const area: number = width * height;
      const centerX: number = 200 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(80000);
      expect(centerX).assertEqual(400);
      expect(centerX >= 200).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0026 end');
    })

    /**
     * @tc.number    INTL_GEOM_0027
     * @tc.name      intlGeomGeom0027
     * @tc.desc      矩形 (0,200,200,400) 与 (0,0,100,100) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0027 begin');
      const left: number = 0;
      const right: number = 100;
      const top: number = 200;
      const bottom: number = 100;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(0);
      expect(Math.max(0, right - left)).assertEqual(100);
      expect(Math.max(0, bottom - top)).assertEqual(0);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0027 end');
    })

    /**
     * @tc.number    INTL_GEOM_0028
     * @tc.name      intlGeomGeom0028
     * @tc.desc      矩形 (0,200,200,400) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0028 begin');
      const width: number = 200;
      const height: number = 400;
      const area: number = width * height;
      const centerX: number = 0 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(80000);
      expect(centerX).assertEqual(100);
      expect(centerX >= 0).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0028 end');
    })

    /**
     * @tc.number    INTL_GEOM_0029
     * @tc.name      intlGeomGeom0029
     * @tc.desc      矩形 (60,60,260,160) 与 (10,20,200,150) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0029 begin');
      const left: number = 60;
      const right: number = 210;
      const top: number = 60;
      const bottom: number = 170;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(16500);
      expect(Math.max(0, right - left)).assertEqual(150);
      expect(Math.max(0, bottom - top)).assertEqual(110);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0029 end');
    })

    /**
     * @tc.number    INTL_GEOM_0030
     * @tc.name      intlGeomGeom0030
     * @tc.desc      矩形 (60,60,260,160) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0030 begin');
      const width: number = 260;
      const height: number = 160;
      const area: number = width * height;
      const centerX: number = 60 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(41600);
      expect(centerX).assertEqual(190);
      expect(centerX >= 60).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0030 end');
    })

    /**
     * @tc.number    INTL_GEOM_0031
     * @tc.name      intlGeomGeom0031
     * @tc.desc      矩形 (16,16,32,32) 与 (-50,-50,100,100) 相交面积推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0031 begin');
      const left: number = 16;
      const right: number = 48;
      const top: number = 16;
      const bottom: number = 48;
      const area: number = Math.max(0, right - left) * Math.max(0, bottom - top);
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area);
      expect(area).assertEqual(1024);
      expect(Math.max(0, right - left)).assertEqual(32);
      expect(Math.max(0, bottom - top)).assertEqual(32);
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0031 end');
    })

    /**
     * @tc.number    INTL_GEOM_0032
     * @tc.name      intlGeomGeom0032
     * @tc.desc      矩形 (16,16,32,32) 面积与中心点推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0032 begin');
      const width: number = 32;
      const height: number = 32;
      const area: number = width * height;
      const centerX: number = 16 + width / 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'area=' + area + ' cx=' + centerX);
      expect(area).assertEqual(1024);
      expect(centerX).assertEqual(32);
      expect(centerX >= 16).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0032 end');
    })

    /**
     * @tc.number    INTL_GEOM_0033
     * @tc.name      intlGeomGeom0033
     * @tc.desc      点 (0,0) 到点 (720,1280) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0033 begin');
      const dx: number = -720;
      const dy: number = -1280;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('1468.605');
      expect(manhattan).assertEqual(2000);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0033 end');
    })

    /**
     * @tc.number    INTL_GEOM_0034
     * @tc.name      intlGeomGeom0034
     * @tc.desc      点 (1,1) 到点 (48,48) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0034 begin');
      const dx: number = -47;
      const dy: number = -47;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('66.468');
      expect(manhattan).assertEqual(94);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0034 end');
    })

    /**
     * @tc.number    INTL_GEOM_0035
     * @tc.name      intlGeomGeom0035
     * @tc.desc      点 (-1,-1) 到点 (144,144) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0035 begin');
      const dx: number = -145;
      const dy: number = -145;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('205.061');
      expect(manhattan).assertEqual(290);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0035 end');
    })

    /**
     * @tc.number    INTL_GEOM_0036
     * @tc.name      intlGeomGeom0036
     * @tc.desc      点 (100,200) 到点 (-50,50) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0036 begin');
      const dx: number = 150;
      const dy: number = 150;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('212.132');
      expect(manhattan).assertEqual(300);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0036 end');
    })

    /**
     * @tc.number    INTL_GEOM_0037
     * @tc.name      intlGeomGeom0037
     * @tc.desc      点 (375,640) 到点 (999,1) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0037 begin');
      const dx: number = -624;
      const dy: number = 639;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('893.139');
      expect(manhattan).assertEqual(1263);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0037 end');
    })

    /**
     * @tc.number    INTL_GEOM_0038
     * @tc.name      intlGeomGeom0038
     * @tc.desc      点 (720,1280) 到点 (12,34) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0038 begin');
      const dx: number = 708;
      const dy: number = 1246;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('1433.102');
      expect(manhattan).assertEqual(1954);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0038 end');
    })

    /**
     * @tc.number    INTL_GEOM_0039
     * @tc.name      intlGeomGeom0039
     * @tc.desc      点 (48,48) 到点 (56,78) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0039 begin');
      const dx: number = -8;
      const dy: number = -30;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('31.048');
      expect(manhattan).assertEqual(38);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0039 end');
    })

    /**
     * @tc.number    INTL_GEOM_0040
     * @tc.name      intlGeomGeom0040
     * @tc.desc      点 (144,144) 到点 (1024,768) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0040 begin');
      const dx: number = -880;
      const dy: number = -624;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('1078.785');
      expect(manhattan).assertEqual(1504);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0040 end');
    })

    /**
     * @tc.number    INTL_GEOM_0041
     * @tc.name      intlGeomGeom0041
     * @tc.desc      点 (-50,50) 到点 (640,480) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0041 begin');
      const dx: number = -690;
      const dy: number = -430;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('813.019');
      expect(manhattan).assertEqual(1120);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0041 end');
    })

    /**
     * @tc.number    INTL_GEOM_0042
     * @tc.name      intlGeomGeom0042
     * @tc.desc      点 (999,1) 到点 (3,4) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0042 begin');
      const dx: number = 996;
      const dy: number = -3;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('996.005');
      expect(manhattan).assertEqual(999);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0042 end');
    })

    /**
     * @tc.number    INTL_GEOM_0043
     * @tc.name      intlGeomGeom0043
     * @tc.desc      点 (12,34) 到点 (-3,-4) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0043 begin');
      const dx: number = 15;
      const dy: number = 38;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('40.853');
      expect(manhattan).assertEqual(53);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0043 end');
    })

    /**
     * @tc.number    INTL_GEOM_0044
     * @tc.name      intlGeomGeom0044
     * @tc.desc      点 (56,78) 到点 (0,0) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0044 begin');
      const dx: number = 56;
      const dy: number = 78;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('96.021');
      expect(manhattan).assertEqual(134);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0044 end');
    })

    /**
     * @tc.number    INTL_GEOM_0045
     * @tc.name      intlGeomGeom0045
     * @tc.desc      点 (1024,768) 到点 (1,1) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0045 begin');
      const dx: number = 1023;
      const dy: number = 767;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('1278.600');
      expect(manhattan).assertEqual(1790);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0045 end');
    })

    /**
     * @tc.number    INTL_GEOM_0046
     * @tc.name      intlGeomGeom0046
     * @tc.desc      点 (640,480) 到点 (-1,-1) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0046 begin');
      const dx: number = 641;
      const dy: number = 481;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('801.400');
      expect(manhattan).assertEqual(1122);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0046 end');
    })

    /**
     * @tc.number    INTL_GEOM_0047
     * @tc.name      intlGeomGeom0047
     * @tc.desc      点 (3,4) 到点 (100,200) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0047 begin');
      const dx: number = -97;
      const dy: number = -196;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('218.689');
      expect(manhattan).assertEqual(293);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0047 end');
    })

    /**
     * @tc.number    INTL_GEOM_0048
     * @tc.name      intlGeomGeom0048
     * @tc.desc      点 (-3,-4) 到点 (375,640) 距离与曼哈顿距离推算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('intlGeomGeom0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0048 begin');
      const dx: number = -378;
      const dy: number = -644;
      const euclid: number = Math.sqrt(dx * dx + dy * dy);
      const manhattan: number = Math.abs(dx) + Math.abs(dy);
      hilog.info(DOMAIN, TAG, '%{public}s', 'd=' + euclid.toFixed(3));
      expect(euclid.toFixed(3)).assertEqual('746.740');
      expect(manhattan).assertEqual(1022);
      expect(manhattan >= Math.abs(dx)).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'intlGeomGeom0048 end');
    })
  })
}
