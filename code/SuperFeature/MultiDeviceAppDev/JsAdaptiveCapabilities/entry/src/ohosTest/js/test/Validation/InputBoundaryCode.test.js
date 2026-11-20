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

function InputBoundaryCodePart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1261
     * @tc.name    JsBoundary001
     * @tc.desc    Boundary codes width 311 parts 13 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary001', 0, async function () {
      await yieldThread();
      const width = 311;
      const parts = 13;
      expect(model.codeOfWidth(width)).assertEqual(1);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1262
     * @tc.name    JsBoundary002
     * @tc.desc    Boundary codes width 322 parts 10 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary002', 0, async function () {
      await yieldThread();
      const width = 322;
      const parts = 10;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1263
     * @tc.name    JsBoundary003
     * @tc.desc    Boundary codes width 333 parts 7 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary003', 0, async function () {
      await yieldThread();
      const width = 333;
      const parts = 7;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1264
     * @tc.name    JsBoundary004
     * @tc.desc    Boundary codes width 344 parts 4 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary004', 0, async function () {
      await yieldThread();
      const width = 344;
      const parts = 4;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary004 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1265
     * @tc.name    JsBoundary005
     * @tc.desc    Boundary codes width 355.5 parts 1 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary005', 0, async function () {
      await yieldThread();
      const width = 355.5;
      const parts = 1;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary005 done');
    });
}

function InputBoundaryCodePart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1266
     * @tc.name    JsBoundary006
     * @tc.desc    Boundary codes width 366 parts 14 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary006', 0, async function () {
      await yieldThread();
      const width = 366;
      const parts = 14;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary006 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1267
     * @tc.name    JsBoundary007
     * @tc.desc    Boundary codes width 377 parts 11.5 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary007', 0, async function () {
      await yieldThread();
      const width = 377;
      const parts = 11.5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1268
     * @tc.name    JsBoundary008
     * @tc.desc    Boundary codes width 388 parts 8 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary008', 0, async function () {
      await yieldThread();
      const width = 388;
      const parts = 8;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary008 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1269
     * @tc.name    JsBoundary009
     * @tc.desc    Boundary codes width 399 parts 5 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary009', 0, async function () {
      await yieldThread();
      const width = 399;
      const parts = 5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary009 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1270
     * @tc.name    JsBoundary010
     * @tc.desc    Boundary codes width 410.5 parts 2 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary010', 0, async function () {
      await yieldThread();
      const width = 410.5;
      const parts = 2;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary010 done');
    });
}

function InputBoundaryCodePart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1271
     * @tc.name    JsBoundary011
     * @tc.desc    Boundary codes width 421 parts 15 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary011', 0, async function () {
      await yieldThread();
      const width = 421;
      const parts = 15;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1272
     * @tc.name    JsBoundary012
     * @tc.desc    Boundary codes width 432 parts 12 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary012', 0, async function () {
      await yieldThread();
      const width = 432;
      const parts = 12;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary012 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1273
     * @tc.name    JsBoundary013
     * @tc.desc    Boundary codes width 443 parts 9 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary013', 0, async function () {
      await yieldThread();
      const width = 443;
      const parts = 9;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1274
     * @tc.name    JsBoundary014
     * @tc.desc    Boundary codes width 454 parts 6.5 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary014', 0, async function () {
      await yieldThread();
      const width = 454;
      const parts = 6.5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1275
     * @tc.name    JsBoundary015
     * @tc.desc    Boundary codes width 465.5 parts 3 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary015', 0, async function () {
      await yieldThread();
      const width = 465.5;
      const parts = 3;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary015 done');
    });
}

function InputBoundaryCodePart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1276
     * @tc.name    JsBoundary016
     * @tc.desc    Boundary codes width 476 parts 0 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary016', 0, async function () {
      await yieldThread();
      const width = 476;
      const parts = 0;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary016 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1277
     * @tc.name    JsBoundary017
     * @tc.desc    Boundary codes width 487 parts 13 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary017', 0, async function () {
      await yieldThread();
      const width = 487;
      const parts = 13;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1278
     * @tc.name    JsBoundary018
     * @tc.desc    Boundary codes width 498 parts 10 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary018', 0, async function () {
      await yieldThread();
      const width = 498;
      const parts = 10;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary018 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1279
     * @tc.name    JsBoundary019
     * @tc.desc    Boundary codes width 509 parts 7 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary019', 0, async function () {
      await yieldThread();
      const width = 509;
      const parts = 7;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1280
     * @tc.name    JsBoundary020
     * @tc.desc    Boundary codes width 520.5 parts 4 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary020', 0, async function () {
      await yieldThread();
      const width = 520.5;
      const parts = 4;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary020 done');
    });
}

function InputBoundaryCodePart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1281
     * @tc.name    JsBoundary021
     * @tc.desc    Boundary codes width 531 parts 1.5 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary021', 0, async function () {
      await yieldThread();
      const width = 531;
      const parts = 1.5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary021 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1282
     * @tc.name    JsBoundary022
     * @tc.desc    Boundary codes width 542 parts 14 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary022', 0, async function () {
      await yieldThread();
      const width = 542;
      const parts = 14;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1283
     * @tc.name    JsBoundary023
     * @tc.desc    Boundary codes width 553 parts 11 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary023', 0, async function () {
      await yieldThread();
      const width = 553;
      const parts = 11;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1284
     * @tc.name    JsBoundary024
     * @tc.desc    Boundary codes width 564 parts 8 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary024', 0, async function () {
      await yieldThread();
      const width = 564;
      const parts = 8;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary024 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1285
     * @tc.name    JsBoundary025
     * @tc.desc    Boundary codes width 575.5 parts 5 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary025', 0, async function () {
      await yieldThread();
      const width = 575.5;
      const parts = 5;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary025 done');
    });
}

function InputBoundaryCodePart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1286
     * @tc.name    JsBoundary026
     * @tc.desc    Boundary codes width 586 parts 2 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary026', 0, async function () {
      await yieldThread();
      const width = 586;
      const parts = 2;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1287
     * @tc.name    JsBoundary027
     * @tc.desc    Boundary codes width 597 parts 15 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary027', 0, async function () {
      await yieldThread();
      const width = 597;
      const parts = 15;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1288
     * @tc.name    JsBoundary028
     * @tc.desc    Boundary codes width 608 parts 12.5 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary028', 0, async function () {
      await yieldThread();
      const width = 608;
      const parts = 12.5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary028 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1289
     * @tc.name    JsBoundary029
     * @tc.desc    Boundary codes width 619 parts 9 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary029', 0, async function () {
      await yieldThread();
      const width = 619;
      const parts = 9;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1290
     * @tc.name    JsBoundary030
     * @tc.desc    Boundary codes width 630.5 parts 6 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary030', 0, async function () {
      await yieldThread();
      const width = 630.5;
      const parts = 6;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary030 done');
    });
}

function InputBoundaryCodePart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1291
     * @tc.name    JsBoundary031
     * @tc.desc    Boundary codes width 641 parts 3 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary031', 0, async function () {
      await yieldThread();
      const width = 641;
      const parts = 3;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1292
     * @tc.name    JsBoundary032
     * @tc.desc    Boundary codes width 652 parts 0 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary032', 0, async function () {
      await yieldThread();
      const width = 652;
      const parts = 0;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary032 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1293
     * @tc.name    JsBoundary033
     * @tc.desc    Boundary codes width 663 parts 13 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary033', 0, async function () {
      await yieldThread();
      const width = 663;
      const parts = 13;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary033 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1294
     * @tc.name    JsBoundary034
     * @tc.desc    Boundary codes width 674 parts 10 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary034', 0, async function () {
      await yieldThread();
      const width = 674;
      const parts = 10;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1295
     * @tc.name    JsBoundary035
     * @tc.desc    Boundary codes width 685.5 parts 7.5 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary035', 0, async function () {
      await yieldThread();
      const width = 685.5;
      const parts = 7.5;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary035 done');
    });
}

function InputBoundaryCodePart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1296
     * @tc.name    JsBoundary036
     * @tc.desc    Boundary codes width 696 parts 4 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary036', 0, async function () {
      await yieldThread();
      const width = 696;
      const parts = 4;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary036 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1297
     * @tc.name    JsBoundary037
     * @tc.desc    Boundary codes width 707 parts 1 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary037', 0, async function () {
      await yieldThread();
      const width = 707;
      const parts = 1;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1298
     * @tc.name    JsBoundary038
     * @tc.desc    Boundary codes width 718 parts 14 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary038', 0, async function () {
      await yieldThread();
      const width = 718;
      const parts = 14;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1299
     * @tc.name    JsBoundary039
     * @tc.desc    Boundary codes width 729 parts 11 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary039', 0, async function () {
      await yieldThread();
      const width = 729;
      const parts = 11;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary039 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1300
     * @tc.name    JsBoundary040
     * @tc.desc    Boundary codes width 740.5 parts 8 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary040', 0, async function () {
      await yieldThread();
      const width = 740.5;
      const parts = 8;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary040 done');
    });
}

function InputBoundaryCodePart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1301
     * @tc.name    JsBoundary041
     * @tc.desc    Boundary codes width 751 parts 5 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary041', 0, async function () {
      await yieldThread();
      const width = 751;
      const parts = 5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1302
     * @tc.name    JsBoundary042
     * @tc.desc    Boundary codes width 762 parts 2.5 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary042', 0, async function () {
      await yieldThread();
      const width = 762;
      const parts = 2.5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary042 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1303
     * @tc.name    JsBoundary043
     * @tc.desc    Boundary codes width 773 parts 15 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary043', 0, async function () {
      await yieldThread();
      const width = 773;
      const parts = 15;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1304
     * @tc.name    JsBoundary044
     * @tc.desc    Boundary codes width 784 parts 12 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary044', 0, async function () {
      await yieldThread();
      const width = 784;
      const parts = 12;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary044 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1305
     * @tc.name    JsBoundary045
     * @tc.desc    Boundary codes width 795.5 parts 9 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary045', 0, async function () {
      await yieldThread();
      const width = 795.5;
      const parts = 9;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary045 done');
    });
}

function InputBoundaryCodePart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1306
     * @tc.name    JsBoundary046
     * @tc.desc    Boundary codes width 806 parts 6 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary046', 0, async function () {
      await yieldThread();
      const width = 806;
      const parts = 6;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1307
     * @tc.name    JsBoundary047
     * @tc.desc    Boundary codes width 817 parts 3 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary047', 0, async function () {
      await yieldThread();
      const width = 817;
      const parts = 3;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1308
     * @tc.name    JsBoundary048
     * @tc.desc    Boundary codes width 828 parts 0 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary048', 0, async function () {
      await yieldThread();
      const width = 828;
      const parts = 0;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary048 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1309
     * @tc.name    JsBoundary049
     * @tc.desc    Boundary codes width 839 parts 13.5 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary049', 0, async function () {
      await yieldThread();
      const width = 839;
      const parts = 13.5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1310
     * @tc.name    JsBoundary050
     * @tc.desc    Boundary codes width 850.5 parts 10 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary050', 0, async function () {
      await yieldThread();
      const width = 850.5;
      const parts = 10;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary050 done');
    });
}

function InputBoundaryCodePart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1311
     * @tc.name    JsBoundary051
     * @tc.desc    Boundary codes width 861 parts 7 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary051', 0, async function () {
      await yieldThread();
      const width = 861;
      const parts = 7;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary051 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1312
     * @tc.name    JsBoundary052
     * @tc.desc    Boundary codes width 872 parts 4 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary052', 0, async function () {
      await yieldThread();
      const width = 872;
      const parts = 4;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary052 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1313
     * @tc.name    JsBoundary053
     * @tc.desc    Boundary codes width 883 parts 1 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary053', 0, async function () {
      await yieldThread();
      const width = 883;
      const parts = 1;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1314
     * @tc.name    JsBoundary054
     * @tc.desc    Boundary codes width 894 parts 14 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary054', 0, async function () {
      await yieldThread();
      const width = 894;
      const parts = 14;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary054 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1315
     * @tc.name    JsBoundary055
     * @tc.desc    Boundary codes width 905.5 parts 11 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary055', 0, async function () {
      await yieldThread();
      const width = 905.5;
      const parts = 11;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary055 done');
    });
}

function InputBoundaryCodePart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1316
     * @tc.name    JsBoundary056
     * @tc.desc    Boundary codes width 916 parts 8.5 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary056', 0, async function () {
      await yieldThread();
      const width = 916;
      const parts = 8.5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary056 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1317
     * @tc.name    JsBoundary057
     * @tc.desc    Boundary codes width 927 parts 5 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary057', 0, async function () {
      await yieldThread();
      const width = 927;
      const parts = 5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary057 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1318
     * @tc.name    JsBoundary058
     * @tc.desc    Boundary codes width 938 parts 2 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary058', 0, async function () {
      await yieldThread();
      const width = 938;
      const parts = 2;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1319
     * @tc.name    JsBoundary059
     * @tc.desc    Boundary codes width 949 parts 15 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary059', 0, async function () {
      await yieldThread();
      const width = 949;
      const parts = 15;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1320
     * @tc.name    JsBoundary060
     * @tc.desc    Boundary codes width 960.5 parts 12 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary060', 0, async function () {
      await yieldThread();
      const width = 960.5;
      const parts = 12;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary060 done');
    });
}

function InputBoundaryCodePart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1321
     * @tc.name    JsBoundary061
     * @tc.desc    Boundary codes width 971 parts 9 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary061', 0, async function () {
      await yieldThread();
      const width = 971;
      const parts = 9;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1322
     * @tc.name    JsBoundary062
     * @tc.desc    Boundary codes width 982 parts 6 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary062', 0, async function () {
      await yieldThread();
      const width = 982;
      const parts = 6;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1323
     * @tc.name    JsBoundary063
     * @tc.desc    Boundary codes width 993 parts 3.5 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary063', 0, async function () {
      await yieldThread();
      const width = 993;
      const parts = 3.5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary063 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1324
     * @tc.name    JsBoundary064
     * @tc.desc    Boundary codes width 1004 parts 0 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary064', 0, async function () {
      await yieldThread();
      const width = 1004;
      const parts = 0;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary064 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1325
     * @tc.name    JsBoundary065
     * @tc.desc    Boundary codes width 1015.5 parts 13 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary065', 0, async function () {
      await yieldThread();
      const width = 1015.5;
      const parts = 13;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary065 done');
    });
}

function InputBoundaryCodePart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1326
     * @tc.name    JsBoundary066
     * @tc.desc    Boundary codes width 1026 parts 10 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary066', 0, async function () {
      await yieldThread();
      const width = 1026;
      const parts = 10;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary066 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1327
     * @tc.name    JsBoundary067
     * @tc.desc    Boundary codes width 1037 parts 7 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary067', 0, async function () {
      await yieldThread();
      const width = 1037;
      const parts = 7;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1328
     * @tc.name    JsBoundary068
     * @tc.desc    Boundary codes width 1048 parts 4 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary068', 0, async function () {
      await yieldThread();
      const width = 1048;
      const parts = 4;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary068 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1329
     * @tc.name    JsBoundary069
     * @tc.desc    Boundary codes width 1059 parts 1 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary069', 0, async function () {
      await yieldThread();
      const width = 1059;
      const parts = 1;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary069 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1330
     * @tc.name    JsBoundary070
     * @tc.desc    Boundary codes width 1070.5 parts 14.5 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary070', 0, async function () {
      await yieldThread();
      const width = 1070.5;
      const parts = 14.5;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary070 done');
    });
}

function InputBoundaryCodePart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1331
     * @tc.name    JsBoundary071
     * @tc.desc    Boundary codes width 1081 parts 11 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary071', 0, async function () {
      await yieldThread();
      const width = 1081;
      const parts = 11;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1332
     * @tc.name    JsBoundary072
     * @tc.desc    Boundary codes width 1092 parts 8 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary072', 0, async function () {
      await yieldThread();
      const width = 1092;
      const parts = 8;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary072 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1333
     * @tc.name    JsBoundary073
     * @tc.desc    Boundary codes width 1103 parts 5 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary073', 0, async function () {
      await yieldThread();
      const width = 1103;
      const parts = 5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1334
     * @tc.name    JsBoundary074
     * @tc.desc    Boundary codes width 1114 parts 2 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary074', 0, async function () {
      await yieldThread();
      const width = 1114;
      const parts = 2;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1335
     * @tc.name    JsBoundary075
     * @tc.desc    Boundary codes width 1125.5 parts 15 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary075', 0, async function () {
      await yieldThread();
      const width = 1125.5;
      const parts = 15;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary075 done');
    });
}

function InputBoundaryCodePart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1336
     * @tc.name    JsBoundary076
     * @tc.desc    Boundary codes width 1136 parts 12 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary076', 0, async function () {
      await yieldThread();
      const width = 1136;
      const parts = 12;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary076 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1337
     * @tc.name    JsBoundary077
     * @tc.desc    Boundary codes width 1147 parts 9.5 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary077', 0, async function () {
      await yieldThread();
      const width = 1147;
      const parts = 9.5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1338
     * @tc.name    JsBoundary078
     * @tc.desc    Boundary codes width 1158 parts 6 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary078', 0, async function () {
      await yieldThread();
      const width = 1158;
      const parts = 6;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary078 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1339
     * @tc.name    JsBoundary079
     * @tc.desc    Boundary codes width 1169 parts 3 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary079', 0, async function () {
      await yieldThread();
      const width = 1169;
      const parts = 3;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1340
     * @tc.name    JsBoundary080
     * @tc.desc    Boundary codes width 1180.5 parts 0 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary080', 0, async function () {
      await yieldThread();
      const width = 1180.5;
      const parts = 0;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary080 done');
    });
}

function InputBoundaryCodePart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1341
     * @tc.name    JsBoundary081
     * @tc.desc    Boundary codes width 1191 parts 13 seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary081', 0, async function () {
      await yieldThread();
      const width = 1191;
      const parts = 13;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary081 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1342
     * @tc.name    JsBoundary082
     * @tc.desc    Boundary codes width 1202 parts 10 seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary082', 0, async function () {
      await yieldThread();
      const width = 1202;
      const parts = 10;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1343
     * @tc.name    JsBoundary083
     * @tc.desc    Boundary codes width 1213 parts 7 seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary083', 0, async function () {
      await yieldThread();
      const width = 1213;
      const parts = 7;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1344
     * @tc.name    JsBoundary084
     * @tc.desc    Boundary codes width 1224 parts 4.5 seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary084', 0, async function () {
      await yieldThread();
      const width = 1224;
      const parts = 4.5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary084 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1345
     * @tc.name    JsBoundary085
     * @tc.desc    Boundary codes width 1235.5 parts 1 seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary085', 0, async function () {
      await yieldThread();
      const width = 1235.5;
      const parts = 1;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary085 done');
    });
}

function InputBoundaryCodePart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1346
     * @tc.name    JsBoundary086
     * @tc.desc    Boundary codes width 1246 parts 14 seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary086', 0, async function () {
      await yieldThread();
      const width = 1246;
      const parts = 14;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1347
     * @tc.name    JsBoundary087
     * @tc.desc    Boundary codes width 1257 parts 11 seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary087', 0, async function () {
      await yieldThread();
      const width = 1257;
      const parts = 11;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary087 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1348
     * @tc.name    JsBoundary088
     * @tc.desc    Boundary codes width 1268 parts 8 seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary088', 0, async function () {
      await yieldThread();
      const width = 1268;
      const parts = 8;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary088 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1349
     * @tc.name    JsBoundary089
     * @tc.desc    Boundary codes width 1279 parts 5 seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary089', 0, async function () {
      await yieldThread();
      const width = 1279;
      const parts = 5;
      expect(model.codeOfWidth(width)).assertEqual(0);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1350
     * @tc.name    JsBoundary090
     * @tc.desc    Boundary codes width 1290.5 parts 2 seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBoundary090', 0, async function () {
      await yieldThread();
      const width = 1290.5;
      const parts = 2;
      expect(model.codeOfWidth(width)).assertEqual(3);
      expect(model.codeOfParts(parts)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBoundary090 done');
    });
}

export default function inputBoundaryCodeSuite() {
  describe('InputBoundaryCodeSuite', function () {
    InputBoundaryCodePart001();
    InputBoundaryCodePart002();
    InputBoundaryCodePart003();
    InputBoundaryCodePart004();
    InputBoundaryCodePart005();
    InputBoundaryCodePart006();
    InputBoundaryCodePart007();
    InputBoundaryCodePart008();
    InputBoundaryCodePart009();
    InputBoundaryCodePart010();
    InputBoundaryCodePart011();
    InputBoundaryCodePart012();
    InputBoundaryCodePart013();
    InputBoundaryCodePart014();
    InputBoundaryCodePart015();
    InputBoundaryCodePart016();
    InputBoundaryCodePart017();
    InputBoundaryCodePart018();
  });
}
