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

export default function musicLifecycleSuite() {
  describe('MusicLifecycleSuite', () => {
    let m: MusicModel = new MusicModel();

    beforeEach(() => {
      m = new MusicModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0657
     * @tc.name    MusicLifecycle657
     * @tc.desc    Music playlist lookup index 9 probe 657
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle657', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 9;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 657) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0658
     * @tc.name    MusicLifecycle658
     * @tc.desc    Music playlist lookup index 10 probe 658
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle658', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 10;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 658) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0659
     * @tc.name    MusicLifecycle659
     * @tc.desc    Music playlist lookup index 11 probe 659
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle659', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 11;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 659) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0660
     * @tc.name    MusicLifecycle660
     * @tc.desc    Music playlist lookup index 0 probe 660
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle660', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 660) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0661
     * @tc.name    MusicLifecycle661
     * @tc.desc    Music playlist lookup index 1 probe 661
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle661', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 661) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0662
     * @tc.name    MusicLifecycle662
     * @tc.desc    Music playlist lookup index 2 probe 662
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle662', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 662) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0663
     * @tc.name    MusicLifecycle663
     * @tc.desc    Music playlist lookup index 3 probe 663
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle663', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 663) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0664
     * @tc.name    MusicLifecycle664
     * @tc.desc    Music playlist lookup index 4 probe 664
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle664', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 664) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0665
     * @tc.name    MusicLifecycle665
     * @tc.desc    Music playlist lookup index 5 probe 665
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle665', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 665) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0666
     * @tc.name    MusicLifecycle666
     * @tc.desc    Music playlist lookup index 6 probe 666
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle666', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 666) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0667
     * @tc.name    MusicLifecycle667
     * @tc.desc    Music playlist lookup index 7 probe 667
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle667', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 667) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0668
     * @tc.name    MusicLifecycle668
     * @tc.desc    Music playlist lookup index 8 probe 668
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle668', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 8;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 668) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0669
     * @tc.name    MusicLifecycle669
     * @tc.desc    Music playlist lookup index 9 probe 669
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle669', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 9;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 669) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0670
     * @tc.name    MusicLifecycle670
     * @tc.desc    Music playlist lookup index 10 probe 670
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle670', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 10;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 670) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0671
     * @tc.name    MusicLifecycle671
     * @tc.desc    Music playlist lookup index 11 probe 671
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle671', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 11;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 671) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0672
     * @tc.name    MusicLifecycle672
     * @tc.desc    Music playlist lookup index 0 probe 672
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle672', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 672) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0673
     * @tc.name    MusicLifecycle673
     * @tc.desc    Music playlist lookup index 1 probe 673
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle673', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 673) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0674
     * @tc.name    MusicLifecycle674
     * @tc.desc    Music playlist lookup index 2 probe 674
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle674', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 674) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0675
     * @tc.name    MusicLifecycle675
     * @tc.desc    Music playlist lookup index 3 probe 675
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle675', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 675) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0676
     * @tc.name    MusicLifecycle676
     * @tc.desc    Music playlist lookup index 4 probe 676
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle676', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 676) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0677
     * @tc.name    MusicLifecycle677
     * @tc.desc    Music playlist lookup index 5 probe 677
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle677', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 677) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0678
     * @tc.name    MusicLifecycle678
     * @tc.desc    Music playlist lookup index 6 probe 678
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle678', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 678) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0679
     * @tc.name    MusicLifecycle679
     * @tc.desc    Music playlist lookup index 7 probe 679
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle679', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 679) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0680
     * @tc.name    MusicLifecycle680
     * @tc.desc    Music playlist lookup index 8 probe 680
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle680', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 8;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 680) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0681
     * @tc.name    MusicLifecycle681
     * @tc.desc    Music playlist lookup index 9 probe 681
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle681', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 9;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 681) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0682
     * @tc.name    MusicLifecycle682
     * @tc.desc    Music playlist lookup index 10 probe 682
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle682', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 10;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 682) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0683
     * @tc.name    MusicLifecycle683
     * @tc.desc    Music playlist lookup index 11 probe 683
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle683', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 11;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 683) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0684
     * @tc.name    MusicLifecycle684
     * @tc.desc    Music playlist lookup index 0 probe 684
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle684', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 684) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0685
     * @tc.name    MusicLifecycle685
     * @tc.desc    Music playlist lookup index 1 probe 685
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle685', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 685) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0686
     * @tc.name    MusicLifecycle686
     * @tc.desc    Music playlist lookup index 2 probe 686
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle686', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 686) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0687
     * @tc.name    MusicLifecycle687
     * @tc.desc    Music playlist lookup index 3 probe 687
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle687', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 687) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0688
     * @tc.name    MusicLifecycle688
     * @tc.desc    Music playlist lookup index 4 probe 688
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle688', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 688) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0689
     * @tc.name    MusicLifecycle689
     * @tc.desc    Music playlist lookup index 5 probe 689
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle689', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 689) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0690
     * @tc.name    MusicLifecycle690
     * @tc.desc    Music playlist lookup index 6 probe 690
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle690', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 690) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0691
     * @tc.name    MusicLifecycle691
     * @tc.desc    Music playlist lookup index 7 probe 691
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle691', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 691) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0692
     * @tc.name    MusicLifecycle692
     * @tc.desc    Music playlist lookup index 8 probe 692
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle692', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 8;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 692) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0693
     * @tc.name    MusicLifecycle693
     * @tc.desc    Music playlist lookup index 9 probe 693
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle693', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 9;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 693) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0694
     * @tc.name    MusicLifecycle694
     * @tc.desc    Music playlist lookup index 10 probe 694
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle694', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 10;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 694) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0695
     * @tc.name    MusicLifecycle695
     * @tc.desc    Music playlist lookup index 11 probe 695
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle695', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 11;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 695) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0696
     * @tc.name    MusicLifecycle696
     * @tc.desc    Music playlist lookup index 0 probe 696
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle696', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 696) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0697
     * @tc.name    MusicLifecycle697
     * @tc.desc    Music playlist lookup index 1 probe 697
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle697', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 697) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0698
     * @tc.name    MusicLifecycle698
     * @tc.desc    Music playlist lookup index 2 probe 698
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle698', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 698) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0699
     * @tc.name    MusicLifecycle699
     * @tc.desc    Music playlist lookup index 3 probe 699
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle699', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 699) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0700
     * @tc.name    MusicLifecycle700
     * @tc.desc    Music playlist lookup index 4 probe 700
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle700', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 700) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0701
     * @tc.name    MusicLifecycle701
     * @tc.desc    Music playlist lookup index 5 probe 701
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle701', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 701) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0702
     * @tc.name    MusicLifecycle702
     * @tc.desc    Music playlist lookup index 6 probe 702
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle702', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 702) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0703
     * @tc.name    MusicLifecycle703
     * @tc.desc    Music playlist lookup index 7 probe 703
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle703', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 703) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0704
     * @tc.name    MusicLifecycle704
     * @tc.desc    Music playlist lookup index 8 probe 704
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle704', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 8;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 704) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0705
     * @tc.name    MusicLifecycle705
     * @tc.desc    Music playlist lookup index 9 probe 705
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle705', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 9;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 705) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0706
     * @tc.name    MusicLifecycle706
     * @tc.desc    Music playlist lookup index 10 probe 706
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle706', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 10;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 706) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0707
     * @tc.name    MusicLifecycle707
     * @tc.desc    Music playlist lookup index 11 probe 707
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle707', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 11;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 707) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0708
     * @tc.name    MusicLifecycle708
     * @tc.desc    Music playlist lookup index 0 probe 708
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle708', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 708) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0709
     * @tc.name    MusicLifecycle709
     * @tc.desc    Music playlist lookup index 1 probe 709
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle709', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 709) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0710
     * @tc.name    MusicLifecycle710
     * @tc.desc    Music playlist lookup index 2 probe 710
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle710', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 710) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0711
     * @tc.name    MusicLifecycle711
     * @tc.desc    Music playlist lookup index 3 probe 711
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle711', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 711) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0712
     * @tc.name    MusicLifecycle712
     * @tc.desc    Music playlist lookup index 4 probe 712
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle712', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 712) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0713
     * @tc.name    MusicLifecycle713
     * @tc.desc    Music playlist lookup index 5 probe 713
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle713', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 713) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0714
     * @tc.name    MusicLifecycle714
     * @tc.desc    Music playlist lookup index 6 probe 714
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle714', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 714) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0715
     * @tc.name    MusicLifecycle715
     * @tc.desc    Music playlist lookup index 7 probe 715
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLifecycle715', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      const item = m.getPlaylistByIndex(idx);
      expect(item !== undefined).assertEqual(true);
      expect(item?.title.length).assertLarger(0);
      expect(m.getPlaylistByIndex(1000 + 715) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

