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
import { NavBarModel } from '../Shared/NavBarModel';
import { NAV_SUB_COUNTS } from '../Shared/NavBarModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[NavAppTests]';

export default function navAppResourceLoaderValidationSuite() {
  describe('NavAppResourceLoaderValidationSuite', () => {
    let m: NavBarModel = new NavBarModel();

    beforeEach(() => {
      m = new NavBarModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1272
     * @tc.name    NavAppResourceLoaderValidation1272
     * @tc.desc    NavBar index validity for 0 probe 1272
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1272', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1272) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1273
     * @tc.name    NavAppResourceLoaderValidation1273
     * @tc.desc    NavBar index validity for 1 probe 1273
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1273', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1273) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1274
     * @tc.name    NavAppResourceLoaderValidation1274
     * @tc.desc    NavBar index validity for 2 probe 1274
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1274', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1274) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1275
     * @tc.name    NavAppResourceLoaderValidation1275
     * @tc.desc    NavBar index validity for 3 probe 1275
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1275', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1275) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1276
     * @tc.name    NavAppResourceLoaderValidation1276
     * @tc.desc    NavBar index validity for 4 probe 1276
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1276', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1276) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1277
     * @tc.name    NavAppResourceLoaderValidation1277
     * @tc.desc    NavBar index validity for 5 probe 1277
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1277', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1277) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1278
     * @tc.name    NavAppResourceLoaderValidation1278
     * @tc.desc    NavBar index validity for 6 probe 1278
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1278', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1278) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1279
     * @tc.name    NavAppResourceLoaderValidation1279
     * @tc.desc    NavBar index validity for 7 probe 1279
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1279', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1279) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1280
     * @tc.name    NavAppResourceLoaderValidation1280
     * @tc.desc    NavBar index validity for 0 probe 1280
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1280', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1280) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1281
     * @tc.name    NavAppResourceLoaderValidation1281
     * @tc.desc    NavBar index validity for 1 probe 1281
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1281', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1281) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1282
     * @tc.name    NavAppResourceLoaderValidation1282
     * @tc.desc    NavBar index validity for 2 probe 1282
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1282', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1282) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1283
     * @tc.name    NavAppResourceLoaderValidation1283
     * @tc.desc    NavBar index validity for 3 probe 1283
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1283', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1283) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1284
     * @tc.name    NavAppResourceLoaderValidation1284
     * @tc.desc    NavBar index validity for 4 probe 1284
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1284', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1284) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1285
     * @tc.name    NavAppResourceLoaderValidation1285
     * @tc.desc    NavBar index validity for 5 probe 1285
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1285', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1285) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1286
     * @tc.name    NavAppResourceLoaderValidation1286
     * @tc.desc    NavBar index validity for 6 probe 1286
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1286', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1286) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1287
     * @tc.name    NavAppResourceLoaderValidation1287
     * @tc.desc    NavBar index validity for 7 probe 1287
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1287', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1287) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1288
     * @tc.name    NavAppResourceLoaderValidation1288
     * @tc.desc    NavBar index validity for 0 probe 1288
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1288', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1288) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1289
     * @tc.name    NavAppResourceLoaderValidation1289
     * @tc.desc    NavBar index validity for 1 probe 1289
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1289', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1289) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1290
     * @tc.name    NavAppResourceLoaderValidation1290
     * @tc.desc    NavBar index validity for 2 probe 1290
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1290', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1290) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1291
     * @tc.name    NavAppResourceLoaderValidation1291
     * @tc.desc    NavBar index validity for 3 probe 1291
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1291', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1291) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1292
     * @tc.name    NavAppResourceLoaderValidation1292
     * @tc.desc    NavBar index validity for 4 probe 1292
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1292', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1292) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1293
     * @tc.name    NavAppResourceLoaderValidation1293
     * @tc.desc    NavBar index validity for 5 probe 1293
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1293', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1293) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1294
     * @tc.name    NavAppResourceLoaderValidation1294
     * @tc.desc    NavBar index validity for 6 probe 1294
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1294', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1294) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1295
     * @tc.name    NavAppResourceLoaderValidation1295
     * @tc.desc    NavBar index validity for 7 probe 1295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1295', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1295) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1296
     * @tc.name    NavAppResourceLoaderValidation1296
     * @tc.desc    NavBar index validity for 0 probe 1296
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1296', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1296) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1297
     * @tc.name    NavAppResourceLoaderValidation1297
     * @tc.desc    NavBar index validity for 1 probe 1297
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1297', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1297) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1298
     * @tc.name    NavAppResourceLoaderValidation1298
     * @tc.desc    NavBar index validity for 2 probe 1298
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1298', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1298) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1299
     * @tc.name    NavAppResourceLoaderValidation1299
     * @tc.desc    NavBar index validity for 3 probe 1299
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1299', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1299) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1300
     * @tc.name    NavAppResourceLoaderValidation1300
     * @tc.desc    NavBar index validity for 4 probe 1300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1300', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1300) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1301
     * @tc.name    NavAppResourceLoaderValidation1301
     * @tc.desc    NavBar index validity for 5 probe 1301
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1301', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1301) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1302
     * @tc.name    NavAppResourceLoaderValidation1302
     * @tc.desc    NavBar index validity for 6 probe 1302
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1302', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1302) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1303
     * @tc.name    NavAppResourceLoaderValidation1303
     * @tc.desc    NavBar index validity for 7 probe 1303
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1303', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1303) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1304
     * @tc.name    NavAppResourceLoaderValidation1304
     * @tc.desc    NavBar index validity for 0 probe 1304
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1304', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1304) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1305
     * @tc.name    NavAppResourceLoaderValidation1305
     * @tc.desc    NavBar index validity for 1 probe 1305
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1305', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1305) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1306
     * @tc.name    NavAppResourceLoaderValidation1306
     * @tc.desc    NavBar index validity for 2 probe 1306
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1306', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1306) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1307
     * @tc.name    NavAppResourceLoaderValidation1307
     * @tc.desc    NavBar index validity for 3 probe 1307
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1307', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1307) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1308
     * @tc.name    NavAppResourceLoaderValidation1308
     * @tc.desc    NavBar index validity for 4 probe 1308
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1308', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1308) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1309
     * @tc.name    NavAppResourceLoaderValidation1309
     * @tc.desc    NavBar index validity for 5 probe 1309
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1309', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1309) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1310
     * @tc.name    NavAppResourceLoaderValidation1310
     * @tc.desc    NavBar index validity for 6 probe 1310
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1310', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1310) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1311
     * @tc.name    NavAppResourceLoaderValidation1311
     * @tc.desc    NavBar index validity for 7 probe 1311
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1311', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1311) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1312
     * @tc.name    NavAppResourceLoaderValidation1312
     * @tc.desc    NavBar index validity for 0 probe 1312
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1312', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1312) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1313
     * @tc.name    NavAppResourceLoaderValidation1313
     * @tc.desc    NavBar index validity for 1 probe 1313
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1313', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1313) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1314
     * @tc.name    NavAppResourceLoaderValidation1314
     * @tc.desc    NavBar index validity for 2 probe 1314
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1314', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1314) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1315
     * @tc.name    NavAppResourceLoaderValidation1315
     * @tc.desc    NavBar index validity for 3 probe 1315
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1315', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1315) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1316
     * @tc.name    NavAppResourceLoaderValidation1316
     * @tc.desc    NavBar index validity for 4 probe 1316
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1316', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1316) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1317
     * @tc.name    NavAppResourceLoaderValidation1317
     * @tc.desc    NavBar index validity for 5 probe 1317
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1317', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1317) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1318
     * @tc.name    NavAppResourceLoaderValidation1318
     * @tc.desc    NavBar index validity for 6 probe 1318
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1318', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1318) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1319
     * @tc.name    NavAppResourceLoaderValidation1319
     * @tc.desc    NavBar index validity for 7 probe 1319
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1319', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1319) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1320
     * @tc.name    NavAppResourceLoaderValidation1320
     * @tc.desc    NavBar index validity for 0 probe 1320
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1320', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1320) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1321
     * @tc.name    NavAppResourceLoaderValidation1321
     * @tc.desc    NavBar index validity for 1 probe 1321
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1321', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1321) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1322
     * @tc.name    NavAppResourceLoaderValidation1322
     * @tc.desc    NavBar index validity for 2 probe 1322
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1322', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1322) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1323
     * @tc.name    NavAppResourceLoaderValidation1323
     * @tc.desc    NavBar index validity for 3 probe 1323
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1323', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1323) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1324
     * @tc.name    NavAppResourceLoaderValidation1324
     * @tc.desc    NavBar index validity for 4 probe 1324
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1324', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1324) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1325
     * @tc.name    NavAppResourceLoaderValidation1325
     * @tc.desc    NavBar index validity for 5 probe 1325
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1325', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1325) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1326
     * @tc.name    NavAppResourceLoaderValidation1326
     * @tc.desc    NavBar index validity for 6 probe 1326
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1326', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1326) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1327
     * @tc.name    NavAppResourceLoaderValidation1327
     * @tc.desc    NavBar index validity for 7 probe 1327
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1327', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1327) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1328
     * @tc.name    NavAppResourceLoaderValidation1328
     * @tc.desc    NavBar index validity for 0 probe 1328
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1328', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1328) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1329
     * @tc.name    NavAppResourceLoaderValidation1329
     * @tc.desc    NavBar index validity for 1 probe 1329
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1329', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1329) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1330
     * @tc.name    NavAppResourceLoaderValidation1330
     * @tc.desc    NavBar index validity for 2 probe 1330
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1330', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1330) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1331
     * @tc.name    NavAppResourceLoaderValidation1331
     * @tc.desc    NavBar index validity for 3 probe 1331
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1331', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1331) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1332
     * @tc.name    NavAppResourceLoaderValidation1332
     * @tc.desc    NavBar index validity for 4 probe 1332
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1332', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1332) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1333
     * @tc.name    NavAppResourceLoaderValidation1333
     * @tc.desc    NavBar index validity for 5 probe 1333
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1333', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1333) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1334
     * @tc.name    NavAppResourceLoaderValidation1334
     * @tc.desc    NavBar index validity for 6 probe 1334
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1334', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1334) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1335
     * @tc.name    NavAppResourceLoaderValidation1335
     * @tc.desc    NavBar index validity for 7 probe 1335
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1335', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1335) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1336
     * @tc.name    NavAppResourceLoaderValidation1336
     * @tc.desc    NavBar index validity for 0 probe 1336
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1336', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1336) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1337
     * @tc.name    NavAppResourceLoaderValidation1337
     * @tc.desc    NavBar index validity for 1 probe 1337
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1337', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1337) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1338
     * @tc.name    NavAppResourceLoaderValidation1338
     * @tc.desc    NavBar index validity for 2 probe 1338
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1338', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1338) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1339
     * @tc.name    NavAppResourceLoaderValidation1339
     * @tc.desc    NavBar index validity for 3 probe 1339
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1339', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1339) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1340
     * @tc.name    NavAppResourceLoaderValidation1340
     * @tc.desc    NavBar index validity for 4 probe 1340
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1340', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1340) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1341
     * @tc.name    NavAppResourceLoaderValidation1341
     * @tc.desc    NavBar index validity for 5 probe 1341
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1341', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1341) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1342
     * @tc.name    NavAppResourceLoaderValidation1342
     * @tc.desc    NavBar index validity for 6 probe 1342
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1342', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1342) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1343
     * @tc.name    NavAppResourceLoaderValidation1343
     * @tc.desc    NavBar index validity for 7 probe 1343
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1343', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1343) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1344
     * @tc.name    NavAppResourceLoaderValidation1344
     * @tc.desc    NavBar index validity for 0 probe 1344
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1344', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1344) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1345
     * @tc.name    NavAppResourceLoaderValidation1345
     * @tc.desc    NavBar index validity for 1 probe 1345
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1345', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1345) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1346
     * @tc.name    NavAppResourceLoaderValidation1346
     * @tc.desc    NavBar index validity for 2 probe 1346
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1346', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1346) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1347
     * @tc.name    NavAppResourceLoaderValidation1347
     * @tc.desc    NavBar index validity for 3 probe 1347
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1347', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1347) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1348
     * @tc.name    NavAppResourceLoaderValidation1348
     * @tc.desc    NavBar index validity for 4 probe 1348
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1348', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1348) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1349
     * @tc.name    NavAppResourceLoaderValidation1349
     * @tc.desc    NavBar index validity for 5 probe 1349
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1349', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1349) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1350
     * @tc.name    NavAppResourceLoaderValidation1350
     * @tc.desc    NavBar index validity for 6 probe 1350
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1350', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1350) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1351
     * @tc.name    NavAppResourceLoaderValidation1351
     * @tc.desc    NavBar index validity for 7 probe 1351
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1351', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1351) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1352
     * @tc.name    NavAppResourceLoaderValidation1352
     * @tc.desc    NavBar index validity for 0 probe 1352
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1352', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1352) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1353
     * @tc.name    NavAppResourceLoaderValidation1353
     * @tc.desc    NavBar index validity for 1 probe 1353
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1353', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1353) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1354
     * @tc.name    NavAppResourceLoaderValidation1354
     * @tc.desc    NavBar index validity for 2 probe 1354
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1354', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1354) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1355
     * @tc.name    NavAppResourceLoaderValidation1355
     * @tc.desc    NavBar index validity for 3 probe 1355
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1355', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1355) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1356
     * @tc.name    NavAppResourceLoaderValidation1356
     * @tc.desc    NavBar index validity for 4 probe 1356
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1356', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1356) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1357
     * @tc.name    NavAppResourceLoaderValidation1357
     * @tc.desc    NavBar index validity for 5 probe 1357
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1357', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1357) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1358
     * @tc.name    NavAppResourceLoaderValidation1358
     * @tc.desc    NavBar index validity for 6 probe 1358
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1358', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1358) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1359
     * @tc.name    NavAppResourceLoaderValidation1359
     * @tc.desc    NavBar index validity for 7 probe 1359
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1359', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1359) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1360
     * @tc.name    NavAppResourceLoaderValidation1360
     * @tc.desc    NavBar index validity for 0 probe 1360
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1360', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1360) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1361
     * @tc.name    NavAppResourceLoaderValidation1361
     * @tc.desc    NavBar index validity for 1 probe 1361
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1361', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1361) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1362
     * @tc.name    NavAppResourceLoaderValidation1362
     * @tc.desc    NavBar index validity for 2 probe 1362
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1362', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1362) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1363
     * @tc.name    NavAppResourceLoaderValidation1363
     * @tc.desc    NavBar index validity for 3 probe 1363
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1363', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1363) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1364
     * @tc.name    NavAppResourceLoaderValidation1364
     * @tc.desc    NavBar index validity for 4 probe 1364
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1364', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1364) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1365
     * @tc.name    NavAppResourceLoaderValidation1365
     * @tc.desc    NavBar index validity for 5 probe 1365
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1365', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1365) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1366
     * @tc.name    NavAppResourceLoaderValidation1366
     * @tc.desc    NavBar index validity for 6 probe 1366
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1366', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1366) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1367
     * @tc.name    NavAppResourceLoaderValidation1367
     * @tc.desc    NavBar index validity for 7 probe 1367
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1367', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1367) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1368
     * @tc.name    NavAppResourceLoaderValidation1368
     * @tc.desc    NavBar index validity for 0 probe 1368
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1368', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1368) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1369
     * @tc.name    NavAppResourceLoaderValidation1369
     * @tc.desc    NavBar index validity for 1 probe 1369
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1369', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1369) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1370
     * @tc.name    NavAppResourceLoaderValidation1370
     * @tc.desc    NavBar index validity for 2 probe 1370
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1370', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1370) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1371
     * @tc.name    NavAppResourceLoaderValidation1371
     * @tc.desc    NavBar index validity for 3 probe 1371
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1371', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1371) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1372
     * @tc.name    NavAppResourceLoaderValidation1372
     * @tc.desc    NavBar index validity for 4 probe 1372
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1372', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1372) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1373
     * @tc.name    NavAppResourceLoaderValidation1373
     * @tc.desc    NavBar index validity for 5 probe 1373
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1373', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1373) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1374
     * @tc.name    NavAppResourceLoaderValidation1374
     * @tc.desc    NavBar index validity for 6 probe 1374
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1374', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1374) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1375
     * @tc.name    NavAppResourceLoaderValidation1375
     * @tc.desc    NavBar index validity for 7 probe 1375
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1375', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1375) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1376
     * @tc.name    NavAppResourceLoaderValidation1376
     * @tc.desc    NavBar index validity for 0 probe 1376
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1376', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1376) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1377
     * @tc.name    NavAppResourceLoaderValidation1377
     * @tc.desc    NavBar index validity for 1 probe 1377
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1377', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1377) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1378
     * @tc.name    NavAppResourceLoaderValidation1378
     * @tc.desc    NavBar index validity for 2 probe 1378
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1378', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1378) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1379
     * @tc.name    NavAppResourceLoaderValidation1379
     * @tc.desc    NavBar index validity for 3 probe 1379
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1379', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1379) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1380
     * @tc.name    NavAppResourceLoaderValidation1380
     * @tc.desc    NavBar index validity for 4 probe 1380
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppResourceLoaderValidation1380', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 1380) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

