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

function PathSegmentPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2521
     * @tc.name    JsPathSegment001
     * @tc.desc    Path with 2 segments keeps single segment s1_1 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment001', 0, async function () {
      await yieldThread();
      const path = 's1_0/s1_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s1_1')).assertEqual(1);
      expect(model.segmentCount('a1/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2522
     * @tc.name    JsPathSegment002
     * @tc.desc    Path with 3 segments keeps single segment s2_2 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment002', 0, async function () {
      await yieldThread();
      const path = 's2_0/s2_1/s2_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s2_2')).assertEqual(1);
      expect(model.segmentCount('a2/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2523
     * @tc.name    JsPathSegment003
     * @tc.desc    Path with 4 segments keeps single segment s3_3 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment003', 0, async function () {
      await yieldThread();
      const path = 's3_0/s3_1/s3_2/s3_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s3_3')).assertEqual(1);
      expect(model.segmentCount('a3/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2524
     * @tc.name    JsPathSegment004
     * @tc.desc    Path with 5 segments keeps single segment s4_4 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment004', 0, async function () {
      await yieldThread();
      const path = 's4_0/s4_1/s4_2/s4_3/s4_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s4_4')).assertEqual(1);
      expect(model.segmentCount('a4/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment004 done');
    });
}

function PathSegmentPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2525
     * @tc.name    JsPathSegment005
     * @tc.desc    Path with 6 segments keeps single segment s5_5 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment005', 0, async function () {
      await yieldThread();
      const path = 's5_0/s5_1/s5_2/s5_3/s5_4/s5_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s5_5')).assertEqual(1);
      expect(model.segmentCount('a5/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2526
     * @tc.name    JsPathSegment006
     * @tc.desc    Path with 1 segments keeps single segment s6_0 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment006', 0, async function () {
      await yieldThread();
      const path = 's6_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s6_0')).assertEqual(1);
      expect(model.segmentCount('a6/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment006 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2527
     * @tc.name    JsPathSegment007
     * @tc.desc    Path with 2 segments keeps single segment s7_1 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment007', 0, async function () {
      await yieldThread();
      const path = 's7_0/s7_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s7_1')).assertEqual(1);
      expect(model.segmentCount('a7/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2528
     * @tc.name    JsPathSegment008
     * @tc.desc    Path with 3 segments keeps single segment s8_2 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment008', 0, async function () {
      await yieldThread();
      const path = 's8_0/s8_1/s8_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s8_2')).assertEqual(1);
      expect(model.segmentCount('a8/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment008 done');
    });
}

function PathSegmentPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2529
     * @tc.name    JsPathSegment009
     * @tc.desc    Path with 4 segments keeps single segment s9_3 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment009', 0, async function () {
      await yieldThread();
      const path = 's9_0/s9_1/s9_2/s9_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s9_3')).assertEqual(1);
      expect(model.segmentCount('a9/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment009 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2530
     * @tc.name    JsPathSegment010
     * @tc.desc    Path with 5 segments keeps single segment s10_4 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment010', 0, async function () {
      await yieldThread();
      const path = 's10_0/s10_1/s10_2/s10_3/s10_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s10_4')).assertEqual(1);
      expect(model.segmentCount('a10/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2531
     * @tc.name    JsPathSegment011
     * @tc.desc    Path with 6 segments keeps single segment s11_5 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment011', 0, async function () {
      await yieldThread();
      const path = 's11_0/s11_1/s11_2/s11_3/s11_4/s11_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s11_5')).assertEqual(1);
      expect(model.segmentCount('a11/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2532
     * @tc.name    JsPathSegment012
     * @tc.desc    Path with 1 segments keeps single segment s12_0 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment012', 0, async function () {
      await yieldThread();
      const path = 's12_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s12_0')).assertEqual(1);
      expect(model.segmentCount('a12/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment012 done');
    });
}

function PathSegmentPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2533
     * @tc.name    JsPathSegment013
     * @tc.desc    Path with 2 segments keeps single segment s13_1 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment013', 0, async function () {
      await yieldThread();
      const path = 's13_0/s13_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s13_1')).assertEqual(1);
      expect(model.segmentCount('a13/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2534
     * @tc.name    JsPathSegment014
     * @tc.desc    Path with 3 segments keeps single segment s14_2 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment014', 0, async function () {
      await yieldThread();
      const path = 's14_0/s14_1/s14_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s14_2')).assertEqual(1);
      expect(model.segmentCount('a14/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2535
     * @tc.name    JsPathSegment015
     * @tc.desc    Path with 4 segments keeps single segment s15_3 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment015', 0, async function () {
      await yieldThread();
      const path = 's15_0/s15_1/s15_2/s15_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s15_3')).assertEqual(1);
      expect(model.segmentCount('a15/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment015 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2536
     * @tc.name    JsPathSegment016
     * @tc.desc    Path with 5 segments keeps single segment s16_4 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment016', 0, async function () {
      await yieldThread();
      const path = 's16_0/s16_1/s16_2/s16_3/s16_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s16_4')).assertEqual(1);
      expect(model.segmentCount('a16/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment016 done');
    });
}

function PathSegmentPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2537
     * @tc.name    JsPathSegment017
     * @tc.desc    Path with 6 segments keeps single segment s17_5 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment017', 0, async function () {
      await yieldThread();
      const path = 's17_0/s17_1/s17_2/s17_3/s17_4/s17_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s17_5')).assertEqual(1);
      expect(model.segmentCount('a17/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2538
     * @tc.name    JsPathSegment018
     * @tc.desc    Path with 1 segments keeps single segment s18_0 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment018', 0, async function () {
      await yieldThread();
      const path = 's18_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s18_0')).assertEqual(1);
      expect(model.segmentCount('a18/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment018 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2539
     * @tc.name    JsPathSegment019
     * @tc.desc    Path with 2 segments keeps single segment s19_1 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment019', 0, async function () {
      await yieldThread();
      const path = 's19_0/s19_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s19_1')).assertEqual(1);
      expect(model.segmentCount('a19/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2540
     * @tc.name    JsPathSegment020
     * @tc.desc    Path with 3 segments keeps single segment s20_2 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment020', 0, async function () {
      await yieldThread();
      const path = 's20_0/s20_1/s20_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s20_2')).assertEqual(1);
      expect(model.segmentCount('a20/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment020 done');
    });
}

function PathSegmentPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2541
     * @tc.name    JsPathSegment021
     * @tc.desc    Path with 4 segments keeps single segment s21_3 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment021', 0, async function () {
      await yieldThread();
      const path = 's21_0/s21_1/s21_2/s21_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s21_3')).assertEqual(1);
      expect(model.segmentCount('a21/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment021 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2542
     * @tc.name    JsPathSegment022
     * @tc.desc    Path with 5 segments keeps single segment s22_4 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment022', 0, async function () {
      await yieldThread();
      const path = 's22_0/s22_1/s22_2/s22_3/s22_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s22_4')).assertEqual(1);
      expect(model.segmentCount('a22/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2543
     * @tc.name    JsPathSegment023
     * @tc.desc    Path with 6 segments keeps single segment s23_5 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment023', 0, async function () {
      await yieldThread();
      const path = 's23_0/s23_1/s23_2/s23_3/s23_4/s23_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s23_5')).assertEqual(1);
      expect(model.segmentCount('a23/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2544
     * @tc.name    JsPathSegment024
     * @tc.desc    Path with 1 segments keeps single segment s24_0 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment024', 0, async function () {
      await yieldThread();
      const path = 's24_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s24_0')).assertEqual(1);
      expect(model.segmentCount('a24/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment024 done');
    });
}

function PathSegmentPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2545
     * @tc.name    JsPathSegment025
     * @tc.desc    Path with 2 segments keeps single segment s25_1 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment025', 0, async function () {
      await yieldThread();
      const path = 's25_0/s25_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s25_1')).assertEqual(1);
      expect(model.segmentCount('a25/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2546
     * @tc.name    JsPathSegment026
     * @tc.desc    Path with 3 segments keeps single segment s26_2 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment026', 0, async function () {
      await yieldThread();
      const path = 's26_0/s26_1/s26_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s26_2')).assertEqual(1);
      expect(model.segmentCount('a26/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2547
     * @tc.name    JsPathSegment027
     * @tc.desc    Path with 4 segments keeps single segment s27_3 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment027', 0, async function () {
      await yieldThread();
      const path = 's27_0/s27_1/s27_2/s27_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s27_3')).assertEqual(1);
      expect(model.segmentCount('a27/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2548
     * @tc.name    JsPathSegment028
     * @tc.desc    Path with 5 segments keeps single segment s28_4 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment028', 0, async function () {
      await yieldThread();
      const path = 's28_0/s28_1/s28_2/s28_3/s28_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s28_4')).assertEqual(1);
      expect(model.segmentCount('a28/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment028 done');
    });
}

function PathSegmentPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2549
     * @tc.name    JsPathSegment029
     * @tc.desc    Path with 6 segments keeps single segment s29_5 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment029', 0, async function () {
      await yieldThread();
      const path = 's29_0/s29_1/s29_2/s29_3/s29_4/s29_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s29_5')).assertEqual(1);
      expect(model.segmentCount('a29/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2550
     * @tc.name    JsPathSegment030
     * @tc.desc    Path with 1 segments keeps single segment s30_0 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment030', 0, async function () {
      await yieldThread();
      const path = 's30_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s30_0')).assertEqual(1);
      expect(model.segmentCount('a30/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment030 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2551
     * @tc.name    JsPathSegment031
     * @tc.desc    Path with 2 segments keeps single segment s31_1 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment031', 0, async function () {
      await yieldThread();
      const path = 's31_0/s31_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s31_1')).assertEqual(1);
      expect(model.segmentCount('a31/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2552
     * @tc.name    JsPathSegment032
     * @tc.desc    Path with 3 segments keeps single segment s32_2 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment032', 0, async function () {
      await yieldThread();
      const path = 's32_0/s32_1/s32_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s32_2')).assertEqual(1);
      expect(model.segmentCount('a32/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment032 done');
    });
}

function PathSegmentPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2553
     * @tc.name    JsPathSegment033
     * @tc.desc    Path with 4 segments keeps single segment s33_3 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment033', 0, async function () {
      await yieldThread();
      const path = 's33_0/s33_1/s33_2/s33_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s33_3')).assertEqual(1);
      expect(model.segmentCount('a33/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment033 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2554
     * @tc.name    JsPathSegment034
     * @tc.desc    Path with 5 segments keeps single segment s34_4 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment034', 0, async function () {
      await yieldThread();
      const path = 's34_0/s34_1/s34_2/s34_3/s34_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s34_4')).assertEqual(1);
      expect(model.segmentCount('a34/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2555
     * @tc.name    JsPathSegment035
     * @tc.desc    Path with 6 segments keeps single segment s35_5 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment035', 0, async function () {
      await yieldThread();
      const path = 's35_0/s35_1/s35_2/s35_3/s35_4/s35_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s35_5')).assertEqual(1);
      expect(model.segmentCount('a35/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2556
     * @tc.name    JsPathSegment036
     * @tc.desc    Path with 1 segments keeps single segment s36_0 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment036', 0, async function () {
      await yieldThread();
      const path = 's36_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s36_0')).assertEqual(1);
      expect(model.segmentCount('a36/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment036 done');
    });
}

function PathSegmentPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2557
     * @tc.name    JsPathSegment037
     * @tc.desc    Path with 2 segments keeps single segment s37_1 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment037', 0, async function () {
      await yieldThread();
      const path = 's37_0/s37_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s37_1')).assertEqual(1);
      expect(model.segmentCount('a37/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2558
     * @tc.name    JsPathSegment038
     * @tc.desc    Path with 3 segments keeps single segment s38_2 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment038', 0, async function () {
      await yieldThread();
      const path = 's38_0/s38_1/s38_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s38_2')).assertEqual(1);
      expect(model.segmentCount('a38/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2559
     * @tc.name    JsPathSegment039
     * @tc.desc    Path with 4 segments keeps single segment s39_3 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment039', 0, async function () {
      await yieldThread();
      const path = 's39_0/s39_1/s39_2/s39_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s39_3')).assertEqual(1);
      expect(model.segmentCount('a39/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment039 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2560
     * @tc.name    JsPathSegment040
     * @tc.desc    Path with 5 segments keeps single segment s40_4 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment040', 0, async function () {
      await yieldThread();
      const path = 's40_0/s40_1/s40_2/s40_3/s40_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s40_4')).assertEqual(1);
      expect(model.segmentCount('a40/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment040 done');
    });
}

function PathSegmentPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2561
     * @tc.name    JsPathSegment041
     * @tc.desc    Path with 6 segments keeps single segment s41_5 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment041', 0, async function () {
      await yieldThread();
      const path = 's41_0/s41_1/s41_2/s41_3/s41_4/s41_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s41_5')).assertEqual(1);
      expect(model.segmentCount('a41/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2562
     * @tc.name    JsPathSegment042
     * @tc.desc    Path with 1 segments keeps single segment s42_0 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment042', 0, async function () {
      await yieldThread();
      const path = 's42_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s42_0')).assertEqual(1);
      expect(model.segmentCount('a42/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment042 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2563
     * @tc.name    JsPathSegment043
     * @tc.desc    Path with 2 segments keeps single segment s43_1 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment043', 0, async function () {
      await yieldThread();
      const path = 's43_0/s43_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s43_1')).assertEqual(1);
      expect(model.segmentCount('a43/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2564
     * @tc.name    JsPathSegment044
     * @tc.desc    Path with 3 segments keeps single segment s44_2 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment044', 0, async function () {
      await yieldThread();
      const path = 's44_0/s44_1/s44_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s44_2')).assertEqual(1);
      expect(model.segmentCount('a44/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment044 done');
    });
}

function PathSegmentPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2565
     * @tc.name    JsPathSegment045
     * @tc.desc    Path with 4 segments keeps single segment s45_3 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment045', 0, async function () {
      await yieldThread();
      const path = 's45_0/s45_1/s45_2/s45_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s45_3')).assertEqual(1);
      expect(model.segmentCount('a45/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment045 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2566
     * @tc.name    JsPathSegment046
     * @tc.desc    Path with 5 segments keeps single segment s46_4 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment046', 0, async function () {
      await yieldThread();
      const path = 's46_0/s46_1/s46_2/s46_3/s46_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s46_4')).assertEqual(1);
      expect(model.segmentCount('a46/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2567
     * @tc.name    JsPathSegment047
     * @tc.desc    Path with 6 segments keeps single segment s47_5 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment047', 0, async function () {
      await yieldThread();
      const path = 's47_0/s47_1/s47_2/s47_3/s47_4/s47_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s47_5')).assertEqual(1);
      expect(model.segmentCount('a47/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2568
     * @tc.name    JsPathSegment048
     * @tc.desc    Path with 1 segments keeps single segment s48_0 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment048', 0, async function () {
      await yieldThread();
      const path = 's48_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s48_0')).assertEqual(1);
      expect(model.segmentCount('a48/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment048 done');
    });
}

function PathSegmentPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2569
     * @tc.name    JsPathSegment049
     * @tc.desc    Path with 2 segments keeps single segment s49_1 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment049', 0, async function () {
      await yieldThread();
      const path = 's49_0/s49_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s49_1')).assertEqual(1);
      expect(model.segmentCount('a49/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2570
     * @tc.name    JsPathSegment050
     * @tc.desc    Path with 3 segments keeps single segment s50_2 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment050', 0, async function () {
      await yieldThread();
      const path = 's50_0/s50_1/s50_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s50_2')).assertEqual(1);
      expect(model.segmentCount('a50/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment050 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2571
     * @tc.name    JsPathSegment051
     * @tc.desc    Path with 4 segments keeps single segment s51_3 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment051', 0, async function () {
      await yieldThread();
      const path = 's51_0/s51_1/s51_2/s51_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s51_3')).assertEqual(1);
      expect(model.segmentCount('a51/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment051 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2572
     * @tc.name    JsPathSegment052
     * @tc.desc    Path with 5 segments keeps single segment s52_4 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment052', 0, async function () {
      await yieldThread();
      const path = 's52_0/s52_1/s52_2/s52_3/s52_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s52_4')).assertEqual(1);
      expect(model.segmentCount('a52/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment052 done');
    });
}

function PathSegmentPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2573
     * @tc.name    JsPathSegment053
     * @tc.desc    Path with 6 segments keeps single segment s53_5 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment053', 0, async function () {
      await yieldThread();
      const path = 's53_0/s53_1/s53_2/s53_3/s53_4/s53_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s53_5')).assertEqual(1);
      expect(model.segmentCount('a53/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2574
     * @tc.name    JsPathSegment054
     * @tc.desc    Path with 1 segments keeps single segment s54_0 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment054', 0, async function () {
      await yieldThread();
      const path = 's54_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s54_0')).assertEqual(1);
      expect(model.segmentCount('a54/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment054 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2575
     * @tc.name    JsPathSegment055
     * @tc.desc    Path with 2 segments keeps single segment s55_1 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment055', 0, async function () {
      await yieldThread();
      const path = 's55_0/s55_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s55_1')).assertEqual(1);
      expect(model.segmentCount('a55/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2576
     * @tc.name    JsPathSegment056
     * @tc.desc    Path with 3 segments keeps single segment s56_2 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment056', 0, async function () {
      await yieldThread();
      const path = 's56_0/s56_1/s56_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s56_2')).assertEqual(1);
      expect(model.segmentCount('a56/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment056 done');
    });
}

function PathSegmentPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2577
     * @tc.name    JsPathSegment057
     * @tc.desc    Path with 4 segments keeps single segment s57_3 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment057', 0, async function () {
      await yieldThread();
      const path = 's57_0/s57_1/s57_2/s57_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s57_3')).assertEqual(1);
      expect(model.segmentCount('a57/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment057 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2578
     * @tc.name    JsPathSegment058
     * @tc.desc    Path with 5 segments keeps single segment s58_4 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment058', 0, async function () {
      await yieldThread();
      const path = 's58_0/s58_1/s58_2/s58_3/s58_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s58_4')).assertEqual(1);
      expect(model.segmentCount('a58/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2579
     * @tc.name    JsPathSegment059
     * @tc.desc    Path with 6 segments keeps single segment s59_5 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment059', 0, async function () {
      await yieldThread();
      const path = 's59_0/s59_1/s59_2/s59_3/s59_4/s59_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s59_5')).assertEqual(1);
      expect(model.segmentCount('a59/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2580
     * @tc.name    JsPathSegment060
     * @tc.desc    Path with 1 segments keeps single segment s60_0 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment060', 0, async function () {
      await yieldThread();
      const path = 's60_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s60_0')).assertEqual(1);
      expect(model.segmentCount('a60/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment060 done');
    });
}

function PathSegmentPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2581
     * @tc.name    JsPathSegment061
     * @tc.desc    Path with 2 segments keeps single segment s61_1 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment061', 0, async function () {
      await yieldThread();
      const path = 's61_0/s61_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s61_1')).assertEqual(1);
      expect(model.segmentCount('a61/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2582
     * @tc.name    JsPathSegment062
     * @tc.desc    Path with 3 segments keeps single segment s62_2 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment062', 0, async function () {
      await yieldThread();
      const path = 's62_0/s62_1/s62_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s62_2')).assertEqual(1);
      expect(model.segmentCount('a62/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2583
     * @tc.name    JsPathSegment063
     * @tc.desc    Path with 4 segments keeps single segment s63_3 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment063', 0, async function () {
      await yieldThread();
      const path = 's63_0/s63_1/s63_2/s63_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s63_3')).assertEqual(1);
      expect(model.segmentCount('a63/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment063 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2584
     * @tc.name    JsPathSegment064
     * @tc.desc    Path with 5 segments keeps single segment s64_4 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment064', 0, async function () {
      await yieldThread();
      const path = 's64_0/s64_1/s64_2/s64_3/s64_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s64_4')).assertEqual(1);
      expect(model.segmentCount('a64/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment064 done');
    });
}

function PathSegmentPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2585
     * @tc.name    JsPathSegment065
     * @tc.desc    Path with 6 segments keeps single segment s65_5 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment065', 0, async function () {
      await yieldThread();
      const path = 's65_0/s65_1/s65_2/s65_3/s65_4/s65_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s65_5')).assertEqual(1);
      expect(model.segmentCount('a65/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment065 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2586
     * @tc.name    JsPathSegment066
     * @tc.desc    Path with 1 segments keeps single segment s66_0 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment066', 0, async function () {
      await yieldThread();
      const path = 's66_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s66_0')).assertEqual(1);
      expect(model.segmentCount('a66/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment066 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2587
     * @tc.name    JsPathSegment067
     * @tc.desc    Path with 2 segments keeps single segment s67_1 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment067', 0, async function () {
      await yieldThread();
      const path = 's67_0/s67_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s67_1')).assertEqual(1);
      expect(model.segmentCount('a67/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2588
     * @tc.name    JsPathSegment068
     * @tc.desc    Path with 3 segments keeps single segment s68_2 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment068', 0, async function () {
      await yieldThread();
      const path = 's68_0/s68_1/s68_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s68_2')).assertEqual(1);
      expect(model.segmentCount('a68/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment068 done');
    });
}

function PathSegmentPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2589
     * @tc.name    JsPathSegment069
     * @tc.desc    Path with 4 segments keeps single segment s69_3 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment069', 0, async function () {
      await yieldThread();
      const path = 's69_0/s69_1/s69_2/s69_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s69_3')).assertEqual(1);
      expect(model.segmentCount('a69/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment069 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2590
     * @tc.name    JsPathSegment070
     * @tc.desc    Path with 5 segments keeps single segment s70_4 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment070', 0, async function () {
      await yieldThread();
      const path = 's70_0/s70_1/s70_2/s70_3/s70_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s70_4')).assertEqual(1);
      expect(model.segmentCount('a70/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment070 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2591
     * @tc.name    JsPathSegment071
     * @tc.desc    Path with 6 segments keeps single segment s71_5 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment071', 0, async function () {
      await yieldThread();
      const path = 's71_0/s71_1/s71_2/s71_3/s71_4/s71_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s71_5')).assertEqual(1);
      expect(model.segmentCount('a71/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2592
     * @tc.name    JsPathSegment072
     * @tc.desc    Path with 1 segments keeps single segment s72_0 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment072', 0, async function () {
      await yieldThread();
      const path = 's72_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s72_0')).assertEqual(1);
      expect(model.segmentCount('a72/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment072 done');
    });
}

function PathSegmentPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2593
     * @tc.name    JsPathSegment073
     * @tc.desc    Path with 2 segments keeps single segment s73_1 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment073', 0, async function () {
      await yieldThread();
      const path = 's73_0/s73_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s73_1')).assertEqual(1);
      expect(model.segmentCount('a73/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2594
     * @tc.name    JsPathSegment074
     * @tc.desc    Path with 3 segments keeps single segment s74_2 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment074', 0, async function () {
      await yieldThread();
      const path = 's74_0/s74_1/s74_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s74_2')).assertEqual(1);
      expect(model.segmentCount('a74/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2595
     * @tc.name    JsPathSegment075
     * @tc.desc    Path with 4 segments keeps single segment s75_3 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment075', 0, async function () {
      await yieldThread();
      const path = 's75_0/s75_1/s75_2/s75_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s75_3')).assertEqual(1);
      expect(model.segmentCount('a75/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment075 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2596
     * @tc.name    JsPathSegment076
     * @tc.desc    Path with 5 segments keeps single segment s76_4 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment076', 0, async function () {
      await yieldThread();
      const path = 's76_0/s76_1/s76_2/s76_3/s76_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s76_4')).assertEqual(1);
      expect(model.segmentCount('a76/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment076 done');
    });
}

function PathSegmentPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2597
     * @tc.name    JsPathSegment077
     * @tc.desc    Path with 6 segments keeps single segment s77_5 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment077', 0, async function () {
      await yieldThread();
      const path = 's77_0/s77_1/s77_2/s77_3/s77_4/s77_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s77_5')).assertEqual(1);
      expect(model.segmentCount('a77/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2598
     * @tc.name    JsPathSegment078
     * @tc.desc    Path with 1 segments keeps single segment s78_0 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment078', 0, async function () {
      await yieldThread();
      const path = 's78_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s78_0')).assertEqual(1);
      expect(model.segmentCount('a78/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment078 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2599
     * @tc.name    JsPathSegment079
     * @tc.desc    Path with 2 segments keeps single segment s79_1 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment079', 0, async function () {
      await yieldThread();
      const path = 's79_0/s79_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s79_1')).assertEqual(1);
      expect(model.segmentCount('a79/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2600
     * @tc.name    JsPathSegment080
     * @tc.desc    Path with 3 segments keeps single segment s80_2 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment080', 0, async function () {
      await yieldThread();
      const path = 's80_0/s80_1/s80_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s80_2')).assertEqual(1);
      expect(model.segmentCount('a80/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment080 done');
    });
}

function PathSegmentPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2601
     * @tc.name    JsPathSegment081
     * @tc.desc    Path with 4 segments keeps single segment s81_3 seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment081', 0, async function () {
      await yieldThread();
      const path = 's81_0/s81_1/s81_2/s81_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s81_3')).assertEqual(1);
      expect(model.segmentCount('a81/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment081 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2602
     * @tc.name    JsPathSegment082
     * @tc.desc    Path with 5 segments keeps single segment s82_4 seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment082', 0, async function () {
      await yieldThread();
      const path = 's82_0/s82_1/s82_2/s82_3/s82_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s82_4')).assertEqual(1);
      expect(model.segmentCount('a82/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2603
     * @tc.name    JsPathSegment083
     * @tc.desc    Path with 6 segments keeps single segment s83_5 seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment083', 0, async function () {
      await yieldThread();
      const path = 's83_0/s83_1/s83_2/s83_3/s83_4/s83_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s83_5')).assertEqual(1);
      expect(model.segmentCount('a83/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2604
     * @tc.name    JsPathSegment084
     * @tc.desc    Path with 1 segments keeps single segment s84_0 seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment084', 0, async function () {
      await yieldThread();
      const path = 's84_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s84_0')).assertEqual(1);
      expect(model.segmentCount('a84/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment084 done');
    });
}

function PathSegmentPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2605
     * @tc.name    JsPathSegment085
     * @tc.desc    Path with 2 segments keeps single segment s85_1 seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment085', 0, async function () {
      await yieldThread();
      const path = 's85_0/s85_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s85_1')).assertEqual(1);
      expect(model.segmentCount('a85/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment085 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2606
     * @tc.name    JsPathSegment086
     * @tc.desc    Path with 3 segments keeps single segment s86_2 seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment086', 0, async function () {
      await yieldThread();
      const path = 's86_0/s86_1/s86_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s86_2')).assertEqual(1);
      expect(model.segmentCount('a86/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2607
     * @tc.name    JsPathSegment087
     * @tc.desc    Path with 4 segments keeps single segment s87_3 seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment087', 0, async function () {
      await yieldThread();
      const path = 's87_0/s87_1/s87_2/s87_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s87_3')).assertEqual(1);
      expect(model.segmentCount('a87/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment087 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2608
     * @tc.name    JsPathSegment088
     * @tc.desc    Path with 5 segments keeps single segment s88_4 seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment088', 0, async function () {
      await yieldThread();
      const path = 's88_0/s88_1/s88_2/s88_3/s88_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s88_4')).assertEqual(1);
      expect(model.segmentCount('a88/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment088 done');
    });
}

function PathSegmentPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2609
     * @tc.name    JsPathSegment089
     * @tc.desc    Path with 6 segments keeps single segment s89_5 seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment089', 0, async function () {
      await yieldThread();
      const path = 's89_0/s89_1/s89_2/s89_3/s89_4/s89_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s89_5')).assertEqual(1);
      expect(model.segmentCount('a89/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2610
     * @tc.name    JsPathSegment090
     * @tc.desc    Path with 1 segments keeps single segment s90_0 seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment090', 0, async function () {
      await yieldThread();
      const path = 's90_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s90_0')).assertEqual(1);
      expect(model.segmentCount('a90/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment090 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2611
     * @tc.name    JsPathSegment091
     * @tc.desc    Path with 2 segments keeps single segment s91_1 seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment091', 0, async function () {
      await yieldThread();
      const path = 's91_0/s91_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s91_1')).assertEqual(1);
      expect(model.segmentCount('a91/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment091 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2612
     * @tc.name    JsPathSegment092
     * @tc.desc    Path with 3 segments keeps single segment s92_2 seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment092', 0, async function () {
      await yieldThread();
      const path = 's92_0/s92_1/s92_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s92_2')).assertEqual(1);
      expect(model.segmentCount('a92/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment092 done');
    });
}

function PathSegmentPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2613
     * @tc.name    JsPathSegment093
     * @tc.desc    Path with 4 segments keeps single segment s93_3 seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment093', 0, async function () {
      await yieldThread();
      const path = 's93_0/s93_1/s93_2/s93_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s93_3')).assertEqual(1);
      expect(model.segmentCount('a93/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment093 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2614
     * @tc.name    JsPathSegment094
     * @tc.desc    Path with 5 segments keeps single segment s94_4 seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment094', 0, async function () {
      await yieldThread();
      const path = 's94_0/s94_1/s94_2/s94_3/s94_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s94_4')).assertEqual(1);
      expect(model.segmentCount('a94/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment094 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2615
     * @tc.name    JsPathSegment095
     * @tc.desc    Path with 6 segments keeps single segment s95_5 seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment095', 0, async function () {
      await yieldThread();
      const path = 's95_0/s95_1/s95_2/s95_3/s95_4/s95_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s95_5')).assertEqual(1);
      expect(model.segmentCount('a95/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment095 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2616
     * @tc.name    JsPathSegment096
     * @tc.desc    Path with 1 segments keeps single segment s96_0 seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment096', 0, async function () {
      await yieldThread();
      const path = 's96_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s96_0')).assertEqual(1);
      expect(model.segmentCount('a96/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment096 done');
    });
}

function PathSegmentPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2617
     * @tc.name    JsPathSegment097
     * @tc.desc    Path with 2 segments keeps single segment s97_1 seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment097', 0, async function () {
      await yieldThread();
      const path = 's97_0/s97_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s97_1')).assertEqual(1);
      expect(model.segmentCount('a97/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment097 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2618
     * @tc.name    JsPathSegment098
     * @tc.desc    Path with 3 segments keeps single segment s98_2 seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment098', 0, async function () {
      await yieldThread();
      const path = 's98_0/s98_1/s98_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s98_2')).assertEqual(1);
      expect(model.segmentCount('a98/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment098 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2619
     * @tc.name    JsPathSegment099
     * @tc.desc    Path with 4 segments keeps single segment s99_3 seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment099', 0, async function () {
      await yieldThread();
      const path = 's99_0/s99_1/s99_2/s99_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s99_3')).assertEqual(1);
      expect(model.segmentCount('a99/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment099 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2620
     * @tc.name    JsPathSegment100
     * @tc.desc    Path with 5 segments keeps single segment s100_4 seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment100', 0, async function () {
      await yieldThread();
      const path = 's100_0/s100_1/s100_2/s100_3/s100_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s100_4')).assertEqual(1);
      expect(model.segmentCount('a100/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment100 done');
    });
}

function PathSegmentPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2621
     * @tc.name    JsPathSegment101
     * @tc.desc    Path with 6 segments keeps single segment s101_5 seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment101', 0, async function () {
      await yieldThread();
      const path = 's101_0/s101_1/s101_2/s101_3/s101_4/s101_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s101_5')).assertEqual(1);
      expect(model.segmentCount('a101/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2622
     * @tc.name    JsPathSegment102
     * @tc.desc    Path with 1 segments keeps single segment s102_0 seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment102', 0, async function () {
      await yieldThread();
      const path = 's102_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s102_0')).assertEqual(1);
      expect(model.segmentCount('a102/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment102 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2623
     * @tc.name    JsPathSegment103
     * @tc.desc    Path with 2 segments keeps single segment s103_1 seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment103', 0, async function () {
      await yieldThread();
      const path = 's103_0/s103_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s103_1')).assertEqual(1);
      expect(model.segmentCount('a103/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment103 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2624
     * @tc.name    JsPathSegment104
     * @tc.desc    Path with 3 segments keeps single segment s104_2 seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment104', 0, async function () {
      await yieldThread();
      const path = 's104_0/s104_1/s104_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s104_2')).assertEqual(1);
      expect(model.segmentCount('a104/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment104 done');
    });
}

function PathSegmentPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2625
     * @tc.name    JsPathSegment105
     * @tc.desc    Path with 4 segments keeps single segment s105_3 seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment105', 0, async function () {
      await yieldThread();
      const path = 's105_0/s105_1/s105_2/s105_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s105_3')).assertEqual(1);
      expect(model.segmentCount('a105/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment105 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2626
     * @tc.name    JsPathSegment106
     * @tc.desc    Path with 5 segments keeps single segment s106_4 seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment106', 0, async function () {
      await yieldThread();
      const path = 's106_0/s106_1/s106_2/s106_3/s106_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s106_4')).assertEqual(1);
      expect(model.segmentCount('a106/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment106 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2627
     * @tc.name    JsPathSegment107
     * @tc.desc    Path with 6 segments keeps single segment s107_5 seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment107', 0, async function () {
      await yieldThread();
      const path = 's107_0/s107_1/s107_2/s107_3/s107_4/s107_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s107_5')).assertEqual(1);
      expect(model.segmentCount('a107/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment107 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2628
     * @tc.name    JsPathSegment108
     * @tc.desc    Path with 1 segments keeps single segment s108_0 seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment108', 0, async function () {
      await yieldThread();
      const path = 's108_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s108_0')).assertEqual(1);
      expect(model.segmentCount('a108/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment108 done');
    });
}

function PathSegmentPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2629
     * @tc.name    JsPathSegment109
     * @tc.desc    Path with 2 segments keeps single segment s109_1 seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment109', 0, async function () {
      await yieldThread();
      const path = 's109_0/s109_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s109_1')).assertEqual(1);
      expect(model.segmentCount('a109/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment109 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2630
     * @tc.name    JsPathSegment110
     * @tc.desc    Path with 3 segments keeps single segment s110_2 seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment110', 0, async function () {
      await yieldThread();
      const path = 's110_0/s110_1/s110_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s110_2')).assertEqual(1);
      expect(model.segmentCount('a110/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment110 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2631
     * @tc.name    JsPathSegment111
     * @tc.desc    Path with 4 segments keeps single segment s111_3 seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment111', 0, async function () {
      await yieldThread();
      const path = 's111_0/s111_1/s111_2/s111_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s111_3')).assertEqual(1);
      expect(model.segmentCount('a111/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment111 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2632
     * @tc.name    JsPathSegment112
     * @tc.desc    Path with 5 segments keeps single segment s112_4 seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment112', 0, async function () {
      await yieldThread();
      const path = 's112_0/s112_1/s112_2/s112_3/s112_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s112_4')).assertEqual(1);
      expect(model.segmentCount('a112/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment112 done');
    });
}

function PathSegmentPart029() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2633
     * @tc.name    JsPathSegment113
     * @tc.desc    Path with 6 segments keeps single segment s113_5 seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment113', 0, async function () {
      await yieldThread();
      const path = 's113_0/s113_1/s113_2/s113_3/s113_4/s113_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s113_5')).assertEqual(1);
      expect(model.segmentCount('a113/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2634
     * @tc.name    JsPathSegment114
     * @tc.desc    Path with 1 segments keeps single segment s114_0 seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment114', 0, async function () {
      await yieldThread();
      const path = 's114_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s114_0')).assertEqual(1);
      expect(model.segmentCount('a114/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment114 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2635
     * @tc.name    JsPathSegment115
     * @tc.desc    Path with 2 segments keeps single segment s115_1 seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment115', 0, async function () {
      await yieldThread();
      const path = 's115_0/s115_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s115_1')).assertEqual(1);
      expect(model.segmentCount('a115/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment115 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2636
     * @tc.name    JsPathSegment116
     * @tc.desc    Path with 3 segments keeps single segment s116_2 seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment116', 0, async function () {
      await yieldThread();
      const path = 's116_0/s116_1/s116_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s116_2')).assertEqual(1);
      expect(model.segmentCount('a116/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment116 done');
    });
}

function PathSegmentPart030() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2637
     * @tc.name    JsPathSegment117
     * @tc.desc    Path with 4 segments keeps single segment s117_3 seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment117', 0, async function () {
      await yieldThread();
      const path = 's117_0/s117_1/s117_2/s117_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s117_3')).assertEqual(1);
      expect(model.segmentCount('a117/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment117 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2638
     * @tc.name    JsPathSegment118
     * @tc.desc    Path with 5 segments keeps single segment s118_4 seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment118', 0, async function () {
      await yieldThread();
      const path = 's118_0/s118_1/s118_2/s118_3/s118_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s118_4')).assertEqual(1);
      expect(model.segmentCount('a118/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment118 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2639
     * @tc.name    JsPathSegment119
     * @tc.desc    Path with 6 segments keeps single segment s119_5 seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment119', 0, async function () {
      await yieldThread();
      const path = 's119_0/s119_1/s119_2/s119_3/s119_4/s119_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s119_5')).assertEqual(1);
      expect(model.segmentCount('a119/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment119 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2640
     * @tc.name    JsPathSegment120
     * @tc.desc    Path with 1 segments keeps single segment s120_0 seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment120', 0, async function () {
      await yieldThread();
      const path = 's120_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s120_0')).assertEqual(1);
      expect(model.segmentCount('a120/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment120 done');
    });
}

function PathSegmentPart031() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2641
     * @tc.name    JsPathSegment121
     * @tc.desc    Path with 2 segments keeps single segment s121_1 seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment121', 0, async function () {
      await yieldThread();
      const path = 's121_0/s121_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s121_1')).assertEqual(1);
      expect(model.segmentCount('a121/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment121 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2642
     * @tc.name    JsPathSegment122
     * @tc.desc    Path with 3 segments keeps single segment s122_2 seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment122', 0, async function () {
      await yieldThread();
      const path = 's122_0/s122_1/s122_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s122_2')).assertEqual(1);
      expect(model.segmentCount('a122/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment122 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2643
     * @tc.name    JsPathSegment123
     * @tc.desc    Path with 4 segments keeps single segment s123_3 seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment123', 0, async function () {
      await yieldThread();
      const path = 's123_0/s123_1/s123_2/s123_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s123_3')).assertEqual(1);
      expect(model.segmentCount('a123/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment123 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2644
     * @tc.name    JsPathSegment124
     * @tc.desc    Path with 5 segments keeps single segment s124_4 seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment124', 0, async function () {
      await yieldThread();
      const path = 's124_0/s124_1/s124_2/s124_3/s124_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s124_4')).assertEqual(1);
      expect(model.segmentCount('a124/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment124 done');
    });
}

function PathSegmentPart032() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2645
     * @tc.name    JsPathSegment125
     * @tc.desc    Path with 6 segments keeps single segment s125_5 seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment125', 0, async function () {
      await yieldThread();
      const path = 's125_0/s125_1/s125_2/s125_3/s125_4/s125_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s125_5')).assertEqual(1);
      expect(model.segmentCount('a125/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment125 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2646
     * @tc.name    JsPathSegment126
     * @tc.desc    Path with 1 segments keeps single segment s126_0 seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment126', 0, async function () {
      await yieldThread();
      const path = 's126_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s126_0')).assertEqual(1);
      expect(model.segmentCount('a126/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment126 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2647
     * @tc.name    JsPathSegment127
     * @tc.desc    Path with 2 segments keeps single segment s127_1 seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment127', 0, async function () {
      await yieldThread();
      const path = 's127_0/s127_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s127_1')).assertEqual(1);
      expect(model.segmentCount('a127/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2648
     * @tc.name    JsPathSegment128
     * @tc.desc    Path with 3 segments keeps single segment s128_2 seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment128', 0, async function () {
      await yieldThread();
      const path = 's128_0/s128_1/s128_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s128_2')).assertEqual(1);
      expect(model.segmentCount('a128/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment128 done');
    });
}

function PathSegmentPart033() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2649
     * @tc.name    JsPathSegment129
     * @tc.desc    Path with 4 segments keeps single segment s129_3 seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment129', 0, async function () {
      await yieldThread();
      const path = 's129_0/s129_1/s129_2/s129_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s129_3')).assertEqual(1);
      expect(model.segmentCount('a129/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment129 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2650
     * @tc.name    JsPathSegment130
     * @tc.desc    Path with 5 segments keeps single segment s130_4 seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment130', 0, async function () {
      await yieldThread();
      const path = 's130_0/s130_1/s130_2/s130_3/s130_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s130_4')).assertEqual(1);
      expect(model.segmentCount('a130/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment130 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2651
     * @tc.name    JsPathSegment131
     * @tc.desc    Path with 6 segments keeps single segment s131_5 seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment131', 0, async function () {
      await yieldThread();
      const path = 's131_0/s131_1/s131_2/s131_3/s131_4/s131_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s131_5')).assertEqual(1);
      expect(model.segmentCount('a131/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment131 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2652
     * @tc.name    JsPathSegment132
     * @tc.desc    Path with 1 segments keeps single segment s132_0 seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment132', 0, async function () {
      await yieldThread();
      const path = 's132_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s132_0')).assertEqual(1);
      expect(model.segmentCount('a132/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment132 done');
    });
}

function PathSegmentPart034() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2653
     * @tc.name    JsPathSegment133
     * @tc.desc    Path with 2 segments keeps single segment s133_1 seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment133', 0, async function () {
      await yieldThread();
      const path = 's133_0/s133_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s133_1')).assertEqual(1);
      expect(model.segmentCount('a133/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment133 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2654
     * @tc.name    JsPathSegment134
     * @tc.desc    Path with 3 segments keeps single segment s134_2 seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment134', 0, async function () {
      await yieldThread();
      const path = 's134_0/s134_1/s134_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s134_2')).assertEqual(1);
      expect(model.segmentCount('a134/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment134 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2655
     * @tc.name    JsPathSegment135
     * @tc.desc    Path with 4 segments keeps single segment s135_3 seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment135', 0, async function () {
      await yieldThread();
      const path = 's135_0/s135_1/s135_2/s135_3';
      expect(model.segmentCount(path)).assertEqual(4);
      expect(model.segmentCount(path + '/')).assertEqual(5);
      expect(model.segmentCount('s135_3')).assertEqual(1);
      expect(model.segmentCount('a135/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment135 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2656
     * @tc.name    JsPathSegment136
     * @tc.desc    Path with 5 segments keeps single segment s136_4 seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment136', 0, async function () {
      await yieldThread();
      const path = 's136_0/s136_1/s136_2/s136_3/s136_4';
      expect(model.segmentCount(path)).assertEqual(5);
      expect(model.segmentCount(path + '/')).assertEqual(6);
      expect(model.segmentCount('s136_4')).assertEqual(1);
      expect(model.segmentCount('a136/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment136 done');
    });
}

function PathSegmentPart035() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2657
     * @tc.name    JsPathSegment137
     * @tc.desc    Path with 6 segments keeps single segment s137_5 seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment137', 0, async function () {
      await yieldThread();
      const path = 's137_0/s137_1/s137_2/s137_3/s137_4/s137_5';
      expect(model.segmentCount(path)).assertEqual(6);
      expect(model.segmentCount(path + '/')).assertEqual(7);
      expect(model.segmentCount('s137_5')).assertEqual(1);
      expect(model.segmentCount('a137/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment137 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2658
     * @tc.name    JsPathSegment138
     * @tc.desc    Path with 1 segments keeps single segment s138_0 seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment138', 0, async function () {
      await yieldThread();
      const path = 's138_0';
      expect(model.segmentCount(path)).assertEqual(1);
      expect(model.segmentCount(path + '/')).assertEqual(2);
      expect(model.segmentCount('s138_0')).assertEqual(1);
      expect(model.segmentCount('a138/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment138 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2659
     * @tc.name    JsPathSegment139
     * @tc.desc    Path with 2 segments keeps single segment s139_1 seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment139', 0, async function () {
      await yieldThread();
      const path = 's139_0/s139_1';
      expect(model.segmentCount(path)).assertEqual(2);
      expect(model.segmentCount(path + '/')).assertEqual(3);
      expect(model.segmentCount('s139_1')).assertEqual(1);
      expect(model.segmentCount('a139/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2660
     * @tc.name    JsPathSegment140
     * @tc.desc    Path with 3 segments keeps single segment s140_2 seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPathSegment140', 0, async function () {
      await yieldThread();
      const path = 's140_0/s140_1/s140_2';
      expect(model.segmentCount(path)).assertEqual(3);
      expect(model.segmentCount(path + '/')).assertEqual(4);
      expect(model.segmentCount('s140_2')).assertEqual(1);
      expect(model.segmentCount('a140/b/c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPathSegment140 done');
    });
}

function PathSegmentGroup001() {
  PathSegmentPart001();
  PathSegmentPart002();
  PathSegmentPart003();
  PathSegmentPart004();
  PathSegmentPart005();
  PathSegmentPart006();
  PathSegmentPart007();
  PathSegmentPart008();
  PathSegmentPart009();
  PathSegmentPart010();
  PathSegmentPart011();
  PathSegmentPart012();
  PathSegmentPart013();
  PathSegmentPart014();
  PathSegmentPart015();
  PathSegmentPart016();
  PathSegmentPart017();
  PathSegmentPart018();
  PathSegmentPart019();
  PathSegmentPart020();
  PathSegmentPart021();
  PathSegmentPart022();
  PathSegmentPart023();
  PathSegmentPart024();
  PathSegmentPart025();
  PathSegmentPart026();
  PathSegmentPart027();
  PathSegmentPart028();
  PathSegmentPart029();
  PathSegmentPart030();
  PathSegmentPart031();
  PathSegmentPart032();
  PathSegmentPart033();
  PathSegmentPart034();
  PathSegmentPart035();
}

export default function pathSegmentSuite() {
  describe('PathSegmentSuite', function () {
    PathSegmentGroup001();
  });
}
