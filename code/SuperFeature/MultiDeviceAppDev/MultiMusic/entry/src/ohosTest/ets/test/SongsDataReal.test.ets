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

// Handwritten companion of the @volume buckets SongsDataMatrix01~04.
// The frozen table is main/ets/model/DataSummary.ets: 12 entries, covers list12 down to list1,
// 6 label prefixes repeated twice, and the last two entries using the 每日私选 wording.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IconItem } from '../../../main/ets/model/DataType';
import { songsList } from '../../../main/ets/model/DataSummary';
import { labelByName, labelPrefixByName, resolveLabel } from '../util/LabelResolver';
import { BUNDLE_NAME, TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';
const SEPARATOR: string = ':';
const SONG_LABELS: string[] = ['song_label_01', 'song_label_02', 'song_label_03', 'song_label_04',
  'song_label_05', 'song_label_06'];
const COLON_FREE_LABELS: number = 2;

function labelAt(index: number): string {
  return resolveLabel(songsList[index].description);
}

/**
 * Expected prefix of the label at the given index, resolved from the string resources at
 * run time. The suite therefore does not hard code the zh_CN copy and keeps working on a
 * device configured with another locale.
 */
function prefixAt(index: number): string {
  return labelPrefixByName(SONG_LABELS[index % SONG_LABELS.length]);
}

/** Text of the colon free label shared by the last two entries. */
function colonFreeLabel(): string {
  return labelByName(SONG_LABELS[SONG_LABELS.length - 1]);
}

/** Length of a label that carries the "prefix: artist - track" template. */
function colonLabelLength(): number {
  return labelByName(SONG_LABELS[0]).length;
}

/** Track fragment shared by the ten colon labels, taken from the first resource. */
function sharedTrack(): string {
  const text: string = labelByName(SONG_LABELS[0]);
  const cut: number = text.lastIndexOf('-');
  return cut >= 0 ? text.substring(cut + 1).trim() : '';
}

/** Artist fragment shared by the ten colon labels, taken from the first resource. */
function sharedArtist(): string {
  const text: string = labelByName(SONG_LABELS[0]);
  const start: number = text.indexOf(SEPARATOR) + 1;
  const end: number = text.lastIndexOf('-');
  return end > start ? text.substring(start, end).trim() : '';
}

/** Offset of the mirrored colon free entry, which starts the last label of the table. */
function colonFreeOffset(): number {
  return expectedLengthSum() - colonFreeLabel().length;
}

/** Expected character count of the whole frozen label table. */
function expectedLengthSum(): number {
  return (songsList.length - COLON_FREE_LABELS) * colonLabelLength() +
    COLON_FREE_LABELS * colonFreeLabel().length;
}

function countPrefix(prefix: string): number {
  let total: number = 0;
  for (let i = 0; i < songsList.length; i++) {
    if (labelAt(i).indexOf(prefix) === 0) {
      total = total + 1;
    }
  }
  return total;
}

function countContaining(fragment: string): number {
  let total: number = 0;
  for (let i = 0; i < songsList.length; i++) {
    if (labelAt(i).indexOf(fragment) >= 0) {
      total = total + 1;
    }
  }
  return total;
}

export default function songsDataRealTest() {
  describe('SongsDataReal', () => {

    // ==================== 冻结表长度与逐索引映射（13 条） ====================
    /**
     * @tc.number: SUB_MM_DATAR_0100
     * @tc.name: testDataReal0001
     * @tc.desc: Verify the frozen song table keeps exactly 12 entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0001 begin');
      const length: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'songs-length actual=%{public}s expected=12', String(length));
      expect(length).assertEqual(12);
      expect(length > 0).assertTrue();
      expect(songsList[11] !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0001 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_0200
     * @tc.name: testDataReal0002
     * @tc.desc: Verify entry 0 uses cover list12 and the 怀旧经典 label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0002 begin');
      const coverId: number = songsList[0].imageSrc.id;
      const label: string = labelAt(0);
      hilog.info(DOMAIN, TAG, 'entry-0 actual=%{public}s/%{public}s', String(coverId), label);
      expect(coverId).assertEqual($r('app.media.list12').id);
      expect(label.indexOf(prefixAt(0))).assertEqual(0);
      expect(label.indexOf(SEPARATOR)).assertEqual(prefixAt(0).length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0002 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_0300
     * @tc.name: testDataReal0003
     * @tc.desc: Verify entry 1 uses cover list11 and the 北欧天籁 label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0003 begin');
      const coverId: number = songsList[1].imageSrc.id;
      const label: string = labelAt(1);
      hilog.info(DOMAIN, TAG, 'entry-1 actual=%{public}s/%{public}s expected=%{public}s/%{public}s',
        String(coverId), label, String($r('app.media.list11').id), prefixAt(1));
      expect(coverId).assertEqual($r('app.media.list11').id);
      expect(label.indexOf(prefixAt(1))).assertEqual(0);
      expect(label.endsWith(sharedTrack())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0003 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_0400
     * @tc.name: testDataReal0004
     * @tc.desc: Verify entry 2 uses cover list10 and the 欧美新曲 label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0004 begin');
      const coverId: number = songsList[2].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'entry-2 cover actual=%{public}s expected=%{public}s',
        String(coverId), String($r('app.media.list10').id));
      expect(coverId).assertEqual($r('app.media.list10').id);
      expect(labelAt(2).indexOf(prefixAt(2))).assertEqual(0);
      expect(labelAt(2) === labelAt(0)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0004 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_0500
     * @tc.name: testDataReal0005
     * @tc.desc: Verify entry 3 uses cover list9 and the 每日新歌 label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0005 begin');
      hilog.info(DOMAIN, TAG, 'entry-3 cover actual=%{public}s expected=%{public}s',
        String(songsList[3].imageSrc.id), String($r('app.media.list9').id));
      expect(songsList[3].imageSrc.id).assertEqual($r('app.media.list9').id);
      expect(labelAt(3).indexOf(prefixAt(3))).assertEqual(0);
      expect(labelAt(3).length).assertEqual(colonLabelLength());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0005 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_0600
     * @tc.name: testDataReal0006
     * @tc.desc: Verify entry 4 uses cover list8 and the 新歌推荐 label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0006 begin');
      hilog.info(DOMAIN, TAG, 'entry-4 cover actual=%{public}s expected=%{public}s',
        String(songsList[4].imageSrc.id), String($r('app.media.list8').id));
      expect(songsList[4].imageSrc.id).assertEqual($r('app.media.list8').id);
      expect(labelAt(4).indexOf(prefixAt(4))).assertEqual(0);
      expect(labelAt(4).indexOf(prefixAt(3))).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0006 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_0700
     * @tc.name: testDataReal0007
     * @tc.desc: Verify entry 5 uses cover list7 and the colon free 每日私选 wording.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0007 begin');
      const label: string = labelAt(5);
      hilog.info(DOMAIN, TAG, 'entry-5 actual=%{public}s expected=%{public}s', label, colonFreeLabel());
      expect(songsList[5].imageSrc.id).assertEqual($r('app.media.list7').id);
      expect(label).assertEqual(colonFreeLabel());
      expect(label.indexOf(SEPARATOR)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0007 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_0800
     * @tc.name: testDataReal0008
     * @tc.desc: Verify entry 6 restarts the label rotation with cover list6.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0008 begin');
      hilog.info(DOMAIN, TAG, 'entry-6 cover actual=%{public}s expected=%{public}s',
        String(songsList[6].imageSrc.id), String($r('app.media.list6').id));
      expect(songsList[6].imageSrc.id).assertEqual($r('app.media.list6').id);
      expect(labelAt(6)).assertEqual(labelAt(0));
      expect(songsList[6].imageSrc.id === songsList[0].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0008 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_0900
     * @tc.name: testDataReal0009
     * @tc.desc: Verify entry 7 mirrors entry 1 while keeping a different cover.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0009 begin');
      expect(songsList[7].imageSrc.id).assertEqual($r('app.media.list5').id);
      expect(labelAt(7)).assertEqual(labelAt(1));
      expect(songsList[7].imageSrc.id === songsList[1].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, 'entry-7-label actual=%{public}s', labelAt(7));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0009 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_1000
     * @tc.name: testDataReal0010
     * @tc.desc: Verify entry 8 mirrors entry 2 and uses cover list4.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0010 begin');
      expect(songsList[8].imageSrc.id).assertEqual($r('app.media.list4').id);
      expect(labelAt(8)).assertEqual(labelAt(2));
      expect(labelAt(8).indexOf(prefixAt(2))).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'entry-8-label actual=%{public}s', labelAt(8));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0010 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_1100
     * @tc.name: testDataReal0011
     * @tc.desc: Verify entry 9 mirrors entry 3 and uses cover list3.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0011 begin');
      expect(songsList[9].imageSrc.id).assertEqual($r('app.media.list3').id);
      expect(labelAt(9)).assertEqual(labelAt(3));
      expect(labelAt(9).indexOf(prefixAt(3))).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'entry-9-label actual=%{public}s', labelAt(9));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0011 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_1200
     * @tc.name: testDataReal0012
     * @tc.desc: Verify entry 10 mirrors entry 4 and uses cover list2.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0012 begin');
      expect(songsList[10].imageSrc.id).assertEqual($r('app.media.list2').id);
      expect(labelAt(10)).assertEqual(labelAt(4));
      expect(labelAt(10).indexOf(prefixAt(4))).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'entry-10-label actual=%{public}s', labelAt(10));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0012 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_1300
     * @tc.name: testDataReal0013
     * @tc.desc: Verify entry 11 mirrors entry 5 and closes the table with cover list1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0013 begin');
      const last: IconItem = songsList[11];
      hilog.info(DOMAIN, TAG, 'entry-11 actual=%{public}s/%{public}s',
        String(last.imageSrc.id), String($r('app.media.list1').id));
      expect(last.imageSrc.id).assertEqual($r('app.media.list1').id);
      expect(labelAt(11)).assertEqual(colonFreeLabel());
      expect(labelAt(11)).assertEqual(labelAt(5));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0013 end');
    })

    // ==================== 前缀分布与去重（10 条） ====================
    /**
     * @tc.number: SUB_MM_DATAR_1400
     * @tc.name: testDataReal0014
     * @tc.desc: Verify the 怀旧经典 prefix covers exactly two entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0014 begin');
      const count: number = countPrefix(prefixAt(0));
      hilog.info(DOMAIN, TAG, 'huijiu-count actual=%{public}s expected=2', String(count));
      expect(count).assertEqual(2);
      expect(count < 3).assertTrue();
      expect(labelAt(0).indexOf(prefixAt(0))).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0014 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_1500
     * @tc.name: testDataReal0015
     * @tc.desc: Verify the 北欧天籁 prefix covers exactly two entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0015 begin');
      const count: number = countPrefix(prefixAt(1));
      hilog.info(DOMAIN, TAG, 'north-count actual=%{public}s expected=2', String(count));
      expect(count).assertEqual(2);
      expect(labelAt(1).indexOf(prefixAt(1))).assertEqual(0);
      expect(labelAt(7).indexOf(prefixAt(1))).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0015 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_1600
     * @tc.name: testDataReal0016
     * @tc.desc: Verify the 欧美新曲 prefix covers exactly two entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0016 begin');
      const count: number = countPrefix(prefixAt(2));
      hilog.info(DOMAIN, TAG, 'west-count actual=%{public}s expected=2', String(count));
      expect(count).assertEqual(2);
      expect(labelAt(2).indexOf(prefixAt(2))).assertEqual(0);
      expect(labelAt(8).indexOf(prefixAt(2))).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0016 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_1700
     * @tc.name: testDataReal0017
     * @tc.desc: Verify the 每日新歌 prefix covers exactly two entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0017 begin');
      const count: number = countPrefix(prefixAt(3));
      hilog.info(DOMAIN, TAG, 'daily-new-count actual=%{public}s expected=2', String(count));
      expect(count).assertEqual(2);
      expect(labelAt(3).indexOf(prefixAt(3))).assertEqual(0);
      expect(labelAt(9).indexOf(prefixAt(3))).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0017 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_1800
     * @tc.name: testDataReal0018
     * @tc.desc: Verify the 新歌推荐 prefix covers exactly two entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0018 begin');
      const count: number = countPrefix(prefixAt(4));
      hilog.info(DOMAIN, TAG, 'new-recommend-count actual=%{public}s expected=2', String(count));
      expect(count).assertEqual(2);
      expect(labelAt(4).indexOf(prefixAt(4))).assertEqual(0);
      expect(labelAt(10).indexOf(prefixAt(4))).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0018 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_1900
     * @tc.name: testDataReal0019
     * @tc.desc: Verify the 每日私选 prefix also covers exactly two entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0019 begin');
      const count: number = countPrefix(prefixAt(5));
      hilog.info(DOMAIN, TAG, 'private-count actual=%{public}s expected=2', String(count));
      expect(count).assertEqual(2);
      expect(labelAt(5).indexOf(prefixAt(5))).assertEqual(0);
      expect(labelAt(11).indexOf(prefixAt(5))).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0019 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_2000
     * @tc.name: testDataReal0020
     * @tc.desc: Verify the six prefixes together account for all 12 entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0020 begin');
      let total: number = 0;
      for (let i = 0; i < SONG_LABELS.length; i++) {
        total = total + countPrefix(prefixAt(i));
      }
      hilog.info(DOMAIN, TAG, 'prefix-total actual=%{public}s expected=12', String(total));
      expect(total).assertEqual(12);
      expect(total).assertEqual(songsList.length);
      expect(SONG_LABELS.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0020 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_2100
     * @tc.name: testDataReal0021
     * @tc.desc: Verify the label table collapses to exactly six distinct strings.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0021 begin');
      let distinct: Set<string> = new Set<string>();
      for (let i = 0; i < songsList.length; i++) {
        distinct.add(labelAt(i));
      }
      hilog.info(DOMAIN, TAG, 'distinct-labels actual=%{public}s expected=6', String(distinct.size));
      expect(distinct.size).assertEqual(6);
      expect(distinct.has(colonFreeLabel())).assertTrue();
      expect(distinct.size < songsList.length).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0021 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_2200
     * @tc.name: testDataReal0022
     * @tc.desc: Verify the shared track fragment appears in exactly ten entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0022 begin');
      const count: number = countContaining(sharedTrack());
      hilog.info(DOMAIN, TAG, 'track-count actual=%{public}s expected=10', String(count));
      expect(count).assertEqual(10);
      expect(count).assertEqual(songsList.length - COLON_FREE_LABELS);
      expect(labelAt(0).indexOf(sharedTrack()) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0022 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_2300
     * @tc.name: testDataReal0023
     * @tc.desc: Verify the shared artist fragment appears in exactly ten entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0023 begin');
      const count: number = countContaining(sharedArtist());
      hilog.info(DOMAIN, TAG, 'artist-count actual=%{public}s expected=10', String(count));
      expect(count).assertEqual(10);
      expect(labelAt(5).indexOf(sharedArtist())).assertEqual(-1);
      expect(labelAt(11).indexOf(sharedArtist())).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0023 end');
    })

    // ==================== 标签格式与资源完整性（17 条） ====================
    /**
     * @tc.number: SUB_MM_DATAR_2400
     * @tc.name: testDataReal0024
     * @tc.desc: Verify no entry has an empty label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0024 begin');
      let empty: number = 0;
      for (let i = 0; i < songsList.length; i++) {
        if (labelAt(i).length === 0) {
          empty = empty + 1;
        }
      }
      hilog.info(DOMAIN, TAG, 'empty-labels actual=%{public}s expected=0', String(empty));
      expect(empty).assertEqual(0);
      expect(labelAt(0).length > 0).assertTrue();
      expect(labelAt(11).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0024 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_2500
     * @tc.name: testDataReal0025
     * @tc.desc: Verify no label carries leading or trailing whitespace.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0025 begin');
      let padded: number = 0;
      for (let i = 0; i < songsList.length; i++) {
        if (labelAt(i) !== labelAt(i).trim()) {
          padded = padded + 1;
        }
      }
      hilog.info(DOMAIN, TAG, 'padded-labels actual=%{public}s expected=0', String(padded));
      expect(padded).assertEqual(0);
      expect(labelAt(3)).assertEqual(labelAt(3).trim());
      expect(labelAt(9)).assertEqual(labelAt(9).trim());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0025 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_2600
     * @tc.name: testDataReal0026
     * @tc.desc: Verify exactly ten labels carry a separator colon at position 4.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0026 begin');
      let matched: number = 0;
      for (let i = 0; i < songsList.length; i++) {
        if (labelAt(i).indexOf(SEPARATOR) === prefixAt(i).length) {
          matched = matched + 1;
        }
      }
      hilog.info(DOMAIN, TAG, 'colon-labels actual=%{public}s expected=10', String(matched));
      expect(matched).assertEqual(10);
      expect(labelAt(4).charAt(prefixAt(4).length)).assertEqual(SEPARATOR);
      expect(labelAt(5).indexOf(SEPARATOR)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0026 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_2700
     * @tc.name: testDataReal0027
     * @tc.desc: Verify the two 每日私选 labels contain no separator colon.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0027 begin');
      const first: string = labelAt(5);
      const second: string = labelAt(11);
      hilog.info(DOMAIN, TAG, 'colon-free actual=%{public}s/%{public}s expected=-1/-1',
        String(first.indexOf(':')), String(second.indexOf(':')));
      expect(first.indexOf(':')).assertEqual(-1);
      expect(second.indexOf(':')).assertEqual(-1);
      expect(first).assertEqual(second);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0027 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_2800
     * @tc.name: testDataReal0028
     * @tc.desc: Verify the ten colon labels all end with the same track fragment.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0028 begin');
      let endsMatched: number = 0;
      for (let i = 0; i < songsList.length; i++) {
        const suffix: string = labelAt(i).substring(labelAt(i).length - sharedTrack().length);
        if (suffix === sharedTrack()) {
          endsMatched = endsMatched + 1;
        }
      }
      hilog.info(DOMAIN, TAG, 'suffix-labels actual=%{public}s expected=10', String(endsMatched));
      expect(endsMatched).assertEqual(10);
      expect(labelAt(0).endsWith(sharedTrack())).assertTrue();
      expect(labelAt(5).endsWith(sharedTrack())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0028 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_2900
     * @tc.name: testDataReal0029
     * @tc.desc: Verify all twelve labels are stored as string resources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0029 begin');
      let resourceLabels: number = 0;
      for (let i = 0; i < songsList.length; i++) {
        if (typeof songsList[i].description === 'object') {
          resourceLabels = resourceLabels + 1;
        }
      }
      hilog.info(DOMAIN, TAG, 'resource-labels actual=%{public}s expected=12', String(resourceLabels));
      expect(resourceLabels).assertEqual(12);
      expect(resourceLabels).assertEqual(songsList.length);
      expect(typeof songsList[5].description === 'object').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0029 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_3000
     * @tc.name: testDataReal0030
     * @tc.desc: Verify the label length sum matches the summed resource lengths.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0030 begin');
      let total: number = 0;
      for (let i = 0; i < songsList.length; i++) {
        total = total + labelAt(i).length;
      }
      hilog.info(DOMAIN, TAG, 'label-length-sum actual=%{public}s expected=%{public}s',
        String(total), String(expectedLengthSum()));
      expect(total).assertEqual(expectedLengthSum());
      expect(total > songsList.length).assertTrue();
      expect(labelAt(0).length).assertEqual(colonLabelLength());
      expect(labelAt(5).length).assertEqual(colonFreeLabel().length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0030 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_3100
     * @tc.name: testDataReal0031
     * @tc.desc: Verify every cover identifier is distinct across the twelve entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0031 begin');
      let covers: Set<number> = new Set<number>();
      for (let i = 0; i < songsList.length; i++) {
        covers.add(songsList[i].imageSrc.id);
      }
      hilog.info(DOMAIN, TAG, 'distinct-covers actual=%{public}s expected=12', String(covers.size));
      expect(covers.size).assertEqual(12);
      expect(covers.has($r('app.media.list1').id)).assertTrue();
      expect(covers.has($r('app.media.list12').id)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0031 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_3200
     * @tc.name: testDataReal0032
     * @tc.desc: Verify every cover belongs to the entry_test module.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0032 begin');
      let entryCovers: number = 0;
      for (let i = 0; i < songsList.length; i++) {
        if (songsList[i].imageSrc.moduleName === TEST_MODULE_NAME) {
          entryCovers = entryCovers + 1;
        }
      }
      hilog.info(DOMAIN, TAG, 'entry-module-covers actual=%{public}s expected=12', String(entryCovers));
      expect(entryCovers).assertEqual(12);
      expect(songsList[0].imageSrc.moduleName).assertEqual(TEST_MODULE_NAME);
      expect(songsList[11].imageSrc.moduleName).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0032 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_3300
     * @tc.name: testDataReal0033
     * @tc.desc: Verify every cover resolves inside the sample bundle.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0033 begin');
      let bundleCovers: number = 0;
      for (let i = 0; i < songsList.length; i++) {
        if (songsList[i].imageSrc.bundleName === BUNDLE_NAME) {
          bundleCovers = bundleCovers + 1;
        }
      }
      hilog.info(DOMAIN, TAG, 'bundle-covers actual=%{public}s expected=12', String(bundleCovers));
      expect(bundleCovers).assertEqual(12);
      expect(songsList[3].imageSrc.bundleName).assertEqual(BUNDLE_NAME);
      expect(songsList[8].imageSrc.bundleName).assertEqual(BUNDLE_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0033 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_3400
     * @tc.name: testDataReal0034
     * @tc.desc: Verify reading the same entry twice returns identical label and cover.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0034 begin');
      const firstLabel: string = labelAt(0);
      const secondLabel: string = labelAt(0);
      const firstCover: number = songsList[0].imageSrc.id;
      const secondCover: number = songsList[0].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'stable-read actual=%{public}s/%{public}s', String(firstCover), secondLabel);
      expect(firstLabel).assertEqual(secondLabel);
      expect(firstCover).assertEqual(secondCover);
      expect(firstLabel === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0034 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_3500
     * @tc.name: testDataReal0035
     * @tc.desc: Verify adjacent entries never repeat the same cover identifier.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0035 begin');
      let repeated: number = 0;
      for (let i = 0; i < songsList.length - 1; i++) {
        if (songsList[i].imageSrc.id === songsList[i + 1].imageSrc.id) {
          repeated = repeated + 1;
        }
      }
      hilog.info(DOMAIN, TAG, 'adjacent-repeats actual=%{public}s expected=0', String(repeated));
      expect(repeated).assertEqual(0);
      expect(songsList[0].imageSrc.id === songsList[1].imageSrc.id).assertFalse();
      expect(songsList[10].imageSrc.id === songsList[11].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0035 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_3600
     * @tc.name: testDataReal0036
     * @tc.desc: Verify the two 每日私选 entries share the label but not the cover.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0036 begin');
      const sharedLabel: string = labelAt(5);
      hilog.info(DOMAIN, TAG, 'shared-label actual=%{public}s expected=%{public}s',
        sharedLabel, colonFreeLabel());
      expect(sharedLabel).assertEqual(labelAt(11));
      expect(songsList[5].imageSrc.id).assertEqual($r('app.media.list7').id);
      expect(songsList[11].imageSrc.id).assertEqual($r('app.media.list1').id);
      expect(songsList[5].imageSrc.id === songsList[11].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0036 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_3700
     * @tc.name: testDataReal0037
     * @tc.desc: Verify the six mirrored pairs keep equal labels and different covers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0037 begin');
      let mirrored: number = 0;
      for (let i = 0; i < 6; i++) {
        if (labelAt(i) === labelAt(i + 6) && songsList[i].imageSrc.id !== songsList[i + 6].imageSrc.id) {
          mirrored = mirrored + 1;
        }
      }
      hilog.info(DOMAIN, TAG, 'mirrored-pairs actual=%{public}s expected=6', String(mirrored));
      expect(mirrored).assertEqual(6);
      expect(labelAt(2)).assertEqual(labelAt(8));
      expect(songsList[2].imageSrc.id === songsList[8].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0037 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_3800
     * @tc.name: testDataReal0038
     * @tc.desc: Verify the table is ordered by prefix rotation instead of by label value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataReal0038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0038 begin');
      let rotation: number = 0;
      for (let i = 0; i < 6; i++) {
        if (labelAt(i).indexOf(prefixAt(i)) === 0) {
          rotation = rotation + 1;
        }
      }
      hilog.info(DOMAIN, TAG, 'rotation-matches actual=%{public}s expected=6', String(rotation));
      expect(rotation).assertEqual(6);
      expect(labelAt(0).indexOf(prefixAt(1))).assertEqual(-1);
      expect(labelAt(1).indexOf(prefixAt(0))).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0038 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_3900
     * @tc.name: testDataReal0039
     * @tc.desc: Verify every entry exposes a cover resource object and never undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0039 begin');
      let present: number = 0;
      for (let i = 0; i < songsList.length; i++) {
        if (songsList[i].imageSrc.id > 0) {
          present = present + 1;
        }
      }
      hilog.info(DOMAIN, TAG, 'positive-cover-ids actual=%{public}s expected=12', String(present));
      expect(present).assertEqual(12);
      expect(songsList[0].imageSrc.id > 0).assertTrue();
      expect(songsList[11].imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0039 end');
    })

    /**
     * @tc.number: SUB_MM_DATAR_4000
     * @tc.name: testDataReal0040
     * @tc.desc: Verify the frozen table supports a full end to end read of all twelve entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataReal0040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0040 begin');
      let joined: string = '';
      for (let i = 0; i < songsList.length; i++) {
        joined = joined + labelAt(i);
      }
      hilog.info(DOMAIN, TAG, 'joined-length actual=%{public}s expected=%{public}s',
        String(joined.length), String(expectedLengthSum()));
      expect(joined.length).assertEqual(expectedLengthSum());
      expect(joined.indexOf(prefixAt(0))).assertEqual(0);
      // The colon free label closes both mirror halves, so it shows up at index 5 and again
      // as the very last label of the concatenation.
      expect(joined.indexOf(colonFreeLabel())).assertEqual(colonLabelLength() * 5);
      expect(joined.lastIndexOf(colonFreeLabel())).assertEqual(colonFreeOffset());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataReal0040 end');
    })
  })
}
