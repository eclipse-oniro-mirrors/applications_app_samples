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
