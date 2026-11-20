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
import { MusicModel } from '../Shared/MusicModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[MusicTests]';

export default function musicCompatibilitySuite() {
  describe('MusicCompatibilitySuite', () => {
    let m: MusicModel = new MusicModel();

    beforeEach(() => {
      m = new MusicModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0327
     * @tc.name    MusicCompatibility327
     * @tc.desc    Music title uniqueness probe 327 probe 327
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility327', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing327')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 327) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0328
     * @tc.name    MusicCompatibility328
     * @tc.desc    Music title uniqueness probe 328 probe 328
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility328', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing328')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 328) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0329
     * @tc.name    MusicCompatibility329
     * @tc.desc    Music title uniqueness probe 329 probe 329
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility329', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing329')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 329) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0330
     * @tc.name    MusicCompatibility330
     * @tc.desc    Music title uniqueness probe 330 probe 330
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility330', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing330')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 330) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0331
     * @tc.name    MusicCompatibility331
     * @tc.desc    Music title uniqueness probe 331 probe 331
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility331', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing331')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 331) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0332
     * @tc.name    MusicCompatibility332
     * @tc.desc    Music title uniqueness probe 332 probe 332
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility332', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing332')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 332) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0333
     * @tc.name    MusicCompatibility333
     * @tc.desc    Music title uniqueness probe 333 probe 333
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility333', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing333')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 333) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0334
     * @tc.name    MusicCompatibility334
     * @tc.desc    Music title uniqueness probe 334 probe 334
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility334', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing334')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 334) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0335
     * @tc.name    MusicCompatibility335
     * @tc.desc    Music title uniqueness probe 335 probe 335
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility335', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing335')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 335) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0336
     * @tc.name    MusicCompatibility336
     * @tc.desc    Music title uniqueness probe 336 probe 336
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility336', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing336')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 336) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0337
     * @tc.name    MusicCompatibility337
     * @tc.desc    Music title uniqueness probe 337 probe 337
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility337', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing337')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 337) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0338
     * @tc.name    MusicCompatibility338
     * @tc.desc    Music title uniqueness probe 338 probe 338
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility338', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing338')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 338) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0339
     * @tc.name    MusicCompatibility339
     * @tc.desc    Music title uniqueness probe 339 probe 339
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility339', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing339')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 339) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0340
     * @tc.name    MusicCompatibility340
     * @tc.desc    Music title uniqueness probe 340 probe 340
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility340', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing340')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 340) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0341
     * @tc.name    MusicCompatibility341
     * @tc.desc    Music title uniqueness probe 341 probe 341
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility341', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing341')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 341) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0342
     * @tc.name    MusicCompatibility342
     * @tc.desc    Music title uniqueness probe 342 probe 342
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility342', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing342')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 342) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0343
     * @tc.name    MusicCompatibility343
     * @tc.desc    Music title uniqueness probe 343 probe 343
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility343', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing343')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 343) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0344
     * @tc.name    MusicCompatibility344
     * @tc.desc    Music title uniqueness probe 344 probe 344
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility344', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing344')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 344) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0345
     * @tc.name    MusicCompatibility345
     * @tc.desc    Music title uniqueness probe 345 probe 345
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility345', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing345')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 345) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0346
     * @tc.name    MusicCompatibility346
     * @tc.desc    Music title uniqueness probe 346 probe 346
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility346', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing346')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 346) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0347
     * @tc.name    MusicCompatibility347
     * @tc.desc    Music title uniqueness probe 347 probe 347
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility347', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing347')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 347) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0348
     * @tc.name    MusicCompatibility348
     * @tc.desc    Music title uniqueness probe 348 probe 348
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility348', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing348')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 348) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0349
     * @tc.name    MusicCompatibility349
     * @tc.desc    Music title uniqueness probe 349 probe 349
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility349', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing349')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 349) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0350
     * @tc.name    MusicCompatibility350
     * @tc.desc    Music title uniqueness probe 350 probe 350
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility350', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing350')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 350) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0351
     * @tc.name    MusicCompatibility351
     * @tc.desc    Music title uniqueness probe 351 probe 351
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility351', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing351')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 351) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0352
     * @tc.name    MusicCompatibility352
     * @tc.desc    Music title uniqueness probe 352 probe 352
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility352', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing352')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 352) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0353
     * @tc.name    MusicCompatibility353
     * @tc.desc    Music title uniqueness probe 353 probe 353
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility353', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing353')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 353) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0354
     * @tc.name    MusicCompatibility354
     * @tc.desc    Music title uniqueness probe 354 probe 354
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility354', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing354')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 354) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0355
     * @tc.name    MusicCompatibility355
     * @tc.desc    Music title uniqueness probe 355 probe 355
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility355', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing355')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 355) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0356
     * @tc.name    MusicCompatibility356
     * @tc.desc    Music title uniqueness probe 356 probe 356
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility356', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing356')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 356) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0357
     * @tc.name    MusicCompatibility357
     * @tc.desc    Music title uniqueness probe 357 probe 357
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility357', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing357')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 357) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0358
     * @tc.name    MusicCompatibility358
     * @tc.desc    Music title uniqueness probe 358 probe 358
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility358', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing358')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 358) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0359
     * @tc.name    MusicCompatibility359
     * @tc.desc    Music title uniqueness probe 359 probe 359
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility359', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing359')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 359) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0360
     * @tc.name    MusicCompatibility360
     * @tc.desc    Music title uniqueness probe 360 probe 360
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility360', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing360')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 360) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0361
     * @tc.name    MusicCompatibility361
     * @tc.desc    Music title uniqueness probe 361 probe 361
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility361', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing361')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 361) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0362
     * @tc.name    MusicCompatibility362
     * @tc.desc    Music title uniqueness probe 362 probe 362
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility362', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing362')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 362) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0363
     * @tc.name    MusicCompatibility363
     * @tc.desc    Music title uniqueness probe 363 probe 363
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility363', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing363')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 363) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0364
     * @tc.name    MusicCompatibility364
     * @tc.desc    Music title uniqueness probe 364 probe 364
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility364', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing364')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 364) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0365
     * @tc.name    MusicCompatibility365
     * @tc.desc    Music title uniqueness probe 365 probe 365
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility365', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing365')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 365) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0366
     * @tc.name    MusicCompatibility366
     * @tc.desc    Music title uniqueness probe 366 probe 366
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility366', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing366')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 366) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0367
     * @tc.name    MusicCompatibility367
     * @tc.desc    Music title uniqueness probe 367 probe 367
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility367', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing367')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 367) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0368
     * @tc.name    MusicCompatibility368
     * @tc.desc    Music title uniqueness probe 368 probe 368
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility368', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing368')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 368) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0369
     * @tc.name    MusicCompatibility369
     * @tc.desc    Music title uniqueness probe 369 probe 369
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility369', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing369')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 369) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0370
     * @tc.name    MusicCompatibility370
     * @tc.desc    Music title uniqueness probe 370 probe 370
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility370', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing370')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 370) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0371
     * @tc.name    MusicCompatibility371
     * @tc.desc    Music title uniqueness probe 371 probe 371
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility371', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing371')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 371) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0372
     * @tc.name    MusicCompatibility372
     * @tc.desc    Music title uniqueness probe 372 probe 372
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility372', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing372')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 372) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0373
     * @tc.name    MusicCompatibility373
     * @tc.desc    Music title uniqueness probe 373 probe 373
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility373', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing373')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 373) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0374
     * @tc.name    MusicCompatibility374
     * @tc.desc    Music title uniqueness probe 374 probe 374
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility374', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing374')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 374) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0375
     * @tc.name    MusicCompatibility375
     * @tc.desc    Music title uniqueness probe 375 probe 375
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility375', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing375')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 375) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0376
     * @tc.name    MusicCompatibility376
     * @tc.desc    Music title uniqueness probe 376 probe 376
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility376', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing376')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 376) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0377
     * @tc.name    MusicCompatibility377
     * @tc.desc    Music title uniqueness probe 377 probe 377
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility377', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing377')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 377) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0378
     * @tc.name    MusicCompatibility378
     * @tc.desc    Music title uniqueness probe 378 probe 378
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility378', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing378')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 378) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0379
     * @tc.name    MusicCompatibility379
     * @tc.desc    Music title uniqueness probe 379 probe 379
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility379', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing379')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 379) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0380
     * @tc.name    MusicCompatibility380
     * @tc.desc    Music title uniqueness probe 380 probe 380
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility380', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing380')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 380) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0381
     * @tc.name    MusicCompatibility381
     * @tc.desc    Music title uniqueness probe 381 probe 381
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility381', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing381')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 381) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0382
     * @tc.name    MusicCompatibility382
     * @tc.desc    Music title uniqueness probe 382 probe 382
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility382', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing382')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 382) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0383
     * @tc.name    MusicCompatibility383
     * @tc.desc    Music title uniqueness probe 383 probe 383
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility383', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing383')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 383) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0384
     * @tc.name    MusicCompatibility384
     * @tc.desc    Music title uniqueness probe 384 probe 384
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility384', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing384')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 384) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0385
     * @tc.name    MusicCompatibility385
     * @tc.desc    Music title uniqueness probe 385 probe 385
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility385', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing385')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 385) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0386
     * @tc.name    MusicCompatibility386
     * @tc.desc    Music title uniqueness probe 386 probe 386
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility386', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing386')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 386) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0387
     * @tc.name    MusicCompatibility387
     * @tc.desc    Music title uniqueness probe 387 probe 387
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility387', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing387')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 387) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0388
     * @tc.name    MusicCompatibility388
     * @tc.desc    Music title uniqueness probe 388 probe 388
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility388', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing388')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 388) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0389
     * @tc.name    MusicCompatibility389
     * @tc.desc    Music title uniqueness probe 389 probe 389
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility389', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing389')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 389) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0390
     * @tc.name    MusicCompatibility390
     * @tc.desc    Music title uniqueness probe 390 probe 390
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility390', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing390')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 390) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0391
     * @tc.name    MusicCompatibility391
     * @tc.desc    Music title uniqueness probe 391 probe 391
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility391', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing391')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 391) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0392
     * @tc.name    MusicCompatibility392
     * @tc.desc    Music title uniqueness probe 392 probe 392
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility392', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing392')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 392) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0393
     * @tc.name    MusicCompatibility393
     * @tc.desc    Music title uniqueness probe 393 probe 393
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility393', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing393')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 393) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0394
     * @tc.name    MusicCompatibility394
     * @tc.desc    Music title uniqueness probe 394 probe 394
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility394', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing394')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 394) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0395
     * @tc.name    MusicCompatibility395
     * @tc.desc    Music title uniqueness probe 395 probe 395
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility395', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing395')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 395) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0396
     * @tc.name    MusicCompatibility396
     * @tc.desc    Music title uniqueness probe 396 probe 396
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility396', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing396')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 396) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0397
     * @tc.name    MusicCompatibility397
     * @tc.desc    Music title uniqueness probe 397 probe 397
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility397', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing397')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 397) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0398
     * @tc.name    MusicCompatibility398
     * @tc.desc    Music title uniqueness probe 398 probe 398
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility398', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing398')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 398) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0399
     * @tc.name    MusicCompatibility399
     * @tc.desc    Music title uniqueness probe 399 probe 399
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility399', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing399')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 399) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0400
     * @tc.name    MusicCompatibility400
     * @tc.desc    Music title uniqueness probe 400 probe 400
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility400', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing400')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 400) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0401
     * @tc.name    MusicCompatibility401
     * @tc.desc    Music title uniqueness probe 401 probe 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility401', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing401')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 401) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0402
     * @tc.name    MusicCompatibility402
     * @tc.desc    Music title uniqueness probe 402 probe 402
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility402', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing402')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 402) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0403
     * @tc.name    MusicCompatibility403
     * @tc.desc    Music title uniqueness probe 403 probe 403
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility403', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing403')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 403) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0404
     * @tc.name    MusicCompatibility404
     * @tc.desc    Music title uniqueness probe 404 probe 404
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility404', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing404')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 404) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0405
     * @tc.name    MusicCompatibility405
     * @tc.desc    Music title uniqueness probe 405 probe 405
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility405', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing405')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 405) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0406
     * @tc.name    MusicCompatibility406
     * @tc.desc    Music title uniqueness probe 406 probe 406
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility406', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing406')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 406) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0407
     * @tc.name    MusicCompatibility407
     * @tc.desc    Music title uniqueness probe 407 probe 407
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility407', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing407')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 407) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0408
     * @tc.name    MusicCompatibility408
     * @tc.desc    Music title uniqueness probe 408 probe 408
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility408', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing408')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 408) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0409
     * @tc.name    MusicCompatibility409
     * @tc.desc    Music title uniqueness probe 409 probe 409
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility409', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing409')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 409) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0410
     * @tc.name    MusicCompatibility410
     * @tc.desc    Music title uniqueness probe 410 probe 410
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility410', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing410')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 410) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0411
     * @tc.name    MusicCompatibility411
     * @tc.desc    Music title uniqueness probe 411 probe 411
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility411', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing411')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 411) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0412
     * @tc.name    MusicCompatibility412
     * @tc.desc    Music title uniqueness probe 412 probe 412
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility412', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing412')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 412) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0413
     * @tc.name    MusicCompatibility413
     * @tc.desc    Music title uniqueness probe 413 probe 413
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility413', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing413')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 413) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0414
     * @tc.name    MusicCompatibility414
     * @tc.desc    Music title uniqueness probe 414 probe 414
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility414', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing414')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 414) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0415
     * @tc.name    MusicCompatibility415
     * @tc.desc    Music title uniqueness probe 415 probe 415
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility415', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing415')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 415) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0416
     * @tc.name    MusicCompatibility416
     * @tc.desc    Music title uniqueness probe 416 probe 416
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility416', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing416')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 416) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0417
     * @tc.name    MusicCompatibility417
     * @tc.desc    Music title uniqueness probe 417 probe 417
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility417', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing417')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 417) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0418
     * @tc.name    MusicCompatibility418
     * @tc.desc    Music title uniqueness probe 418 probe 418
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility418', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing418')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 418) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0419
     * @tc.name    MusicCompatibility419
     * @tc.desc    Music title uniqueness probe 419 probe 419
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility419', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing419')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 419) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0420
     * @tc.name    MusicCompatibility420
     * @tc.desc    Music title uniqueness probe 420 probe 420
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility420', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing420')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 420) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0421
     * @tc.name    MusicCompatibility421
     * @tc.desc    Music title uniqueness probe 421 probe 421
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility421', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing421')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 421) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0422
     * @tc.name    MusicCompatibility422
     * @tc.desc    Music title uniqueness probe 422 probe 422
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility422', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing422')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 422) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0423
     * @tc.name    MusicCompatibility423
     * @tc.desc    Music title uniqueness probe 423 probe 423
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility423', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing423')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 423) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0424
     * @tc.name    MusicCompatibility424
     * @tc.desc    Music title uniqueness probe 424 probe 424
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility424', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing424')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 424) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0425
     * @tc.name    MusicCompatibility425
     * @tc.desc    Music title uniqueness probe 425 probe 425
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility425', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing425')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 425) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0426
     * @tc.name    MusicCompatibility426
     * @tc.desc    Music title uniqueness probe 426 probe 426
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility426', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing426')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 426) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0427
     * @tc.name    MusicCompatibility427
     * @tc.desc    Music title uniqueness probe 427 probe 427
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility427', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing427')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 427) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0428
     * @tc.name    MusicCompatibility428
     * @tc.desc    Music title uniqueness probe 428 probe 428
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility428', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing428')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 428) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0429
     * @tc.name    MusicCompatibility429
     * @tc.desc    Music title uniqueness probe 429 probe 429
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility429', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing429')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 429) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0430
     * @tc.name    MusicCompatibility430
     * @tc.desc    Music title uniqueness probe 430 probe 430
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility430', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing430')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 430) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0431
     * @tc.name    MusicCompatibility431
     * @tc.desc    Music title uniqueness probe 431 probe 431
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility431', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing431')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 431) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0432
     * @tc.name    MusicCompatibility432
     * @tc.desc    Music title uniqueness probe 432 probe 432
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility432', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing432')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 432) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0433
     * @tc.name    MusicCompatibility433
     * @tc.desc    Music title uniqueness probe 433 probe 433
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility433', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing433')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 433) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0434
     * @tc.name    MusicCompatibility434
     * @tc.desc    Music title uniqueness probe 434 probe 434
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility434', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing434')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 434) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0435
     * @tc.name    MusicCompatibility435
     * @tc.desc    Music title uniqueness probe 435 probe 435
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility435', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing435')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 435) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0436
     * @tc.name    MusicCompatibility436
     * @tc.desc    Music title uniqueness probe 436 probe 436
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility436', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing436')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 436) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0437
     * @tc.name    MusicCompatibility437
     * @tc.desc    Music title uniqueness probe 437 probe 437
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility437', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing437')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 437) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0438
     * @tc.name    MusicCompatibility438
     * @tc.desc    Music title uniqueness probe 438 probe 438
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility438', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing438')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 438) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0439
     * @tc.name    MusicCompatibility439
     * @tc.desc    Music title uniqueness probe 439 probe 439
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility439', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing439')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 439) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0440
     * @tc.name    MusicCompatibility440
     * @tc.desc    Music title uniqueness probe 440 probe 440
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility440', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing440')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 440) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0441
     * @tc.name    MusicCompatibility441
     * @tc.desc    Music title uniqueness probe 441 probe 441
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicCompatibility441', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueTitles()).assertEqual(true);
      expect(m.searchTitle('missing441')).assertEqual(0);
      expect(m.getPlaylistByIndex(1000 + 441) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
