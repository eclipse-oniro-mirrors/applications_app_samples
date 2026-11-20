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

export default function columnsEventHandlingSuite() {
  describe('ColumnsEventHandlingSuite', () => {
    let m: ColumnsModel = new ColumnsModel();

    beforeEach(() => {
      m = new ColumnsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0376
     * @tc.name    ColumnsEventHandling376
     * @tc.desc    Columns mail lookup for type 1 probe 376
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling376', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit376') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0377
     * @tc.name    ColumnsEventHandling377
     * @tc.desc    Columns mail lookup for type 2 probe 377
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling377', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit377') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0378
     * @tc.name    ColumnsEventHandling378
     * @tc.desc    Columns mail lookup for type 0 probe 378
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling378', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit378') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0379
     * @tc.name    ColumnsEventHandling379
     * @tc.desc    Columns mail lookup for type 1 probe 379
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling379', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit379') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0380
     * @tc.name    ColumnsEventHandling380
     * @tc.desc    Columns mail lookup for type 2 probe 380
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling380', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit380') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0381
     * @tc.name    ColumnsEventHandling381
     * @tc.desc    Columns mail lookup for type 0 probe 381
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling381', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit381') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0382
     * @tc.name    ColumnsEventHandling382
     * @tc.desc    Columns mail lookup for type 1 probe 382
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling382', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit382') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0383
     * @tc.name    ColumnsEventHandling383
     * @tc.desc    Columns mail lookup for type 2 probe 383
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling383', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit383') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0384
     * @tc.name    ColumnsEventHandling384
     * @tc.desc    Columns mail lookup for type 0 probe 384
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling384', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit384') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0385
     * @tc.name    ColumnsEventHandling385
     * @tc.desc    Columns mail lookup for type 1 probe 385
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling385', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit385') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0386
     * @tc.name    ColumnsEventHandling386
     * @tc.desc    Columns mail lookup for type 2 probe 386
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling386', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit386') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0387
     * @tc.name    ColumnsEventHandling387
     * @tc.desc    Columns mail lookup for type 0 probe 387
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling387', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit387') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0388
     * @tc.name    ColumnsEventHandling388
     * @tc.desc    Columns mail lookup for type 1 probe 388
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling388', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit388') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0389
     * @tc.name    ColumnsEventHandling389
     * @tc.desc    Columns mail lookup for type 2 probe 389
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling389', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit389') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0390
     * @tc.name    ColumnsEventHandling390
     * @tc.desc    Columns mail lookup for type 0 probe 390
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling390', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit390') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0391
     * @tc.name    ColumnsEventHandling391
     * @tc.desc    Columns mail lookup for type 1 probe 391
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling391', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit391') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0392
     * @tc.name    ColumnsEventHandling392
     * @tc.desc    Columns mail lookup for type 2 probe 392
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling392', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit392') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0393
     * @tc.name    ColumnsEventHandling393
     * @tc.desc    Columns mail lookup for type 0 probe 393
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling393', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit393') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0394
     * @tc.name    ColumnsEventHandling394
     * @tc.desc    Columns mail lookup for type 1 probe 394
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling394', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit394') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0395
     * @tc.name    ColumnsEventHandling395
     * @tc.desc    Columns mail lookup for type 2 probe 395
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling395', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit395') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0396
     * @tc.name    ColumnsEventHandling396
     * @tc.desc    Columns mail lookup for type 0 probe 396
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling396', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit396') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0397
     * @tc.name    ColumnsEventHandling397
     * @tc.desc    Columns mail lookup for type 1 probe 397
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling397', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit397') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0398
     * @tc.name    ColumnsEventHandling398
     * @tc.desc    Columns mail lookup for type 2 probe 398
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling398', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit398') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0399
     * @tc.name    ColumnsEventHandling399
     * @tc.desc    Columns mail lookup for type 0 probe 399
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling399', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit399') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0400
     * @tc.name    ColumnsEventHandling400
     * @tc.desc    Columns mail lookup for type 1 probe 400
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling400', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit400') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0401
     * @tc.name    ColumnsEventHandling401
     * @tc.desc    Columns mail lookup for type 2 probe 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling401', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit401') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0402
     * @tc.name    ColumnsEventHandling402
     * @tc.desc    Columns mail lookup for type 0 probe 402
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling402', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit402') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0403
     * @tc.name    ColumnsEventHandling403
     * @tc.desc    Columns mail lookup for type 1 probe 403
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling403', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit403') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0404
     * @tc.name    ColumnsEventHandling404
     * @tc.desc    Columns mail lookup for type 2 probe 404
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling404', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit404') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0405
     * @tc.name    ColumnsEventHandling405
     * @tc.desc    Columns mail lookup for type 0 probe 405
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling405', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit405') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0406
     * @tc.name    ColumnsEventHandling406
     * @tc.desc    Columns mail lookup for type 1 probe 406
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling406', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit406') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0407
     * @tc.name    ColumnsEventHandling407
     * @tc.desc    Columns mail lookup for type 2 probe 407
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling407', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit407') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0408
     * @tc.name    ColumnsEventHandling408
     * @tc.desc    Columns mail lookup for type 0 probe 408
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling408', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit408') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0409
     * @tc.name    ColumnsEventHandling409
     * @tc.desc    Columns mail lookup for type 1 probe 409
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling409', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit409') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0410
     * @tc.name    ColumnsEventHandling410
     * @tc.desc    Columns mail lookup for type 2 probe 410
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling410', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit410') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0411
     * @tc.name    ColumnsEventHandling411
     * @tc.desc    Columns mail lookup for type 0 probe 411
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling411', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit411') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0412
     * @tc.name    ColumnsEventHandling412
     * @tc.desc    Columns mail lookup for type 1 probe 412
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling412', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit412') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0413
     * @tc.name    ColumnsEventHandling413
     * @tc.desc    Columns mail lookup for type 2 probe 413
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling413', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit413') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0414
     * @tc.name    ColumnsEventHandling414
     * @tc.desc    Columns mail lookup for type 0 probe 414
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling414', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit414') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0415
     * @tc.name    ColumnsEventHandling415
     * @tc.desc    Columns mail lookup for type 1 probe 415
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling415', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit415') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0416
     * @tc.name    ColumnsEventHandling416
     * @tc.desc    Columns mail lookup for type 2 probe 416
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling416', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit416') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0417
     * @tc.name    ColumnsEventHandling417
     * @tc.desc    Columns mail lookup for type 0 probe 417
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling417', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit417') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0418
     * @tc.name    ColumnsEventHandling418
     * @tc.desc    Columns mail lookup for type 1 probe 418
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling418', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit418') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0419
     * @tc.name    ColumnsEventHandling419
     * @tc.desc    Columns mail lookup for type 2 probe 419
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling419', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit419') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0420
     * @tc.name    ColumnsEventHandling420
     * @tc.desc    Columns mail lookup for type 0 probe 420
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling420', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit420') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0421
     * @tc.name    ColumnsEventHandling421
     * @tc.desc    Columns mail lookup for type 1 probe 421
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling421', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit421') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0422
     * @tc.name    ColumnsEventHandling422
     * @tc.desc    Columns mail lookup for type 2 probe 422
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling422', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit422') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0423
     * @tc.name    ColumnsEventHandling423
     * @tc.desc    Columns mail lookup for type 0 probe 423
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling423', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit423') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0424
     * @tc.name    ColumnsEventHandling424
     * @tc.desc    Columns mail lookup for type 1 probe 424
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling424', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit424') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0425
     * @tc.name    ColumnsEventHandling425
     * @tc.desc    Columns mail lookup for type 2 probe 425
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling425', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit425') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0426
     * @tc.name    ColumnsEventHandling426
     * @tc.desc    Columns mail lookup for type 0 probe 426
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling426', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit426') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0427
     * @tc.name    ColumnsEventHandling427
     * @tc.desc    Columns mail lookup for type 1 probe 427
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling427', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit427') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0428
     * @tc.name    ColumnsEventHandling428
     * @tc.desc    Columns mail lookup for type 2 probe 428
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling428', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit428') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0429
     * @tc.name    ColumnsEventHandling429
     * @tc.desc    Columns mail lookup for type 0 probe 429
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling429', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit429') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0430
     * @tc.name    ColumnsEventHandling430
     * @tc.desc    Columns mail lookup for type 1 probe 430
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling430', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit430') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0431
     * @tc.name    ColumnsEventHandling431
     * @tc.desc    Columns mail lookup for type 2 probe 431
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling431', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit431') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0432
     * @tc.name    ColumnsEventHandling432
     * @tc.desc    Columns mail lookup for type 0 probe 432
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling432', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit432') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0433
     * @tc.name    ColumnsEventHandling433
     * @tc.desc    Columns mail lookup for type 1 probe 433
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling433', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit433') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0434
     * @tc.name    ColumnsEventHandling434
     * @tc.desc    Columns mail lookup for type 2 probe 434
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling434', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit434') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0435
     * @tc.name    ColumnsEventHandling435
     * @tc.desc    Columns mail lookup for type 0 probe 435
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling435', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit435') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0436
     * @tc.name    ColumnsEventHandling436
     * @tc.desc    Columns mail lookup for type 1 probe 436
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling436', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit436') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0437
     * @tc.name    ColumnsEventHandling437
     * @tc.desc    Columns mail lookup for type 2 probe 437
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling437', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit437') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0438
     * @tc.name    ColumnsEventHandling438
     * @tc.desc    Columns mail lookup for type 0 probe 438
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling438', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit438') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0439
     * @tc.name    ColumnsEventHandling439
     * @tc.desc    Columns mail lookup for type 1 probe 439
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling439', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit439') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0440
     * @tc.name    ColumnsEventHandling440
     * @tc.desc    Columns mail lookup for type 2 probe 440
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling440', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit440') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0441
     * @tc.name    ColumnsEventHandling441
     * @tc.desc    Columns mail lookup for type 0 probe 441
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling441', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit441') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0442
     * @tc.name    ColumnsEventHandling442
     * @tc.desc    Columns mail lookup for type 1 probe 442
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling442', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit442') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0443
     * @tc.name    ColumnsEventHandling443
     * @tc.desc    Columns mail lookup for type 2 probe 443
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling443', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit443') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0444
     * @tc.name    ColumnsEventHandling444
     * @tc.desc    Columns mail lookup for type 0 probe 444
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling444', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit444') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0445
     * @tc.name    ColumnsEventHandling445
     * @tc.desc    Columns mail lookup for type 1 probe 445
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling445', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit445') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0446
     * @tc.name    ColumnsEventHandling446
     * @tc.desc    Columns mail lookup for type 2 probe 446
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling446', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit446') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0447
     * @tc.name    ColumnsEventHandling447
     * @tc.desc    Columns mail lookup for type 0 probe 447
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling447', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit447') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0448
     * @tc.name    ColumnsEventHandling448
     * @tc.desc    Columns mail lookup for type 1 probe 448
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling448', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit448') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0449
     * @tc.name    ColumnsEventHandling449
     * @tc.desc    Columns mail lookup for type 2 probe 449
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling449', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit449') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0450
     * @tc.name    ColumnsEventHandling450
     * @tc.desc    Columns mail lookup for type 0 probe 450
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling450', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit450') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0451
     * @tc.name    ColumnsEventHandling451
     * @tc.desc    Columns mail lookup for type 1 probe 451
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling451', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit451') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0452
     * @tc.name    ColumnsEventHandling452
     * @tc.desc    Columns mail lookup for type 2 probe 452
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling452', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit452') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0453
     * @tc.name    ColumnsEventHandling453
     * @tc.desc    Columns mail lookup for type 0 probe 453
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling453', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit453') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0454
     * @tc.name    ColumnsEventHandling454
     * @tc.desc    Columns mail lookup for type 1 probe 454
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling454', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit454') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0455
     * @tc.name    ColumnsEventHandling455
     * @tc.desc    Columns mail lookup for type 2 probe 455
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling455', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit455') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0456
     * @tc.name    ColumnsEventHandling456
     * @tc.desc    Columns mail lookup for type 0 probe 456
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling456', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit456') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0457
     * @tc.name    ColumnsEventHandling457
     * @tc.desc    Columns mail lookup for type 1 probe 457
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling457', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit457') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0458
     * @tc.name    ColumnsEventHandling458
     * @tc.desc    Columns mail lookup for type 2 probe 458
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling458', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit458') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0459
     * @tc.name    ColumnsEventHandling459
     * @tc.desc    Columns mail lookup for type 0 probe 459
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling459', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit459') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0460
     * @tc.name    ColumnsEventHandling460
     * @tc.desc    Columns mail lookup for type 1 probe 460
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling460', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit460') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0461
     * @tc.name    ColumnsEventHandling461
     * @tc.desc    Columns mail lookup for type 2 probe 461
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling461', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit461') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0462
     * @tc.name    ColumnsEventHandling462
     * @tc.desc    Columns mail lookup for type 0 probe 462
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling462', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit462') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0463
     * @tc.name    ColumnsEventHandling463
     * @tc.desc    Columns mail lookup for type 1 probe 463
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling463', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit463') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0464
     * @tc.name    ColumnsEventHandling464
     * @tc.desc    Columns mail lookup for type 2 probe 464
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling464', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit464') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0465
     * @tc.name    ColumnsEventHandling465
     * @tc.desc    Columns mail lookup for type 0 probe 465
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling465', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit465') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0466
     * @tc.name    ColumnsEventHandling466
     * @tc.desc    Columns mail lookup for type 1 probe 466
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling466', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit466') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0467
     * @tc.name    ColumnsEventHandling467
     * @tc.desc    Columns mail lookup for type 2 probe 467
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling467', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit467') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0468
     * @tc.name    ColumnsEventHandling468
     * @tc.desc    Columns mail lookup for type 0 probe 468
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling468', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit468') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0469
     * @tc.name    ColumnsEventHandling469
     * @tc.desc    Columns mail lookup for type 1 probe 469
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling469', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit469') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0470
     * @tc.name    ColumnsEventHandling470
     * @tc.desc    Columns mail lookup for type 2 probe 470
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling470', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit470') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0471
     * @tc.name    ColumnsEventHandling471
     * @tc.desc    Columns mail lookup for type 0 probe 471
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling471', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit471') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0472
     * @tc.name    ColumnsEventHandling472
     * @tc.desc    Columns mail lookup for type 1 probe 472
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling472', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit472') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0473
     * @tc.name    ColumnsEventHandling473
     * @tc.desc    Columns mail lookup for type 2 probe 473
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling473', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit473') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0474
     * @tc.name    ColumnsEventHandling474
     * @tc.desc    Columns mail lookup for type 0 probe 474
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling474', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit474') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0475
     * @tc.name    ColumnsEventHandling475
     * @tc.desc    Columns mail lookup for type 1 probe 475
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling475', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit475') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0476
     * @tc.name    ColumnsEventHandling476
     * @tc.desc    Columns mail lookup for type 2 probe 476
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling476', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit476') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0477
     * @tc.name    ColumnsEventHandling477
     * @tc.desc    Columns mail lookup for type 0 probe 477
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling477', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit477') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0478
     * @tc.name    ColumnsEventHandling478
     * @tc.desc    Columns mail lookup for type 1 probe 478
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling478', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit478') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0479
     * @tc.name    ColumnsEventHandling479
     * @tc.desc    Columns mail lookup for type 2 probe 479
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling479', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit479') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0480
     * @tc.name    ColumnsEventHandling480
     * @tc.desc    Columns mail lookup for type 0 probe 480
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling480', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit480') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0481
     * @tc.name    ColumnsEventHandling481
     * @tc.desc    Columns mail lookup for type 1 probe 481
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling481', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit481') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0482
     * @tc.name    ColumnsEventHandling482
     * @tc.desc    Columns mail lookup for type 2 probe 482
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling482', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit482') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0483
     * @tc.name    ColumnsEventHandling483
     * @tc.desc    Columns mail lookup for type 0 probe 483
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling483', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit483') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0484
     * @tc.name    ColumnsEventHandling484
     * @tc.desc    Columns mail lookup for type 1 probe 484
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling484', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit484') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
