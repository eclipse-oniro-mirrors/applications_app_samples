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

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0819
     * @tc.name    MusicAnimationPerformance819
     * @tc.desc    Music repeated offsets 819 probe 819
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance819', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 19);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 819) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0820
     * @tc.name    MusicAnimationPerformance820
     * @tc.desc    Music repeated offsets 820 probe 820
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance820', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 20);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 820) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0821
     * @tc.name    MusicAnimationPerformance821
     * @tc.desc    Music repeated offsets 821 probe 821
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance821', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 21);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 821) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0822
     * @tc.name    MusicAnimationPerformance822
     * @tc.desc    Music repeated offsets 822 probe 822
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance822', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 22);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 822) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0823
     * @tc.name    MusicAnimationPerformance823
     * @tc.desc    Music repeated offsets 823 probe 823
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance823', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 23);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 823) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0824
     * @tc.name    MusicAnimationPerformance824
     * @tc.desc    Music repeated offsets 824 probe 824
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance824', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 24);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 824) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0825
     * @tc.name    MusicAnimationPerformance825
     * @tc.desc    Music repeated offsets 825 probe 825
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance825', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 25);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 825) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0826
     * @tc.name    MusicAnimationPerformance826
     * @tc.desc    Music repeated offsets 826 probe 826
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance826', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 26);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 826) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0827
     * @tc.name    MusicAnimationPerformance827
     * @tc.desc    Music repeated offsets 827 probe 827
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance827', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 27);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 827) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0828
     * @tc.name    MusicAnimationPerformance828
     * @tc.desc    Music repeated offsets 828 probe 828
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance828', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 28);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 828) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0829
     * @tc.name    MusicAnimationPerformance829
     * @tc.desc    Music repeated offsets 829 probe 829
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance829', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 29);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 829) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0830
     * @tc.name    MusicAnimationPerformance830
     * @tc.desc    Music repeated offsets 830 probe 830
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance830', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 30);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 830) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0831
     * @tc.name    MusicAnimationPerformance831
     * @tc.desc    Music repeated offsets 831 probe 831
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance831', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 31);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 831) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0832
     * @tc.name    MusicAnimationPerformance832
     * @tc.desc    Music repeated offsets 832 probe 832
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance832', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 32);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 832) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0833
     * @tc.name    MusicAnimationPerformance833
     * @tc.desc    Music repeated offsets 833 probe 833
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance833', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 33);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 833) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0834
     * @tc.name    MusicAnimationPerformance834
     * @tc.desc    Music repeated offsets 834 probe 834
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance834', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 34);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 834) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0835
     * @tc.name    MusicAnimationPerformance835
     * @tc.desc    Music repeated offsets 835 probe 835
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance835', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 35);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 835) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0836
     * @tc.name    MusicAnimationPerformance836
     * @tc.desc    Music repeated offsets 836 probe 836
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance836', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 36);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 836) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0837
     * @tc.name    MusicAnimationPerformance837
     * @tc.desc    Music repeated offsets 837 probe 837
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance837', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 37);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 837) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0838
     * @tc.name    MusicAnimationPerformance838
     * @tc.desc    Music repeated offsets 838 probe 838
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance838', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 38);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 838) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0839
     * @tc.name    MusicAnimationPerformance839
     * @tc.desc    Music repeated offsets 839 probe 839
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance839', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 39);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 839) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0840
     * @tc.name    MusicAnimationPerformance840
     * @tc.desc    Music repeated offsets 840 probe 840
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance840', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 40);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 840) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0841
     * @tc.name    MusicAnimationPerformance841
     * @tc.desc    Music repeated offsets 841 probe 841
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance841', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 41);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 841) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0842
     * @tc.name    MusicAnimationPerformance842
     * @tc.desc    Music repeated offsets 842 probe 842
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance842', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 42);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 842) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0843
     * @tc.name    MusicAnimationPerformance843
     * @tc.desc    Music repeated offsets 843 probe 843
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance843', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 43);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 843) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0844
     * @tc.name    MusicAnimationPerformance844
     * @tc.desc    Music repeated offsets 844 probe 844
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance844', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 44);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 844) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0845
     * @tc.name    MusicAnimationPerformance845
     * @tc.desc    Music repeated offsets 845 probe 845
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance845', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 45);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 845) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0846
     * @tc.name    MusicAnimationPerformance846
     * @tc.desc    Music repeated offsets 846 probe 846
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance846', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 46);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 846) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0847
     * @tc.name    MusicAnimationPerformance847
     * @tc.desc    Music repeated offsets 847 probe 847
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance847', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 47);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 847) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0848
     * @tc.name    MusicAnimationPerformance848
     * @tc.desc    Music repeated offsets 848 probe 848
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance848', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 48);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 848) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0849
     * @tc.name    MusicAnimationPerformance849
     * @tc.desc    Music repeated offsets 849 probe 849
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance849', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 49);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 849) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0850
     * @tc.name    MusicAnimationPerformance850
     * @tc.desc    Music repeated offsets 850 probe 850
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance850', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 0);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 850) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0851
     * @tc.name    MusicAnimationPerformance851
     * @tc.desc    Music repeated offsets 851 probe 851
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance851', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 1);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 851) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0852
     * @tc.name    MusicAnimationPerformance852
     * @tc.desc    Music repeated offsets 852 probe 852
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance852', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 2);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 852) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0853
     * @tc.name    MusicAnimationPerformance853
     * @tc.desc    Music repeated offsets 853 probe 853
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance853', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 3);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 853) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0854
     * @tc.name    MusicAnimationPerformance854
     * @tc.desc    Music repeated offsets 854 probe 854
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance854', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 4);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 854) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0855
     * @tc.name    MusicAnimationPerformance855
     * @tc.desc    Music repeated offsets 855 probe 855
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance855', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 5);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 855) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0856
     * @tc.name    MusicAnimationPerformance856
     * @tc.desc    Music repeated offsets 856 probe 856
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance856', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 6);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 856) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0857
     * @tc.name    MusicAnimationPerformance857
     * @tc.desc    Music repeated offsets 857 probe 857
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance857', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 7);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 857) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0858
     * @tc.name    MusicAnimationPerformance858
     * @tc.desc    Music repeated offsets 858 probe 858
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance858', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 8);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 858) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0859
     * @tc.name    MusicAnimationPerformance859
     * @tc.desc    Music repeated offsets 859 probe 859
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance859', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 9);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 859) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0860
     * @tc.name    MusicAnimationPerformance860
     * @tc.desc    Music repeated offsets 860 probe 860
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance860', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 10);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 860) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0861
     * @tc.name    MusicAnimationPerformance861
     * @tc.desc    Music repeated offsets 861 probe 861
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance861', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 11);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 861) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0862
     * @tc.name    MusicAnimationPerformance862
     * @tc.desc    Music repeated offsets 862 probe 862
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance862', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 12);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 862) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0863
     * @tc.name    MusicAnimationPerformance863
     * @tc.desc    Music repeated offsets 863 probe 863
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance863', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 13);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 863) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0864
     * @tc.name    MusicAnimationPerformance864
     * @tc.desc    Music repeated offsets 864 probe 864
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance864', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 14);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 864) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0865
     * @tc.name    MusicAnimationPerformance865
     * @tc.desc    Music repeated offsets 865 probe 865
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance865', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 15);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 865) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0866
     * @tc.name    MusicAnimationPerformance866
     * @tc.desc    Music repeated offsets 866 probe 866
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance866', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 16);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 866) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0867
     * @tc.name    MusicAnimationPerformance867
     * @tc.desc    Music repeated offsets 867 probe 867
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance867', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 17);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 867) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0868
     * @tc.name    MusicAnimationPerformance868
     * @tc.desc    Music repeated offsets 868 probe 868
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance868', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 18);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 868) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0869
     * @tc.name    MusicAnimationPerformance869
     * @tc.desc    Music repeated offsets 869 probe 869
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance869', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 19);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 869) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0870
     * @tc.name    MusicAnimationPerformance870
     * @tc.desc    Music repeated offsets 870 probe 870
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance870', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 20);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 870) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0871
     * @tc.name    MusicAnimationPerformance871
     * @tc.desc    Music repeated offsets 871 probe 871
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance871', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 21);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 871) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0872
     * @tc.name    MusicAnimationPerformance872
     * @tc.desc    Music repeated offsets 872 probe 872
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance872', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 22);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 872) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0873
     * @tc.name    MusicAnimationPerformance873
     * @tc.desc    Music repeated offsets 873 probe 873
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance873', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 23);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 873) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0874
     * @tc.name    MusicAnimationPerformance874
     * @tc.desc    Music repeated offsets 874 probe 874
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance874', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 24);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 874) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0875
     * @tc.name    MusicAnimationPerformance875
     * @tc.desc    Music repeated offsets 875 probe 875
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance875', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 25);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 875) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0876
     * @tc.name    MusicAnimationPerformance876
     * @tc.desc    Music repeated offsets 876 probe 876
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance876', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 26);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 876) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0877
     * @tc.name    MusicAnimationPerformance877
     * @tc.desc    Music repeated offsets 877 probe 877
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance877', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 27);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 877) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0878
     * @tc.name    MusicAnimationPerformance878
     * @tc.desc    Music repeated offsets 878 probe 878
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance878', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 28);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 878) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0879
     * @tc.name    MusicAnimationPerformance879
     * @tc.desc    Music repeated offsets 879 probe 879
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance879', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 29);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 879) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0880
     * @tc.name    MusicAnimationPerformance880
     * @tc.desc    Music repeated offsets 880 probe 880
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance880', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 30);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 880) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0881
     * @tc.name    MusicAnimationPerformance881
     * @tc.desc    Music repeated offsets 881 probe 881
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance881', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 31);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 881) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0882
     * @tc.name    MusicAnimationPerformance882
     * @tc.desc    Music repeated offsets 882 probe 882
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance882', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 32);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 882) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0883
     * @tc.name    MusicAnimationPerformance883
     * @tc.desc    Music repeated offsets 883 probe 883
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance883', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 33);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 883) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0884
     * @tc.name    MusicAnimationPerformance884
     * @tc.desc    Music repeated offsets 884 probe 884
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance884', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 34);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 884) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0885
     * @tc.name    MusicAnimationPerformance885
     * @tc.desc    Music repeated offsets 885 probe 885
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance885', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 35);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 885) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0886
     * @tc.name    MusicAnimationPerformance886
     * @tc.desc    Music repeated offsets 886 probe 886
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance886', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 36);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 886) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0887
     * @tc.name    MusicAnimationPerformance887
     * @tc.desc    Music repeated offsets 887 probe 887
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance887', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 37);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 887) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0888
     * @tc.name    MusicAnimationPerformance888
     * @tc.desc    Music repeated offsets 888 probe 888
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance888', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 38);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 888) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0889
     * @tc.name    MusicAnimationPerformance889
     * @tc.desc    Music repeated offsets 889 probe 889
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance889', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 39);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 889) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0890
     * @tc.name    MusicAnimationPerformance890
     * @tc.desc    Music repeated offsets 890 probe 890
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance890', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 40);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 890) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0891
     * @tc.name    MusicAnimationPerformance891
     * @tc.desc    Music repeated offsets 891 probe 891
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance891', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 41);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 891) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0892
     * @tc.name    MusicAnimationPerformance892
     * @tc.desc    Music repeated offsets 892 probe 892
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance892', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 42);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 892) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0893
     * @tc.name    MusicAnimationPerformance893
     * @tc.desc    Music repeated offsets 893 probe 893
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance893', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 43);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 893) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0894
     * @tc.name    MusicAnimationPerformance894
     * @tc.desc    Music repeated offsets 894 probe 894
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance894', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 44);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 894) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0895
     * @tc.name    MusicAnimationPerformance895
     * @tc.desc    Music repeated offsets 895 probe 895
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance895', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 45);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 895) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0896
     * @tc.name    MusicAnimationPerformance896
     * @tc.desc    Music repeated offsets 896 probe 896
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance896', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 46);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 896) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0897
     * @tc.name    MusicAnimationPerformance897
     * @tc.desc    Music repeated offsets 897 probe 897
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance897', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 47);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 897) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0898
     * @tc.name    MusicAnimationPerformance898
     * @tc.desc    Music repeated offsets 898 probe 898
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance898', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 48);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 898) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0899
     * @tc.name    MusicAnimationPerformance899
     * @tc.desc    Music repeated offsets 899 probe 899
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance899', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 49);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 899) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0900
     * @tc.name    MusicAnimationPerformance900
     * @tc.desc    Music repeated offsets 900 probe 900
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance900', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 0);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 900) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0901
     * @tc.name    MusicAnimationPerformance901
     * @tc.desc    Music repeated offsets 901 probe 901
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance901', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 1);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 901) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0902
     * @tc.name    MusicAnimationPerformance902
     * @tc.desc    Music repeated offsets 902 probe 902
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance902', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 2);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 902) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0903
     * @tc.name    MusicAnimationPerformance903
     * @tc.desc    Music repeated offsets 903 probe 903
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicAnimationPerformance903', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < 15; k++) {
        const off = m.makeOffset(k, 3);
        expect(off.x).assertEqual(k);
      }
      expect(m.getPlaylistByIndex(1000 + 903) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

