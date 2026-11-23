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

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0485
     * @tc.name    ColumnsEventHandling485
     * @tc.desc    Columns mail lookup for type 2 probe 485
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling485', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit485') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0486
     * @tc.name    ColumnsEventHandling486
     * @tc.desc    Columns mail lookup for type 0 probe 486
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling486', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit486') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0487
     * @tc.name    ColumnsEventHandling487
     * @tc.desc    Columns mail lookup for type 1 probe 487
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling487', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit487') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0488
     * @tc.name    ColumnsEventHandling488
     * @tc.desc    Columns mail lookup for type 2 probe 488
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling488', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit488') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0489
     * @tc.name    ColumnsEventHandling489
     * @tc.desc    Columns mail lookup for type 0 probe 489
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling489', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit489') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0490
     * @tc.name    ColumnsEventHandling490
     * @tc.desc    Columns mail lookup for type 1 probe 490
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling490', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit490') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0491
     * @tc.name    ColumnsEventHandling491
     * @tc.desc    Columns mail lookup for type 2 probe 491
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling491', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit491') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0492
     * @tc.name    ColumnsEventHandling492
     * @tc.desc    Columns mail lookup for type 0 probe 492
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling492', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit492') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0493
     * @tc.name    ColumnsEventHandling493
     * @tc.desc    Columns mail lookup for type 1 probe 493
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling493', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit493') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0494
     * @tc.name    ColumnsEventHandling494
     * @tc.desc    Columns mail lookup for type 2 probe 494
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling494', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit494') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0495
     * @tc.name    ColumnsEventHandling495
     * @tc.desc    Columns mail lookup for type 0 probe 495
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling495', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit495') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0496
     * @tc.name    ColumnsEventHandling496
     * @tc.desc    Columns mail lookup for type 1 probe 496
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling496', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit496') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0497
     * @tc.name    ColumnsEventHandling497
     * @tc.desc    Columns mail lookup for type 2 probe 497
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling497', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit497') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0498
     * @tc.name    ColumnsEventHandling498
     * @tc.desc    Columns mail lookup for type 0 probe 498
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling498', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit498') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0499
     * @tc.name    ColumnsEventHandling499
     * @tc.desc    Columns mail lookup for type 1 probe 499
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling499', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit499') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0500
     * @tc.name    ColumnsEventHandling500
     * @tc.desc    Columns mail lookup for type 2 probe 500
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling500', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit500') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0501
     * @tc.name    ColumnsEventHandling501
     * @tc.desc    Columns mail lookup for type 0 probe 501
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling501', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit501') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0502
     * @tc.name    ColumnsEventHandling502
     * @tc.desc    Columns mail lookup for type 1 probe 502
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling502', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit502') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0503
     * @tc.name    ColumnsEventHandling503
     * @tc.desc    Columns mail lookup for type 2 probe 503
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling503', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit503') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0504
     * @tc.name    ColumnsEventHandling504
     * @tc.desc    Columns mail lookup for type 0 probe 504
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling504', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit504') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0505
     * @tc.name    ColumnsEventHandling505
     * @tc.desc    Columns mail lookup for type 1 probe 505
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling505', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit505') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0506
     * @tc.name    ColumnsEventHandling506
     * @tc.desc    Columns mail lookup for type 2 probe 506
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling506', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit506') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0507
     * @tc.name    ColumnsEventHandling507
     * @tc.desc    Columns mail lookup for type 0 probe 507
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling507', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit507') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0508
     * @tc.name    ColumnsEventHandling508
     * @tc.desc    Columns mail lookup for type 1 probe 508
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling508', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit508') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0509
     * @tc.name    ColumnsEventHandling509
     * @tc.desc    Columns mail lookup for type 2 probe 509
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling509', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit509') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0510
     * @tc.name    ColumnsEventHandling510
     * @tc.desc    Columns mail lookup for type 0 probe 510
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling510', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit510') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0511
     * @tc.name    ColumnsEventHandling511
     * @tc.desc    Columns mail lookup for type 1 probe 511
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling511', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit511') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0512
     * @tc.name    ColumnsEventHandling512
     * @tc.desc    Columns mail lookup for type 2 probe 512
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling512', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit512') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0513
     * @tc.name    ColumnsEventHandling513
     * @tc.desc    Columns mail lookup for type 0 probe 513
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling513', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit513') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0514
     * @tc.name    ColumnsEventHandling514
     * @tc.desc    Columns mail lookup for type 1 probe 514
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling514', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit514') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0515
     * @tc.name    ColumnsEventHandling515
     * @tc.desc    Columns mail lookup for type 2 probe 515
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling515', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit515') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0516
     * @tc.name    ColumnsEventHandling516
     * @tc.desc    Columns mail lookup for type 0 probe 516
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling516', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit516') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0517
     * @tc.name    ColumnsEventHandling517
     * @tc.desc    Columns mail lookup for type 1 probe 517
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling517', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit517') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0518
     * @tc.name    ColumnsEventHandling518
     * @tc.desc    Columns mail lookup for type 2 probe 518
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling518', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit518') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0519
     * @tc.name    ColumnsEventHandling519
     * @tc.desc    Columns mail lookup for type 0 probe 519
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling519', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit519') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0520
     * @tc.name    ColumnsEventHandling520
     * @tc.desc    Columns mail lookup for type 1 probe 520
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling520', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit520') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0521
     * @tc.name    ColumnsEventHandling521
     * @tc.desc    Columns mail lookup for type 2 probe 521
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling521', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit521') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0522
     * @tc.name    ColumnsEventHandling522
     * @tc.desc    Columns mail lookup for type 0 probe 522
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling522', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit522') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0523
     * @tc.name    ColumnsEventHandling523
     * @tc.desc    Columns mail lookup for type 1 probe 523
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling523', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit523') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0524
     * @tc.name    ColumnsEventHandling524
     * @tc.desc    Columns mail lookup for type 2 probe 524
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling524', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit524') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0525
     * @tc.name    ColumnsEventHandling525
     * @tc.desc    Columns mail lookup for type 0 probe 525
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling525', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit525') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0526
     * @tc.name    ColumnsEventHandling526
     * @tc.desc    Columns mail lookup for type 1 probe 526
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling526', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit526') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0527
     * @tc.name    ColumnsEventHandling527
     * @tc.desc    Columns mail lookup for type 2 probe 527
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling527', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit527') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0528
     * @tc.name    ColumnsEventHandling528
     * @tc.desc    Columns mail lookup for type 0 probe 528
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling528', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit528') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0529
     * @tc.name    ColumnsEventHandling529
     * @tc.desc    Columns mail lookup for type 1 probe 529
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling529', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit529') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0530
     * @tc.name    ColumnsEventHandling530
     * @tc.desc    Columns mail lookup for type 2 probe 530
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling530', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit530') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0531
     * @tc.name    ColumnsEventHandling531
     * @tc.desc    Columns mail lookup for type 0 probe 531
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling531', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit531') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0532
     * @tc.name    ColumnsEventHandling532
     * @tc.desc    Columns mail lookup for type 1 probe 532
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling532', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit532') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0533
     * @tc.name    ColumnsEventHandling533
     * @tc.desc    Columns mail lookup for type 2 probe 533
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling533', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit533') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0534
     * @tc.name    ColumnsEventHandling534
     * @tc.desc    Columns mail lookup for type 0 probe 534
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling534', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit534') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0535
     * @tc.name    ColumnsEventHandling535
     * @tc.desc    Columns mail lookup for type 1 probe 535
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling535', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit535') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0536
     * @tc.name    ColumnsEventHandling536
     * @tc.desc    Columns mail lookup for type 2 probe 536
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling536', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit536') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0537
     * @tc.name    ColumnsEventHandling537
     * @tc.desc    Columns mail lookup for type 0 probe 537
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling537', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit537') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0538
     * @tc.name    ColumnsEventHandling538
     * @tc.desc    Columns mail lookup for type 1 probe 538
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling538', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit538') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0539
     * @tc.name    ColumnsEventHandling539
     * @tc.desc    Columns mail lookup for type 2 probe 539
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling539', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit539') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0540
     * @tc.name    ColumnsEventHandling540
     * @tc.desc    Columns mail lookup for type 0 probe 540
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling540', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit540') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0541
     * @tc.name    ColumnsEventHandling541
     * @tc.desc    Columns mail lookup for type 1 probe 541
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling541', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit541') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0542
     * @tc.name    ColumnsEventHandling542
     * @tc.desc    Columns mail lookup for type 2 probe 542
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling542', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit542') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0543
     * @tc.name    ColumnsEventHandling543
     * @tc.desc    Columns mail lookup for type 0 probe 543
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling543', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit543') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0544
     * @tc.name    ColumnsEventHandling544
     * @tc.desc    Columns mail lookup for type 1 probe 544
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling544', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit544') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0545
     * @tc.name    ColumnsEventHandling545
     * @tc.desc    Columns mail lookup for type 2 probe 545
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling545', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit545') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0546
     * @tc.name    ColumnsEventHandling546
     * @tc.desc    Columns mail lookup for type 0 probe 546
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling546', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit546') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0547
     * @tc.name    ColumnsEventHandling547
     * @tc.desc    Columns mail lookup for type 1 probe 547
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling547', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit547') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0548
     * @tc.name    ColumnsEventHandling548
     * @tc.desc    Columns mail lookup for type 2 probe 548
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling548', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit548') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0549
     * @tc.name    ColumnsEventHandling549
     * @tc.desc    Columns mail lookup for type 0 probe 549
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling549', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit549') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0550
     * @tc.name    ColumnsEventHandling550
     * @tc.desc    Columns mail lookup for type 1 probe 550
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling550', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit550') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0551
     * @tc.name    ColumnsEventHandling551
     * @tc.desc    Columns mail lookup for type 2 probe 551
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling551', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit551') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0552
     * @tc.name    ColumnsEventHandling552
     * @tc.desc    Columns mail lookup for type 0 probe 552
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling552', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit552') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0553
     * @tc.name    ColumnsEventHandling553
     * @tc.desc    Columns mail lookup for type 1 probe 553
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling553', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit553') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0554
     * @tc.name    ColumnsEventHandling554
     * @tc.desc    Columns mail lookup for type 2 probe 554
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling554', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit554') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0555
     * @tc.name    ColumnsEventHandling555
     * @tc.desc    Columns mail lookup for type 0 probe 555
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling555', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit555') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0556
     * @tc.name    ColumnsEventHandling556
     * @tc.desc    Columns mail lookup for type 1 probe 556
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling556', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit556') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0557
     * @tc.name    ColumnsEventHandling557
     * @tc.desc    Columns mail lookup for type 2 probe 557
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling557', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit557') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0558
     * @tc.name    ColumnsEventHandling558
     * @tc.desc    Columns mail lookup for type 0 probe 558
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling558', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit558') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0559
     * @tc.name    ColumnsEventHandling559
     * @tc.desc    Columns mail lookup for type 1 probe 559
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling559', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit559') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0560
     * @tc.name    ColumnsEventHandling560
     * @tc.desc    Columns mail lookup for type 2 probe 560
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling560', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit560') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0561
     * @tc.name    ColumnsEventHandling561
     * @tc.desc    Columns mail lookup for type 0 probe 561
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling561', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit561') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0562
     * @tc.name    ColumnsEventHandling562
     * @tc.desc    Columns mail lookup for type 1 probe 562
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling562', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit562') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0563
     * @tc.name    ColumnsEventHandling563
     * @tc.desc    Columns mail lookup for type 2 probe 563
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling563', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit563') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0564
     * @tc.name    ColumnsEventHandling564
     * @tc.desc    Columns mail lookup for type 0 probe 564
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling564', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit564') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0565
     * @tc.name    ColumnsEventHandling565
     * @tc.desc    Columns mail lookup for type 1 probe 565
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling565', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit565') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0566
     * @tc.name    ColumnsEventHandling566
     * @tc.desc    Columns mail lookup for type 2 probe 566
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling566', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit566') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0567
     * @tc.name    ColumnsEventHandling567
     * @tc.desc    Columns mail lookup for type 0 probe 567
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling567', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit567') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0568
     * @tc.name    ColumnsEventHandling568
     * @tc.desc    Columns mail lookup for type 1 probe 568
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling568', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit568') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0569
     * @tc.name    ColumnsEventHandling569
     * @tc.desc    Columns mail lookup for type 2 probe 569
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling569', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit569') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0570
     * @tc.name    ColumnsEventHandling570
     * @tc.desc    Columns mail lookup for type 0 probe 570
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling570', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit570') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0571
     * @tc.name    ColumnsEventHandling571
     * @tc.desc    Columns mail lookup for type 1 probe 571
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling571', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit571') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0572
     * @tc.name    ColumnsEventHandling572
     * @tc.desc    Columns mail lookup for type 2 probe 572
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling572', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit572') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0573
     * @tc.name    ColumnsEventHandling573
     * @tc.desc    Columns mail lookup for type 0 probe 573
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling573', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit573') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0574
     * @tc.name    ColumnsEventHandling574
     * @tc.desc    Columns mail lookup for type 1 probe 574
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling574', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit574') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0575
     * @tc.name    ColumnsEventHandling575
     * @tc.desc    Columns mail lookup for type 2 probe 575
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling575', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit575') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0576
     * @tc.name    ColumnsEventHandling576
     * @tc.desc    Columns mail lookup for type 0 probe 576
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling576', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit576') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0577
     * @tc.name    ColumnsEventHandling577
     * @tc.desc    Columns mail lookup for type 1 probe 577
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling577', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit577') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0578
     * @tc.name    ColumnsEventHandling578
     * @tc.desc    Columns mail lookup for type 2 probe 578
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling578', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit578') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0579
     * @tc.name    ColumnsEventHandling579
     * @tc.desc    Columns mail lookup for type 0 probe 579
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling579', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit579') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0580
     * @tc.name    ColumnsEventHandling580
     * @tc.desc    Columns mail lookup for type 1 probe 580
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling580', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit580') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0581
     * @tc.name    ColumnsEventHandling581
     * @tc.desc    Columns mail lookup for type 2 probe 581
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling581', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit581') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0582
     * @tc.name    ColumnsEventHandling582
     * @tc.desc    Columns mail lookup for type 0 probe 582
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling582', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[0];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit582') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0583
     * @tc.name    ColumnsEventHandling583
     * @tc.desc    Columns mail lookup for type 1 probe 583
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling583', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[1];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit583') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0584
     * @tc.name    ColumnsEventHandling584
     * @tc.desc    Columns mail lookup for type 2 probe 584
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsEventHandling584', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const mails = m.getMails();
      const item = mails[2];
      expect(m.getMailByType(item.type) !== undefined).assertEqual(true);
      expect(m.getMailByType('nohit584') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

