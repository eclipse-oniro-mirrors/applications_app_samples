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

// @volume rule=each-of-6-prefixes-appears-exactly-twice-in-songsList basis=spec cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IconItem } from '../../../main/ets/model/DataType';
import { songsList } from '../../../main/ets/model/DataSummary';
import { labelByName, labelPrefixByName, resolveLabel } from '../util/LabelResolver';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const SEPARATOR: string = ':';
const SONG_LABEL_NAMES: string[] = ['song_label_01', 'song_label_02', 'song_label_03',
  'song_label_04', 'song_label_05', 'song_label_06'];

/** Length of the text that precedes the separator of the first song label. */
function prefixLength(): number {
  const text: string = labelByName(SONG_LABEL_NAMES[0]);
  const cut: number = text.indexOf(SEPARATOR);
  return cut > 0 ? cut : 0;
}

/**
 * First prefixLength() characters of the colon free label. That label carries no separator,
 * so labelPrefixByName() returns the whole text and cannot be compared with a prefix slice.
 */
function colonFreePrefix(): string {
  return labelByName(SONG_LABEL_NAMES[SONG_LABEL_NAMES.length - 1]).substring(0, prefixLength());
}

/** Artist fragment that appears inside the colon labels. */
function trackArtist(): string {
  const text: string = labelByName(SONG_LABEL_NAMES[0]);
  const start: number = text.indexOf(SEPARATOR) + 1;
  const end: number = text.lastIndexOf('-');
  return end > start ? text.substring(start, end).trim() : '';
}

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function songsDataMatrix03Test() {
  describe('SongsDataMatrix03', () => {

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_0100
     * @tc.name: testDataPrefix010001
     * @tc.desc: Verify prefix 怀旧经典 distribution aspect 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010001 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010001 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_0200
     * @tc.name: testDataPrefix010002
     * @tc.desc: Verify prefix 北欧天籁 distribution aspect 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010002 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010002 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_0300
     * @tc.name: testDataPrefix010003
     * @tc.desc: Verify prefix 欧美新曲 distribution aspect 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010003 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010003 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_0400
     * @tc.name: testDataPrefix010004
     * @tc.desc: Verify prefix 每日新歌 distribution aspect 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010004 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010004 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_0500
     * @tc.name: testDataPrefix010005
     * @tc.desc: Verify prefix 新歌推荐 distribution aspect 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010005 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010005 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_0600
     * @tc.name: testDataPrefix010006
     * @tc.desc: Verify prefix 每日私选 distribution aspect 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010006 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010006 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_0700
     * @tc.name: testDataPrefix010007
     * @tc.desc: Verify prefix 怀旧经典 distribution aspect 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010007 begin');
      hilog.info(DOMAIN, TAG, 'first-index-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[0].description) as string).indexOf(labelPrefixByName('song_label_01')) === 0));
      expect((resolveLabel(songsList[0].description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010007 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_0800
     * @tc.name: testDataPrefix010008
     * @tc.desc: Verify prefix 北欧天籁 distribution aspect 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010008 begin');
      hilog.info(DOMAIN, TAG, 'first-index-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[1].description) as string).indexOf(labelPrefixByName('song_label_02')) === 0));
      expect((resolveLabel(songsList[1].description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010008 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_0900
     * @tc.name: testDataPrefix010009
     * @tc.desc: Verify prefix 欧美新曲 distribution aspect 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010009 begin');
      hilog.info(DOMAIN, TAG, 'first-index-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[2].description) as string).indexOf(labelPrefixByName('song_label_03')) === 0));
      expect((resolveLabel(songsList[2].description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010009 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_1000
     * @tc.name: testDataPrefix010010
     * @tc.desc: Verify prefix 每日新歌 distribution aspect 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010010 begin');
      hilog.info(DOMAIN, TAG, 'first-index-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[3].description) as string).indexOf(labelPrefixByName('song_label_04')) === 0));
      expect((resolveLabel(songsList[3].description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010010 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_1100
     * @tc.name: testDataPrefix010011
     * @tc.desc: Verify prefix 新歌推荐 distribution aspect 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010011 begin');
      hilog.info(DOMAIN, TAG, 'first-index-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[4].description) as string).indexOf(labelPrefixByName('song_label_05')) === 0));
      expect((resolveLabel(songsList[4].description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010011 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_1200
     * @tc.name: testDataPrefix010012
     * @tc.desc: Verify prefix 每日私选 distribution aspect 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010012 begin');
      hilog.info(DOMAIN, TAG, 'first-index-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[5].description) as string).indexOf(labelPrefixByName('song_label_06')) === 0));
      expect((resolveLabel(songsList[5].description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010012 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_1300
     * @tc.name: testDataPrefix010013
     * @tc.desc: Verify prefix 怀旧经典 distribution aspect 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010013 begin');
      hilog.info(DOMAIN, TAG, 'second-index-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[6].description) as string).indexOf(labelPrefixByName('song_label_01')) === 0));
      expect((resolveLabel(songsList[6].description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010013 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_1400
     * @tc.name: testDataPrefix010014
     * @tc.desc: Verify prefix 北欧天籁 distribution aspect 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010014 begin');
      hilog.info(DOMAIN, TAG, 'second-index-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[7].description) as string).indexOf(labelPrefixByName('song_label_02')) === 0));
      expect((resolveLabel(songsList[7].description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010014 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_1500
     * @tc.name: testDataPrefix010015
     * @tc.desc: Verify prefix 欧美新曲 distribution aspect 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010015 begin');
      hilog.info(DOMAIN, TAG, 'second-index-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[8].description) as string).indexOf(labelPrefixByName('song_label_03')) === 0));
      expect((resolveLabel(songsList[8].description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010015 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_1600
     * @tc.name: testDataPrefix010016
     * @tc.desc: Verify prefix 每日新歌 distribution aspect 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010016 begin');
      hilog.info(DOMAIN, TAG, 'second-index-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[9].description) as string).indexOf(labelPrefixByName('song_label_04')) === 0));
      expect((resolveLabel(songsList[9].description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010016 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_1700
     * @tc.name: testDataPrefix010017
     * @tc.desc: Verify prefix 新歌推荐 distribution aspect 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010017 begin');
      hilog.info(DOMAIN, TAG, 'second-index-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[10].description) as string).indexOf(labelPrefixByName('song_label_05')) === 0));
      expect((resolveLabel(songsList[10].description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010017 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_1800
     * @tc.name: testDataPrefix010018
     * @tc.desc: Verify prefix 每日私选 distribution aspect 2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010018 begin');
      hilog.info(DOMAIN, TAG, 'second-index-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[11].description) as string).indexOf(labelPrefixByName('song_label_06')) === 0));
      expect((resolveLabel(songsList[11].description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010018 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_1900
     * @tc.name: testDataPrefix010019
     * @tc.desc: Verify prefix 怀旧经典 distribution aspect 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010019 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-first actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010019 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_2000
     * @tc.name: testDataPrefix010020
     * @tc.desc: Verify prefix 北欧天籁 distribution aspect 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010020 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-first actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010020 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_2100
     * @tc.name: testDataPrefix010021
     * @tc.desc: Verify prefix 欧美新曲 distribution aspect 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010021 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-first actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010021 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_2200
     * @tc.name: testDataPrefix010022
     * @tc.desc: Verify prefix 每日新歌 distribution aspect 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010022 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-first actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010022 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_2300
     * @tc.name: testDataPrefix010023
     * @tc.desc: Verify prefix 新歌推荐 distribution aspect 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010023 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-first actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010023 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_2400
     * @tc.name: testDataPrefix010024
     * @tc.desc: Verify prefix 每日私选 distribution aspect 3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010024 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-first actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010024 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_2500
     * @tc.name: testDataPrefix010025
     * @tc.desc: Verify prefix 怀旧经典 distribution aspect 4.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010025 begin');
      hilog.info(DOMAIN, TAG, 'neighbour-prefix-differs actual=%{public}s expected=false', String((resolveLabel(songsList[1].description) as string).indexOf(labelPrefixByName('song_label_01')) === 0));
      expect((resolveLabel(songsList[1].description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).assertFalse();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010025 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_2600
     * @tc.name: testDataPrefix010026
     * @tc.desc: Verify prefix 北欧天籁 distribution aspect 4.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010026 begin');
      hilog.info(DOMAIN, TAG, 'neighbour-prefix-differs actual=%{public}s expected=false', String((resolveLabel(songsList[2].description) as string).indexOf(labelPrefixByName('song_label_02')) === 0));
      expect((resolveLabel(songsList[2].description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).assertFalse();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010026 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_2700
     * @tc.name: testDataPrefix010027
     * @tc.desc: Verify prefix 欧美新曲 distribution aspect 4.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010027 begin');
      hilog.info(DOMAIN, TAG, 'neighbour-prefix-differs actual=%{public}s expected=false', String((resolveLabel(songsList[3].description) as string).indexOf(labelPrefixByName('song_label_03')) === 0));
      expect((resolveLabel(songsList[3].description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).assertFalse();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010027 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_2800
     * @tc.name: testDataPrefix010028
     * @tc.desc: Verify prefix 每日新歌 distribution aspect 4.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010028 begin');
      hilog.info(DOMAIN, TAG, 'neighbour-prefix-differs actual=%{public}s expected=false', String((resolveLabel(songsList[4].description) as string).indexOf(labelPrefixByName('song_label_04')) === 0));
      expect((resolveLabel(songsList[4].description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).assertFalse();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010028 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_2900
     * @tc.name: testDataPrefix010029
     * @tc.desc: Verify prefix 新歌推荐 distribution aspect 4.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010029 begin');
      hilog.info(DOMAIN, TAG, 'neighbour-prefix-differs actual=%{public}s expected=false', String((resolveLabel(songsList[5].description) as string).indexOf(labelPrefixByName('song_label_05')) === 0));
      expect((resolveLabel(songsList[5].description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).assertFalse();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010029 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_3000
     * @tc.name: testDataPrefix010030
     * @tc.desc: Verify prefix 每日私选 distribution aspect 4.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010030 begin');
      hilog.info(DOMAIN, TAG, 'neighbour-prefix-differs actual=%{public}s expected=false', String((resolveLabel(songsList[6].description) as string).indexOf(labelPrefixByName('song_label_06')) === 0));
      expect((resolveLabel(songsList[6].description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).assertFalse();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010030 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_3100
     * @tc.name: testDataPrefix010031
     * @tc.desc: Verify prefix 怀旧经典 distribution aspect 5.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010031 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-second actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010031 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_3200
     * @tc.name: testDataPrefix010032
     * @tc.desc: Verify prefix 北欧天籁 distribution aspect 5.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010032 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-second actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010032 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_3300
     * @tc.name: testDataPrefix010033
     * @tc.desc: Verify prefix 欧美新曲 distribution aspect 5.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010033 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-second actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010033 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_3400
     * @tc.name: testDataPrefix010034
     * @tc.desc: Verify prefix 每日新歌 distribution aspect 5.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010034 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-second actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010034 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_3500
     * @tc.name: testDataPrefix010035
     * @tc.desc: Verify prefix 新歌推荐 distribution aspect 5.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010035 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-second actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010035 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_3600
     * @tc.name: testDataPrefix010036
     * @tc.desc: Verify prefix 每日私选 distribution aspect 5.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010036 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-second actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010036 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_3700
     * @tc.name: testDataPrefix010037
     * @tc.desc: Verify prefix 怀旧经典 distribution aspect 6.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010037 begin');
      const v0: number = 6 - 0;
      hilog.info(DOMAIN, TAG, 'index-distance actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010037 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_3800
     * @tc.name: testDataPrefix010038
     * @tc.desc: Verify prefix 北欧天籁 distribution aspect 6.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010038 begin');
      const v0: number = 7 - 1;
      hilog.info(DOMAIN, TAG, 'index-distance actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010038 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_3900
     * @tc.name: testDataPrefix010039
     * @tc.desc: Verify prefix 欧美新曲 distribution aspect 6.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010039 begin');
      const v0: number = 8 - 2;
      hilog.info(DOMAIN, TAG, 'index-distance actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010039 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_4000
     * @tc.name: testDataPrefix010040
     * @tc.desc: Verify prefix 每日新歌 distribution aspect 6.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010040 begin');
      const v0: number = 9 - 3;
      hilog.info(DOMAIN, TAG, 'index-distance actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010040 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_4100
     * @tc.name: testDataPrefix010041
     * @tc.desc: Verify prefix 新歌推荐 distribution aspect 6.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010041 begin');
      const v0: number = 10 - 4;
      hilog.info(DOMAIN, TAG, 'index-distance actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010041 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_4200
     * @tc.name: testDataPrefix010042
     * @tc.desc: Verify prefix 每日私选 distribution aspect 6.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010042 begin');
      const v0: number = 11 - 5;
      hilog.info(DOMAIN, TAG, 'index-distance actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010042 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_4300
     * @tc.name: testDataPrefix010043
     * @tc.desc: Verify prefix 怀旧经典 distribution aspect 7.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010043 begin');
      hilog.info(DOMAIN, TAG, 'description-longer-than-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[0].description) as string).length > 4));
      expect((resolveLabel(songsList[0].description) as string).length > 4).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010043 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_4400
     * @tc.name: testDataPrefix010044
     * @tc.desc: Verify prefix 北欧天籁 distribution aspect 7.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010044 begin');
      hilog.info(DOMAIN, TAG, 'description-longer-than-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[1].description) as string).length > 4));
      expect((resolveLabel(songsList[1].description) as string).length > 4).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010044 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_4500
     * @tc.name: testDataPrefix010045
     * @tc.desc: Verify prefix 欧美新曲 distribution aspect 7.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010045 begin');
      hilog.info(DOMAIN, TAG, 'description-longer-than-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[2].description) as string).length > 4));
      expect((resolveLabel(songsList[2].description) as string).length > 4).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010045 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_4600
     * @tc.name: testDataPrefix010046
     * @tc.desc: Verify prefix 每日新歌 distribution aspect 7.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010046 begin');
      hilog.info(DOMAIN, TAG, 'description-longer-than-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[3].description) as string).length > 4));
      expect((resolveLabel(songsList[3].description) as string).length > 4).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010046 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_4700
     * @tc.name: testDataPrefix010047
     * @tc.desc: Verify prefix 新歌推荐 distribution aspect 7.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010047 begin');
      hilog.info(DOMAIN, TAG, 'description-longer-than-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[4].description) as string).length > 4));
      expect((resolveLabel(songsList[4].description) as string).length > 4).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010047 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_4800
     * @tc.name: testDataPrefix010048
     * @tc.desc: Verify prefix 每日私选 distribution aspect 7.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010048 begin');
      hilog.info(DOMAIN, TAG, 'description-longer-than-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[5].description) as string).length > 4));
      expect((resolveLabel(songsList[5].description) as string).length > 4).assertTrue();
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010048 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_4900
     * @tc.name: testDataPrefix010049
     * @tc.desc: Verify prefix 怀旧经典 distribution aspect 8.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010049 begin');
      const v0: number = (resolveLabel(songsList[0].description) as string).split(':').length;
      hilog.info(DOMAIN, TAG, 'colon-parts actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010049 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_5000
     * @tc.name: testDataPrefix010050
     * @tc.desc: Verify prefix 北欧天籁 distribution aspect 8.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010050 begin');
      const v0: number = (resolveLabel(songsList[1].description) as string).split(':').length;
      hilog.info(DOMAIN, TAG, 'colon-parts actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010050 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_5100
     * @tc.name: testDataPrefix010051
     * @tc.desc: Verify prefix 欧美新曲 distribution aspect 8.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010051 begin');
      const v0: number = (resolveLabel(songsList[2].description) as string).split(':').length;
      hilog.info(DOMAIN, TAG, 'colon-parts actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010051 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_5200
     * @tc.name: testDataPrefix010052
     * @tc.desc: Verify prefix 每日新歌 distribution aspect 8.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010052 begin');
      const v0: number = (resolveLabel(songsList[3].description) as string).split(':').length;
      hilog.info(DOMAIN, TAG, 'colon-parts actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010052 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_5300
     * @tc.name: testDataPrefix010053
     * @tc.desc: Verify prefix 新歌推荐 distribution aspect 8.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010053 begin');
      const v0: number = (resolveLabel(songsList[4].description) as string).split(':').length;
      hilog.info(DOMAIN, TAG, 'colon-parts actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010053 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_5400
     * @tc.name: testDataPrefix010054
     * @tc.desc: Verify prefix 每日私选 distribution aspect 8.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010054 begin');
      const v0: number = (resolveLabel(songsList[5].description) as string).split(':').length;
      hilog.info(DOMAIN, TAG, 'colon-parts actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010054 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_5500
     * @tc.name: testDataPrefix010055
     * @tc.desc: Verify prefix 怀旧经典 distribution aspect 9.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010055 begin');
      const v0: string = (resolveLabel(songsList[6].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'second-prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_01')));
      expect(v0).assertEqual(labelPrefixByName('song_label_01'));
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010055 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_5600
     * @tc.name: testDataPrefix010056
     * @tc.desc: Verify prefix 北欧天籁 distribution aspect 9.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010056 begin');
      const v0: string = (resolveLabel(songsList[7].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'second-prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_02')));
      expect(v0).assertEqual(labelPrefixByName('song_label_02'));
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010056 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_5700
     * @tc.name: testDataPrefix010057
     * @tc.desc: Verify prefix 欧美新曲 distribution aspect 9.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010057 begin');
      const v0: string = (resolveLabel(songsList[8].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'second-prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_03')));
      expect(v0).assertEqual(labelPrefixByName('song_label_03'));
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010057 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_5800
     * @tc.name: testDataPrefix010058
     * @tc.desc: Verify prefix 每日新歌 distribution aspect 9.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010058 begin');
      const v0: string = (resolveLabel(songsList[9].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'second-prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_04')));
      expect(v0).assertEqual(labelPrefixByName('song_label_04'));
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010058 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_5900
     * @tc.name: testDataPrefix010059
     * @tc.desc: Verify prefix 新歌推荐 distribution aspect 9.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010059 begin');
      const v0: string = (resolveLabel(songsList[10].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'second-prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_05')));
      expect(v0).assertEqual(labelPrefixByName('song_label_05'));
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010059 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_6000
     * @tc.name: testDataPrefix010060
     * @tc.desc: Verify prefix 每日私选 distribution aspect 9.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010060 begin');
      const v0: string = (resolveLabel(songsList[11].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'second-prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(colonFreePrefix()));
      expect(v0).assertEqual(colonFreePrefix());
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010060 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_6100
     * @tc.name: testDataPrefix010061
     * @tc.desc: Verify prefix 怀旧经典 distribution aspect 10.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010061 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'total-entries actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'six-distinct-descriptions actual=%{public}s expected=true', String(new Set<string>(songsList.map((item: IconItem): string => resolveLabel(item.description) as string)).size === 6));
      expect(new Set<string>(songsList.map((item: IconItem): string => resolveLabel(item.description) as string)).size === 6).assertTrue();
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010061 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_6200
     * @tc.name: testDataPrefix010062
     * @tc.desc: Verify prefix 北欧天籁 distribution aspect 10.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010062 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'total-entries actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'six-distinct-descriptions actual=%{public}s expected=true', String(new Set<string>(songsList.map((item: IconItem): string => resolveLabel(item.description) as string)).size === 6));
      expect(new Set<string>(songsList.map((item: IconItem): string => resolveLabel(item.description) as string)).size === 6).assertTrue();
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010062 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_6300
     * @tc.name: testDataPrefix010063
     * @tc.desc: Verify prefix 欧美新曲 distribution aspect 10.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010063 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'total-entries actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'six-distinct-descriptions actual=%{public}s expected=true', String(new Set<string>(songsList.map((item: IconItem): string => resolveLabel(item.description) as string)).size === 6));
      expect(new Set<string>(songsList.map((item: IconItem): string => resolveLabel(item.description) as string)).size === 6).assertTrue();
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010063 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_6400
     * @tc.name: testDataPrefix010064
     * @tc.desc: Verify prefix 每日新歌 distribution aspect 10.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010064 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'total-entries actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'six-distinct-descriptions actual=%{public}s expected=true', String(new Set<string>(songsList.map((item: IconItem): string => resolveLabel(item.description) as string)).size === 6));
      expect(new Set<string>(songsList.map((item: IconItem): string => resolveLabel(item.description) as string)).size === 6).assertTrue();
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010064 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_6500
     * @tc.name: testDataPrefix010065
     * @tc.desc: Verify prefix 新歌推荐 distribution aspect 10.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010065 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'total-entries actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'six-distinct-descriptions actual=%{public}s expected=true', String(new Set<string>(songsList.map((item: IconItem): string => resolveLabel(item.description) as string)).size === 6));
      expect(new Set<string>(songsList.map((item: IconItem): string => resolveLabel(item.description) as string)).size === 6).assertTrue();
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010065 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_6600
     * @tc.name: testDataPrefix010066
     * @tc.desc: Verify prefix 每日私选 distribution aspect 10.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010066 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'total-entries actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'six-distinct-descriptions actual=%{public}s expected=true', String(new Set<string>(songsList.map((item: IconItem): string => resolveLabel(item.description) as string)).size === 6));
      expect(new Set<string>(songsList.map((item: IconItem): string => resolveLabel(item.description) as string)).size === 6).assertTrue();
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010066 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_6700
     * @tc.name: testDataPrefix010067
     * @tc.desc: Verify prefix 怀旧经典 distribution aspect 11.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010067 begin');
      const v0: string = (resolveLabel(songsList[0].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'first-prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_01')));
      expect(v0).assertEqual(labelPrefixByName('song_label_01'));
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010067 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_6800
     * @tc.name: testDataPrefix010068
     * @tc.desc: Verify prefix 北欧天籁 distribution aspect 11.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010068 begin');
      const v0: string = (resolveLabel(songsList[1].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'first-prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_02')));
      expect(v0).assertEqual(labelPrefixByName('song_label_02'));
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010068 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_6900
     * @tc.name: testDataPrefix010069
     * @tc.desc: Verify prefix 欧美新曲 distribution aspect 11.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010069 begin');
      const v0: string = (resolveLabel(songsList[2].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'first-prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_03')));
      expect(v0).assertEqual(labelPrefixByName('song_label_03'));
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010069 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_7000
     * @tc.name: testDataPrefix010070
     * @tc.desc: Verify prefix 每日新歌 distribution aspect 11.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010070 begin');
      const v0: string = (resolveLabel(songsList[3].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'first-prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_04')));
      expect(v0).assertEqual(labelPrefixByName('song_label_04'));
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010070 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_7100
     * @tc.name: testDataPrefix010071
     * @tc.desc: Verify prefix 新歌推荐 distribution aspect 11.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010071 begin');
      const v0: string = (resolveLabel(songsList[4].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'first-prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_05')));
      expect(v0).assertEqual(labelPrefixByName('song_label_05'));
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010071 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_7200
     * @tc.name: testDataPrefix010072
     * @tc.desc: Verify prefix 每日私选 distribution aspect 11.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataPrefix010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010072 begin');
      const v0: string = (resolveLabel(songsList[5].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'first-prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(colonFreePrefix()));
      expect(v0).assertEqual(colonFreePrefix());
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length;
      hilog.info(DOMAIN, TAG, 'prefix-count-check actual=%{public}s expected=%{public}s', String(v1), String(2));
      expect(v1).assertEqual(2);
      hilog.info(DOMAIN, TAG, 'combined-invariant actual=%{public}s expected=true', String(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2));
      expect(songsList.length === 12 && songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(labelPrefixByName('song_label_06')) === 0).length === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010072 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_7300
     * @tc.name: testDataPrefix010073
     * @tc.desc: Anchor: unknown prefix must match nothing in songsList
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataPrefix010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010073 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf('zz_missing_prefix') === 0).length;
      hilog.info(DOMAIN, TAG, 'unknown-prefix-count actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf('') === 0).length;
      hilog.info(DOMAIN, TAG, 'empty-prefix-matches-all actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'total-entries actual=%{public}s expected=true', String(songsList.length === 12));
      expect(songsList.length === 12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010073 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_7400
     * @tc.name: testDataPrefix010074
     * @tc.desc: Anchor: prefix matching must be anchored at index 0 not anywhere
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataPrefix010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010074 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(trackArtist()) >= 0).length;
      hilog.info(DOMAIN, TAG, 'inner-token-count actual=%{public}s expected=%{public}s', String(v0), String(10));
      expect(v0).assertEqual(10);
      const v1: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(trackArtist()) === 0).length;
      hilog.info(DOMAIN, TAG, 'inner-token-not-prefix actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'private-selection-rows-equal actual=%{public}s expected=true', String(resolveLabel(songsList[5].description) === resolveLabel(songsList[11].description)));
      expect(resolveLabel(songsList[5].description) === resolveLabel(songsList[11].description)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010074 end');
    })

    /**
     * @tc.number: SUB_MM_DATAPREFIX01_7500
     * @tc.name: testDataPrefix010075
     * @tc.desc: Anchor: private selection rows share one description and carry no colon
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataPrefix010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010075 begin');
      const v0: number = songsList.filter((item: IconItem) => (resolveLabel(item.description) as string).indexOf(':') === -1).length;
      hilog.info(DOMAIN, TAG, 'colon-free-count actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: string = (resolveLabel(songsList[5].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'private-prefix actual=%{public}s expected=%{public}s', String(v1), String(colonFreePrefix()));
      expect(v1).assertEqual(colonFreePrefix());
      hilog.info(DOMAIN, TAG, 'both-rows-equal actual=%{public}s expected=true', String(resolveLabel(songsList[5].description) === resolveLabel(songsList[11].description)));
      expect(resolveLabel(songsList[5].description) === resolveLabel(songsList[11].description)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataPrefix010075 end');
    })

  })
}
