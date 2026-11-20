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

export default function musicOperationFlowSuite() {
  describe('MusicOperationFlowSuite', () => {
    let m: MusicModel = new MusicModel();

    beforeEach(() => {
      m = new MusicModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0117
     * @tc.name    MusicOperationFlow117
     * @tc.desc    Music offset accumulation 117 probe 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow117', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(117, 117);
      const delta = m.makeOffset(38, 28);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 117) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0118
     * @tc.name    MusicOperationFlow118
     * @tc.desc    Music offset accumulation 118 probe 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow118', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(118, 118);
      const delta = m.makeOffset(39, 29);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 118) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0119
     * @tc.name    MusicOperationFlow119
     * @tc.desc    Music offset accumulation 119 probe 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow119', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(119, 119);
      const delta = m.makeOffset(40, 30);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 119) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0120
     * @tc.name    MusicOperationFlow120
     * @tc.desc    Music offset accumulation 120 probe 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow120', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(120, 120);
      const delta = m.makeOffset(1, 1);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 120) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0121
     * @tc.name    MusicOperationFlow121
     * @tc.desc    Music offset accumulation 121 probe 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow121', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(121, 121);
      const delta = m.makeOffset(2, 2);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 121) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0122
     * @tc.name    MusicOperationFlow122
     * @tc.desc    Music offset accumulation 122 probe 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow122', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(122, 122);
      const delta = m.makeOffset(3, 3);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 122) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0123
     * @tc.name    MusicOperationFlow123
     * @tc.desc    Music offset accumulation 123 probe 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow123', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(123, 123);
      const delta = m.makeOffset(4, 4);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 123) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0124
     * @tc.name    MusicOperationFlow124
     * @tc.desc    Music offset accumulation 124 probe 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow124', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(124, 124);
      const delta = m.makeOffset(5, 5);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 124) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0125
     * @tc.name    MusicOperationFlow125
     * @tc.desc    Music offset accumulation 125 probe 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow125', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(125, 125);
      const delta = m.makeOffset(6, 6);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 125) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0126
     * @tc.name    MusicOperationFlow126
     * @tc.desc    Music offset accumulation 126 probe 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow126', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(126, 126);
      const delta = m.makeOffset(7, 7);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 126) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0127
     * @tc.name    MusicOperationFlow127
     * @tc.desc    Music offset accumulation 127 probe 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow127', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(127, 127);
      const delta = m.makeOffset(8, 8);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 127) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0128
     * @tc.name    MusicOperationFlow128
     * @tc.desc    Music offset accumulation 128 probe 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow128', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(128, 128);
      const delta = m.makeOffset(9, 9);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 128) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0129
     * @tc.name    MusicOperationFlow129
     * @tc.desc    Music offset accumulation 129 probe 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow129', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(129, 129);
      const delta = m.makeOffset(10, 10);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 129) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0130
     * @tc.name    MusicOperationFlow130
     * @tc.desc    Music offset accumulation 130 probe 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow130', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(130, 130);
      const delta = m.makeOffset(11, 11);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 130) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0131
     * @tc.name    MusicOperationFlow131
     * @tc.desc    Music offset accumulation 131 probe 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow131', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(131, 131);
      const delta = m.makeOffset(12, 12);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 131) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0132
     * @tc.name    MusicOperationFlow132
     * @tc.desc    Music offset accumulation 132 probe 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow132', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(132, 132);
      const delta = m.makeOffset(13, 13);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 132) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0133
     * @tc.name    MusicOperationFlow133
     * @tc.desc    Music offset accumulation 133 probe 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow133', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(133, 133);
      const delta = m.makeOffset(14, 14);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 133) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0134
     * @tc.name    MusicOperationFlow134
     * @tc.desc    Music offset accumulation 134 probe 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow134', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(134, 134);
      const delta = m.makeOffset(15, 15);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 134) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0135
     * @tc.name    MusicOperationFlow135
     * @tc.desc    Music offset accumulation 135 probe 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow135', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(135, 135);
      const delta = m.makeOffset(16, 16);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 135) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0136
     * @tc.name    MusicOperationFlow136
     * @tc.desc    Music offset accumulation 136 probe 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow136', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(136, 136);
      const delta = m.makeOffset(17, 17);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 136) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0137
     * @tc.name    MusicOperationFlow137
     * @tc.desc    Music offset accumulation 137 probe 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow137', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(137, 137);
      const delta = m.makeOffset(18, 18);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 137) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0138
     * @tc.name    MusicOperationFlow138
     * @tc.desc    Music offset accumulation 138 probe 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow138', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(138, 138);
      const delta = m.makeOffset(19, 19);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 138) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0139
     * @tc.name    MusicOperationFlow139
     * @tc.desc    Music offset accumulation 139 probe 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow139', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(139, 139);
      const delta = m.makeOffset(20, 20);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 139) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0140
     * @tc.name    MusicOperationFlow140
     * @tc.desc    Music offset accumulation 140 probe 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow140', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(140, 140);
      const delta = m.makeOffset(21, 21);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 140) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0141
     * @tc.name    MusicOperationFlow141
     * @tc.desc    Music offset accumulation 141 probe 141
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow141', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(141, 141);
      const delta = m.makeOffset(22, 22);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 141) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0142
     * @tc.name    MusicOperationFlow142
     * @tc.desc    Music offset accumulation 142 probe 142
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow142', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(142, 142);
      const delta = m.makeOffset(23, 23);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 142) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0143
     * @tc.name    MusicOperationFlow143
     * @tc.desc    Music offset accumulation 143 probe 143
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow143', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(143, 143);
      const delta = m.makeOffset(24, 24);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 143) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0144
     * @tc.name    MusicOperationFlow144
     * @tc.desc    Music offset accumulation 144 probe 144
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow144', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(144, 144);
      const delta = m.makeOffset(25, 25);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 144) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0145
     * @tc.name    MusicOperationFlow145
     * @tc.desc    Music offset accumulation 145 probe 145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow145', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(145, 145);
      const delta = m.makeOffset(26, 26);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 145) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0146
     * @tc.name    MusicOperationFlow146
     * @tc.desc    Music offset accumulation 146 probe 146
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow146', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(146, 146);
      const delta = m.makeOffset(27, 27);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 146) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0147
     * @tc.name    MusicOperationFlow147
     * @tc.desc    Music offset accumulation 147 probe 147
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow147', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(147, 147);
      const delta = m.makeOffset(28, 28);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 147) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0148
     * @tc.name    MusicOperationFlow148
     * @tc.desc    Music offset accumulation 148 probe 148
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow148', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(148, 148);
      const delta = m.makeOffset(29, 29);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 148) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0149
     * @tc.name    MusicOperationFlow149
     * @tc.desc    Music offset accumulation 149 probe 149
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow149', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(149, 149);
      const delta = m.makeOffset(30, 30);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 149) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0150
     * @tc.name    MusicOperationFlow150
     * @tc.desc    Music offset accumulation 150 probe 150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow150', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(150, 150);
      const delta = m.makeOffset(31, 1);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 150) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0151
     * @tc.name    MusicOperationFlow151
     * @tc.desc    Music offset accumulation 151 probe 151
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow151', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(151, 151);
      const delta = m.makeOffset(32, 2);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 151) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0152
     * @tc.name    MusicOperationFlow152
     * @tc.desc    Music offset accumulation 152 probe 152
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow152', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(152, 152);
      const delta = m.makeOffset(33, 3);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 152) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0153
     * @tc.name    MusicOperationFlow153
     * @tc.desc    Music offset accumulation 153 probe 153
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow153', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(153, 153);
      const delta = m.makeOffset(34, 4);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 153) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0154
     * @tc.name    MusicOperationFlow154
     * @tc.desc    Music offset accumulation 154 probe 154
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow154', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(154, 154);
      const delta = m.makeOffset(35, 5);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 154) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0155
     * @tc.name    MusicOperationFlow155
     * @tc.desc    Music offset accumulation 155 probe 155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow155', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(155, 155);
      const delta = m.makeOffset(36, 6);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 155) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0156
     * @tc.name    MusicOperationFlow156
     * @tc.desc    Music offset accumulation 156 probe 156
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow156', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(156, 156);
      const delta = m.makeOffset(37, 7);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 156) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0157
     * @tc.name    MusicOperationFlow157
     * @tc.desc    Music offset accumulation 157 probe 157
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow157', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(157, 157);
      const delta = m.makeOffset(38, 8);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 157) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0158
     * @tc.name    MusicOperationFlow158
     * @tc.desc    Music offset accumulation 158 probe 158
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow158', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(158, 158);
      const delta = m.makeOffset(39, 9);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 158) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0159
     * @tc.name    MusicOperationFlow159
     * @tc.desc    Music offset accumulation 159 probe 159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(159, 159);
      const delta = m.makeOffset(40, 10);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 159) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0160
     * @tc.name    MusicOperationFlow160
     * @tc.desc    Music offset accumulation 160 probe 160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(160, 160);
      const delta = m.makeOffset(1, 11);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 160) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0161
     * @tc.name    MusicOperationFlow161
     * @tc.desc    Music offset accumulation 161 probe 161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(161, 161);
      const delta = m.makeOffset(2, 12);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 161) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0162
     * @tc.name    MusicOperationFlow162
     * @tc.desc    Music offset accumulation 162 probe 162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(162, 162);
      const delta = m.makeOffset(3, 13);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 162) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0163
     * @tc.name    MusicOperationFlow163
     * @tc.desc    Music offset accumulation 163 probe 163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(163, 163);
      const delta = m.makeOffset(4, 14);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 163) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0164
     * @tc.name    MusicOperationFlow164
     * @tc.desc    Music offset accumulation 164 probe 164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(164, 164);
      const delta = m.makeOffset(5, 15);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 164) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0165
     * @tc.name    MusicOperationFlow165
     * @tc.desc    Music offset accumulation 165 probe 165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(165, 165);
      const delta = m.makeOffset(6, 16);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 165) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0166
     * @tc.name    MusicOperationFlow166
     * @tc.desc    Music offset accumulation 166 probe 166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(166, 166);
      const delta = m.makeOffset(7, 17);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 166) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0167
     * @tc.name    MusicOperationFlow167
     * @tc.desc    Music offset accumulation 167 probe 167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(167, 167);
      const delta = m.makeOffset(8, 18);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 167) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0168
     * @tc.name    MusicOperationFlow168
     * @tc.desc    Music offset accumulation 168 probe 168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(168, 168);
      const delta = m.makeOffset(9, 19);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 168) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0169
     * @tc.name    MusicOperationFlow169
     * @tc.desc    Music offset accumulation 169 probe 169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(169, 169);
      const delta = m.makeOffset(10, 20);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 169) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0170
     * @tc.name    MusicOperationFlow170
     * @tc.desc    Music offset accumulation 170 probe 170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(170, 170);
      const delta = m.makeOffset(11, 21);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 170) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0171
     * @tc.name    MusicOperationFlow171
     * @tc.desc    Music offset accumulation 171 probe 171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(171, 171);
      const delta = m.makeOffset(12, 22);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 171) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0172
     * @tc.name    MusicOperationFlow172
     * @tc.desc    Music offset accumulation 172 probe 172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(172, 172);
      const delta = m.makeOffset(13, 23);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 172) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0173
     * @tc.name    MusicOperationFlow173
     * @tc.desc    Music offset accumulation 173 probe 173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(173, 173);
      const delta = m.makeOffset(14, 24);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 173) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0174
     * @tc.name    MusicOperationFlow174
     * @tc.desc    Music offset accumulation 174 probe 174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(174, 174);
      const delta = m.makeOffset(15, 25);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 174) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0175
     * @tc.name    MusicOperationFlow175
     * @tc.desc    Music offset accumulation 175 probe 175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(175, 175);
      const delta = m.makeOffset(16, 26);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 175) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0176
     * @tc.name    MusicOperationFlow176
     * @tc.desc    Music offset accumulation 176 probe 176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(176, 176);
      const delta = m.makeOffset(17, 27);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 176) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0177
     * @tc.name    MusicOperationFlow177
     * @tc.desc    Music offset accumulation 177 probe 177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(177, 177);
      const delta = m.makeOffset(18, 28);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 177) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0178
     * @tc.name    MusicOperationFlow178
     * @tc.desc    Music offset accumulation 178 probe 178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(178, 178);
      const delta = m.makeOffset(19, 29);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 178) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0179
     * @tc.name    MusicOperationFlow179
     * @tc.desc    Music offset accumulation 179 probe 179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(179, 179);
      const delta = m.makeOffset(20, 30);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 179) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0180
     * @tc.name    MusicOperationFlow180
     * @tc.desc    Music offset accumulation 180 probe 180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(180, 180);
      const delta = m.makeOffset(21, 1);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 180) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0181
     * @tc.name    MusicOperationFlow181
     * @tc.desc    Music offset accumulation 181 probe 181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(181, 181);
      const delta = m.makeOffset(22, 2);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 181) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0182
     * @tc.name    MusicOperationFlow182
     * @tc.desc    Music offset accumulation 182 probe 182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(182, 182);
      const delta = m.makeOffset(23, 3);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 182) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0183
     * @tc.name    MusicOperationFlow183
     * @tc.desc    Music offset accumulation 183 probe 183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(183, 183);
      const delta = m.makeOffset(24, 4);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 183) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0184
     * @tc.name    MusicOperationFlow184
     * @tc.desc    Music offset accumulation 184 probe 184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(184, 184);
      const delta = m.makeOffset(25, 5);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 184) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0185
     * @tc.name    MusicOperationFlow185
     * @tc.desc    Music offset accumulation 185 probe 185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(185, 185);
      const delta = m.makeOffset(26, 6);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 185) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0186
     * @tc.name    MusicOperationFlow186
     * @tc.desc    Music offset accumulation 186 probe 186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(186, 186);
      const delta = m.makeOffset(27, 7);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 186) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0187
     * @tc.name    MusicOperationFlow187
     * @tc.desc    Music offset accumulation 187 probe 187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(187, 187);
      const delta = m.makeOffset(28, 8);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 187) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0188
     * @tc.name    MusicOperationFlow188
     * @tc.desc    Music offset accumulation 188 probe 188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(188, 188);
      const delta = m.makeOffset(29, 9);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 188) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0189
     * @tc.name    MusicOperationFlow189
     * @tc.desc    Music offset accumulation 189 probe 189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(189, 189);
      const delta = m.makeOffset(30, 10);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 189) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0190
     * @tc.name    MusicOperationFlow190
     * @tc.desc    Music offset accumulation 190 probe 190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(190, 190);
      const delta = m.makeOffset(31, 11);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 190) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0191
     * @tc.name    MusicOperationFlow191
     * @tc.desc    Music offset accumulation 191 probe 191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(191, 191);
      const delta = m.makeOffset(32, 12);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 191) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0192
     * @tc.name    MusicOperationFlow192
     * @tc.desc    Music offset accumulation 192 probe 192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(192, 192);
      const delta = m.makeOffset(33, 13);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 192) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0193
     * @tc.name    MusicOperationFlow193
     * @tc.desc    Music offset accumulation 193 probe 193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(193, 193);
      const delta = m.makeOffset(34, 14);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 193) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0194
     * @tc.name    MusicOperationFlow194
     * @tc.desc    Music offset accumulation 194 probe 194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(194, 194);
      const delta = m.makeOffset(35, 15);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 194) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0195
     * @tc.name    MusicOperationFlow195
     * @tc.desc    Music offset accumulation 195 probe 195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(195, 195);
      const delta = m.makeOffset(36, 16);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 195) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0196
     * @tc.name    MusicOperationFlow196
     * @tc.desc    Music offset accumulation 196 probe 196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(196, 196);
      const delta = m.makeOffset(37, 17);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 196) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0197
     * @tc.name    MusicOperationFlow197
     * @tc.desc    Music offset accumulation 197 probe 197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(197, 197);
      const delta = m.makeOffset(38, 18);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 197) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0198
     * @tc.name    MusicOperationFlow198
     * @tc.desc    Music offset accumulation 198 probe 198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(198, 198);
      const delta = m.makeOffset(39, 19);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 198) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0199
     * @tc.name    MusicOperationFlow199
     * @tc.desc    Music offset accumulation 199 probe 199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(199, 199);
      const delta = m.makeOffset(40, 20);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 199) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0200
     * @tc.name    MusicOperationFlow200
     * @tc.desc    Music offset accumulation 200 probe 200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(200, 0);
      const delta = m.makeOffset(1, 21);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 200) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0201
     * @tc.name    MusicOperationFlow201
     * @tc.desc    Music offset accumulation 201 probe 201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(201, 1);
      const delta = m.makeOffset(2, 22);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 201) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0202
     * @tc.name    MusicOperationFlow202
     * @tc.desc    Music offset accumulation 202 probe 202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(202, 2);
      const delta = m.makeOffset(3, 23);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 202) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0203
     * @tc.name    MusicOperationFlow203
     * @tc.desc    Music offset accumulation 203 probe 203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(203, 3);
      const delta = m.makeOffset(4, 24);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 203) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0204
     * @tc.name    MusicOperationFlow204
     * @tc.desc    Music offset accumulation 204 probe 204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(204, 4);
      const delta = m.makeOffset(5, 25);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 204) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0205
     * @tc.name    MusicOperationFlow205
     * @tc.desc    Music offset accumulation 205 probe 205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(205, 5);
      const delta = m.makeOffset(6, 26);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 205) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0206
     * @tc.name    MusicOperationFlow206
     * @tc.desc    Music offset accumulation 206 probe 206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(206, 6);
      const delta = m.makeOffset(7, 27);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 206) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0207
     * @tc.name    MusicOperationFlow207
     * @tc.desc    Music offset accumulation 207 probe 207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(207, 7);
      const delta = m.makeOffset(8, 28);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 207) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0208
     * @tc.name    MusicOperationFlow208
     * @tc.desc    Music offset accumulation 208 probe 208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(208, 8);
      const delta = m.makeOffset(9, 29);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 208) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0209
     * @tc.name    MusicOperationFlow209
     * @tc.desc    Music offset accumulation 209 probe 209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(209, 9);
      const delta = m.makeOffset(10, 30);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 209) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0210
     * @tc.name    MusicOperationFlow210
     * @tc.desc    Music offset accumulation 210 probe 210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(210, 10);
      const delta = m.makeOffset(11, 1);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 210) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0211
     * @tc.name    MusicOperationFlow211
     * @tc.desc    Music offset accumulation 211 probe 211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(211, 11);
      const delta = m.makeOffset(12, 2);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 211) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0212
     * @tc.name    MusicOperationFlow212
     * @tc.desc    Music offset accumulation 212 probe 212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(212, 12);
      const delta = m.makeOffset(13, 3);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 212) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0213
     * @tc.name    MusicOperationFlow213
     * @tc.desc    Music offset accumulation 213 probe 213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(213, 13);
      const delta = m.makeOffset(14, 4);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 213) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0214
     * @tc.name    MusicOperationFlow214
     * @tc.desc    Music offset accumulation 214 probe 214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(214, 14);
      const delta = m.makeOffset(15, 5);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 214) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
