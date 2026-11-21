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
import { AlbumModel } from '../Shared/AlbumModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[AlbumTests]';

export default function albumFocusRingBehaviorSuite() {
  describe('AlbumFocusRingBehaviorSuite', () => {
    let m: AlbumModel = new AlbumModel();

    beforeEach(() => {
      m = new AlbumModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0383
     * @tc.name    AlbumFocusRingBehavior383
     * @tc.desc    Album page partition 8 probe 383
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior383', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 383) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0384
     * @tc.name    AlbumFocusRingBehavior384
     * @tc.desc    Album page partition 1 probe 384
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior384', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 384) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0385
     * @tc.name    AlbumFocusRingBehavior385
     * @tc.desc    Album page partition 2 probe 385
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior385', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 385) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0386
     * @tc.name    AlbumFocusRingBehavior386
     * @tc.desc    Album page partition 3 probe 386
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior386', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 386) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0387
     * @tc.name    AlbumFocusRingBehavior387
     * @tc.desc    Album page partition 4 probe 387
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior387', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 387) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0388
     * @tc.name    AlbumFocusRingBehavior388
     * @tc.desc    Album page partition 5 probe 388
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior388', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 388) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0389
     * @tc.name    AlbumFocusRingBehavior389
     * @tc.desc    Album page partition 6 probe 389
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior389', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 389) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0390
     * @tc.name    AlbumFocusRingBehavior390
     * @tc.desc    Album page partition 7 probe 390
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior390', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 390) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0391
     * @tc.name    AlbumFocusRingBehavior391
     * @tc.desc    Album page partition 8 probe 391
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior391', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 391) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0392
     * @tc.name    AlbumFocusRingBehavior392
     * @tc.desc    Album page partition 1 probe 392
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior392', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 392) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0393
     * @tc.name    AlbumFocusRingBehavior393
     * @tc.desc    Album page partition 2 probe 393
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior393', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 393) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0394
     * @tc.name    AlbumFocusRingBehavior394
     * @tc.desc    Album page partition 3 probe 394
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior394', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 394) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0395
     * @tc.name    AlbumFocusRingBehavior395
     * @tc.desc    Album page partition 4 probe 395
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior395', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 395) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0396
     * @tc.name    AlbumFocusRingBehavior396
     * @tc.desc    Album page partition 5 probe 396
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior396', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 396) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0397
     * @tc.name    AlbumFocusRingBehavior397
     * @tc.desc    Album page partition 6 probe 397
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior397', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 397) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0398
     * @tc.name    AlbumFocusRingBehavior398
     * @tc.desc    Album page partition 7 probe 398
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior398', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 398) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0399
     * @tc.name    AlbumFocusRingBehavior399
     * @tc.desc    Album page partition 8 probe 399
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior399', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 399) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0400
     * @tc.name    AlbumFocusRingBehavior400
     * @tc.desc    Album page partition 1 probe 400
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior400', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 400) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0401
     * @tc.name    AlbumFocusRingBehavior401
     * @tc.desc    Album page partition 2 probe 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior401', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 401) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0402
     * @tc.name    AlbumFocusRingBehavior402
     * @tc.desc    Album page partition 3 probe 402
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior402', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 402) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0403
     * @tc.name    AlbumFocusRingBehavior403
     * @tc.desc    Album page partition 4 probe 403
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior403', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 403) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0404
     * @tc.name    AlbumFocusRingBehavior404
     * @tc.desc    Album page partition 5 probe 404
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior404', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 404) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0405
     * @tc.name    AlbumFocusRingBehavior405
     * @tc.desc    Album page partition 6 probe 405
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior405', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 405) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0406
     * @tc.name    AlbumFocusRingBehavior406
     * @tc.desc    Album page partition 7 probe 406
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior406', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 406) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0407
     * @tc.name    AlbumFocusRingBehavior407
     * @tc.desc    Album page partition 8 probe 407
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior407', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 407) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0408
     * @tc.name    AlbumFocusRingBehavior408
     * @tc.desc    Album page partition 1 probe 408
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior408', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 408) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0409
     * @tc.name    AlbumFocusRingBehavior409
     * @tc.desc    Album page partition 2 probe 409
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior409', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 409) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0410
     * @tc.name    AlbumFocusRingBehavior410
     * @tc.desc    Album page partition 3 probe 410
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior410', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 410) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0411
     * @tc.name    AlbumFocusRingBehavior411
     * @tc.desc    Album page partition 4 probe 411
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior411', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 411) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0412
     * @tc.name    AlbumFocusRingBehavior412
     * @tc.desc    Album page partition 5 probe 412
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior412', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 412) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0413
     * @tc.name    AlbumFocusRingBehavior413
     * @tc.desc    Album page partition 6 probe 413
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior413', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 413) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0414
     * @tc.name    AlbumFocusRingBehavior414
     * @tc.desc    Album page partition 7 probe 414
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior414', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 414) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0415
     * @tc.name    AlbumFocusRingBehavior415
     * @tc.desc    Album page partition 8 probe 415
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior415', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 415) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0416
     * @tc.name    AlbumFocusRingBehavior416
     * @tc.desc    Album page partition 1 probe 416
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior416', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 416) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0417
     * @tc.name    AlbumFocusRingBehavior417
     * @tc.desc    Album page partition 2 probe 417
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior417', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 417) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0418
     * @tc.name    AlbumFocusRingBehavior418
     * @tc.desc    Album page partition 3 probe 418
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior418', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 418) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0419
     * @tc.name    AlbumFocusRingBehavior419
     * @tc.desc    Album page partition 4 probe 419
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior419', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 419) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0420
     * @tc.name    AlbumFocusRingBehavior420
     * @tc.desc    Album page partition 5 probe 420
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior420', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 420) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0421
     * @tc.name    AlbumFocusRingBehavior421
     * @tc.desc    Album page partition 6 probe 421
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior421', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 421) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0422
     * @tc.name    AlbumFocusRingBehavior422
     * @tc.desc    Album page partition 7 probe 422
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior422', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 422) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0423
     * @tc.name    AlbumFocusRingBehavior423
     * @tc.desc    Album page partition 8 probe 423
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior423', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 423) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0424
     * @tc.name    AlbumFocusRingBehavior424
     * @tc.desc    Album page partition 1 probe 424
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior424', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 424) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0425
     * @tc.name    AlbumFocusRingBehavior425
     * @tc.desc    Album page partition 2 probe 425
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior425', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 425) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0426
     * @tc.name    AlbumFocusRingBehavior426
     * @tc.desc    Album page partition 3 probe 426
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior426', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 426) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0427
     * @tc.name    AlbumFocusRingBehavior427
     * @tc.desc    Album page partition 4 probe 427
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior427', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 427) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0428
     * @tc.name    AlbumFocusRingBehavior428
     * @tc.desc    Album page partition 5 probe 428
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior428', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 428) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0429
     * @tc.name    AlbumFocusRingBehavior429
     * @tc.desc    Album page partition 6 probe 429
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior429', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 429) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0430
     * @tc.name    AlbumFocusRingBehavior430
     * @tc.desc    Album page partition 7 probe 430
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior430', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 430) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0431
     * @tc.name    AlbumFocusRingBehavior431
     * @tc.desc    Album page partition 8 probe 431
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior431', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 431) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0432
     * @tc.name    AlbumFocusRingBehavior432
     * @tc.desc    Album page partition 1 probe 432
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior432', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 432) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0433
     * @tc.name    AlbumFocusRingBehavior433
     * @tc.desc    Album page partition 2 probe 433
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior433', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 433) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0434
     * @tc.name    AlbumFocusRingBehavior434
     * @tc.desc    Album page partition 3 probe 434
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior434', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 434) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0435
     * @tc.name    AlbumFocusRingBehavior435
     * @tc.desc    Album page partition 4 probe 435
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior435', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 435) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0436
     * @tc.name    AlbumFocusRingBehavior436
     * @tc.desc    Album page partition 5 probe 436
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior436', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 436) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0437
     * @tc.name    AlbumFocusRingBehavior437
     * @tc.desc    Album page partition 6 probe 437
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior437', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 437) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0438
     * @tc.name    AlbumFocusRingBehavior438
     * @tc.desc    Album page partition 7 probe 438
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior438', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 438) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0439
     * @tc.name    AlbumFocusRingBehavior439
     * @tc.desc    Album page partition 8 probe 439
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior439', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 439) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0440
     * @tc.name    AlbumFocusRingBehavior440
     * @tc.desc    Album page partition 1 probe 440
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior440', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 440) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0441
     * @tc.name    AlbumFocusRingBehavior441
     * @tc.desc    Album page partition 2 probe 441
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior441', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 441) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0442
     * @tc.name    AlbumFocusRingBehavior442
     * @tc.desc    Album page partition 3 probe 442
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior442', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 442) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0443
     * @tc.name    AlbumFocusRingBehavior443
     * @tc.desc    Album page partition 4 probe 443
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior443', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 443) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0444
     * @tc.name    AlbumFocusRingBehavior444
     * @tc.desc    Album page partition 5 probe 444
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior444', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 444) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0445
     * @tc.name    AlbumFocusRingBehavior445
     * @tc.desc    Album page partition 6 probe 445
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior445', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 445) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0446
     * @tc.name    AlbumFocusRingBehavior446
     * @tc.desc    Album page partition 7 probe 446
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior446', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 446) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0447
     * @tc.name    AlbumFocusRingBehavior447
     * @tc.desc    Album page partition 8 probe 447
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior447', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 447) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0448
     * @tc.name    AlbumFocusRingBehavior448
     * @tc.desc    Album page partition 1 probe 448
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior448', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 448) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0449
     * @tc.name    AlbumFocusRingBehavior449
     * @tc.desc    Album page partition 2 probe 449
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior449', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 449) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0450
     * @tc.name    AlbumFocusRingBehavior450
     * @tc.desc    Album page partition 3 probe 450
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior450', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 450) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0451
     * @tc.name    AlbumFocusRingBehavior451
     * @tc.desc    Album page partition 4 probe 451
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior451', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 451) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0452
     * @tc.name    AlbumFocusRingBehavior452
     * @tc.desc    Album page partition 5 probe 452
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior452', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 452) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0453
     * @tc.name    AlbumFocusRingBehavior453
     * @tc.desc    Album page partition 6 probe 453
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior453', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 453) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0454
     * @tc.name    AlbumFocusRingBehavior454
     * @tc.desc    Album page partition 7 probe 454
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior454', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 454) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0455
     * @tc.name    AlbumFocusRingBehavior455
     * @tc.desc    Album page partition 8 probe 455
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior455', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 455) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0456
     * @tc.name    AlbumFocusRingBehavior456
     * @tc.desc    Album page partition 1 probe 456
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior456', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 456) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0457
     * @tc.name    AlbumFocusRingBehavior457
     * @tc.desc    Album page partition 2 probe 457
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior457', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 457) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0458
     * @tc.name    AlbumFocusRingBehavior458
     * @tc.desc    Album page partition 3 probe 458
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior458', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 458) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0459
     * @tc.name    AlbumFocusRingBehavior459
     * @tc.desc    Album page partition 4 probe 459
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior459', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 459) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0460
     * @tc.name    AlbumFocusRingBehavior460
     * @tc.desc    Album page partition 5 probe 460
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior460', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 460) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0461
     * @tc.name    AlbumFocusRingBehavior461
     * @tc.desc    Album page partition 6 probe 461
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior461', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 461) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0462
     * @tc.name    AlbumFocusRingBehavior462
     * @tc.desc    Album page partition 7 probe 462
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior462', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 462) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0463
     * @tc.name    AlbumFocusRingBehavior463
     * @tc.desc    Album page partition 8 probe 463
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior463', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 463) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0464
     * @tc.name    AlbumFocusRingBehavior464
     * @tc.desc    Album page partition 1 probe 464
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior464', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 464) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0465
     * @tc.name    AlbumFocusRingBehavior465
     * @tc.desc    Album page partition 2 probe 465
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior465', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 465) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0466
     * @tc.name    AlbumFocusRingBehavior466
     * @tc.desc    Album page partition 3 probe 466
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior466', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 466) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0467
     * @tc.name    AlbumFocusRingBehavior467
     * @tc.desc    Album page partition 4 probe 467
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior467', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 467) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0468
     * @tc.name    AlbumFocusRingBehavior468
     * @tc.desc    Album page partition 5 probe 468
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior468', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 468) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0469
     * @tc.name    AlbumFocusRingBehavior469
     * @tc.desc    Album page partition 6 probe 469
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior469', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 469) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0470
     * @tc.name    AlbumFocusRingBehavior470
     * @tc.desc    Album page partition 7 probe 470
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior470', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 470) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0471
     * @tc.name    AlbumFocusRingBehavior471
     * @tc.desc    Album page partition 8 probe 471
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior471', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 471) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0472
     * @tc.name    AlbumFocusRingBehavior472
     * @tc.desc    Album page partition 1 probe 472
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior472', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 472) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0473
     * @tc.name    AlbumFocusRingBehavior473
     * @tc.desc    Album page partition 2 probe 473
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior473', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 473) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0474
     * @tc.name    AlbumFocusRingBehavior474
     * @tc.desc    Album page partition 3 probe 474
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior474', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 474) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0475
     * @tc.name    AlbumFocusRingBehavior475
     * @tc.desc    Album page partition 4 probe 475
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior475', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 475) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0476
     * @tc.name    AlbumFocusRingBehavior476
     * @tc.desc    Album page partition 5 probe 476
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior476', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 476) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0477
     * @tc.name    AlbumFocusRingBehavior477
     * @tc.desc    Album page partition 6 probe 477
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior477', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 477) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0478
     * @tc.name    AlbumFocusRingBehavior478
     * @tc.desc    Album page partition 7 probe 478
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior478', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 478) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0479
     * @tc.name    AlbumFocusRingBehavior479
     * @tc.desc    Album page partition 8 probe 479
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior479', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 479) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0480
     * @tc.name    AlbumFocusRingBehavior480
     * @tc.desc    Album page partition 1 probe 480
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumFocusRingBehavior480', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getTrackCount());
      expect(m.getTrackById(1000 + 480) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
