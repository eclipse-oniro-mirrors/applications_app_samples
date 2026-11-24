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

function GridPartitionValidationPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0281
     * @tc.name    JsPartition001
     * @tc.desc    Partition 17 into 4 parts extra 1 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition001', 0, async function () {
      await yieldThread();
      const sizes = model.partition(17, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(17);
      expect(sizes[0]).assertEqual(5);
      expect(sizes[1]).assertEqual(4);
      expect(sizes[2]).assertEqual(4);
      expect(model.offsetOf(sizes, 3)).assertEqual(13);
      expect(model.isValidSpan(sizes, 17)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0282
     * @tc.name    JsPartition002
     * @tc.desc    Partition 24 into 7 parts extra 3 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition002', 0, async function () {
      await yieldThread();
      const sizes = model.partition(24, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(24);
      expect(sizes[0]).assertEqual(4);
      expect(sizes[1]).assertEqual(4);
      expect(sizes[2]).assertEqual(4);
      expect(model.offsetOf(sizes, 3)).assertEqual(12);
      expect(model.isValidSpan(sizes, 24)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0283
     * @tc.name    JsPartition003
     * @tc.desc    Partition 31 into 10 parts extra 1 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition003', 0, async function () {
      await yieldThread();
      const sizes = model.partition(31, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(31);
      expect(sizes[0]).assertEqual(4);
      expect(sizes[1]).assertEqual(3);
      expect(sizes[2]).assertEqual(3);
      expect(model.offsetOf(sizes, 3)).assertEqual(10);
      expect(model.isValidSpan(sizes, 31)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition003 done');
    });
}

function GridPartitionValidationPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0284
     * @tc.name    JsPartition004
     * @tc.desc    Partition 38 into 1 parts extra 0 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition004', 0, async function () {
      await yieldThread();
      const sizes = model.partition(38, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(38);
      expect(sizes[0]).assertEqual(38);
      expect(model.offsetOf(sizes, 1)).assertEqual(38);
      expect(model.isValidSpan(sizes, 38)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition004 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0285
     * @tc.name    JsPartition005
     * @tc.desc    Partition 45 into 4 parts extra 1 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition005', 0, async function () {
      await yieldThread();
      const sizes = model.partition(45, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(45);
      expect(sizes[0]).assertEqual(12);
      expect(sizes[1]).assertEqual(11);
      expect(sizes[2]).assertEqual(11);
      expect(model.offsetOf(sizes, 3)).assertEqual(34);
      expect(model.isValidSpan(sizes, 45)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0286
     * @tc.name    JsPartition006
     * @tc.desc    Partition 52 into 7 parts extra 3 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition006', 0, async function () {
      await yieldThread();
      const sizes = model.partition(52, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(52);
      expect(sizes[0]).assertEqual(8);
      expect(sizes[1]).assertEqual(8);
      expect(sizes[2]).assertEqual(8);
      expect(model.offsetOf(sizes, 3)).assertEqual(24);
      expect(model.isValidSpan(sizes, 52)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition006 done');
    });
}

function GridPartitionValidationPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0287
     * @tc.name    JsPartition007
     * @tc.desc    Partition 59 into 10 parts extra 9 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition007', 0, async function () {
      await yieldThread();
      const sizes = model.partition(59, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(59);
      expect(sizes[0]).assertEqual(6);
      expect(sizes[1]).assertEqual(6);
      expect(sizes[2]).assertEqual(6);
      expect(model.offsetOf(sizes, 3)).assertEqual(18);
      expect(model.isValidSpan(sizes, 59)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0288
     * @tc.name    JsPartition008
     * @tc.desc    Partition 66 into 1 parts extra 0 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition008', 0, async function () {
      await yieldThread();
      const sizes = model.partition(66, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(66);
      expect(sizes[0]).assertEqual(66);
      expect(model.offsetOf(sizes, 1)).assertEqual(66);
      expect(model.isValidSpan(sizes, 66)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition008 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0289
     * @tc.name    JsPartition009
     * @tc.desc    Partition 73 into 4 parts extra 1 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition009', 0, async function () {
      await yieldThread();
      const sizes = model.partition(73, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(73);
      expect(sizes[0]).assertEqual(19);
      expect(sizes[1]).assertEqual(18);
      expect(sizes[2]).assertEqual(18);
      expect(model.offsetOf(sizes, 3)).assertEqual(55);
      expect(model.isValidSpan(sizes, 73)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition009 done');
    });
}

function GridPartitionValidationPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0290
     * @tc.name    JsPartition010
     * @tc.desc    Partition 80 into 7 parts extra 3 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition010', 0, async function () {
      await yieldThread();
      const sizes = model.partition(80, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(80);
      expect(sizes[0]).assertEqual(12);
      expect(sizes[1]).assertEqual(12);
      expect(sizes[2]).assertEqual(12);
      expect(model.offsetOf(sizes, 3)).assertEqual(36);
      expect(model.isValidSpan(sizes, 80)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0291
     * @tc.name    JsPartition011
     * @tc.desc    Partition 87 into 10 parts extra 7 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition011', 0, async function () {
      await yieldThread();
      const sizes = model.partition(87, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(87);
      expect(sizes[0]).assertEqual(9);
      expect(sizes[1]).assertEqual(9);
      expect(sizes[2]).assertEqual(9);
      expect(model.offsetOf(sizes, 3)).assertEqual(27);
      expect(model.isValidSpan(sizes, 87)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0292
     * @tc.name    JsPartition012
     * @tc.desc    Partition 94 into 1 parts extra 0 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition012', 0, async function () {
      await yieldThread();
      const sizes = model.partition(94, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(94);
      expect(sizes[0]).assertEqual(94);
      expect(model.offsetOf(sizes, 1)).assertEqual(94);
      expect(model.isValidSpan(sizes, 94)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition012 done');
    });
}

function GridPartitionValidationPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0293
     * @tc.name    JsPartition013
     * @tc.desc    Partition 10 into 4 parts extra 2 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition013', 0, async function () {
      await yieldThread();
      const sizes = model.partition(10, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(10);
      expect(sizes[0]).assertEqual(3);
      expect(sizes[1]).assertEqual(3);
      expect(sizes[2]).assertEqual(2);
      expect(model.offsetOf(sizes, 3)).assertEqual(8);
      expect(model.isValidSpan(sizes, 10)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0294
     * @tc.name    JsPartition014
     * @tc.desc    Partition 17 into 7 parts extra 3 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition014', 0, async function () {
      await yieldThread();
      const sizes = model.partition(17, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(17);
      expect(sizes[0]).assertEqual(3);
      expect(sizes[1]).assertEqual(3);
      expect(sizes[2]).assertEqual(3);
      expect(model.offsetOf(sizes, 3)).assertEqual(9);
      expect(model.isValidSpan(sizes, 17)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0295
     * @tc.name    JsPartition015
     * @tc.desc    Partition 24 into 10 parts extra 4 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition015', 0, async function () {
      await yieldThread();
      const sizes = model.partition(24, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(24);
      expect(sizes[0]).assertEqual(3);
      expect(sizes[1]).assertEqual(3);
      expect(sizes[2]).assertEqual(3);
      expect(model.offsetOf(sizes, 3)).assertEqual(9);
      expect(model.isValidSpan(sizes, 24)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition015 done');
    });
}

function GridPartitionValidationPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0296
     * @tc.name    JsPartition016
     * @tc.desc    Partition 31 into 1 parts extra 0 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition016', 0, async function () {
      await yieldThread();
      const sizes = model.partition(31, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(31);
      expect(sizes[0]).assertEqual(31);
      expect(model.offsetOf(sizes, 1)).assertEqual(31);
      expect(model.isValidSpan(sizes, 31)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition016 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0297
     * @tc.name    JsPartition017
     * @tc.desc    Partition 38 into 4 parts extra 2 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition017', 0, async function () {
      await yieldThread();
      const sizes = model.partition(38, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(38);
      expect(sizes[0]).assertEqual(10);
      expect(sizes[1]).assertEqual(10);
      expect(sizes[2]).assertEqual(9);
      expect(model.offsetOf(sizes, 3)).assertEqual(29);
      expect(model.isValidSpan(sizes, 38)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0298
     * @tc.name    JsPartition018
     * @tc.desc    Partition 45 into 7 parts extra 3 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition018', 0, async function () {
      await yieldThread();
      const sizes = model.partition(45, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(45);
      expect(sizes[0]).assertEqual(7);
      expect(sizes[1]).assertEqual(7);
      expect(sizes[2]).assertEqual(7);
      expect(model.offsetOf(sizes, 3)).assertEqual(21);
      expect(model.isValidSpan(sizes, 45)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition018 done');
    });
}

function GridPartitionValidationPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0299
     * @tc.name    JsPartition019
     * @tc.desc    Partition 52 into 10 parts extra 2 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition019', 0, async function () {
      await yieldThread();
      const sizes = model.partition(52, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(52);
      expect(sizes[0]).assertEqual(6);
      expect(sizes[1]).assertEqual(6);
      expect(sizes[2]).assertEqual(5);
      expect(model.offsetOf(sizes, 3)).assertEqual(17);
      expect(model.isValidSpan(sizes, 52)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0300
     * @tc.name    JsPartition020
     * @tc.desc    Partition 59 into 1 parts extra 0 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition020', 0, async function () {
      await yieldThread();
      const sizes = model.partition(59, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(59);
      expect(sizes[0]).assertEqual(59);
      expect(model.offsetOf(sizes, 1)).assertEqual(59);
      expect(model.isValidSpan(sizes, 59)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition020 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0301
     * @tc.name    JsPartition021
     * @tc.desc    Partition 66 into 4 parts extra 2 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition021', 0, async function () {
      await yieldThread();
      const sizes = model.partition(66, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(66);
      expect(sizes[0]).assertEqual(17);
      expect(sizes[1]).assertEqual(17);
      expect(sizes[2]).assertEqual(16);
      expect(model.offsetOf(sizes, 3)).assertEqual(50);
      expect(model.isValidSpan(sizes, 66)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition021 done');
    });
}

function GridPartitionValidationPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0302
     * @tc.name    JsPartition022
     * @tc.desc    Partition 73 into 7 parts extra 3 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition022', 0, async function () {
      await yieldThread();
      const sizes = model.partition(73, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(73);
      expect(sizes[0]).assertEqual(11);
      expect(sizes[1]).assertEqual(11);
      expect(sizes[2]).assertEqual(11);
      expect(model.offsetOf(sizes, 3)).assertEqual(33);
      expect(model.isValidSpan(sizes, 73)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0303
     * @tc.name    JsPartition023
     * @tc.desc    Partition 80 into 10 parts extra 0 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition023', 0, async function () {
      await yieldThread();
      const sizes = model.partition(80, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(80);
      expect(sizes[0]).assertEqual(8);
      expect(sizes[1]).assertEqual(8);
      expect(sizes[2]).assertEqual(8);
      expect(model.offsetOf(sizes, 3)).assertEqual(24);
      expect(model.isValidSpan(sizes, 80)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0304
     * @tc.name    JsPartition024
     * @tc.desc    Partition 87 into 1 parts extra 0 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition024', 0, async function () {
      await yieldThread();
      const sizes = model.partition(87, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(87);
      expect(sizes[0]).assertEqual(87);
      expect(model.offsetOf(sizes, 1)).assertEqual(87);
      expect(model.isValidSpan(sizes, 87)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition024 done');
    });
}

function GridPartitionValidationPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0305
     * @tc.name    JsPartition025
     * @tc.desc    Partition 94 into 4 parts extra 2 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition025', 0, async function () {
      await yieldThread();
      const sizes = model.partition(94, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(94);
      expect(sizes[0]).assertEqual(24);
      expect(sizes[1]).assertEqual(24);
      expect(sizes[2]).assertEqual(23);
      expect(model.offsetOf(sizes, 3)).assertEqual(71);
      expect(model.isValidSpan(sizes, 94)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0306
     * @tc.name    JsPartition026
     * @tc.desc    Partition 10 into 7 parts extra 3 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition026', 0, async function () {
      await yieldThread();
      const sizes = model.partition(10, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(10);
      expect(sizes[0]).assertEqual(2);
      expect(sizes[1]).assertEqual(2);
      expect(sizes[2]).assertEqual(2);
      expect(model.offsetOf(sizes, 3)).assertEqual(6);
      expect(model.isValidSpan(sizes, 10)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0307
     * @tc.name    JsPartition027
     * @tc.desc    Partition 17 into 10 parts extra 7 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition027', 0, async function () {
      await yieldThread();
      const sizes = model.partition(17, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(17);
      expect(sizes[0]).assertEqual(2);
      expect(sizes[1]).assertEqual(2);
      expect(sizes[2]).assertEqual(2);
      expect(model.offsetOf(sizes, 3)).assertEqual(6);
      expect(model.isValidSpan(sizes, 17)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition027 done');
    });
}

function GridPartitionValidationPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0308
     * @tc.name    JsPartition028
     * @tc.desc    Partition 24 into 1 parts extra 0 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition028', 0, async function () {
      await yieldThread();
      const sizes = model.partition(24, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(24);
      expect(sizes[0]).assertEqual(24);
      expect(model.offsetOf(sizes, 1)).assertEqual(24);
      expect(model.isValidSpan(sizes, 24)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition028 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0309
     * @tc.name    JsPartition029
     * @tc.desc    Partition 31 into 4 parts extra 3 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition029', 0, async function () {
      await yieldThread();
      const sizes = model.partition(31, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(31);
      expect(sizes[0]).assertEqual(8);
      expect(sizes[1]).assertEqual(8);
      expect(sizes[2]).assertEqual(8);
      expect(model.offsetOf(sizes, 3)).assertEqual(24);
      expect(model.isValidSpan(sizes, 31)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0310
     * @tc.name    JsPartition030
     * @tc.desc    Partition 38 into 7 parts extra 3 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition030', 0, async function () {
      await yieldThread();
      const sizes = model.partition(38, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(38);
      expect(sizes[0]).assertEqual(6);
      expect(sizes[1]).assertEqual(6);
      expect(sizes[2]).assertEqual(6);
      expect(model.offsetOf(sizes, 3)).assertEqual(18);
      expect(model.isValidSpan(sizes, 38)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition030 done');
    });
}

function GridPartitionValidationPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0311
     * @tc.name    JsPartition031
     * @tc.desc    Partition 45 into 10 parts extra 5 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition031', 0, async function () {
      await yieldThread();
      const sizes = model.partition(45, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(45);
      expect(sizes[0]).assertEqual(5);
      expect(sizes[1]).assertEqual(5);
      expect(sizes[2]).assertEqual(5);
      expect(model.offsetOf(sizes, 3)).assertEqual(15);
      expect(model.isValidSpan(sizes, 45)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0312
     * @tc.name    JsPartition032
     * @tc.desc    Partition 52 into 1 parts extra 0 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition032', 0, async function () {
      await yieldThread();
      const sizes = model.partition(52, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(52);
      expect(sizes[0]).assertEqual(52);
      expect(model.offsetOf(sizes, 1)).assertEqual(52);
      expect(model.isValidSpan(sizes, 52)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition032 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0313
     * @tc.name    JsPartition033
     * @tc.desc    Partition 59 into 4 parts extra 3 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition033', 0, async function () {
      await yieldThread();
      const sizes = model.partition(59, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(59);
      expect(sizes[0]).assertEqual(15);
      expect(sizes[1]).assertEqual(15);
      expect(sizes[2]).assertEqual(15);
      expect(model.offsetOf(sizes, 3)).assertEqual(45);
      expect(model.isValidSpan(sizes, 59)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition033 done');
    });
}

function GridPartitionValidationPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0314
     * @tc.name    JsPartition034
     * @tc.desc    Partition 66 into 7 parts extra 3 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition034', 0, async function () {
      await yieldThread();
      const sizes = model.partition(66, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(66);
      expect(sizes[0]).assertEqual(10);
      expect(sizes[1]).assertEqual(10);
      expect(sizes[2]).assertEqual(10);
      expect(model.offsetOf(sizes, 3)).assertEqual(30);
      expect(model.isValidSpan(sizes, 66)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0315
     * @tc.name    JsPartition035
     * @tc.desc    Partition 73 into 10 parts extra 3 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition035', 0, async function () {
      await yieldThread();
      const sizes = model.partition(73, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(73);
      expect(sizes[0]).assertEqual(8);
      expect(sizes[1]).assertEqual(8);
      expect(sizes[2]).assertEqual(8);
      expect(model.offsetOf(sizes, 3)).assertEqual(24);
      expect(model.isValidSpan(sizes, 73)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0316
     * @tc.name    JsPartition036
     * @tc.desc    Partition 80 into 1 parts extra 0 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition036', 0, async function () {
      await yieldThread();
      const sizes = model.partition(80, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(80);
      expect(sizes[0]).assertEqual(80);
      expect(model.offsetOf(sizes, 1)).assertEqual(80);
      expect(model.isValidSpan(sizes, 80)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition036 done');
    });
}

function GridPartitionValidationPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0317
     * @tc.name    JsPartition037
     * @tc.desc    Partition 87 into 4 parts extra 3 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition037', 0, async function () {
      await yieldThread();
      const sizes = model.partition(87, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(87);
      expect(sizes[0]).assertEqual(22);
      expect(sizes[1]).assertEqual(22);
      expect(sizes[2]).assertEqual(22);
      expect(model.offsetOf(sizes, 3)).assertEqual(66);
      expect(model.isValidSpan(sizes, 87)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0318
     * @tc.name    JsPartition038
     * @tc.desc    Partition 94 into 7 parts extra 3 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition038', 0, async function () {
      await yieldThread();
      const sizes = model.partition(94, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(94);
      expect(sizes[0]).assertEqual(14);
      expect(sizes[1]).assertEqual(14);
      expect(sizes[2]).assertEqual(14);
      expect(model.offsetOf(sizes, 3)).assertEqual(42);
      expect(model.isValidSpan(sizes, 94)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0319
     * @tc.name    JsPartition039
     * @tc.desc    Partition 10 into 10 parts extra 0 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition039', 0, async function () {
      await yieldThread();
      const sizes = model.partition(10, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(10);
      expect(sizes[0]).assertEqual(1);
      expect(sizes[1]).assertEqual(1);
      expect(sizes[2]).assertEqual(1);
      expect(model.offsetOf(sizes, 3)).assertEqual(3);
      expect(model.isValidSpan(sizes, 10)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition039 done');
    });
}

function GridPartitionValidationPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0320
     * @tc.name    JsPartition040
     * @tc.desc    Partition 17 into 1 parts extra 0 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition040', 0, async function () {
      await yieldThread();
      const sizes = model.partition(17, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(17);
      expect(sizes[0]).assertEqual(17);
      expect(model.offsetOf(sizes, 1)).assertEqual(17);
      expect(model.isValidSpan(sizes, 17)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition040 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0321
     * @tc.name    JsPartition041
     * @tc.desc    Partition 24 into 4 parts extra 0 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition041', 0, async function () {
      await yieldThread();
      const sizes = model.partition(24, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(24);
      expect(sizes[0]).assertEqual(6);
      expect(sizes[1]).assertEqual(6);
      expect(sizes[2]).assertEqual(6);
      expect(model.offsetOf(sizes, 3)).assertEqual(18);
      expect(model.isValidSpan(sizes, 24)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0322
     * @tc.name    JsPartition042
     * @tc.desc    Partition 31 into 7 parts extra 3 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition042', 0, async function () {
      await yieldThread();
      const sizes = model.partition(31, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(31);
      expect(sizes[0]).assertEqual(5);
      expect(sizes[1]).assertEqual(5);
      expect(sizes[2]).assertEqual(5);
      expect(model.offsetOf(sizes, 3)).assertEqual(15);
      expect(model.isValidSpan(sizes, 31)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition042 done');
    });
}

function GridPartitionValidationPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0323
     * @tc.name    JsPartition043
     * @tc.desc    Partition 38 into 10 parts extra 8 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition043', 0, async function () {
      await yieldThread();
      const sizes = model.partition(38, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(38);
      expect(sizes[0]).assertEqual(4);
      expect(sizes[1]).assertEqual(4);
      expect(sizes[2]).assertEqual(4);
      expect(model.offsetOf(sizes, 3)).assertEqual(12);
      expect(model.isValidSpan(sizes, 38)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0324
     * @tc.name    JsPartition044
     * @tc.desc    Partition 45 into 1 parts extra 0 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition044', 0, async function () {
      await yieldThread();
      const sizes = model.partition(45, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(45);
      expect(sizes[0]).assertEqual(45);
      expect(model.offsetOf(sizes, 1)).assertEqual(45);
      expect(model.isValidSpan(sizes, 45)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition044 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0325
     * @tc.name    JsPartition045
     * @tc.desc    Partition 52 into 4 parts extra 0 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition045', 0, async function () {
      await yieldThread();
      const sizes = model.partition(52, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(52);
      expect(sizes[0]).assertEqual(13);
      expect(sizes[1]).assertEqual(13);
      expect(sizes[2]).assertEqual(13);
      expect(model.offsetOf(sizes, 3)).assertEqual(39);
      expect(model.isValidSpan(sizes, 52)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition045 done');
    });
}

function GridPartitionValidationPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0326
     * @tc.name    JsPartition046
     * @tc.desc    Partition 59 into 7 parts extra 3 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition046', 0, async function () {
      await yieldThread();
      const sizes = model.partition(59, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(59);
      expect(sizes[0]).assertEqual(9);
      expect(sizes[1]).assertEqual(9);
      expect(sizes[2]).assertEqual(9);
      expect(model.offsetOf(sizes, 3)).assertEqual(27);
      expect(model.isValidSpan(sizes, 59)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0327
     * @tc.name    JsPartition047
     * @tc.desc    Partition 66 into 10 parts extra 6 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition047', 0, async function () {
      await yieldThread();
      const sizes = model.partition(66, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(66);
      expect(sizes[0]).assertEqual(7);
      expect(sizes[1]).assertEqual(7);
      expect(sizes[2]).assertEqual(7);
      expect(model.offsetOf(sizes, 3)).assertEqual(21);
      expect(model.isValidSpan(sizes, 66)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0328
     * @tc.name    JsPartition048
     * @tc.desc    Partition 73 into 1 parts extra 0 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition048', 0, async function () {
      await yieldThread();
      const sizes = model.partition(73, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(73);
      expect(sizes[0]).assertEqual(73);
      expect(model.offsetOf(sizes, 1)).assertEqual(73);
      expect(model.isValidSpan(sizes, 73)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition048 done');
    });
}

function GridPartitionValidationPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0329
     * @tc.name    JsPartition049
     * @tc.desc    Partition 80 into 4 parts extra 0 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition049', 0, async function () {
      await yieldThread();
      const sizes = model.partition(80, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(80);
      expect(sizes[0]).assertEqual(20);
      expect(sizes[1]).assertEqual(20);
      expect(sizes[2]).assertEqual(20);
      expect(model.offsetOf(sizes, 3)).assertEqual(60);
      expect(model.isValidSpan(sizes, 80)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0330
     * @tc.name    JsPartition050
     * @tc.desc    Partition 87 into 7 parts extra 3 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition050', 0, async function () {
      await yieldThread();
      const sizes = model.partition(87, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(87);
      expect(sizes[0]).assertEqual(13);
      expect(sizes[1]).assertEqual(13);
      expect(sizes[2]).assertEqual(13);
      expect(model.offsetOf(sizes, 3)).assertEqual(39);
      expect(model.isValidSpan(sizes, 87)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition050 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0331
     * @tc.name    JsPartition051
     * @tc.desc    Partition 94 into 10 parts extra 4 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition051', 0, async function () {
      await yieldThread();
      const sizes = model.partition(94, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(94);
      expect(sizes[0]).assertEqual(10);
      expect(sizes[1]).assertEqual(10);
      expect(sizes[2]).assertEqual(10);
      expect(model.offsetOf(sizes, 3)).assertEqual(30);
      expect(model.isValidSpan(sizes, 94)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition051 done');
    });
}

function GridPartitionValidationPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0332
     * @tc.name    JsPartition052
     * @tc.desc    Partition 10 into 1 parts extra 0 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition052', 0, async function () {
      await yieldThread();
      const sizes = model.partition(10, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(10);
      expect(sizes[0]).assertEqual(10);
      expect(model.offsetOf(sizes, 1)).assertEqual(10);
      expect(model.isValidSpan(sizes, 10)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition052 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0333
     * @tc.name    JsPartition053
     * @tc.desc    Partition 17 into 4 parts extra 1 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition053', 0, async function () {
      await yieldThread();
      const sizes = model.partition(17, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(17);
      expect(sizes[0]).assertEqual(5);
      expect(sizes[1]).assertEqual(4);
      expect(sizes[2]).assertEqual(4);
      expect(model.offsetOf(sizes, 3)).assertEqual(13);
      expect(model.isValidSpan(sizes, 17)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0334
     * @tc.name    JsPartition054
     * @tc.desc    Partition 24 into 7 parts extra 3 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition054', 0, async function () {
      await yieldThread();
      const sizes = model.partition(24, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(24);
      expect(sizes[0]).assertEqual(4);
      expect(sizes[1]).assertEqual(4);
      expect(sizes[2]).assertEqual(4);
      expect(model.offsetOf(sizes, 3)).assertEqual(12);
      expect(model.isValidSpan(sizes, 24)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition054 done');
    });
}

function GridPartitionValidationPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0335
     * @tc.name    JsPartition055
     * @tc.desc    Partition 31 into 10 parts extra 1 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition055', 0, async function () {
      await yieldThread();
      const sizes = model.partition(31, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(31);
      expect(sizes[0]).assertEqual(4);
      expect(sizes[1]).assertEqual(3);
      expect(sizes[2]).assertEqual(3);
      expect(model.offsetOf(sizes, 3)).assertEqual(10);
      expect(model.isValidSpan(sizes, 31)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0336
     * @tc.name    JsPartition056
     * @tc.desc    Partition 38 into 1 parts extra 0 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition056', 0, async function () {
      await yieldThread();
      const sizes = model.partition(38, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(38);
      expect(sizes[0]).assertEqual(38);
      expect(model.offsetOf(sizes, 1)).assertEqual(38);
      expect(model.isValidSpan(sizes, 38)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition056 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0337
     * @tc.name    JsPartition057
     * @tc.desc    Partition 45 into 4 parts extra 1 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition057', 0, async function () {
      await yieldThread();
      const sizes = model.partition(45, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(45);
      expect(sizes[0]).assertEqual(12);
      expect(sizes[1]).assertEqual(11);
      expect(sizes[2]).assertEqual(11);
      expect(model.offsetOf(sizes, 3)).assertEqual(34);
      expect(model.isValidSpan(sizes, 45)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition057 done');
    });
}

function GridPartitionValidationPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0338
     * @tc.name    JsPartition058
     * @tc.desc    Partition 52 into 7 parts extra 3 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition058', 0, async function () {
      await yieldThread();
      const sizes = model.partition(52, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(52);
      expect(sizes[0]).assertEqual(8);
      expect(sizes[1]).assertEqual(8);
      expect(sizes[2]).assertEqual(8);
      expect(model.offsetOf(sizes, 3)).assertEqual(24);
      expect(model.isValidSpan(sizes, 52)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0339
     * @tc.name    JsPartition059
     * @tc.desc    Partition 59 into 10 parts extra 9 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition059', 0, async function () {
      await yieldThread();
      const sizes = model.partition(59, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(59);
      expect(sizes[0]).assertEqual(6);
      expect(sizes[1]).assertEqual(6);
      expect(sizes[2]).assertEqual(6);
      expect(model.offsetOf(sizes, 3)).assertEqual(18);
      expect(model.isValidSpan(sizes, 59)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0340
     * @tc.name    JsPartition060
     * @tc.desc    Partition 66 into 1 parts extra 0 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition060', 0, async function () {
      await yieldThread();
      const sizes = model.partition(66, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(66);
      expect(sizes[0]).assertEqual(66);
      expect(model.offsetOf(sizes, 1)).assertEqual(66);
      expect(model.isValidSpan(sizes, 66)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition060 done');
    });
}

function GridPartitionValidationPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0341
     * @tc.name    JsPartition061
     * @tc.desc    Partition 73 into 4 parts extra 1 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition061', 0, async function () {
      await yieldThread();
      const sizes = model.partition(73, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(73);
      expect(sizes[0]).assertEqual(19);
      expect(sizes[1]).assertEqual(18);
      expect(sizes[2]).assertEqual(18);
      expect(model.offsetOf(sizes, 3)).assertEqual(55);
      expect(model.isValidSpan(sizes, 73)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0342
     * @tc.name    JsPartition062
     * @tc.desc    Partition 80 into 7 parts extra 3 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition062', 0, async function () {
      await yieldThread();
      const sizes = model.partition(80, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(80);
      expect(sizes[0]).assertEqual(12);
      expect(sizes[1]).assertEqual(12);
      expect(sizes[2]).assertEqual(12);
      expect(model.offsetOf(sizes, 3)).assertEqual(36);
      expect(model.isValidSpan(sizes, 80)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0343
     * @tc.name    JsPartition063
     * @tc.desc    Partition 87 into 10 parts extra 7 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition063', 0, async function () {
      await yieldThread();
      const sizes = model.partition(87, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(87);
      expect(sizes[0]).assertEqual(9);
      expect(sizes[1]).assertEqual(9);
      expect(sizes[2]).assertEqual(9);
      expect(model.offsetOf(sizes, 3)).assertEqual(27);
      expect(model.isValidSpan(sizes, 87)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition063 done');
    });
}

function GridPartitionValidationPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0344
     * @tc.name    JsPartition064
     * @tc.desc    Partition 94 into 1 parts extra 0 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition064', 0, async function () {
      await yieldThread();
      const sizes = model.partition(94, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(94);
      expect(sizes[0]).assertEqual(94);
      expect(model.offsetOf(sizes, 1)).assertEqual(94);
      expect(model.isValidSpan(sizes, 94)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition064 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0345
     * @tc.name    JsPartition065
     * @tc.desc    Partition 10 into 4 parts extra 2 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition065', 0, async function () {
      await yieldThread();
      const sizes = model.partition(10, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(10);
      expect(sizes[0]).assertEqual(3);
      expect(sizes[1]).assertEqual(3);
      expect(sizes[2]).assertEqual(2);
      expect(model.offsetOf(sizes, 3)).assertEqual(8);
      expect(model.isValidSpan(sizes, 10)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition065 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0346
     * @tc.name    JsPartition066
     * @tc.desc    Partition 17 into 7 parts extra 3 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition066', 0, async function () {
      await yieldThread();
      const sizes = model.partition(17, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(17);
      expect(sizes[0]).assertEqual(3);
      expect(sizes[1]).assertEqual(3);
      expect(sizes[2]).assertEqual(3);
      expect(model.offsetOf(sizes, 3)).assertEqual(9);
      expect(model.isValidSpan(sizes, 17)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition066 done');
    });
}

function GridPartitionValidationPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0347
     * @tc.name    JsPartition067
     * @tc.desc    Partition 24 into 10 parts extra 4 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition067', 0, async function () {
      await yieldThread();
      const sizes = model.partition(24, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(24);
      expect(sizes[0]).assertEqual(3);
      expect(sizes[1]).assertEqual(3);
      expect(sizes[2]).assertEqual(3);
      expect(model.offsetOf(sizes, 3)).assertEqual(9);
      expect(model.isValidSpan(sizes, 24)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0348
     * @tc.name    JsPartition068
     * @tc.desc    Partition 31 into 1 parts extra 0 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition068', 0, async function () {
      await yieldThread();
      const sizes = model.partition(31, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(31);
      expect(sizes[0]).assertEqual(31);
      expect(model.offsetOf(sizes, 1)).assertEqual(31);
      expect(model.isValidSpan(sizes, 31)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition068 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0349
     * @tc.name    JsPartition069
     * @tc.desc    Partition 38 into 4 parts extra 2 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition069', 0, async function () {
      await yieldThread();
      const sizes = model.partition(38, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(38);
      expect(sizes[0]).assertEqual(10);
      expect(sizes[1]).assertEqual(10);
      expect(sizes[2]).assertEqual(9);
      expect(model.offsetOf(sizes, 3)).assertEqual(29);
      expect(model.isValidSpan(sizes, 38)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition069 done');
    });
}

function GridPartitionValidationPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0350
     * @tc.name    JsPartition070
     * @tc.desc    Partition 45 into 7 parts extra 3 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition070', 0, async function () {
      await yieldThread();
      const sizes = model.partition(45, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(45);
      expect(sizes[0]).assertEqual(7);
      expect(sizes[1]).assertEqual(7);
      expect(sizes[2]).assertEqual(7);
      expect(model.offsetOf(sizes, 3)).assertEqual(21);
      expect(model.isValidSpan(sizes, 45)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition070 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0351
     * @tc.name    JsPartition071
     * @tc.desc    Partition 52 into 10 parts extra 2 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition071', 0, async function () {
      await yieldThread();
      const sizes = model.partition(52, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(52);
      expect(sizes[0]).assertEqual(6);
      expect(sizes[1]).assertEqual(6);
      expect(sizes[2]).assertEqual(5);
      expect(model.offsetOf(sizes, 3)).assertEqual(17);
      expect(model.isValidSpan(sizes, 52)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0352
     * @tc.name    JsPartition072
     * @tc.desc    Partition 59 into 1 parts extra 0 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition072', 0, async function () {
      await yieldThread();
      const sizes = model.partition(59, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(59);
      expect(sizes[0]).assertEqual(59);
      expect(model.offsetOf(sizes, 1)).assertEqual(59);
      expect(model.isValidSpan(sizes, 59)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition072 done');
    });
}

function GridPartitionValidationPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0353
     * @tc.name    JsPartition073
     * @tc.desc    Partition 66 into 4 parts extra 2 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition073', 0, async function () {
      await yieldThread();
      const sizes = model.partition(66, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(66);
      expect(sizes[0]).assertEqual(17);
      expect(sizes[1]).assertEqual(17);
      expect(sizes[2]).assertEqual(16);
      expect(model.offsetOf(sizes, 3)).assertEqual(50);
      expect(model.isValidSpan(sizes, 66)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0354
     * @tc.name    JsPartition074
     * @tc.desc    Partition 73 into 7 parts extra 3 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition074', 0, async function () {
      await yieldThread();
      const sizes = model.partition(73, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(73);
      expect(sizes[0]).assertEqual(11);
      expect(sizes[1]).assertEqual(11);
      expect(sizes[2]).assertEqual(11);
      expect(model.offsetOf(sizes, 3)).assertEqual(33);
      expect(model.isValidSpan(sizes, 73)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0355
     * @tc.name    JsPartition075
     * @tc.desc    Partition 80 into 10 parts extra 0 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition075', 0, async function () {
      await yieldThread();
      const sizes = model.partition(80, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(80);
      expect(sizes[0]).assertEqual(8);
      expect(sizes[1]).assertEqual(8);
      expect(sizes[2]).assertEqual(8);
      expect(model.offsetOf(sizes, 3)).assertEqual(24);
      expect(model.isValidSpan(sizes, 80)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition075 done');
    });
}

function GridPartitionValidationPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0356
     * @tc.name    JsPartition076
     * @tc.desc    Partition 87 into 1 parts extra 0 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition076', 0, async function () {
      await yieldThread();
      const sizes = model.partition(87, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(87);
      expect(sizes[0]).assertEqual(87);
      expect(model.offsetOf(sizes, 1)).assertEqual(87);
      expect(model.isValidSpan(sizes, 87)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition076 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0357
     * @tc.name    JsPartition077
     * @tc.desc    Partition 94 into 4 parts extra 2 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition077', 0, async function () {
      await yieldThread();
      const sizes = model.partition(94, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(94);
      expect(sizes[0]).assertEqual(24);
      expect(sizes[1]).assertEqual(24);
      expect(sizes[2]).assertEqual(23);
      expect(model.offsetOf(sizes, 3)).assertEqual(71);
      expect(model.isValidSpan(sizes, 94)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0358
     * @tc.name    JsPartition078
     * @tc.desc    Partition 10 into 7 parts extra 3 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition078', 0, async function () {
      await yieldThread();
      const sizes = model.partition(10, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(10);
      expect(sizes[0]).assertEqual(2);
      expect(sizes[1]).assertEqual(2);
      expect(sizes[2]).assertEqual(2);
      expect(model.offsetOf(sizes, 3)).assertEqual(6);
      expect(model.isValidSpan(sizes, 10)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition078 done');
    });
}

function GridPartitionValidationPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0359
     * @tc.name    JsPartition079
     * @tc.desc    Partition 17 into 10 parts extra 7 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition079', 0, async function () {
      await yieldThread();
      const sizes = model.partition(17, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(17);
      expect(sizes[0]).assertEqual(2);
      expect(sizes[1]).assertEqual(2);
      expect(sizes[2]).assertEqual(2);
      expect(model.offsetOf(sizes, 3)).assertEqual(6);
      expect(model.isValidSpan(sizes, 17)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0360
     * @tc.name    JsPartition080
     * @tc.desc    Partition 24 into 1 parts extra 0 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition080', 0, async function () {
      await yieldThread();
      const sizes = model.partition(24, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(24);
      expect(sizes[0]).assertEqual(24);
      expect(model.offsetOf(sizes, 1)).assertEqual(24);
      expect(model.isValidSpan(sizes, 24)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition080 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0361
     * @tc.name    JsPartition081
     * @tc.desc    Partition 31 into 4 parts extra 3 seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition081', 0, async function () {
      await yieldThread();
      const sizes = model.partition(31, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(31);
      expect(sizes[0]).assertEqual(8);
      expect(sizes[1]).assertEqual(8);
      expect(sizes[2]).assertEqual(8);
      expect(model.offsetOf(sizes, 3)).assertEqual(24);
      expect(model.isValidSpan(sizes, 31)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition081 done');
    });
}

function GridPartitionValidationPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0362
     * @tc.name    JsPartition082
     * @tc.desc    Partition 38 into 7 parts extra 3 seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition082', 0, async function () {
      await yieldThread();
      const sizes = model.partition(38, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(38);
      expect(sizes[0]).assertEqual(6);
      expect(sizes[1]).assertEqual(6);
      expect(sizes[2]).assertEqual(6);
      expect(model.offsetOf(sizes, 3)).assertEqual(18);
      expect(model.isValidSpan(sizes, 38)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0363
     * @tc.name    JsPartition083
     * @tc.desc    Partition 45 into 10 parts extra 5 seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition083', 0, async function () {
      await yieldThread();
      const sizes = model.partition(45, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(45);
      expect(sizes[0]).assertEqual(5);
      expect(sizes[1]).assertEqual(5);
      expect(sizes[2]).assertEqual(5);
      expect(model.offsetOf(sizes, 3)).assertEqual(15);
      expect(model.isValidSpan(sizes, 45)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0364
     * @tc.name    JsPartition084
     * @tc.desc    Partition 52 into 1 parts extra 0 seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition084', 0, async function () {
      await yieldThread();
      const sizes = model.partition(52, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(52);
      expect(sizes[0]).assertEqual(52);
      expect(model.offsetOf(sizes, 1)).assertEqual(52);
      expect(model.isValidSpan(sizes, 52)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition084 done');
    });
}

function GridPartitionValidationPart029() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0365
     * @tc.name    JsPartition085
     * @tc.desc    Partition 59 into 4 parts extra 3 seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition085', 0, async function () {
      await yieldThread();
      const sizes = model.partition(59, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(59);
      expect(sizes[0]).assertEqual(15);
      expect(sizes[1]).assertEqual(15);
      expect(sizes[2]).assertEqual(15);
      expect(model.offsetOf(sizes, 3)).assertEqual(45);
      expect(model.isValidSpan(sizes, 59)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition085 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0366
     * @tc.name    JsPartition086
     * @tc.desc    Partition 66 into 7 parts extra 3 seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition086', 0, async function () {
      await yieldThread();
      const sizes = model.partition(66, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(66);
      expect(sizes[0]).assertEqual(10);
      expect(sizes[1]).assertEqual(10);
      expect(sizes[2]).assertEqual(10);
      expect(model.offsetOf(sizes, 3)).assertEqual(30);
      expect(model.isValidSpan(sizes, 66)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0367
     * @tc.name    JsPartition087
     * @tc.desc    Partition 73 into 10 parts extra 3 seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition087', 0, async function () {
      await yieldThread();
      const sizes = model.partition(73, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(73);
      expect(sizes[0]).assertEqual(8);
      expect(sizes[1]).assertEqual(8);
      expect(sizes[2]).assertEqual(8);
      expect(model.offsetOf(sizes, 3)).assertEqual(24);
      expect(model.isValidSpan(sizes, 73)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition087 done');
    });
}

function GridPartitionValidationPart030() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0368
     * @tc.name    JsPartition088
     * @tc.desc    Partition 80 into 1 parts extra 0 seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition088', 0, async function () {
      await yieldThread();
      const sizes = model.partition(80, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(80);
      expect(sizes[0]).assertEqual(80);
      expect(model.offsetOf(sizes, 1)).assertEqual(80);
      expect(model.isValidSpan(sizes, 80)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition088 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0369
     * @tc.name    JsPartition089
     * @tc.desc    Partition 87 into 4 parts extra 3 seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition089', 0, async function () {
      await yieldThread();
      const sizes = model.partition(87, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(87);
      expect(sizes[0]).assertEqual(22);
      expect(sizes[1]).assertEqual(22);
      expect(sizes[2]).assertEqual(22);
      expect(model.offsetOf(sizes, 3)).assertEqual(66);
      expect(model.isValidSpan(sizes, 87)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0370
     * @tc.name    JsPartition090
     * @tc.desc    Partition 94 into 7 parts extra 3 seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition090', 0, async function () {
      await yieldThread();
      const sizes = model.partition(94, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(94);
      expect(sizes[0]).assertEqual(14);
      expect(sizes[1]).assertEqual(14);
      expect(sizes[2]).assertEqual(14);
      expect(model.offsetOf(sizes, 3)).assertEqual(42);
      expect(model.isValidSpan(sizes, 94)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition090 done');
    });
}

function GridPartitionValidationPart031() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0371
     * @tc.name    JsPartition091
     * @tc.desc    Partition 10 into 10 parts extra 0 seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition091', 0, async function () {
      await yieldThread();
      const sizes = model.partition(10, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(10);
      expect(sizes[0]).assertEqual(1);
      expect(sizes[1]).assertEqual(1);
      expect(sizes[2]).assertEqual(1);
      expect(model.offsetOf(sizes, 3)).assertEqual(3);
      expect(model.isValidSpan(sizes, 10)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition091 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0372
     * @tc.name    JsPartition092
     * @tc.desc    Partition 17 into 1 parts extra 0 seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition092', 0, async function () {
      await yieldThread();
      const sizes = model.partition(17, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(17);
      expect(sizes[0]).assertEqual(17);
      expect(model.offsetOf(sizes, 1)).assertEqual(17);
      expect(model.isValidSpan(sizes, 17)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition092 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0373
     * @tc.name    JsPartition093
     * @tc.desc    Partition 24 into 4 parts extra 0 seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition093', 0, async function () {
      await yieldThread();
      const sizes = model.partition(24, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(24);
      expect(sizes[0]).assertEqual(6);
      expect(sizes[1]).assertEqual(6);
      expect(sizes[2]).assertEqual(6);
      expect(model.offsetOf(sizes, 3)).assertEqual(18);
      expect(model.isValidSpan(sizes, 24)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition093 done');
    });
}

function GridPartitionValidationPart032() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0374
     * @tc.name    JsPartition094
     * @tc.desc    Partition 31 into 7 parts extra 3 seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition094', 0, async function () {
      await yieldThread();
      const sizes = model.partition(31, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(31);
      expect(sizes[0]).assertEqual(5);
      expect(sizes[1]).assertEqual(5);
      expect(sizes[2]).assertEqual(5);
      expect(model.offsetOf(sizes, 3)).assertEqual(15);
      expect(model.isValidSpan(sizes, 31)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition094 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0375
     * @tc.name    JsPartition095
     * @tc.desc    Partition 38 into 10 parts extra 8 seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition095', 0, async function () {
      await yieldThread();
      const sizes = model.partition(38, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(38);
      expect(sizes[0]).assertEqual(4);
      expect(sizes[1]).assertEqual(4);
      expect(sizes[2]).assertEqual(4);
      expect(model.offsetOf(sizes, 3)).assertEqual(12);
      expect(model.isValidSpan(sizes, 38)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition095 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0376
     * @tc.name    JsPartition096
     * @tc.desc    Partition 45 into 1 parts extra 0 seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition096', 0, async function () {
      await yieldThread();
      const sizes = model.partition(45, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(45);
      expect(sizes[0]).assertEqual(45);
      expect(model.offsetOf(sizes, 1)).assertEqual(45);
      expect(model.isValidSpan(sizes, 45)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition096 done');
    });
}

function GridPartitionValidationPart033() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0377
     * @tc.name    JsPartition097
     * @tc.desc    Partition 52 into 4 parts extra 0 seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition097', 0, async function () {
      await yieldThread();
      const sizes = model.partition(52, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(52);
      expect(sizes[0]).assertEqual(13);
      expect(sizes[1]).assertEqual(13);
      expect(sizes[2]).assertEqual(13);
      expect(model.offsetOf(sizes, 3)).assertEqual(39);
      expect(model.isValidSpan(sizes, 52)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition097 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0378
     * @tc.name    JsPartition098
     * @tc.desc    Partition 59 into 7 parts extra 3 seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition098', 0, async function () {
      await yieldThread();
      const sizes = model.partition(59, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(59);
      expect(sizes[0]).assertEqual(9);
      expect(sizes[1]).assertEqual(9);
      expect(sizes[2]).assertEqual(9);
      expect(model.offsetOf(sizes, 3)).assertEqual(27);
      expect(model.isValidSpan(sizes, 59)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition098 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0379
     * @tc.name    JsPartition099
     * @tc.desc    Partition 66 into 10 parts extra 6 seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition099', 0, async function () {
      await yieldThread();
      const sizes = model.partition(66, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(66);
      expect(sizes[0]).assertEqual(7);
      expect(sizes[1]).assertEqual(7);
      expect(sizes[2]).assertEqual(7);
      expect(model.offsetOf(sizes, 3)).assertEqual(21);
      expect(model.isValidSpan(sizes, 66)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition099 done');
    });
}

function GridPartitionValidationPart034() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0380
     * @tc.name    JsPartition100
     * @tc.desc    Partition 73 into 1 parts extra 0 seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition100', 0, async function () {
      await yieldThread();
      const sizes = model.partition(73, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(73);
      expect(sizes[0]).assertEqual(73);
      expect(model.offsetOf(sizes, 1)).assertEqual(73);
      expect(model.isValidSpan(sizes, 73)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition100 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0381
     * @tc.name    JsPartition101
     * @tc.desc    Partition 80 into 4 parts extra 0 seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition101', 0, async function () {
      await yieldThread();
      const sizes = model.partition(80, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(80);
      expect(sizes[0]).assertEqual(20);
      expect(sizes[1]).assertEqual(20);
      expect(sizes[2]).assertEqual(20);
      expect(model.offsetOf(sizes, 3)).assertEqual(60);
      expect(model.isValidSpan(sizes, 80)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0382
     * @tc.name    JsPartition102
     * @tc.desc    Partition 87 into 7 parts extra 3 seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition102', 0, async function () {
      await yieldThread();
      const sizes = model.partition(87, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(87);
      expect(sizes[0]).assertEqual(13);
      expect(sizes[1]).assertEqual(13);
      expect(sizes[2]).assertEqual(13);
      expect(model.offsetOf(sizes, 3)).assertEqual(39);
      expect(model.isValidSpan(sizes, 87)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition102 done');
    });
}

function GridPartitionValidationPart035() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0383
     * @tc.name    JsPartition103
     * @tc.desc    Partition 94 into 10 parts extra 4 seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition103', 0, async function () {
      await yieldThread();
      const sizes = model.partition(94, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(94);
      expect(sizes[0]).assertEqual(10);
      expect(sizes[1]).assertEqual(10);
      expect(sizes[2]).assertEqual(10);
      expect(model.offsetOf(sizes, 3)).assertEqual(30);
      expect(model.isValidSpan(sizes, 94)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition103 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0384
     * @tc.name    JsPartition104
     * @tc.desc    Partition 10 into 1 parts extra 0 seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition104', 0, async function () {
      await yieldThread();
      const sizes = model.partition(10, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(10);
      expect(sizes[0]).assertEqual(10);
      expect(model.offsetOf(sizes, 1)).assertEqual(10);
      expect(model.isValidSpan(sizes, 10)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition104 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0385
     * @tc.name    JsPartition105
     * @tc.desc    Partition 17 into 4 parts extra 1 seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition105', 0, async function () {
      await yieldThread();
      const sizes = model.partition(17, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(17);
      expect(sizes[0]).assertEqual(5);
      expect(sizes[1]).assertEqual(4);
      expect(sizes[2]).assertEqual(4);
      expect(model.offsetOf(sizes, 3)).assertEqual(13);
      expect(model.isValidSpan(sizes, 17)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition105 done');
    });
}

function GridPartitionValidationPart036() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0386
     * @tc.name    JsPartition106
     * @tc.desc    Partition 24 into 7 parts extra 3 seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition106', 0, async function () {
      await yieldThread();
      const sizes = model.partition(24, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(24);
      expect(sizes[0]).assertEqual(4);
      expect(sizes[1]).assertEqual(4);
      expect(sizes[2]).assertEqual(4);
      expect(model.offsetOf(sizes, 3)).assertEqual(12);
      expect(model.isValidSpan(sizes, 24)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition106 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0387
     * @tc.name    JsPartition107
     * @tc.desc    Partition 31 into 10 parts extra 1 seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition107', 0, async function () {
      await yieldThread();
      const sizes = model.partition(31, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(31);
      expect(sizes[0]).assertEqual(4);
      expect(sizes[1]).assertEqual(3);
      expect(sizes[2]).assertEqual(3);
      expect(model.offsetOf(sizes, 3)).assertEqual(10);
      expect(model.isValidSpan(sizes, 31)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition107 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0388
     * @tc.name    JsPartition108
     * @tc.desc    Partition 38 into 1 parts extra 0 seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition108', 0, async function () {
      await yieldThread();
      const sizes = model.partition(38, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(38);
      expect(sizes[0]).assertEqual(38);
      expect(model.offsetOf(sizes, 1)).assertEqual(38);
      expect(model.isValidSpan(sizes, 38)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition108 done');
    });
}

function GridPartitionValidationPart037() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0389
     * @tc.name    JsPartition109
     * @tc.desc    Partition 45 into 4 parts extra 1 seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition109', 0, async function () {
      await yieldThread();
      const sizes = model.partition(45, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(45);
      expect(sizes[0]).assertEqual(12);
      expect(sizes[1]).assertEqual(11);
      expect(sizes[2]).assertEqual(11);
      expect(model.offsetOf(sizes, 3)).assertEqual(34);
      expect(model.isValidSpan(sizes, 45)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition109 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0390
     * @tc.name    JsPartition110
     * @tc.desc    Partition 52 into 7 parts extra 3 seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition110', 0, async function () {
      await yieldThread();
      const sizes = model.partition(52, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(52);
      expect(sizes[0]).assertEqual(8);
      expect(sizes[1]).assertEqual(8);
      expect(sizes[2]).assertEqual(8);
      expect(model.offsetOf(sizes, 3)).assertEqual(24);
      expect(model.isValidSpan(sizes, 52)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition110 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0391
     * @tc.name    JsPartition111
     * @tc.desc    Partition 59 into 10 parts extra 9 seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition111', 0, async function () {
      await yieldThread();
      const sizes = model.partition(59, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(59);
      expect(sizes[0]).assertEqual(6);
      expect(sizes[1]).assertEqual(6);
      expect(sizes[2]).assertEqual(6);
      expect(model.offsetOf(sizes, 3)).assertEqual(18);
      expect(model.isValidSpan(sizes, 59)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition111 done');
    });
}

function GridPartitionValidationPart038() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0392
     * @tc.name    JsPartition112
     * @tc.desc    Partition 66 into 1 parts extra 0 seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition112', 0, async function () {
      await yieldThread();
      const sizes = model.partition(66, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(66);
      expect(sizes[0]).assertEqual(66);
      expect(model.offsetOf(sizes, 1)).assertEqual(66);
      expect(model.isValidSpan(sizes, 66)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition112 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0393
     * @tc.name    JsPartition113
     * @tc.desc    Partition 73 into 4 parts extra 1 seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition113', 0, async function () {
      await yieldThread();
      const sizes = model.partition(73, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(73);
      expect(sizes[0]).assertEqual(19);
      expect(sizes[1]).assertEqual(18);
      expect(sizes[2]).assertEqual(18);
      expect(model.offsetOf(sizes, 3)).assertEqual(55);
      expect(model.isValidSpan(sizes, 73)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0394
     * @tc.name    JsPartition114
     * @tc.desc    Partition 80 into 7 parts extra 3 seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition114', 0, async function () {
      await yieldThread();
      const sizes = model.partition(80, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(80);
      expect(sizes[0]).assertEqual(12);
      expect(sizes[1]).assertEqual(12);
      expect(sizes[2]).assertEqual(12);
      expect(model.offsetOf(sizes, 3)).assertEqual(36);
      expect(model.isValidSpan(sizes, 80)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition114 done');
    });
}

function GridPartitionValidationPart039() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0395
     * @tc.name    JsPartition115
     * @tc.desc    Partition 87 into 10 parts extra 7 seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition115', 0, async function () {
      await yieldThread();
      const sizes = model.partition(87, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(87);
      expect(sizes[0]).assertEqual(9);
      expect(sizes[1]).assertEqual(9);
      expect(sizes[2]).assertEqual(9);
      expect(model.offsetOf(sizes, 3)).assertEqual(27);
      expect(model.isValidSpan(sizes, 87)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition115 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0396
     * @tc.name    JsPartition116
     * @tc.desc    Partition 94 into 1 parts extra 0 seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition116', 0, async function () {
      await yieldThread();
      const sizes = model.partition(94, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(94);
      expect(sizes[0]).assertEqual(94);
      expect(model.offsetOf(sizes, 1)).assertEqual(94);
      expect(model.isValidSpan(sizes, 94)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition116 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0397
     * @tc.name    JsPartition117
     * @tc.desc    Partition 10 into 4 parts extra 2 seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition117', 0, async function () {
      await yieldThread();
      const sizes = model.partition(10, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(10);
      expect(sizes[0]).assertEqual(3);
      expect(sizes[1]).assertEqual(3);
      expect(sizes[2]).assertEqual(2);
      expect(model.offsetOf(sizes, 3)).assertEqual(8);
      expect(model.isValidSpan(sizes, 10)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition117 done');
    });
}

function GridPartitionValidationPart040() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0398
     * @tc.name    JsPartition118
     * @tc.desc    Partition 17 into 7 parts extra 3 seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition118', 0, async function () {
      await yieldThread();
      const sizes = model.partition(17, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(17);
      expect(sizes[0]).assertEqual(3);
      expect(sizes[1]).assertEqual(3);
      expect(sizes[2]).assertEqual(3);
      expect(model.offsetOf(sizes, 3)).assertEqual(9);
      expect(model.isValidSpan(sizes, 17)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition118 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0399
     * @tc.name    JsPartition119
     * @tc.desc    Partition 24 into 10 parts extra 4 seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition119', 0, async function () {
      await yieldThread();
      const sizes = model.partition(24, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(24);
      expect(sizes[0]).assertEqual(3);
      expect(sizes[1]).assertEqual(3);
      expect(sizes[2]).assertEqual(3);
      expect(model.offsetOf(sizes, 3)).assertEqual(9);
      expect(model.isValidSpan(sizes, 24)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition119 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0400
     * @tc.name    JsPartition120
     * @tc.desc    Partition 31 into 1 parts extra 0 seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition120', 0, async function () {
      await yieldThread();
      const sizes = model.partition(31, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(31);
      expect(sizes[0]).assertEqual(31);
      expect(model.offsetOf(sizes, 1)).assertEqual(31);
      expect(model.isValidSpan(sizes, 31)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition120 done');
    });
}

function GridPartitionValidationPart041() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0401
     * @tc.name    JsPartition121
     * @tc.desc    Partition 38 into 4 parts extra 2 seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition121', 0, async function () {
      await yieldThread();
      const sizes = model.partition(38, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(38);
      expect(sizes[0]).assertEqual(10);
      expect(sizes[1]).assertEqual(10);
      expect(sizes[2]).assertEqual(9);
      expect(model.offsetOf(sizes, 3)).assertEqual(29);
      expect(model.isValidSpan(sizes, 38)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition121 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0402
     * @tc.name    JsPartition122
     * @tc.desc    Partition 45 into 7 parts extra 3 seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition122', 0, async function () {
      await yieldThread();
      const sizes = model.partition(45, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(45);
      expect(sizes[0]).assertEqual(7);
      expect(sizes[1]).assertEqual(7);
      expect(sizes[2]).assertEqual(7);
      expect(model.offsetOf(sizes, 3)).assertEqual(21);
      expect(model.isValidSpan(sizes, 45)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition122 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0403
     * @tc.name    JsPartition123
     * @tc.desc    Partition 52 into 10 parts extra 2 seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition123', 0, async function () {
      await yieldThread();
      const sizes = model.partition(52, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(52);
      expect(sizes[0]).assertEqual(6);
      expect(sizes[1]).assertEqual(6);
      expect(sizes[2]).assertEqual(5);
      expect(model.offsetOf(sizes, 3)).assertEqual(17);
      expect(model.isValidSpan(sizes, 52)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition123 done');
    });
}

function GridPartitionValidationPart042() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0404
     * @tc.name    JsPartition124
     * @tc.desc    Partition 59 into 1 parts extra 0 seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition124', 0, async function () {
      await yieldThread();
      const sizes = model.partition(59, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(59);
      expect(sizes[0]).assertEqual(59);
      expect(model.offsetOf(sizes, 1)).assertEqual(59);
      expect(model.isValidSpan(sizes, 59)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition124 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0405
     * @tc.name    JsPartition125
     * @tc.desc    Partition 66 into 4 parts extra 2 seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition125', 0, async function () {
      await yieldThread();
      const sizes = model.partition(66, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(66);
      expect(sizes[0]).assertEqual(17);
      expect(sizes[1]).assertEqual(17);
      expect(sizes[2]).assertEqual(16);
      expect(model.offsetOf(sizes, 3)).assertEqual(50);
      expect(model.isValidSpan(sizes, 66)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition125 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0406
     * @tc.name    JsPartition126
     * @tc.desc    Partition 73 into 7 parts extra 3 seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition126', 0, async function () {
      await yieldThread();
      const sizes = model.partition(73, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(73);
      expect(sizes[0]).assertEqual(11);
      expect(sizes[1]).assertEqual(11);
      expect(sizes[2]).assertEqual(11);
      expect(model.offsetOf(sizes, 3)).assertEqual(33);
      expect(model.isValidSpan(sizes, 73)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition126 done');
    });
}

function GridPartitionValidationPart043() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0407
     * @tc.name    JsPartition127
     * @tc.desc    Partition 80 into 10 parts extra 0 seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition127', 0, async function () {
      await yieldThread();
      const sizes = model.partition(80, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(80);
      expect(sizes[0]).assertEqual(8);
      expect(sizes[1]).assertEqual(8);
      expect(sizes[2]).assertEqual(8);
      expect(model.offsetOf(sizes, 3)).assertEqual(24);
      expect(model.isValidSpan(sizes, 80)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0408
     * @tc.name    JsPartition128
     * @tc.desc    Partition 87 into 1 parts extra 0 seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition128', 0, async function () {
      await yieldThread();
      const sizes = model.partition(87, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(87);
      expect(sizes[0]).assertEqual(87);
      expect(model.offsetOf(sizes, 1)).assertEqual(87);
      expect(model.isValidSpan(sizes, 87)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition128 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0409
     * @tc.name    JsPartition129
     * @tc.desc    Partition 94 into 4 parts extra 2 seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition129', 0, async function () {
      await yieldThread();
      const sizes = model.partition(94, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(94);
      expect(sizes[0]).assertEqual(24);
      expect(sizes[1]).assertEqual(24);
      expect(sizes[2]).assertEqual(23);
      expect(model.offsetOf(sizes, 3)).assertEqual(71);
      expect(model.isValidSpan(sizes, 94)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition129 done');
    });
}

function GridPartitionValidationPart044() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0410
     * @tc.name    JsPartition130
     * @tc.desc    Partition 10 into 7 parts extra 3 seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition130', 0, async function () {
      await yieldThread();
      const sizes = model.partition(10, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(10);
      expect(sizes[0]).assertEqual(2);
      expect(sizes[1]).assertEqual(2);
      expect(sizes[2]).assertEqual(2);
      expect(model.offsetOf(sizes, 3)).assertEqual(6);
      expect(model.isValidSpan(sizes, 10)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition130 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0411
     * @tc.name    JsPartition131
     * @tc.desc    Partition 17 into 10 parts extra 7 seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition131', 0, async function () {
      await yieldThread();
      const sizes = model.partition(17, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(17);
      expect(sizes[0]).assertEqual(2);
      expect(sizes[1]).assertEqual(2);
      expect(sizes[2]).assertEqual(2);
      expect(model.offsetOf(sizes, 3)).assertEqual(6);
      expect(model.isValidSpan(sizes, 17)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition131 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0412
     * @tc.name    JsPartition132
     * @tc.desc    Partition 24 into 1 parts extra 0 seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition132', 0, async function () {
      await yieldThread();
      const sizes = model.partition(24, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(24);
      expect(sizes[0]).assertEqual(24);
      expect(model.offsetOf(sizes, 1)).assertEqual(24);
      expect(model.isValidSpan(sizes, 24)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition132 done');
    });
}

function GridPartitionValidationPart045() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0413
     * @tc.name    JsPartition133
     * @tc.desc    Partition 31 into 4 parts extra 3 seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition133', 0, async function () {
      await yieldThread();
      const sizes = model.partition(31, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(31);
      expect(sizes[0]).assertEqual(8);
      expect(sizes[1]).assertEqual(8);
      expect(sizes[2]).assertEqual(8);
      expect(model.offsetOf(sizes, 3)).assertEqual(24);
      expect(model.isValidSpan(sizes, 31)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition133 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0414
     * @tc.name    JsPartition134
     * @tc.desc    Partition 38 into 7 parts extra 3 seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition134', 0, async function () {
      await yieldThread();
      const sizes = model.partition(38, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(38);
      expect(sizes[0]).assertEqual(6);
      expect(sizes[1]).assertEqual(6);
      expect(sizes[2]).assertEqual(6);
      expect(model.offsetOf(sizes, 3)).assertEqual(18);
      expect(model.isValidSpan(sizes, 38)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition134 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0415
     * @tc.name    JsPartition135
     * @tc.desc    Partition 45 into 10 parts extra 5 seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition135', 0, async function () {
      await yieldThread();
      const sizes = model.partition(45, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(45);
      expect(sizes[0]).assertEqual(5);
      expect(sizes[1]).assertEqual(5);
      expect(sizes[2]).assertEqual(5);
      expect(model.offsetOf(sizes, 3)).assertEqual(15);
      expect(model.isValidSpan(sizes, 45)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition135 done');
    });
}

function GridPartitionValidationPart046() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0416
     * @tc.name    JsPartition136
     * @tc.desc    Partition 52 into 1 parts extra 0 seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition136', 0, async function () {
      await yieldThread();
      const sizes = model.partition(52, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(52);
      expect(sizes[0]).assertEqual(52);
      expect(model.offsetOf(sizes, 1)).assertEqual(52);
      expect(model.isValidSpan(sizes, 52)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition136 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0417
     * @tc.name    JsPartition137
     * @tc.desc    Partition 59 into 4 parts extra 3 seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition137', 0, async function () {
      await yieldThread();
      const sizes = model.partition(59, 4);
      expect(sizes.length).assertEqual(4);
      expect(model.spanSum(sizes)).assertEqual(59);
      expect(sizes[0]).assertEqual(15);
      expect(sizes[1]).assertEqual(15);
      expect(sizes[2]).assertEqual(15);
      expect(model.offsetOf(sizes, 3)).assertEqual(45);
      expect(model.isValidSpan(sizes, 59)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition137 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0418
     * @tc.name    JsPartition138
     * @tc.desc    Partition 66 into 7 parts extra 3 seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition138', 0, async function () {
      await yieldThread();
      const sizes = model.partition(66, 7);
      expect(sizes.length).assertEqual(7);
      expect(model.spanSum(sizes)).assertEqual(66);
      expect(sizes[0]).assertEqual(10);
      expect(sizes[1]).assertEqual(10);
      expect(sizes[2]).assertEqual(10);
      expect(model.offsetOf(sizes, 3)).assertEqual(30);
      expect(model.isValidSpan(sizes, 66)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition138 done');
    });
}

function GridPartitionValidationPart047() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0419
     * @tc.name    JsPartition139
     * @tc.desc    Partition 73 into 10 parts extra 3 seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition139', 0, async function () {
      await yieldThread();
      const sizes = model.partition(73, 10);
      expect(sizes.length).assertEqual(10);
      expect(model.spanSum(sizes)).assertEqual(73);
      expect(sizes[0]).assertEqual(8);
      expect(sizes[1]).assertEqual(8);
      expect(sizes[2]).assertEqual(8);
      expect(model.offsetOf(sizes, 3)).assertEqual(24);
      expect(model.isValidSpan(sizes, 73)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0420
     * @tc.name    JsPartition140
     * @tc.desc    Partition 80 into 1 parts extra 0 seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsPartition140', 0, async function () {
      await yieldThread();
      const sizes = model.partition(80, 1);
      expect(sizes.length).assertEqual(1);
      expect(model.spanSum(sizes)).assertEqual(80);
      expect(sizes[0]).assertEqual(80);
      expect(model.offsetOf(sizes, 1)).assertEqual(80);
      expect(model.isValidSpan(sizes, 80)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsPartition140 done');
    });
}

function GridPartitionValidationGroup001() {
  GridPartitionValidationPart001();
  GridPartitionValidationPart002();
  GridPartitionValidationPart003();
  GridPartitionValidationPart004();
  GridPartitionValidationPart005();
  GridPartitionValidationPart006();
  GridPartitionValidationPart007();
  GridPartitionValidationPart008();
  GridPartitionValidationPart009();
  GridPartitionValidationPart010();
  GridPartitionValidationPart011();
  GridPartitionValidationPart012();
  GridPartitionValidationPart013();
  GridPartitionValidationPart014();
  GridPartitionValidationPart015();
  GridPartitionValidationPart016();
  GridPartitionValidationPart017();
  GridPartitionValidationPart018();
  GridPartitionValidationPart019();
  GridPartitionValidationPart020();
  GridPartitionValidationPart021();
  GridPartitionValidationPart022();
  GridPartitionValidationPart023();
  GridPartitionValidationPart024();
  GridPartitionValidationPart025();
  GridPartitionValidationPart026();
  GridPartitionValidationPart027();
  GridPartitionValidationPart028();
  GridPartitionValidationPart029();
  GridPartitionValidationPart030();
  GridPartitionValidationPart031();
  GridPartitionValidationPart032();
  GridPartitionValidationPart033();
  GridPartitionValidationPart034();
  GridPartitionValidationPart035();
  GridPartitionValidationPart036();
  GridPartitionValidationPart037();
  GridPartitionValidationPart038();
  GridPartitionValidationPart039();
  GridPartitionValidationPart040();
}

function GridPartitionValidationGroup002() {
  GridPartitionValidationPart041();
  GridPartitionValidationPart042();
  GridPartitionValidationPart043();
  GridPartitionValidationPart044();
  GridPartitionValidationPart045();
  GridPartitionValidationPart046();
  GridPartitionValidationPart047();
}

export default function gridPartitionValidationSuite() {
  describe('GridPartitionValidationSuite', function () {
    GridPartitionValidationGroup001();
    GridPartitionValidationGroup002();
  });
}
