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

export default function albumBoundaryErrorTestingSuite() {
  describe('AlbumBoundaryErrorTestingSuite', () => {
    let m: AlbumModel = new AlbumModel();

    beforeEach(() => {
      m = new AlbumModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0866
     * @tc.name    AlbumBoundaryErrorTesting866
     * @tc.desc    Album breakpoint font mapping 2 probe 866
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting866', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 866) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0867
     * @tc.name    AlbumBoundaryErrorTesting867
     * @tc.desc    Album breakpoint margin mapping 3 probe 867
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting867', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 867) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0868
     * @tc.name    AlbumBoundaryErrorTesting868
     * @tc.desc    Album breakpoint font mapping 0 probe 868
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting868', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 868) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0869
     * @tc.name    AlbumBoundaryErrorTesting869
     * @tc.desc    Album breakpoint margin mapping 1 probe 869
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting869', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 869) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0870
     * @tc.name    AlbumBoundaryErrorTesting870
     * @tc.desc    Album breakpoint font mapping 2 probe 870
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting870', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 870) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0871
     * @tc.name    AlbumBoundaryErrorTesting871
     * @tc.desc    Album breakpoint margin mapping 3 probe 871
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting871', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 871) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0872
     * @tc.name    AlbumBoundaryErrorTesting872
     * @tc.desc    Album breakpoint font mapping 0 probe 872
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting872', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 872) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0873
     * @tc.name    AlbumBoundaryErrorTesting873
     * @tc.desc    Album breakpoint margin mapping 1 probe 873
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting873', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 873) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0874
     * @tc.name    AlbumBoundaryErrorTesting874
     * @tc.desc    Album breakpoint font mapping 2 probe 874
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting874', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 874) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0875
     * @tc.name    AlbumBoundaryErrorTesting875
     * @tc.desc    Album breakpoint margin mapping 3 probe 875
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting875', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 875) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0876
     * @tc.name    AlbumBoundaryErrorTesting876
     * @tc.desc    Album breakpoint font mapping 0 probe 876
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting876', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 876) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0877
     * @tc.name    AlbumBoundaryErrorTesting877
     * @tc.desc    Album breakpoint margin mapping 1 probe 877
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting877', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 877) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0878
     * @tc.name    AlbumBoundaryErrorTesting878
     * @tc.desc    Album breakpoint font mapping 2 probe 878
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting878', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 878) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0879
     * @tc.name    AlbumBoundaryErrorTesting879
     * @tc.desc    Album breakpoint margin mapping 3 probe 879
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting879', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 879) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0880
     * @tc.name    AlbumBoundaryErrorTesting880
     * @tc.desc    Album breakpoint font mapping 0 probe 880
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting880', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 880) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0881
     * @tc.name    AlbumBoundaryErrorTesting881
     * @tc.desc    Album breakpoint margin mapping 1 probe 881
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting881', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 881) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0882
     * @tc.name    AlbumBoundaryErrorTesting882
     * @tc.desc    Album breakpoint font mapping 2 probe 882
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting882', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 882) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0883
     * @tc.name    AlbumBoundaryErrorTesting883
     * @tc.desc    Album breakpoint margin mapping 3 probe 883
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting883', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 883) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0884
     * @tc.name    AlbumBoundaryErrorTesting884
     * @tc.desc    Album breakpoint font mapping 0 probe 884
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting884', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 884) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0885
     * @tc.name    AlbumBoundaryErrorTesting885
     * @tc.desc    Album breakpoint margin mapping 1 probe 885
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting885', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 885) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0886
     * @tc.name    AlbumBoundaryErrorTesting886
     * @tc.desc    Album breakpoint font mapping 2 probe 886
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting886', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 886) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0887
     * @tc.name    AlbumBoundaryErrorTesting887
     * @tc.desc    Album breakpoint margin mapping 3 probe 887
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting887', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 887) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0888
     * @tc.name    AlbumBoundaryErrorTesting888
     * @tc.desc    Album breakpoint font mapping 0 probe 888
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting888', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 888) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0889
     * @tc.name    AlbumBoundaryErrorTesting889
     * @tc.desc    Album breakpoint margin mapping 1 probe 889
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting889', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 889) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0890
     * @tc.name    AlbumBoundaryErrorTesting890
     * @tc.desc    Album breakpoint font mapping 2 probe 890
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting890', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 890) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0891
     * @tc.name    AlbumBoundaryErrorTesting891
     * @tc.desc    Album breakpoint margin mapping 3 probe 891
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting891', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 891) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0892
     * @tc.name    AlbumBoundaryErrorTesting892
     * @tc.desc    Album breakpoint font mapping 0 probe 892
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting892', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 892) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0893
     * @tc.name    AlbumBoundaryErrorTesting893
     * @tc.desc    Album breakpoint margin mapping 1 probe 893
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting893', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 893) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0894
     * @tc.name    AlbumBoundaryErrorTesting894
     * @tc.desc    Album breakpoint font mapping 2 probe 894
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting894', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 894) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0895
     * @tc.name    AlbumBoundaryErrorTesting895
     * @tc.desc    Album breakpoint margin mapping 3 probe 895
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting895', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 895) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0896
     * @tc.name    AlbumBoundaryErrorTesting896
     * @tc.desc    Album breakpoint font mapping 0 probe 896
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting896', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 896) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0897
     * @tc.name    AlbumBoundaryErrorTesting897
     * @tc.desc    Album breakpoint margin mapping 1 probe 897
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting897', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 897) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0898
     * @tc.name    AlbumBoundaryErrorTesting898
     * @tc.desc    Album breakpoint font mapping 2 probe 898
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting898', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 898) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0899
     * @tc.name    AlbumBoundaryErrorTesting899
     * @tc.desc    Album breakpoint margin mapping 3 probe 899
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting899', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 899) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0900
     * @tc.name    AlbumBoundaryErrorTesting900
     * @tc.desc    Album breakpoint font mapping 0 probe 900
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting900', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 900) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0901
     * @tc.name    AlbumBoundaryErrorTesting901
     * @tc.desc    Album breakpoint margin mapping 1 probe 901
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting901', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 901) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0902
     * @tc.name    AlbumBoundaryErrorTesting902
     * @tc.desc    Album breakpoint font mapping 2 probe 902
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting902', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 902) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0903
     * @tc.name    AlbumBoundaryErrorTesting903
     * @tc.desc    Album breakpoint margin mapping 3 probe 903
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting903', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 903) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0904
     * @tc.name    AlbumBoundaryErrorTesting904
     * @tc.desc    Album breakpoint font mapping 0 probe 904
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting904', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 904) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0905
     * @tc.name    AlbumBoundaryErrorTesting905
     * @tc.desc    Album breakpoint margin mapping 1 probe 905
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting905', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 905) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0906
     * @tc.name    AlbumBoundaryErrorTesting906
     * @tc.desc    Album breakpoint font mapping 2 probe 906
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting906', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 906) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0907
     * @tc.name    AlbumBoundaryErrorTesting907
     * @tc.desc    Album breakpoint margin mapping 3 probe 907
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting907', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 907) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0908
     * @tc.name    AlbumBoundaryErrorTesting908
     * @tc.desc    Album breakpoint font mapping 0 probe 908
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting908', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 908) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0909
     * @tc.name    AlbumBoundaryErrorTesting909
     * @tc.desc    Album breakpoint margin mapping 1 probe 909
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting909', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 909) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0910
     * @tc.name    AlbumBoundaryErrorTesting910
     * @tc.desc    Album breakpoint font mapping 2 probe 910
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting910', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 910) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0911
     * @tc.name    AlbumBoundaryErrorTesting911
     * @tc.desc    Album breakpoint margin mapping 3 probe 911
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting911', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 911) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0912
     * @tc.name    AlbumBoundaryErrorTesting912
     * @tc.desc    Album breakpoint font mapping 0 probe 912
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting912', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 912) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0913
     * @tc.name    AlbumBoundaryErrorTesting913
     * @tc.desc    Album breakpoint margin mapping 1 probe 913
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting913', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 913) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0914
     * @tc.name    AlbumBoundaryErrorTesting914
     * @tc.desc    Album breakpoint font mapping 2 probe 914
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting914', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 914) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0915
     * @tc.name    AlbumBoundaryErrorTesting915
     * @tc.desc    Album breakpoint margin mapping 3 probe 915
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting915', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 915) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0916
     * @tc.name    AlbumBoundaryErrorTesting916
     * @tc.desc    Album breakpoint font mapping 0 probe 916
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting916', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 916) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0917
     * @tc.name    AlbumBoundaryErrorTesting917
     * @tc.desc    Album breakpoint margin mapping 1 probe 917
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting917', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 917) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0918
     * @tc.name    AlbumBoundaryErrorTesting918
     * @tc.desc    Album breakpoint font mapping 2 probe 918
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting918', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 918) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0919
     * @tc.name    AlbumBoundaryErrorTesting919
     * @tc.desc    Album breakpoint margin mapping 3 probe 919
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting919', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 919) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0920
     * @tc.name    AlbumBoundaryErrorTesting920
     * @tc.desc    Album breakpoint font mapping 0 probe 920
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting920', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 920) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0921
     * @tc.name    AlbumBoundaryErrorTesting921
     * @tc.desc    Album breakpoint margin mapping 1 probe 921
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting921', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 921) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0922
     * @tc.name    AlbumBoundaryErrorTesting922
     * @tc.desc    Album breakpoint font mapping 2 probe 922
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting922', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 922) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0923
     * @tc.name    AlbumBoundaryErrorTesting923
     * @tc.desc    Album breakpoint margin mapping 3 probe 923
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting923', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 923) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0924
     * @tc.name    AlbumBoundaryErrorTesting924
     * @tc.desc    Album breakpoint font mapping 0 probe 924
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting924', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 924) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0925
     * @tc.name    AlbumBoundaryErrorTesting925
     * @tc.desc    Album breakpoint margin mapping 1 probe 925
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting925', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 925) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0926
     * @tc.name    AlbumBoundaryErrorTesting926
     * @tc.desc    Album breakpoint font mapping 2 probe 926
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting926', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 926) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0927
     * @tc.name    AlbumBoundaryErrorTesting927
     * @tc.desc    Album breakpoint margin mapping 3 probe 927
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting927', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 927) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0928
     * @tc.name    AlbumBoundaryErrorTesting928
     * @tc.desc    Album breakpoint font mapping 0 probe 928
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting928', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 928) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0929
     * @tc.name    AlbumBoundaryErrorTesting929
     * @tc.desc    Album breakpoint margin mapping 1 probe 929
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting929', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 929) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0930
     * @tc.name    AlbumBoundaryErrorTesting930
     * @tc.desc    Album breakpoint font mapping 2 probe 930
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting930', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 930) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0931
     * @tc.name    AlbumBoundaryErrorTesting931
     * @tc.desc    Album breakpoint margin mapping 3 probe 931
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting931', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 931) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0932
     * @tc.name    AlbumBoundaryErrorTesting932
     * @tc.desc    Album breakpoint font mapping 0 probe 932
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting932', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 932) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0933
     * @tc.name    AlbumBoundaryErrorTesting933
     * @tc.desc    Album breakpoint margin mapping 1 probe 933
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting933', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 933) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0934
     * @tc.name    AlbumBoundaryErrorTesting934
     * @tc.desc    Album breakpoint font mapping 2 probe 934
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting934', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 934) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0935
     * @tc.name    AlbumBoundaryErrorTesting935
     * @tc.desc    Album breakpoint margin mapping 3 probe 935
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting935', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 935) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0936
     * @tc.name    AlbumBoundaryErrorTesting936
     * @tc.desc    Album breakpoint font mapping 0 probe 936
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting936', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 936) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0937
     * @tc.name    AlbumBoundaryErrorTesting937
     * @tc.desc    Album breakpoint margin mapping 1 probe 937
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting937', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 937) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0938
     * @tc.name    AlbumBoundaryErrorTesting938
     * @tc.desc    Album breakpoint font mapping 2 probe 938
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting938', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 938) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0939
     * @tc.name    AlbumBoundaryErrorTesting939
     * @tc.desc    Album breakpoint margin mapping 3 probe 939
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting939', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 939) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0940
     * @tc.name    AlbumBoundaryErrorTesting940
     * @tc.desc    Album breakpoint font mapping 0 probe 940
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting940', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 940) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0941
     * @tc.name    AlbumBoundaryErrorTesting941
     * @tc.desc    Album breakpoint margin mapping 1 probe 941
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting941', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 941) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0942
     * @tc.name    AlbumBoundaryErrorTesting942
     * @tc.desc    Album breakpoint font mapping 2 probe 942
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting942', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 942) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0943
     * @tc.name    AlbumBoundaryErrorTesting943
     * @tc.desc    Album breakpoint margin mapping 3 probe 943
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting943', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 943) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0944
     * @tc.name    AlbumBoundaryErrorTesting944
     * @tc.desc    Album breakpoint font mapping 0 probe 944
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting944', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 944) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0945
     * @tc.name    AlbumBoundaryErrorTesting945
     * @tc.desc    Album breakpoint margin mapping 1 probe 945
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting945', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 945) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0946
     * @tc.name    AlbumBoundaryErrorTesting946
     * @tc.desc    Album breakpoint font mapping 2 probe 946
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting946', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 946) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0947
     * @tc.name    AlbumBoundaryErrorTesting947
     * @tc.desc    Album breakpoint margin mapping 3 probe 947
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting947', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 947) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0948
     * @tc.name    AlbumBoundaryErrorTesting948
     * @tc.desc    Album breakpoint font mapping 0 probe 948
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting948', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 948) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0949
     * @tc.name    AlbumBoundaryErrorTesting949
     * @tc.desc    Album breakpoint margin mapping 1 probe 949
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting949', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 949) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0950
     * @tc.name    AlbumBoundaryErrorTesting950
     * @tc.desc    Album breakpoint font mapping 2 probe 950
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting950', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 950) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0951
     * @tc.name    AlbumBoundaryErrorTesting951
     * @tc.desc    Album breakpoint margin mapping 3 probe 951
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting951', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 951) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0952
     * @tc.name    AlbumBoundaryErrorTesting952
     * @tc.desc    Album breakpoint font mapping 0 probe 952
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting952', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 952) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0953
     * @tc.name    AlbumBoundaryErrorTesting953
     * @tc.desc    Album breakpoint margin mapping 1 probe 953
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting953', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 953) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0954
     * @tc.name    AlbumBoundaryErrorTesting954
     * @tc.desc    Album breakpoint font mapping 2 probe 954
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting954', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 954) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0955
     * @tc.name    AlbumBoundaryErrorTesting955
     * @tc.desc    Album breakpoint margin mapping 3 probe 955
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting955', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 955) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0956
     * @tc.name    AlbumBoundaryErrorTesting956
     * @tc.desc    Album breakpoint font mapping 0 probe 956
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting956', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 956) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0957
     * @tc.name    AlbumBoundaryErrorTesting957
     * @tc.desc    Album breakpoint margin mapping 1 probe 957
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting957', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 957) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0958
     * @tc.name    AlbumBoundaryErrorTesting958
     * @tc.desc    Album breakpoint font mapping 2 probe 958
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting958', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 958) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0959
     * @tc.name    AlbumBoundaryErrorTesting959
     * @tc.desc    Album breakpoint margin mapping 3 probe 959
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting959', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 959) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0960
     * @tc.name    AlbumBoundaryErrorTesting960
     * @tc.desc    Album breakpoint font mapping 0 probe 960
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting960', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 960) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0961
     * @tc.name    AlbumBoundaryErrorTesting961
     * @tc.desc    Album breakpoint margin mapping 1 probe 961
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting961', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 961) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0962
     * @tc.name    AlbumBoundaryErrorTesting962
     * @tc.desc    Album breakpoint font mapping 2 probe 962
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting962', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 962) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0963
     * @tc.name    AlbumBoundaryErrorTesting963
     * @tc.desc    Album breakpoint margin mapping 3 probe 963
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting963', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 963) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0964
     * @tc.name    AlbumBoundaryErrorTesting964
     * @tc.desc    Album breakpoint font mapping 0 probe 964
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting964', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 964) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0965
     * @tc.name    AlbumBoundaryErrorTesting965
     * @tc.desc    Album breakpoint margin mapping 1 probe 965
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting965', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[1];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 965) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0966
     * @tc.name    AlbumBoundaryErrorTesting966
     * @tc.desc    Album breakpoint font mapping 2 probe 966
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting966', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[2];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 966) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0967
     * @tc.name    AlbumBoundaryErrorTesting967
     * @tc.desc    Album breakpoint margin mapping 3 probe 967
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting967', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[3];
      const expected: number = bp === "sm" ? 10 : (bp === "lg" ? 40 : 30);
      expect(m.marginOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 967) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0968
     * @tc.name    AlbumBoundaryErrorTesting968
     * @tc.desc    Album breakpoint font mapping 0 probe 968
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumBoundaryErrorTesting968', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bps: string[] = ["sm", "md", "lg", "unknown"];
      const bp: string = bps[0];
      const expected: number = bp === "sm" ? 14 : (bp === "lg" ? 18 : 16);
      expect(m.fontOf(bp)).assertEqual(expected);
      expect(m.getTrackById(1000 + 968) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
