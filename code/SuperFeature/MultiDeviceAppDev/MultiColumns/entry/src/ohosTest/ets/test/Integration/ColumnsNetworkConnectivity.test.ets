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
import { ColumnsModel } from '../Shared/ColumnsModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[ColumnsTests]';

export default function columnsNetworkConnectivitySuite() {
  describe('ColumnsNetworkConnectivitySuite', () => {
    let m: ColumnsModel = new ColumnsModel();

    beforeEach(() => {
      m = new ColumnsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0353
     * @tc.name    ColumnsNetworkConnectivity353
     * @tc.desc    Columns totals round 353 probe 353
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity353', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit353') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0354
     * @tc.name    ColumnsNetworkConnectivity354
     * @tc.desc    Columns totals round 354 probe 354
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity354', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit354') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0355
     * @tc.name    ColumnsNetworkConnectivity355
     * @tc.desc    Columns totals round 355 probe 355
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity355', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit355') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0356
     * @tc.name    ColumnsNetworkConnectivity356
     * @tc.desc    Columns totals round 356 probe 356
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity356', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit356') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0357
     * @tc.name    ColumnsNetworkConnectivity357
     * @tc.desc    Columns totals round 357 probe 357
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity357', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit357') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0358
     * @tc.name    ColumnsNetworkConnectivity358
     * @tc.desc    Columns totals round 358 probe 358
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity358', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit358') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0359
     * @tc.name    ColumnsNetworkConnectivity359
     * @tc.desc    Columns totals round 359 probe 359
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity359', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit359') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0360
     * @tc.name    ColumnsNetworkConnectivity360
     * @tc.desc    Columns totals round 360 probe 360
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity360', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit360') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0361
     * @tc.name    ColumnsNetworkConnectivity361
     * @tc.desc    Columns totals round 361 probe 361
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity361', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit361') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0362
     * @tc.name    ColumnsNetworkConnectivity362
     * @tc.desc    Columns totals round 362 probe 362
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity362', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit362') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0363
     * @tc.name    ColumnsNetworkConnectivity363
     * @tc.desc    Columns totals round 363 probe 363
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity363', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit363') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0364
     * @tc.name    ColumnsNetworkConnectivity364
     * @tc.desc    Columns totals round 364 probe 364
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity364', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit364') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0365
     * @tc.name    ColumnsNetworkConnectivity365
     * @tc.desc    Columns totals round 365 probe 365
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity365', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit365') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0366
     * @tc.name    ColumnsNetworkConnectivity366
     * @tc.desc    Columns totals round 366 probe 366
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity366', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit366') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0367
     * @tc.name    ColumnsNetworkConnectivity367
     * @tc.desc    Columns totals round 367 probe 367
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity367', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit367') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0368
     * @tc.name    ColumnsNetworkConnectivity368
     * @tc.desc    Columns totals round 368 probe 368
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity368', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit368') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0369
     * @tc.name    ColumnsNetworkConnectivity369
     * @tc.desc    Columns totals round 369 probe 369
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity369', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit369') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0370
     * @tc.name    ColumnsNetworkConnectivity370
     * @tc.desc    Columns totals round 370 probe 370
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity370', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit370') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0371
     * @tc.name    ColumnsNetworkConnectivity371
     * @tc.desc    Columns totals round 371 probe 371
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity371', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit371') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0372
     * @tc.name    ColumnsNetworkConnectivity372
     * @tc.desc    Columns totals round 372 probe 372
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity372', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit372') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0373
     * @tc.name    ColumnsNetworkConnectivity373
     * @tc.desc    Columns totals round 373 probe 373
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity373', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit373') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0374
     * @tc.name    ColumnsNetworkConnectivity374
     * @tc.desc    Columns totals round 374 probe 374
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity374', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit374') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0375
     * @tc.name    ColumnsNetworkConnectivity375
     * @tc.desc    Columns totals round 375 probe 375
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsNetworkConnectivity375', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mailSum = 0;
      for (let k = 0; k < m.getMails().length; k++) { mailSum += m.getMails()[k].num; }
      expect(m.getTotalMailNum()).assertEqual(mailSum);
      expect(m.getTotalPhotoCount() >= 0).assertEqual(true);
      expect(m.getMailByType('nohit375') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

