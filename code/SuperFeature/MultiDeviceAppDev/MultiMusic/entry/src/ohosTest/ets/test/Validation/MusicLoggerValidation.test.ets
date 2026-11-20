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

export default function musicLoggerValidationSuite() {
  describe('MusicLoggerValidationSuite', () => {
    let m: MusicModel = new MusicModel();

    beforeEach(() => {
      m = new MusicModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0990
     * @tc.name    MusicLoggerValidation990
     * @tc.desc    Music offset clamp within 491 probe 990
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation990', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 491;
      const clamped = m.clampOffset(m.makeOffset(-1, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 990) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0991
     * @tc.name    MusicLoggerValidation991
     * @tc.desc    Music padding validity 91 probe 991
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation991', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(91, 191);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 991) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0992
     * @tc.name    MusicLoggerValidation992
     * @tc.desc    Music offset clamp within 493 probe 992
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation992', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 493;
      const clamped = m.clampOffset(m.makeOffset(-3, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 992) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0993
     * @tc.name    MusicLoggerValidation993
     * @tc.desc    Music padding validity 93 probe 993
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation993', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(93, 193);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 993) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0994
     * @tc.name    MusicLoggerValidation994
     * @tc.desc    Music offset clamp within 495 probe 994
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation994', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 495;
      const clamped = m.clampOffset(m.makeOffset(-5, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 994) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0995
     * @tc.name    MusicLoggerValidation995
     * @tc.desc    Music padding validity 95 probe 995
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation995', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(95, 195);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 995) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0996
     * @tc.name    MusicLoggerValidation996
     * @tc.desc    Music offset clamp within 497 probe 996
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation996', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 497;
      const clamped = m.clampOffset(m.makeOffset(-7, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 996) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0997
     * @tc.name    MusicLoggerValidation997
     * @tc.desc    Music padding validity 97 probe 997
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation997', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(97, 197);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 997) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0998
     * @tc.name    MusicLoggerValidation998
     * @tc.desc    Music offset clamp within 499 probe 998
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation998', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 499;
      const clamped = m.clampOffset(m.makeOffset(-9, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 998) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0999
     * @tc.name    MusicLoggerValidation999
     * @tc.desc    Music padding validity 99 probe 999
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation999', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(99, 199);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 999) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1000
     * @tc.name    MusicLoggerValidation1000
     * @tc.desc    Music offset clamp within 1 probe 1000
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1000', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 1;
      const clamped = m.clampOffset(m.makeOffset(-11, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1000) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1001
     * @tc.name    MusicLoggerValidation1001
     * @tc.desc    Music padding validity 101 probe 1001
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(101, 1);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1001) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1002
     * @tc.name    MusicLoggerValidation1002
     * @tc.desc    Music offset clamp within 3 probe 1002
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 3;
      const clamped = m.clampOffset(m.makeOffset(-13, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1002) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1003
     * @tc.name    MusicLoggerValidation1003
     * @tc.desc    Music padding validity 103 probe 1003
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(103, 3);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1003) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1004
     * @tc.name    MusicLoggerValidation1004
     * @tc.desc    Music offset clamp within 5 probe 1004
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 5;
      const clamped = m.clampOffset(m.makeOffset(-15, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1004) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1005
     * @tc.name    MusicLoggerValidation1005
     * @tc.desc    Music padding validity 105 probe 1005
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(105, 5);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1005) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1006
     * @tc.name    MusicLoggerValidation1006
     * @tc.desc    Music offset clamp within 7 probe 1006
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 7;
      const clamped = m.clampOffset(m.makeOffset(-17, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1006) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1007
     * @tc.name    MusicLoggerValidation1007
     * @tc.desc    Music padding validity 107 probe 1007
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(107, 7);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1007) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1008
     * @tc.name    MusicLoggerValidation1008
     * @tc.desc    Music offset clamp within 9 probe 1008
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 9;
      const clamped = m.clampOffset(m.makeOffset(-19, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1008) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1009
     * @tc.name    MusicLoggerValidation1009
     * @tc.desc    Music padding validity 109 probe 1009
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(109, 9);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1009) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1010
     * @tc.name    MusicLoggerValidation1010
     * @tc.desc    Music offset clamp within 11 probe 1010
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 11;
      const clamped = m.clampOffset(m.makeOffset(-21, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1010) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1011
     * @tc.name    MusicLoggerValidation1011
     * @tc.desc    Music padding validity 111 probe 1011
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(111, 11);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1011) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1012
     * @tc.name    MusicLoggerValidation1012
     * @tc.desc    Music offset clamp within 13 probe 1012
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 13;
      const clamped = m.clampOffset(m.makeOffset(-23, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1012) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1013
     * @tc.name    MusicLoggerValidation1013
     * @tc.desc    Music padding validity 113 probe 1013
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(113, 13);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1013) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1014
     * @tc.name    MusicLoggerValidation1014
     * @tc.desc    Music offset clamp within 15 probe 1014
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 15;
      const clamped = m.clampOffset(m.makeOffset(-25, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1014) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1015
     * @tc.name    MusicLoggerValidation1015
     * @tc.desc    Music padding validity 115 probe 1015
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(115, 15);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1015) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1016
     * @tc.name    MusicLoggerValidation1016
     * @tc.desc    Music offset clamp within 17 probe 1016
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 17;
      const clamped = m.clampOffset(m.makeOffset(-27, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1016) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1017
     * @tc.name    MusicLoggerValidation1017
     * @tc.desc    Music padding validity 117 probe 1017
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(117, 17);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1017) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1018
     * @tc.name    MusicLoggerValidation1018
     * @tc.desc    Music offset clamp within 19 probe 1018
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 19;
      const clamped = m.clampOffset(m.makeOffset(-29, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1018) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1019
     * @tc.name    MusicLoggerValidation1019
     * @tc.desc    Music padding validity 119 probe 1019
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(119, 19);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1019) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1020
     * @tc.name    MusicLoggerValidation1020
     * @tc.desc    Music offset clamp within 21 probe 1020
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 21;
      const clamped = m.clampOffset(m.makeOffset(-31, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1020) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1021
     * @tc.name    MusicLoggerValidation1021
     * @tc.desc    Music padding validity 121 probe 1021
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(121, 21);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1021) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1022
     * @tc.name    MusicLoggerValidation1022
     * @tc.desc    Music offset clamp within 23 probe 1022
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 23;
      const clamped = m.clampOffset(m.makeOffset(-33, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1022) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1023
     * @tc.name    MusicLoggerValidation1023
     * @tc.desc    Music padding validity 123 probe 1023
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(123, 23);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1023) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1024
     * @tc.name    MusicLoggerValidation1024
     * @tc.desc    Music offset clamp within 25 probe 1024
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 25;
      const clamped = m.clampOffset(m.makeOffset(-35, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1024) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1025
     * @tc.name    MusicLoggerValidation1025
     * @tc.desc    Music padding validity 125 probe 1025
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(125, 25);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1025) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1026
     * @tc.name    MusicLoggerValidation1026
     * @tc.desc    Music offset clamp within 27 probe 1026
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 27;
      const clamped = m.clampOffset(m.makeOffset(-37, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1026) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1027
     * @tc.name    MusicLoggerValidation1027
     * @tc.desc    Music padding validity 127 probe 1027
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(127, 27);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1027) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1028
     * @tc.name    MusicLoggerValidation1028
     * @tc.desc    Music offset clamp within 29 probe 1028
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 29;
      const clamped = m.clampOffset(m.makeOffset(-39, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1028) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1029
     * @tc.name    MusicLoggerValidation1029
     * @tc.desc    Music padding validity 129 probe 1029
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(129, 29);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1029) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1030
     * @tc.name    MusicLoggerValidation1030
     * @tc.desc    Music offset clamp within 31 probe 1030
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 31;
      const clamped = m.clampOffset(m.makeOffset(-41, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1030) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1031
     * @tc.name    MusicLoggerValidation1031
     * @tc.desc    Music padding validity 131 probe 1031
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(131, 31);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1031) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1032
     * @tc.name    MusicLoggerValidation1032
     * @tc.desc    Music offset clamp within 33 probe 1032
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 33;
      const clamped = m.clampOffset(m.makeOffset(-43, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1032) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1033
     * @tc.name    MusicLoggerValidation1033
     * @tc.desc    Music padding validity 133 probe 1033
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(133, 33);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1033) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1034
     * @tc.name    MusicLoggerValidation1034
     * @tc.desc    Music offset clamp within 35 probe 1034
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 35;
      const clamped = m.clampOffset(m.makeOffset(-45, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1034) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1035
     * @tc.name    MusicLoggerValidation1035
     * @tc.desc    Music padding validity 135 probe 1035
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(135, 35);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1035) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1036
     * @tc.name    MusicLoggerValidation1036
     * @tc.desc    Music offset clamp within 37 probe 1036
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 37;
      const clamped = m.clampOffset(m.makeOffset(-47, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1036) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1037
     * @tc.name    MusicLoggerValidation1037
     * @tc.desc    Music padding validity 137 probe 1037
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(137, 37);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1037) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1038
     * @tc.name    MusicLoggerValidation1038
     * @tc.desc    Music offset clamp within 39 probe 1038
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 39;
      const clamped = m.clampOffset(m.makeOffset(-49, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1038) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1039
     * @tc.name    MusicLoggerValidation1039
     * @tc.desc    Music padding validity 139 probe 1039
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(139, 39);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1039) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1040
     * @tc.name    MusicLoggerValidation1040
     * @tc.desc    Music offset clamp within 41 probe 1040
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 41;
      const clamped = m.clampOffset(m.makeOffset(-51, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1040) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1041
     * @tc.name    MusicLoggerValidation1041
     * @tc.desc    Music padding validity 141 probe 1041
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(141, 41);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1041) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1042
     * @tc.name    MusicLoggerValidation1042
     * @tc.desc    Music offset clamp within 43 probe 1042
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 43;
      const clamped = m.clampOffset(m.makeOffset(-53, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1042) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1043
     * @tc.name    MusicLoggerValidation1043
     * @tc.desc    Music padding validity 143 probe 1043
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(143, 43);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1043) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1044
     * @tc.name    MusicLoggerValidation1044
     * @tc.desc    Music offset clamp within 45 probe 1044
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 45;
      const clamped = m.clampOffset(m.makeOffset(-55, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1044) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1045
     * @tc.name    MusicLoggerValidation1045
     * @tc.desc    Music padding validity 145 probe 1045
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(145, 45);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1045) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1046
     * @tc.name    MusicLoggerValidation1046
     * @tc.desc    Music offset clamp within 47 probe 1046
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 47;
      const clamped = m.clampOffset(m.makeOffset(-57, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1046) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1047
     * @tc.name    MusicLoggerValidation1047
     * @tc.desc    Music padding validity 147 probe 1047
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(147, 47);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1047) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1048
     * @tc.name    MusicLoggerValidation1048
     * @tc.desc    Music offset clamp within 49 probe 1048
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 49;
      const clamped = m.clampOffset(m.makeOffset(-59, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1048) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1049
     * @tc.name    MusicLoggerValidation1049
     * @tc.desc    Music padding validity 149 probe 1049
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(149, 49);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1049) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1050
     * @tc.name    MusicLoggerValidation1050
     * @tc.desc    Music offset clamp within 51 probe 1050
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 51;
      const clamped = m.clampOffset(m.makeOffset(-61, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1050) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1051
     * @tc.name    MusicLoggerValidation1051
     * @tc.desc    Music padding validity 151 probe 1051
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(151, 51);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1051) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1052
     * @tc.name    MusicLoggerValidation1052
     * @tc.desc    Music offset clamp within 53 probe 1052
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 53;
      const clamped = m.clampOffset(m.makeOffset(-63, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1052) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1053
     * @tc.name    MusicLoggerValidation1053
     * @tc.desc    Music padding validity 153 probe 1053
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(153, 53);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1053) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1054
     * @tc.name    MusicLoggerValidation1054
     * @tc.desc    Music offset clamp within 55 probe 1054
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 55;
      const clamped = m.clampOffset(m.makeOffset(-65, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1054) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1055
     * @tc.name    MusicLoggerValidation1055
     * @tc.desc    Music padding validity 155 probe 1055
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(155, 55);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1055) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1056
     * @tc.name    MusicLoggerValidation1056
     * @tc.desc    Music offset clamp within 57 probe 1056
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 57;
      const clamped = m.clampOffset(m.makeOffset(-67, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1056) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1057
     * @tc.name    MusicLoggerValidation1057
     * @tc.desc    Music padding validity 157 probe 1057
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(157, 57);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1057) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1058
     * @tc.name    MusicLoggerValidation1058
     * @tc.desc    Music offset clamp within 59 probe 1058
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 59;
      const clamped = m.clampOffset(m.makeOffset(-69, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1058) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1059
     * @tc.name    MusicLoggerValidation1059
     * @tc.desc    Music padding validity 159 probe 1059
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(159, 59);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1059) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1060
     * @tc.name    MusicLoggerValidation1060
     * @tc.desc    Music offset clamp within 61 probe 1060
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 61;
      const clamped = m.clampOffset(m.makeOffset(-71, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1060) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1061
     * @tc.name    MusicLoggerValidation1061
     * @tc.desc    Music padding validity 161 probe 1061
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(161, 61);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1061) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1062
     * @tc.name    MusicLoggerValidation1062
     * @tc.desc    Music offset clamp within 63 probe 1062
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 63;
      const clamped = m.clampOffset(m.makeOffset(-73, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1062) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1063
     * @tc.name    MusicLoggerValidation1063
     * @tc.desc    Music padding validity 163 probe 1063
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(163, 63);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1063) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1064
     * @tc.name    MusicLoggerValidation1064
     * @tc.desc    Music offset clamp within 65 probe 1064
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 65;
      const clamped = m.clampOffset(m.makeOffset(-75, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1064) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1065
     * @tc.name    MusicLoggerValidation1065
     * @tc.desc    Music padding validity 165 probe 1065
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(165, 65);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1065) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1066
     * @tc.name    MusicLoggerValidation1066
     * @tc.desc    Music offset clamp within 67 probe 1066
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 67;
      const clamped = m.clampOffset(m.makeOffset(-77, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1066) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1067
     * @tc.name    MusicLoggerValidation1067
     * @tc.desc    Music padding validity 167 probe 1067
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(167, 67);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1067) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1068
     * @tc.name    MusicLoggerValidation1068
     * @tc.desc    Music offset clamp within 69 probe 1068
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 69;
      const clamped = m.clampOffset(m.makeOffset(-79, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1068) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1069
     * @tc.name    MusicLoggerValidation1069
     * @tc.desc    Music padding validity 169 probe 1069
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(169, 69);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1069) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1070
     * @tc.name    MusicLoggerValidation1070
     * @tc.desc    Music offset clamp within 71 probe 1070
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 71;
      const clamped = m.clampOffset(m.makeOffset(-81, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1070) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1071
     * @tc.name    MusicLoggerValidation1071
     * @tc.desc    Music padding validity 171 probe 1071
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(171, 71);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1071) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1072
     * @tc.name    MusicLoggerValidation1072
     * @tc.desc    Music offset clamp within 73 probe 1072
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 73;
      const clamped = m.clampOffset(m.makeOffset(-83, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1072) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1073
     * @tc.name    MusicLoggerValidation1073
     * @tc.desc    Music padding validity 173 probe 1073
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(173, 73);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1073) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1074
     * @tc.name    MusicLoggerValidation1074
     * @tc.desc    Music offset clamp within 75 probe 1074
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 75;
      const clamped = m.clampOffset(m.makeOffset(-85, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1074) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1075
     * @tc.name    MusicLoggerValidation1075
     * @tc.desc    Music padding validity 175 probe 1075
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(175, 75);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1075) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1076
     * @tc.name    MusicLoggerValidation1076
     * @tc.desc    Music offset clamp within 77 probe 1076
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 77;
      const clamped = m.clampOffset(m.makeOffset(-87, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1076) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1077
     * @tc.name    MusicLoggerValidation1077
     * @tc.desc    Music padding validity 177 probe 1077
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(177, 77);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1077) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1078
     * @tc.name    MusicLoggerValidation1078
     * @tc.desc    Music offset clamp within 79 probe 1078
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 79;
      const clamped = m.clampOffset(m.makeOffset(-89, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1078) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1079
     * @tc.name    MusicLoggerValidation1079
     * @tc.desc    Music padding validity 179 probe 1079
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(179, 79);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1079) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1080
     * @tc.name    MusicLoggerValidation1080
     * @tc.desc    Music offset clamp within 81 probe 1080
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 81;
      const clamped = m.clampOffset(m.makeOffset(-1, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1080) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1081
     * @tc.name    MusicLoggerValidation1081
     * @tc.desc    Music padding validity 181 probe 1081
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(181, 81);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1081) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1082
     * @tc.name    MusicLoggerValidation1082
     * @tc.desc    Music offset clamp within 83 probe 1082
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 83;
      const clamped = m.clampOffset(m.makeOffset(-3, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1082) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1083
     * @tc.name    MusicLoggerValidation1083
     * @tc.desc    Music padding validity 183 probe 1083
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(183, 83);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1083) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1084
     * @tc.name    MusicLoggerValidation1084
     * @tc.desc    Music offset clamp within 85 probe 1084
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 85;
      const clamped = m.clampOffset(m.makeOffset(-5, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1084) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1085
     * @tc.name    MusicLoggerValidation1085
     * @tc.desc    Music padding validity 185 probe 1085
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(185, 85);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1085) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1086
     * @tc.name    MusicLoggerValidation1086
     * @tc.desc    Music offset clamp within 87 probe 1086
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 87;
      const clamped = m.clampOffset(m.makeOffset(-7, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1086) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1087
     * @tc.name    MusicLoggerValidation1087
     * @tc.desc    Music padding validity 187 probe 1087
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(187, 87);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1087) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1088
     * @tc.name    MusicLoggerValidation1088
     * @tc.desc    Music offset clamp within 89 probe 1088
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 89;
      const clamped = m.clampOffset(m.makeOffset(-9, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1088) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1089
     * @tc.name    MusicLoggerValidation1089
     * @tc.desc    Music padding validity 189 probe 1089
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(189, 89);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1089) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1090
     * @tc.name    MusicLoggerValidation1090
     * @tc.desc    Music offset clamp within 91 probe 1090
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 91;
      const clamped = m.clampOffset(m.makeOffset(-11, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1090) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1091
     * @tc.name    MusicLoggerValidation1091
     * @tc.desc    Music padding validity 191 probe 1091
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(191, 91);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1091) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1092
     * @tc.name    MusicLoggerValidation1092
     * @tc.desc    Music offset clamp within 93 probe 1092
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 93;
      const clamped = m.clampOffset(m.makeOffset(-13, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1092) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1093
     * @tc.name    MusicLoggerValidation1093
     * @tc.desc    Music padding validity 193 probe 1093
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(193, 93);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1093) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1094
     * @tc.name    MusicLoggerValidation1094
     * @tc.desc    Music offset clamp within 95 probe 1094
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 95;
      const clamped = m.clampOffset(m.makeOffset(-15, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1094) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1095
     * @tc.name    MusicLoggerValidation1095
     * @tc.desc    Music padding validity 195 probe 1095
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicLoggerValidation1095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(195, 95);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1095) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
