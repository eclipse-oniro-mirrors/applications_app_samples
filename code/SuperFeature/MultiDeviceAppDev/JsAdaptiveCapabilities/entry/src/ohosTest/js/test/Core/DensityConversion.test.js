/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, it, expect } from '@ohos/hypium';
import model from '../Shared/AdaptiveModel';

const DOMAIN = 0xF811;
const TAG = '[Sample_jsAdaptiveCapabilities]';
const YIELD_MS = 10;

function yieldThread() {
  return new Promise(function (resolve) {
    setTimeout(function () {
      resolve();
    }, YIELD_MS);
  });
}

function DensityConversionPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1401
     * @tc.name    JsDensity001
     * @tc.desc    Density 1.5 converts vp 19 to px 29 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity001', 0, async function () {
      await yieldThread();
      const vp = 19;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(29);
      expect(model.vpOf(29, density)).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1402
     * @tc.name    JsDensity002
     * @tc.desc    Density 2 converts vp 26 to px 52 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity002', 0, async function () {
      await yieldThread();
      const vp = 26;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(52);
      expect(model.vpOf(52, density)).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1403
     * @tc.name    JsDensity003
     * @tc.desc    Density 3 converts vp 33 to px 99 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity003', 0, async function () {
      await yieldThread();
      const vp = 33;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(99);
      expect(model.vpOf(99, density)).assertEqual(33);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1404
     * @tc.name    JsDensity004
     * @tc.desc    Density 1 converts vp 40 to px 40 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity004', 0, async function () {
      await yieldThread();
      const vp = 40;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(40);
      expect(model.vpOf(40, density)).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity004 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1405
     * @tc.name    JsDensity005
     * @tc.desc    Density 1.5 converts vp 47 to px 71 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity005', 0, async function () {
      await yieldThread();
      const vp = 47;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(71);
      expect(model.vpOf(71, density)).assertEqual(47);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity005 done');
    });
}

function DensityConversionPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1406
     * @tc.name    JsDensity006
     * @tc.desc    Density 2 converts vp 54 to px 108 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity006', 0, async function () {
      await yieldThread();
      const vp = 54;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(108);
      expect(model.vpOf(108, density)).assertEqual(54);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity006 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1407
     * @tc.name    JsDensity007
     * @tc.desc    Density 3 converts vp 61 to px 183 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity007', 0, async function () {
      await yieldThread();
      const vp = 61;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(183);
      expect(model.vpOf(183, density)).assertEqual(61);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1408
     * @tc.name    JsDensity008
     * @tc.desc    Density 1 converts vp 68 to px 68 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity008', 0, async function () {
      await yieldThread();
      const vp = 68;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(68);
      expect(model.vpOf(68, density)).assertEqual(68);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity008 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1409
     * @tc.name    JsDensity009
     * @tc.desc    Density 1.5 converts vp 75 to px 113 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity009', 0, async function () {
      await yieldThread();
      const vp = 75;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(113);
      expect(model.vpOf(113, density)).assertEqual(75);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity009 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1410
     * @tc.name    JsDensity010
     * @tc.desc    Density 2 converts vp 82 to px 164 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity010', 0, async function () {
      await yieldThread();
      const vp = 82;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(164);
      expect(model.vpOf(164, density)).assertEqual(82);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity010 done');
    });
}

function DensityConversionPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1411
     * @tc.name    JsDensity011
     * @tc.desc    Density 3 converts vp 89 to px 267 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity011', 0, async function () {
      await yieldThread();
      const vp = 89;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(267);
      expect(model.vpOf(267, density)).assertEqual(89);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1412
     * @tc.name    JsDensity012
     * @tc.desc    Density 1 converts vp 96 to px 96 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity012', 0, async function () {
      await yieldThread();
      const vp = 96;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(96);
      expect(model.vpOf(96, density)).assertEqual(96);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity012 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1413
     * @tc.name    JsDensity013
     * @tc.desc    Density 1.5 converts vp 103 to px 155 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity013', 0, async function () {
      await yieldThread();
      const vp = 103;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(155);
      expect(model.vpOf(155, density)).assertEqual(103);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1414
     * @tc.name    JsDensity014
     * @tc.desc    Density 2 converts vp 110 to px 220 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity014', 0, async function () {
      await yieldThread();
      const vp = 110;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(220);
      expect(model.vpOf(220, density)).assertEqual(110);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1415
     * @tc.name    JsDensity015
     * @tc.desc    Density 3 converts vp 117 to px 351 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity015', 0, async function () {
      await yieldThread();
      const vp = 117;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(351);
      expect(model.vpOf(351, density)).assertEqual(117);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity015 done');
    });
}

function DensityConversionPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1416
     * @tc.name    JsDensity016
     * @tc.desc    Density 1 converts vp 124 to px 124 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity016', 0, async function () {
      await yieldThread();
      const vp = 124;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(124);
      expect(model.vpOf(124, density)).assertEqual(124);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity016 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1417
     * @tc.name    JsDensity017
     * @tc.desc    Density 1.5 converts vp 131 to px 197 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity017', 0, async function () {
      await yieldThread();
      const vp = 131;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(197);
      expect(model.vpOf(197, density)).assertEqual(131);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1418
     * @tc.name    JsDensity018
     * @tc.desc    Density 2 converts vp 138 to px 276 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity018', 0, async function () {
      await yieldThread();
      const vp = 138;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(276);
      expect(model.vpOf(276, density)).assertEqual(138);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity018 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1419
     * @tc.name    JsDensity019
     * @tc.desc    Density 3 converts vp 145 to px 435 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity019', 0, async function () {
      await yieldThread();
      const vp = 145;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(435);
      expect(model.vpOf(435, density)).assertEqual(145);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1420
     * @tc.name    JsDensity020
     * @tc.desc    Density 1 converts vp 152 to px 152 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity020', 0, async function () {
      await yieldThread();
      const vp = 152;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(152);
      expect(model.vpOf(152, density)).assertEqual(152);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity020 done');
    });
}

function DensityConversionPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1421
     * @tc.name    JsDensity021
     * @tc.desc    Density 1.5 converts vp 159 to px 239 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity021', 0, async function () {
      await yieldThread();
      const vp = 159;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(239);
      expect(model.vpOf(239, density)).assertEqual(159);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity021 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1422
     * @tc.name    JsDensity022
     * @tc.desc    Density 2 converts vp 166 to px 332 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity022', 0, async function () {
      await yieldThread();
      const vp = 166;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(332);
      expect(model.vpOf(332, density)).assertEqual(166);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1423
     * @tc.name    JsDensity023
     * @tc.desc    Density 3 converts vp 173 to px 519 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity023', 0, async function () {
      await yieldThread();
      const vp = 173;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(519);
      expect(model.vpOf(519, density)).assertEqual(173);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1424
     * @tc.name    JsDensity024
     * @tc.desc    Density 1 converts vp 180 to px 180 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity024', 0, async function () {
      await yieldThread();
      const vp = 180;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(180);
      expect(model.vpOf(180, density)).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity024 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1425
     * @tc.name    JsDensity025
     * @tc.desc    Density 1.5 converts vp 187 to px 281 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity025', 0, async function () {
      await yieldThread();
      const vp = 187;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(281);
      expect(model.vpOf(281, density)).assertEqual(187);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity025 done');
    });
}

function DensityConversionPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1426
     * @tc.name    JsDensity026
     * @tc.desc    Density 2 converts vp 194 to px 388 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity026', 0, async function () {
      await yieldThread();
      const vp = 194;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(388);
      expect(model.vpOf(388, density)).assertEqual(194);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1427
     * @tc.name    JsDensity027
     * @tc.desc    Density 3 converts vp 201 to px 603 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity027', 0, async function () {
      await yieldThread();
      const vp = 201;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(603);
      expect(model.vpOf(603, density)).assertEqual(201);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1428
     * @tc.name    JsDensity028
     * @tc.desc    Density 1 converts vp 208 to px 208 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity028', 0, async function () {
      await yieldThread();
      const vp = 208;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(208);
      expect(model.vpOf(208, density)).assertEqual(208);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity028 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1429
     * @tc.name    JsDensity029
     * @tc.desc    Density 1.5 converts vp 215 to px 323 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity029', 0, async function () {
      await yieldThread();
      const vp = 215;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(323);
      expect(model.vpOf(323, density)).assertEqual(215);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1430
     * @tc.name    JsDensity030
     * @tc.desc    Density 2 converts vp 222 to px 444 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity030', 0, async function () {
      await yieldThread();
      const vp = 222;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(444);
      expect(model.vpOf(444, density)).assertEqual(222);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity030 done');
    });
}

function DensityConversionPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1431
     * @tc.name    JsDensity031
     * @tc.desc    Density 3 converts vp 229 to px 687 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity031', 0, async function () {
      await yieldThread();
      const vp = 229;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(687);
      expect(model.vpOf(687, density)).assertEqual(229);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1432
     * @tc.name    JsDensity032
     * @tc.desc    Density 1 converts vp 236 to px 236 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity032', 0, async function () {
      await yieldThread();
      const vp = 236;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(236);
      expect(model.vpOf(236, density)).assertEqual(236);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity032 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1433
     * @tc.name    JsDensity033
     * @tc.desc    Density 1.5 converts vp 243 to px 365 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity033', 0, async function () {
      await yieldThread();
      const vp = 243;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(365);
      expect(model.vpOf(365, density)).assertEqual(243);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity033 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1434
     * @tc.name    JsDensity034
     * @tc.desc    Density 2 converts vp 250 to px 500 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity034', 0, async function () {
      await yieldThread();
      const vp = 250;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(500);
      expect(model.vpOf(500, density)).assertEqual(250);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1435
     * @tc.name    JsDensity035
     * @tc.desc    Density 3 converts vp 257 to px 771 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity035', 0, async function () {
      await yieldThread();
      const vp = 257;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(771);
      expect(model.vpOf(771, density)).assertEqual(257);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity035 done');
    });
}

function DensityConversionPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1436
     * @tc.name    JsDensity036
     * @tc.desc    Density 1 converts vp 264 to px 264 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity036', 0, async function () {
      await yieldThread();
      const vp = 264;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(264);
      expect(model.vpOf(264, density)).assertEqual(264);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity036 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1437
     * @tc.name    JsDensity037
     * @tc.desc    Density 1.5 converts vp 271 to px 407 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity037', 0, async function () {
      await yieldThread();
      const vp = 271;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(407);
      expect(model.vpOf(407, density)).assertEqual(271);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1438
     * @tc.name    JsDensity038
     * @tc.desc    Density 2 converts vp 278 to px 556 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity038', 0, async function () {
      await yieldThread();
      const vp = 278;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(556);
      expect(model.vpOf(556, density)).assertEqual(278);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1439
     * @tc.name    JsDensity039
     * @tc.desc    Density 3 converts vp 285 to px 855 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity039', 0, async function () {
      await yieldThread();
      const vp = 285;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(855);
      expect(model.vpOf(855, density)).assertEqual(285);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity039 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1440
     * @tc.name    JsDensity040
     * @tc.desc    Density 1 converts vp 292 to px 292 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity040', 0, async function () {
      await yieldThread();
      const vp = 292;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(292);
      expect(model.vpOf(292, density)).assertEqual(292);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity040 done');
    });
}

function DensityConversionPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1441
     * @tc.name    JsDensity041
     * @tc.desc    Density 1.5 converts vp 299 to px 449 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity041', 0, async function () {
      await yieldThread();
      const vp = 299;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(449);
      expect(model.vpOf(449, density)).assertEqual(299);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1442
     * @tc.name    JsDensity042
     * @tc.desc    Density 2 converts vp 18 to px 36 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity042', 0, async function () {
      await yieldThread();
      const vp = 18;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(36);
      expect(model.vpOf(36, density)).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity042 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1443
     * @tc.name    JsDensity043
     * @tc.desc    Density 3 converts vp 25 to px 75 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity043', 0, async function () {
      await yieldThread();
      const vp = 25;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(75);
      expect(model.vpOf(75, density)).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1444
     * @tc.name    JsDensity044
     * @tc.desc    Density 1 converts vp 32 to px 32 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity044', 0, async function () {
      await yieldThread();
      const vp = 32;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(32);
      expect(model.vpOf(32, density)).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity044 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1445
     * @tc.name    JsDensity045
     * @tc.desc    Density 1.5 converts vp 39 to px 59 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity045', 0, async function () {
      await yieldThread();
      const vp = 39;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(59);
      expect(model.vpOf(59, density)).assertEqual(39);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity045 done');
    });
}

function DensityConversionPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1446
     * @tc.name    JsDensity046
     * @tc.desc    Density 2 converts vp 46 to px 92 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity046', 0, async function () {
      await yieldThread();
      const vp = 46;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(92);
      expect(model.vpOf(92, density)).assertEqual(46);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1447
     * @tc.name    JsDensity047
     * @tc.desc    Density 3 converts vp 53 to px 159 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity047', 0, async function () {
      await yieldThread();
      const vp = 53;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(159);
      expect(model.vpOf(159, density)).assertEqual(53);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1448
     * @tc.name    JsDensity048
     * @tc.desc    Density 1 converts vp 60 to px 60 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity048', 0, async function () {
      await yieldThread();
      const vp = 60;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(60);
      expect(model.vpOf(60, density)).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity048 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1449
     * @tc.name    JsDensity049
     * @tc.desc    Density 1.5 converts vp 67 to px 101 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity049', 0, async function () {
      await yieldThread();
      const vp = 67;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(101);
      expect(model.vpOf(101, density)).assertEqual(67);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1450
     * @tc.name    JsDensity050
     * @tc.desc    Density 2 converts vp 74 to px 148 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity050', 0, async function () {
      await yieldThread();
      const vp = 74;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(148);
      expect(model.vpOf(148, density)).assertEqual(74);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity050 done');
    });
}

function DensityConversionPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1451
     * @tc.name    JsDensity051
     * @tc.desc    Density 3 converts vp 81 to px 243 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity051', 0, async function () {
      await yieldThread();
      const vp = 81;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(243);
      expect(model.vpOf(243, density)).assertEqual(81);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity051 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1452
     * @tc.name    JsDensity052
     * @tc.desc    Density 1 converts vp 88 to px 88 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity052', 0, async function () {
      await yieldThread();
      const vp = 88;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(88);
      expect(model.vpOf(88, density)).assertEqual(88);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity052 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1453
     * @tc.name    JsDensity053
     * @tc.desc    Density 1.5 converts vp 95 to px 143 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity053', 0, async function () {
      await yieldThread();
      const vp = 95;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(143);
      expect(model.vpOf(143, density)).assertEqual(95);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1454
     * @tc.name    JsDensity054
     * @tc.desc    Density 2 converts vp 102 to px 204 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity054', 0, async function () {
      await yieldThread();
      const vp = 102;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(204);
      expect(model.vpOf(204, density)).assertEqual(102);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity054 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1455
     * @tc.name    JsDensity055
     * @tc.desc    Density 3 converts vp 109 to px 327 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity055', 0, async function () {
      await yieldThread();
      const vp = 109;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(327);
      expect(model.vpOf(327, density)).assertEqual(109);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity055 done');
    });
}

function DensityConversionPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1456
     * @tc.name    JsDensity056
     * @tc.desc    Density 1 converts vp 116 to px 116 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity056', 0, async function () {
      await yieldThread();
      const vp = 116;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(116);
      expect(model.vpOf(116, density)).assertEqual(116);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity056 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1457
     * @tc.name    JsDensity057
     * @tc.desc    Density 1.5 converts vp 123 to px 185 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity057', 0, async function () {
      await yieldThread();
      const vp = 123;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(185);
      expect(model.vpOf(185, density)).assertEqual(123);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity057 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1458
     * @tc.name    JsDensity058
     * @tc.desc    Density 2 converts vp 130 to px 260 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity058', 0, async function () {
      await yieldThread();
      const vp = 130;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(260);
      expect(model.vpOf(260, density)).assertEqual(130);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1459
     * @tc.name    JsDensity059
     * @tc.desc    Density 3 converts vp 137 to px 411 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity059', 0, async function () {
      await yieldThread();
      const vp = 137;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(411);
      expect(model.vpOf(411, density)).assertEqual(137);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1460
     * @tc.name    JsDensity060
     * @tc.desc    Density 1 converts vp 144 to px 144 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity060', 0, async function () {
      await yieldThread();
      const vp = 144;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(144);
      expect(model.vpOf(144, density)).assertEqual(144);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity060 done');
    });
}

function DensityConversionPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1461
     * @tc.name    JsDensity061
     * @tc.desc    Density 1.5 converts vp 151 to px 227 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity061', 0, async function () {
      await yieldThread();
      const vp = 151;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(227);
      expect(model.vpOf(227, density)).assertEqual(151);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1462
     * @tc.name    JsDensity062
     * @tc.desc    Density 2 converts vp 158 to px 316 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity062', 0, async function () {
      await yieldThread();
      const vp = 158;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(316);
      expect(model.vpOf(316, density)).assertEqual(158);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1463
     * @tc.name    JsDensity063
     * @tc.desc    Density 3 converts vp 165 to px 495 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity063', 0, async function () {
      await yieldThread();
      const vp = 165;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(495);
      expect(model.vpOf(495, density)).assertEqual(165);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity063 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1464
     * @tc.name    JsDensity064
     * @tc.desc    Density 1 converts vp 172 to px 172 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity064', 0, async function () {
      await yieldThread();
      const vp = 172;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(172);
      expect(model.vpOf(172, density)).assertEqual(172);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity064 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1465
     * @tc.name    JsDensity065
     * @tc.desc    Density 1.5 converts vp 179 to px 269 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity065', 0, async function () {
      await yieldThread();
      const vp = 179;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(269);
      expect(model.vpOf(269, density)).assertEqual(179);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity065 done');
    });
}

function DensityConversionPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1466
     * @tc.name    JsDensity066
     * @tc.desc    Density 2 converts vp 186 to px 372 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity066', 0, async function () {
      await yieldThread();
      const vp = 186;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(372);
      expect(model.vpOf(372, density)).assertEqual(186);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity066 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1467
     * @tc.name    JsDensity067
     * @tc.desc    Density 3 converts vp 193 to px 579 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity067', 0, async function () {
      await yieldThread();
      const vp = 193;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(579);
      expect(model.vpOf(579, density)).assertEqual(193);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1468
     * @tc.name    JsDensity068
     * @tc.desc    Density 1 converts vp 200 to px 200 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity068', 0, async function () {
      await yieldThread();
      const vp = 200;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(200);
      expect(model.vpOf(200, density)).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity068 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1469
     * @tc.name    JsDensity069
     * @tc.desc    Density 1.5 converts vp 207 to px 311 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity069', 0, async function () {
      await yieldThread();
      const vp = 207;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(311);
      expect(model.vpOf(311, density)).assertEqual(207);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity069 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1470
     * @tc.name    JsDensity070
     * @tc.desc    Density 2 converts vp 214 to px 428 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity070', 0, async function () {
      await yieldThread();
      const vp = 214;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(428);
      expect(model.vpOf(428, density)).assertEqual(214);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity070 done');
    });
}

function DensityConversionPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1471
     * @tc.name    JsDensity071
     * @tc.desc    Density 3 converts vp 221 to px 663 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity071', 0, async function () {
      await yieldThread();
      const vp = 221;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(663);
      expect(model.vpOf(663, density)).assertEqual(221);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1472
     * @tc.name    JsDensity072
     * @tc.desc    Density 1 converts vp 228 to px 228 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity072', 0, async function () {
      await yieldThread();
      const vp = 228;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(228);
      expect(model.vpOf(228, density)).assertEqual(228);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity072 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1473
     * @tc.name    JsDensity073
     * @tc.desc    Density 1.5 converts vp 235 to px 353 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity073', 0, async function () {
      await yieldThread();
      const vp = 235;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(353);
      expect(model.vpOf(353, density)).assertEqual(235);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1474
     * @tc.name    JsDensity074
     * @tc.desc    Density 2 converts vp 242 to px 484 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity074', 0, async function () {
      await yieldThread();
      const vp = 242;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(484);
      expect(model.vpOf(484, density)).assertEqual(242);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1475
     * @tc.name    JsDensity075
     * @tc.desc    Density 3 converts vp 249 to px 747 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity075', 0, async function () {
      await yieldThread();
      const vp = 249;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(747);
      expect(model.vpOf(747, density)).assertEqual(249);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity075 done');
    });
}

function DensityConversionPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1476
     * @tc.name    JsDensity076
     * @tc.desc    Density 1 converts vp 256 to px 256 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity076', 0, async function () {
      await yieldThread();
      const vp = 256;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(256);
      expect(model.vpOf(256, density)).assertEqual(256);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity076 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1477
     * @tc.name    JsDensity077
     * @tc.desc    Density 1.5 converts vp 263 to px 395 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity077', 0, async function () {
      await yieldThread();
      const vp = 263;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(395);
      expect(model.vpOf(395, density)).assertEqual(263);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1478
     * @tc.name    JsDensity078
     * @tc.desc    Density 2 converts vp 270 to px 540 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity078', 0, async function () {
      await yieldThread();
      const vp = 270;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(540);
      expect(model.vpOf(540, density)).assertEqual(270);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity078 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1479
     * @tc.name    JsDensity079
     * @tc.desc    Density 3 converts vp 277 to px 831 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity079', 0, async function () {
      await yieldThread();
      const vp = 277;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(831);
      expect(model.vpOf(831, density)).assertEqual(277);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1480
     * @tc.name    JsDensity080
     * @tc.desc    Density 1 converts vp 284 to px 284 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity080', 0, async function () {
      await yieldThread();
      const vp = 284;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(284);
      expect(model.vpOf(284, density)).assertEqual(284);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity080 done');
    });
}

function DensityConversionPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1481
     * @tc.name    JsDensity081
     * @tc.desc    Density 1.5 converts vp 291 to px 437 seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity081', 0, async function () {
      await yieldThread();
      const vp = 291;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(437);
      expect(model.vpOf(437, density)).assertEqual(291);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity081 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1482
     * @tc.name    JsDensity082
     * @tc.desc    Density 2 converts vp 298 to px 596 seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity082', 0, async function () {
      await yieldThread();
      const vp = 298;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(596);
      expect(model.vpOf(596, density)).assertEqual(298);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1483
     * @tc.name    JsDensity083
     * @tc.desc    Density 3 converts vp 17 to px 51 seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity083', 0, async function () {
      await yieldThread();
      const vp = 17;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(51);
      expect(model.vpOf(51, density)).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1484
     * @tc.name    JsDensity084
     * @tc.desc    Density 1 converts vp 24 to px 24 seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity084', 0, async function () {
      await yieldThread();
      const vp = 24;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(24);
      expect(model.vpOf(24, density)).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity084 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1485
     * @tc.name    JsDensity085
     * @tc.desc    Density 1.5 converts vp 31 to px 47 seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity085', 0, async function () {
      await yieldThread();
      const vp = 31;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(47);
      expect(model.vpOf(47, density)).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity085 done');
    });
}

function DensityConversionPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1486
     * @tc.name    JsDensity086
     * @tc.desc    Density 2 converts vp 38 to px 76 seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity086', 0, async function () {
      await yieldThread();
      const vp = 38;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(76);
      expect(model.vpOf(76, density)).assertEqual(38);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1487
     * @tc.name    JsDensity087
     * @tc.desc    Density 3 converts vp 45 to px 135 seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity087', 0, async function () {
      await yieldThread();
      const vp = 45;
      const density = 3;
      expect(model.pxOf(vp, density)).assertEqual(135);
      expect(model.vpOf(135, density)).assertEqual(45);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity087 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1488
     * @tc.name    JsDensity088
     * @tc.desc    Density 1 converts vp 52 to px 52 seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity088', 0, async function () {
      await yieldThread();
      const vp = 52;
      const density = 1;
      expect(model.pxOf(vp, density)).assertEqual(52);
      expect(model.vpOf(52, density)).assertEqual(52);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity088 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1489
     * @tc.name    JsDensity089
     * @tc.desc    Density 1.5 converts vp 59 to px 89 seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity089', 0, async function () {
      await yieldThread();
      const vp = 59;
      const density = 1.5;
      expect(model.pxOf(vp, density)).assertEqual(89);
      expect(model.vpOf(89, density)).assertEqual(59);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1490
     * @tc.name    JsDensity090
     * @tc.desc    Density 2 converts vp 66 to px 132 seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsDensity090', 0, async function () {
      await yieldThread();
      const vp = 66;
      const density = 2;
      expect(model.pxOf(vp, density)).assertEqual(132);
      expect(model.vpOf(132, density)).assertEqual(66);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsDensity090 done');
    });
}

export default function densityConversionSuite() {
  describe('DensityConversionSuite', function () {
    DensityConversionPart001();
    DensityConversionPart002();
    DensityConversionPart003();
    DensityConversionPart004();
    DensityConversionPart005();
    DensityConversionPart006();
    DensityConversionPart007();
    DensityConversionPart008();
    DensityConversionPart009();
    DensityConversionPart010();
    DensityConversionPart011();
    DensityConversionPart012();
    DensityConversionPart013();
    DensityConversionPart014();
    DensityConversionPart015();
    DensityConversionPart016();
    DensityConversionPart017();
    DensityConversionPart018();
  });
}
