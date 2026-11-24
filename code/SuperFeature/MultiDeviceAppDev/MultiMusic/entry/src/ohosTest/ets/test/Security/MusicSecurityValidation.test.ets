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

export default function musicSecurityValidationSuite() {
  describe('MusicSecurityValidationSuite', () => {
    let m: MusicModel = new MusicModel();

    beforeEach(() => {
      m = new MusicModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0904
     * @tc.name    MusicSecurityValidation904
     * @tc.desc    Music out of range playlist 904 probe 904
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation904', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 904) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 904) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0905
     * @tc.name    MusicSecurityValidation905
     * @tc.desc    Music out of range playlist 905 probe 905
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation905', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 905) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 905) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0906
     * @tc.name    MusicSecurityValidation906
     * @tc.desc    Music out of range playlist 906 probe 906
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation906', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 906) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 906) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0907
     * @tc.name    MusicSecurityValidation907
     * @tc.desc    Music out of range playlist 907 probe 907
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation907', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 907) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 907) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0908
     * @tc.name    MusicSecurityValidation908
     * @tc.desc    Music out of range playlist 908 probe 908
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation908', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 908) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 908) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0909
     * @tc.name    MusicSecurityValidation909
     * @tc.desc    Music out of range playlist 909 probe 909
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation909', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 909) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 909) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0910
     * @tc.name    MusicSecurityValidation910
     * @tc.desc    Music out of range playlist 910 probe 910
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation910', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 910) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 910) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0911
     * @tc.name    MusicSecurityValidation911
     * @tc.desc    Music out of range playlist 911 probe 911
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation911', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 911) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 911) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0912
     * @tc.name    MusicSecurityValidation912
     * @tc.desc    Music out of range playlist 912 probe 912
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation912', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 912) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 912) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0913
     * @tc.name    MusicSecurityValidation913
     * @tc.desc    Music out of range playlist 913 probe 913
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation913', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 913) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 913) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0914
     * @tc.name    MusicSecurityValidation914
     * @tc.desc    Music out of range playlist 914 probe 914
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation914', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 914) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 914) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0915
     * @tc.name    MusicSecurityValidation915
     * @tc.desc    Music out of range playlist 915 probe 915
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation915', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 915) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 915) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0916
     * @tc.name    MusicSecurityValidation916
     * @tc.desc    Music out of range playlist 916 probe 916
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation916', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 916) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 916) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0917
     * @tc.name    MusicSecurityValidation917
     * @tc.desc    Music out of range playlist 917 probe 917
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation917', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 917) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 917) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0918
     * @tc.name    MusicSecurityValidation918
     * @tc.desc    Music out of range playlist 918 probe 918
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation918', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 918) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 918) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0919
     * @tc.name    MusicSecurityValidation919
     * @tc.desc    Music out of range playlist 919 probe 919
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation919', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 919) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 919) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0920
     * @tc.name    MusicSecurityValidation920
     * @tc.desc    Music out of range playlist 920 probe 920
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation920', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 920) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 920) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0921
     * @tc.name    MusicSecurityValidation921
     * @tc.desc    Music out of range playlist 921 probe 921
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation921', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 921) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 921) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0922
     * @tc.name    MusicSecurityValidation922
     * @tc.desc    Music out of range playlist 922 probe 922
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation922', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 922) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 922) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0923
     * @tc.name    MusicSecurityValidation923
     * @tc.desc    Music out of range playlist 923 probe 923
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation923', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 923) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 923) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0924
     * @tc.name    MusicSecurityValidation924
     * @tc.desc    Music out of range playlist 924 probe 924
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation924', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 924) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 924) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0925
     * @tc.name    MusicSecurityValidation925
     * @tc.desc    Music out of range playlist 925 probe 925
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation925', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 925) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 925) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0926
     * @tc.name    MusicSecurityValidation926
     * @tc.desc    Music out of range playlist 926 probe 926
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation926', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 926) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 926) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0927
     * @tc.name    MusicSecurityValidation927
     * @tc.desc    Music out of range playlist 927 probe 927
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation927', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 927) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 927) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0928
     * @tc.name    MusicSecurityValidation928
     * @tc.desc    Music out of range playlist 928 probe 928
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation928', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 928) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 928) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0929
     * @tc.name    MusicSecurityValidation929
     * @tc.desc    Music out of range playlist 929 probe 929
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation929', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 929) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 929) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0930
     * @tc.name    MusicSecurityValidation930
     * @tc.desc    Music out of range playlist 930 probe 930
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation930', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 930) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 930) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0931
     * @tc.name    MusicSecurityValidation931
     * @tc.desc    Music out of range playlist 931 probe 931
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation931', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 931) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 931) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0932
     * @tc.name    MusicSecurityValidation932
     * @tc.desc    Music out of range playlist 932 probe 932
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation932', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 932) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 932) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0933
     * @tc.name    MusicSecurityValidation933
     * @tc.desc    Music out of range playlist 933 probe 933
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation933', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 933) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 933) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0934
     * @tc.name    MusicSecurityValidation934
     * @tc.desc    Music out of range playlist 934 probe 934
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation934', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 934) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 934) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0935
     * @tc.name    MusicSecurityValidation935
     * @tc.desc    Music out of range playlist 935 probe 935
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation935', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 935) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 935) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0936
     * @tc.name    MusicSecurityValidation936
     * @tc.desc    Music out of range playlist 936 probe 936
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation936', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 936) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 936) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0937
     * @tc.name    MusicSecurityValidation937
     * @tc.desc    Music out of range playlist 937 probe 937
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation937', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 937) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 937) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0938
     * @tc.name    MusicSecurityValidation938
     * @tc.desc    Music out of range playlist 938 probe 938
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation938', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 938) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 938) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0939
     * @tc.name    MusicSecurityValidation939
     * @tc.desc    Music out of range playlist 939 probe 939
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation939', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 939) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 939) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0940
     * @tc.name    MusicSecurityValidation940
     * @tc.desc    Music out of range playlist 940 probe 940
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation940', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 940) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 940) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0941
     * @tc.name    MusicSecurityValidation941
     * @tc.desc    Music out of range playlist 941 probe 941
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation941', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 941) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 941) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0942
     * @tc.name    MusicSecurityValidation942
     * @tc.desc    Music out of range playlist 942 probe 942
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation942', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 942) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 942) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0943
     * @tc.name    MusicSecurityValidation943
     * @tc.desc    Music out of range playlist 943 probe 943
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation943', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 943) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 943) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0944
     * @tc.name    MusicSecurityValidation944
     * @tc.desc    Music out of range playlist 944 probe 944
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation944', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 944) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 944) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0945
     * @tc.name    MusicSecurityValidation945
     * @tc.desc    Music out of range playlist 945 probe 945
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation945', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 945) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 945) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0946
     * @tc.name    MusicSecurityValidation946
     * @tc.desc    Music out of range playlist 946 probe 946
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation946', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 946) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 946) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0947
     * @tc.name    MusicSecurityValidation947
     * @tc.desc    Music out of range playlist 947 probe 947
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation947', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 947) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 947) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0948
     * @tc.name    MusicSecurityValidation948
     * @tc.desc    Music out of range playlist 948 probe 948
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation948', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 948) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 948) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0949
     * @tc.name    MusicSecurityValidation949
     * @tc.desc    Music out of range playlist 949 probe 949
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation949', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 949) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 949) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0950
     * @tc.name    MusicSecurityValidation950
     * @tc.desc    Music out of range playlist 950 probe 950
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation950', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 950) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 950) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0951
     * @tc.name    MusicSecurityValidation951
     * @tc.desc    Music out of range playlist 951 probe 951
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation951', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 951) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 951) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0952
     * @tc.name    MusicSecurityValidation952
     * @tc.desc    Music out of range playlist 952 probe 952
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation952', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 952) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 952) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0953
     * @tc.name    MusicSecurityValidation953
     * @tc.desc    Music out of range playlist 953 probe 953
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation953', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 953) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 953) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0954
     * @tc.name    MusicSecurityValidation954
     * @tc.desc    Music out of range playlist 954 probe 954
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation954', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 954) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 954) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0955
     * @tc.name    MusicSecurityValidation955
     * @tc.desc    Music out of range playlist 955 probe 955
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation955', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 955) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 955) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0956
     * @tc.name    MusicSecurityValidation956
     * @tc.desc    Music out of range playlist 956 probe 956
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation956', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 956) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 956) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0957
     * @tc.name    MusicSecurityValidation957
     * @tc.desc    Music out of range playlist 957 probe 957
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation957', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 957) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 957) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0958
     * @tc.name    MusicSecurityValidation958
     * @tc.desc    Music out of range playlist 958 probe 958
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation958', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 958) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 958) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0959
     * @tc.name    MusicSecurityValidation959
     * @tc.desc    Music out of range playlist 959 probe 959
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation959', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 959) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 959) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0960
     * @tc.name    MusicSecurityValidation960
     * @tc.desc    Music out of range playlist 960 probe 960
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation960', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 960) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 960) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0961
     * @tc.name    MusicSecurityValidation961
     * @tc.desc    Music out of range playlist 961 probe 961
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation961', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 961) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 961) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0962
     * @tc.name    MusicSecurityValidation962
     * @tc.desc    Music out of range playlist 962 probe 962
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation962', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 962) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 962) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0963
     * @tc.name    MusicSecurityValidation963
     * @tc.desc    Music out of range playlist 963 probe 963
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation963', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 963) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 963) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0964
     * @tc.name    MusicSecurityValidation964
     * @tc.desc    Music out of range playlist 964 probe 964
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation964', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 964) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 964) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0965
     * @tc.name    MusicSecurityValidation965
     * @tc.desc    Music out of range playlist 965 probe 965
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation965', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 965) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 965) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0966
     * @tc.name    MusicSecurityValidation966
     * @tc.desc    Music out of range playlist 966 probe 966
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation966', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 966) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 966) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0967
     * @tc.name    MusicSecurityValidation967
     * @tc.desc    Music out of range playlist 967 probe 967
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation967', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 967) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 967) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0968
     * @tc.name    MusicSecurityValidation968
     * @tc.desc    Music out of range playlist 968 probe 968
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation968', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 968) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 968) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0969
     * @tc.name    MusicSecurityValidation969
     * @tc.desc    Music out of range playlist 969 probe 969
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation969', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 969) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 969) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0970
     * @tc.name    MusicSecurityValidation970
     * @tc.desc    Music out of range playlist 970 probe 970
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation970', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 970) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 970) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0971
     * @tc.name    MusicSecurityValidation971
     * @tc.desc    Music out of range playlist 971 probe 971
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation971', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 971) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 971) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0972
     * @tc.name    MusicSecurityValidation972
     * @tc.desc    Music out of range playlist 972 probe 972
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation972', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 972) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 972) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0973
     * @tc.name    MusicSecurityValidation973
     * @tc.desc    Music out of range playlist 973 probe 973
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation973', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 973) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 973) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0974
     * @tc.name    MusicSecurityValidation974
     * @tc.desc    Music out of range playlist 974 probe 974
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation974', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 974) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 974) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0975
     * @tc.name    MusicSecurityValidation975
     * @tc.desc    Music out of range playlist 975 probe 975
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation975', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 975) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 975) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0976
     * @tc.name    MusicSecurityValidation976
     * @tc.desc    Music out of range playlist 976 probe 976
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation976', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 976) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 976) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0977
     * @tc.name    MusicSecurityValidation977
     * @tc.desc    Music out of range playlist 977 probe 977
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation977', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 977) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 977) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0978
     * @tc.name    MusicSecurityValidation978
     * @tc.desc    Music out of range playlist 978 probe 978
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation978', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 978) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 978) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0979
     * @tc.name    MusicSecurityValidation979
     * @tc.desc    Music out of range playlist 979 probe 979
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation979', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 979) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 979) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0980
     * @tc.name    MusicSecurityValidation980
     * @tc.desc    Music out of range playlist 980 probe 980
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation980', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 980) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 980) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0981
     * @tc.name    MusicSecurityValidation981
     * @tc.desc    Music out of range playlist 981 probe 981
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation981', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 981) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 981) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0982
     * @tc.name    MusicSecurityValidation982
     * @tc.desc    Music out of range playlist 982 probe 982
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation982', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 982) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 982) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0983
     * @tc.name    MusicSecurityValidation983
     * @tc.desc    Music out of range playlist 983 probe 983
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation983', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 983) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 983) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0984
     * @tc.name    MusicSecurityValidation984
     * @tc.desc    Music out of range playlist 984 probe 984
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation984', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 984) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 984) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0985
     * @tc.name    MusicSecurityValidation985
     * @tc.desc    Music out of range playlist 985 probe 985
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation985', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 985) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 985) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0986
     * @tc.name    MusicSecurityValidation986
     * @tc.desc    Music out of range playlist 986 probe 986
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation986', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 986) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 986) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0987
     * @tc.name    MusicSecurityValidation987
     * @tc.desc    Music out of range playlist 987 probe 987
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation987', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 987) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 987) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0988
     * @tc.name    MusicSecurityValidation988
     * @tc.desc    Music out of range playlist 988 probe 988
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation988', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 988) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 988) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0989
     * @tc.name    MusicSecurityValidation989
     * @tc.desc    Music out of range playlist 989 probe 989
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSecurityValidation989', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getPlaylistByIndex(1000 + 989) === undefined).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 989) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

