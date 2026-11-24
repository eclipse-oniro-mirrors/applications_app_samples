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

// @volume rule=songsList[i].description-equals-frozen-table-row-i basis=spec cases=75
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

/** Offset of the description that follows the separator of a colon label. */
function trackOffset(): number {
  return prefixLength() + 1;
}

/** Text that follows the separator of the first song label. */
function trackDescription(): string {
  const text: string = labelByName(SONG_LABEL_NAMES[0]);
  const cut: number = text.indexOf(SEPARATOR);
  return cut >= 0 ? text.substring(cut + 1) : text;
}

/** Length of a label that carries the prefix: artist - track template. */
function colonLabelLength(): number {
  return labelByName(SONG_LABEL_NAMES[0]).length;
}

/** Text of the colon free label shared by the last two entries. */
function colonFreeLabel(): string {
  return labelByName(SONG_LABEL_NAMES[SONG_LABEL_NAMES.length - 1]);
}

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function songsDataMatrix02Test() {
  describe('SongsDataMatrix02', () => {

    /**
     * @tc.number: SUB_MM_DATADESC01_0100
     * @tc.name: testDataDesc010001
     * @tc.desc: Verify frozen description of songs entry 0 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010001 begin');
      const v0: Resource | string = resolveLabel(songsList[0].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[0].description) as string) === labelByName('song_label_01')));
      expect((resolveLabel(songsList[0].description) as string) === labelByName('song_label_01')).assertTrue();
      const v1: number = (resolveLabel(songsList[0].description) as string).length;
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010001 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_0200
     * @tc.name: testDataDesc010002
     * @tc.desc: Verify frozen description of songs entry 1 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010002 begin');
      const v0: Resource | string = resolveLabel(songsList[1].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_02')));
      expect(v0).assertEqual(labelByName('song_label_02'));
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[1].description) as string) === labelByName('song_label_02')));
      expect((resolveLabel(songsList[1].description) as string) === labelByName('song_label_02')).assertTrue();
      const v1: number = (resolveLabel(songsList[1].description) as string).length;
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010002 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_0300
     * @tc.name: testDataDesc010003
     * @tc.desc: Verify frozen description of songs entry 2 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010003 begin');
      const v0: Resource | string = resolveLabel(songsList[2].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_03')));
      expect(v0).assertEqual(labelByName('song_label_03'));
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[2].description) as string) === labelByName('song_label_03')));
      expect((resolveLabel(songsList[2].description) as string) === labelByName('song_label_03')).assertTrue();
      const v1: number = (resolveLabel(songsList[2].description) as string).length;
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010003 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_0400
     * @tc.name: testDataDesc010004
     * @tc.desc: Verify frozen description of songs entry 3 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010004 begin');
      const v0: Resource | string = resolveLabel(songsList[3].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_04')));
      expect(v0).assertEqual(labelByName('song_label_04'));
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[3].description) as string) === labelByName('song_label_04')));
      expect((resolveLabel(songsList[3].description) as string) === labelByName('song_label_04')).assertTrue();
      const v1: number = (resolveLabel(songsList[3].description) as string).length;
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010004 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_0500
     * @tc.name: testDataDesc010005
     * @tc.desc: Verify frozen description of songs entry 4 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010005 begin');
      const v0: Resource | string = resolveLabel(songsList[4].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_05')));
      expect(v0).assertEqual(labelByName('song_label_05'));
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[4].description) as string) === labelByName('song_label_05')));
      expect((resolveLabel(songsList[4].description) as string) === labelByName('song_label_05')).assertTrue();
      const v1: number = (resolveLabel(songsList[4].description) as string).length;
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010005 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_0600
     * @tc.name: testDataDesc010006
     * @tc.desc: Verify frozen description of songs entry 5 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010006 begin');
      const v0: Resource | string = resolveLabel(songsList[5].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[5].description) as string) === labelByName('song_label_06')));
      expect((resolveLabel(songsList[5].description) as string) === labelByName('song_label_06')).assertTrue();
      const v1: number = (resolveLabel(songsList[5].description) as string).length;
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=%{public}s', String(v1), String(13));
      expect(v1).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010006 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_0700
     * @tc.name: testDataDesc010007
     * @tc.desc: Verify frozen description of songs entry 6 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010007 begin');
      const v0: Resource | string = resolveLabel(songsList[6].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[6].description) as string) === labelByName('song_label_01')));
      expect((resolveLabel(songsList[6].description) as string) === labelByName('song_label_01')).assertTrue();
      const v1: number = (resolveLabel(songsList[6].description) as string).length;
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010007 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_0800
     * @tc.name: testDataDesc010008
     * @tc.desc: Verify frozen description of songs entry 7 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010008 begin');
      const v0: Resource | string = resolveLabel(songsList[7].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_02')));
      expect(v0).assertEqual(labelByName('song_label_02'));
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[7].description) as string) === labelByName('song_label_02')));
      expect((resolveLabel(songsList[7].description) as string) === labelByName('song_label_02')).assertTrue();
      const v1: number = (resolveLabel(songsList[7].description) as string).length;
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010008 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_0900
     * @tc.name: testDataDesc010009
     * @tc.desc: Verify frozen description of songs entry 8 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010009 begin');
      const v0: Resource | string = resolveLabel(songsList[8].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_03')));
      expect(v0).assertEqual(labelByName('song_label_03'));
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[8].description) as string) === labelByName('song_label_03')));
      expect((resolveLabel(songsList[8].description) as string) === labelByName('song_label_03')).assertTrue();
      const v1: number = (resolveLabel(songsList[8].description) as string).length;
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010009 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_1000
     * @tc.name: testDataDesc010010
     * @tc.desc: Verify frozen description of songs entry 9 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010010 begin');
      const v0: Resource | string = resolveLabel(songsList[9].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_04')));
      expect(v0).assertEqual(labelByName('song_label_04'));
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[9].description) as string) === labelByName('song_label_04')));
      expect((resolveLabel(songsList[9].description) as string) === labelByName('song_label_04')).assertTrue();
      const v1: number = (resolveLabel(songsList[9].description) as string).length;
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010010 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_1100
     * @tc.name: testDataDesc010011
     * @tc.desc: Verify frozen description of songs entry 10 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010011 begin');
      const v0: Resource | string = resolveLabel(songsList[10].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_05')));
      expect(v0).assertEqual(labelByName('song_label_05'));
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[10].description) as string) === labelByName('song_label_05')));
      expect((resolveLabel(songsList[10].description) as string) === labelByName('song_label_05')).assertTrue();
      const v1: number = (resolveLabel(songsList[10].description) as string).length;
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010011 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_1200
     * @tc.name: testDataDesc010012
     * @tc.desc: Verify frozen description of songs entry 11 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010012 begin');
      const v0: Resource | string = resolveLabel(songsList[11].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[11].description) as string) === labelByName('song_label_06')));
      expect((resolveLabel(songsList[11].description) as string) === labelByName('song_label_06')).assertTrue();
      const v1: number = (resolveLabel(songsList[11].description) as string).length;
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=%{public}s', String(v1), String(13));
      expect(v1).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010012 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_1300
     * @tc.name: testDataDesc010013
     * @tc.desc: Verify frozen description of songs entry 0 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010013 begin');
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[0].description) as string) === labelByName('song_label_01')));
      expect((resolveLabel(songsList[0].description) as string) === labelByName('song_label_01')).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[0].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010013 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_1400
     * @tc.name: testDataDesc010014
     * @tc.desc: Verify frozen description of songs entry 1 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010014 begin');
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[1].description) as string) === labelByName('song_label_02')));
      expect((resolveLabel(songsList[1].description) as string) === labelByName('song_label_02')).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[1].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_02')));
      expect(v0).assertEqual(labelByName('song_label_02'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010014 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_1500
     * @tc.name: testDataDesc010015
     * @tc.desc: Verify frozen description of songs entry 2 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010015 begin');
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[2].description) as string) === labelByName('song_label_03')));
      expect((resolveLabel(songsList[2].description) as string) === labelByName('song_label_03')).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[2].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_03')));
      expect(v0).assertEqual(labelByName('song_label_03'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010015 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_1600
     * @tc.name: testDataDesc010016
     * @tc.desc: Verify frozen description of songs entry 3 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010016 begin');
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[3].description) as string) === labelByName('song_label_04')));
      expect((resolveLabel(songsList[3].description) as string) === labelByName('song_label_04')).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[3].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_04')));
      expect(v0).assertEqual(labelByName('song_label_04'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010016 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_1700
     * @tc.name: testDataDesc010017
     * @tc.desc: Verify frozen description of songs entry 4 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010017 begin');
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[4].description) as string) === labelByName('song_label_05')));
      expect((resolveLabel(songsList[4].description) as string) === labelByName('song_label_05')).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[4].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_05')));
      expect(v0).assertEqual(labelByName('song_label_05'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010017 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_1800
     * @tc.name: testDataDesc010018
     * @tc.desc: Verify frozen description of songs entry 5 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010018 begin');
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[5].description) as string) === labelByName('song_label_06')));
      expect((resolveLabel(songsList[5].description) as string) === labelByName('song_label_06')).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[5].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010018 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_1900
     * @tc.name: testDataDesc010019
     * @tc.desc: Verify frozen description of songs entry 6 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010019 begin');
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[6].description) as string) === labelByName('song_label_01')));
      expect((resolveLabel(songsList[6].description) as string) === labelByName('song_label_01')).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[6].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010019 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_2000
     * @tc.name: testDataDesc010020
     * @tc.desc: Verify frozen description of songs entry 7 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010020 begin');
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[7].description) as string) === labelByName('song_label_02')));
      expect((resolveLabel(songsList[7].description) as string) === labelByName('song_label_02')).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[7].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_02')));
      expect(v0).assertEqual(labelByName('song_label_02'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010020 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_2100
     * @tc.name: testDataDesc010021
     * @tc.desc: Verify frozen description of songs entry 8 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010021 begin');
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[8].description) as string) === labelByName('song_label_03')));
      expect((resolveLabel(songsList[8].description) as string) === labelByName('song_label_03')).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[8].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_03')));
      expect(v0).assertEqual(labelByName('song_label_03'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010021 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_2200
     * @tc.name: testDataDesc010022
     * @tc.desc: Verify frozen description of songs entry 9 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010022 begin');
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[9].description) as string) === labelByName('song_label_04')));
      expect((resolveLabel(songsList[9].description) as string) === labelByName('song_label_04')).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[9].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_04')));
      expect(v0).assertEqual(labelByName('song_label_04'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010022 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_2300
     * @tc.name: testDataDesc010023
     * @tc.desc: Verify frozen description of songs entry 10 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010023 begin');
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[10].description) as string) === labelByName('song_label_05')));
      expect((resolveLabel(songsList[10].description) as string) === labelByName('song_label_05')).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[10].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_05')));
      expect(v0).assertEqual(labelByName('song_label_05'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010023 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_2400
     * @tc.name: testDataDesc010024
     * @tc.desc: Verify frozen description of songs entry 11 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010024 begin');
      hilog.info(DOMAIN, TAG, 'description-equals-frozen actual=%{public}s expected=true', String((resolveLabel(songsList[11].description) as string) === labelByName('song_label_06')));
      expect((resolveLabel(songsList[11].description) as string) === labelByName('song_label_06')).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[11].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010024 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_2500
     * @tc.name: testDataDesc010025
     * @tc.desc: Verify frozen description of songs entry 0 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010025 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[0].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[0].description) as string).length === colonLabelLength()).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[0].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010025 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_2600
     * @tc.name: testDataDesc010026
     * @tc.desc: Verify frozen description of songs entry 1 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010026 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[1].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[1].description) as string).length === colonLabelLength()).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[1].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_02')));
      expect(v0).assertEqual(labelByName('song_label_02'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010026 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_2700
     * @tc.name: testDataDesc010027
     * @tc.desc: Verify frozen description of songs entry 2 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010027 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[2].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[2].description) as string).length === colonLabelLength()).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[2].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_03')));
      expect(v0).assertEqual(labelByName('song_label_03'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010027 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_2800
     * @tc.name: testDataDesc010028
     * @tc.desc: Verify frozen description of songs entry 3 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010028 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[3].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[3].description) as string).length === colonLabelLength()).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[3].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_04')));
      expect(v0).assertEqual(labelByName('song_label_04'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010028 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_2900
     * @tc.name: testDataDesc010029
     * @tc.desc: Verify frozen description of songs entry 4 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010029 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[4].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[4].description) as string).length === colonLabelLength()).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[4].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_05')));
      expect(v0).assertEqual(labelByName('song_label_05'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010029 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_3000
     * @tc.name: testDataDesc010030
     * @tc.desc: Verify frozen description of songs entry 5 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010030 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[5].description) as string).length === colonFreeLabel().length));
      expect((resolveLabel(songsList[5].description) as string).length === colonFreeLabel().length).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[5].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010030 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_3100
     * @tc.name: testDataDesc010031
     * @tc.desc: Verify frozen description of songs entry 6 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010031 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[6].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[6].description) as string).length === colonLabelLength()).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[6].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010031 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_3200
     * @tc.name: testDataDesc010032
     * @tc.desc: Verify frozen description of songs entry 7 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010032 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[7].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[7].description) as string).length === colonLabelLength()).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[7].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_02')));
      expect(v0).assertEqual(labelByName('song_label_02'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010032 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_3300
     * @tc.name: testDataDesc010033
     * @tc.desc: Verify frozen description of songs entry 8 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010033 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[8].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[8].description) as string).length === colonLabelLength()).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[8].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_03')));
      expect(v0).assertEqual(labelByName('song_label_03'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010033 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_3400
     * @tc.name: testDataDesc010034
     * @tc.desc: Verify frozen description of songs entry 9 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010034 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[9].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[9].description) as string).length === colonLabelLength()).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[9].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_04')));
      expect(v0).assertEqual(labelByName('song_label_04'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010034 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_3500
     * @tc.name: testDataDesc010035
     * @tc.desc: Verify frozen description of songs entry 10 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010035 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[10].description) as string).length === colonLabelLength()));
      expect((resolveLabel(songsList[10].description) as string).length === colonLabelLength()).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[10].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_05')));
      expect(v0).assertEqual(labelByName('song_label_05'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010035 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_3600
     * @tc.name: testDataDesc010036
     * @tc.desc: Verify frozen description of songs entry 11 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010036 begin');
      hilog.info(DOMAIN, TAG, 'description-length actual=%{public}s expected=true', String((resolveLabel(songsList[11].description) as string).length === colonFreeLabel().length));
      expect((resolveLabel(songsList[11].description) as string).length === colonFreeLabel().length).assertTrue();
      const v0: Resource | string = resolveLabel(songsList[11].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010036 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_3700
     * @tc.name: testDataDesc010037
     * @tc.desc: Verify frozen description of songs entry 0 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010037 begin');
      hilog.info(DOMAIN, TAG, 'description-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[0].description) as string).indexOf(labelPrefixByName('song_label_01')) === 0));
      expect((resolveLabel(songsList[0].description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).assertTrue();
      const v0: string = (resolveLabel(songsList[0].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_01')));
      expect(v0).assertEqual(labelPrefixByName('song_label_01'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010037 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_3800
     * @tc.name: testDataDesc010038
     * @tc.desc: Verify frozen description of songs entry 1 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010038 begin');
      hilog.info(DOMAIN, TAG, 'description-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[1].description) as string).indexOf(labelPrefixByName('song_label_02')) === 0));
      expect((resolveLabel(songsList[1].description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).assertTrue();
      const v0: string = (resolveLabel(songsList[1].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_02')));
      expect(v0).assertEqual(labelPrefixByName('song_label_02'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010038 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_3900
     * @tc.name: testDataDesc010039
     * @tc.desc: Verify frozen description of songs entry 2 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010039 begin');
      hilog.info(DOMAIN, TAG, 'description-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[2].description) as string).indexOf(labelPrefixByName('song_label_03')) === 0));
      expect((resolveLabel(songsList[2].description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).assertTrue();
      const v0: string = (resolveLabel(songsList[2].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_03')));
      expect(v0).assertEqual(labelPrefixByName('song_label_03'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010039 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_4000
     * @tc.name: testDataDesc010040
     * @tc.desc: Verify frozen description of songs entry 3 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010040 begin');
      hilog.info(DOMAIN, TAG, 'description-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[3].description) as string).indexOf(labelPrefixByName('song_label_04')) === 0));
      expect((resolveLabel(songsList[3].description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).assertTrue();
      const v0: string = (resolveLabel(songsList[3].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_04')));
      expect(v0).assertEqual(labelPrefixByName('song_label_04'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010040 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_4100
     * @tc.name: testDataDesc010041
     * @tc.desc: Verify frozen description of songs entry 4 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010041 begin');
      hilog.info(DOMAIN, TAG, 'description-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[4].description) as string).indexOf(labelPrefixByName('song_label_05')) === 0));
      expect((resolveLabel(songsList[4].description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).assertTrue();
      const v0: string = (resolveLabel(songsList[4].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_05')));
      expect(v0).assertEqual(labelPrefixByName('song_label_05'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010041 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_4200
     * @tc.name: testDataDesc010042
     * @tc.desc: Verify frozen description of songs entry 5 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010042 begin');
      hilog.info(DOMAIN, TAG, 'description-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[5].description) as string).indexOf(labelByName('song_label_06')) === 0));
      expect((resolveLabel(songsList[5].description) as string).indexOf(labelByName('song_label_06')) === 0).assertTrue();
      const v0: string = (resolveLabel(songsList[5].description) as string).slice(0, 13);
      hilog.info(DOMAIN, TAG, 'prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010042 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_4300
     * @tc.name: testDataDesc010043
     * @tc.desc: Verify frozen description of songs entry 6 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010043 begin');
      hilog.info(DOMAIN, TAG, 'description-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[6].description) as string).indexOf(labelPrefixByName('song_label_01')) === 0));
      expect((resolveLabel(songsList[6].description) as string).indexOf(labelPrefixByName('song_label_01')) === 0).assertTrue();
      const v0: string = (resolveLabel(songsList[6].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_01')));
      expect(v0).assertEqual(labelPrefixByName('song_label_01'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010043 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_4400
     * @tc.name: testDataDesc010044
     * @tc.desc: Verify frozen description of songs entry 7 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010044 begin');
      hilog.info(DOMAIN, TAG, 'description-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[7].description) as string).indexOf(labelPrefixByName('song_label_02')) === 0));
      expect((resolveLabel(songsList[7].description) as string).indexOf(labelPrefixByName('song_label_02')) === 0).assertTrue();
      const v0: string = (resolveLabel(songsList[7].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_02')));
      expect(v0).assertEqual(labelPrefixByName('song_label_02'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010044 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_4500
     * @tc.name: testDataDesc010045
     * @tc.desc: Verify frozen description of songs entry 8 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010045 begin');
      hilog.info(DOMAIN, TAG, 'description-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[8].description) as string).indexOf(labelPrefixByName('song_label_03')) === 0));
      expect((resolveLabel(songsList[8].description) as string).indexOf(labelPrefixByName('song_label_03')) === 0).assertTrue();
      const v0: string = (resolveLabel(songsList[8].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_03')));
      expect(v0).assertEqual(labelPrefixByName('song_label_03'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010045 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_4600
     * @tc.name: testDataDesc010046
     * @tc.desc: Verify frozen description of songs entry 9 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010046 begin');
      hilog.info(DOMAIN, TAG, 'description-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[9].description) as string).indexOf(labelPrefixByName('song_label_04')) === 0));
      expect((resolveLabel(songsList[9].description) as string).indexOf(labelPrefixByName('song_label_04')) === 0).assertTrue();
      const v0: string = (resolveLabel(songsList[9].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_04')));
      expect(v0).assertEqual(labelPrefixByName('song_label_04'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010046 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_4700
     * @tc.name: testDataDesc010047
     * @tc.desc: Verify frozen description of songs entry 10 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010047 begin');
      hilog.info(DOMAIN, TAG, 'description-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[10].description) as string).indexOf(labelPrefixByName('song_label_05')) === 0));
      expect((resolveLabel(songsList[10].description) as string).indexOf(labelPrefixByName('song_label_05')) === 0).assertTrue();
      const v0: string = (resolveLabel(songsList[10].description) as string).slice(0, prefixLength());
      hilog.info(DOMAIN, TAG, 'prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_05')));
      expect(v0).assertEqual(labelPrefixByName('song_label_05'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010047 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_4800
     * @tc.name: testDataDesc010048
     * @tc.desc: Verify frozen description of songs entry 11 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010048 begin');
      hilog.info(DOMAIN, TAG, 'description-prefix actual=%{public}s expected=true', String((resolveLabel(songsList[11].description) as string).indexOf(labelByName('song_label_06')) === 0));
      expect((resolveLabel(songsList[11].description) as string).indexOf(labelByName('song_label_06')) === 0).assertTrue();
      const v0: string = (resolveLabel(songsList[11].description) as string).slice(0, 13);
      hilog.info(DOMAIN, TAG, 'prefix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010048 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_4900
     * @tc.name: testDataDesc010049
     * @tc.desc: Verify frozen description of songs entry 0 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010049 begin');
      hilog.info(DOMAIN, TAG, 'description-trimmed actual=%{public}s expected=true', String((resolveLabel(songsList[0].description) as string).trim() === resolveLabel(songsList[0].description)));
      expect((resolveLabel(songsList[0].description) as string).trim() === resolveLabel(songsList[0].description)).assertTrue();
      const v0: string = (resolveLabel(songsList[0].description) as string).slice(trackOffset());
      hilog.info(DOMAIN, TAG, 'suffix-slice actual=%{public}s expected=%{public}s', String(v0), String(trackDescription()));
      expect(v0).assertEqual(trackDescription());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010049 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_5000
     * @tc.name: testDataDesc010050
     * @tc.desc: Verify frozen description of songs entry 1 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010050 begin');
      hilog.info(DOMAIN, TAG, 'description-trimmed actual=%{public}s expected=true', String((resolveLabel(songsList[1].description) as string).trim() === resolveLabel(songsList[1].description)));
      expect((resolveLabel(songsList[1].description) as string).trim() === resolveLabel(songsList[1].description)).assertTrue();
      const v0: string = (resolveLabel(songsList[1].description) as string).slice(trackOffset());
      hilog.info(DOMAIN, TAG, 'suffix-slice actual=%{public}s expected=%{public}s', String(v0), String(trackDescription()));
      expect(v0).assertEqual(trackDescription());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010050 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_5100
     * @tc.name: testDataDesc010051
     * @tc.desc: Verify frozen description of songs entry 2 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010051 begin');
      hilog.info(DOMAIN, TAG, 'description-trimmed actual=%{public}s expected=true', String((resolveLabel(songsList[2].description) as string).trim() === resolveLabel(songsList[2].description)));
      expect((resolveLabel(songsList[2].description) as string).trim() === resolveLabel(songsList[2].description)).assertTrue();
      const v0: string = (resolveLabel(songsList[2].description) as string).slice(trackOffset());
      hilog.info(DOMAIN, TAG, 'suffix-slice actual=%{public}s expected=%{public}s', String(v0), String(trackDescription()));
      expect(v0).assertEqual(trackDescription());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010051 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_5200
     * @tc.name: testDataDesc010052
     * @tc.desc: Verify frozen description of songs entry 3 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010052 begin');
      hilog.info(DOMAIN, TAG, 'description-trimmed actual=%{public}s expected=true', String((resolveLabel(songsList[3].description) as string).trim() === resolveLabel(songsList[3].description)));
      expect((resolveLabel(songsList[3].description) as string).trim() === resolveLabel(songsList[3].description)).assertTrue();
      const v0: string = (resolveLabel(songsList[3].description) as string).slice(trackOffset());
      hilog.info(DOMAIN, TAG, 'suffix-slice actual=%{public}s expected=%{public}s', String(v0), String(trackDescription()));
      expect(v0).assertEqual(trackDescription());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010052 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_5300
     * @tc.name: testDataDesc010053
     * @tc.desc: Verify frozen description of songs entry 4 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010053 begin');
      hilog.info(DOMAIN, TAG, 'description-trimmed actual=%{public}s expected=true', String((resolveLabel(songsList[4].description) as string).trim() === resolveLabel(songsList[4].description)));
      expect((resolveLabel(songsList[4].description) as string).trim() === resolveLabel(songsList[4].description)).assertTrue();
      const v0: string = (resolveLabel(songsList[4].description) as string).slice(trackOffset());
      hilog.info(DOMAIN, TAG, 'suffix-slice actual=%{public}s expected=%{public}s', String(v0), String(trackDescription()));
      expect(v0).assertEqual(trackDescription());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010053 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_5400
     * @tc.name: testDataDesc010054
     * @tc.desc: Verify frozen description of songs entry 5 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010054 begin');
      hilog.info(DOMAIN, TAG, 'description-trimmed actual=%{public}s expected=true', String((resolveLabel(songsList[5].description) as string).trim() === resolveLabel(songsList[5].description)));
      expect((resolveLabel(songsList[5].description) as string).trim() === resolveLabel(songsList[5].description)).assertTrue();
      const v0: string = (resolveLabel(songsList[5].description) as string).slice(0);
      hilog.info(DOMAIN, TAG, 'suffix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010054 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_5500
     * @tc.name: testDataDesc010055
     * @tc.desc: Verify frozen description of songs entry 6 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010055 begin');
      hilog.info(DOMAIN, TAG, 'description-trimmed actual=%{public}s expected=true', String((resolveLabel(songsList[6].description) as string).trim() === resolveLabel(songsList[6].description)));
      expect((resolveLabel(songsList[6].description) as string).trim() === resolveLabel(songsList[6].description)).assertTrue();
      const v0: string = (resolveLabel(songsList[6].description) as string).slice(trackOffset());
      hilog.info(DOMAIN, TAG, 'suffix-slice actual=%{public}s expected=%{public}s', String(v0), String(trackDescription()));
      expect(v0).assertEqual(trackDescription());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010055 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_5600
     * @tc.name: testDataDesc010056
     * @tc.desc: Verify frozen description of songs entry 7 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010056 begin');
      hilog.info(DOMAIN, TAG, 'description-trimmed actual=%{public}s expected=true', String((resolveLabel(songsList[7].description) as string).trim() === resolveLabel(songsList[7].description)));
      expect((resolveLabel(songsList[7].description) as string).trim() === resolveLabel(songsList[7].description)).assertTrue();
      const v0: string = (resolveLabel(songsList[7].description) as string).slice(trackOffset());
      hilog.info(DOMAIN, TAG, 'suffix-slice actual=%{public}s expected=%{public}s', String(v0), String(trackDescription()));
      expect(v0).assertEqual(trackDescription());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010056 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_5700
     * @tc.name: testDataDesc010057
     * @tc.desc: Verify frozen description of songs entry 8 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010057 begin');
      hilog.info(DOMAIN, TAG, 'description-trimmed actual=%{public}s expected=true', String((resolveLabel(songsList[8].description) as string).trim() === resolveLabel(songsList[8].description)));
      expect((resolveLabel(songsList[8].description) as string).trim() === resolveLabel(songsList[8].description)).assertTrue();
      const v0: string = (resolveLabel(songsList[8].description) as string).slice(trackOffset());
      hilog.info(DOMAIN, TAG, 'suffix-slice actual=%{public}s expected=%{public}s', String(v0), String(trackDescription()));
      expect(v0).assertEqual(trackDescription());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010057 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_5800
     * @tc.name: testDataDesc010058
     * @tc.desc: Verify frozen description of songs entry 9 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010058 begin');
      hilog.info(DOMAIN, TAG, 'description-trimmed actual=%{public}s expected=true', String((resolveLabel(songsList[9].description) as string).trim() === resolveLabel(songsList[9].description)));
      expect((resolveLabel(songsList[9].description) as string).trim() === resolveLabel(songsList[9].description)).assertTrue();
      const v0: string = (resolveLabel(songsList[9].description) as string).slice(trackOffset());
      hilog.info(DOMAIN, TAG, 'suffix-slice actual=%{public}s expected=%{public}s', String(v0), String(trackDescription()));
      expect(v0).assertEqual(trackDescription());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010058 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_5900
     * @tc.name: testDataDesc010059
     * @tc.desc: Verify frozen description of songs entry 10 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010059 begin');
      hilog.info(DOMAIN, TAG, 'description-trimmed actual=%{public}s expected=true', String((resolveLabel(songsList[10].description) as string).trim() === resolveLabel(songsList[10].description)));
      expect((resolveLabel(songsList[10].description) as string).trim() === resolveLabel(songsList[10].description)).assertTrue();
      const v0: string = (resolveLabel(songsList[10].description) as string).slice(trackOffset());
      hilog.info(DOMAIN, TAG, 'suffix-slice actual=%{public}s expected=%{public}s', String(v0), String(trackDescription()));
      expect(v0).assertEqual(trackDescription());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010059 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_6000
     * @tc.name: testDataDesc010060
     * @tc.desc: Verify frozen description of songs entry 11 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010060 begin');
      hilog.info(DOMAIN, TAG, 'description-trimmed actual=%{public}s expected=true', String((resolveLabel(songsList[11].description) as string).trim() === resolveLabel(songsList[11].description)));
      expect((resolveLabel(songsList[11].description) as string).trim() === resolveLabel(songsList[11].description)).assertTrue();
      const v0: string = (resolveLabel(songsList[11].description) as string).slice(0);
      hilog.info(DOMAIN, TAG, 'suffix-slice actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010060 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_6100
     * @tc.name: testDataDesc010061
     * @tc.desc: Verify frozen description of songs entry 0 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010061 begin');
      const v0: string = (resolveLabel(songsList[0].description) as string).slice(0, 2);
      hilog.info(DOMAIN, TAG, 'first-two-chars actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_01').slice(0, 2)));
      expect(v0).assertEqual(labelPrefixByName('song_label_01').slice(0, 2));
      const v1: Resource | string = resolveLabel(songsList[0].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v1), String(labelByName('song_label_01')));
      expect(v1).assertEqual(labelByName('song_label_01'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010061 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_6200
     * @tc.name: testDataDesc010062
     * @tc.desc: Verify frozen description of songs entry 1 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010062 begin');
      const v0: string = (resolveLabel(songsList[1].description) as string).slice(0, 2);
      hilog.info(DOMAIN, TAG, 'first-two-chars actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_02').slice(0, 2)));
      expect(v0).assertEqual(labelPrefixByName('song_label_02').slice(0, 2));
      const v1: Resource | string = resolveLabel(songsList[1].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v1), String(labelByName('song_label_02')));
      expect(v1).assertEqual(labelByName('song_label_02'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010062 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_6300
     * @tc.name: testDataDesc010063
     * @tc.desc: Verify frozen description of songs entry 2 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010063 begin');
      const v0: string = (resolveLabel(songsList[2].description) as string).slice(0, 2);
      hilog.info(DOMAIN, TAG, 'first-two-chars actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_03').slice(0, 2)));
      expect(v0).assertEqual(labelPrefixByName('song_label_03').slice(0, 2));
      const v1: Resource | string = resolveLabel(songsList[2].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v1), String(labelByName('song_label_03')));
      expect(v1).assertEqual(labelByName('song_label_03'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010063 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_6400
     * @tc.name: testDataDesc010064
     * @tc.desc: Verify frozen description of songs entry 3 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010064 begin');
      const v0: string = (resolveLabel(songsList[3].description) as string).slice(0, 2);
      hilog.info(DOMAIN, TAG, 'first-two-chars actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_04').slice(0, 2)));
      expect(v0).assertEqual(labelPrefixByName('song_label_04').slice(0, 2));
      const v1: Resource | string = resolveLabel(songsList[3].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v1), String(labelByName('song_label_04')));
      expect(v1).assertEqual(labelByName('song_label_04'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010064 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_6500
     * @tc.name: testDataDesc010065
     * @tc.desc: Verify frozen description of songs entry 4 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010065 begin');
      const v0: string = (resolveLabel(songsList[4].description) as string).slice(0, 2);
      hilog.info(DOMAIN, TAG, 'first-two-chars actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_05').slice(0, 2)));
      expect(v0).assertEqual(labelPrefixByName('song_label_05').slice(0, 2));
      const v1: Resource | string = resolveLabel(songsList[4].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v1), String(labelByName('song_label_05')));
      expect(v1).assertEqual(labelByName('song_label_05'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010065 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_6600
     * @tc.name: testDataDesc010066
     * @tc.desc: Verify frozen description of songs entry 5 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010066 begin');
      const v0: string = (resolveLabel(songsList[5].description) as string).slice(0, 2);
      hilog.info(DOMAIN, TAG, 'first-two-chars actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_06').slice(0, 2)));
      expect(v0).assertEqual(labelPrefixByName('song_label_06').slice(0, 2));
      const v1: Resource | string = resolveLabel(songsList[5].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v1), String(labelByName('song_label_06')));
      expect(v1).assertEqual(labelByName('song_label_06'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010066 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_6700
     * @tc.name: testDataDesc010067
     * @tc.desc: Verify frozen description of songs entry 6 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010067 begin');
      const v0: string = (resolveLabel(songsList[6].description) as string).slice(0, 2);
      hilog.info(DOMAIN, TAG, 'first-two-chars actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_01').slice(0, 2)));
      expect(v0).assertEqual(labelPrefixByName('song_label_01').slice(0, 2));
      const v1: Resource | string = resolveLabel(songsList[6].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v1), String(labelByName('song_label_01')));
      expect(v1).assertEqual(labelByName('song_label_01'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010067 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_6800
     * @tc.name: testDataDesc010068
     * @tc.desc: Verify frozen description of songs entry 7 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010068 begin');
      const v0: string = (resolveLabel(songsList[7].description) as string).slice(0, 2);
      hilog.info(DOMAIN, TAG, 'first-two-chars actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_02').slice(0, 2)));
      expect(v0).assertEqual(labelPrefixByName('song_label_02').slice(0, 2));
      const v1: Resource | string = resolveLabel(songsList[7].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v1), String(labelByName('song_label_02')));
      expect(v1).assertEqual(labelByName('song_label_02'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010068 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_6900
     * @tc.name: testDataDesc010069
     * @tc.desc: Verify frozen description of songs entry 8 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010069 begin');
      const v0: string = (resolveLabel(songsList[8].description) as string).slice(0, 2);
      hilog.info(DOMAIN, TAG, 'first-two-chars actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_03').slice(0, 2)));
      expect(v0).assertEqual(labelPrefixByName('song_label_03').slice(0, 2));
      const v1: Resource | string = resolveLabel(songsList[8].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v1), String(labelByName('song_label_03')));
      expect(v1).assertEqual(labelByName('song_label_03'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010069 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_7000
     * @tc.name: testDataDesc010070
     * @tc.desc: Verify frozen description of songs entry 9 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010070 begin');
      const v0: string = (resolveLabel(songsList[9].description) as string).slice(0, 2);
      hilog.info(DOMAIN, TAG, 'first-two-chars actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_04').slice(0, 2)));
      expect(v0).assertEqual(labelPrefixByName('song_label_04').slice(0, 2));
      const v1: Resource | string = resolveLabel(songsList[9].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v1), String(labelByName('song_label_04')));
      expect(v1).assertEqual(labelByName('song_label_04'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010070 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_7100
     * @tc.name: testDataDesc010071
     * @tc.desc: Verify frozen description of songs entry 10 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010071 begin');
      const v0: string = (resolveLabel(songsList[10].description) as string).slice(0, 2);
      hilog.info(DOMAIN, TAG, 'first-two-chars actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_05').slice(0, 2)));
      expect(v0).assertEqual(labelPrefixByName('song_label_05').slice(0, 2));
      const v1: Resource | string = resolveLabel(songsList[10].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v1), String(labelByName('song_label_05')));
      expect(v1).assertEqual(labelByName('song_label_05'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010071 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_7200
     * @tc.name: testDataDesc010072
     * @tc.desc: Verify frozen description of songs entry 11 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataDesc010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010072 begin');
      const v0: string = (resolveLabel(songsList[11].description) as string).slice(0, 2);
      hilog.info(DOMAIN, TAG, 'first-two-chars actual=%{public}s expected=%{public}s', String(v0), String(labelPrefixByName('song_label_06').slice(0, 2)));
      expect(v0).assertEqual(labelPrefixByName('song_label_06').slice(0, 2));
      const v1: Resource | string = resolveLabel(songsList[11].description);
      hilog.info(DOMAIN, TAG, 'description actual=%{public}s expected=%{public}s', String(v1), String(labelByName('song_label_06')));
      expect(v1).assertEqual(labelByName('song_label_06'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010072 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_7300
     * @tc.name: testDataDesc010073
     * @tc.desc: Anchor: songsList descriptions must contain exactly six distinct values
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataDesc010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010073 begin');
      const v0: number = new Set<string>(songsList.map((item: IconItem): string => resolveLabel(item.description) as string)).size;
      hilog.info(DOMAIN, TAG, 'distinct-description-count actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'total-count actual=%{public}s expected=%{public}s', String(v1), String(12));
      expect(v1).assertEqual(12);
      hilog.info(DOMAIN, TAG, 'row-0-equals-row-6 actual=%{public}s expected=true', String(resolveLabel(songsList[0].description) === resolveLabel(songsList[6].description)));
      expect(resolveLabel(songsList[0].description) === resolveLabel(songsList[6].description)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010073 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_7400
     * @tc.name: testDataDesc010074
     * @tc.desc: Anchor: songsList first and last description rows
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataDesc010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010074 begin');
      const v0: Resource | string = resolveLabel(songsList[0].description);
      hilog.info(DOMAIN, TAG, 'first-row actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      const v1: Resource | string = resolveLabel(songsList[11].description);
      hilog.info(DOMAIN, TAG, 'last-row actual=%{public}s expected=%{public}s', String(v1), String(labelByName('song_label_06')));
      expect(v1).assertEqual(labelByName('song_label_06'));
      hilog.info(DOMAIN, TAG, 'first-differs-from-last actual=%{public}s expected=false', String(resolveLabel(songsList[0].description) === resolveLabel(songsList[11].description)));
      expect(resolveLabel(songsList[0].description) === resolveLabel(songsList[11].description)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010074 end');
    })

    /**
     * @tc.number: SUB_MM_DATADESC01_7500
     * @tc.name: testDataDesc010075
     * @tc.desc: Anchor: description must be a string resource in songsList
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataDesc010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010075 begin');
      hilog.info(DOMAIN, TAG, 'row-0-description-is-resource actual=%{public}s expected=true', String(typeof songsList[0].description === 'object'));
      expect(typeof songsList[0].description === 'object').assertTrue();
      hilog.info(DOMAIN, TAG, 'row-11-description-is-resource actual=%{public}s expected=true', String(typeof songsList[11].description === 'object'));
      expect(typeof songsList[11].description === 'object').assertTrue();
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataDesc010075 end');
    })

  })
}
