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

export default function albumLongTermStabilitySuite() {
  describe('AlbumLongTermStabilitySuite', () => {
    let m: AlbumModel = new AlbumModel();

    beforeEach(() => {
      m = new AlbumModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0817
     * @tc.name    AlbumLongTermStability817
     * @tc.desc    Album repeated lookup sweep 817 probe 817
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability817', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 1) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 817) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0818
     * @tc.name    AlbumLongTermStability818
     * @tc.desc    Album repeated lookup sweep 818 probe 818
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability818', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 2) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 818) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0819
     * @tc.name    AlbumLongTermStability819
     * @tc.desc    Album repeated lookup sweep 819 probe 819
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability819', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 3) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 819) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0820
     * @tc.name    AlbumLongTermStability820
     * @tc.desc    Album repeated lookup sweep 820 probe 820
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability820', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 4) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 820) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0821
     * @tc.name    AlbumLongTermStability821
     * @tc.desc    Album repeated lookup sweep 821 probe 821
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability821', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 5) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 821) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0822
     * @tc.name    AlbumLongTermStability822
     * @tc.desc    Album repeated lookup sweep 822 probe 822
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability822', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 6) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 822) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0823
     * @tc.name    AlbumLongTermStability823
     * @tc.desc    Album repeated lookup sweep 823 probe 823
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability823', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 7) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 823) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0824
     * @tc.name    AlbumLongTermStability824
     * @tc.desc    Album repeated lookup sweep 824 probe 824
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability824', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 8) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 824) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0825
     * @tc.name    AlbumLongTermStability825
     * @tc.desc    Album repeated lookup sweep 825 probe 825
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability825', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 9) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 825) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0826
     * @tc.name    AlbumLongTermStability826
     * @tc.desc    Album repeated lookup sweep 826 probe 826
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability826', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 10) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 826) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0827
     * @tc.name    AlbumLongTermStability827
     * @tc.desc    Album repeated lookup sweep 827 probe 827
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability827', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 11) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 827) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0828
     * @tc.name    AlbumLongTermStability828
     * @tc.desc    Album repeated lookup sweep 828 probe 828
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability828', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 12) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 828) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0829
     * @tc.name    AlbumLongTermStability829
     * @tc.desc    Album repeated lookup sweep 829 probe 829
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability829', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 13) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 829) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0830
     * @tc.name    AlbumLongTermStability830
     * @tc.desc    Album repeated lookup sweep 830 probe 830
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability830', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 14) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 830) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0831
     * @tc.name    AlbumLongTermStability831
     * @tc.desc    Album repeated lookup sweep 831 probe 831
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability831', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 15) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 831) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0832
     * @tc.name    AlbumLongTermStability832
     * @tc.desc    Album repeated lookup sweep 832 probe 832
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability832', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 16) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 832) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0833
     * @tc.name    AlbumLongTermStability833
     * @tc.desc    Album repeated lookup sweep 833 probe 833
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability833', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 17) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 833) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0834
     * @tc.name    AlbumLongTermStability834
     * @tc.desc    Album repeated lookup sweep 834 probe 834
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability834', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 18) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 834) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0835
     * @tc.name    AlbumLongTermStability835
     * @tc.desc    Album repeated lookup sweep 835 probe 835
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability835', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 19) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 835) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0836
     * @tc.name    AlbumLongTermStability836
     * @tc.desc    Album repeated lookup sweep 836 probe 836
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability836', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 20) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 836) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0837
     * @tc.name    AlbumLongTermStability837
     * @tc.desc    Album repeated lookup sweep 837 probe 837
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability837', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 21) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 837) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0838
     * @tc.name    AlbumLongTermStability838
     * @tc.desc    Album repeated lookup sweep 838 probe 838
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability838', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 22) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 838) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0839
     * @tc.name    AlbumLongTermStability839
     * @tc.desc    Album repeated lookup sweep 839 probe 839
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability839', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 23) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 839) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0840
     * @tc.name    AlbumLongTermStability840
     * @tc.desc    Album repeated lookup sweep 840 probe 840
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability840', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 0) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 840) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0841
     * @tc.name    AlbumLongTermStability841
     * @tc.desc    Album repeated lookup sweep 841 probe 841
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability841', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 1) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 841) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0842
     * @tc.name    AlbumLongTermStability842
     * @tc.desc    Album repeated lookup sweep 842 probe 842
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability842', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 2) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 842) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0843
     * @tc.name    AlbumLongTermStability843
     * @tc.desc    Album repeated lookup sweep 843 probe 843
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability843', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 3) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 843) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0844
     * @tc.name    AlbumLongTermStability844
     * @tc.desc    Album repeated lookup sweep 844 probe 844
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability844', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 4) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 844) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0845
     * @tc.name    AlbumLongTermStability845
     * @tc.desc    Album repeated lookup sweep 845 probe 845
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability845', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 5) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 845) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0846
     * @tc.name    AlbumLongTermStability846
     * @tc.desc    Album repeated lookup sweep 846 probe 846
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability846', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 6) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 846) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0847
     * @tc.name    AlbumLongTermStability847
     * @tc.desc    Album repeated lookup sweep 847 probe 847
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability847', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 7) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 847) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0848
     * @tc.name    AlbumLongTermStability848
     * @tc.desc    Album repeated lookup sweep 848 probe 848
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability848', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 8) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 848) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0849
     * @tc.name    AlbumLongTermStability849
     * @tc.desc    Album repeated lookup sweep 849 probe 849
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability849', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 9) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 849) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0850
     * @tc.name    AlbumLongTermStability850
     * @tc.desc    Album repeated lookup sweep 850 probe 850
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability850', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 10) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 850) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0851
     * @tc.name    AlbumLongTermStability851
     * @tc.desc    Album repeated lookup sweep 851 probe 851
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability851', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 11) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 851) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0852
     * @tc.name    AlbumLongTermStability852
     * @tc.desc    Album repeated lookup sweep 852 probe 852
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability852', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 12) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 852) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0853
     * @tc.name    AlbumLongTermStability853
     * @tc.desc    Album repeated lookup sweep 853 probe 853
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability853', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 13) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 853) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0854
     * @tc.name    AlbumLongTermStability854
     * @tc.desc    Album repeated lookup sweep 854 probe 854
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability854', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 14) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 854) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0855
     * @tc.name    AlbumLongTermStability855
     * @tc.desc    Album repeated lookup sweep 855 probe 855
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability855', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 15) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 855) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0856
     * @tc.name    AlbumLongTermStability856
     * @tc.desc    Album repeated lookup sweep 856 probe 856
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability856', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 16) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 856) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0857
     * @tc.name    AlbumLongTermStability857
     * @tc.desc    Album repeated lookup sweep 857 probe 857
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability857', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 17) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 857) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0858
     * @tc.name    AlbumLongTermStability858
     * @tc.desc    Album repeated lookup sweep 858 probe 858
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability858', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 18) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 858) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0859
     * @tc.name    AlbumLongTermStability859
     * @tc.desc    Album repeated lookup sweep 859 probe 859
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability859', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 19) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 859) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0860
     * @tc.name    AlbumLongTermStability860
     * @tc.desc    Album repeated lookup sweep 860 probe 860
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability860', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 20) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 860) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0861
     * @tc.name    AlbumLongTermStability861
     * @tc.desc    Album repeated lookup sweep 861 probe 861
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability861', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 21) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 861) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0862
     * @tc.name    AlbumLongTermStability862
     * @tc.desc    Album repeated lookup sweep 862 probe 862
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability862', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 22) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 862) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0863
     * @tc.name    AlbumLongTermStability863
     * @tc.desc    Album repeated lookup sweep 863 probe 863
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability863', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 23) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 863) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0864
     * @tc.name    AlbumLongTermStability864
     * @tc.desc    Album repeated lookup sweep 864 probe 864
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability864', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 0) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 864) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0865
     * @tc.name    AlbumLongTermStability865
     * @tc.desc    Album repeated lookup sweep 865 probe 865
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumLongTermStability865', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTrackCount(); k++) {
        const track = m.getTracks()[(k + 1) % m.getTrackCount()];
        expect(track.id > 0).assertEqual(true);
      }
      expect(m.getTrackById(1000 + 865) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

