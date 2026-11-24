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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { DietModel } from '../Shared/DietModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[DietTests]';

export default function dietLocalizationTestingSuite() {
  describe('DietLocalizationTestingSuite', () => {
    let m: DietModel = new DietModel();

    beforeEach(() => {
      m = new DietModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0357
     * @tc.name    DietLocalizationTesting357
     * @tc.desc    Diet group count consistency 357 probe 357
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting357', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 357) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0358
     * @tc.name    DietLocalizationTesting358
     * @tc.desc    Diet group count consistency 358 probe 358
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting358', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 358) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0359
     * @tc.name    DietLocalizationTesting359
     * @tc.desc    Diet group count consistency 359 probe 359
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting359', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 359) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0360
     * @tc.name    DietLocalizationTesting360
     * @tc.desc    Diet group count consistency 360 probe 360
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting360', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 360) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0361
     * @tc.name    DietLocalizationTesting361
     * @tc.desc    Diet group count consistency 361 probe 361
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting361', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 361) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0362
     * @tc.name    DietLocalizationTesting362
     * @tc.desc    Diet group count consistency 362 probe 362
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting362', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 362) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0363
     * @tc.name    DietLocalizationTesting363
     * @tc.desc    Diet group count consistency 363 probe 363
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting363', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 363) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0364
     * @tc.name    DietLocalizationTesting364
     * @tc.desc    Diet group count consistency 364 probe 364
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting364', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 364) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0365
     * @tc.name    DietLocalizationTesting365
     * @tc.desc    Diet group count consistency 365 probe 365
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting365', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 365) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0366
     * @tc.name    DietLocalizationTesting366
     * @tc.desc    Diet group count consistency 366 probe 366
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting366', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 366) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0367
     * @tc.name    DietLocalizationTesting367
     * @tc.desc    Diet group count consistency 367 probe 367
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting367', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 367) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0368
     * @tc.name    DietLocalizationTesting368
     * @tc.desc    Diet group count consistency 368 probe 368
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting368', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 368) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0369
     * @tc.name    DietLocalizationTesting369
     * @tc.desc    Diet group count consistency 369 probe 369
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting369', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 369) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0370
     * @tc.name    DietLocalizationTesting370
     * @tc.desc    Diet group count consistency 370 probe 370
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting370', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 370) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0371
     * @tc.name    DietLocalizationTesting371
     * @tc.desc    Diet group count consistency 371 probe 371
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting371', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 371) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0372
     * @tc.name    DietLocalizationTesting372
     * @tc.desc    Diet group count consistency 372 probe 372
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting372', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 372) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0373
     * @tc.name    DietLocalizationTesting373
     * @tc.desc    Diet group count consistency 373 probe 373
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting373', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 373) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0374
     * @tc.name    DietLocalizationTesting374
     * @tc.desc    Diet group count consistency 374 probe 374
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting374', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 374) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0375
     * @tc.name    DietLocalizationTesting375
     * @tc.desc    Diet group count consistency 375 probe 375
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting375', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 375) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0376
     * @tc.name    DietLocalizationTesting376
     * @tc.desc    Diet group count consistency 376 probe 376
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting376', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 376) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0377
     * @tc.name    DietLocalizationTesting377
     * @tc.desc    Diet group count consistency 377 probe 377
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting377', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 377) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0378
     * @tc.name    DietLocalizationTesting378
     * @tc.desc    Diet group count consistency 378 probe 378
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting378', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 378) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0379
     * @tc.name    DietLocalizationTesting379
     * @tc.desc    Diet group count consistency 379 probe 379
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting379', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 379) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0380
     * @tc.name    DietLocalizationTesting380
     * @tc.desc    Diet group count consistency 380 probe 380
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting380', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 380) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0381
     * @tc.name    DietLocalizationTesting381
     * @tc.desc    Diet group count consistency 381 probe 381
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting381', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 381) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0382
     * @tc.name    DietLocalizationTesting382
     * @tc.desc    Diet group count consistency 382 probe 382
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting382', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 382) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0383
     * @tc.name    DietLocalizationTesting383
     * @tc.desc    Diet group count consistency 383 probe 383
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting383', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 383) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0384
     * @tc.name    DietLocalizationTesting384
     * @tc.desc    Diet group count consistency 384 probe 384
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting384', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 384) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0385
     * @tc.name    DietLocalizationTesting385
     * @tc.desc    Diet group count consistency 385 probe 385
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting385', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 385) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0386
     * @tc.name    DietLocalizationTesting386
     * @tc.desc    Diet group count consistency 386 probe 386
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting386', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 386) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0387
     * @tc.name    DietLocalizationTesting387
     * @tc.desc    Diet group count consistency 387 probe 387
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting387', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 387) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0388
     * @tc.name    DietLocalizationTesting388
     * @tc.desc    Diet group count consistency 388 probe 388
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting388', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 388) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0389
     * @tc.name    DietLocalizationTesting389
     * @tc.desc    Diet group count consistency 389 probe 389
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting389', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 389) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0390
     * @tc.name    DietLocalizationTesting390
     * @tc.desc    Diet group count consistency 390 probe 390
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting390', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 390) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0391
     * @tc.name    DietLocalizationTesting391
     * @tc.desc    Diet group count consistency 391 probe 391
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting391', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 391) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0392
     * @tc.name    DietLocalizationTesting392
     * @tc.desc    Diet group count consistency 392 probe 392
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting392', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 392) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0393
     * @tc.name    DietLocalizationTesting393
     * @tc.desc    Diet group count consistency 393 probe 393
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting393', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 393) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0394
     * @tc.name    DietLocalizationTesting394
     * @tc.desc    Diet group count consistency 394 probe 394
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting394', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 394) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0395
     * @tc.name    DietLocalizationTesting395
     * @tc.desc    Diet group count consistency 395 probe 395
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting395', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 395) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0396
     * @tc.name    DietLocalizationTesting396
     * @tc.desc    Diet group count consistency 396 probe 396
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting396', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 396) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0397
     * @tc.name    DietLocalizationTesting397
     * @tc.desc    Diet group count consistency 397 probe 397
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting397', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 397) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0398
     * @tc.name    DietLocalizationTesting398
     * @tc.desc    Diet group count consistency 398 probe 398
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting398', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 398) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0399
     * @tc.name    DietLocalizationTesting399
     * @tc.desc    Diet group count consistency 399 probe 399
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting399', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 399) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0400
     * @tc.name    DietLocalizationTesting400
     * @tc.desc    Diet group count consistency 400 probe 400
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting400', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 400) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0401
     * @tc.name    DietLocalizationTesting401
     * @tc.desc    Diet group count consistency 401 probe 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting401', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 401) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0402
     * @tc.name    DietLocalizationTesting402
     * @tc.desc    Diet group count consistency 402 probe 402
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting402', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 402) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0403
     * @tc.name    DietLocalizationTesting403
     * @tc.desc    Diet group count consistency 403 probe 403
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting403', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 403) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0404
     * @tc.name    DietLocalizationTesting404
     * @tc.desc    Diet group count consistency 404 probe 404
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting404', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 404) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0405
     * @tc.name    DietLocalizationTesting405
     * @tc.desc    Diet group count consistency 405 probe 405
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting405', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 405) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0406
     * @tc.name    DietLocalizationTesting406
     * @tc.desc    Diet group count consistency 406 probe 406
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting406', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 406) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0407
     * @tc.name    DietLocalizationTesting407
     * @tc.desc    Diet group count consistency 407 probe 407
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting407', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 407) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0408
     * @tc.name    DietLocalizationTesting408
     * @tc.desc    Diet group count consistency 408 probe 408
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting408', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 408) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0409
     * @tc.name    DietLocalizationTesting409
     * @tc.desc    Diet group count consistency 409 probe 409
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting409', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 409) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0410
     * @tc.name    DietLocalizationTesting410
     * @tc.desc    Diet group count consistency 410 probe 410
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting410', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 410) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0411
     * @tc.name    DietLocalizationTesting411
     * @tc.desc    Diet group count consistency 411 probe 411
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting411', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 411) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0412
     * @tc.name    DietLocalizationTesting412
     * @tc.desc    Diet group count consistency 412 probe 412
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting412', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 412) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0413
     * @tc.name    DietLocalizationTesting413
     * @tc.desc    Diet group count consistency 413 probe 413
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting413', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 413) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0414
     * @tc.name    DietLocalizationTesting414
     * @tc.desc    Diet group count consistency 414 probe 414
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting414', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 414) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0415
     * @tc.name    DietLocalizationTesting415
     * @tc.desc    Diet group count consistency 415 probe 415
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting415', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 415) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0416
     * @tc.name    DietLocalizationTesting416
     * @tc.desc    Diet group count consistency 416 probe 416
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting416', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 416) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0417
     * @tc.name    DietLocalizationTesting417
     * @tc.desc    Diet group count consistency 417 probe 417
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting417', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 417) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0418
     * @tc.name    DietLocalizationTesting418
     * @tc.desc    Diet group count consistency 418 probe 418
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting418', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 418) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0419
     * @tc.name    DietLocalizationTesting419
     * @tc.desc    Diet group count consistency 419 probe 419
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting419', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 419) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0420
     * @tc.name    DietLocalizationTesting420
     * @tc.desc    Diet group count consistency 420 probe 420
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting420', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 420) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0421
     * @tc.name    DietLocalizationTesting421
     * @tc.desc    Diet group count consistency 421 probe 421
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting421', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 421) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0422
     * @tc.name    DietLocalizationTesting422
     * @tc.desc    Diet group count consistency 422 probe 422
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting422', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 422) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0423
     * @tc.name    DietLocalizationTesting423
     * @tc.desc    Diet group count consistency 423 probe 423
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting423', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 423) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0424
     * @tc.name    DietLocalizationTesting424
     * @tc.desc    Diet group count consistency 424 probe 424
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting424', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 424) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0425
     * @tc.name    DietLocalizationTesting425
     * @tc.desc    Diet group count consistency 425 probe 425
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting425', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 425) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0426
     * @tc.name    DietLocalizationTesting426
     * @tc.desc    Diet group count consistency 426 probe 426
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting426', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 426) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0427
     * @tc.name    DietLocalizationTesting427
     * @tc.desc    Diet group count consistency 427 probe 427
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting427', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 427) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0428
     * @tc.name    DietLocalizationTesting428
     * @tc.desc    Diet group count consistency 428 probe 428
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting428', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 428) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0429
     * @tc.name    DietLocalizationTesting429
     * @tc.desc    Diet group count consistency 429 probe 429
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting429', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 429) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0430
     * @tc.name    DietLocalizationTesting430
     * @tc.desc    Diet group count consistency 430 probe 430
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting430', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 430) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0431
     * @tc.name    DietLocalizationTesting431
     * @tc.desc    Diet group count consistency 431 probe 431
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting431', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 431) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0432
     * @tc.name    DietLocalizationTesting432
     * @tc.desc    Diet group count consistency 432 probe 432
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting432', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 432) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0433
     * @tc.name    DietLocalizationTesting433
     * @tc.desc    Diet group count consistency 433 probe 433
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting433', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 433) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0434
     * @tc.name    DietLocalizationTesting434
     * @tc.desc    Diet group count consistency 434 probe 434
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting434', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 434) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0435
     * @tc.name    DietLocalizationTesting435
     * @tc.desc    Diet group count consistency 435 probe 435
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting435', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 435) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0436
     * @tc.name    DietLocalizationTesting436
     * @tc.desc    Diet group count consistency 436 probe 436
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting436', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 436) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0437
     * @tc.name    DietLocalizationTesting437
     * @tc.desc    Diet group count consistency 437 probe 437
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting437', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 437) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0438
     * @tc.name    DietLocalizationTesting438
     * @tc.desc    Diet group count consistency 438 probe 438
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting438', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 438) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0439
     * @tc.name    DietLocalizationTesting439
     * @tc.desc    Diet group count consistency 439 probe 439
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting439', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 439) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0440
     * @tc.name    DietLocalizationTesting440
     * @tc.desc    Diet group count consistency 440 probe 440
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting440', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 440) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0441
     * @tc.name    DietLocalizationTesting441
     * @tc.desc    Diet group count consistency 441 probe 441
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting441', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 441) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0442
     * @tc.name    DietLocalizationTesting442
     * @tc.desc    Diet group count consistency 442 probe 442
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting442', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 442) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0443
     * @tc.name    DietLocalizationTesting443
     * @tc.desc    Diet group count consistency 443 probe 443
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting443', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 443) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0444
     * @tc.name    DietLocalizationTesting444
     * @tc.desc    Diet group count consistency 444 probe 444
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting444', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 444) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0445
     * @tc.name    DietLocalizationTesting445
     * @tc.desc    Diet group count consistency 445 probe 445
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting445', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 445) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0446
     * @tc.name    DietLocalizationTesting446
     * @tc.desc    Diet group count consistency 446 probe 446
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting446', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 446) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0447
     * @tc.name    DietLocalizationTesting447
     * @tc.desc    Diet group count consistency 447 probe 447
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting447', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 447) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0448
     * @tc.name    DietLocalizationTesting448
     * @tc.desc    Diet group count consistency 448 probe 448
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting448', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 448) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0449
     * @tc.name    DietLocalizationTesting449
     * @tc.desc    Diet group count consistency 449 probe 449
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting449', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 449) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0450
     * @tc.name    DietLocalizationTesting450
     * @tc.desc    Diet group count consistency 450 probe 450
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting450', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 450) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0451
     * @tc.name    DietLocalizationTesting451
     * @tc.desc    Diet group count consistency 451 probe 451
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting451', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 451) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0452
     * @tc.name    DietLocalizationTesting452
     * @tc.desc    Diet group count consistency 452 probe 452
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting452', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 452) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0453
     * @tc.name    DietLocalizationTesting453
     * @tc.desc    Diet group count consistency 453 probe 453
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting453', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 453) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0454
     * @tc.name    DietLocalizationTesting454
     * @tc.desc    Diet group count consistency 454 probe 454
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting454', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 454) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0455
     * @tc.name    DietLocalizationTesting455
     * @tc.desc    Diet group count consistency 455 probe 455
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting455', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 455) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0456
     * @tc.name    DietLocalizationTesting456
     * @tc.desc    Diet group count consistency 456 probe 456
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting456', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 456) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0457
     * @tc.name    DietLocalizationTesting457
     * @tc.desc    Diet group count consistency 457 probe 457
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting457', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 457) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0458
     * @tc.name    DietLocalizationTesting458
     * @tc.desc    Diet group count consistency 458 probe 458
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting458', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 458) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0459
     * @tc.name    DietLocalizationTesting459
     * @tc.desc    Diet group count consistency 459 probe 459
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting459', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 459) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0460
     * @tc.name    DietLocalizationTesting460
     * @tc.desc    Diet group count consistency 460 probe 460
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting460', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 460) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0461
     * @tc.name    DietLocalizationTesting461
     * @tc.desc    Diet group count consistency 461 probe 461
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting461', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 461) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0462
     * @tc.name    DietLocalizationTesting462
     * @tc.desc    Diet group count consistency 462 probe 462
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting462', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 462) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0463
     * @tc.name    DietLocalizationTesting463
     * @tc.desc    Diet group count consistency 463 probe 463
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting463', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 463) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0464
     * @tc.name    DietLocalizationTesting464
     * @tc.desc    Diet group count consistency 464 probe 464
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting464', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 464) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0465
     * @tc.name    DietLocalizationTesting465
     * @tc.desc    Diet group count consistency 465 probe 465
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting465', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 465) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0466
     * @tc.name    DietLocalizationTesting466
     * @tc.desc    Diet group count consistency 466 probe 466
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting466', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 466) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0467
     * @tc.name    DietLocalizationTesting467
     * @tc.desc    Diet group count consistency 467 probe 467
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting467', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 467) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0468
     * @tc.name    DietLocalizationTesting468
     * @tc.desc    Diet group count consistency 468 probe 468
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting468', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 468) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0469
     * @tc.name    DietLocalizationTesting469
     * @tc.desc    Diet group count consistency 469 probe 469
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting469', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 469) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0470
     * @tc.name    DietLocalizationTesting470
     * @tc.desc    Diet group count consistency 470 probe 470
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting470', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 470) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0471
     * @tc.name    DietLocalizationTesting471
     * @tc.desc    Diet group count consistency 471 probe 471
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting471', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 471) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0472
     * @tc.name    DietLocalizationTesting472
     * @tc.desc    Diet group count consistency 472 probe 472
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting472', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 472) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0473
     * @tc.name    DietLocalizationTesting473
     * @tc.desc    Diet group count consistency 473 probe 473
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting473', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 473) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0474
     * @tc.name    DietLocalizationTesting474
     * @tc.desc    Diet group count consistency 474 probe 474
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting474', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 474) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0475
     * @tc.name    DietLocalizationTesting475
     * @tc.desc    Diet group count consistency 475 probe 475
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting475', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 475) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0476
     * @tc.name    DietLocalizationTesting476
     * @tc.desc    Diet group count consistency 476 probe 476
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting476', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 476) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0477
     * @tc.name    DietLocalizationTesting477
     * @tc.desc    Diet group count consistency 477 probe 477
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting477', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 477) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0478
     * @tc.name    DietLocalizationTesting478
     * @tc.desc    Diet group count consistency 478 probe 478
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting478', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 478) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0479
     * @tc.name    DietLocalizationTesting479
     * @tc.desc    Diet group count consistency 479 probe 479
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting479', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 479) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0480
     * @tc.name    DietLocalizationTesting480
     * @tc.desc    Diet group count consistency 480 probe 480
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting480', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 480) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0481
     * @tc.name    DietLocalizationTesting481
     * @tc.desc    Diet group count consistency 481 probe 481
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting481', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 481) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0482
     * @tc.name    DietLocalizationTesting482
     * @tc.desc    Diet group count consistency 482 probe 482
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting482', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 482) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0483
     * @tc.name    DietLocalizationTesting483
     * @tc.desc    Diet group count consistency 483 probe 483
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting483', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 483) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0484
     * @tc.name    DietLocalizationTesting484
     * @tc.desc    Diet group count consistency 484 probe 484
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting484', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 484) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0485
     * @tc.name    DietLocalizationTesting485
     * @tc.desc    Diet group count consistency 485 probe 485
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting485', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 485) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0486
     * @tc.name    DietLocalizationTesting486
     * @tc.desc    Diet group count consistency 486 probe 486
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting486', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 486) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0487
     * @tc.name    DietLocalizationTesting487
     * @tc.desc    Diet group count consistency 487 probe 487
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting487', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 487) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0488
     * @tc.name    DietLocalizationTesting488
     * @tc.desc    Diet group count consistency 488 probe 488
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting488', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 488) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0489
     * @tc.name    DietLocalizationTesting489
     * @tc.desc    Diet group count consistency 489 probe 489
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting489', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 489) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0490
     * @tc.name    DietLocalizationTesting490
     * @tc.desc    Diet group count consistency 490 probe 490
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting490', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 490) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0491
     * @tc.name    DietLocalizationTesting491
     * @tc.desc    Diet group count consistency 491 probe 491
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting491', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 491) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0492
     * @tc.name    DietLocalizationTesting492
     * @tc.desc    Diet group count consistency 492 probe 492
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting492', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 492) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0493
     * @tc.name    DietLocalizationTesting493
     * @tc.desc    Diet group count consistency 493 probe 493
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting493', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 493) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0494
     * @tc.name    DietLocalizationTesting494
     * @tc.desc    Diet group count consistency 494 probe 494
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting494', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 494) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0495
     * @tc.name    DietLocalizationTesting495
     * @tc.desc    Diet group count consistency 495 probe 495
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting495', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 495) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0496
     * @tc.name    DietLocalizationTesting496
     * @tc.desc    Diet group count consistency 496 probe 496
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting496', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 496) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0497
     * @tc.name    DietLocalizationTesting497
     * @tc.desc    Diet group count consistency 497 probe 497
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting497', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 497) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0498
     * @tc.name    DietLocalizationTesting498
     * @tc.desc    Diet group count consistency 498 probe 498
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting498', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 498) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0499
     * @tc.name    DietLocalizationTesting499
     * @tc.desc    Diet group count consistency 499 probe 499
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting499', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 499) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0500
     * @tc.name    DietLocalizationTesting500
     * @tc.desc    Diet group count consistency 500 probe 500
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting500', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 500) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0501
     * @tc.name    DietLocalizationTesting501
     * @tc.desc    Diet group count consistency 501 probe 501
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting501', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 501) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0502
     * @tc.name    DietLocalizationTesting502
     * @tc.desc    Diet group count consistency 502 probe 502
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting502', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 502) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0503
     * @tc.name    DietLocalizationTesting503
     * @tc.desc    Diet group count consistency 503 probe 503
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting503', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 503) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0504
     * @tc.name    DietLocalizationTesting504
     * @tc.desc    Diet group count consistency 504 probe 504
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting504', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 504) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0505
     * @tc.name    DietLocalizationTesting505
     * @tc.desc    Diet group count consistency 505 probe 505
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting505', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 505) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0506
     * @tc.name    DietLocalizationTesting506
     * @tc.desc    Diet group count consistency 506 probe 506
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting506', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 506) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0507
     * @tc.name    DietLocalizationTesting507
     * @tc.desc    Diet group count consistency 507 probe 507
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting507', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 507) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0508
     * @tc.name    DietLocalizationTesting508
     * @tc.desc    Diet group count consistency 508 probe 508
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting508', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 508) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0509
     * @tc.name    DietLocalizationTesting509
     * @tc.desc    Diet group count consistency 509 probe 509
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting509', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 509) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0510
     * @tc.name    DietLocalizationTesting510
     * @tc.desc    Diet group count consistency 510 probe 510
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting510', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 510) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0511
     * @tc.name    DietLocalizationTesting511
     * @tc.desc    Diet group count consistency 511 probe 511
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting511', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 511) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0512
     * @tc.name    DietLocalizationTesting512
     * @tc.desc    Diet group count consistency 512 probe 512
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting512', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 512) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0513
     * @tc.name    DietLocalizationTesting513
     * @tc.desc    Diet group count consistency 513 probe 513
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting513', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 513) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0514
     * @tc.name    DietLocalizationTesting514
     * @tc.desc    Diet group count consistency 514 probe 514
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting514', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 514) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0515
     * @tc.name    DietLocalizationTesting515
     * @tc.desc    Diet group count consistency 515 probe 515
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting515', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 515) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0516
     * @tc.name    DietLocalizationTesting516
     * @tc.desc    Diet group count consistency 516 probe 516
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting516', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 516) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0517
     * @tc.name    DietLocalizationTesting517
     * @tc.desc    Diet group count consistency 517 probe 517
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting517', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 517) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0518
     * @tc.name    DietLocalizationTesting518
     * @tc.desc    Diet group count consistency 518 probe 518
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting518', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(3) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 518) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0519
     * @tc.name    DietLocalizationTesting519
     * @tc.desc    Diet group count consistency 519 probe 519
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting519', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(4) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 519) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0520
     * @tc.name    DietLocalizationTesting520
     * @tc.desc    Diet group count consistency 520 probe 520
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting520', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(0) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 520) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0521
     * @tc.name    DietLocalizationTesting521
     * @tc.desc    Diet group count consistency 521 probe 521
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting521', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(1) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 521) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0522
     * @tc.name    DietLocalizationTesting522
     * @tc.desc    Diet group count consistency 522 probe 522
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietLocalizationTesting522', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.groupByLetter().length).assertEqual(m.getGroupCount());
      expect(m.calorieRatios().length <= 4).assertEqual(true);
      expect(m.countByCategory(2) >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 522) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

