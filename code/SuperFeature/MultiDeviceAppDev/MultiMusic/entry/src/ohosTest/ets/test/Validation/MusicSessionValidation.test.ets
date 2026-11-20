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

export default function musicSessionValidationSuite() {
  describe('MusicSessionValidationSuite', () => {
    let m: MusicModel = new MusicModel();

    beforeEach(() => {
      m = new MusicModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1184
     * @tc.name    MusicSessionValidation1184
     * @tc.desc    Music offset clamp within 185 probe 1184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 185;
      const clamped = m.clampOffset(m.makeOffset(-15, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1184) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1185
     * @tc.name    MusicSessionValidation1185
     * @tc.desc    Music padding validity 285 probe 1185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(285, 185);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1185) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1186
     * @tc.name    MusicSessionValidation1186
     * @tc.desc    Music offset clamp within 187 probe 1186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 187;
      const clamped = m.clampOffset(m.makeOffset(-17, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1186) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1187
     * @tc.name    MusicSessionValidation1187
     * @tc.desc    Music padding validity 287 probe 1187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(287, 187);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1187) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1188
     * @tc.name    MusicSessionValidation1188
     * @tc.desc    Music offset clamp within 189 probe 1188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 189;
      const clamped = m.clampOffset(m.makeOffset(-19, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1188) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1189
     * @tc.name    MusicSessionValidation1189
     * @tc.desc    Music padding validity 289 probe 1189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(289, 189);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1189) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1190
     * @tc.name    MusicSessionValidation1190
     * @tc.desc    Music offset clamp within 191 probe 1190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 191;
      const clamped = m.clampOffset(m.makeOffset(-21, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1190) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1191
     * @tc.name    MusicSessionValidation1191
     * @tc.desc    Music padding validity 291 probe 1191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(291, 191);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1191) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1192
     * @tc.name    MusicSessionValidation1192
     * @tc.desc    Music offset clamp within 193 probe 1192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 193;
      const clamped = m.clampOffset(m.makeOffset(-23, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1192) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1193
     * @tc.name    MusicSessionValidation1193
     * @tc.desc    Music padding validity 293 probe 1193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(293, 193);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1193) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1194
     * @tc.name    MusicSessionValidation1194
     * @tc.desc    Music offset clamp within 195 probe 1194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 195;
      const clamped = m.clampOffset(m.makeOffset(-25, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1194) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1195
     * @tc.name    MusicSessionValidation1195
     * @tc.desc    Music padding validity 295 probe 1195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(295, 195);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1195) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1196
     * @tc.name    MusicSessionValidation1196
     * @tc.desc    Music offset clamp within 197 probe 1196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 197;
      const clamped = m.clampOffset(m.makeOffset(-27, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1196) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1197
     * @tc.name    MusicSessionValidation1197
     * @tc.desc    Music padding validity 297 probe 1197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(297, 197);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1197) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1198
     * @tc.name    MusicSessionValidation1198
     * @tc.desc    Music offset clamp within 199 probe 1198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 199;
      const clamped = m.clampOffset(m.makeOffset(-29, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1198) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1199
     * @tc.name    MusicSessionValidation1199
     * @tc.desc    Music padding validity 299 probe 1199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(299, 199);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1199) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1200
     * @tc.name    MusicSessionValidation1200
     * @tc.desc    Music offset clamp within 201 probe 1200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 201;
      const clamped = m.clampOffset(m.makeOffset(-31, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1200) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1201
     * @tc.name    MusicSessionValidation1201
     * @tc.desc    Music padding validity 1 probe 1201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(1, 1);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1201) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1202
     * @tc.name    MusicSessionValidation1202
     * @tc.desc    Music offset clamp within 203 probe 1202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 203;
      const clamped = m.clampOffset(m.makeOffset(-33, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1202) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1203
     * @tc.name    MusicSessionValidation1203
     * @tc.desc    Music padding validity 3 probe 1203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(3, 3);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1203) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1204
     * @tc.name    MusicSessionValidation1204
     * @tc.desc    Music offset clamp within 205 probe 1204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 205;
      const clamped = m.clampOffset(m.makeOffset(-35, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1204) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1205
     * @tc.name    MusicSessionValidation1205
     * @tc.desc    Music padding validity 5 probe 1205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(5, 5);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1205) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1206
     * @tc.name    MusicSessionValidation1206
     * @tc.desc    Music offset clamp within 207 probe 1206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 207;
      const clamped = m.clampOffset(m.makeOffset(-37, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1206) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1207
     * @tc.name    MusicSessionValidation1207
     * @tc.desc    Music padding validity 7 probe 1207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(7, 7);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1207) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1208
     * @tc.name    MusicSessionValidation1208
     * @tc.desc    Music offset clamp within 209 probe 1208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 209;
      const clamped = m.clampOffset(m.makeOffset(-39, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1208) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1209
     * @tc.name    MusicSessionValidation1209
     * @tc.desc    Music padding validity 9 probe 1209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(9, 9);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1209) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1210
     * @tc.name    MusicSessionValidation1210
     * @tc.desc    Music offset clamp within 211 probe 1210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 211;
      const clamped = m.clampOffset(m.makeOffset(-41, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1210) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1211
     * @tc.name    MusicSessionValidation1211
     * @tc.desc    Music padding validity 11 probe 1211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(11, 11);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1211) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1212
     * @tc.name    MusicSessionValidation1212
     * @tc.desc    Music offset clamp within 213 probe 1212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 213;
      const clamped = m.clampOffset(m.makeOffset(-43, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1212) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1213
     * @tc.name    MusicSessionValidation1213
     * @tc.desc    Music padding validity 13 probe 1213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(13, 13);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1213) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1214
     * @tc.name    MusicSessionValidation1214
     * @tc.desc    Music offset clamp within 215 probe 1214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 215;
      const clamped = m.clampOffset(m.makeOffset(-45, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1214) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1215
     * @tc.name    MusicSessionValidation1215
     * @tc.desc    Music padding validity 15 probe 1215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(15, 15);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1215) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1216
     * @tc.name    MusicSessionValidation1216
     * @tc.desc    Music offset clamp within 217 probe 1216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 217;
      const clamped = m.clampOffset(m.makeOffset(-47, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1216) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1217
     * @tc.name    MusicSessionValidation1217
     * @tc.desc    Music padding validity 17 probe 1217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(17, 17);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1217) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1218
     * @tc.name    MusicSessionValidation1218
     * @tc.desc    Music offset clamp within 219 probe 1218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 219;
      const clamped = m.clampOffset(m.makeOffset(-49, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1218) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1219
     * @tc.name    MusicSessionValidation1219
     * @tc.desc    Music padding validity 19 probe 1219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(19, 19);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1219) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1220
     * @tc.name    MusicSessionValidation1220
     * @tc.desc    Music offset clamp within 221 probe 1220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 221;
      const clamped = m.clampOffset(m.makeOffset(-51, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1220) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1221
     * @tc.name    MusicSessionValidation1221
     * @tc.desc    Music padding validity 21 probe 1221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(21, 21);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1221) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1222
     * @tc.name    MusicSessionValidation1222
     * @tc.desc    Music offset clamp within 223 probe 1222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 223;
      const clamped = m.clampOffset(m.makeOffset(-53, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1222) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1223
     * @tc.name    MusicSessionValidation1223
     * @tc.desc    Music padding validity 23 probe 1223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(23, 23);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1223) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1224
     * @tc.name    MusicSessionValidation1224
     * @tc.desc    Music offset clamp within 225 probe 1224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 225;
      const clamped = m.clampOffset(m.makeOffset(-55, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1224) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1225
     * @tc.name    MusicSessionValidation1225
     * @tc.desc    Music padding validity 25 probe 1225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(25, 25);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1225) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1226
     * @tc.name    MusicSessionValidation1226
     * @tc.desc    Music offset clamp within 227 probe 1226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 227;
      const clamped = m.clampOffset(m.makeOffset(-57, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1226) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1227
     * @tc.name    MusicSessionValidation1227
     * @tc.desc    Music padding validity 27 probe 1227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(27, 27);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1227) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1228
     * @tc.name    MusicSessionValidation1228
     * @tc.desc    Music offset clamp within 229 probe 1228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 229;
      const clamped = m.clampOffset(m.makeOffset(-59, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1228) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1229
     * @tc.name    MusicSessionValidation1229
     * @tc.desc    Music padding validity 29 probe 1229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(29, 29);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1229) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1230
     * @tc.name    MusicSessionValidation1230
     * @tc.desc    Music offset clamp within 231 probe 1230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1230', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 231;
      const clamped = m.clampOffset(m.makeOffset(-61, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1230) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1231
     * @tc.name    MusicSessionValidation1231
     * @tc.desc    Music padding validity 31 probe 1231
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1231', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(31, 31);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1231) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1232
     * @tc.name    MusicSessionValidation1232
     * @tc.desc    Music offset clamp within 233 probe 1232
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1232', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 233;
      const clamped = m.clampOffset(m.makeOffset(-63, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1232) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1233
     * @tc.name    MusicSessionValidation1233
     * @tc.desc    Music padding validity 33 probe 1233
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1233', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(33, 33);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1233) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1234
     * @tc.name    MusicSessionValidation1234
     * @tc.desc    Music offset clamp within 235 probe 1234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 235;
      const clamped = m.clampOffset(m.makeOffset(-65, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1234) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1235
     * @tc.name    MusicSessionValidation1235
     * @tc.desc    Music padding validity 35 probe 1235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(35, 35);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1235) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1236
     * @tc.name    MusicSessionValidation1236
     * @tc.desc    Music offset clamp within 237 probe 1236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 237;
      const clamped = m.clampOffset(m.makeOffset(-67, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1236) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1237
     * @tc.name    MusicSessionValidation1237
     * @tc.desc    Music padding validity 37 probe 1237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(37, 37);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1237) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1238
     * @tc.name    MusicSessionValidation1238
     * @tc.desc    Music offset clamp within 239 probe 1238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 239;
      const clamped = m.clampOffset(m.makeOffset(-69, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1238) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1239
     * @tc.name    MusicSessionValidation1239
     * @tc.desc    Music padding validity 39 probe 1239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(39, 39);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1239) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1240
     * @tc.name    MusicSessionValidation1240
     * @tc.desc    Music offset clamp within 241 probe 1240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 241;
      const clamped = m.clampOffset(m.makeOffset(-71, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1240) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1241
     * @tc.name    MusicSessionValidation1241
     * @tc.desc    Music padding validity 41 probe 1241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(41, 41);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1241) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1242
     * @tc.name    MusicSessionValidation1242
     * @tc.desc    Music offset clamp within 243 probe 1242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 243;
      const clamped = m.clampOffset(m.makeOffset(-73, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1242) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1243
     * @tc.name    MusicSessionValidation1243
     * @tc.desc    Music padding validity 43 probe 1243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(43, 43);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1243) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1244
     * @tc.name    MusicSessionValidation1244
     * @tc.desc    Music offset clamp within 245 probe 1244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 245;
      const clamped = m.clampOffset(m.makeOffset(-75, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1244) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1245
     * @tc.name    MusicSessionValidation1245
     * @tc.desc    Music padding validity 45 probe 1245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(45, 45);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1245) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1246
     * @tc.name    MusicSessionValidation1246
     * @tc.desc    Music offset clamp within 247 probe 1246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 247;
      const clamped = m.clampOffset(m.makeOffset(-77, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1246) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1247
     * @tc.name    MusicSessionValidation1247
     * @tc.desc    Music padding validity 47 probe 1247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(47, 47);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1247) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1248
     * @tc.name    MusicSessionValidation1248
     * @tc.desc    Music offset clamp within 249 probe 1248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 249;
      const clamped = m.clampOffset(m.makeOffset(-79, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1248) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1249
     * @tc.name    MusicSessionValidation1249
     * @tc.desc    Music padding validity 49 probe 1249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(49, 49);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1249) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1250
     * @tc.name    MusicSessionValidation1250
     * @tc.desc    Music offset clamp within 251 probe 1250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 251;
      const clamped = m.clampOffset(m.makeOffset(-81, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1250) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1251
     * @tc.name    MusicSessionValidation1251
     * @tc.desc    Music padding validity 51 probe 1251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(51, 51);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1251) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1252
     * @tc.name    MusicSessionValidation1252
     * @tc.desc    Music offset clamp within 253 probe 1252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 253;
      const clamped = m.clampOffset(m.makeOffset(-83, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1252) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1253
     * @tc.name    MusicSessionValidation1253
     * @tc.desc    Music padding validity 53 probe 1253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(53, 53);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1253) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1254
     * @tc.name    MusicSessionValidation1254
     * @tc.desc    Music offset clamp within 255 probe 1254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 255;
      const clamped = m.clampOffset(m.makeOffset(-85, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1254) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1255
     * @tc.name    MusicSessionValidation1255
     * @tc.desc    Music padding validity 55 probe 1255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(55, 55);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1255) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1256
     * @tc.name    MusicSessionValidation1256
     * @tc.desc    Music offset clamp within 257 probe 1256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 257;
      const clamped = m.clampOffset(m.makeOffset(-87, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1256) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1257
     * @tc.name    MusicSessionValidation1257
     * @tc.desc    Music padding validity 57 probe 1257
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1257', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(57, 57);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1257) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1258
     * @tc.name    MusicSessionValidation1258
     * @tc.desc    Music offset clamp within 259 probe 1258
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1258', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 259;
      const clamped = m.clampOffset(m.makeOffset(-89, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1258) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1259
     * @tc.name    MusicSessionValidation1259
     * @tc.desc    Music padding validity 59 probe 1259
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1259', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(59, 59);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1259) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1260
     * @tc.name    MusicSessionValidation1260
     * @tc.desc    Music offset clamp within 261 probe 1260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1260', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 261;
      const clamped = m.clampOffset(m.makeOffset(-1, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1260) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1261
     * @tc.name    MusicSessionValidation1261
     * @tc.desc    Music padding validity 61 probe 1261
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1261', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(61, 61);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1261) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1262
     * @tc.name    MusicSessionValidation1262
     * @tc.desc    Music offset clamp within 263 probe 1262
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1262', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 263;
      const clamped = m.clampOffset(m.makeOffset(-3, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1262) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1263
     * @tc.name    MusicSessionValidation1263
     * @tc.desc    Music padding validity 63 probe 1263
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1263', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(63, 63);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1263) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1264
     * @tc.name    MusicSessionValidation1264
     * @tc.desc    Music offset clamp within 265 probe 1264
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1264', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 265;
      const clamped = m.clampOffset(m.makeOffset(-5, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1264) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1265
     * @tc.name    MusicSessionValidation1265
     * @tc.desc    Music padding validity 65 probe 1265
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1265', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(65, 65);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1265) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1266
     * @tc.name    MusicSessionValidation1266
     * @tc.desc    Music offset clamp within 267 probe 1266
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1266', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 267;
      const clamped = m.clampOffset(m.makeOffset(-7, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1266) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1267
     * @tc.name    MusicSessionValidation1267
     * @tc.desc    Music padding validity 67 probe 1267
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1267', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(67, 67);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1267) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1268
     * @tc.name    MusicSessionValidation1268
     * @tc.desc    Music offset clamp within 269 probe 1268
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1268', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 269;
      const clamped = m.clampOffset(m.makeOffset(-9, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1268) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1269
     * @tc.name    MusicSessionValidation1269
     * @tc.desc    Music padding validity 69 probe 1269
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1269', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(69, 69);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1269) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1270
     * @tc.name    MusicSessionValidation1270
     * @tc.desc    Music offset clamp within 271 probe 1270
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1270', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 271;
      const clamped = m.clampOffset(m.makeOffset(-11, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1270) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1271
     * @tc.name    MusicSessionValidation1271
     * @tc.desc    Music padding validity 71 probe 1271
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1271', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(71, 71);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1271) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1272
     * @tc.name    MusicSessionValidation1272
     * @tc.desc    Music offset clamp within 273 probe 1272
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1272', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 273;
      const clamped = m.clampOffset(m.makeOffset(-13, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1272) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1273
     * @tc.name    MusicSessionValidation1273
     * @tc.desc    Music padding validity 73 probe 1273
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1273', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(73, 73);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1273) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1274
     * @tc.name    MusicSessionValidation1274
     * @tc.desc    Music offset clamp within 275 probe 1274
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1274', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 275;
      const clamped = m.clampOffset(m.makeOffset(-15, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1274) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1275
     * @tc.name    MusicSessionValidation1275
     * @tc.desc    Music padding validity 75 probe 1275
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1275', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(75, 75);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1275) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1276
     * @tc.name    MusicSessionValidation1276
     * @tc.desc    Music offset clamp within 277 probe 1276
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1276', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 277;
      const clamped = m.clampOffset(m.makeOffset(-17, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1276) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1277
     * @tc.name    MusicSessionValidation1277
     * @tc.desc    Music padding validity 77 probe 1277
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1277', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(77, 77);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1277) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1278
     * @tc.name    MusicSessionValidation1278
     * @tc.desc    Music offset clamp within 279 probe 1278
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1278', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 279;
      const clamped = m.clampOffset(m.makeOffset(-19, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1278) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1279
     * @tc.name    MusicSessionValidation1279
     * @tc.desc    Music padding validity 79 probe 1279
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1279', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(79, 79);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1279) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1280
     * @tc.name    MusicSessionValidation1280
     * @tc.desc    Music offset clamp within 281 probe 1280
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1280', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 281;
      const clamped = m.clampOffset(m.makeOffset(-21, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1280) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1281
     * @tc.name    MusicSessionValidation1281
     * @tc.desc    Music padding validity 81 probe 1281
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1281', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(81, 81);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1281) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1282
     * @tc.name    MusicSessionValidation1282
     * @tc.desc    Music offset clamp within 283 probe 1282
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1282', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 283;
      const clamped = m.clampOffset(m.makeOffset(-23, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1282) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1283
     * @tc.name    MusicSessionValidation1283
     * @tc.desc    Music padding validity 83 probe 1283
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1283', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(83, 83);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1283) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1284
     * @tc.name    MusicSessionValidation1284
     * @tc.desc    Music offset clamp within 285 probe 1284
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1284', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 285;
      const clamped = m.clampOffset(m.makeOffset(-25, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1284) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1285
     * @tc.name    MusicSessionValidation1285
     * @tc.desc    Music padding validity 85 probe 1285
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1285', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(85, 85);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1285) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1286
     * @tc.name    MusicSessionValidation1286
     * @tc.desc    Music offset clamp within 287 probe 1286
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1286', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 287;
      const clamped = m.clampOffset(m.makeOffset(-27, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1286) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1287
     * @tc.name    MusicSessionValidation1287
     * @tc.desc    Music padding validity 87 probe 1287
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1287', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(87, 87);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1287) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1288
     * @tc.name    MusicSessionValidation1288
     * @tc.desc    Music offset clamp within 289 probe 1288
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1288', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 289;
      const clamped = m.clampOffset(m.makeOffset(-29, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1288) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1289
     * @tc.name    MusicSessionValidation1289
     * @tc.desc    Music padding validity 89 probe 1289
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1289', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(89, 89);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1289) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1290
     * @tc.name    MusicSessionValidation1290
     * @tc.desc    Music offset clamp within 291 probe 1290
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1290', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 291;
      const clamped = m.clampOffset(m.makeOffset(-31, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1290) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1291
     * @tc.name    MusicSessionValidation1291
     * @tc.desc    Music padding validity 91 probe 1291
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1291', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(91, 91);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1291) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1292
     * @tc.name    MusicSessionValidation1292
     * @tc.desc    Music offset clamp within 293 probe 1292
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1292', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 293;
      const clamped = m.clampOffset(m.makeOffset(-33, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1292) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1293
     * @tc.name    MusicSessionValidation1293
     * @tc.desc    Music padding validity 93 probe 1293
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1293', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(93, 93);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1293) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1294
     * @tc.name    MusicSessionValidation1294
     * @tc.desc    Music offset clamp within 295 probe 1294
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1294', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 295;
      const clamped = m.clampOffset(m.makeOffset(-35, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1294) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1295
     * @tc.name    MusicSessionValidation1295
     * @tc.desc    Music padding validity 95 probe 1295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1295', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(95, 95);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1295) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1296
     * @tc.name    MusicSessionValidation1296
     * @tc.desc    Music offset clamp within 297 probe 1296
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1296', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 297;
      const clamped = m.clampOffset(m.makeOffset(-37, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1296) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1297
     * @tc.name    MusicSessionValidation1297
     * @tc.desc    Music padding validity 97 probe 1297
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1297', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(97, 97);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1297) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1298
     * @tc.name    MusicSessionValidation1298
     * @tc.desc    Music offset clamp within 299 probe 1298
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1298', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 299;
      const clamped = m.clampOffset(m.makeOffset(-39, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1298) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1299
     * @tc.name    MusicSessionValidation1299
     * @tc.desc    Music padding validity 99 probe 1299
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1299', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(99, 99);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1299) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1300
     * @tc.name    MusicSessionValidation1300
     * @tc.desc    Music offset clamp within 301 probe 1300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1300', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 301;
      const clamped = m.clampOffset(m.makeOffset(-41, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1300) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1301
     * @tc.name    MusicSessionValidation1301
     * @tc.desc    Music padding validity 101 probe 1301
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1301', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(101, 101);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1301) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1302
     * @tc.name    MusicSessionValidation1302
     * @tc.desc    Music offset clamp within 303 probe 1302
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1302', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 303;
      const clamped = m.clampOffset(m.makeOffset(-43, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1302) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1303
     * @tc.name    MusicSessionValidation1303
     * @tc.desc    Music padding validity 103 probe 1303
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1303', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(103, 103);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1303) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1304
     * @tc.name    MusicSessionValidation1304
     * @tc.desc    Music offset clamp within 305 probe 1304
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1304', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 305;
      const clamped = m.clampOffset(m.makeOffset(-45, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1304) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1305
     * @tc.name    MusicSessionValidation1305
     * @tc.desc    Music padding validity 105 probe 1305
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1305', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(105, 105);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1305) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1306
     * @tc.name    MusicSessionValidation1306
     * @tc.desc    Music offset clamp within 307 probe 1306
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1306', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 307;
      const clamped = m.clampOffset(m.makeOffset(-47, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1306) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1307
     * @tc.name    MusicSessionValidation1307
     * @tc.desc    Music padding validity 107 probe 1307
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1307', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(107, 107);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1307) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1308
     * @tc.name    MusicSessionValidation1308
     * @tc.desc    Music offset clamp within 309 probe 1308
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1308', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 309;
      const clamped = m.clampOffset(m.makeOffset(-49, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1308) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1309
     * @tc.name    MusicSessionValidation1309
     * @tc.desc    Music padding validity 109 probe 1309
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1309', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(109, 109);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1309) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1310
     * @tc.name    MusicSessionValidation1310
     * @tc.desc    Music offset clamp within 311 probe 1310
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1310', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 311;
      const clamped = m.clampOffset(m.makeOffset(-51, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1310) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1311
     * @tc.name    MusicSessionValidation1311
     * @tc.desc    Music padding validity 111 probe 1311
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1311', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(111, 111);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1311) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1312
     * @tc.name    MusicSessionValidation1312
     * @tc.desc    Music offset clamp within 313 probe 1312
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1312', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 313;
      const clamped = m.clampOffset(m.makeOffset(-53, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1312) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1313
     * @tc.name    MusicSessionValidation1313
     * @tc.desc    Music padding validity 113 probe 1313
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1313', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(113, 113);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1313) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1314
     * @tc.name    MusicSessionValidation1314
     * @tc.desc    Music offset clamp within 315 probe 1314
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1314', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const maxX: number = 315;
      const clamped = m.clampOffset(m.makeOffset(-55, 9999), maxX, maxX);
      expect(clamped.x >= 0 && clamped.x <= maxX).assertEqual(true);
      expect(clamped.y >= 0 && clamped.y <= maxX).assertEqual(true);
      expect(m.getPlaylistByIndex(1000 + 1314) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1315
     * @tc.name    MusicSessionValidation1315
     * @tc.desc    Music padding validity 115 probe 1315
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MusicSessionValidation1315', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding = m.makePadding(115, 115);
      expect(m.horizontalPadding(padding)).assertEqual(padding.left + padding.right);
      expect(m.isValidPadding(padding)).assertEqual(padding.left >= 0 && padding.right >= 0);
      expect(m.getPlaylistByIndex(1000 + 1315) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

