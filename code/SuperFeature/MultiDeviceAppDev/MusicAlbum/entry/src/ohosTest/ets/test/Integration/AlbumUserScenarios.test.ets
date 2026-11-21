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

export default function albumUserScenariosSuite() {
  describe('AlbumUserScenariosSuite', () => {
    let m: AlbumModel = new AlbumModel();

    beforeEach(() => {
      m = new AlbumModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0209
     * @tc.name    AlbumUserScenarios209
     * @tc.desc    Album vip and singer counts 209 probe 209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(17) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 209) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0210
     * @tc.name    AlbumUserScenarios210
     * @tc.desc    Album vip and singer counts 210 probe 210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(18) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 210) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0211
     * @tc.name    AlbumUserScenarios211
     * @tc.desc    Album vip and singer counts 211 probe 211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(19) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 211) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0212
     * @tc.name    AlbumUserScenarios212
     * @tc.desc    Album vip and singer counts 212 probe 212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(20) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 212) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0213
     * @tc.name    AlbumUserScenarios213
     * @tc.desc    Album vip and singer counts 213 probe 213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(21) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 213) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0214
     * @tc.name    AlbumUserScenarios214
     * @tc.desc    Album vip and singer counts 214 probe 214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 214) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0215
     * @tc.name    AlbumUserScenarios215
     * @tc.desc    Album vip and singer counts 215 probe 215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 215) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0216
     * @tc.name    AlbumUserScenarios216
     * @tc.desc    Album vip and singer counts 216 probe 216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 216) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0217
     * @tc.name    AlbumUserScenarios217
     * @tc.desc    Album vip and singer counts 217 probe 217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(1) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 217) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0218
     * @tc.name    AlbumUserScenarios218
     * @tc.desc    Album vip and singer counts 218 probe 218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(2) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 218) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0219
     * @tc.name    AlbumUserScenarios219
     * @tc.desc    Album vip and singer counts 219 probe 219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(3) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 219) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0220
     * @tc.name    AlbumUserScenarios220
     * @tc.desc    Album vip and singer counts 220 probe 220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(4) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 220) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0221
     * @tc.name    AlbumUserScenarios221
     * @tc.desc    Album vip and singer counts 221 probe 221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(5) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 221) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0222
     * @tc.name    AlbumUserScenarios222
     * @tc.desc    Album vip and singer counts 222 probe 222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(6) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 222) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0223
     * @tc.name    AlbumUserScenarios223
     * @tc.desc    Album vip and singer counts 223 probe 223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(7) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 223) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0224
     * @tc.name    AlbumUserScenarios224
     * @tc.desc    Album vip and singer counts 224 probe 224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(8) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 224) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0225
     * @tc.name    AlbumUserScenarios225
     * @tc.desc    Album vip and singer counts 225 probe 225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(9) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 225) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0226
     * @tc.name    AlbumUserScenarios226
     * @tc.desc    Album vip and singer counts 226 probe 226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(10) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 226) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0227
     * @tc.name    AlbumUserScenarios227
     * @tc.desc    Album vip and singer counts 227 probe 227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(11) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 227) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0228
     * @tc.name    AlbumUserScenarios228
     * @tc.desc    Album vip and singer counts 228 probe 228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(12) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 228) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0229
     * @tc.name    AlbumUserScenarios229
     * @tc.desc    Album vip and singer counts 229 probe 229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(13) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 229) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0230
     * @tc.name    AlbumUserScenarios230
     * @tc.desc    Album vip and singer counts 230 probe 230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios230', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(14) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 230) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0231
     * @tc.name    AlbumUserScenarios231
     * @tc.desc    Album vip and singer counts 231 probe 231
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios231', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(15) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 231) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0232
     * @tc.name    AlbumUserScenarios232
     * @tc.desc    Album vip and singer counts 232 probe 232
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios232', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(16) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 232) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0233
     * @tc.name    AlbumUserScenarios233
     * @tc.desc    Album vip and singer counts 233 probe 233
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios233', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(17) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 233) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0234
     * @tc.name    AlbumUserScenarios234
     * @tc.desc    Album vip and singer counts 234 probe 234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(18) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 234) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0235
     * @tc.name    AlbumUserScenarios235
     * @tc.desc    Album vip and singer counts 235 probe 235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(19) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 235) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0236
     * @tc.name    AlbumUserScenarios236
     * @tc.desc    Album vip and singer counts 236 probe 236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(20) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 236) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0237
     * @tc.name    AlbumUserScenarios237
     * @tc.desc    Album vip and singer counts 237 probe 237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(21) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 237) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0238
     * @tc.name    AlbumUserScenarios238
     * @tc.desc    Album vip and singer counts 238 probe 238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 238) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0239
     * @tc.name    AlbumUserScenarios239
     * @tc.desc    Album vip and singer counts 239 probe 239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 239) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0240
     * @tc.name    AlbumUserScenarios240
     * @tc.desc    Album vip and singer counts 240 probe 240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 240) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0241
     * @tc.name    AlbumUserScenarios241
     * @tc.desc    Album vip and singer counts 241 probe 241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(1) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 241) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0242
     * @tc.name    AlbumUserScenarios242
     * @tc.desc    Album vip and singer counts 242 probe 242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(2) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 242) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0243
     * @tc.name    AlbumUserScenarios243
     * @tc.desc    Album vip and singer counts 243 probe 243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(3) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 243) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0244
     * @tc.name    AlbumUserScenarios244
     * @tc.desc    Album vip and singer counts 244 probe 244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(4) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 244) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0245
     * @tc.name    AlbumUserScenarios245
     * @tc.desc    Album vip and singer counts 245 probe 245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(5) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 245) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0246
     * @tc.name    AlbumUserScenarios246
     * @tc.desc    Album vip and singer counts 246 probe 246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(6) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 246) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0247
     * @tc.name    AlbumUserScenarios247
     * @tc.desc    Album vip and singer counts 247 probe 247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(7) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 247) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0248
     * @tc.name    AlbumUserScenarios248
     * @tc.desc    Album vip and singer counts 248 probe 248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(8) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 248) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0249
     * @tc.name    AlbumUserScenarios249
     * @tc.desc    Album vip and singer counts 249 probe 249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(9) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 249) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0250
     * @tc.name    AlbumUserScenarios250
     * @tc.desc    Album vip and singer counts 250 probe 250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(10) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 250) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0251
     * @tc.name    AlbumUserScenarios251
     * @tc.desc    Album vip and singer counts 251 probe 251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(11) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 251) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0252
     * @tc.name    AlbumUserScenarios252
     * @tc.desc    Album vip and singer counts 252 probe 252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(12) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 252) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0253
     * @tc.name    AlbumUserScenarios253
     * @tc.desc    Album vip and singer counts 253 probe 253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(13) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 253) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0254
     * @tc.name    AlbumUserScenarios254
     * @tc.desc    Album vip and singer counts 254 probe 254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(14) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 254) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0255
     * @tc.name    AlbumUserScenarios255
     * @tc.desc    Album vip and singer counts 255 probe 255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(15) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 255) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0256
     * @tc.name    AlbumUserScenarios256
     * @tc.desc    Album vip and singer counts 256 probe 256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(16) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 256) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0257
     * @tc.name    AlbumUserScenarios257
     * @tc.desc    Album vip and singer counts 257 probe 257
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios257', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(17) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 257) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0258
     * @tc.name    AlbumUserScenarios258
     * @tc.desc    Album vip and singer counts 258 probe 258
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios258', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(18) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 258) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0259
     * @tc.name    AlbumUserScenarios259
     * @tc.desc    Album vip and singer counts 259 probe 259
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios259', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(19) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 259) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0260
     * @tc.name    AlbumUserScenarios260
     * @tc.desc    Album vip and singer counts 260 probe 260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios260', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(20) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 260) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0261
     * @tc.name    AlbumUserScenarios261
     * @tc.desc    Album vip and singer counts 261 probe 261
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios261', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(21) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 261) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0262
     * @tc.name    AlbumUserScenarios262
     * @tc.desc    Album vip and singer counts 262 probe 262
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios262', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 262) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0263
     * @tc.name    AlbumUserScenarios263
     * @tc.desc    Album vip and singer counts 263 probe 263
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios263', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 263) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0264
     * @tc.name    AlbumUserScenarios264
     * @tc.desc    Album vip and singer counts 264 probe 264
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios264', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 264) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0265
     * @tc.name    AlbumUserScenarios265
     * @tc.desc    Album vip and singer counts 265 probe 265
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios265', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(1) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 265) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0266
     * @tc.name    AlbumUserScenarios266
     * @tc.desc    Album vip and singer counts 266 probe 266
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios266', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(2) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 266) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0267
     * @tc.name    AlbumUserScenarios267
     * @tc.desc    Album vip and singer counts 267 probe 267
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios267', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(3) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 267) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0268
     * @tc.name    AlbumUserScenarios268
     * @tc.desc    Album vip and singer counts 268 probe 268
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios268', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(4) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 268) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0269
     * @tc.name    AlbumUserScenarios269
     * @tc.desc    Album vip and singer counts 269 probe 269
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios269', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(5) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 269) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0270
     * @tc.name    AlbumUserScenarios270
     * @tc.desc    Album vip and singer counts 270 probe 270
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios270', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(6) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 270) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0271
     * @tc.name    AlbumUserScenarios271
     * @tc.desc    Album vip and singer counts 271 probe 271
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios271', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(7) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 271) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0272
     * @tc.name    AlbumUserScenarios272
     * @tc.desc    Album vip and singer counts 272 probe 272
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios272', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(8) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 272) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0273
     * @tc.name    AlbumUserScenarios273
     * @tc.desc    Album vip and singer counts 273 probe 273
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios273', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(9) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 273) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0274
     * @tc.name    AlbumUserScenarios274
     * @tc.desc    Album vip and singer counts 274 probe 274
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios274', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(10) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 274) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0275
     * @tc.name    AlbumUserScenarios275
     * @tc.desc    Album vip and singer counts 275 probe 275
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios275', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(11) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 275) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0276
     * @tc.name    AlbumUserScenarios276
     * @tc.desc    Album vip and singer counts 276 probe 276
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios276', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(12) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 276) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0277
     * @tc.name    AlbumUserScenarios277
     * @tc.desc    Album vip and singer counts 277 probe 277
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios277', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(13) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 277) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0278
     * @tc.name    AlbumUserScenarios278
     * @tc.desc    Album vip and singer counts 278 probe 278
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios278', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(14) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 278) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0279
     * @tc.name    AlbumUserScenarios279
     * @tc.desc    Album vip and singer counts 279 probe 279
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios279', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(15) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 279) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0280
     * @tc.name    AlbumUserScenarios280
     * @tc.desc    Album vip and singer counts 280 probe 280
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios280', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(16) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 280) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0281
     * @tc.name    AlbumUserScenarios281
     * @tc.desc    Album vip and singer counts 281 probe 281
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios281', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(17) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 281) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0282
     * @tc.name    AlbumUserScenarios282
     * @tc.desc    Album vip and singer counts 282 probe 282
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios282', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(18) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 282) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0283
     * @tc.name    AlbumUserScenarios283
     * @tc.desc    Album vip and singer counts 283 probe 283
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios283', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(19) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 283) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0284
     * @tc.name    AlbumUserScenarios284
     * @tc.desc    Album vip and singer counts 284 probe 284
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios284', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(20) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 284) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0285
     * @tc.name    AlbumUserScenarios285
     * @tc.desc    Album vip and singer counts 285 probe 285
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios285', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(21) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 285) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0286
     * @tc.name    AlbumUserScenarios286
     * @tc.desc    Album vip and singer counts 286 probe 286
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios286', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 286) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0287
     * @tc.name    AlbumUserScenarios287
     * @tc.desc    Album vip and singer counts 287 probe 287
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios287', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 287) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0288
     * @tc.name    AlbumUserScenarios288
     * @tc.desc    Album vip and singer counts 288 probe 288
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios288', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 288) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0289
     * @tc.name    AlbumUserScenarios289
     * @tc.desc    Album vip and singer counts 289 probe 289
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios289', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(1) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 289) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0290
     * @tc.name    AlbumUserScenarios290
     * @tc.desc    Album vip and singer counts 290 probe 290
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios290', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(2) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 290) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0291
     * @tc.name    AlbumUserScenarios291
     * @tc.desc    Album vip and singer counts 291 probe 291
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios291', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(3) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 291) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0292
     * @tc.name    AlbumUserScenarios292
     * @tc.desc    Album vip and singer counts 292 probe 292
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios292', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(4) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 292) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0293
     * @tc.name    AlbumUserScenarios293
     * @tc.desc    Album vip and singer counts 293 probe 293
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios293', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(5) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 293) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0294
     * @tc.name    AlbumUserScenarios294
     * @tc.desc    Album vip and singer counts 294 probe 294
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios294', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(6) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 294) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0295
     * @tc.name    AlbumUserScenarios295
     * @tc.desc    Album vip and singer counts 295 probe 295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios295', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(7) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 295) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0296
     * @tc.name    AlbumUserScenarios296
     * @tc.desc    Album vip and singer counts 296 probe 296
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios296', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(8) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 296) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0297
     * @tc.name    AlbumUserScenarios297
     * @tc.desc    Album vip and singer counts 297 probe 297
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios297', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(9) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 297) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0298
     * @tc.name    AlbumUserScenarios298
     * @tc.desc    Album vip and singer counts 298 probe 298
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios298', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(10) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 298) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0299
     * @tc.name    AlbumUserScenarios299
     * @tc.desc    Album vip and singer counts 299 probe 299
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios299', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(11) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 299) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0300
     * @tc.name    AlbumUserScenarios300
     * @tc.desc    Album vip and singer counts 300 probe 300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios300', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(12) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 300) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0301
     * @tc.name    AlbumUserScenarios301
     * @tc.desc    Album vip and singer counts 301 probe 301
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios301', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(13) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 301) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0302
     * @tc.name    AlbumUserScenarios302
     * @tc.desc    Album vip and singer counts 302 probe 302
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios302', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(14) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 302) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0303
     * @tc.name    AlbumUserScenarios303
     * @tc.desc    Album vip and singer counts 303 probe 303
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios303', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(15) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 303) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0304
     * @tc.name    AlbumUserScenarios304
     * @tc.desc    Album vip and singer counts 304 probe 304
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios304', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(16) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 304) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0305
     * @tc.name    AlbumUserScenarios305
     * @tc.desc    Album vip and singer counts 305 probe 305
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios305', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(17) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 305) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0306
     * @tc.name    AlbumUserScenarios306
     * @tc.desc    Album vip and singer counts 306 probe 306
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios306', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(18) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 306) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0307
     * @tc.name    AlbumUserScenarios307
     * @tc.desc    Album vip and singer counts 307 probe 307
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios307', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(19) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 307) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0308
     * @tc.name    AlbumUserScenarios308
     * @tc.desc    Album vip and singer counts 308 probe 308
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios308', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(20) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 308) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0309
     * @tc.name    AlbumUserScenarios309
     * @tc.desc    Album vip and singer counts 309 probe 309
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios309', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(21) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 309) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0310
     * @tc.name    AlbumUserScenarios310
     * @tc.desc    Album vip and singer counts 310 probe 310
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios310', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 310) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0311
     * @tc.name    AlbumUserScenarios311
     * @tc.desc    Album vip and singer counts 311 probe 311
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios311', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 311) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0312
     * @tc.name    AlbumUserScenarios312
     * @tc.desc    Album vip and singer counts 312 probe 312
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios312', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 312) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0313
     * @tc.name    AlbumUserScenarios313
     * @tc.desc    Album vip and singer counts 313 probe 313
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios313', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(1) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 313) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0314
     * @tc.name    AlbumUserScenarios314
     * @tc.desc    Album vip and singer counts 314 probe 314
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios314', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(2) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 314) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0315
     * @tc.name    AlbumUserScenarios315
     * @tc.desc    Album vip and singer counts 315 probe 315
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios315', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(3) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 315) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0316
     * @tc.name    AlbumUserScenarios316
     * @tc.desc    Album vip and singer counts 316 probe 316
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios316', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(4) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 316) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0317
     * @tc.name    AlbumUserScenarios317
     * @tc.desc    Album vip and singer counts 317 probe 317
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios317', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(5) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 317) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0318
     * @tc.name    AlbumUserScenarios318
     * @tc.desc    Album vip and singer counts 318 probe 318
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios318', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(6) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 318) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0319
     * @tc.name    AlbumUserScenarios319
     * @tc.desc    Album vip and singer counts 319 probe 319
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios319', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(7) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 319) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0320
     * @tc.name    AlbumUserScenarios320
     * @tc.desc    Album vip and singer counts 320 probe 320
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios320', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(8) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 320) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0321
     * @tc.name    AlbumUserScenarios321
     * @tc.desc    Album vip and singer counts 321 probe 321
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios321', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(9) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 321) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0322
     * @tc.name    AlbumUserScenarios322
     * @tc.desc    Album vip and singer counts 322 probe 322
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios322', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(10) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 322) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0323
     * @tc.name    AlbumUserScenarios323
     * @tc.desc    Album vip and singer counts 323 probe 323
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios323', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(11) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 323) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0324
     * @tc.name    AlbumUserScenarios324
     * @tc.desc    Album vip and singer counts 324 probe 324
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios324', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(12) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 324) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0325
     * @tc.name    AlbumUserScenarios325
     * @tc.desc    Album vip and singer counts 325 probe 325
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios325', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(13) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 325) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0326
     * @tc.name    AlbumUserScenarios326
     * @tc.desc    Album vip and singer counts 326 probe 326
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios326', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(14) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 326) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0327
     * @tc.name    AlbumUserScenarios327
     * @tc.desc    Album vip and singer counts 327 probe 327
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios327', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(15) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 327) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0328
     * @tc.name    AlbumUserScenarios328
     * @tc.desc    Album vip and singer counts 328 probe 328
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios328', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(16) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 328) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0329
     * @tc.name    AlbumUserScenarios329
     * @tc.desc    Album vip and singer counts 329 probe 329
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios329', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(17) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 329) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0330
     * @tc.name    AlbumUserScenarios330
     * @tc.desc    Album vip and singer counts 330 probe 330
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios330', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(18) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 330) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0331
     * @tc.name    AlbumUserScenarios331
     * @tc.desc    Album vip and singer counts 331 probe 331
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios331', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(19) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 331) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0332
     * @tc.name    AlbumUserScenarios332
     * @tc.desc    Album vip and singer counts 332 probe 332
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios332', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(20) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 332) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0333
     * @tc.name    AlbumUserScenarios333
     * @tc.desc    Album vip and singer counts 333 probe 333
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios333', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(21) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 333) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0334
     * @tc.name    AlbumUserScenarios334
     * @tc.desc    Album vip and singer counts 334 probe 334
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios334', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 334) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0335
     * @tc.name    AlbumUserScenarios335
     * @tc.desc    Album vip and singer counts 335 probe 335
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios335', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 335) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0336
     * @tc.name    AlbumUserScenarios336
     * @tc.desc    Album vip and singer counts 336 probe 336
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios336', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 336) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0337
     * @tc.name    AlbumUserScenarios337
     * @tc.desc    Album vip and singer counts 337 probe 337
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios337', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(1) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 337) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0338
     * @tc.name    AlbumUserScenarios338
     * @tc.desc    Album vip and singer counts 338 probe 338
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios338', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(2) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 338) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0339
     * @tc.name    AlbumUserScenarios339
     * @tc.desc    Album vip and singer counts 339 probe 339
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios339', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(3) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 339) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0340
     * @tc.name    AlbumUserScenarios340
     * @tc.desc    Album vip and singer counts 340 probe 340
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios340', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(4) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 340) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0341
     * @tc.name    AlbumUserScenarios341
     * @tc.desc    Album vip and singer counts 341 probe 341
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios341', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(5) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 341) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0342
     * @tc.name    AlbumUserScenarios342
     * @tc.desc    Album vip and singer counts 342 probe 342
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios342', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(6) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 342) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0343
     * @tc.name    AlbumUserScenarios343
     * @tc.desc    Album vip and singer counts 343 probe 343
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios343', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(7) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 343) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0344
     * @tc.name    AlbumUserScenarios344
     * @tc.desc    Album vip and singer counts 344 probe 344
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios344', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(8) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 344) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0345
     * @tc.name    AlbumUserScenarios345
     * @tc.desc    Album vip and singer counts 345 probe 345
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios345', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(9) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 345) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0346
     * @tc.name    AlbumUserScenarios346
     * @tc.desc    Album vip and singer counts 346 probe 346
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios346', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(10) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 346) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0347
     * @tc.name    AlbumUserScenarios347
     * @tc.desc    Album vip and singer counts 347 probe 347
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios347', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(11) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 347) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0348
     * @tc.name    AlbumUserScenarios348
     * @tc.desc    Album vip and singer counts 348 probe 348
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios348', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(12) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 348) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0349
     * @tc.name    AlbumUserScenarios349
     * @tc.desc    Album vip and singer counts 349 probe 349
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios349', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(13) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 349) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0350
     * @tc.name    AlbumUserScenarios350
     * @tc.desc    Album vip and singer counts 350 probe 350
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios350', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(14) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 350) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0351
     * @tc.name    AlbumUserScenarios351
     * @tc.desc    Album vip and singer counts 351 probe 351
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios351', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(15) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 351) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0352
     * @tc.name    AlbumUserScenarios352
     * @tc.desc    Album vip and singer counts 352 probe 352
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios352', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(16) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 352) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0353
     * @tc.name    AlbumUserScenarios353
     * @tc.desc    Album vip and singer counts 353 probe 353
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios353', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(17) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 353) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0354
     * @tc.name    AlbumUserScenarios354
     * @tc.desc    Album vip and singer counts 354 probe 354
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios354', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(18) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 354) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0355
     * @tc.name    AlbumUserScenarios355
     * @tc.desc    Album vip and singer counts 355 probe 355
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios355', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(19) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 355) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0356
     * @tc.name    AlbumUserScenarios356
     * @tc.desc    Album vip and singer counts 356 probe 356
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios356', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(20) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 356) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0357
     * @tc.name    AlbumUserScenarios357
     * @tc.desc    Album vip and singer counts 357 probe 357
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios357', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(21) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 357) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0358
     * @tc.name    AlbumUserScenarios358
     * @tc.desc    Album vip and singer counts 358 probe 358
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios358', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 358) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0359
     * @tc.name    AlbumUserScenarios359
     * @tc.desc    Album vip and singer counts 359 probe 359
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios359', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 359) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0360
     * @tc.name    AlbumUserScenarios360
     * @tc.desc    Album vip and singer counts 360 probe 360
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios360', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 360) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0361
     * @tc.name    AlbumUserScenarios361
     * @tc.desc    Album vip and singer counts 361 probe 361
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios361', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(1) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 361) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0362
     * @tc.name    AlbumUserScenarios362
     * @tc.desc    Album vip and singer counts 362 probe 362
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios362', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(2) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 362) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0363
     * @tc.name    AlbumUserScenarios363
     * @tc.desc    Album vip and singer counts 363 probe 363
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios363', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(3) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 363) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0364
     * @tc.name    AlbumUserScenarios364
     * @tc.desc    Album vip and singer counts 364 probe 364
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios364', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(4) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 364) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0365
     * @tc.name    AlbumUserScenarios365
     * @tc.desc    Album vip and singer counts 365 probe 365
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios365', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(5) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 365) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0366
     * @tc.name    AlbumUserScenarios366
     * @tc.desc    Album vip and singer counts 366 probe 366
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios366', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(6) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 366) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0367
     * @tc.name    AlbumUserScenarios367
     * @tc.desc    Album vip and singer counts 367 probe 367
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios367', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(7) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 367) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0368
     * @tc.name    AlbumUserScenarios368
     * @tc.desc    Album vip and singer counts 368 probe 368
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios368', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(8) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 368) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0369
     * @tc.name    AlbumUserScenarios369
     * @tc.desc    Album vip and singer counts 369 probe 369
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios369', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(9) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 369) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0370
     * @tc.name    AlbumUserScenarios370
     * @tc.desc    Album vip and singer counts 370 probe 370
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios370', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(10) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 370) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0371
     * @tc.name    AlbumUserScenarios371
     * @tc.desc    Album vip and singer counts 371 probe 371
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios371', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(11) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 371) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0372
     * @tc.name    AlbumUserScenarios372
     * @tc.desc    Album vip and singer counts 372 probe 372
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios372', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(12) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 372) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0373
     * @tc.name    AlbumUserScenarios373
     * @tc.desc    Album vip and singer counts 373 probe 373
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios373', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(13) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 373) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0374
     * @tc.name    AlbumUserScenarios374
     * @tc.desc    Album vip and singer counts 374 probe 374
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios374', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(14) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 374) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0375
     * @tc.name    AlbumUserScenarios375
     * @tc.desc    Album vip and singer counts 375 probe 375
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios375', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(15) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 375) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0376
     * @tc.name    AlbumUserScenarios376
     * @tc.desc    Album vip and singer counts 376 probe 376
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios376', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(16) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 376) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0377
     * @tc.name    AlbumUserScenarios377
     * @tc.desc    Album vip and singer counts 377 probe 377
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios377', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(17) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 377) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0378
     * @tc.name    AlbumUserScenarios378
     * @tc.desc    Album vip and singer counts 378 probe 378
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios378', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(18) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 378) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0379
     * @tc.name    AlbumUserScenarios379
     * @tc.desc    Album vip and singer counts 379 probe 379
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios379', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(19) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 379) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0380
     * @tc.name    AlbumUserScenarios380
     * @tc.desc    Album vip and singer counts 380 probe 380
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios380', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(20) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 380) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0381
     * @tc.name    AlbumUserScenarios381
     * @tc.desc    Album vip and singer counts 381 probe 381
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios381', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(21) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 381) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0382
     * @tc.name    AlbumUserScenarios382
     * @tc.desc    Album vip and singer counts 382 probe 382
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumUserScenarios382', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countVip() >= 0).assertEqual(true);
      expect(m.singerCount() > 0).assertEqual(true);
      expect(m.hasUniqueIds()).assertEqual(true);
      expect(m.hasMissingId()).assertEqual(true);
      expect(m.getTrackById(22)).assertEqual(undefined);
      expect(m.getTrackById(23) !== undefined).assertEqual(true);
      expect(m.getTrackById(1000 + 382) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

