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

export default function musicEventPropagationSuite() {
  describe('MusicEventPropagationSuite', () => {
    let m: MusicModel = new MusicModel();

    beforeEach(() => {
      m = new MusicModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0480
     * @tc.name    MusicEventPropagation480
     * @tc.desc    Music playlist page partition 5 probe 480
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation480', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 480) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0481
     * @tc.name    MusicEventPropagation481
     * @tc.desc    Music playlist page partition 6 probe 481
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation481', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 481) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0482
     * @tc.name    MusicEventPropagation482
     * @tc.desc    Music playlist page partition 7 probe 482
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation482', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 482) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0483
     * @tc.name    MusicEventPropagation483
     * @tc.desc    Music playlist page partition 1 probe 483
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation483', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 483) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0484
     * @tc.name    MusicEventPropagation484
     * @tc.desc    Music playlist page partition 2 probe 484
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation484', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 484) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0485
     * @tc.name    MusicEventPropagation485
     * @tc.desc    Music playlist page partition 3 probe 485
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation485', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 485) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0486
     * @tc.name    MusicEventPropagation486
     * @tc.desc    Music playlist page partition 4 probe 486
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation486', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 486) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0487
     * @tc.name    MusicEventPropagation487
     * @tc.desc    Music playlist page partition 5 probe 487
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation487', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 487) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0488
     * @tc.name    MusicEventPropagation488
     * @tc.desc    Music playlist page partition 6 probe 488
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation488', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 488) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0489
     * @tc.name    MusicEventPropagation489
     * @tc.desc    Music playlist page partition 7 probe 489
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation489', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 489) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0490
     * @tc.name    MusicEventPropagation490
     * @tc.desc    Music playlist page partition 1 probe 490
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation490', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 490) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0491
     * @tc.name    MusicEventPropagation491
     * @tc.desc    Music playlist page partition 2 probe 491
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation491', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 491) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0492
     * @tc.name    MusicEventPropagation492
     * @tc.desc    Music playlist page partition 3 probe 492
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation492', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 492) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0493
     * @tc.name    MusicEventPropagation493
     * @tc.desc    Music playlist page partition 4 probe 493
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation493', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 493) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0494
     * @tc.name    MusicEventPropagation494
     * @tc.desc    Music playlist page partition 5 probe 494
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation494', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 494) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0495
     * @tc.name    MusicEventPropagation495
     * @tc.desc    Music playlist page partition 6 probe 495
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation495', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 495) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0496
     * @tc.name    MusicEventPropagation496
     * @tc.desc    Music playlist page partition 7 probe 496
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation496', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 496) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0497
     * @tc.name    MusicEventPropagation497
     * @tc.desc    Music playlist page partition 1 probe 497
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation497', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 497) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0498
     * @tc.name    MusicEventPropagation498
     * @tc.desc    Music playlist page partition 2 probe 498
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation498', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 498) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0499
     * @tc.name    MusicEventPropagation499
     * @tc.desc    Music playlist page partition 3 probe 499
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation499', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 499) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0500
     * @tc.name    MusicEventPropagation500
     * @tc.desc    Music playlist page partition 4 probe 500
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation500', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 500) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0501
     * @tc.name    MusicEventPropagation501
     * @tc.desc    Music playlist page partition 5 probe 501
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation501', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 501) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0502
     * @tc.name    MusicEventPropagation502
     * @tc.desc    Music playlist page partition 6 probe 502
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation502', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 502) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0503
     * @tc.name    MusicEventPropagation503
     * @tc.desc    Music playlist page partition 7 probe 503
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation503', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 503) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0504
     * @tc.name    MusicEventPropagation504
     * @tc.desc    Music playlist page partition 1 probe 504
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation504', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 504) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0505
     * @tc.name    MusicEventPropagation505
     * @tc.desc    Music playlist page partition 2 probe 505
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation505', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 505) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0506
     * @tc.name    MusicEventPropagation506
     * @tc.desc    Music playlist page partition 3 probe 506
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation506', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 506) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0507
     * @tc.name    MusicEventPropagation507
     * @tc.desc    Music playlist page partition 4 probe 507
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation507', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 507) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0508
     * @tc.name    MusicEventPropagation508
     * @tc.desc    Music playlist page partition 5 probe 508
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation508', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 508) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0509
     * @tc.name    MusicEventPropagation509
     * @tc.desc    Music playlist page partition 6 probe 509
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation509', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 509) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0510
     * @tc.name    MusicEventPropagation510
     * @tc.desc    Music playlist page partition 7 probe 510
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation510', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 510) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0511
     * @tc.name    MusicEventPropagation511
     * @tc.desc    Music playlist page partition 1 probe 511
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation511', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 511) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0512
     * @tc.name    MusicEventPropagation512
     * @tc.desc    Music playlist page partition 2 probe 512
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation512', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 512) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0513
     * @tc.name    MusicEventPropagation513
     * @tc.desc    Music playlist page partition 3 probe 513
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation513', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 513) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0514
     * @tc.name    MusicEventPropagation514
     * @tc.desc    Music playlist page partition 4 probe 514
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation514', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 514) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0515
     * @tc.name    MusicEventPropagation515
     * @tc.desc    Music playlist page partition 5 probe 515
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation515', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 515) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0516
     * @tc.name    MusicEventPropagation516
     * @tc.desc    Music playlist page partition 6 probe 516
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation516', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 516) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0517
     * @tc.name    MusicEventPropagation517
     * @tc.desc    Music playlist page partition 7 probe 517
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation517', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 517) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0518
     * @tc.name    MusicEventPropagation518
     * @tc.desc    Music playlist page partition 1 probe 518
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation518', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 518) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0519
     * @tc.name    MusicEventPropagation519
     * @tc.desc    Music playlist page partition 2 probe 519
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation519', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 519) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0520
     * @tc.name    MusicEventPropagation520
     * @tc.desc    Music playlist page partition 3 probe 520
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation520', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 520) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0521
     * @tc.name    MusicEventPropagation521
     * @tc.desc    Music playlist page partition 4 probe 521
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation521', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 521) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0522
     * @tc.name    MusicEventPropagation522
     * @tc.desc    Music playlist page partition 5 probe 522
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation522', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 522) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0523
     * @tc.name    MusicEventPropagation523
     * @tc.desc    Music playlist page partition 6 probe 523
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation523', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 523) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0524
     * @tc.name    MusicEventPropagation524
     * @tc.desc    Music playlist page partition 7 probe 524
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation524', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 524) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0525
     * @tc.name    MusicEventPropagation525
     * @tc.desc    Music playlist page partition 1 probe 525
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation525', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 525) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0526
     * @tc.name    MusicEventPropagation526
     * @tc.desc    Music playlist page partition 2 probe 526
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation526', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 526) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0527
     * @tc.name    MusicEventPropagation527
     * @tc.desc    Music playlist page partition 3 probe 527
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation527', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 527) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0528
     * @tc.name    MusicEventPropagation528
     * @tc.desc    Music playlist page partition 4 probe 528
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation528', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 528) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0529
     * @tc.name    MusicEventPropagation529
     * @tc.desc    Music playlist page partition 5 probe 529
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation529', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 529) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0530
     * @tc.name    MusicEventPropagation530
     * @tc.desc    Music playlist page partition 6 probe 530
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation530', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 530) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0531
     * @tc.name    MusicEventPropagation531
     * @tc.desc    Music playlist page partition 7 probe 531
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation531', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 531) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0532
     * @tc.name    MusicEventPropagation532
     * @tc.desc    Music playlist page partition 1 probe 532
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation532', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 532) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0533
     * @tc.name    MusicEventPropagation533
     * @tc.desc    Music playlist page partition 2 probe 533
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation533', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 533) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0534
     * @tc.name    MusicEventPropagation534
     * @tc.desc    Music playlist page partition 3 probe 534
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation534', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 534) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0535
     * @tc.name    MusicEventPropagation535
     * @tc.desc    Music playlist page partition 4 probe 535
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation535', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 535) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0536
     * @tc.name    MusicEventPropagation536
     * @tc.desc    Music playlist page partition 5 probe 536
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation536', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 536) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0537
     * @tc.name    MusicEventPropagation537
     * @tc.desc    Music playlist page partition 6 probe 537
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation537', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 537) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0538
     * @tc.name    MusicEventPropagation538
     * @tc.desc    Music playlist page partition 7 probe 538
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation538', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 538) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0539
     * @tc.name    MusicEventPropagation539
     * @tc.desc    Music playlist page partition 1 probe 539
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation539', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 539) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0540
     * @tc.name    MusicEventPropagation540
     * @tc.desc    Music playlist page partition 2 probe 540
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation540', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 540) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0541
     * @tc.name    MusicEventPropagation541
     * @tc.desc    Music playlist page partition 3 probe 541
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation541', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 541) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0542
     * @tc.name    MusicEventPropagation542
     * @tc.desc    Music playlist page partition 4 probe 542
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation542', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 542) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0543
     * @tc.name    MusicEventPropagation543
     * @tc.desc    Music playlist page partition 5 probe 543
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation543', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 543) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0544
     * @tc.name    MusicEventPropagation544
     * @tc.desc    Music playlist page partition 6 probe 544
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation544', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 544) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0545
     * @tc.name    MusicEventPropagation545
     * @tc.desc    Music playlist page partition 7 probe 545
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation545', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 545) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0546
     * @tc.name    MusicEventPropagation546
     * @tc.desc    Music playlist page partition 1 probe 546
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation546', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 546) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0547
     * @tc.name    MusicEventPropagation547
     * @tc.desc    Music playlist page partition 2 probe 547
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation547', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 547) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0548
     * @tc.name    MusicEventPropagation548
     * @tc.desc    Music playlist page partition 3 probe 548
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation548', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 548) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0549
     * @tc.name    MusicEventPropagation549
     * @tc.desc    Music playlist page partition 4 probe 549
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation549', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 549) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0550
     * @tc.name    MusicEventPropagation550
     * @tc.desc    Music playlist page partition 5 probe 550
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation550', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 550) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0551
     * @tc.name    MusicEventPropagation551
     * @tc.desc    Music playlist page partition 6 probe 551
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation551', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 551) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0552
     * @tc.name    MusicEventPropagation552
     * @tc.desc    Music playlist page partition 7 probe 552
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation552', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 552) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0553
     * @tc.name    MusicEventPropagation553
     * @tc.desc    Music playlist page partition 1 probe 553
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation553', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 553) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0554
     * @tc.name    MusicEventPropagation554
     * @tc.desc    Music playlist page partition 2 probe 554
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation554', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 554) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0555
     * @tc.name    MusicEventPropagation555
     * @tc.desc    Music playlist page partition 3 probe 555
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation555', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 555) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0556
     * @tc.name    MusicEventPropagation556
     * @tc.desc    Music playlist page partition 4 probe 556
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation556', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 556) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0557
     * @tc.name    MusicEventPropagation557
     * @tc.desc    Music playlist page partition 5 probe 557
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation557', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 557) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0558
     * @tc.name    MusicEventPropagation558
     * @tc.desc    Music playlist page partition 6 probe 558
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation558', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 558) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0559
     * @tc.name    MusicEventPropagation559
     * @tc.desc    Music playlist page partition 7 probe 559
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation559', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 559) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0560
     * @tc.name    MusicEventPropagation560
     * @tc.desc    Music playlist page partition 1 probe 560
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation560', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 560) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0561
     * @tc.name    MusicEventPropagation561
     * @tc.desc    Music playlist page partition 2 probe 561
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation561', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 561) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0562
     * @tc.name    MusicEventPropagation562
     * @tc.desc    Music playlist page partition 3 probe 562
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation562', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 562) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0563
     * @tc.name    MusicEventPropagation563
     * @tc.desc    Music playlist page partition 4 probe 563
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation563', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 563) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0564
     * @tc.name    MusicEventPropagation564
     * @tc.desc    Music playlist page partition 5 probe 564
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation564', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 564) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0565
     * @tc.name    MusicEventPropagation565
     * @tc.desc    Music playlist page partition 6 probe 565
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation565', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 565) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0566
     * @tc.name    MusicEventPropagation566
     * @tc.desc    Music playlist page partition 7 probe 566
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation566', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 566) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0567
     * @tc.name    MusicEventPropagation567
     * @tc.desc    Music playlist page partition 1 probe 567
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation567', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 567) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0568
     * @tc.name    MusicEventPropagation568
     * @tc.desc    Music playlist page partition 2 probe 568
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation568', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 568) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0569
     * @tc.name    MusicEventPropagation569
     * @tc.desc    Music playlist page partition 3 probe 569
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation569', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 569) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0570
     * @tc.name    MusicEventPropagation570
     * @tc.desc    Music playlist page partition 4 probe 570
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation570', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 570) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0571
     * @tc.name    MusicEventPropagation571
     * @tc.desc    Music playlist page partition 5 probe 571
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation571', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 571) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0572
     * @tc.name    MusicEventPropagation572
     * @tc.desc    Music playlist page partition 6 probe 572
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation572', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 572) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0573
     * @tc.name    MusicEventPropagation573
     * @tc.desc    Music playlist page partition 7 probe 573
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation573', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 573) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0574
     * @tc.name    MusicEventPropagation574
     * @tc.desc    Music playlist page partition 1 probe 574
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation574', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 574) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0575
     * @tc.name    MusicEventPropagation575
     * @tc.desc    Music playlist page partition 2 probe 575
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation575', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 575) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0576
     * @tc.name    MusicEventPropagation576
     * @tc.desc    Music playlist page partition 3 probe 576
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation576', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 576) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0577
     * @tc.name    MusicEventPropagation577
     * @tc.desc    Music playlist page partition 4 probe 577
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation577', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 577) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0578
     * @tc.name    MusicEventPropagation578
     * @tc.desc    Music playlist page partition 5 probe 578
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation578', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 578) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0579
     * @tc.name    MusicEventPropagation579
     * @tc.desc    Music playlist page partition 6 probe 579
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation579', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 579) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0580
     * @tc.name    MusicEventPropagation580
     * @tc.desc    Music playlist page partition 7 probe 580
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation580', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 580) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0581
     * @tc.name    MusicEventPropagation581
     * @tc.desc    Music playlist page partition 1 probe 581
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation581', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 581) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0582
     * @tc.name    MusicEventPropagation582
     * @tc.desc    Music playlist page partition 2 probe 582
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation582', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 582) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0583
     * @tc.name    MusicEventPropagation583
     * @tc.desc    Music playlist page partition 3 probe 583
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation583', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 583) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0584
     * @tc.name    MusicEventPropagation584
     * @tc.desc    Music playlist page partition 4 probe 584
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation584', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 584) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0585
     * @tc.name    MusicEventPropagation585
     * @tc.desc    Music playlist page partition 5 probe 585
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation585', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 585) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0586
     * @tc.name    MusicEventPropagation586
     * @tc.desc    Music playlist page partition 6 probe 586
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation586', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 586) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0587
     * @tc.name    MusicEventPropagation587
     * @tc.desc    Music playlist page partition 7 probe 587
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation587', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 587) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0588
     * @tc.name    MusicEventPropagation588
     * @tc.desc    Music playlist page partition 1 probe 588
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation588', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 588) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0589
     * @tc.name    MusicEventPropagation589
     * @tc.desc    Music playlist page partition 2 probe 589
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation589', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 589) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0590
     * @tc.name    MusicEventPropagation590
     * @tc.desc    Music playlist page partition 3 probe 590
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation590', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 590) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0591
     * @tc.name    MusicEventPropagation591
     * @tc.desc    Music playlist page partition 4 probe 591
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation591', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 591) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0592
     * @tc.name    MusicEventPropagation592
     * @tc.desc    Music playlist page partition 5 probe 592
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation592', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 592) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0593
     * @tc.name    MusicEventPropagation593
     * @tc.desc    Music playlist page partition 6 probe 593
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation593', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 593) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0594
     * @tc.name    MusicEventPropagation594
     * @tc.desc    Music playlist page partition 7 probe 594
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation594', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 594) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0595
     * @tc.name    MusicEventPropagation595
     * @tc.desc    Music playlist page partition 1 probe 595
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation595', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 595) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0596
     * @tc.name    MusicEventPropagation596
     * @tc.desc    Music playlist page partition 2 probe 596
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation596', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 596) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0597
     * @tc.name    MusicEventPropagation597
     * @tc.desc    Music playlist page partition 3 probe 597
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation597', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 597) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0598
     * @tc.name    MusicEventPropagation598
     * @tc.desc    Music playlist page partition 4 probe 598
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation598', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 598) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0599
     * @tc.name    MusicEventPropagation599
     * @tc.desc    Music playlist page partition 5 probe 599
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation599', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 599) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0600
     * @tc.name    MusicEventPropagation600
     * @tc.desc    Music playlist page partition 6 probe 600
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation600', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 600) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0601
     * @tc.name    MusicEventPropagation601
     * @tc.desc    Music playlist page partition 7 probe 601
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation601', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 601) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0602
     * @tc.name    MusicEventPropagation602
     * @tc.desc    Music playlist page partition 1 probe 602
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation602', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 602) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0603
     * @tc.name    MusicEventPropagation603
     * @tc.desc    Music playlist page partition 2 probe 603
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation603', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 603) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0604
     * @tc.name    MusicEventPropagation604
     * @tc.desc    Music playlist page partition 3 probe 604
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation604', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 604) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0605
     * @tc.name    MusicEventPropagation605
     * @tc.desc    Music playlist page partition 4 probe 605
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation605', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 605) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0606
     * @tc.name    MusicEventPropagation606
     * @tc.desc    Music playlist page partition 5 probe 606
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation606', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 606) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0607
     * @tc.name    MusicEventPropagation607
     * @tc.desc    Music playlist page partition 6 probe 607
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation607', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 607) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0608
     * @tc.name    MusicEventPropagation608
     * @tc.desc    Music playlist page partition 7 probe 608
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation608', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 608) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0609
     * @tc.name    MusicEventPropagation609
     * @tc.desc    Music playlist page partition 1 probe 609
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation609', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 609) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0610
     * @tc.name    MusicEventPropagation610
     * @tc.desc    Music playlist page partition 2 probe 610
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation610', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 610) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0611
     * @tc.name    MusicEventPropagation611
     * @tc.desc    Music playlist page partition 3 probe 611
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation611', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 611) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0612
     * @tc.name    MusicEventPropagation612
     * @tc.desc    Music playlist page partition 4 probe 612
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation612', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 612) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0613
     * @tc.name    MusicEventPropagation613
     * @tc.desc    Music playlist page partition 5 probe 613
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation613', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 613) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0614
     * @tc.name    MusicEventPropagation614
     * @tc.desc    Music playlist page partition 6 probe 614
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation614', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 614) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0615
     * @tc.name    MusicEventPropagation615
     * @tc.desc    Music playlist page partition 7 probe 615
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation615', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 615) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0616
     * @tc.name    MusicEventPropagation616
     * @tc.desc    Music playlist page partition 1 probe 616
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation616', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 616) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0617
     * @tc.name    MusicEventPropagation617
     * @tc.desc    Music playlist page partition 2 probe 617
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation617', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 617) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0618
     * @tc.name    MusicEventPropagation618
     * @tc.desc    Music playlist page partition 3 probe 618
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation618', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 618) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0619
     * @tc.name    MusicEventPropagation619
     * @tc.desc    Music playlist page partition 4 probe 619
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation619', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 619) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0620
     * @tc.name    MusicEventPropagation620
     * @tc.desc    Music playlist page partition 5 probe 620
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation620', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 620) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0621
     * @tc.name    MusicEventPropagation621
     * @tc.desc    Music playlist page partition 6 probe 621
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation621', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 621) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0622
     * @tc.name    MusicEventPropagation622
     * @tc.desc    Music playlist page partition 7 probe 622
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation622', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 622) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0623
     * @tc.name    MusicEventPropagation623
     * @tc.desc    Music playlist page partition 1 probe 623
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation623', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 623) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0624
     * @tc.name    MusicEventPropagation624
     * @tc.desc    Music playlist page partition 2 probe 624
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation624', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 624) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0625
     * @tc.name    MusicEventPropagation625
     * @tc.desc    Music playlist page partition 3 probe 625
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation625', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 625) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0626
     * @tc.name    MusicEventPropagation626
     * @tc.desc    Music playlist page partition 4 probe 626
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation626', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 626) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0627
     * @tc.name    MusicEventPropagation627
     * @tc.desc    Music playlist page partition 5 probe 627
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation627', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 627) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0628
     * @tc.name    MusicEventPropagation628
     * @tc.desc    Music playlist page partition 6 probe 628
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation628', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 628) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0629
     * @tc.name    MusicEventPropagation629
     * @tc.desc    Music playlist page partition 7 probe 629
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation629', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 629) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0630
     * @tc.name    MusicEventPropagation630
     * @tc.desc    Music playlist page partition 1 probe 630
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation630', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 630) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0631
     * @tc.name    MusicEventPropagation631
     * @tc.desc    Music playlist page partition 2 probe 631
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation631', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 631) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0632
     * @tc.name    MusicEventPropagation632
     * @tc.desc    Music playlist page partition 3 probe 632
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation632', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 632) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0633
     * @tc.name    MusicEventPropagation633
     * @tc.desc    Music playlist page partition 4 probe 633
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation633', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 633) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0634
     * @tc.name    MusicEventPropagation634
     * @tc.desc    Music playlist page partition 5 probe 634
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation634', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 634) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0635
     * @tc.name    MusicEventPropagation635
     * @tc.desc    Music playlist page partition 6 probe 635
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation635', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 635) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0636
     * @tc.name    MusicEventPropagation636
     * @tc.desc    Music playlist page partition 7 probe 636
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation636', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 636) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0637
     * @tc.name    MusicEventPropagation637
     * @tc.desc    Music playlist page partition 1 probe 637
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation637', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 637) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0638
     * @tc.name    MusicEventPropagation638
     * @tc.desc    Music playlist page partition 2 probe 638
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation638', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 638) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0639
     * @tc.name    MusicEventPropagation639
     * @tc.desc    Music playlist page partition 3 probe 639
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation639', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 639) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0640
     * @tc.name    MusicEventPropagation640
     * @tc.desc    Music playlist page partition 4 probe 640
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation640', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 640) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0641
     * @tc.name    MusicEventPropagation641
     * @tc.desc    Music playlist page partition 5 probe 641
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation641', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 641) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0642
     * @tc.name    MusicEventPropagation642
     * @tc.desc    Music playlist page partition 6 probe 642
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation642', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 642) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0643
     * @tc.name    MusicEventPropagation643
     * @tc.desc    Music playlist page partition 7 probe 643
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation643', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 643) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0644
     * @tc.name    MusicEventPropagation644
     * @tc.desc    Music playlist page partition 1 probe 644
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation644', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 644) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0645
     * @tc.name    MusicEventPropagation645
     * @tc.desc    Music playlist page partition 2 probe 645
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation645', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 645) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0646
     * @tc.name    MusicEventPropagation646
     * @tc.desc    Music playlist page partition 3 probe 646
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation646', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 646) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0647
     * @tc.name    MusicEventPropagation647
     * @tc.desc    Music playlist page partition 4 probe 647
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation647', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 647) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0648
     * @tc.name    MusicEventPropagation648
     * @tc.desc    Music playlist page partition 5 probe 648
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation648', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 648) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0649
     * @tc.name    MusicEventPropagation649
     * @tc.desc    Music playlist page partition 6 probe 649
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation649', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 649) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0650
     * @tc.name    MusicEventPropagation650
     * @tc.desc    Music playlist page partition 7 probe 650
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation650', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 650) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0651
     * @tc.name    MusicEventPropagation651
     * @tc.desc    Music playlist page partition 1 probe 651
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation651', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 651) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0652
     * @tc.name    MusicEventPropagation652
     * @tc.desc    Music playlist page partition 2 probe 652
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation652', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 652) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0653
     * @tc.name    MusicEventPropagation653
     * @tc.desc    Music playlist page partition 3 probe 653
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation653', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 653) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0654
     * @tc.name    MusicEventPropagation654
     * @tc.desc    Music playlist page partition 4 probe 654
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation654', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 654) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0655
     * @tc.name    MusicEventPropagation655
     * @tc.desc    Music playlist page partition 5 probe 655
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation655', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 655) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0656
     * @tc.name    MusicEventPropagation656
     * @tc.desc    Music playlist page partition 6 probe 656
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicEventPropagation656', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.getPlaylistCount());
      expect(m.getPlaylistByIndex(1000 + 656) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

