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

export default function albumOperationsSuite() {
  describe('AlbumOperationsSuite', () => {
    let m: AlbumModel = new AlbumModel();

    beforeEach(() => {
      m = new AlbumModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0032
     * @tc.name    AlbumOperations032
     * @tc.desc    Album track lookup for id 7 probe 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 32) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0033
     * @tc.name    AlbumOperations033
     * @tc.desc    Album track lookup for id 8 probe 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 33) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0034
     * @tc.name    AlbumOperations034
     * @tc.desc    Album track lookup for id 9 probe 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 34) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0035
     * @tc.name    AlbumOperations035
     * @tc.desc    Album track lookup for id 10 probe 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 35) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0036
     * @tc.name    AlbumOperations036
     * @tc.desc    Album track lookup for id 11 probe 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 36) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0037
     * @tc.name    AlbumOperations037
     * @tc.desc    Album track lookup for id 12 probe 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 12;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 37) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0038
     * @tc.name    AlbumOperations038
     * @tc.desc    Album track lookup for id 13 probe 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 13;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 38) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0039
     * @tc.name    AlbumOperations039
     * @tc.desc    Album track lookup for id 14 probe 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 14;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 39) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0040
     * @tc.name    AlbumOperations040
     * @tc.desc    Album track lookup for id 15 probe 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 15;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 40) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0041
     * @tc.name    AlbumOperations041
     * @tc.desc    Album track lookup for id 16 probe 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 16;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 41) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0042
     * @tc.name    AlbumOperations042
     * @tc.desc    Album track lookup for id 17 probe 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 17;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 42) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0043
     * @tc.name    AlbumOperations043
     * @tc.desc    Album track lookup for id 18 probe 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 18;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 43) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0044
     * @tc.name    AlbumOperations044
     * @tc.desc    Album track lookup for id 19 probe 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 19;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 44) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0045
     * @tc.name    AlbumOperations045
     * @tc.desc    Album track lookup for id 20 probe 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 20;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 45) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0046
     * @tc.name    AlbumOperations046
     * @tc.desc    Album track lookup for id 21 probe 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 21;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 46) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0047
     * @tc.name    AlbumOperations047
     * @tc.desc    Album track lookup for id 22 probe 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 22;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 47) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0048
     * @tc.name    AlbumOperations048
     * @tc.desc    Album track lookup for id 23 probe 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 23;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 48) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0049
     * @tc.name    AlbumOperations049
     * @tc.desc    Album track lookup for id 24 probe 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 24;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 49) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0050
     * @tc.name    AlbumOperations050
     * @tc.desc    Album track lookup for id 0 probe 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 50) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0051
     * @tc.name    AlbumOperations051
     * @tc.desc    Album track lookup for id 1 probe 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 51) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0052
     * @tc.name    AlbumOperations052
     * @tc.desc    Album track lookup for id 2 probe 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 52) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0053
     * @tc.name    AlbumOperations053
     * @tc.desc    Album track lookup for id 3 probe 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 53) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0054
     * @tc.name    AlbumOperations054
     * @tc.desc    Album track lookup for id 4 probe 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 54) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0055
     * @tc.name    AlbumOperations055
     * @tc.desc    Album track lookup for id 5 probe 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 55) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0056
     * @tc.name    AlbumOperations056
     * @tc.desc    Album track lookup for id 6 probe 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 56) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0057
     * @tc.name    AlbumOperations057
     * @tc.desc    Album track lookup for id 7 probe 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 57) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0058
     * @tc.name    AlbumOperations058
     * @tc.desc    Album track lookup for id 8 probe 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 58) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0059
     * @tc.name    AlbumOperations059
     * @tc.desc    Album track lookup for id 9 probe 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 59) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0060
     * @tc.name    AlbumOperations060
     * @tc.desc    Album track lookup for id 10 probe 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 60) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0061
     * @tc.name    AlbumOperations061
     * @tc.desc    Album track lookup for id 11 probe 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 61) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0062
     * @tc.name    AlbumOperations062
     * @tc.desc    Album track lookup for id 12 probe 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 12;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 62) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0063
     * @tc.name    AlbumOperations063
     * @tc.desc    Album track lookup for id 13 probe 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 13;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 63) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0064
     * @tc.name    AlbumOperations064
     * @tc.desc    Album track lookup for id 14 probe 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 14;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 64) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0065
     * @tc.name    AlbumOperations065
     * @tc.desc    Album track lookup for id 15 probe 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 15;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 65) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0066
     * @tc.name    AlbumOperations066
     * @tc.desc    Album track lookup for id 16 probe 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 16;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 66) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0067
     * @tc.name    AlbumOperations067
     * @tc.desc    Album track lookup for id 17 probe 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 17;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 67) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0068
     * @tc.name    AlbumOperations068
     * @tc.desc    Album track lookup for id 18 probe 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 18;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 68) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0069
     * @tc.name    AlbumOperations069
     * @tc.desc    Album track lookup for id 19 probe 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 19;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 69) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0070
     * @tc.name    AlbumOperations070
     * @tc.desc    Album track lookup for id 20 probe 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 20;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 70) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0071
     * @tc.name    AlbumOperations071
     * @tc.desc    Album track lookup for id 21 probe 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 21;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 71) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0072
     * @tc.name    AlbumOperations072
     * @tc.desc    Album track lookup for id 22 probe 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 22;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 72) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0073
     * @tc.name    AlbumOperations073
     * @tc.desc    Album track lookup for id 23 probe 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 23;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 73) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0074
     * @tc.name    AlbumOperations074
     * @tc.desc    Album track lookup for id 24 probe 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 24;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 74) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0075
     * @tc.name    AlbumOperations075
     * @tc.desc    Album track lookup for id 0 probe 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 75) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0076
     * @tc.name    AlbumOperations076
     * @tc.desc    Album track lookup for id 1 probe 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 76) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0077
     * @tc.name    AlbumOperations077
     * @tc.desc    Album track lookup for id 2 probe 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 77) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0078
     * @tc.name    AlbumOperations078
     * @tc.desc    Album track lookup for id 3 probe 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 78) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0079
     * @tc.name    AlbumOperations079
     * @tc.desc    Album track lookup for id 4 probe 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 79) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0080
     * @tc.name    AlbumOperations080
     * @tc.desc    Album track lookup for id 5 probe 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 80) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0081
     * @tc.name    AlbumOperations081
     * @tc.desc    Album track lookup for id 6 probe 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 81) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0082
     * @tc.name    AlbumOperations082
     * @tc.desc    Album track lookup for id 7 probe 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 82) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0083
     * @tc.name    AlbumOperations083
     * @tc.desc    Album track lookup for id 8 probe 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 83) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0084
     * @tc.name    AlbumOperations084
     * @tc.desc    Album track lookup for id 9 probe 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 84) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0085
     * @tc.name    AlbumOperations085
     * @tc.desc    Album track lookup for id 10 probe 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 85) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0086
     * @tc.name    AlbumOperations086
     * @tc.desc    Album track lookup for id 11 probe 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 86) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0087
     * @tc.name    AlbumOperations087
     * @tc.desc    Album track lookup for id 12 probe 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 12;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 87) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0088
     * @tc.name    AlbumOperations088
     * @tc.desc    Album track lookup for id 13 probe 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 13;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 88) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0089
     * @tc.name    AlbumOperations089
     * @tc.desc    Album track lookup for id 14 probe 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 14;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 89) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0090
     * @tc.name    AlbumOperations090
     * @tc.desc    Album track lookup for id 15 probe 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 15;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 90) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0091
     * @tc.name    AlbumOperations091
     * @tc.desc    Album track lookup for id 16 probe 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 16;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 91) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0092
     * @tc.name    AlbumOperations092
     * @tc.desc    Album track lookup for id 17 probe 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 17;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 92) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0093
     * @tc.name    AlbumOperations093
     * @tc.desc    Album track lookup for id 18 probe 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 18;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 93) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0094
     * @tc.name    AlbumOperations094
     * @tc.desc    Album track lookup for id 19 probe 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 19;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 94) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0095
     * @tc.name    AlbumOperations095
     * @tc.desc    Album track lookup for id 20 probe 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 20;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 95) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0096
     * @tc.name    AlbumOperations096
     * @tc.desc    Album track lookup for id 21 probe 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 21;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 96) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0097
     * @tc.name    AlbumOperations097
     * @tc.desc    Album track lookup for id 22 probe 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 22;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 97) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0098
     * @tc.name    AlbumOperations098
     * @tc.desc    Album track lookup for id 23 probe 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 23;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 98) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0099
     * @tc.name    AlbumOperations099
     * @tc.desc    Album track lookup for id 24 probe 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 24;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 99) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0100
     * @tc.name    AlbumOperations100
     * @tc.desc    Album track lookup for id 0 probe 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 100) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0101
     * @tc.name    AlbumOperations101
     * @tc.desc    Album track lookup for id 1 probe 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 101) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0102
     * @tc.name    AlbumOperations102
     * @tc.desc    Album track lookup for id 2 probe 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 102) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0103
     * @tc.name    AlbumOperations103
     * @tc.desc    Album track lookup for id 3 probe 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 103) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0104
     * @tc.name    AlbumOperations104
     * @tc.desc    Album track lookup for id 4 probe 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations104', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 104) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0105
     * @tc.name    AlbumOperations105
     * @tc.desc    Album track lookup for id 5 probe 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations105', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 105) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0106
     * @tc.name    AlbumOperations106
     * @tc.desc    Album track lookup for id 6 probe 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations106', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 106) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0107
     * @tc.name    AlbumOperations107
     * @tc.desc    Album track lookup for id 7 probe 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations107', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 107) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0108
     * @tc.name    AlbumOperations108
     * @tc.desc    Album track lookup for id 8 probe 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations108', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 108) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0109
     * @tc.name    AlbumOperations109
     * @tc.desc    Album track lookup for id 9 probe 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations109', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 109) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0110
     * @tc.name    AlbumOperations110
     * @tc.desc    Album track lookup for id 10 probe 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations110', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 110) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0111
     * @tc.name    AlbumOperations111
     * @tc.desc    Album track lookup for id 11 probe 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations111', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 111) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0112
     * @tc.name    AlbumOperations112
     * @tc.desc    Album track lookup for id 12 probe 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations112', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 12;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 112) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0113
     * @tc.name    AlbumOperations113
     * @tc.desc    Album track lookup for id 13 probe 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations113', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 13;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 113) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0114
     * @tc.name    AlbumOperations114
     * @tc.desc    Album track lookup for id 14 probe 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations114', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 14;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 114) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0115
     * @tc.name    AlbumOperations115
     * @tc.desc    Album track lookup for id 15 probe 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations115', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 15;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 115) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0116
     * @tc.name    AlbumOperations116
     * @tc.desc    Album track lookup for id 16 probe 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations116', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 16;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 116) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0117
     * @tc.name    AlbumOperations117
     * @tc.desc    Album track lookup for id 17 probe 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations117', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 17;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 117) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0118
     * @tc.name    AlbumOperations118
     * @tc.desc    Album track lookup for id 18 probe 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations118', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 18;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 118) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0119
     * @tc.name    AlbumOperations119
     * @tc.desc    Album track lookup for id 19 probe 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations119', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 19;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 119) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0120
     * @tc.name    AlbumOperations120
     * @tc.desc    Album track lookup for id 20 probe 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations120', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 20;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 120) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0121
     * @tc.name    AlbumOperations121
     * @tc.desc    Album track lookup for id 21 probe 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations121', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 21;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 121) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0122
     * @tc.name    AlbumOperations122
     * @tc.desc    Album track lookup for id 22 probe 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations122', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 22;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 122) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0123
     * @tc.name    AlbumOperations123
     * @tc.desc    Album track lookup for id 23 probe 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations123', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 23;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 123) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0124
     * @tc.name    AlbumOperations124
     * @tc.desc    Album track lookup for id 24 probe 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations124', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 24;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 124) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0125
     * @tc.name    AlbumOperations125
     * @tc.desc    Album track lookup for id 0 probe 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations125', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 125) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0126
     * @tc.name    AlbumOperations126
     * @tc.desc    Album track lookup for id 1 probe 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations126', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 126) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0127
     * @tc.name    AlbumOperations127
     * @tc.desc    Album track lookup for id 2 probe 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations127', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 127) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0128
     * @tc.name    AlbumOperations128
     * @tc.desc    Album track lookup for id 3 probe 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations128', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 128) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0129
     * @tc.name    AlbumOperations129
     * @tc.desc    Album track lookup for id 4 probe 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations129', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 129) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0130
     * @tc.name    AlbumOperations130
     * @tc.desc    Album track lookup for id 5 probe 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations130', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 130) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0131
     * @tc.name    AlbumOperations131
     * @tc.desc    Album track lookup for id 6 probe 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations131', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 131) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0132
     * @tc.name    AlbumOperations132
     * @tc.desc    Album track lookup for id 7 probe 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations132', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 132) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0133
     * @tc.name    AlbumOperations133
     * @tc.desc    Album track lookup for id 8 probe 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations133', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 133) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0134
     * @tc.name    AlbumOperations134
     * @tc.desc    Album track lookup for id 9 probe 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations134', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 134) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0135
     * @tc.name    AlbumOperations135
     * @tc.desc    Album track lookup for id 10 probe 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations135', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 135) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0136
     * @tc.name    AlbumOperations136
     * @tc.desc    Album track lookup for id 11 probe 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations136', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 136) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0137
     * @tc.name    AlbumOperations137
     * @tc.desc    Album track lookup for id 12 probe 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations137', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 12;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 137) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0138
     * @tc.name    AlbumOperations138
     * @tc.desc    Album track lookup for id 13 probe 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations138', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 13;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 138) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0139
     * @tc.name    AlbumOperations139
     * @tc.desc    Album track lookup for id 14 probe 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations139', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 14;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 139) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0140
     * @tc.name    AlbumOperations140
     * @tc.desc    Album track lookup for id 15 probe 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations140', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 15;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 140) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0141
     * @tc.name    AlbumOperations141
     * @tc.desc    Album track lookup for id 16 probe 141
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations141', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 16;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 141) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0142
     * @tc.name    AlbumOperations142
     * @tc.desc    Album track lookup for id 17 probe 142
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations142', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 17;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 142) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0143
     * @tc.name    AlbumOperations143
     * @tc.desc    Album track lookup for id 18 probe 143
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations143', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 18;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 143) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0144
     * @tc.name    AlbumOperations144
     * @tc.desc    Album track lookup for id 19 probe 144
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations144', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 19;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 144) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0145
     * @tc.name    AlbumOperations145
     * @tc.desc    Album track lookup for id 20 probe 145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations145', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 20;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 145) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0146
     * @tc.name    AlbumOperations146
     * @tc.desc    Album track lookup for id 21 probe 146
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations146', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 21;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 146) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0147
     * @tc.name    AlbumOperations147
     * @tc.desc    Album track lookup for id 22 probe 147
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations147', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 22;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 147) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0148
     * @tc.name    AlbumOperations148
     * @tc.desc    Album track lookup for id 23 probe 148
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations148', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 23;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 148) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0149
     * @tc.name    AlbumOperations149
     * @tc.desc    Album track lookup for id 24 probe 149
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations149', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 24;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 149) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0150
     * @tc.name    AlbumOperations150
     * @tc.desc    Album track lookup for id 0 probe 150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations150', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 150) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0151
     * @tc.name    AlbumOperations151
     * @tc.desc    Album track lookup for id 1 probe 151
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations151', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 151) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0152
     * @tc.name    AlbumOperations152
     * @tc.desc    Album track lookup for id 2 probe 152
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations152', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 152) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0153
     * @tc.name    AlbumOperations153
     * @tc.desc    Album track lookup for id 3 probe 153
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations153', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 153) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0154
     * @tc.name    AlbumOperations154
     * @tc.desc    Album track lookup for id 4 probe 154
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations154', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 154) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0155
     * @tc.name    AlbumOperations155
     * @tc.desc    Album track lookup for id 5 probe 155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations155', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 155) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0156
     * @tc.name    AlbumOperations156
     * @tc.desc    Album track lookup for id 6 probe 156
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations156', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 156) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0157
     * @tc.name    AlbumOperations157
     * @tc.desc    Album track lookup for id 7 probe 157
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations157', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 157) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0158
     * @tc.name    AlbumOperations158
     * @tc.desc    Album track lookup for id 8 probe 158
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations158', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 158) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0159
     * @tc.name    AlbumOperations159
     * @tc.desc    Album track lookup for id 9 probe 159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 159) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0160
     * @tc.name    AlbumOperations160
     * @tc.desc    Album track lookup for id 10 probe 160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 160) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0161
     * @tc.name    AlbumOperations161
     * @tc.desc    Album track lookup for id 11 probe 161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 161) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0162
     * @tc.name    AlbumOperations162
     * @tc.desc    Album track lookup for id 12 probe 162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 12;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 162) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0163
     * @tc.name    AlbumOperations163
     * @tc.desc    Album track lookup for id 13 probe 163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 13;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 163) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0164
     * @tc.name    AlbumOperations164
     * @tc.desc    Album track lookup for id 14 probe 164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 14;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 164) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0165
     * @tc.name    AlbumOperations165
     * @tc.desc    Album track lookup for id 15 probe 165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 15;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 165) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0166
     * @tc.name    AlbumOperations166
     * @tc.desc    Album track lookup for id 16 probe 166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 16;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 166) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0167
     * @tc.name    AlbumOperations167
     * @tc.desc    Album track lookup for id 17 probe 167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 17;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 167) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0168
     * @tc.name    AlbumOperations168
     * @tc.desc    Album track lookup for id 18 probe 168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 18;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 168) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0169
     * @tc.name    AlbumOperations169
     * @tc.desc    Album track lookup for id 19 probe 169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 19;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 169) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0170
     * @tc.name    AlbumOperations170
     * @tc.desc    Album track lookup for id 20 probe 170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 20;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 170) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0171
     * @tc.name    AlbumOperations171
     * @tc.desc    Album track lookup for id 21 probe 171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 21;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 171) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0172
     * @tc.name    AlbumOperations172
     * @tc.desc    Album track lookup for id 22 probe 172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 22;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 172) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0173
     * @tc.name    AlbumOperations173
     * @tc.desc    Album track lookup for id 23 probe 173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 23;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 173) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0174
     * @tc.name    AlbumOperations174
     * @tc.desc    Album track lookup for id 24 probe 174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 24;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 174) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0175
     * @tc.name    AlbumOperations175
     * @tc.desc    Album track lookup for id 0 probe 175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 175) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0176
     * @tc.name    AlbumOperations176
     * @tc.desc    Album track lookup for id 1 probe 176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 176) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0177
     * @tc.name    AlbumOperations177
     * @tc.desc    Album track lookup for id 2 probe 177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 177) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0178
     * @tc.name    AlbumOperations178
     * @tc.desc    Album track lookup for id 3 probe 178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 178) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0179
     * @tc.name    AlbumOperations179
     * @tc.desc    Album track lookup for id 4 probe 179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 179) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0180
     * @tc.name    AlbumOperations180
     * @tc.desc    Album track lookup for id 5 probe 180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 180) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0181
     * @tc.name    AlbumOperations181
     * @tc.desc    Album track lookup for id 6 probe 181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 181) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0182
     * @tc.name    AlbumOperations182
     * @tc.desc    Album track lookup for id 7 probe 182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 182) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0183
     * @tc.name    AlbumOperations183
     * @tc.desc    Album track lookup for id 8 probe 183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 183) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0184
     * @tc.name    AlbumOperations184
     * @tc.desc    Album track lookup for id 9 probe 184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 184) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0185
     * @tc.name    AlbumOperations185
     * @tc.desc    Album track lookup for id 10 probe 185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 185) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0186
     * @tc.name    AlbumOperations186
     * @tc.desc    Album track lookup for id 11 probe 186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 186) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0187
     * @tc.name    AlbumOperations187
     * @tc.desc    Album track lookup for id 12 probe 187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 12;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 187) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0188
     * @tc.name    AlbumOperations188
     * @tc.desc    Album track lookup for id 13 probe 188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 13;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 188) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0189
     * @tc.name    AlbumOperations189
     * @tc.desc    Album track lookup for id 14 probe 189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 14;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 189) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0190
     * @tc.name    AlbumOperations190
     * @tc.desc    Album track lookup for id 15 probe 190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 15;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 190) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0191
     * @tc.name    AlbumOperations191
     * @tc.desc    Album track lookup for id 16 probe 191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 16;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 191) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0192
     * @tc.name    AlbumOperations192
     * @tc.desc    Album track lookup for id 17 probe 192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 17;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 192) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0193
     * @tc.name    AlbumOperations193
     * @tc.desc    Album track lookup for id 18 probe 193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 18;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 193) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0194
     * @tc.name    AlbumOperations194
     * @tc.desc    Album track lookup for id 19 probe 194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 19;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 194) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0195
     * @tc.name    AlbumOperations195
     * @tc.desc    Album track lookup for id 20 probe 195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 20;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 195) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0196
     * @tc.name    AlbumOperations196
     * @tc.desc    Album track lookup for id 21 probe 196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 21;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 196) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0197
     * @tc.name    AlbumOperations197
     * @tc.desc    Album track lookup for id 22 probe 197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 22;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 197) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0198
     * @tc.name    AlbumOperations198
     * @tc.desc    Album track lookup for id 23 probe 198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 23;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 198) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0199
     * @tc.name    AlbumOperations199
     * @tc.desc    Album track lookup for id 24 probe 199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 24;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 199) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0200
     * @tc.name    AlbumOperations200
     * @tc.desc    Album track lookup for id 0 probe 200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 200) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0201
     * @tc.name    AlbumOperations201
     * @tc.desc    Album track lookup for id 1 probe 201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 201) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0202
     * @tc.name    AlbumOperations202
     * @tc.desc    Album track lookup for id 2 probe 202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 202) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0203
     * @tc.name    AlbumOperations203
     * @tc.desc    Album track lookup for id 3 probe 203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 203) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0204
     * @tc.name    AlbumOperations204
     * @tc.desc    Album track lookup for id 4 probe 204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 204) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0205
     * @tc.name    AlbumOperations205
     * @tc.desc    Album track lookup for id 5 probe 205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 205) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0206
     * @tc.name    AlbumOperations206
     * @tc.desc    Album track lookup for id 6 probe 206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 206) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0207
     * @tc.name    AlbumOperations207
     * @tc.desc    Album track lookup for id 7 probe 207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 207) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0208
     * @tc.name    AlbumOperations208
     * @tc.desc    Album track lookup for id 8 probe 208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumOperations208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const track = m.getTrackById(id);
      if (id === 22) { expect(track === undefined).assertEqual(true); }
      else { expect(track !== undefined).assertEqual(true); }
      expect(m.getTrackById(1000 + 208) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

