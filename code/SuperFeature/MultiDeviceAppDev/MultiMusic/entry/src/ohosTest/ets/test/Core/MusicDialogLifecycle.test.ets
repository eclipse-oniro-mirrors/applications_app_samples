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

export default function musicDialogLifecycleSuite() {
  describe('MusicDialogLifecycleSuite', () => {
    let m: MusicModel = new MusicModel();

    beforeEach(() => {
      m = new MusicModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0001
     * @tc.name    MusicDialogLifecycle001
     * @tc.desc    Music offset accumulation 1 probe 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(1, 1);
      const delta = m.makeOffset(2, 2);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 1) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0002
     * @tc.name    MusicDialogLifecycle002
     * @tc.desc    Music offset accumulation 2 probe 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(2, 2);
      const delta = m.makeOffset(3, 3);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 2) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0003
     * @tc.name    MusicDialogLifecycle003
     * @tc.desc    Music offset accumulation 3 probe 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(3, 3);
      const delta = m.makeOffset(4, 4);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 3) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0004
     * @tc.name    MusicDialogLifecycle004
     * @tc.desc    Music offset accumulation 4 probe 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(4, 4);
      const delta = m.makeOffset(5, 5);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 4) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0005
     * @tc.name    MusicDialogLifecycle005
     * @tc.desc    Music offset accumulation 5 probe 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(5, 5);
      const delta = m.makeOffset(6, 6);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 5) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0006
     * @tc.name    MusicDialogLifecycle006
     * @tc.desc    Music offset accumulation 6 probe 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(6, 6);
      const delta = m.makeOffset(7, 7);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 6) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0007
     * @tc.name    MusicDialogLifecycle007
     * @tc.desc    Music offset accumulation 7 probe 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(7, 7);
      const delta = m.makeOffset(8, 8);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 7) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0008
     * @tc.name    MusicDialogLifecycle008
     * @tc.desc    Music offset accumulation 8 probe 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(8, 8);
      const delta = m.makeOffset(9, 9);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 8) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0009
     * @tc.name    MusicDialogLifecycle009
     * @tc.desc    Music offset accumulation 9 probe 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(9, 9);
      const delta = m.makeOffset(10, 10);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 9) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0010
     * @tc.name    MusicDialogLifecycle010
     * @tc.desc    Music offset accumulation 10 probe 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(10, 10);
      const delta = m.makeOffset(11, 11);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 10) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0011
     * @tc.name    MusicDialogLifecycle011
     * @tc.desc    Music offset accumulation 11 probe 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(11, 11);
      const delta = m.makeOffset(12, 12);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 11) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0012
     * @tc.name    MusicDialogLifecycle012
     * @tc.desc    Music offset accumulation 12 probe 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(12, 12);
      const delta = m.makeOffset(13, 13);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 12) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0013
     * @tc.name    MusicDialogLifecycle013
     * @tc.desc    Music offset accumulation 13 probe 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(13, 13);
      const delta = m.makeOffset(14, 14);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 13) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0014
     * @tc.name    MusicDialogLifecycle014
     * @tc.desc    Music offset accumulation 14 probe 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(14, 14);
      const delta = m.makeOffset(15, 15);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 14) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0015
     * @tc.name    MusicDialogLifecycle015
     * @tc.desc    Music offset accumulation 15 probe 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(15, 15);
      const delta = m.makeOffset(16, 16);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 15) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0016
     * @tc.name    MusicDialogLifecycle016
     * @tc.desc    Music offset accumulation 16 probe 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(16, 16);
      const delta = m.makeOffset(17, 17);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 16) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0017
     * @tc.name    MusicDialogLifecycle017
     * @tc.desc    Music offset accumulation 17 probe 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(17, 17);
      const delta = m.makeOffset(18, 18);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 17) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0018
     * @tc.name    MusicDialogLifecycle018
     * @tc.desc    Music offset accumulation 18 probe 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(18, 18);
      const delta = m.makeOffset(19, 19);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 18) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0019
     * @tc.name    MusicDialogLifecycle019
     * @tc.desc    Music offset accumulation 19 probe 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(19, 19);
      const delta = m.makeOffset(20, 20);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 19) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0020
     * @tc.name    MusicDialogLifecycle020
     * @tc.desc    Music offset accumulation 20 probe 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(20, 20);
      const delta = m.makeOffset(21, 21);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 20) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0021
     * @tc.name    MusicDialogLifecycle021
     * @tc.desc    Music offset accumulation 21 probe 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(21, 21);
      const delta = m.makeOffset(22, 22);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 21) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0022
     * @tc.name    MusicDialogLifecycle022
     * @tc.desc    Music offset accumulation 22 probe 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(22, 22);
      const delta = m.makeOffset(23, 23);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 22) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0023
     * @tc.name    MusicDialogLifecycle023
     * @tc.desc    Music offset accumulation 23 probe 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(23, 23);
      const delta = m.makeOffset(24, 24);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 23) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0024
     * @tc.name    MusicDialogLifecycle024
     * @tc.desc    Music offset accumulation 24 probe 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(24, 24);
      const delta = m.makeOffset(25, 25);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 24) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0025
     * @tc.name    MusicDialogLifecycle025
     * @tc.desc    Music offset accumulation 25 probe 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(25, 25);
      const delta = m.makeOffset(26, 26);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 25) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0026
     * @tc.name    MusicDialogLifecycle026
     * @tc.desc    Music offset accumulation 26 probe 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(26, 26);
      const delta = m.makeOffset(27, 27);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 26) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0027
     * @tc.name    MusicDialogLifecycle027
     * @tc.desc    Music offset accumulation 27 probe 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(27, 27);
      const delta = m.makeOffset(28, 28);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 27) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0028
     * @tc.name    MusicDialogLifecycle028
     * @tc.desc    Music offset accumulation 28 probe 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(28, 28);
      const delta = m.makeOffset(29, 29);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 28) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0029
     * @tc.name    MusicDialogLifecycle029
     * @tc.desc    Music offset accumulation 29 probe 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(29, 29);
      const delta = m.makeOffset(30, 30);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 29) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0030
     * @tc.name    MusicDialogLifecycle030
     * @tc.desc    Music offset accumulation 30 probe 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(30, 30);
      const delta = m.makeOffset(31, 1);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 30) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0031
     * @tc.name    MusicDialogLifecycle031
     * @tc.desc    Music offset accumulation 31 probe 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(31, 31);
      const delta = m.makeOffset(32, 2);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 31) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0032
     * @tc.name    MusicDialogLifecycle032
     * @tc.desc    Music offset accumulation 32 probe 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(32, 32);
      const delta = m.makeOffset(33, 3);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 32) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0033
     * @tc.name    MusicDialogLifecycle033
     * @tc.desc    Music offset accumulation 33 probe 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(33, 33);
      const delta = m.makeOffset(34, 4);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 33) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0034
     * @tc.name    MusicDialogLifecycle034
     * @tc.desc    Music offset accumulation 34 probe 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(34, 34);
      const delta = m.makeOffset(35, 5);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 34) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0035
     * @tc.name    MusicDialogLifecycle035
     * @tc.desc    Music offset accumulation 35 probe 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(35, 35);
      const delta = m.makeOffset(36, 6);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 35) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0036
     * @tc.name    MusicDialogLifecycle036
     * @tc.desc    Music offset accumulation 36 probe 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(36, 36);
      const delta = m.makeOffset(37, 7);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 36) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0037
     * @tc.name    MusicDialogLifecycle037
     * @tc.desc    Music offset accumulation 37 probe 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(37, 37);
      const delta = m.makeOffset(38, 8);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 37) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0038
     * @tc.name    MusicDialogLifecycle038
     * @tc.desc    Music offset accumulation 38 probe 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(38, 38);
      const delta = m.makeOffset(39, 9);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 38) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0039
     * @tc.name    MusicDialogLifecycle039
     * @tc.desc    Music offset accumulation 39 probe 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(39, 39);
      const delta = m.makeOffset(40, 10);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 39) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0040
     * @tc.name    MusicDialogLifecycle040
     * @tc.desc    Music offset accumulation 40 probe 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(40, 40);
      const delta = m.makeOffset(1, 11);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 40) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0041
     * @tc.name    MusicDialogLifecycle041
     * @tc.desc    Music offset accumulation 41 probe 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(41, 41);
      const delta = m.makeOffset(2, 12);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 41) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0042
     * @tc.name    MusicDialogLifecycle042
     * @tc.desc    Music offset accumulation 42 probe 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(42, 42);
      const delta = m.makeOffset(3, 13);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 42) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0043
     * @tc.name    MusicDialogLifecycle043
     * @tc.desc    Music offset accumulation 43 probe 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(43, 43);
      const delta = m.makeOffset(4, 14);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 43) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0044
     * @tc.name    MusicDialogLifecycle044
     * @tc.desc    Music offset accumulation 44 probe 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(44, 44);
      const delta = m.makeOffset(5, 15);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 44) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0045
     * @tc.name    MusicDialogLifecycle045
     * @tc.desc    Music offset accumulation 45 probe 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(45, 45);
      const delta = m.makeOffset(6, 16);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 45) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0046
     * @tc.name    MusicDialogLifecycle046
     * @tc.desc    Music offset accumulation 46 probe 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(46, 46);
      const delta = m.makeOffset(7, 17);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 46) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0047
     * @tc.name    MusicDialogLifecycle047
     * @tc.desc    Music offset accumulation 47 probe 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(47, 47);
      const delta = m.makeOffset(8, 18);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 47) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0048
     * @tc.name    MusicDialogLifecycle048
     * @tc.desc    Music offset accumulation 48 probe 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(48, 48);
      const delta = m.makeOffset(9, 19);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 48) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0049
     * @tc.name    MusicDialogLifecycle049
     * @tc.desc    Music offset accumulation 49 probe 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(49, 49);
      const delta = m.makeOffset(10, 20);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 49) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0050
     * @tc.name    MusicDialogLifecycle050
     * @tc.desc    Music offset accumulation 50 probe 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(50, 50);
      const delta = m.makeOffset(11, 21);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 50) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0051
     * @tc.name    MusicDialogLifecycle051
     * @tc.desc    Music offset accumulation 51 probe 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(51, 51);
      const delta = m.makeOffset(12, 22);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 51) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0052
     * @tc.name    MusicDialogLifecycle052
     * @tc.desc    Music offset accumulation 52 probe 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(52, 52);
      const delta = m.makeOffset(13, 23);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 52) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0053
     * @tc.name    MusicDialogLifecycle053
     * @tc.desc    Music offset accumulation 53 probe 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(53, 53);
      const delta = m.makeOffset(14, 24);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 53) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0054
     * @tc.name    MusicDialogLifecycle054
     * @tc.desc    Music offset accumulation 54 probe 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(54, 54);
      const delta = m.makeOffset(15, 25);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 54) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0055
     * @tc.name    MusicDialogLifecycle055
     * @tc.desc    Music offset accumulation 55 probe 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(55, 55);
      const delta = m.makeOffset(16, 26);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 55) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0056
     * @tc.name    MusicDialogLifecycle056
     * @tc.desc    Music offset accumulation 56 probe 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(56, 56);
      const delta = m.makeOffset(17, 27);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 56) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0057
     * @tc.name    MusicDialogLifecycle057
     * @tc.desc    Music offset accumulation 57 probe 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(57, 57);
      const delta = m.makeOffset(18, 28);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 57) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0058
     * @tc.name    MusicDialogLifecycle058
     * @tc.desc    Music offset accumulation 58 probe 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(58, 58);
      const delta = m.makeOffset(19, 29);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 58) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0059
     * @tc.name    MusicDialogLifecycle059
     * @tc.desc    Music offset accumulation 59 probe 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(59, 59);
      const delta = m.makeOffset(20, 30);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 59) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0060
     * @tc.name    MusicDialogLifecycle060
     * @tc.desc    Music offset accumulation 60 probe 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(60, 60);
      const delta = m.makeOffset(21, 1);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 60) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0061
     * @tc.name    MusicDialogLifecycle061
     * @tc.desc    Music offset accumulation 61 probe 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(61, 61);
      const delta = m.makeOffset(22, 2);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 61) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0062
     * @tc.name    MusicDialogLifecycle062
     * @tc.desc    Music offset accumulation 62 probe 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(62, 62);
      const delta = m.makeOffset(23, 3);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 62) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0063
     * @tc.name    MusicDialogLifecycle063
     * @tc.desc    Music offset accumulation 63 probe 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(63, 63);
      const delta = m.makeOffset(24, 4);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 63) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0064
     * @tc.name    MusicDialogLifecycle064
     * @tc.desc    Music offset accumulation 64 probe 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(64, 64);
      const delta = m.makeOffset(25, 5);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 64) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0065
     * @tc.name    MusicDialogLifecycle065
     * @tc.desc    Music offset accumulation 65 probe 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(65, 65);
      const delta = m.makeOffset(26, 6);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 65) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0066
     * @tc.name    MusicDialogLifecycle066
     * @tc.desc    Music offset accumulation 66 probe 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(66, 66);
      const delta = m.makeOffset(27, 7);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 66) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0067
     * @tc.name    MusicDialogLifecycle067
     * @tc.desc    Music offset accumulation 67 probe 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(67, 67);
      const delta = m.makeOffset(28, 8);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 67) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0068
     * @tc.name    MusicDialogLifecycle068
     * @tc.desc    Music offset accumulation 68 probe 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(68, 68);
      const delta = m.makeOffset(29, 9);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 68) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0069
     * @tc.name    MusicDialogLifecycle069
     * @tc.desc    Music offset accumulation 69 probe 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(69, 69);
      const delta = m.makeOffset(30, 10);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 69) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0070
     * @tc.name    MusicDialogLifecycle070
     * @tc.desc    Music offset accumulation 70 probe 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(70, 70);
      const delta = m.makeOffset(31, 11);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 70) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0071
     * @tc.name    MusicDialogLifecycle071
     * @tc.desc    Music offset accumulation 71 probe 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(71, 71);
      const delta = m.makeOffset(32, 12);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 71) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0072
     * @tc.name    MusicDialogLifecycle072
     * @tc.desc    Music offset accumulation 72 probe 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(72, 72);
      const delta = m.makeOffset(33, 13);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 72) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0073
     * @tc.name    MusicDialogLifecycle073
     * @tc.desc    Music offset accumulation 73 probe 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(73, 73);
      const delta = m.makeOffset(34, 14);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 73) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0074
     * @tc.name    MusicDialogLifecycle074
     * @tc.desc    Music offset accumulation 74 probe 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(74, 74);
      const delta = m.makeOffset(35, 15);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 74) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0075
     * @tc.name    MusicDialogLifecycle075
     * @tc.desc    Music offset accumulation 75 probe 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(75, 75);
      const delta = m.makeOffset(36, 16);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 75) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0076
     * @tc.name    MusicDialogLifecycle076
     * @tc.desc    Music offset accumulation 76 probe 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(76, 76);
      const delta = m.makeOffset(37, 17);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 76) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0077
     * @tc.name    MusicDialogLifecycle077
     * @tc.desc    Music offset accumulation 77 probe 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(77, 77);
      const delta = m.makeOffset(38, 18);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 77) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0078
     * @tc.name    MusicDialogLifecycle078
     * @tc.desc    Music offset accumulation 78 probe 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(78, 78);
      const delta = m.makeOffset(39, 19);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 78) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0079
     * @tc.name    MusicDialogLifecycle079
     * @tc.desc    Music offset accumulation 79 probe 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(79, 79);
      const delta = m.makeOffset(40, 20);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 79) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0080
     * @tc.name    MusicDialogLifecycle080
     * @tc.desc    Music offset accumulation 80 probe 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(80, 80);
      const delta = m.makeOffset(1, 21);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 80) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0081
     * @tc.name    MusicDialogLifecycle081
     * @tc.desc    Music offset accumulation 81 probe 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(81, 81);
      const delta = m.makeOffset(2, 22);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 81) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0082
     * @tc.name    MusicDialogLifecycle082
     * @tc.desc    Music offset accumulation 82 probe 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(82, 82);
      const delta = m.makeOffset(3, 23);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 82) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0083
     * @tc.name    MusicDialogLifecycle083
     * @tc.desc    Music offset accumulation 83 probe 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(83, 83);
      const delta = m.makeOffset(4, 24);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 83) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0084
     * @tc.name    MusicDialogLifecycle084
     * @tc.desc    Music offset accumulation 84 probe 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(84, 84);
      const delta = m.makeOffset(5, 25);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 84) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0085
     * @tc.name    MusicDialogLifecycle085
     * @tc.desc    Music offset accumulation 85 probe 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(85, 85);
      const delta = m.makeOffset(6, 26);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 85) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0086
     * @tc.name    MusicDialogLifecycle086
     * @tc.desc    Music offset accumulation 86 probe 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(86, 86);
      const delta = m.makeOffset(7, 27);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 86) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0087
     * @tc.name    MusicDialogLifecycle087
     * @tc.desc    Music offset accumulation 87 probe 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(87, 87);
      const delta = m.makeOffset(8, 28);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 87) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0088
     * @tc.name    MusicDialogLifecycle088
     * @tc.desc    Music offset accumulation 88 probe 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(88, 88);
      const delta = m.makeOffset(9, 29);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 88) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0089
     * @tc.name    MusicDialogLifecycle089
     * @tc.desc    Music offset accumulation 89 probe 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(89, 89);
      const delta = m.makeOffset(10, 30);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 89) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0090
     * @tc.name    MusicDialogLifecycle090
     * @tc.desc    Music offset accumulation 90 probe 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(90, 90);
      const delta = m.makeOffset(11, 1);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 90) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0091
     * @tc.name    MusicDialogLifecycle091
     * @tc.desc    Music offset accumulation 91 probe 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(91, 91);
      const delta = m.makeOffset(12, 2);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 91) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0092
     * @tc.name    MusicDialogLifecycle092
     * @tc.desc    Music offset accumulation 92 probe 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(92, 92);
      const delta = m.makeOffset(13, 3);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 92) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0093
     * @tc.name    MusicDialogLifecycle093
     * @tc.desc    Music offset accumulation 93 probe 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(93, 93);
      const delta = m.makeOffset(14, 4);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 93) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0094
     * @tc.name    MusicDialogLifecycle094
     * @tc.desc    Music offset accumulation 94 probe 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(94, 94);
      const delta = m.makeOffset(15, 5);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 94) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0095
     * @tc.name    MusicDialogLifecycle095
     * @tc.desc    Music offset accumulation 95 probe 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(95, 95);
      const delta = m.makeOffset(16, 6);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 95) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0096
     * @tc.name    MusicDialogLifecycle096
     * @tc.desc    Music offset accumulation 96 probe 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(96, 96);
      const delta = m.makeOffset(17, 7);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 96) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0097
     * @tc.name    MusicDialogLifecycle097
     * @tc.desc    Music offset accumulation 97 probe 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(97, 97);
      const delta = m.makeOffset(18, 8);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 97) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0098
     * @tc.name    MusicDialogLifecycle098
     * @tc.desc    Music offset accumulation 98 probe 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(98, 98);
      const delta = m.makeOffset(19, 9);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 98) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0099
     * @tc.name    MusicDialogLifecycle099
     * @tc.desc    Music offset accumulation 99 probe 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(99, 99);
      const delta = m.makeOffset(20, 10);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 99) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0100
     * @tc.name    MusicDialogLifecycle100
     * @tc.desc    Music offset accumulation 100 probe 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(100, 100);
      const delta = m.makeOffset(21, 11);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 100) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0101
     * @tc.name    MusicDialogLifecycle101
     * @tc.desc    Music offset accumulation 101 probe 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(101, 101);
      const delta = m.makeOffset(22, 12);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 101) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0102
     * @tc.name    MusicDialogLifecycle102
     * @tc.desc    Music offset accumulation 102 probe 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(102, 102);
      const delta = m.makeOffset(23, 13);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 102) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0103
     * @tc.name    MusicDialogLifecycle103
     * @tc.desc    Music offset accumulation 103 probe 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(103, 103);
      const delta = m.makeOffset(24, 14);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 103) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0104
     * @tc.name    MusicDialogLifecycle104
     * @tc.desc    Music offset accumulation 104 probe 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle104', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(104, 104);
      const delta = m.makeOffset(25, 15);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 104) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0105
     * @tc.name    MusicDialogLifecycle105
     * @tc.desc    Music offset accumulation 105 probe 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle105', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(105, 105);
      const delta = m.makeOffset(26, 16);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 105) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0106
     * @tc.name    MusicDialogLifecycle106
     * @tc.desc    Music offset accumulation 106 probe 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle106', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(106, 106);
      const delta = m.makeOffset(27, 17);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 106) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0107
     * @tc.name    MusicDialogLifecycle107
     * @tc.desc    Music offset accumulation 107 probe 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle107', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(107, 107);
      const delta = m.makeOffset(28, 18);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 107) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0108
     * @tc.name    MusicDialogLifecycle108
     * @tc.desc    Music offset accumulation 108 probe 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle108', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(108, 108);
      const delta = m.makeOffset(29, 19);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 108) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0109
     * @tc.name    MusicDialogLifecycle109
     * @tc.desc    Music offset accumulation 109 probe 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle109', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(109, 109);
      const delta = m.makeOffset(30, 20);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 109) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0110
     * @tc.name    MusicDialogLifecycle110
     * @tc.desc    Music offset accumulation 110 probe 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle110', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(110, 110);
      const delta = m.makeOffset(31, 21);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 110) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0111
     * @tc.name    MusicDialogLifecycle111
     * @tc.desc    Music offset accumulation 111 probe 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle111', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(111, 111);
      const delta = m.makeOffset(32, 22);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 111) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0112
     * @tc.name    MusicDialogLifecycle112
     * @tc.desc    Music offset accumulation 112 probe 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle112', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(112, 112);
      const delta = m.makeOffset(33, 23);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 112) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0113
     * @tc.name    MusicDialogLifecycle113
     * @tc.desc    Music offset accumulation 113 probe 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle113', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(113, 113);
      const delta = m.makeOffset(34, 24);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 113) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0114
     * @tc.name    MusicDialogLifecycle114
     * @tc.desc    Music offset accumulation 114 probe 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle114', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(114, 114);
      const delta = m.makeOffset(35, 25);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 114) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0115
     * @tc.name    MusicDialogLifecycle115
     * @tc.desc    Music offset accumulation 115 probe 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle115', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(115, 115);
      const delta = m.makeOffset(36, 26);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 115) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0116
     * @tc.name    MusicDialogLifecycle116
     * @tc.desc    Music offset accumulation 116 probe 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicDialogLifecycle116', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(116, 116);
      const delta = m.makeOffset(37, 27);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 116) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

