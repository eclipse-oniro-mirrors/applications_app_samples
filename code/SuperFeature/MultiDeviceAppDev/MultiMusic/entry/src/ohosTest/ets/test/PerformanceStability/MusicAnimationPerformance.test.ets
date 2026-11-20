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

export default function musicAnimationPerformanceSuite() {
  describe('MusicAnimationPerformanceSuite', () => {
    let m: MusicModel = new MusicModel();

    beforeEach(() => {
      m = new MusicModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0716
     * @tc.name    MusicAnimationPerformance716
     * @tc.desc    Music repeated offsets 716 probe 716
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance716', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 16);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 716) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0717
     * @tc.name    MusicAnimationPerformance717
     * @tc.desc    Music repeated offsets 717 probe 717
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance717', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 17);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 717) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0718
     * @tc.name    MusicAnimationPerformance718
     * @tc.desc    Music repeated offsets 718 probe 718
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance718', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 18);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 718) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0719
     * @tc.name    MusicAnimationPerformance719
     * @tc.desc    Music repeated offsets 719 probe 719
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance719', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 19);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 719) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0720
     * @tc.name    MusicAnimationPerformance720
     * @tc.desc    Music repeated offsets 720 probe 720
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance720', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 20);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 720) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0721
     * @tc.name    MusicAnimationPerformance721
     * @tc.desc    Music repeated offsets 721 probe 721
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance721', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 21);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 721) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0722
     * @tc.name    MusicAnimationPerformance722
     * @tc.desc    Music repeated offsets 722 probe 722
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance722', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 22);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 722) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0723
     * @tc.name    MusicAnimationPerformance723
     * @tc.desc    Music repeated offsets 723 probe 723
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance723', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 23);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 723) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0724
     * @tc.name    MusicAnimationPerformance724
     * @tc.desc    Music repeated offsets 724 probe 724
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance724', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 24);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 724) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0725
     * @tc.name    MusicAnimationPerformance725
     * @tc.desc    Music repeated offsets 725 probe 725
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance725', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 25);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 725) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0726
     * @tc.name    MusicAnimationPerformance726
     * @tc.desc    Music repeated offsets 726 probe 726
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance726', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 26);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 726) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0727
     * @tc.name    MusicAnimationPerformance727
     * @tc.desc    Music repeated offsets 727 probe 727
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance727', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 27);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 727) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0728
     * @tc.name    MusicAnimationPerformance728
     * @tc.desc    Music repeated offsets 728 probe 728
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance728', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 28);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 728) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0729
     * @tc.name    MusicAnimationPerformance729
     * @tc.desc    Music repeated offsets 729 probe 729
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance729', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 29);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 729) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0730
     * @tc.name    MusicAnimationPerformance730
     * @tc.desc    Music repeated offsets 730 probe 730
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance730', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 30);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 730) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0731
     * @tc.name    MusicAnimationPerformance731
     * @tc.desc    Music repeated offsets 731 probe 731
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance731', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 31);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 731) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0732
     * @tc.name    MusicAnimationPerformance732
     * @tc.desc    Music repeated offsets 732 probe 732
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance732', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 32);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 732) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0733
     * @tc.name    MusicAnimationPerformance733
     * @tc.desc    Music repeated offsets 733 probe 733
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance733', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 33);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 733) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0734
     * @tc.name    MusicAnimationPerformance734
     * @tc.desc    Music repeated offsets 734 probe 734
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance734', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 34);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 734) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0735
     * @tc.name    MusicAnimationPerformance735
     * @tc.desc    Music repeated offsets 735 probe 735
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance735', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 35);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 735) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0736
     * @tc.name    MusicAnimationPerformance736
     * @tc.desc    Music repeated offsets 736 probe 736
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance736', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 36);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 736) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0737
     * @tc.name    MusicAnimationPerformance737
     * @tc.desc    Music repeated offsets 737 probe 737
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance737', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 37);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 737) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0738
     * @tc.name    MusicAnimationPerformance738
     * @tc.desc    Music repeated offsets 738 probe 738
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance738', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 38);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 738) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0739
     * @tc.name    MusicAnimationPerformance739
     * @tc.desc    Music repeated offsets 739 probe 739
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance739', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 39);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 739) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0740
     * @tc.name    MusicAnimationPerformance740
     * @tc.desc    Music repeated offsets 740 probe 740
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance740', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 40);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 740) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0741
     * @tc.name    MusicAnimationPerformance741
     * @tc.desc    Music repeated offsets 741 probe 741
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance741', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 41);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 741) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0742
     * @tc.name    MusicAnimationPerformance742
     * @tc.desc    Music repeated offsets 742 probe 742
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance742', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 42);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 742) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0743
     * @tc.name    MusicAnimationPerformance743
     * @tc.desc    Music repeated offsets 743 probe 743
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance743', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 43);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 743) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0744
     * @tc.name    MusicAnimationPerformance744
     * @tc.desc    Music repeated offsets 744 probe 744
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance744', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 44);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 744) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0745
     * @tc.name    MusicAnimationPerformance745
     * @tc.desc    Music repeated offsets 745 probe 745
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance745', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 45);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 745) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0746
     * @tc.name    MusicAnimationPerformance746
     * @tc.desc    Music repeated offsets 746 probe 746
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance746', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 46);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 746) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0747
     * @tc.name    MusicAnimationPerformance747
     * @tc.desc    Music repeated offsets 747 probe 747
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance747', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 47);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 747) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0748
     * @tc.name    MusicAnimationPerformance748
     * @tc.desc    Music repeated offsets 748 probe 748
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance748', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 48);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 748) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0749
     * @tc.name    MusicAnimationPerformance749
     * @tc.desc    Music repeated offsets 749 probe 749
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance749', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 49);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 749) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0750
     * @tc.name    MusicAnimationPerformance750
     * @tc.desc    Music repeated offsets 750 probe 750
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance750', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 0);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 750) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0751
     * @tc.name    MusicAnimationPerformance751
     * @tc.desc    Music repeated offsets 751 probe 751
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance751', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 1);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 751) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0752
     * @tc.name    MusicAnimationPerformance752
     * @tc.desc    Music repeated offsets 752 probe 752
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance752', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 2);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 752) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0753
     * @tc.name    MusicAnimationPerformance753
     * @tc.desc    Music repeated offsets 753 probe 753
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance753', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 3);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 753) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0754
     * @tc.name    MusicAnimationPerformance754
     * @tc.desc    Music repeated offsets 754 probe 754
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance754', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 4);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 754) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0755
     * @tc.name    MusicAnimationPerformance755
     * @tc.desc    Music repeated offsets 755 probe 755
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance755', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 5);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 755) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0756
     * @tc.name    MusicAnimationPerformance756
     * @tc.desc    Music repeated offsets 756 probe 756
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance756', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 6);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 756) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0757
     * @tc.name    MusicAnimationPerformance757
     * @tc.desc    Music repeated offsets 757 probe 757
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance757', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 7);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 757) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0758
     * @tc.name    MusicAnimationPerformance758
     * @tc.desc    Music repeated offsets 758 probe 758
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance758', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 8);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 758) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0759
     * @tc.name    MusicAnimationPerformance759
     * @tc.desc    Music repeated offsets 759 probe 759
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance759', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 9);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 759) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0760
     * @tc.name    MusicAnimationPerformance760
     * @tc.desc    Music repeated offsets 760 probe 760
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance760', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 10);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 760) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0761
     * @tc.name    MusicAnimationPerformance761
     * @tc.desc    Music repeated offsets 761 probe 761
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance761', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 11);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 761) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0762
     * @tc.name    MusicAnimationPerformance762
     * @tc.desc    Music repeated offsets 762 probe 762
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance762', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 12);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 762) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0763
     * @tc.name    MusicAnimationPerformance763
     * @tc.desc    Music repeated offsets 763 probe 763
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance763', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 13);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 763) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0764
     * @tc.name    MusicAnimationPerformance764
     * @tc.desc    Music repeated offsets 764 probe 764
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance764', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 14);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 764) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0765
     * @tc.name    MusicAnimationPerformance765
     * @tc.desc    Music repeated offsets 765 probe 765
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance765', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 15);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 765) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0766
     * @tc.name    MusicAnimationPerformance766
     * @tc.desc    Music repeated offsets 766 probe 766
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance766', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 16);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 766) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0767
     * @tc.name    MusicAnimationPerformance767
     * @tc.desc    Music repeated offsets 767 probe 767
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance767', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 17);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 767) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0768
     * @tc.name    MusicAnimationPerformance768
     * @tc.desc    Music repeated offsets 768 probe 768
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance768', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 18);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 768) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0769
     * @tc.name    MusicAnimationPerformance769
     * @tc.desc    Music repeated offsets 769 probe 769
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance769', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 19);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 769) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0770
     * @tc.name    MusicAnimationPerformance770
     * @tc.desc    Music repeated offsets 770 probe 770
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance770', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 20);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 770) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0771
     * @tc.name    MusicAnimationPerformance771
     * @tc.desc    Music repeated offsets 771 probe 771
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance771', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 21);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 771) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0772
     * @tc.name    MusicAnimationPerformance772
     * @tc.desc    Music repeated offsets 772 probe 772
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance772', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 22);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 772) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0773
     * @tc.name    MusicAnimationPerformance773
     * @tc.desc    Music repeated offsets 773 probe 773
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance773', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 23);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 773) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0774
     * @tc.name    MusicAnimationPerformance774
     * @tc.desc    Music repeated offsets 774 probe 774
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance774', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 24);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 774) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0775
     * @tc.name    MusicAnimationPerformance775
     * @tc.desc    Music repeated offsets 775 probe 775
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance775', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 25);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 775) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0776
     * @tc.name    MusicAnimationPerformance776
     * @tc.desc    Music repeated offsets 776 probe 776
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance776', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 26);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 776) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0777
     * @tc.name    MusicAnimationPerformance777
     * @tc.desc    Music repeated offsets 777 probe 777
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance777', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 27);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 777) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0778
     * @tc.name    MusicAnimationPerformance778
     * @tc.desc    Music repeated offsets 778 probe 778
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance778', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 28);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 778) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0779
     * @tc.name    MusicAnimationPerformance779
     * @tc.desc    Music repeated offsets 779 probe 779
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance779', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 29);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 779) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0780
     * @tc.name    MusicAnimationPerformance780
     * @tc.desc    Music repeated offsets 780 probe 780
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance780', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 30);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 780) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0781
     * @tc.name    MusicAnimationPerformance781
     * @tc.desc    Music repeated offsets 781 probe 781
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance781', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 31);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 781) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0782
     * @tc.name    MusicAnimationPerformance782
     * @tc.desc    Music repeated offsets 782 probe 782
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance782', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 32);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 782) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0783
     * @tc.name    MusicAnimationPerformance783
     * @tc.desc    Music repeated offsets 783 probe 783
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance783', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 33);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 783) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0784
     * @tc.name    MusicAnimationPerformance784
     * @tc.desc    Music repeated offsets 784 probe 784
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance784', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 34);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 784) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0785
     * @tc.name    MusicAnimationPerformance785
     * @tc.desc    Music repeated offsets 785 probe 785
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance785', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 35);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 785) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0786
     * @tc.name    MusicAnimationPerformance786
     * @tc.desc    Music repeated offsets 786 probe 786
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance786', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 36);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 786) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0787
     * @tc.name    MusicAnimationPerformance787
     * @tc.desc    Music repeated offsets 787 probe 787
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance787', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 37);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 787) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0788
     * @tc.name    MusicAnimationPerformance788
     * @tc.desc    Music repeated offsets 788 probe 788
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance788', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 38);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 788) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0789
     * @tc.name    MusicAnimationPerformance789
     * @tc.desc    Music repeated offsets 789 probe 789
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance789', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 39);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 789) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0790
     * @tc.name    MusicAnimationPerformance790
     * @tc.desc    Music repeated offsets 790 probe 790
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance790', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 40);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 790) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0791
     * @tc.name    MusicAnimationPerformance791
     * @tc.desc    Music repeated offsets 791 probe 791
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance791', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 41);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 791) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0792
     * @tc.name    MusicAnimationPerformance792
     * @tc.desc    Music repeated offsets 792 probe 792
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance792', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 42);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 792) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0793
     * @tc.name    MusicAnimationPerformance793
     * @tc.desc    Music repeated offsets 793 probe 793
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance793', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 43);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 793) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0794
     * @tc.name    MusicAnimationPerformance794
     * @tc.desc    Music repeated offsets 794 probe 794
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance794', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 44);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 794) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0795
     * @tc.name    MusicAnimationPerformance795
     * @tc.desc    Music repeated offsets 795 probe 795
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance795', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 45);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 795) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0796
     * @tc.name    MusicAnimationPerformance796
     * @tc.desc    Music repeated offsets 796 probe 796
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance796', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 46);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 796) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0797
     * @tc.name    MusicAnimationPerformance797
     * @tc.desc    Music repeated offsets 797 probe 797
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance797', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 47);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 797) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0798
     * @tc.name    MusicAnimationPerformance798
     * @tc.desc    Music repeated offsets 798 probe 798
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance798', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 48);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 798) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0799
     * @tc.name    MusicAnimationPerformance799
     * @tc.desc    Music repeated offsets 799 probe 799
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance799', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 49);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 799) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0800
     * @tc.name    MusicAnimationPerformance800
     * @tc.desc    Music repeated offsets 800 probe 800
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance800', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 0);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 800) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0801
     * @tc.name    MusicAnimationPerformance801
     * @tc.desc    Music repeated offsets 801 probe 801
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance801', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 1);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 801) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0802
     * @tc.name    MusicAnimationPerformance802
     * @tc.desc    Music repeated offsets 802 probe 802
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance802', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 2);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 802) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0803
     * @tc.name    MusicAnimationPerformance803
     * @tc.desc    Music repeated offsets 803 probe 803
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance803', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 3);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 803) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0804
     * @tc.name    MusicAnimationPerformance804
     * @tc.desc    Music repeated offsets 804 probe 804
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance804', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 4);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 804) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0805
     * @tc.name    MusicAnimationPerformance805
     * @tc.desc    Music repeated offsets 805 probe 805
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance805', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 5);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 805) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0806
     * @tc.name    MusicAnimationPerformance806
     * @tc.desc    Music repeated offsets 806 probe 806
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance806', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 6);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 806) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0807
     * @tc.name    MusicAnimationPerformance807
     * @tc.desc    Music repeated offsets 807 probe 807
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance807', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 7);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 807) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0808
     * @tc.name    MusicAnimationPerformance808
     * @tc.desc    Music repeated offsets 808 probe 808
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance808', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 8);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 808) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0809
     * @tc.name    MusicAnimationPerformance809
     * @tc.desc    Music repeated offsets 809 probe 809
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance809', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 9);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 809) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0810
     * @tc.name    MusicAnimationPerformance810
     * @tc.desc    Music repeated offsets 810 probe 810
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance810', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 10);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 810) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0811
     * @tc.name    MusicAnimationPerformance811
     * @tc.desc    Music repeated offsets 811 probe 811
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance811', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 11);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 811) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0812
     * @tc.name    MusicAnimationPerformance812
     * @tc.desc    Music repeated offsets 812 probe 812
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance812', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 12);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 812) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0813
     * @tc.name    MusicAnimationPerformance813
     * @tc.desc    Music repeated offsets 813 probe 813
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance813', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 13);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 813) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0814
     * @tc.name    MusicAnimationPerformance814
     * @tc.desc    Music repeated offsets 814 probe 814
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance814', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 14);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 814) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0815
     * @tc.name    MusicAnimationPerformance815
     * @tc.desc    Music repeated offsets 815 probe 815
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance815', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 15);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 815) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0816
     * @tc.name    MusicAnimationPerformance816
     * @tc.desc    Music repeated offsets 816 probe 816
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance816', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 16);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 816) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0817
     * @tc.name    MusicAnimationPerformance817
     * @tc.desc    Music repeated offsets 817 probe 817
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance817', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 17);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 817) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0818
     * @tc.name    MusicAnimationPerformance818
     * @tc.desc    Music repeated offsets 818 probe 818
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance818', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 18);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 818) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
