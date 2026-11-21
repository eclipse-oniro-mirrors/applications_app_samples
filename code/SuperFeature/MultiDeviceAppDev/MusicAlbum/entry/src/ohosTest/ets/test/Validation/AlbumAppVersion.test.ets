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

export default function albumAppVersionSuite() {
  describe('AlbumAppVersionSuite', () => {
    let m: AlbumModel = new AlbumModel();

    beforeEach(() => {
      m = new AlbumModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1046
     * @tc.name    AlbumAppVersion1046
     * @tc.desc    Album breakpoint font mapping 2 probe 1046
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1046) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1047
     * @tc.name    AlbumAppVersion1047
     * @tc.desc    Album breakpoint margin mapping 3 probe 1047
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1047) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1048
     * @tc.name    AlbumAppVersion1048
     * @tc.desc    Album breakpoint font mapping 0 probe 1048
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1048) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1049
     * @tc.name    AlbumAppVersion1049
     * @tc.desc    Album breakpoint margin mapping 1 probe 1049
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1049) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1050
     * @tc.name    AlbumAppVersion1050
     * @tc.desc    Album breakpoint font mapping 2 probe 1050
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1050) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1051
     * @tc.name    AlbumAppVersion1051
     * @tc.desc    Album breakpoint margin mapping 3 probe 1051
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1051) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1052
     * @tc.name    AlbumAppVersion1052
     * @tc.desc    Album breakpoint font mapping 0 probe 1052
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1052) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1053
     * @tc.name    AlbumAppVersion1053
     * @tc.desc    Album breakpoint margin mapping 1 probe 1053
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1053) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1054
     * @tc.name    AlbumAppVersion1054
     * @tc.desc    Album breakpoint font mapping 2 probe 1054
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1054) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1055
     * @tc.name    AlbumAppVersion1055
     * @tc.desc    Album breakpoint margin mapping 3 probe 1055
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1055) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1056
     * @tc.name    AlbumAppVersion1056
     * @tc.desc    Album breakpoint font mapping 0 probe 1056
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1056) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1057
     * @tc.name    AlbumAppVersion1057
     * @tc.desc    Album breakpoint margin mapping 1 probe 1057
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1057) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1058
     * @tc.name    AlbumAppVersion1058
     * @tc.desc    Album breakpoint font mapping 2 probe 1058
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1058) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1059
     * @tc.name    AlbumAppVersion1059
     * @tc.desc    Album breakpoint margin mapping 3 probe 1059
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1059) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1060
     * @tc.name    AlbumAppVersion1060
     * @tc.desc    Album breakpoint font mapping 0 probe 1060
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1060) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1061
     * @tc.name    AlbumAppVersion1061
     * @tc.desc    Album breakpoint margin mapping 1 probe 1061
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1061) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1062
     * @tc.name    AlbumAppVersion1062
     * @tc.desc    Album breakpoint font mapping 2 probe 1062
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1062) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1063
     * @tc.name    AlbumAppVersion1063
     * @tc.desc    Album breakpoint margin mapping 3 probe 1063
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1063) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1064
     * @tc.name    AlbumAppVersion1064
     * @tc.desc    Album breakpoint font mapping 0 probe 1064
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1064) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1065
     * @tc.name    AlbumAppVersion1065
     * @tc.desc    Album breakpoint margin mapping 1 probe 1065
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1065) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1066
     * @tc.name    AlbumAppVersion1066
     * @tc.desc    Album breakpoint font mapping 2 probe 1066
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1066) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1067
     * @tc.name    AlbumAppVersion1067
     * @tc.desc    Album breakpoint margin mapping 3 probe 1067
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1067) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1068
     * @tc.name    AlbumAppVersion1068
     * @tc.desc    Album breakpoint font mapping 0 probe 1068
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1068) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1069
     * @tc.name    AlbumAppVersion1069
     * @tc.desc    Album breakpoint margin mapping 1 probe 1069
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1069) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1070
     * @tc.name    AlbumAppVersion1070
     * @tc.desc    Album breakpoint font mapping 2 probe 1070
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1070) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1071
     * @tc.name    AlbumAppVersion1071
     * @tc.desc    Album breakpoint margin mapping 3 probe 1071
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1071) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1072
     * @tc.name    AlbumAppVersion1072
     * @tc.desc    Album breakpoint font mapping 0 probe 1072
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1072) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1073
     * @tc.name    AlbumAppVersion1073
     * @tc.desc    Album breakpoint margin mapping 1 probe 1073
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1073) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1074
     * @tc.name    AlbumAppVersion1074
     * @tc.desc    Album breakpoint font mapping 2 probe 1074
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1074) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1075
     * @tc.name    AlbumAppVersion1075
     * @tc.desc    Album breakpoint margin mapping 3 probe 1075
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1075) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1076
     * @tc.name    AlbumAppVersion1076
     * @tc.desc    Album breakpoint font mapping 0 probe 1076
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1076) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1077
     * @tc.name    AlbumAppVersion1077
     * @tc.desc    Album breakpoint margin mapping 1 probe 1077
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1077) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1078
     * @tc.name    AlbumAppVersion1078
     * @tc.desc    Album breakpoint font mapping 2 probe 1078
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1078) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1079
     * @tc.name    AlbumAppVersion1079
     * @tc.desc    Album breakpoint margin mapping 3 probe 1079
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1079) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1080
     * @tc.name    AlbumAppVersion1080
     * @tc.desc    Album breakpoint font mapping 0 probe 1080
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1080) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1081
     * @tc.name    AlbumAppVersion1081
     * @tc.desc    Album breakpoint margin mapping 1 probe 1081
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1081) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1082
     * @tc.name    AlbumAppVersion1082
     * @tc.desc    Album breakpoint font mapping 2 probe 1082
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1082) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1083
     * @tc.name    AlbumAppVersion1083
     * @tc.desc    Album breakpoint margin mapping 3 probe 1083
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1083) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1084
     * @tc.name    AlbumAppVersion1084
     * @tc.desc    Album breakpoint font mapping 0 probe 1084
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1084) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1085
     * @tc.name    AlbumAppVersion1085
     * @tc.desc    Album breakpoint margin mapping 1 probe 1085
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1085) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1086
     * @tc.name    AlbumAppVersion1086
     * @tc.desc    Album breakpoint font mapping 2 probe 1086
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1086) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1087
     * @tc.name    AlbumAppVersion1087
     * @tc.desc    Album breakpoint margin mapping 3 probe 1087
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1087) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1088
     * @tc.name    AlbumAppVersion1088
     * @tc.desc    Album breakpoint font mapping 0 probe 1088
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1088) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1089
     * @tc.name    AlbumAppVersion1089
     * @tc.desc    Album breakpoint margin mapping 1 probe 1089
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1089) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1090
     * @tc.name    AlbumAppVersion1090
     * @tc.desc    Album breakpoint font mapping 2 probe 1090
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1090) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1091
     * @tc.name    AlbumAppVersion1091
     * @tc.desc    Album breakpoint margin mapping 3 probe 1091
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1091) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1092
     * @tc.name    AlbumAppVersion1092
     * @tc.desc    Album breakpoint font mapping 0 probe 1092
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1092) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1093
     * @tc.name    AlbumAppVersion1093
     * @tc.desc    Album breakpoint margin mapping 1 probe 1093
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1093) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1094
     * @tc.name    AlbumAppVersion1094
     * @tc.desc    Album breakpoint font mapping 2 probe 1094
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1094) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1095
     * @tc.name    AlbumAppVersion1095
     * @tc.desc    Album breakpoint margin mapping 3 probe 1095
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1095) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1096
     * @tc.name    AlbumAppVersion1096
     * @tc.desc    Album breakpoint font mapping 0 probe 1096
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1096) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1097
     * @tc.name    AlbumAppVersion1097
     * @tc.desc    Album breakpoint margin mapping 1 probe 1097
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1097) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1098
     * @tc.name    AlbumAppVersion1098
     * @tc.desc    Album breakpoint font mapping 2 probe 1098
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1098) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1099
     * @tc.name    AlbumAppVersion1099
     * @tc.desc    Album breakpoint margin mapping 3 probe 1099
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1099) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1100
     * @tc.name    AlbumAppVersion1100
     * @tc.desc    Album breakpoint font mapping 0 probe 1100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1100) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1101
     * @tc.name    AlbumAppVersion1101
     * @tc.desc    Album breakpoint margin mapping 1 probe 1101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1101) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1102
     * @tc.name    AlbumAppVersion1102
     * @tc.desc    Album breakpoint font mapping 2 probe 1102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1102) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1103
     * @tc.name    AlbumAppVersion1103
     * @tc.desc    Album breakpoint margin mapping 3 probe 1103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1103) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1104
     * @tc.name    AlbumAppVersion1104
     * @tc.desc    Album breakpoint font mapping 0 probe 1104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1104', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1104) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1105
     * @tc.name    AlbumAppVersion1105
     * @tc.desc    Album breakpoint margin mapping 1 probe 1105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1105', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1105) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1106
     * @tc.name    AlbumAppVersion1106
     * @tc.desc    Album breakpoint font mapping 2 probe 1106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1106', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1106) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1107
     * @tc.name    AlbumAppVersion1107
     * @tc.desc    Album breakpoint margin mapping 3 probe 1107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1107', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1107) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1108
     * @tc.name    AlbumAppVersion1108
     * @tc.desc    Album breakpoint font mapping 0 probe 1108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1108', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1108) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1109
     * @tc.name    AlbumAppVersion1109
     * @tc.desc    Album breakpoint margin mapping 1 probe 1109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1109', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1109) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1110
     * @tc.name    AlbumAppVersion1110
     * @tc.desc    Album breakpoint font mapping 2 probe 1110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1110', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1110) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1111
     * @tc.name    AlbumAppVersion1111
     * @tc.desc    Album breakpoint margin mapping 3 probe 1111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1111', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1111) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1112
     * @tc.name    AlbumAppVersion1112
     * @tc.desc    Album breakpoint font mapping 0 probe 1112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1112', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1112) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1113
     * @tc.name    AlbumAppVersion1113
     * @tc.desc    Album breakpoint margin mapping 1 probe 1113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1113', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1113) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1114
     * @tc.name    AlbumAppVersion1114
     * @tc.desc    Album breakpoint font mapping 2 probe 1114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1114', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1114) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1115
     * @tc.name    AlbumAppVersion1115
     * @tc.desc    Album breakpoint margin mapping 3 probe 1115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1115', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1115) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1116
     * @tc.name    AlbumAppVersion1116
     * @tc.desc    Album breakpoint font mapping 0 probe 1116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1116', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1116) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1117
     * @tc.name    AlbumAppVersion1117
     * @tc.desc    Album breakpoint margin mapping 1 probe 1117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1117', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1117) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1118
     * @tc.name    AlbumAppVersion1118
     * @tc.desc    Album breakpoint font mapping 2 probe 1118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1118', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1118) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1119
     * @tc.name    AlbumAppVersion1119
     * @tc.desc    Album breakpoint margin mapping 3 probe 1119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1119', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1119) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1120
     * @tc.name    AlbumAppVersion1120
     * @tc.desc    Album breakpoint font mapping 0 probe 1120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1120', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1120) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1121
     * @tc.name    AlbumAppVersion1121
     * @tc.desc    Album breakpoint margin mapping 1 probe 1121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1121', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1121) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1122
     * @tc.name    AlbumAppVersion1122
     * @tc.desc    Album breakpoint font mapping 2 probe 1122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1122', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1122) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1123
     * @tc.name    AlbumAppVersion1123
     * @tc.desc    Album breakpoint margin mapping 3 probe 1123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1123', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1123) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1124
     * @tc.name    AlbumAppVersion1124
     * @tc.desc    Album breakpoint font mapping 0 probe 1124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1124', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1124) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1125
     * @tc.name    AlbumAppVersion1125
     * @tc.desc    Album breakpoint margin mapping 1 probe 1125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1125', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1125) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1126
     * @tc.name    AlbumAppVersion1126
     * @tc.desc    Album breakpoint font mapping 2 probe 1126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1126', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1126) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1127
     * @tc.name    AlbumAppVersion1127
     * @tc.desc    Album breakpoint margin mapping 3 probe 1127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1127', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1127) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1128
     * @tc.name    AlbumAppVersion1128
     * @tc.desc    Album breakpoint font mapping 0 probe 1128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1128', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1128) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1129
     * @tc.name    AlbumAppVersion1129
     * @tc.desc    Album breakpoint margin mapping 1 probe 1129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1129', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1129) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1130
     * @tc.name    AlbumAppVersion1130
     * @tc.desc    Album breakpoint font mapping 2 probe 1130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1130', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1130) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1131
     * @tc.name    AlbumAppVersion1131
     * @tc.desc    Album breakpoint margin mapping 3 probe 1131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1131', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1131) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1132
     * @tc.name    AlbumAppVersion1132
     * @tc.desc    Album breakpoint font mapping 0 probe 1132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1132', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1132) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1133
     * @tc.name    AlbumAppVersion1133
     * @tc.desc    Album breakpoint margin mapping 1 probe 1133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1133', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1133) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1134
     * @tc.name    AlbumAppVersion1134
     * @tc.desc    Album breakpoint font mapping 2 probe 1134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1134', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1134) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1135
     * @tc.name    AlbumAppVersion1135
     * @tc.desc    Album breakpoint margin mapping 3 probe 1135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1135', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1135) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1136
     * @tc.name    AlbumAppVersion1136
     * @tc.desc    Album breakpoint font mapping 0 probe 1136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1136', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1136) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1137
     * @tc.name    AlbumAppVersion1137
     * @tc.desc    Album breakpoint margin mapping 1 probe 1137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1137', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1137) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1138
     * @tc.name    AlbumAppVersion1138
     * @tc.desc    Album breakpoint font mapping 2 probe 1138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1138', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1138) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1139
     * @tc.name    AlbumAppVersion1139
     * @tc.desc    Album breakpoint margin mapping 3 probe 1139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1139', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1139) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1140
     * @tc.name    AlbumAppVersion1140
     * @tc.desc    Album breakpoint font mapping 0 probe 1140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1140', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1140) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1141
     * @tc.name    AlbumAppVersion1141
     * @tc.desc    Album breakpoint margin mapping 1 probe 1141
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1141', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1141) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1142
     * @tc.name    AlbumAppVersion1142
     * @tc.desc    Album breakpoint font mapping 2 probe 1142
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1142', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1142) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1143
     * @tc.name    AlbumAppVersion1143
     * @tc.desc    Album breakpoint margin mapping 3 probe 1143
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1143', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1143) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1144
     * @tc.name    AlbumAppVersion1144
     * @tc.desc    Album breakpoint font mapping 0 probe 1144
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1144', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1144) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1145
     * @tc.name    AlbumAppVersion1145
     * @tc.desc    Album breakpoint margin mapping 1 probe 1145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1145', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1145) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1146
     * @tc.name    AlbumAppVersion1146
     * @tc.desc    Album breakpoint font mapping 2 probe 1146
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1146', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1146) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1147
     * @tc.name    AlbumAppVersion1147
     * @tc.desc    Album breakpoint margin mapping 3 probe 1147
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1147', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1147) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1148
     * @tc.name    AlbumAppVersion1148
     * @tc.desc    Album breakpoint font mapping 0 probe 1148
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1148', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1148) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1149
     * @tc.name    AlbumAppVersion1149
     * @tc.desc    Album breakpoint margin mapping 1 probe 1149
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1149', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1149) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1150
     * @tc.name    AlbumAppVersion1150
     * @tc.desc    Album breakpoint font mapping 2 probe 1150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1150', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1150) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1151
     * @tc.name    AlbumAppVersion1151
     * @tc.desc    Album breakpoint margin mapping 3 probe 1151
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1151', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1151) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1152
     * @tc.name    AlbumAppVersion1152
     * @tc.desc    Album breakpoint font mapping 0 probe 1152
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1152', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1152) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1153
     * @tc.name    AlbumAppVersion1153
     * @tc.desc    Album breakpoint margin mapping 1 probe 1153
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1153', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1153) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1154
     * @tc.name    AlbumAppVersion1154
     * @tc.desc    Album breakpoint font mapping 2 probe 1154
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1154', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1154) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1155
     * @tc.name    AlbumAppVersion1155
     * @tc.desc    Album breakpoint margin mapping 3 probe 1155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1155', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1155) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1156
     * @tc.name    AlbumAppVersion1156
     * @tc.desc    Album breakpoint font mapping 0 probe 1156
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1156', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1156) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1157
     * @tc.name    AlbumAppVersion1157
     * @tc.desc    Album breakpoint margin mapping 1 probe 1157
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1157', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1157) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1158
     * @tc.name    AlbumAppVersion1158
     * @tc.desc    Album breakpoint font mapping 2 probe 1158
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1158', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1158) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1159
     * @tc.name    AlbumAppVersion1159
     * @tc.desc    Album breakpoint margin mapping 3 probe 1159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1159) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1160
     * @tc.name    AlbumAppVersion1160
     * @tc.desc    Album breakpoint font mapping 0 probe 1160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1160) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1161
     * @tc.name    AlbumAppVersion1161
     * @tc.desc    Album breakpoint margin mapping 1 probe 1161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1161) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1162
     * @tc.name    AlbumAppVersion1162
     * @tc.desc    Album breakpoint font mapping 2 probe 1162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1162) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1163
     * @tc.name    AlbumAppVersion1163
     * @tc.desc    Album breakpoint margin mapping 3 probe 1163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1163) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1164
     * @tc.name    AlbumAppVersion1164
     * @tc.desc    Album breakpoint font mapping 0 probe 1164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1164) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1165
     * @tc.name    AlbumAppVersion1165
     * @tc.desc    Album breakpoint margin mapping 1 probe 1165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1165) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1166
     * @tc.name    AlbumAppVersion1166
     * @tc.desc    Album breakpoint font mapping 2 probe 1166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1166) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1167
     * @tc.name    AlbumAppVersion1167
     * @tc.desc    Album breakpoint margin mapping 3 probe 1167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1167) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1168
     * @tc.name    AlbumAppVersion1168
     * @tc.desc    Album breakpoint font mapping 0 probe 1168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1168) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1169
     * @tc.name    AlbumAppVersion1169
     * @tc.desc    Album breakpoint margin mapping 1 probe 1169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1169) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1170
     * @tc.name    AlbumAppVersion1170
     * @tc.desc    Album breakpoint font mapping 2 probe 1170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1170) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1171
     * @tc.name    AlbumAppVersion1171
     * @tc.desc    Album breakpoint margin mapping 3 probe 1171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1171) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1172
     * @tc.name    AlbumAppVersion1172
     * @tc.desc    Album breakpoint font mapping 0 probe 1172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1172) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1173
     * @tc.name    AlbumAppVersion1173
     * @tc.desc    Album breakpoint margin mapping 1 probe 1173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1173) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1174
     * @tc.name    AlbumAppVersion1174
     * @tc.desc    Album breakpoint font mapping 2 probe 1174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1174) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1175
     * @tc.name    AlbumAppVersion1175
     * @tc.desc    Album breakpoint margin mapping 3 probe 1175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1175) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1176
     * @tc.name    AlbumAppVersion1176
     * @tc.desc    Album breakpoint font mapping 0 probe 1176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1176) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1177
     * @tc.name    AlbumAppVersion1177
     * @tc.desc    Album breakpoint margin mapping 1 probe 1177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1177) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1178
     * @tc.name    AlbumAppVersion1178
     * @tc.desc    Album breakpoint font mapping 2 probe 1178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1178) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1179
     * @tc.name    AlbumAppVersion1179
     * @tc.desc    Album breakpoint margin mapping 3 probe 1179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1179) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1180
     * @tc.name    AlbumAppVersion1180
     * @tc.desc    Album breakpoint font mapping 0 probe 1180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1180) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1181
     * @tc.name    AlbumAppVersion1181
     * @tc.desc    Album breakpoint margin mapping 1 probe 1181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1181) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1182
     * @tc.name    AlbumAppVersion1182
     * @tc.desc    Album breakpoint font mapping 2 probe 1182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1182) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1183
     * @tc.name    AlbumAppVersion1183
     * @tc.desc    Album breakpoint margin mapping 3 probe 1183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1183) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1184
     * @tc.name    AlbumAppVersion1184
     * @tc.desc    Album breakpoint font mapping 0 probe 1184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1184) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1185
     * @tc.name    AlbumAppVersion1185
     * @tc.desc    Album breakpoint margin mapping 1 probe 1185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1185) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1186
     * @tc.name    AlbumAppVersion1186
     * @tc.desc    Album breakpoint font mapping 2 probe 1186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1186) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1187
     * @tc.name    AlbumAppVersion1187
     * @tc.desc    Album breakpoint margin mapping 3 probe 1187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1187) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1188
     * @tc.name    AlbumAppVersion1188
     * @tc.desc    Album breakpoint font mapping 0 probe 1188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1188) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1189
     * @tc.name    AlbumAppVersion1189
     * @tc.desc    Album breakpoint margin mapping 1 probe 1189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1189) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1190
     * @tc.name    AlbumAppVersion1190
     * @tc.desc    Album breakpoint font mapping 2 probe 1190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1190) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1191
     * @tc.name    AlbumAppVersion1191
     * @tc.desc    Album breakpoint margin mapping 3 probe 1191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1191) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1192
     * @tc.name    AlbumAppVersion1192
     * @tc.desc    Album breakpoint font mapping 0 probe 1192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1192) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1193
     * @tc.name    AlbumAppVersion1193
     * @tc.desc    Album breakpoint margin mapping 1 probe 1193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1193) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1194
     * @tc.name    AlbumAppVersion1194
     * @tc.desc    Album breakpoint font mapping 2 probe 1194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1194) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1195
     * @tc.name    AlbumAppVersion1195
     * @tc.desc    Album breakpoint margin mapping 3 probe 1195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1195) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1196
     * @tc.name    AlbumAppVersion1196
     * @tc.desc    Album breakpoint font mapping 0 probe 1196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1196) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1197
     * @tc.name    AlbumAppVersion1197
     * @tc.desc    Album breakpoint margin mapping 1 probe 1197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1197) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1198
     * @tc.name    AlbumAppVersion1198
     * @tc.desc    Album breakpoint font mapping 2 probe 1198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1198) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1199
     * @tc.name    AlbumAppVersion1199
     * @tc.desc    Album breakpoint margin mapping 3 probe 1199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1199) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1200
     * @tc.name    AlbumAppVersion1200
     * @tc.desc    Album breakpoint font mapping 0 probe 1200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1200) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1201
     * @tc.name    AlbumAppVersion1201
     * @tc.desc    Album breakpoint margin mapping 1 probe 1201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1201) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1202
     * @tc.name    AlbumAppVersion1202
     * @tc.desc    Album breakpoint font mapping 2 probe 1202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1202) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1203
     * @tc.name    AlbumAppVersion1203
     * @tc.desc    Album breakpoint margin mapping 3 probe 1203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1203) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1204
     * @tc.name    AlbumAppVersion1204
     * @tc.desc    Album breakpoint font mapping 0 probe 1204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1204) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1205
     * @tc.name    AlbumAppVersion1205
     * @tc.desc    Album breakpoint margin mapping 1 probe 1205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1205) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1206
     * @tc.name    AlbumAppVersion1206
     * @tc.desc    Album breakpoint font mapping 2 probe 1206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1206) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1207
     * @tc.name    AlbumAppVersion1207
     * @tc.desc    Album breakpoint margin mapping 3 probe 1207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1207) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1208
     * @tc.name    AlbumAppVersion1208
     * @tc.desc    Album breakpoint font mapping 0 probe 1208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1208) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1209
     * @tc.name    AlbumAppVersion1209
     * @tc.desc    Album breakpoint margin mapping 1 probe 1209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1209) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1210
     * @tc.name    AlbumAppVersion1210
     * @tc.desc    Album breakpoint font mapping 2 probe 1210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1210) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1211
     * @tc.name    AlbumAppVersion1211
     * @tc.desc    Album breakpoint margin mapping 3 probe 1211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1211) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1212
     * @tc.name    AlbumAppVersion1212
     * @tc.desc    Album breakpoint font mapping 0 probe 1212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1212) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1213
     * @tc.name    AlbumAppVersion1213
     * @tc.desc    Album breakpoint margin mapping 1 probe 1213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1213) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1214
     * @tc.name    AlbumAppVersion1214
     * @tc.desc    Album breakpoint font mapping 2 probe 1214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1214) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1215
     * @tc.name    AlbumAppVersion1215
     * @tc.desc    Album breakpoint margin mapping 3 probe 1215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1215) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1216
     * @tc.name    AlbumAppVersion1216
     * @tc.desc    Album breakpoint font mapping 0 probe 1216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1216) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1217
     * @tc.name    AlbumAppVersion1217
     * @tc.desc    Album breakpoint margin mapping 1 probe 1217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1217) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1218
     * @tc.name    AlbumAppVersion1218
     * @tc.desc    Album breakpoint font mapping 2 probe 1218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1218) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1219
     * @tc.name    AlbumAppVersion1219
     * @tc.desc    Album breakpoint margin mapping 3 probe 1219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1219) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1220
     * @tc.name    AlbumAppVersion1220
     * @tc.desc    Album breakpoint font mapping 0 probe 1220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1220) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1221
     * @tc.name    AlbumAppVersion1221
     * @tc.desc    Album breakpoint margin mapping 1 probe 1221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1221) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1222
     * @tc.name    AlbumAppVersion1222
     * @tc.desc    Album breakpoint font mapping 2 probe 1222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1222) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1223
     * @tc.name    AlbumAppVersion1223
     * @tc.desc    Album breakpoint margin mapping 3 probe 1223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1223) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1224
     * @tc.name    AlbumAppVersion1224
     * @tc.desc    Album breakpoint font mapping 0 probe 1224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1224) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1225
     * @tc.name    AlbumAppVersion1225
     * @tc.desc    Album breakpoint margin mapping 1 probe 1225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1225) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1226
     * @tc.name    AlbumAppVersion1226
     * @tc.desc    Album breakpoint font mapping 2 probe 1226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1226) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1227
     * @tc.name    AlbumAppVersion1227
     * @tc.desc    Album breakpoint margin mapping 3 probe 1227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1227) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1228
     * @tc.name    AlbumAppVersion1228
     * @tc.desc    Album breakpoint font mapping 0 probe 1228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1228) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1229
     * @tc.name    AlbumAppVersion1229
     * @tc.desc    Album breakpoint margin mapping 1 probe 1229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1229) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1230
     * @tc.name    AlbumAppVersion1230
     * @tc.desc    Album breakpoint font mapping 2 probe 1230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1230', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1230) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1231
     * @tc.name    AlbumAppVersion1231
     * @tc.desc    Album breakpoint margin mapping 3 probe 1231
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1231', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1231) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1232
     * @tc.name    AlbumAppVersion1232
     * @tc.desc    Album breakpoint font mapping 0 probe 1232
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1232', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1232) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1233
     * @tc.name    AlbumAppVersion1233
     * @tc.desc    Album breakpoint margin mapping 1 probe 1233
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1233', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1233) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1234
     * @tc.name    AlbumAppVersion1234
     * @tc.desc    Album breakpoint font mapping 2 probe 1234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1234) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1235
     * @tc.name    AlbumAppVersion1235
     * @tc.desc    Album breakpoint margin mapping 3 probe 1235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1235) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1236
     * @tc.name    AlbumAppVersion1236
     * @tc.desc    Album breakpoint font mapping 0 probe 1236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1236) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1237
     * @tc.name    AlbumAppVersion1237
     * @tc.desc    Album breakpoint margin mapping 1 probe 1237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1237) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1238
     * @tc.name    AlbumAppVersion1238
     * @tc.desc    Album breakpoint font mapping 2 probe 1238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1238) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1239
     * @tc.name    AlbumAppVersion1239
     * @tc.desc    Album breakpoint margin mapping 3 probe 1239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1239) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1240
     * @tc.name    AlbumAppVersion1240
     * @tc.desc    Album breakpoint font mapping 0 probe 1240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1240) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1241
     * @tc.name    AlbumAppVersion1241
     * @tc.desc    Album breakpoint margin mapping 1 probe 1241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1241) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1242
     * @tc.name    AlbumAppVersion1242
     * @tc.desc    Album breakpoint font mapping 2 probe 1242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1242) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1243
     * @tc.name    AlbumAppVersion1243
     * @tc.desc    Album breakpoint margin mapping 3 probe 1243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1243) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1244
     * @tc.name    AlbumAppVersion1244
     * @tc.desc    Album breakpoint font mapping 0 probe 1244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1244) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1245
     * @tc.name    AlbumAppVersion1245
     * @tc.desc    Album breakpoint margin mapping 1 probe 1245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1245) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1246
     * @tc.name    AlbumAppVersion1246
     * @tc.desc    Album breakpoint font mapping 2 probe 1246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1246) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1247
     * @tc.name    AlbumAppVersion1247
     * @tc.desc    Album breakpoint margin mapping 3 probe 1247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1247) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1248
     * @tc.name    AlbumAppVersion1248
     * @tc.desc    Album breakpoint font mapping 0 probe 1248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1248) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1249
     * @tc.name    AlbumAppVersion1249
     * @tc.desc    Album breakpoint margin mapping 1 probe 1249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1249) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1250
     * @tc.name    AlbumAppVersion1250
     * @tc.desc    Album breakpoint font mapping 2 probe 1250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1250) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1251
     * @tc.name    AlbumAppVersion1251
     * @tc.desc    Album breakpoint margin mapping 3 probe 1251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1251) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1252
     * @tc.name    AlbumAppVersion1252
     * @tc.desc    Album breakpoint font mapping 0 probe 1252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1252) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1253
     * @tc.name    AlbumAppVersion1253
     * @tc.desc    Album breakpoint margin mapping 1 probe 1253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1253) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1254
     * @tc.name    AlbumAppVersion1254
     * @tc.desc    Album breakpoint font mapping 2 probe 1254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1254) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1255
     * @tc.name    AlbumAppVersion1255
     * @tc.desc    Album breakpoint margin mapping 3 probe 1255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1255) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1256
     * @tc.name    AlbumAppVersion1256
     * @tc.desc    Album breakpoint font mapping 0 probe 1256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1256) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1257
     * @tc.name    AlbumAppVersion1257
     * @tc.desc    Album breakpoint margin mapping 1 probe 1257
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1257', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1257) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1258
     * @tc.name    AlbumAppVersion1258
     * @tc.desc    Album breakpoint font mapping 2 probe 1258
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1258', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1258) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1259
     * @tc.name    AlbumAppVersion1259
     * @tc.desc    Album breakpoint margin mapping 3 probe 1259
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1259', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1259) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1260
     * @tc.name    AlbumAppVersion1260
     * @tc.desc    Album breakpoint font mapping 0 probe 1260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1260', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1260) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1261
     * @tc.name    AlbumAppVersion1261
     * @tc.desc    Album breakpoint margin mapping 1 probe 1261
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1261', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1261) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1262
     * @tc.name    AlbumAppVersion1262
     * @tc.desc    Album breakpoint font mapping 2 probe 1262
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1262', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1262) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1263
     * @tc.name    AlbumAppVersion1263
     * @tc.desc    Album breakpoint margin mapping 3 probe 1263
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1263', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1263) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1264
     * @tc.name    AlbumAppVersion1264
     * @tc.desc    Album breakpoint font mapping 0 probe 1264
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1264', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1264) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1265
     * @tc.name    AlbumAppVersion1265
     * @tc.desc    Album breakpoint margin mapping 1 probe 1265
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1265', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1265) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1266
     * @tc.name    AlbumAppVersion1266
     * @tc.desc    Album breakpoint font mapping 2 probe 1266
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1266', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1266) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1267
     * @tc.name    AlbumAppVersion1267
     * @tc.desc    Album breakpoint margin mapping 3 probe 1267
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1267', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1267) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1268
     * @tc.name    AlbumAppVersion1268
     * @tc.desc    Album breakpoint font mapping 0 probe 1268
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1268', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1268) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1269
     * @tc.name    AlbumAppVersion1269
     * @tc.desc    Album breakpoint margin mapping 1 probe 1269
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1269', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1269) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1270
     * @tc.name    AlbumAppVersion1270
     * @tc.desc    Album breakpoint font mapping 2 probe 1270
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1270', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1270) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1271
     * @tc.name    AlbumAppVersion1271
     * @tc.desc    Album breakpoint margin mapping 3 probe 1271
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1271', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1271) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1272
     * @tc.name    AlbumAppVersion1272
     * @tc.desc    Album breakpoint font mapping 0 probe 1272
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1272', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1272) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1273
     * @tc.name    AlbumAppVersion1273
     * @tc.desc    Album breakpoint margin mapping 1 probe 1273
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1273', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1273) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1274
     * @tc.name    AlbumAppVersion1274
     * @tc.desc    Album breakpoint font mapping 2 probe 1274
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1274', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1274) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1275
     * @tc.name    AlbumAppVersion1275
     * @tc.desc    Album breakpoint margin mapping 3 probe 1275
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1275', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1275) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1276
     * @tc.name    AlbumAppVersion1276
     * @tc.desc    Album breakpoint font mapping 0 probe 1276
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1276', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1276) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1277
     * @tc.name    AlbumAppVersion1277
     * @tc.desc    Album breakpoint margin mapping 1 probe 1277
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1277', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1277) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1278
     * @tc.name    AlbumAppVersion1278
     * @tc.desc    Album breakpoint font mapping 2 probe 1278
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1278', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1278) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1279
     * @tc.name    AlbumAppVersion1279
     * @tc.desc    Album breakpoint margin mapping 3 probe 1279
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumAppVersion1279', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 1279) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

