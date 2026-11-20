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

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0215
     * @tc.name    MusicOperationFlow215
     * @tc.desc    Music offset accumulation 215 probe 215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(215, 15);
      const delta = m.makeOffset(16, 6);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 215) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0216
     * @tc.name    MusicOperationFlow216
     * @tc.desc    Music offset accumulation 216 probe 216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(216, 16);
      const delta = m.makeOffset(17, 7);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 216) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0217
     * @tc.name    MusicOperationFlow217
     * @tc.desc    Music offset accumulation 217 probe 217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(217, 17);
      const delta = m.makeOffset(18, 8);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 217) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0218
     * @tc.name    MusicOperationFlow218
     * @tc.desc    Music offset accumulation 218 probe 218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(218, 18);
      const delta = m.makeOffset(19, 9);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 218) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0219
     * @tc.name    MusicOperationFlow219
     * @tc.desc    Music offset accumulation 219 probe 219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(219, 19);
      const delta = m.makeOffset(20, 10);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 219) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0220
     * @tc.name    MusicOperationFlow220
     * @tc.desc    Music offset accumulation 220 probe 220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(220, 20);
      const delta = m.makeOffset(21, 11);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 220) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0221
     * @tc.name    MusicOperationFlow221
     * @tc.desc    Music offset accumulation 221 probe 221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(221, 21);
      const delta = m.makeOffset(22, 12);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 221) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0222
     * @tc.name    MusicOperationFlow222
     * @tc.desc    Music offset accumulation 222 probe 222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(222, 22);
      const delta = m.makeOffset(23, 13);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 222) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0223
     * @tc.name    MusicOperationFlow223
     * @tc.desc    Music offset accumulation 223 probe 223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(223, 23);
      const delta = m.makeOffset(24, 14);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 223) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0224
     * @tc.name    MusicOperationFlow224
     * @tc.desc    Music offset accumulation 224 probe 224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(224, 24);
      const delta = m.makeOffset(25, 15);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 224) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0225
     * @tc.name    MusicOperationFlow225
     * @tc.desc    Music offset accumulation 225 probe 225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(225, 25);
      const delta = m.makeOffset(26, 16);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 225) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0226
     * @tc.name    MusicOperationFlow226
     * @tc.desc    Music offset accumulation 226 probe 226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(226, 26);
      const delta = m.makeOffset(27, 17);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 226) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0227
     * @tc.name    MusicOperationFlow227
     * @tc.desc    Music offset accumulation 227 probe 227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(227, 27);
      const delta = m.makeOffset(28, 18);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 227) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0228
     * @tc.name    MusicOperationFlow228
     * @tc.desc    Music offset accumulation 228 probe 228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(228, 28);
      const delta = m.makeOffset(29, 19);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 228) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0229
     * @tc.name    MusicOperationFlow229
     * @tc.desc    Music offset accumulation 229 probe 229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(229, 29);
      const delta = m.makeOffset(30, 20);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 229) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0230
     * @tc.name    MusicOperationFlow230
     * @tc.desc    Music offset accumulation 230 probe 230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow230', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(230, 30);
      const delta = m.makeOffset(31, 21);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 230) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0231
     * @tc.name    MusicOperationFlow231
     * @tc.desc    Music offset accumulation 231 probe 231
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow231', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(231, 31);
      const delta = m.makeOffset(32, 22);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 231) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0232
     * @tc.name    MusicOperationFlow232
     * @tc.desc    Music offset accumulation 232 probe 232
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow232', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(232, 32);
      const delta = m.makeOffset(33, 23);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 232) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0233
     * @tc.name    MusicOperationFlow233
     * @tc.desc    Music offset accumulation 233 probe 233
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow233', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(233, 33);
      const delta = m.makeOffset(34, 24);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 233) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0234
     * @tc.name    MusicOperationFlow234
     * @tc.desc    Music offset accumulation 234 probe 234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(234, 34);
      const delta = m.makeOffset(35, 25);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 234) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0235
     * @tc.name    MusicOperationFlow235
     * @tc.desc    Music offset accumulation 235 probe 235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(235, 35);
      const delta = m.makeOffset(36, 26);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 235) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0236
     * @tc.name    MusicOperationFlow236
     * @tc.desc    Music offset accumulation 236 probe 236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(236, 36);
      const delta = m.makeOffset(37, 27);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 236) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0237
     * @tc.name    MusicOperationFlow237
     * @tc.desc    Music offset accumulation 237 probe 237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(237, 37);
      const delta = m.makeOffset(38, 28);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 237) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0238
     * @tc.name    MusicOperationFlow238
     * @tc.desc    Music offset accumulation 238 probe 238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(238, 38);
      const delta = m.makeOffset(39, 29);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 238) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0239
     * @tc.name    MusicOperationFlow239
     * @tc.desc    Music offset accumulation 239 probe 239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(239, 39);
      const delta = m.makeOffset(40, 30);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 239) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0240
     * @tc.name    MusicOperationFlow240
     * @tc.desc    Music offset accumulation 240 probe 240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(240, 40);
      const delta = m.makeOffset(1, 1);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 240) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0241
     * @tc.name    MusicOperationFlow241
     * @tc.desc    Music offset accumulation 241 probe 241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(241, 41);
      const delta = m.makeOffset(2, 2);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 241) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0242
     * @tc.name    MusicOperationFlow242
     * @tc.desc    Music offset accumulation 242 probe 242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(242, 42);
      const delta = m.makeOffset(3, 3);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 242) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0243
     * @tc.name    MusicOperationFlow243
     * @tc.desc    Music offset accumulation 243 probe 243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(243, 43);
      const delta = m.makeOffset(4, 4);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 243) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0244
     * @tc.name    MusicOperationFlow244
     * @tc.desc    Music offset accumulation 244 probe 244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(244, 44);
      const delta = m.makeOffset(5, 5);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 244) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0245
     * @tc.name    MusicOperationFlow245
     * @tc.desc    Music offset accumulation 245 probe 245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(245, 45);
      const delta = m.makeOffset(6, 6);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 245) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0246
     * @tc.name    MusicOperationFlow246
     * @tc.desc    Music offset accumulation 246 probe 246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(246, 46);
      const delta = m.makeOffset(7, 7);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 246) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0247
     * @tc.name    MusicOperationFlow247
     * @tc.desc    Music offset accumulation 247 probe 247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(247, 47);
      const delta = m.makeOffset(8, 8);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 247) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0248
     * @tc.name    MusicOperationFlow248
     * @tc.desc    Music offset accumulation 248 probe 248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(248, 48);
      const delta = m.makeOffset(9, 9);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 248) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0249
     * @tc.name    MusicOperationFlow249
     * @tc.desc    Music offset accumulation 249 probe 249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(249, 49);
      const delta = m.makeOffset(10, 10);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 249) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0250
     * @tc.name    MusicOperationFlow250
     * @tc.desc    Music offset accumulation 250 probe 250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(250, 50);
      const delta = m.makeOffset(11, 11);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 250) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0251
     * @tc.name    MusicOperationFlow251
     * @tc.desc    Music offset accumulation 251 probe 251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(251, 51);
      const delta = m.makeOffset(12, 12);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 251) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0252
     * @tc.name    MusicOperationFlow252
     * @tc.desc    Music offset accumulation 252 probe 252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(252, 52);
      const delta = m.makeOffset(13, 13);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 252) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0253
     * @tc.name    MusicOperationFlow253
     * @tc.desc    Music offset accumulation 253 probe 253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(253, 53);
      const delta = m.makeOffset(14, 14);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 253) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0254
     * @tc.name    MusicOperationFlow254
     * @tc.desc    Music offset accumulation 254 probe 254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(254, 54);
      const delta = m.makeOffset(15, 15);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 254) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0255
     * @tc.name    MusicOperationFlow255
     * @tc.desc    Music offset accumulation 255 probe 255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(255, 55);
      const delta = m.makeOffset(16, 16);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 255) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0256
     * @tc.name    MusicOperationFlow256
     * @tc.desc    Music offset accumulation 256 probe 256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(256, 56);
      const delta = m.makeOffset(17, 17);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 256) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0257
     * @tc.name    MusicOperationFlow257
     * @tc.desc    Music offset accumulation 257 probe 257
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow257', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(257, 57);
      const delta = m.makeOffset(18, 18);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 257) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0258
     * @tc.name    MusicOperationFlow258
     * @tc.desc    Music offset accumulation 258 probe 258
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow258', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(258, 58);
      const delta = m.makeOffset(19, 19);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 258) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0259
     * @tc.name    MusicOperationFlow259
     * @tc.desc    Music offset accumulation 259 probe 259
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow259', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(259, 59);
      const delta = m.makeOffset(20, 20);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 259) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0260
     * @tc.name    MusicOperationFlow260
     * @tc.desc    Music offset accumulation 260 probe 260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow260', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(260, 60);
      const delta = m.makeOffset(21, 21);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 260) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0261
     * @tc.name    MusicOperationFlow261
     * @tc.desc    Music offset accumulation 261 probe 261
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow261', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(261, 61);
      const delta = m.makeOffset(22, 22);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 261) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0262
     * @tc.name    MusicOperationFlow262
     * @tc.desc    Music offset accumulation 262 probe 262
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow262', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(262, 62);
      const delta = m.makeOffset(23, 23);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 262) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0263
     * @tc.name    MusicOperationFlow263
     * @tc.desc    Music offset accumulation 263 probe 263
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow263', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(263, 63);
      const delta = m.makeOffset(24, 24);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 263) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0264
     * @tc.name    MusicOperationFlow264
     * @tc.desc    Music offset accumulation 264 probe 264
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow264', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(264, 64);
      const delta = m.makeOffset(25, 25);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 264) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0265
     * @tc.name    MusicOperationFlow265
     * @tc.desc    Music offset accumulation 265 probe 265
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow265', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(265, 65);
      const delta = m.makeOffset(26, 26);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 265) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0266
     * @tc.name    MusicOperationFlow266
     * @tc.desc    Music offset accumulation 266 probe 266
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow266', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(266, 66);
      const delta = m.makeOffset(27, 27);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 266) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0267
     * @tc.name    MusicOperationFlow267
     * @tc.desc    Music offset accumulation 267 probe 267
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow267', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(267, 67);
      const delta = m.makeOffset(28, 28);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 267) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0268
     * @tc.name    MusicOperationFlow268
     * @tc.desc    Music offset accumulation 268 probe 268
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow268', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(268, 68);
      const delta = m.makeOffset(29, 29);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 268) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0269
     * @tc.name    MusicOperationFlow269
     * @tc.desc    Music offset accumulation 269 probe 269
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow269', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(269, 69);
      const delta = m.makeOffset(30, 30);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 269) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0270
     * @tc.name    MusicOperationFlow270
     * @tc.desc    Music offset accumulation 270 probe 270
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow270', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(270, 70);
      const delta = m.makeOffset(31, 1);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 270) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0271
     * @tc.name    MusicOperationFlow271
     * @tc.desc    Music offset accumulation 271 probe 271
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow271', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(271, 71);
      const delta = m.makeOffset(32, 2);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 271) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0272
     * @tc.name    MusicOperationFlow272
     * @tc.desc    Music offset accumulation 272 probe 272
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow272', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(272, 72);
      const delta = m.makeOffset(33, 3);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 272) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0273
     * @tc.name    MusicOperationFlow273
     * @tc.desc    Music offset accumulation 273 probe 273
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow273', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(273, 73);
      const delta = m.makeOffset(34, 4);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 273) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0274
     * @tc.name    MusicOperationFlow274
     * @tc.desc    Music offset accumulation 274 probe 274
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow274', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(274, 74);
      const delta = m.makeOffset(35, 5);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 274) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0275
     * @tc.name    MusicOperationFlow275
     * @tc.desc    Music offset accumulation 275 probe 275
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow275', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(275, 75);
      const delta = m.makeOffset(36, 6);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 275) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0276
     * @tc.name    MusicOperationFlow276
     * @tc.desc    Music offset accumulation 276 probe 276
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow276', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(276, 76);
      const delta = m.makeOffset(37, 7);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 276) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0277
     * @tc.name    MusicOperationFlow277
     * @tc.desc    Music offset accumulation 277 probe 277
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow277', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(277, 77);
      const delta = m.makeOffset(38, 8);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 277) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0278
     * @tc.name    MusicOperationFlow278
     * @tc.desc    Music offset accumulation 278 probe 278
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow278', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(278, 78);
      const delta = m.makeOffset(39, 9);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 278) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0279
     * @tc.name    MusicOperationFlow279
     * @tc.desc    Music offset accumulation 279 probe 279
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow279', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(279, 79);
      const delta = m.makeOffset(40, 10);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 279) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0280
     * @tc.name    MusicOperationFlow280
     * @tc.desc    Music offset accumulation 280 probe 280
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow280', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(280, 80);
      const delta = m.makeOffset(1, 11);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 280) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0281
     * @tc.name    MusicOperationFlow281
     * @tc.desc    Music offset accumulation 281 probe 281
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow281', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(281, 81);
      const delta = m.makeOffset(2, 12);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 281) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0282
     * @tc.name    MusicOperationFlow282
     * @tc.desc    Music offset accumulation 282 probe 282
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow282', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(282, 82);
      const delta = m.makeOffset(3, 13);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 282) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0283
     * @tc.name    MusicOperationFlow283
     * @tc.desc    Music offset accumulation 283 probe 283
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow283', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(283, 83);
      const delta = m.makeOffset(4, 14);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 283) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0284
     * @tc.name    MusicOperationFlow284
     * @tc.desc    Music offset accumulation 284 probe 284
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow284', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(284, 84);
      const delta = m.makeOffset(5, 15);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 284) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0285
     * @tc.name    MusicOperationFlow285
     * @tc.desc    Music offset accumulation 285 probe 285
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow285', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(285, 85);
      const delta = m.makeOffset(6, 16);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 285) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0286
     * @tc.name    MusicOperationFlow286
     * @tc.desc    Music offset accumulation 286 probe 286
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow286', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(286, 86);
      const delta = m.makeOffset(7, 17);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 286) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0287
     * @tc.name    MusicOperationFlow287
     * @tc.desc    Music offset accumulation 287 probe 287
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow287', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(287, 87);
      const delta = m.makeOffset(8, 18);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 287) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0288
     * @tc.name    MusicOperationFlow288
     * @tc.desc    Music offset accumulation 288 probe 288
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow288', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(288, 88);
      const delta = m.makeOffset(9, 19);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 288) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0289
     * @tc.name    MusicOperationFlow289
     * @tc.desc    Music offset accumulation 289 probe 289
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow289', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(289, 89);
      const delta = m.makeOffset(10, 20);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 289) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0290
     * @tc.name    MusicOperationFlow290
     * @tc.desc    Music offset accumulation 290 probe 290
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow290', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(290, 90);
      const delta = m.makeOffset(11, 21);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 290) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0291
     * @tc.name    MusicOperationFlow291
     * @tc.desc    Music offset accumulation 291 probe 291
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow291', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(291, 91);
      const delta = m.makeOffset(12, 22);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 291) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0292
     * @tc.name    MusicOperationFlow292
     * @tc.desc    Music offset accumulation 292 probe 292
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow292', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(292, 92);
      const delta = m.makeOffset(13, 23);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 292) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0293
     * @tc.name    MusicOperationFlow293
     * @tc.desc    Music offset accumulation 293 probe 293
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow293', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(293, 93);
      const delta = m.makeOffset(14, 24);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 293) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0294
     * @tc.name    MusicOperationFlow294
     * @tc.desc    Music offset accumulation 294 probe 294
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow294', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(294, 94);
      const delta = m.makeOffset(15, 25);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 294) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0295
     * @tc.name    MusicOperationFlow295
     * @tc.desc    Music offset accumulation 295 probe 295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow295', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(295, 95);
      const delta = m.makeOffset(16, 26);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 295) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0296
     * @tc.name    MusicOperationFlow296
     * @tc.desc    Music offset accumulation 296 probe 296
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow296', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(296, 96);
      const delta = m.makeOffset(17, 27);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 296) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0297
     * @tc.name    MusicOperationFlow297
     * @tc.desc    Music offset accumulation 297 probe 297
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow297', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(297, 97);
      const delta = m.makeOffset(18, 28);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 297) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0298
     * @tc.name    MusicOperationFlow298
     * @tc.desc    Music offset accumulation 298 probe 298
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow298', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(298, 98);
      const delta = m.makeOffset(19, 29);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 298) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0299
     * @tc.name    MusicOperationFlow299
     * @tc.desc    Music offset accumulation 299 probe 299
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow299', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(299, 99);
      const delta = m.makeOffset(20, 30);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 299) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0300
     * @tc.name    MusicOperationFlow300
     * @tc.desc    Music offset accumulation 300 probe 300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow300', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(0, 100);
      const delta = m.makeOffset(21, 1);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 300) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0301
     * @tc.name    MusicOperationFlow301
     * @tc.desc    Music offset accumulation 301 probe 301
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow301', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(1, 101);
      const delta = m.makeOffset(22, 2);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 301) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0302
     * @tc.name    MusicOperationFlow302
     * @tc.desc    Music offset accumulation 302 probe 302
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow302', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(2, 102);
      const delta = m.makeOffset(23, 3);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 302) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0303
     * @tc.name    MusicOperationFlow303
     * @tc.desc    Music offset accumulation 303 probe 303
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow303', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(3, 103);
      const delta = m.makeOffset(24, 4);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 303) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0304
     * @tc.name    MusicOperationFlow304
     * @tc.desc    Music offset accumulation 304 probe 304
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow304', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(4, 104);
      const delta = m.makeOffset(25, 5);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 304) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0305
     * @tc.name    MusicOperationFlow305
     * @tc.desc    Music offset accumulation 305 probe 305
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow305', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(5, 105);
      const delta = m.makeOffset(26, 6);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 305) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0306
     * @tc.name    MusicOperationFlow306
     * @tc.desc    Music offset accumulation 306 probe 306
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow306', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(6, 106);
      const delta = m.makeOffset(27, 7);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 306) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0307
     * @tc.name    MusicOperationFlow307
     * @tc.desc    Music offset accumulation 307 probe 307
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow307', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(7, 107);
      const delta = m.makeOffset(28, 8);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 307) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0308
     * @tc.name    MusicOperationFlow308
     * @tc.desc    Music offset accumulation 308 probe 308
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow308', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(8, 108);
      const delta = m.makeOffset(29, 9);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 308) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0309
     * @tc.name    MusicOperationFlow309
     * @tc.desc    Music offset accumulation 309 probe 309
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow309', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(9, 109);
      const delta = m.makeOffset(30, 10);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 309) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0310
     * @tc.name    MusicOperationFlow310
     * @tc.desc    Music offset accumulation 310 probe 310
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow310', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(10, 110);
      const delta = m.makeOffset(31, 11);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 310) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0311
     * @tc.name    MusicOperationFlow311
     * @tc.desc    Music offset accumulation 311 probe 311
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow311', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(11, 111);
      const delta = m.makeOffset(32, 12);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 311) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0312
     * @tc.name    MusicOperationFlow312
     * @tc.desc    Music offset accumulation 312 probe 312
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow312', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(12, 112);
      const delta = m.makeOffset(33, 13);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 312) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0313
     * @tc.name    MusicOperationFlow313
     * @tc.desc    Music offset accumulation 313 probe 313
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow313', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(13, 113);
      const delta = m.makeOffset(34, 14);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 313) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_0314
     * @tc.name    MusicOperationFlow314
     * @tc.desc    Music offset accumulation 314 probe 314
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicOperationFlow314', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const base = m.makeOffset(14, 114);
      const delta = m.makeOffset(35, 15);
      const sum = m.accumulateOffset(base, delta);
      expect(sum.x).assertEqual((base.x + delta.x));
      expect(sum.y).assertEqual((base.y + delta.y));
      expect(m.getPlaylistByIndex(1000 + 314) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
